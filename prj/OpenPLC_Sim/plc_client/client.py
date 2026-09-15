from __future__ import annotations

import struct
import time

from .debug_map import DebugMap, VarInfo
from .protocol import (
    build_get_list_request,
    build_set_variable_request,
    expected_frame_length,
    frame_rtu,
    is_still_pending,
    parse_get_list_response,
    parse_set_variable_response,
    unframe_rtu,
)

# Little-endian: both AVR (ATmega2560, the simulator) and ESP32 are LE targets.
_STRUCT_FMT = {
    "BOOL": "<B",
    "SINT": "<b",
    "USINT": "<B",
    "BYTE": "<B",
    "INT": "<h",
    "UINT": "<H",
    "WORD": "<H",
    "DINT": "<i",
    "UDINT": "<I",
    "DWORD": "<I",
    "REAL": "<f",
    "LINT": "<q",
    "ULINT": "<Q",
    "LWORD": "<Q",
    "LREAL": "<d",
}


class PLCError(RuntimeError):
    pass


class PLCClient:
    """Talks to a running OpenPLC program (simulator or real board) over its
    Modbus RTU debug channel: force any variable by name (`set`), read any
    variable by name (`get`/`get_many`) — independent of pin mapping, which
    is exactly what a process/scenario simulator needs to drive unmapped
    inputs like the ones in IO_sim.
    """

    def __init__(
        self,
        transport,
        debug_map_path: str,
        slave_id: int = 1,
        retries: int = 5,
        overall_timeout: float = 3.0,
    ):
        self._t = transport
        self.map = DebugMap(debug_map_path)
        self.slave_id = slave_id
        self.retries = retries
        self.overall_timeout = overall_timeout

    def connect(self) -> None:
        self._t.connect()

    def close(self) -> None:
        self._t.close()

    def __enter__(self) -> "PLCClient":
        self.connect()
        return self

    def __exit__(self, *exc) -> None:
        self.close()

    # -- wire I/O -----------------------------------------------------------

    def _read_full_frame(self) -> bytes:
        """Reads exactly as many bytes as `expected_frame_length` predicts
        for the FCs PLCClient uses (fast — no artificial wait). Falls back
        to "stop once the transport goes quiet" for any other FC, which is
        slower (pays one read-timeout of silence) but still correct."""
        buf = bytearray()
        deadline = time.monotonic() + self.overall_timeout
        while True:
            chunk = self._t.read()
            if chunk:
                buf += chunk
            frozen = bytes(buf)
            expected = expected_frame_length(frozen) if buf else None
            if expected is not None and len(buf) >= expected:
                return bytes(buf[:expected])
            if not chunk and buf and not is_still_pending(frozen):
                return frozen  # unrecognized FC — a quiet gap marks the end
            if time.monotonic() > deadline:
                raise PLCError(f"timed out waiting for response ({len(buf)} bytes received)")

    def _request(self, pdu: bytes) -> bytes:
        frame = frame_rtu(self.slave_id, pdu)
        last_err: Exception | None = None
        for _ in range(self.retries):
            try:
                # Some real boards (e.g. the ESP32 WROOM here) push unsolicited
                # status frames on their own every few seconds — drain first so
                # one that arrived while we were idle can't be mistaken for
                # this request's response.
                self._t.drain()
                self._t.write(frame)
                raw = self._read_full_frame()
                slave, resp_pdu = unframe_rtu(raw)
                if slave != self.slave_id:
                    raise PLCError(f"unexpected slave id {slave} (expected {self.slave_id})")
                return resp_pdu
            except Exception as e:  # noqa: BLE001 - retry on any transport/framing hiccup
                last_err = e
        raise PLCError(f"request failed after {self.retries} attempts: {last_err}")

    # -- value packing --------------------------------------------------------

    def _pack(self, info: VarInfo, value) -> bytes:
        fmt = _STRUCT_FMT.get(info.type)
        if fmt is None:
            raise NotImplementedError(f"type {info.type} not supported yet")
        if info.type == "BOOL":
            return struct.pack(fmt, 1 if value else 0)
        return struct.pack(fmt, value)

    def _unpack(self, info: VarInfo, raw: bytes):
        fmt = _STRUCT_FMT.get(info.type)
        if fmt is None:
            raise NotImplementedError(f"type {info.type} not supported yet")
        (value,) = struct.unpack(fmt, raw[: info.size])
        return bool(value) if info.type == "BOOL" else value

    # -- public API -----------------------------------------------------------

    def set(self, name: str, value) -> None:
        """Force `name` to `value`, overriding whatever would normally
        drive it (a real sensor pin, or nothing at all for an unmapped
        variable like IO_sim's Inicio/Sensor). Persists until `release`."""
        info = self.map.resolve(name)
        payload = self._pack(info, value)
        resp = self._request(build_set_variable_request(info.arr, info.elem, True, payload))
        parse_set_variable_response(resp)

    def set_many(self, values: dict) -> None:
        for name, value in values.items():
            self.set(name, value)

    def release(self, name: str) -> None:
        """Stop forcing `name` — let the program drive it again."""
        info = self.map.resolve(name)
        resp = self._request(build_set_variable_request(info.arr, info.elem, False))
        parse_set_variable_response(resp)

    def get_many(self, names: list[str]) -> dict:
        """Returns a dict keyed by the exact strings in `names` (not the
        resolved/uppercased variable name), so callers can look values up
        with the same spelling they requested."""
        infos = [self.map.resolve(n) for n in names]
        resp = self._request(build_get_list_request([(i.arr, i.elem) for i in infos]))
        data = parse_get_list_response(resp)["data"]
        out = {}
        offset = 0
        for requested_name, info in zip(names, infos):
            chunk = data[offset : offset + info.size]
            if len(chunk) < info.size:
                raise PLCError(f"short read for '{info.name}': expected {info.size} bytes, got {len(chunk)}")
            out[requested_name] = self._unpack(info, chunk)
            offset += info.size
        return out

    def get(self, name: str):
        return self.get_many([name])[name]
