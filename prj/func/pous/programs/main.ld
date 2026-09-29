PROGRAM main
  VAR_EXTERNAL
    cnt1 : INT;
    cnt2 : INT;
  END_VAR
  VAR
    ain0 : WORD AT %IW0;
    aout0 : WORD AT %QW0;
    bt1 : BOOL AT %IX0.0;
    bt2 : BOOL AT %IX0.1;
    MEU_CONTADOR0 : meu_contador;
    MEU_CONTADOR1 : meu_contador;
    SERVIDOR0 : servidor;
  END_VAR

{
  "name": "main",
  "rungs": [
    {
      "id": "rung_main_666dcd36-b65c-4ae2-99f7-280020d7b180",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        520,
        174
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_666dcd36-b65c-4ae2-99f7-280020d7b180",
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
            "numericId": "6005084",
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
          "id": "BLOCK_3d2c9e20-81c5-4917-a5d4-465c1f480446",
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
                "id": "entra",
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
                  "x": 257,
                  "y": 50
                },
                "relPosition": {
                  "x": 114,
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
                  "x": 257,
                  "y": 90
                },
                "relPosition": {
                  "x": 114,
                  "y": 76
                },
                "id": "OUT",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 257,
                  "y": 130
                },
                "relPosition": {
                  "x": 114,
                  "y": 116
                },
                "id": "sai",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
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
                "id": "entra",
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
                  "x": 257,
                  "y": 50
                },
                "relPosition": {
                  "x": 114,
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
                  "x": 257,
                  "y": 90
                },
                "relPosition": {
                  "x": 114,
                  "y": 76
                },
                "id": "OUT",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 257,
                  "y": 130
                },
                "relPosition": {
                  "x": 114,
                  "y": 116
                },
                "id": "sai",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
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
                "x": 257,
                "y": 50
              },
              "relPosition": {
                "x": 114,
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
            "numericId": "1545639",
            "variant": {
              "name": "meu_move",
              "type": "function",
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
                  "id": "OUT",
                  "name": "OUT",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "entra",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "WORD"
                  }
                },
                {
                  "name": "sai",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "WORD"
                  }
                }
              ],
              "documentation": "",
              "extensible": false
            },
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": true,
            "connectedVariables": [
              {
                "handleId": "entra",
                "type": "input",
                "variable": {
                  "id": "0d573e8a-e86a-4bb2-93cf-a9ebd5a96d62",
                  "name": "ain0",
                  "type": {
                    "definition": "base-type",
                    "value": "WORD"
                  },
                  "class": "local",
                  "location": "%IW0",
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "sai",
                "type": "output",
                "variable": {
                  "id": "dbd4bc2f-4687-42a6-a25f-5eda9798fcb7",
                  "name": "aout0",
                  "type": {
                    "definition": "base-type",
                    "value": "WORD"
                  },
                  "class": "local",
                  "location": "%QW0",
                  "documentation": "",
                  "debug": false
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          },
          "width": 114,
          "height": 140,
          "measured": {
            "width": 114,
            "height": 140
          },
          "draggable": true,
          "selectable": true,
          "selected": false,
          "dragging": false
        },
        {
          "id": "right-rail-rung_main_666dcd36-b65c-4ae2-99f7-280020d7b180",
          "type": "powerRail",
          "position": {
            "x": 517,
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
                "x": 517
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
            "numericId": "6551745",
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
          "id": "VARIABLE_44f97fd8-5b85-4b12-98b4-57c6df223604",
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
            "numericId": "5593000",
            "variable": {
              "id": "0d573e8a-e86a-4bb2-93cf-a9ebd5a96d62",
              "name": "ain0",
              "type": {
                "definition": "base-type",
                "value": "WORD"
              },
              "class": "local",
              "location": "%IW0",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_3d2c9e20-81c5-4917-a5d4-465c1f480446",
              "handleId": "entra",
              "variableType": {
                "name": "entra",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "WORD"
                }
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
          "id": "VARIABLE_f43d093f-5515-4f78-8dc6-ecadd6727924",
          "type": "variable",
          "position": {
            "x": 287,
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
                  "x": 287,
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
                  "x": 287,
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
                "x": 287,
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
            "numericId": "5521574",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_3d2c9e20-81c5-4917-a5d4-465c1f480446",
              "handleId": "OUT",
              "variableType": {
                "id": "OUT",
                "name": "OUT",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
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
          "id": "VARIABLE_ad3d2871-1b40-4021-a4e1-7918b6c50f70",
          "type": "variable",
          "position": {
            "x": 287,
            "y": 114
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
                  "x": 287,
                  "y": 130
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
                  "x": 287,
                  "y": 130
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
                "x": 287,
                "y": 130
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
            "numericId": "1658653",
            "variable": {
              "id": "dbd4bc2f-4687-42a6-a25f-5eda9798fcb7",
              "name": "aout0",
              "type": {
                "definition": "base-type",
                "value": "WORD"
              },
              "class": "local",
              "location": "%QW0",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_3d2c9e20-81c5-4917-a5d4-465c1f480446",
              "handleId": "sai",
              "variableType": {
                "name": "sai",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "WORD"
                }
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
          "id": "e_left-rail-rung_main_666dcd36-b65c-4ae2-99f7-280020d7b180_BLOCK_3d2c9e20-81c5-4917-a5d4-465c1f480446__left-rail_EN",
          "source": "left-rail-rung_main_666dcd36-b65c-4ae2-99f7-280020d7b180",
          "target": "BLOCK_3d2c9e20-81c5-4917-a5d4-465c1f480446",
          "sourceHandle": "left-rail",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_3d2c9e20-81c5-4917-a5d4-465c1f480446_right-rail-rung_main_666dcd36-b65c-4ae2-99f7-280020d7b180__ENO_right-rail",
          "source": "BLOCK_3d2c9e20-81c5-4917-a5d4-465c1f480446",
          "target": "right-rail-rung_main_666dcd36-b65c-4ae2-99f7-280020d7b180",
          "sourceHandle": "ENO",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_VARIABLE_44f97fd8-5b85-4b12-98b4-57c6df223604_BLOCK_3d2c9e20-81c5-4917-a5d4-465c1f480446__output_entra",
          "source": "VARIABLE_44f97fd8-5b85-4b12-98b4-57c6df223604",
          "target": "BLOCK_3d2c9e20-81c5-4917-a5d4-465c1f480446",
          "sourceHandle": "output",
          "targetHandle": "entra"
        },
        {
          "id": "e_BLOCK_3d2c9e20-81c5-4917-a5d4-465c1f480446_VARIABLE_f43d093f-5515-4f78-8dc6-ecadd6727924__OUT_input",
          "source": "BLOCK_3d2c9e20-81c5-4917-a5d4-465c1f480446",
          "target": "VARIABLE_f43d093f-5515-4f78-8dc6-ecadd6727924",
          "sourceHandle": "OUT",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_3d2c9e20-81c5-4917-a5d4-465c1f480446_VARIABLE_ad3d2871-1b40-4021-a4e1-7918b6c50f70__sai_input",
          "source": "BLOCK_3d2c9e20-81c5-4917-a5d4-465c1f480446",
          "target": "VARIABLE_ad3d2871-1b40-4021-a4e1-7918b6c50f70",
          "sourceHandle": "sai",
          "targetHandle": "input"
        }
      ],
      "selectedNodes": [],
      "handleBranches": []
    },
    {
      "id": "rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3a",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        670,
        174
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3a",
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
              },
              {
                "glbPosition": {
                  "x": 3,
                  "y": 130
                },
                "relPosition": {
                  "x": 3,
                  "y": 100
                },
                "id": "branch_BLOCK_1434ffb3-0270-4e80-a797-3f49248657ee_contar",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 100,
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
              },
              {
                "glbPosition": {
                  "x": 3,
                  "y": 130
                },
                "relPosition": {
                  "x": 3,
                  "y": 100
                },
                "id": "branch_BLOCK_1434ffb3-0270-4e80-a797-3f49248657ee_contar",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 100,
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
            "numericId": "8420040",
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
          "id": "BLOCK_1434ffb3-0270-4e80-a797-3f49248657ee",
          "type": "block",
          "position": {
            "x": 257,
            "y": 14
          },
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 257,
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
                  "x": 257,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "contar",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 407,
                  "y": 50
                },
                "relPosition": {
                  "x": 150,
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
                  "x": 407,
                  "y": 130
                },
                "relPosition": {
                  "x": 150,
                  "y": 116
                },
                "id": "valor",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 257,
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
                  "x": 257,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "contar",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 407,
                  "y": 50
                },
                "relPosition": {
                  "x": 150,
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
                  "x": 407,
                  "y": 130
                },
                "relPosition": {
                  "x": 150,
                  "y": 116
                },
                "id": "valor",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 257,
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
                "x": 407,
                "y": 50
              },
              "relPosition": {
                "x": 150,
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
            "numericId": "6766972",
            "variant": {
              "name": "meu_contador",
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
                  "name": "contar",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "valor",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "documentation": "",
                  "debug": false,
                  "initialValue": "0"
                },
                {
                  "name": "memoria",
                  "class": "local",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "documentation": "",
                  "debug": false
                }
              ]
            },
            "variable": {
              "id": "942e3047-cb44-481a-b9cc-3bb98edb99b7",
              "name": "MEU_CONTADOR0",
              "type": {
                "definition": "derived",
                "value": "meu_contador"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": true,
            "connectedVariables": [
              {
                "handleId": "valor",
                "type": "output",
                "variable": {
                  "name": "cnt1",
                  "class": "external",
                  "type": {
                    "definition": "base-type",
                    "value": "INT"
                  },
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
          "width": 150,
          "height": 140,
          "measured": {
            "width": 150,
            "height": 140
          },
          "draggable": true,
          "selectable": true,
          "selected": false,
          "dragging": false
        },
        {
          "id": "CONTACT_a748461a-24d2-40e3-a81c-c56f0e2c3482",
          "type": "contact",
          "position": {
            "x": 68,
            "y": 118
          },
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 92,
                  "y": 130
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "risingEdge",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 92,
                  "y": 130
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 68,
                "y": 130
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 92,
                "y": 130
              },
              "relPosition": {
                "x": 24,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "6251048",
            "variable": {
              "id": "",
              "name": "bt1",
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
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "branchContext": {
              "blockId": "BLOCK_1434ffb3-0270-4e80-a797-3f49248657ee",
              "handleId": "contar",
              "direction": "input"
            }
          },
          "width": 24,
          "height": 24,
          "measured": {
            "width": 24,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "selected": false,
          "dragging": false
        },
        {
          "id": "right-rail-rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3a",
          "type": "powerRail",
          "position": {
            "x": 667,
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
                "x": 667
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
            "numericId": "4537402",
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
          "id": "VARIABLE_364d5554-3dab-4ace-a3b9-533849f66eb2",
          "type": "variable",
          "position": {
            "x": 437,
            "y": 114
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
                  "x": 437,
                  "y": 130
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
                  "x": 437,
                  "y": 130
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
                "x": 437,
                "y": 130
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
            "numericId": "4810297",
            "variable": {
              "name": "cnt1",
              "class": "external",
              "type": {
                "definition": "base-type",
                "value": "INT"
              },
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_1434ffb3-0270-4e80-a797-3f49248657ee",
              "handleId": "valor",
              "variableType": {
                "name": "valor",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "documentation": "",
                "debug": false,
                "initialValue": "0"
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
          "id": "e_left-rail-rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3a_BLOCK_1434ffb3-0270-4e80-a797-3f49248657ee__left-rail_EN",
          "source": "left-rail-rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3a",
          "target": "BLOCK_1434ffb3-0270-4e80-a797-3f49248657ee",
          "sourceHandle": "left-rail",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_1434ffb3-0270-4e80-a797-3f49248657ee_right-rail-rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3a__ENO_right-rail",
          "source": "BLOCK_1434ffb3-0270-4e80-a797-3f49248657ee",
          "target": "right-rail-rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3a",
          "sourceHandle": "ENO",
          "targetHandle": "right-rail"
        },
        {
          "id": "reactflow__edge-left-rail-rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3abranch_BLOCK_1434ffb3-0270-4e80-a797-3f49248657ee_contar-CONTACT_a748461a-24d2-40e3-a81c-c56f0e2c3482input",
          "source": "left-rail-rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3a",
          "target": "CONTACT_a748461a-24d2-40e3-a81c-c56f0e2c3482",
          "sourceHandle": "branch_BLOCK_1434ffb3-0270-4e80-a797-3f49248657ee_contar",
          "targetHandle": "input"
        },
        {
          "id": "reactflow__edge-CONTACT_a748461a-24d2-40e3-a81c-c56f0e2c3482output-BLOCK_1434ffb3-0270-4e80-a797-3f49248657eecontar",
          "source": "CONTACT_a748461a-24d2-40e3-a81c-c56f0e2c3482",
          "target": "BLOCK_1434ffb3-0270-4e80-a797-3f49248657ee",
          "sourceHandle": "output",
          "targetHandle": "contar"
        },
        {
          "id": "e_BLOCK_1434ffb3-0270-4e80-a797-3f49248657ee_VARIABLE_364d5554-3dab-4ace-a3b9-533849f66eb2__valor_input",
          "source": "BLOCK_1434ffb3-0270-4e80-a797-3f49248657ee",
          "target": "VARIABLE_364d5554-3dab-4ace-a3b9-533849f66eb2",
          "sourceHandle": "valor",
          "targetHandle": "input"
        }
      ],
      "selectedNodes": [],
      "handleBranches": [
        {
          "blockId": "BLOCK_1434ffb3-0270-4e80-a797-3f49248657ee",
          "handleId": "contar",
          "direction": "input",
          "nodeIds": [
            "CONTACT_a748461a-24d2-40e3-a81c-c56f0e2c3482"
          ]
        }
      ]
    },
    {
      "id": "rung_main_a8739ea2-5cca-48a7-b991-019b5d667518",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        670,
        174
      ],
      "selectedNodes": [],
      "nodes": [
        {
          "id": "left-rail-rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3a",
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
              },
              {
                "glbPosition": {
                  "x": 3,
                  "y": 130
                },
                "relPosition": {
                  "x": 3,
                  "y": 100
                },
                "id": "branch_BLOCK_3dc5a56c-8619-428a-b5b0-1bd5d8c4fe70_contar",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 100,
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
              },
              {
                "glbPosition": {
                  "x": 3,
                  "y": 130
                },
                "relPosition": {
                  "x": 3,
                  "y": 100
                },
                "id": "branch_BLOCK_3dc5a56c-8619-428a-b5b0-1bd5d8c4fe70_contar",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 100,
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
            "numericId": "4036019",
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
          "id": "BLOCK_3dc5a56c-8619-428a-b5b0-1bd5d8c4fe70",
          "type": "block",
          "position": {
            "x": 257,
            "y": 14
          },
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 257,
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
                  "x": 257,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "contar",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 407,
                  "y": 50
                },
                "relPosition": {
                  "x": 150,
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
                  "x": 407,
                  "y": 130
                },
                "relPosition": {
                  "x": 150,
                  "y": 116
                },
                "id": "valor",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 257,
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
                  "x": 257,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "contar",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 407,
                  "y": 50
                },
                "relPosition": {
                  "x": 150,
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
                  "x": 407,
                  "y": 130
                },
                "relPosition": {
                  "x": 150,
                  "y": 116
                },
                "id": "valor",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 257,
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
                "x": 407,
                "y": 50
              },
              "relPosition": {
                "x": 150,
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
            "numericId": "1155843",
            "variant": {
              "name": "meu_contador",
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
                  "name": "contar",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "valor",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "documentation": "",
                  "debug": false,
                  "initialValue": "0"
                },
                {
                  "name": "memoria",
                  "class": "local",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "documentation": "",
                  "debug": false
                }
              ]
            },
            "variable": {
              "id": "65a54a1f-9e53-49b0-8bb9-ddaae637303b",
              "name": "MEU_CONTADOR1",
              "type": {
                "definition": "derived",
                "value": "meu_contador"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": true,
            "connectedVariables": [
              {
                "handleId": "valor",
                "type": "output",
                "variable": {
                  "name": "cnt2",
                  "class": "external",
                  "type": {
                    "definition": "base-type",
                    "value": "INT"
                  },
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
          "width": 150,
          "height": 140,
          "measured": {
            "width": 150,
            "height": 140
          },
          "draggable": true,
          "selectable": true,
          "selected": false,
          "dragging": false
        },
        {
          "id": "CONTACT_1d9e1cf2-0eb8-482a-ab08-80f729864e6b",
          "type": "contact",
          "position": {
            "x": 68,
            "y": 118
          },
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 92,
                  "y": 130
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "risingEdge",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 68,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 92,
                  "y": 130
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 68,
                "y": 130
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 92,
                "y": 130
              },
              "relPosition": {
                "x": 24,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "5833149",
            "variable": {
              "id": "",
              "name": "bt2",
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
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "branchContext": {
              "blockId": "BLOCK_3dc5a56c-8619-428a-b5b0-1bd5d8c4fe70",
              "handleId": "contar",
              "direction": "input"
            }
          },
          "width": 24,
          "height": 24,
          "measured": {
            "width": 24,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "selected": false,
          "dragging": false
        },
        {
          "id": "right-rail-rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3a",
          "type": "powerRail",
          "position": {
            "x": 667,
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
                "x": 667
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
                },
                "x": 667
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
            "numericId": "1877908",
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
          "id": "VARIABLE_aaaa03ad-5b7f-490a-89d3-3c8acee2972c",
          "type": "variable",
          "position": {
            "x": 437,
            "y": 114
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
                  "x": 437,
                  "y": 130
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
                  "x": 437,
                  "y": 130
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
                "x": 437,
                "y": 130
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
            "numericId": "7388620",
            "variable": {
              "name": "cnt2",
              "class": "external",
              "type": {
                "definition": "base-type",
                "value": "INT"
              },
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_3dc5a56c-8619-428a-b5b0-1bd5d8c4fe70",
              "handleId": "valor",
              "variableType": {
                "name": "valor",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "documentation": "",
                "debug": false,
                "initialValue": "0"
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
          "id": "e_left-rail-rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3a_BLOCK_3dc5a56c-8619-428a-b5b0-1bd5d8c4fe70__left-rail_EN",
          "source": "left-rail-rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3a",
          "target": "BLOCK_3dc5a56c-8619-428a-b5b0-1bd5d8c4fe70",
          "sourceHandle": "left-rail",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_3dc5a56c-8619-428a-b5b0-1bd5d8c4fe70_right-rail-rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3a__ENO_right-rail",
          "source": "BLOCK_3dc5a56c-8619-428a-b5b0-1bd5d8c4fe70",
          "target": "right-rail-rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3a",
          "sourceHandle": "ENO",
          "targetHandle": "right-rail"
        },
        {
          "id": "reactflow__edge-left-rail-rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3abranch_BLOCK_3dc5a56c-8619-428a-b5b0-1bd5d8c4fe70_contar-CONTACT_1d9e1cf2-0eb8-482a-ab08-80f729864e6binput",
          "source": "left-rail-rung_main_f04d697a-cdbc-4ccd-81f4-b13e55d5fd3a",
          "target": "CONTACT_1d9e1cf2-0eb8-482a-ab08-80f729864e6b",
          "sourceHandle": "branch_BLOCK_3dc5a56c-8619-428a-b5b0-1bd5d8c4fe70_contar",
          "targetHandle": "input"
        },
        {
          "id": "reactflow__edge-CONTACT_1d9e1cf2-0eb8-482a-ab08-80f729864e6boutput-BLOCK_3dc5a56c-8619-428a-b5b0-1bd5d8c4fe70contar",
          "source": "CONTACT_1d9e1cf2-0eb8-482a-ab08-80f729864e6b",
          "target": "BLOCK_3dc5a56c-8619-428a-b5b0-1bd5d8c4fe70",
          "sourceHandle": "output",
          "targetHandle": "contar"
        },
        {
          "id": "e_BLOCK_3dc5a56c-8619-428a-b5b0-1bd5d8c4fe70_VARIABLE_aaaa03ad-5b7f-490a-89d3-3c8acee2972c__valor_input",
          "source": "BLOCK_3dc5a56c-8619-428a-b5b0-1bd5d8c4fe70",
          "target": "VARIABLE_aaaa03ad-5b7f-490a-89d3-3c8acee2972c",
          "sourceHandle": "valor",
          "targetHandle": "input"
        }
      ],
      "handleBranches": [
        {
          "blockId": "BLOCK_3dc5a56c-8619-428a-b5b0-1bd5d8c4fe70",
          "handleId": "contar",
          "direction": "input",
          "nodeIds": [
            "CONTACT_1d9e1cf2-0eb8-482a-ab08-80f729864e6b"
          ]
        }
      ]
    },
    {
      "id": "rung_main_b5868c17-45e7-448b-b890-6bb9d025dc3b",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        502,
        120
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_b5868c17-45e7-448b-b890-6bb9d025dc3b",
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
            "numericId": "507164",
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
          "id": "BLOCK_a8d1a5dc-b316-44f0-affe-b5cec61582fe",
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
                  "x": 239,
                  "y": 50
                },
                "relPosition": {
                  "x": 96,
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
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 239,
                  "y": 50
                },
                "relPosition": {
                  "x": 96,
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
                "x": 239,
                "y": 50
              },
              "relPosition": {
                "x": 96,
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
            "numericId": "2415307",
            "variant": {
              "name": "servidor",
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
                }
              ],
              "documentation": "",
              "extensible": false
            },
            "variable": {
              "id": "80988c69-a537-482f-8868-6183a831c7c8",
              "name": "SERVIDOR0",
              "type": {
                "definition": "derived",
                "value": "servidor"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": true,
            "connectedVariables": [],
            "draggable": true,
            "selectable": true,
            "deletable": true
          },
          "width": 96,
          "height": 60,
          "measured": {
            "width": 96,
            "height": 60
          },
          "draggable": true,
          "selectable": true,
          "selected": false,
          "dragging": false
        },
        {
          "id": "right-rail-rung_main_b5868c17-45e7-448b-b890-6bb9d025dc3b",
          "type": "powerRail",
          "position": {
            "x": 499,
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
                "x": 499
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
            "numericId": "1423082",
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
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_b5868c17-45e7-448b-b890-6bb9d025dc3b_BLOCK_a8d1a5dc-b316-44f0-affe-b5cec61582fe__left-rail_EN",
          "source": "left-rail-rung_main_b5868c17-45e7-448b-b890-6bb9d025dc3b",
          "target": "BLOCK_a8d1a5dc-b316-44f0-affe-b5cec61582fe",
          "sourceHandle": "left-rail",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_a8d1a5dc-b316-44f0-affe-b5cec61582fe_right-rail-rung_main_b5868c17-45e7-448b-b890-6bb9d025dc3b__ENO_right-rail",
          "source": "BLOCK_a8d1a5dc-b316-44f0-affe-b5cec61582fe",
          "target": "right-rail-rung_main_b5868c17-45e7-448b-b890-6bb9d025dc3b",
          "sourceHandle": "ENO",
          "targetHandle": "right-rail"
        }
      ],
      "selectedNodes": [],
      "handleBranches": []
    }
  ]
}
END_PROGRAM