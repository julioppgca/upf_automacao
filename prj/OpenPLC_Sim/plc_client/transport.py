"""Byte transports for PLCClient. Same RTU wire format regardless of
transport, so the scenario/process code never changes when swapping the
simulator bridge for a real board.
"""

from __future__ import annotations

import socket


class TcpRawTransport:
    """Raw byte stream over TCP — talks to sim-bridge's passthrough socket."""

    def __init__(self, host: str, port: int, timeout: float = 0.05):
        self.host = host
        self.port = port
        self.timeout = timeout
        self._sock: socket.socket | None = None

    def connect(self) -> None:
        self._sock = socket.create_connection((self.host, self.port), timeout=self.timeout)
        self._sock.settimeout(self.timeout)

    def close(self) -> None:
        if self._sock is not None:
            self._sock.close()
            self._sock = None

    def write(self, data: bytes) -> None:
        if self._sock is None:
            raise RuntimeError("transport not connected")
        self._sock.sendall(data)

    def read(self, size_hint: int = 256) -> bytes:
        """Returns whatever is available within `timeout`; b"" on timeout
        (mirrors pyserial's read-with-timeout semantics, not an error)."""
        if self._sock is None:
            raise RuntimeError("transport not connected")
        try:
            return self._sock.recv(size_hint)
        except (TimeoutError, socket.timeout):
            return b""

    def drain(self) -> None:
        """Discards whatever is currently buffered — used before a request
        (or a retry) so leftover bytes from something unrelated can't get
        mistaken for the start of this request's response."""
        while self.read():
            pass


class SerialTransport:
    """Real Modbus RTU over a serial port (e.g. the ESP32 WROOM on
    /dev/ttyUSB0). Same PDU-level protocol as the simulator bridge — only
    the byte carrier changes. Requires pyserial (not installed by default;
    add it when this transport is actually used against real hardware).

    DTR/RTS are released right after opening: on most ESP32/Arduino dev
    boards those lines are wired to EN/BOOT for the flashing tool's
    auto-reset trick, and pyserial's default handshake state can hold or
    toggle them enough to reset the board mid-session.
    """

    def __init__(self, port: str, baudrate: int = 115200, timeout: float = 0.15):
        # 0.15s, not the 0.05s TcpRawTransport uses: a real USB-serial
        # adapter's round trip is measurably slower than TCP loopback to
        # the emulator, and 0.05s produced constant spurious read failures
        # against the real ESP32 WROOM (see plc_client's docs/history).
        self.port = port
        self.baudrate = baudrate
        self.timeout = timeout
        self._serial = None

    def connect(self) -> None:
        import serial  # pyserial — imported lazily so it's only required here

        self._serial = serial.Serial(
            self.port, self.baudrate, timeout=self.timeout, dsrdtr=False, rtscts=False
        )
        self._serial.dtr = False
        self._serial.rts = False

    def close(self) -> None:
        if self._serial is not None:
            self._serial.close()
            self._serial = None

    def write(self, data: bytes) -> None:
        if self._serial is None:
            raise RuntimeError("transport not connected")
        self._serial.write(data)

    def read(self, size_hint: int = 256) -> bytes:
        if self._serial is None:
            raise RuntimeError("transport not connected")
        return self._serial.read(size_hint)

    def drain(self) -> None:
        if self._serial is None:
            raise RuntimeError("transport not connected")
        self._serial.reset_input_buffer()
