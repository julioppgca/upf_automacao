"""End-to-end check of PLCClient against IO_sim, running on the AVR8JS
emulator via sim-bridge. IO_sim has three unmapped BOOL locals (no AT
clause, no pin-mapping entry): Inicio, Sensor (inputs we force) and Esteira
(output, computed as Inicio AND NOT Sensor). Requires sim-bridge already
running against IO_sim's compiled firmware:

    cd sim-bridge && npm start -- \
      "/home/julio/upf/automation/openplc_prj/build/OpenPLC Simulator/examples/Baremetal/build/arduino.avr.mega/Baremetal.ino.hex" \
      8502
"""

from __future__ import annotations

import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from plc_client import PLCClient, TcpRawTransport  # noqa: E402

DEBUG_MAP = (
    "/home/julio/upf/automation/openplc_prj/build/OpenPLC Simulator/src/debug-map.json"
)


def check(client: PLCClient, inicio: bool, sensor: bool, expected: bool, label: str) -> bool:
    client.set("Inicio", inicio)
    client.set("Sensor", sensor)
    time.sleep(0.1)  # let a few 20ms scan cycles run
    vals = client.get_many(["Inicio", "Sensor", "Esteira"])
    ok = vals["Esteira"] == expected
    print(
        f"[{'OK' if ok else 'FALHOU'}] {label}: "
        f"Inicio={vals['Inicio']} Sensor={vals['Sensor']} -> Esteira={vals['Esteira']} "
        f"(esperado {expected})"
    )
    return ok


def main() -> None:
    transport = TcpRawTransport("127.0.0.1", 8502)
    client = PLCClient(transport, DEBUG_MAP)
    with client:
        results = [
            check(client, True, False, True, "Inicio=1, Sensor=0 -> liga esteira"),
            check(client, True, True, False, "Sensor=1 bloqueia -> esteira desliga"),
            check(client, False, True, False, "Inicio=0, Sensor=1 -> esteira desliga"),
            check(client, False, False, False, "Inicio=0, Sensor=0 -> esteira permanece desligada"),
            check(client, True, False, True, "volta a Inicio=1, Sensor=0 -> liga de novo"),
        ]
        print()
        print("TODOS OS TESTES PASSARAM" if all(results) else "HÁ FALHAS ACIMA")


if __name__ == "__main__":
    main()
