"""Base interface every process scenario (esteira, tanque, portão, ...)
implements. A scenario only models the physical plant — it reacts to PLC
outputs and produces the sensor-driven inputs that follow from them.
Operator commands (start buttons, selectors) are not part of this: the
runner/caller sets those directly on the PLCClient, same as a human
pressing a real button.
"""

from __future__ import annotations

from abc import ABC, abstractmethod


class Scenario(ABC):
    @abstractmethod
    def initial_inputs(self) -> dict:
        """Sensor-driven inputs to force before the first scan."""

    @abstractmethod
    def step(self, dt: float, outputs: dict) -> dict:
        """Advances the physical model by `dt` seconds given the PLC's
        current outputs, and returns the resulting sensor inputs to force
        next. Only needs to include values that this scenario drives."""

    def state(self) -> dict:
        """Optional snapshot of internal physical state, for display/logging."""
        return {}
