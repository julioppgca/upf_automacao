"""Roda o cenário da esteira contra o IO_sim, via sim-bridge. Liga o botão
Inicio e deixa peças entrarem sozinhas: Sensor é 100% obra do cenário
(física simulada), Esteira é 100% obra do ladder do IO_sim rodando de
verdade no emulador — o loop só troca essas duas pontas.

Requer o sim-bridge já rodando contra o firmware do IO_sim:

    cd sim-bridge && npm start -- \
      "/home/julio/upf/automation/openplc_prj/build/OpenPLC Simulator/examples/Baremetal/build/arduino.avr.mega/Baremetal.ino.hex" \
      8502
"""

from __future__ import annotations

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from plc_client import PLCClient, TcpRawTransport  # noqa: E402
from scenarios import ConveyorScenario  # noqa: E402
from sim_engine import ScenarioRunner  # noqa: E402

DEBUG_MAP = (
    "/home/julio/upf/automation/openplc_prj/build/OpenPLC Simulator/src/debug-map.json"
)


def print_tick(elapsed: float, outputs: dict, inputs: dict, state: dict) -> None:
    pos = state["part_position"]
    pos_str = f"{pos:4.2f}" if pos is not None else " -- "
    bar_len = 20
    if pos is None:
        bar = "." * bar_len
    else:
        filled = min(bar_len, int(pos / 1.0 * bar_len))
        bar = "#" * filled + "." * (bar_len - filled)
    print(
        f"t={elapsed:5.1f}s  peça=[{bar}] pos={pos_str}  "
        f"Sensor={inputs.get('Sensor', outputs.get('Sensor')):d}  "
        f"Esteira={outputs['Esteira']:d}"
    )


def main() -> None:
    transport = TcpRawTransport("127.0.0.1", 8502)
    client = PLCClient(transport, DEBUG_MAP)
    scenario = ConveyorScenario()
    runner = ScenarioRunner(client, scenario, output_names=["Esteira"], tick_hz=5.0)

    with client:
        client.set("Inicio", True)
        print("Inicio=1 — esteira liberada, peças vão entrar sozinhas.\n")
        runner.run(duration=15.0, on_tick=print_tick)


if __name__ == "__main__":
    main()
