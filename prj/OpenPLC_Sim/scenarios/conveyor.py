"""Esteira transportadora: uma peça entra numa ponta e anda até o sensor de
presença. Enquanto o motor (Esteira) estiver ligado, a peça avança; ao
cruzar o sensor, Sensor vira True — e é a própria lógica ladder do IO_sim
que desliga o motor (Esteira = Inicio AND NOT Sensor), não este cenário.
Depois de um tempo parada no sensor (como se um atuador a jusante a
retirasse), a peça some, o sensor libera e, se Inicio continuar ligado, a
esteira volta a puxar a próxima peça.
"""

from __future__ import annotations

from sim_engine.scenario import Scenario


class ConveyorScenario(Scenario):
    def __init__(
        self,
        belt_length: float = 1.0,
        sensor_position: float = 0.9,
        speed: float = 0.3,
        dwell_time: float = 1.0,
        spawn_interval: float = 2.0,
    ):
        self.belt_length = belt_length
        self.sensor_position = sensor_position
        self.speed = speed
        self.dwell_time = dwell_time
        self.spawn_interval = spawn_interval

        self.part_position: float | None = None
        self._dwell_elapsed = 0.0
        self._time_since_spawn = 0.0

    def initial_inputs(self) -> dict:
        return {"Sensor": False}

    def step(self, dt: float, outputs: dict) -> dict:
        motor_on = bool(outputs.get("Esteira", False))
        at_sensor = self.part_position is not None and self.part_position >= self.sensor_position

        if at_sensor:
            # peça bloqueada no sensor — aguarda o "atuador" a jusante retirá-la
            self._dwell_elapsed += dt
            if self._dwell_elapsed >= self.dwell_time:
                self.part_position = None
                self._dwell_elapsed = 0.0
        elif self.part_position is not None and motor_on:
            self.part_position += self.speed * dt
            if self.part_position > self.belt_length:
                self.part_position = None  # saiu pela ponta

        if self.part_position is None:
            self._time_since_spawn += dt
            if self._time_since_spawn >= self.spawn_interval:
                self.part_position = 0.0
                self._time_since_spawn = 0.0

        sensor = self.part_position is not None and self.part_position >= self.sensor_position
        return {"Sensor": sensor}

    def state(self) -> dict:
        return {
            "part_position": self.part_position,
            "sensor": self.part_position is not None and self.part_position >= self.sensor_position,
        }
