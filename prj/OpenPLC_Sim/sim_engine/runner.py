from __future__ import annotations

import threading
import time
from typing import Callable

from plc_client import PLCClient
from plc_client.debug_map import DebugMap

from .scenario import Scenario

# (elapsed_seconds, plc_outputs, new_inputs, scenario_state) -> None
OnTick = Callable[[float, dict, dict, dict], None]


class ScenarioRunner:
    """Drives a Scenario against a live PLCClient: each tick, reads the
    PLC's outputs, advances the physics, and forces the resulting inputs
    back — the same request/response pattern regardless of whether the PLC
    is the AVR8JS simulator or a real board, since that's all hidden behind
    PLCClient's transport.

    All PLCClient access (from `run()`'s own loop, and from `command`/
    `set_override` called externally e.g. by a dashboard's request thread)
    goes through one lock — there's only one wire, one Modbus master should
    ever be talking on it at a time, same as with real hardware.
    """

    def __init__(self, client: PLCClient, scenario: Scenario, output_names: list[str], tick_hz: float = 5.0):
        self.client = client
        self.scenario = scenario
        self.output_names = output_names
        self.dt = 1.0 / tick_hz

        self._lock = threading.Lock()
        self._overrides: dict[str, object] = {}
        self._running = False

        self.last_outputs: dict = {}
        self.last_inputs: dict = {}

    def command(self, name: str, value) -> None:
        """Direct operator command (e.g. a start button) — applied right
        away, outside the scenario's physics and outside overrides."""
        with self._lock:
            self.client.set(name, value)

    def set_override(self, name: str, value) -> None:
        """Force a scenario-driven input to `value` regardless of what the
        physics computes (fault injection: stuck sensor, jammed limit
        switch, ...). The scenario keeps stepping its internal state
        normally underneath; only the value pushed to the PLC is pinned."""
        with self._lock:
            self._overrides[name] = value

    def clear_override(self, name: str) -> None:
        with self._lock:
            self._overrides.pop(name, None)

    def reload_debug_map(self, debug_map_path: str) -> None:
        """Re-resolves variable names against a freshly rebuilt
        debug-map.json (e.g. after the project was rebuilt in the Editor
        and variable indices may have shifted)."""
        with self._lock:
            self.client.map = DebugMap(debug_map_path)

    def stop(self) -> None:
        self._running = False

    def run(self, duration: float | None = None, on_tick: OnTick | None = None) -> None:
        with self._lock:
            self.client.set_many(self.scenario.initial_inputs())
        self._running = True
        start = time.monotonic()
        elapsed = 0.0
        while self._running and (duration is None or elapsed < duration):
            tick_start = time.monotonic()
            with self._lock:
                outputs = self.client.get_many(self.output_names)
                inputs = self.scenario.step(self.dt, outputs)
                inputs.update(self._overrides)
                if inputs:
                    self.client.set_many(inputs)
            self.last_outputs = outputs
            self.last_inputs = inputs
            if on_tick:
                on_tick(elapsed, outputs, inputs, self.scenario.state())
            spent = time.monotonic() - tick_start
            time.sleep(max(0.0, self.dt - spent))
            elapsed = time.monotonic() - start
        self._running = False
