"""Dashboard local para acompanhar e mexer no cenário da esteira em tempo
real, pelo navegador. Roda o ScenarioRunner numa thread de fundo e transmite
o estado por WebSocket; os controles (Inicio, forçar/liberar Sensor) chamam
de volta no runner, que serializa tudo no mesmo PLCClient.

Requer o sim-bridge já rodando contra o firmware do IO_sim:

    cd sim-bridge && npm start -- \
      "/home/julio/upf/automation/openplc_prj/build/OpenPLC Simulator/examples/Baremetal/build/arduino.avr.mega/Baremetal.ino.hex" \
      8502

Depois:

    .venv/bin/uvicorn dashboard.app:app --reload --port 8000

E abra http://127.0.0.1:8000
"""

from __future__ import annotations

import asyncio
import sys
import threading
import time
from contextlib import asynccontextmanager
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))

from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from fastapi.responses import FileResponse
from pydantic import BaseModel

from dashboard.ladder import parse_ladder
from plc_client import PLCClient, TcpRawTransport
from scenarios import ConveyorScenario
from sim_engine import ScenarioRunner

PROJECT_DIR = "/home/julio/upf/automation/openplc_prj"
DEBUG_MAP = f"{PROJECT_DIR}/build/OpenPLC Simulator/src/debug-map.json"
LADDER_PATH = f"{PROJECT_DIR}/pous/programs/main.ld"

client = PLCClient(TcpRawTransport("127.0.0.1", 8502), DEBUG_MAP)
scenario = ConveyorScenario()
# "Inicio" isn't a PLC output, but reading it back alongside Esteira costs
# nothing extra (one Modbus request covers the whole list) and is what the
# ladder view needs to paint the Inicio contact live.
runner = ScenarioRunner(client, scenario, output_names=["Esteira", "Inicio"], tick_hz=5.0)
DIAGRAM = parse_ladder(LADDER_PATH)
_diagram_version = 0

_clients: set[WebSocket] = set()
_loop: asyncio.AbstractEventLoop | None = None


def _watch_project_files(poll_interval: float = 1.0) -> None:
    """Rebuilding the project in the Editor changes main.ld (layout/logic)
    and debug-map.json (variable indices) on disk, but nothing here looks
    at them again after startup by default — so a rebuild would silently
    keep the dashboard showing the previous version forever. Poll both and
    refresh in place when they change (the firmware itself is reloaded the
    same way, by sim-bridge watching the .hex)."""
    global DIAGRAM, _diagram_version
    last_ld_mtime = Path(LADDER_PATH).stat().st_mtime
    last_map_mtime = Path(DEBUG_MAP).stat().st_mtime
    while True:
        time.sleep(poll_interval)
        try:
            ld_mtime = Path(LADDER_PATH).stat().st_mtime
            map_mtime = Path(DEBUG_MAP).stat().st_mtime
        except FileNotFoundError:
            continue  # mid-rebuild — try again next poll

        try:
            changed = False
            if ld_mtime != last_ld_mtime:
                DIAGRAM = parse_ladder(LADDER_PATH)
                last_ld_mtime = ld_mtime
                changed = True
            if map_mtime != last_map_mtime:
                runner.reload_debug_map(DEBUG_MAP)
                last_map_mtime = map_mtime
                changed = True
        except (OSError, ValueError, KeyError) as e:
            # Likely caught the build mid-write (partial JSON); leave the
            # *_mtime trackers where they were so the next poll retries.
            print(f"[dashboard] project file changed but reload failed, will retry: {e}")
            continue

        if changed:
            _diagram_version += 1
            print(f"[dashboard] project files changed on disk — reloaded (v{_diagram_version})")


def _on_tick(elapsed: float, outputs: dict, inputs: dict, state: dict) -> None:
    snapshot = {
        "elapsed": round(elapsed, 1),
        "outputs": outputs,
        "inputs": inputs,
        "values": {**outputs, **inputs},  # for the ladder view: any variable, by name
        "state": state,
        "diagram_version": _diagram_version,
    }
    if _loop is not None:
        asyncio.run_coroutine_threadsafe(_broadcast(snapshot), _loop)


async def _broadcast(snapshot: dict) -> None:
    dead = []
    for ws in _clients:
        try:
            await ws.send_json(snapshot)
        except Exception:
            dead.append(ws)
    for ws in dead:
        _clients.discard(ws)


@asynccontextmanager
async def lifespan(_app: FastAPI):
    global _loop
    _loop = asyncio.get_running_loop()
    client.connect()
    threading.Thread(target=runner.run, kwargs={"on_tick": _on_tick}, daemon=True).start()
    threading.Thread(target=_watch_project_files, daemon=True).start()
    try:
        yield
    finally:
        runner.stop()
        client.close()


app = FastAPI(lifespan=lifespan)


@app.get("/")
def index() -> FileResponse:
    return FileResponse(Path(__file__).parent / "static" / "index.html")


@app.get("/api/diagram")
def diagram() -> dict:
    return DIAGRAM


@app.websocket("/ws")
async def ws_endpoint(websocket: WebSocket) -> None:
    await websocket.accept()
    _clients.add(websocket)
    try:
        while True:
            await websocket.receive_text()  # nothing expected inbound; just detect disconnect
    except WebSocketDisconnect:
        _clients.discard(websocket)


class BoolCommand(BaseModel):
    value: bool


@app.post("/api/inicio")
def set_inicio(cmd: BoolCommand) -> dict:
    runner.command("Inicio", cmd.value)
    return {"ok": True}


@app.post("/api/override/sensor")
def override_sensor(cmd: BoolCommand) -> dict:
    runner.set_override("Sensor", cmd.value)
    return {"ok": True}


@app.post("/api/override/sensor/release")
def release_sensor_override() -> dict:
    runner.clear_override("Sensor")
    return {"ok": True}
