"""Parses an OpenPLC Editor .ld POU file into plain geometry the dashboard
can render as an SVG ladder diagram — same node positions the Editor's own
canvas uses, so the layout matches what you'd see there. Only the node
types IO_sim's rungs actually use (powerRail, contact, coil) are handled;
other types (block, variable, parallel branches) are skipped for now.
"""

from __future__ import annotations

import json
from pathlib import Path


def _connector_points(node: dict) -> dict[str, tuple[float, float]]:
    """A handle's stored `glbPosition` can go stale after a node is moved
    (seen firsthand on IO_sim's right rail); `position + relPosition` is
    the one value ReactFlow keeps consistent, so that's what we use."""
    x, y = node["position"]["x"], node["position"]["y"]
    points = {}
    for h in node.get("data", {}).get("handles", []):
        rel = h.get("relPosition", {"x": 0, "y": 0})
        points[h["id"]] = (x + rel.get("x", 0), y + rel.get("y", 0))
    return points


def parse_ladder(ld_path: str) -> dict:
    text = Path(ld_path).read_text()
    data, _ = json.JSONDecoder().raw_decode(text[text.index("{") :])

    rungs = []
    for rung in data["rungs"]:
        nodes_by_id = {n["id"]: n for n in rung["nodes"]}
        elements = []
        max_x = 0.0
        max_y = 0.0

        for n in rung["nodes"]:
            t = n["type"]
            d = n.get("data", {})
            x, y = n["position"]["x"], n["position"]["y"]
            w, h = n.get("width", 0), n.get("height", 0)
            max_x = max(max_x, x + w)
            max_y = max(max_y, y + h)

            if t == "contact":
                var = (d.get("variable") or {}).get("name", "")
                elements.append(
                    {
                        "kind": "contact",
                        "variable": var,
                        "negated": d.get("variant") == "negated",
                        "x": x,
                        "y": y,
                        "w": w,
                        "h": h,
                    }
                )
            elif t == "coil":
                var = (d.get("variable") or {}).get("name", "")
                elements.append({"kind": "coil", "variable": var, "x": x, "y": y, "w": w, "h": h})
            elif t == "powerRail":
                side = d.get("variant", "left")
                elements.append({"kind": "rail", "side": side, "x": x + w / 2, "y1": y, "y2": y + h})

        wires = []
        for e in rung.get("edges", []):
            src = nodes_by_id.get(e["source"])
            dst = nodes_by_id.get(e["target"])
            if not src or not dst:
                continue
            p1 = _connector_points(src).get(e.get("sourceHandle"))
            p2 = _connector_points(dst).get(e.get("targetHandle"))
            if p1 and p2:
                wires.append({"x1": p1[0], "y1": p1[1], "x2": p2[0], "y2": p2[1]})

        rungs.append(
            {
                "comment": rung.get("comment", ""),
                "width": max_x + 20,
                "height": max_y + 30,
                "elements": elements,
                "wires": wires,
            }
        )

    return {"rungs": rungs}
