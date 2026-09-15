"""Wire format for OpenPLC's Modbus RTU transport and its "debug" function
codes (0x41-0x4B), which read/force any IEC variable by (array, element)
index regardless of pin mapping. Byte layouts reverse-engineered from
openplc-editor/src/backend/shared/debug/modbus-pdu.ts (GPL-3.0, OpenPLC
project) and verified against a running emulator in sim-bridge/.
"""

from __future__ import annotations

FC_DEBUG_INFO = 0x41
FC_DEBUG_SET = 0x42
FC_DEBUG_GET = 0x43
FC_DEBUG_GET_LIST = 0x44
FC_DEBUG_GET_MD5 = 0x45
FC_DEBUG_GET_STATUS = 0x46
FC_DEBUG_GET_VERSION = 0x47
FC_DEBUG_GET_BOARD_ID = 0x48
FC_PLC_SET_STATE = 0x4B

STATUS_SUCCESS = 0x7E
STATUS_ERROR_OUT_OF_BOUNDS = 0x81
STATUS_ERROR_OUT_OF_MEMORY = 0x82

_STATUS_NAMES = {
    STATUS_ERROR_OUT_OF_BOUNDS: "ERROR_OUT_OF_BOUNDS",
    STATUS_ERROR_OUT_OF_MEMORY: "ERROR_OUT_OF_MEMORY",
}


def _status_name(status: int) -> str:
    return _STATUS_NAMES.get(status, f"unknown status 0x{status:02x}")


# ---------------------------------------------------------------------------
# RTU framing: [slave_id][pdu...][crc_lo][crc_hi]
# ---------------------------------------------------------------------------


def crc16(data: bytes) -> bytes:
    crc = 0xFFFF
    for b in data:
        crc ^= b
        for _ in range(8):
            if crc & 1:
                crc = (crc >> 1) ^ 0xA001
            else:
                crc >>= 1
    return bytes([crc & 0xFF, (crc >> 8) & 0xFF])


def frame_rtu(slave_id: int, pdu: bytes) -> bytes:
    body = bytes([slave_id]) + pdu
    return body + crc16(body)


def unframe_rtu(raw: bytes) -> tuple[int, bytes]:
    if len(raw) < 4:
        raise ValueError(f"frame too short ({len(raw)} bytes)")
    body, crc_recv = raw[:-2], raw[-2:]
    if crc16(body) != crc_recv:
        raise ValueError("CRC mismatch")
    return body[0], body[1:]


# ---------------------------------------------------------------------------
# FC 0x44 - DEBUG_GET_LIST: read N variables by (arr, elem) in one round trip
# ---------------------------------------------------------------------------


def build_get_list_request(indexes: list[tuple[int, int]]) -> bytes:
    buf = bytearray([FC_DEBUG_GET_LIST])
    buf += len(indexes).to_bytes(2, "big")
    for arr, elem in indexes:
        buf.append(arr)
        buf += elem.to_bytes(2, "big")
    return bytes(buf)


def parse_get_list_response(pdu: bytes) -> dict:
    if len(pdu) < 2:
        raise ValueError(f"response too short ({len(pdu)} bytes)")
    fc, status = pdu[0], pdu[1]
    if fc != FC_DEBUG_GET_LIST:
        raise ValueError(f"unexpected function code 0x{fc:02x}, expected DEBUG_GET_LIST")
    if status != STATUS_SUCCESS:
        raise ValueError(f"device error: {_status_name(status)}")
    if len(pdu) < 10:
        raise ValueError(f"incomplete getList response ({len(pdu)} bytes, expected >= 10)")
    last_index = int.from_bytes(pdu[2:4], "big")
    tick = int.from_bytes(pdu[4:8], "big")
    size = int.from_bytes(pdu[8:10], "big")
    data = pdu[10 : 10 + size]
    if len(data) < size:
        raise ValueError(f"truncated variable data (expected {size} bytes, got {len(data)})")
    return {"last_index": last_index, "tick": tick, "data": data}


# ---------------------------------------------------------------------------
# FC 0x42 - DEBUG_SET: force (or release) a single variable by (arr, elem)
# ---------------------------------------------------------------------------


def build_set_variable_request(arr: int, elem: int, force: bool, value: bytes = b"") -> bytes:
    buf = bytearray([FC_DEBUG_SET, arr])
    buf += elem.to_bytes(2, "big")
    buf.append(1 if force else 0)
    if force:
        buf += len(value).to_bytes(2, "big")
        buf += value
    else:
        buf += (1).to_bytes(2, "big")
        buf.append(0)
    return bytes(buf)


def parse_set_variable_response(pdu: bytes) -> None:
    if len(pdu) < 2:
        raise ValueError(f"response too short ({len(pdu)} bytes)")
    fc, status = pdu[0], pdu[1]
    if fc != FC_DEBUG_SET:
        raise ValueError(f"unexpected function code 0x{fc:02x}, expected DEBUG_SET")
    if status != STATUS_SUCCESS:
        raise ValueError(f"device error: {_status_name(status)}")


# ---------------------------------------------------------------------------
# Response-length prediction, so a transport can read exactly N bytes
# instead of guessing "done" from a quiet gap (slow: one full read-timeout
# per request). Both FCs used by PLCClient reply with a short `[status]`
# frame on any non-SUCCESS status ("respond_short" on the firmware side),
# and GET_LIST's success frame carries its own size field at a fixed offset.
# Returns None when not enough bytes are buffered yet to know the length, or
# when the FC isn't one we have a rule for (caller should fall back to a
# quiet-gap read in that case).
# ---------------------------------------------------------------------------


KNOWN_RESPONSE_FCS = {FC_DEBUG_SET, FC_DEBUG_GET_LIST}


def is_still_pending(buf: bytes) -> bool:
    """True while `buf` is an incomplete prefix of a recognized-FC response
    — i.e. more bytes are still coming, so a quiet gap on the transport
    must NOT be read as "response finished" (that would truncate a
    known-length frame the moment two bytes happen to arrive >1 poll
    apart). False once the FC byte is in and it's not one we recognize, at
    which point the caller's quiet-gap fallback is the only option left."""
    if len(buf) < 2:
        return True  # no FC byte yet — can't rule it out
    return buf[1] in KNOWN_RESPONSE_FCS


def expected_frame_length(buf: bytes) -> int | None:
    if len(buf) < 3:  # need slave_id, fc, status
        return None
    fc, status = buf[1], buf[2]
    if status != STATUS_SUCCESS:
        return 5  # slave_id + fc + status + crc16
    if fc == FC_DEBUG_SET:
        return 5
    if fc == FC_DEBUG_GET_LIST:
        if len(buf) < 11:  # slave_id + fc + status + lastIndex(2) + tick(4) + size(2)
            return None
        size = int.from_bytes(buf[9:11], "big")
        return 11 + size + 2
    return None
