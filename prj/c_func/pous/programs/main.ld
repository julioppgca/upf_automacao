PROGRAM main
  VAR
    led : BOOL AT %QX0.0;
    liga : BOOL AT %IX0.0;
    SERVER_AP0 : server_ap;
  END_VAR

{
  "name": "main",
  "rungs": [
    {
      "id": "rung_main_6e00056d-6fbd-4d15-af15-86b81e3e1da2",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        616,
        134
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_6e00056d-6fbd-4d15-af15-86b81e3e1da2",
          "type": "powerRail",
          "position": {
            "x": 0,
            "y": 30
          },
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 3,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "left-rail",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 20,
                "right": -3
              }
            },
            "numericId": "4470292",
            "variant": "left",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false
          },
          "width": 3,
          "height": 40,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "selected": false,
          "dragging": false
        },
        {
          "id": "BLOCK_0f58d6ec-3c79-44e2-a4ef-be7dd984bf8a",
          "type": "block",
          "position": {
            "x": 143,
            "y": 14
          },
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 143,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "entrada",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 353,
                  "y": 50
                },
                "relPosition": {
                  "x": 210,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 353,
                  "y": 90
                },
                "relPosition": {
                  "x": 210,
                  "y": 76
                },
                "id": "led_saida",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 143,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "entrada",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 353,
                  "y": 50
                },
                "relPosition": {
                  "x": 210,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 353,
                  "y": 90
                },
                "relPosition": {
                  "x": 210,
                  "y": 76
                },
                "id": "led_saida",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 143,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "EN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 353,
                "y": 50
              },
              "relPosition": {
                "x": 210,
                "y": 36
              },
              "id": "ENO",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "5871761",
            "variant": {
              "name": "server_ap",
              "documentation": "",
              "type": "function-block",
              "variables": [
                {
                  "name": "EN",
                  "class": "input",
                  "type": {
                    "definition": "generic-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "ENO",
                  "class": "output",
                  "type": {
                    "definition": "generic-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "entrada",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": "false",
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "led_saida",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": "false",
                  "documentation": "",
                  "debug": false
                }
              ]
            },
            "variable": {
              "id": "2b40a911-57ae-4041-954a-1fc18ee74793",
              "name": "SERVER_AP0",
              "type": {
                "definition": "derived",
                "value": "server_ap"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false,
              "initialValue": ""
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": false,
            "connectedVariables": [
              {
                "handleId": "entrada",
                "type": "input",
                "variable": {
                  "id": "",
                  "name": "liga",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "led_saida",
                "type": "output",
                "variable": {
                  "id": "",
                  "name": "led",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          },
          "width": 210,
          "height": 100,
          "measured": {
            "width": 210,
            "height": 100
          },
          "draggable": true,
          "selectable": true,
          "selected": false,
          "dragging": false
        },
        {
          "id": "right-rail-rung_main_6e00056d-6fbd-4d15-af15-86b81e3e1da2",
          "type": "powerRail",
          "position": {
            "x": 613,
            "y": 30
          },
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                },
                "x": 613
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                }
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 297,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "right-rail",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 20,
                "left": -3
              }
            },
            "numericId": "246528",
            "variant": "right",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false
          },
          "width": 3,
          "height": 40,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "selected": false,
          "dragging": false
        },
        {
          "id": "VARIABLE_416cd149-f849-45d3-b4f7-f30a0c47d9ee",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 74
          },
          "width": 80,
          "height": 32,
          "measured": {
            "width": 80,
            "height": 32
          },
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 90
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "7171333",
            "variable": {
              "id": "",
              "name": "liga",
              "type": {
                "definition": "base-type",
                "value": "BOOL"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_0f58d6ec-3c79-44e2-a4ef-be7dd984bf8a",
              "handleId": "entrada",
              "variableType": {
                "name": "entrada",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": "false",
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          },
          "deletable": false,
          "selectable": true,
          "draggable": false,
          "selected": false,
          "dragging": false
        },
        {
          "id": "VARIABLE_c57782e3-7539-451f-9429-bd047cd8c63d",
          "type": "variable",
          "position": {
            "x": 383,
            "y": 74
          },
          "width": 80,
          "height": 32,
          "measured": {
            "width": 80,
            "height": 32
          },
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 383,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 383,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 383,
                "y": 90
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "5409717",
            "variable": {
              "id": "",
              "name": "led",
              "type": {
                "definition": "base-type",
                "value": "BOOL"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_0f58d6ec-3c79-44e2-a4ef-be7dd984bf8a",
              "handleId": "led_saida",
              "variableType": {
                "name": "led_saida",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": "false",
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          },
          "deletable": false,
          "selectable": true,
          "draggable": false,
          "selected": false,
          "dragging": false
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_6e00056d-6fbd-4d15-af15-86b81e3e1da2_BLOCK_0f58d6ec-3c79-44e2-a4ef-be7dd984bf8a__left-rail_habilita",
          "source": "left-rail-rung_main_6e00056d-6fbd-4d15-af15-86b81e3e1da2",
          "target": "BLOCK_0f58d6ec-3c79-44e2-a4ef-be7dd984bf8a",
          "sourceHandle": "left-rail",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_0f58d6ec-3c79-44e2-a4ef-be7dd984bf8a_right-rail-rung_main_6e00056d-6fbd-4d15-af15-86b81e3e1da2__cliente_conectado_right-rail",
          "source": "BLOCK_0f58d6ec-3c79-44e2-a4ef-be7dd984bf8a",
          "target": "right-rail-rung_main_6e00056d-6fbd-4d15-af15-86b81e3e1da2",
          "sourceHandle": "ENO",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_VARIABLE_416cd149-f849-45d3-b4f7-f30a0c47d9ee_BLOCK_0f58d6ec-3c79-44e2-a4ef-be7dd984bf8a__output_entrada",
          "source": "VARIABLE_416cd149-f849-45d3-b4f7-f30a0c47d9ee",
          "target": "BLOCK_0f58d6ec-3c79-44e2-a4ef-be7dd984bf8a",
          "sourceHandle": "output",
          "targetHandle": "entrada"
        },
        {
          "id": "e_BLOCK_0f58d6ec-3c79-44e2-a4ef-be7dd984bf8a_VARIABLE_c57782e3-7539-451f-9429-bd047cd8c63d__led_saida_input",
          "source": "BLOCK_0f58d6ec-3c79-44e2-a4ef-be7dd984bf8a",
          "target": "VARIABLE_c57782e3-7539-451f-9429-bd047cd8c63d",
          "sourceHandle": "led_saida",
          "targetHandle": "input"
        }
      ],
      "selectedNodes": []
    }
  ]
}
END_PROGRAM