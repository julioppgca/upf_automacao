"""Loads an OpenPLC Editor-generated debug-map.json and resolves IEC
variable names to their (array, element) debug-table address plus type/size.
"""

from __future__ import annotations

import json
from dataclasses import dataclass


@dataclass(frozen=True)
class VarInfo:
    name: str  # short name, e.g. "ESTEIRA"
    path: str  # full path, e.g. "INSTANCE0.ESTEIRA"
    arr: int
    elem: int
    type: str
    size: int


class DebugMap:
    def __init__(self, path: str):
        with open(path) as f:
            raw = json.load(f)
        self.md5: str = raw["md5"]
        self._by_key: dict[str, VarInfo] = {}
        for leaf in raw["leaves"]:
            path_str = leaf["path"]
            short = path_str.split(".")[-1].upper()
            info = VarInfo(
                name=short,
                path=path_str,
                arr=leaf["arrayIdx"],
                elem=leaf["elemIdx"],
                type=leaf["type"],
                size=leaf["size"],
            )
            # Both the bare variable name and the full dotted path resolve —
            # convenient for flat single-instance programs like a scenario
            # test POU, unambiguous for multi-instance ones via the full path.
            self._by_key.setdefault(short, info)
            self._by_key[path_str.upper()] = info

    def resolve(self, name: str) -> VarInfo:
        key = name.upper()
        if key not in self._by_key:
            raise KeyError(f"variable '{name}' not found in debug map")
        return self._by_key[key]
