PROGRAM main
  VAR
    ain0 : WORD AT %IW0;
    aout0 : WORD AT %QW0;
    bt1 : BOOL AT %IX0.0;
    bt2 : BOOL AT %IX0.1;
    valor_conta1 : INT;
    valor_conta2 : INT;
    MEU_CONTATOR0 : meu_contator;
    valor_conta3 : WORD;
    MEU_CONTATOR1 : meu_contator;
  END_VAR

{
  "name": "main",
  "rungs": [
    {
      "id": "rung_main_7dd57394-de8a-49f1-937e-58ea9eeb97c0",
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
          "id": "left-rail-rung_main_7dd57394-de8a-49f1-937e-58ea9eeb97c0",
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
            "numericId": "9733428",
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
          "id": "BLOCK_b02bb786-b746-4363-b714-053c07b41e97",
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
            "numericId": "8725995",
            "variant": {
              "name": "meu_move",
              "documentation": "",
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
                  "name": "OUT",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "location": "",
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "entra",
                  "class": "input",
                  "type": {
                    "value": "WORD",
                    "definition": "base-type"
                  },
                  "location": "",
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "sai",
                  "class": "output",
                  "type": {
                    "value": "WORD",
                    "definition": "base-type"
                  },
                  "location": "",
                  "documentation": "",
                  "debug": false
                }
              ]
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
                  "name": "ain0",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "WORD"
                  },
                  "location": "%IW0",
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "sai",
                "type": "output",
                "variable": {
                  "name": "aout0",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "WORD"
                  },
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
          "id": "right-rail-rung_main_7dd57394-de8a-49f1-937e-58ea9eeb97c0",
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
            "numericId": "7955339",
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
          "id": "VARIABLE_d9694ca0-123b-4572-8d4a-d157dbfd860b",
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
            "numericId": "6871133",
            "variable": {
              "name": "ain0",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "WORD"
              },
              "location": "%IW0",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_b02bb786-b746-4363-b714-053c07b41e97",
              "handleId": "entra",
              "variableType": {
                "name": "entra",
                "class": "input",
                "type": {
                  "value": "WORD",
                  "definition": "base-type"
                },
                "location": "",
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
          "id": "VARIABLE_895efac2-6513-4814-972f-42febc696f7c",
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
            "numericId": "8985121",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b02bb786-b746-4363-b714-053c07b41e97",
              "handleId": "OUT",
              "variableType": {
                "name": "OUT",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                },
                "location": "",
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
          "id": "VARIABLE_7a128844-2168-4765-a0fd-b5d3ed7df8ee",
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
            "numericId": "3005628",
            "variable": {
              "name": "aout0",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "WORD"
              },
              "location": "%QW0",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b02bb786-b746-4363-b714-053c07b41e97",
              "handleId": "sai",
              "variableType": {
                "name": "sai",
                "class": "output",
                "type": {
                  "value": "WORD",
                  "definition": "base-type"
                },
                "location": "",
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
          "id": "e_left-rail-rung_main_7dd57394-de8a-49f1-937e-58ea9eeb97c0_BLOCK_b02bb786-b746-4363-b714-053c07b41e97__left-rail_EN",
          "source": "left-rail-rung_main_7dd57394-de8a-49f1-937e-58ea9eeb97c0",
          "target": "BLOCK_b02bb786-b746-4363-b714-053c07b41e97",
          "sourceHandle": "left-rail",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_b02bb786-b746-4363-b714-053c07b41e97_right-rail-rung_main_7dd57394-de8a-49f1-937e-58ea9eeb97c0__ENO_right-rail",
          "source": "BLOCK_b02bb786-b746-4363-b714-053c07b41e97",
          "target": "right-rail-rung_main_7dd57394-de8a-49f1-937e-58ea9eeb97c0",
          "sourceHandle": "ENO",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_VARIABLE_d9694ca0-123b-4572-8d4a-d157dbfd860b_BLOCK_b02bb786-b746-4363-b714-053c07b41e97__output_entra",
          "source": "VARIABLE_d9694ca0-123b-4572-8d4a-d157dbfd860b",
          "target": "BLOCK_b02bb786-b746-4363-b714-053c07b41e97",
          "sourceHandle": "output",
          "targetHandle": "entra"
        },
        {
          "id": "e_BLOCK_b02bb786-b746-4363-b714-053c07b41e97_VARIABLE_895efac2-6513-4814-972f-42febc696f7c__OUT_input",
          "source": "BLOCK_b02bb786-b746-4363-b714-053c07b41e97",
          "target": "VARIABLE_895efac2-6513-4814-972f-42febc696f7c",
          "sourceHandle": "OUT",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b02bb786-b746-4363-b714-053c07b41e97_VARIABLE_7a128844-2168-4765-a0fd-b5d3ed7df8ee__sai_input",
          "source": "BLOCK_b02bb786-b746-4363-b714-053c07b41e97",
          "target": "VARIABLE_7a128844-2168-4765-a0fd-b5d3ed7df8ee",
          "sourceHandle": "sai",
          "targetHandle": "input"
        }
      ],
      "selectedNodes": []
    },
    {
      "id": "rung_main_39d047f7-098f-4f39-b039-7313c7782560",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        694,
        174
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_39d047f7-098f-4f39-b039-7313c7782560",
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
                "id": "branch_BLOCK_fe3d0141-0a70-4746-961e-dd226db3178e_conta",
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
                "id": "branch_BLOCK_fe3d0141-0a70-4746-961e-dd226db3178e_conta",
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
            "numericId": "8641911",
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
          "id": "BLOCK_fe3d0141-0a70-4746-961e-dd226db3178e",
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
                "id": "conta",
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
                  "x": 431,
                  "y": 50
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 431,
                  "y": 130
                },
                "relPosition": {
                  "x": 174,
                  "y": 116
                },
                "id": "contagem",
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
                "id": "conta",
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
                  "x": 431,
                  "y": 50
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 431,
                  "y": 130
                },
                "relPosition": {
                  "x": 174,
                  "y": 116
                },
                "id": "contagem",
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
                "x": 431,
                "y": 50
              },
              "relPosition": {
                "x": 174,
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
            "numericId": "10385579",
            "variant": {
              "name": "meu_contator",
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
                  "name": "conta",
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
                  "name": "contagem",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "mem",
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
              "id": "c9e519fa-4024-4dd5-87dc-16e5efb3b1c7",
              "name": "MEU_CONTATOR0",
              "type": {
                "definition": "derived",
                "value": "meu_contator"
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
                "handleId": "contagem",
                "type": "output",
                "variable": {
                  "name": "valor_conta1",
                  "class": "local",
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
          "width": 174,
          "height": 140,
          "measured": {
            "width": 174,
            "height": 140
          },
          "draggable": true,
          "selectable": true,
          "selected": false,
          "dragging": false
        },
        {
          "id": "CONTACT_2e55b23a-9e14-4e70-af99-1047c888e82e",
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
            "variant": "default",
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
            "numericId": "10009248",
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
              "blockId": "BLOCK_fe3d0141-0a70-4746-961e-dd226db3178e",
              "handleId": "conta",
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
          "id": "right-rail-rung_main_39d047f7-098f-4f39-b039-7313c7782560",
          "type": "powerRail",
          "position": {
            "x": 691,
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
                "x": 691
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
            "numericId": "360994",
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
          "id": "VARIABLE_0574c730-6c8c-43c1-a753-8bf27a471b94",
          "type": "variable",
          "position": {
            "x": 461,
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
                  "x": 461,
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
                  "x": 461,
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
                "x": 461,
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
            "numericId": "3924723",
            "variable": {
              "name": "valor_conta1",
              "class": "local",
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
              "id": "BLOCK_fe3d0141-0a70-4746-961e-dd226db3178e",
              "handleId": "contagem",
              "variableType": {
                "name": "contagem",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
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
          "id": "e_left-rail-rung_main_39d047f7-098f-4f39-b039-7313c7782560_BLOCK_fe3d0141-0a70-4746-961e-dd226db3178e__left-rail_EN",
          "source": "left-rail-rung_main_39d047f7-098f-4f39-b039-7313c7782560",
          "target": "BLOCK_fe3d0141-0a70-4746-961e-dd226db3178e",
          "sourceHandle": "left-rail",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_fe3d0141-0a70-4746-961e-dd226db3178e_right-rail-rung_main_39d047f7-098f-4f39-b039-7313c7782560__ENO_right-rail",
          "source": "BLOCK_fe3d0141-0a70-4746-961e-dd226db3178e",
          "target": "right-rail-rung_main_39d047f7-098f-4f39-b039-7313c7782560",
          "sourceHandle": "ENO",
          "targetHandle": "right-rail"
        },
        {
          "id": "reactflow__edge-left-rail-rung_main_39d047f7-098f-4f39-b039-7313c7782560branch_BLOCK_fe3d0141-0a70-4746-961e-dd226db3178e_conta-CONTACT_2e55b23a-9e14-4e70-af99-1047c888e82einput",
          "source": "left-rail-rung_main_39d047f7-098f-4f39-b039-7313c7782560",
          "target": "CONTACT_2e55b23a-9e14-4e70-af99-1047c888e82e",
          "sourceHandle": "branch_BLOCK_fe3d0141-0a70-4746-961e-dd226db3178e_conta",
          "targetHandle": "input"
        },
        {
          "id": "reactflow__edge-CONTACT_2e55b23a-9e14-4e70-af99-1047c888e82eoutput-BLOCK_fe3d0141-0a70-4746-961e-dd226db3178econta",
          "source": "CONTACT_2e55b23a-9e14-4e70-af99-1047c888e82e",
          "target": "BLOCK_fe3d0141-0a70-4746-961e-dd226db3178e",
          "sourceHandle": "output",
          "targetHandle": "conta"
        },
        {
          "id": "e_BLOCK_fe3d0141-0a70-4746-961e-dd226db3178e_VARIABLE_0574c730-6c8c-43c1-a753-8bf27a471b94__contagem_input",
          "source": "BLOCK_fe3d0141-0a70-4746-961e-dd226db3178e",
          "target": "VARIABLE_0574c730-6c8c-43c1-a753-8bf27a471b94",
          "sourceHandle": "contagem",
          "targetHandle": "input"
        }
      ],
      "selectedNodes": [],
      "handleBranches": [
        {
          "blockId": "BLOCK_fe3d0141-0a70-4746-961e-dd226db3178e",
          "handleId": "conta",
          "direction": "input",
          "nodeIds": [
            "CONTACT_2e55b23a-9e14-4e70-af99-1047c888e82e"
          ]
        }
      ]
    },
    {
      "id": "rung_main_dbe8b8af-acec-472e-8695-8ff298b8af33",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        694,
        174
      ],
      "selectedNodes": [],
      "nodes": [
        {
          "id": "left-rail-rung_main_39d047f7-098f-4f39-b039-7313c7782560",
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
                "id": "branch_BLOCK_fbe0e2a5-07f4-4c82-a20c-6766c34c2d20_conta",
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
                "id": "branch_BLOCK_fbe0e2a5-07f4-4c82-a20c-6766c34c2d20_conta",
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
            "numericId": "4074084",
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
          "id": "BLOCK_fbe0e2a5-07f4-4c82-a20c-6766c34c2d20",
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
                "id": "conta",
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
                  "x": 431,
                  "y": 50
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 431,
                  "y": 130
                },
                "relPosition": {
                  "x": 174,
                  "y": 116
                },
                "id": "contagem",
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
                "id": "conta",
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
                  "x": 431,
                  "y": 50
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 431,
                  "y": 130
                },
                "relPosition": {
                  "x": 174,
                  "y": 116
                },
                "id": "contagem",
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
                "x": 431,
                "y": 50
              },
              "relPosition": {
                "x": 174,
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
            "numericId": "2279585",
            "variant": {
              "name": "meu_contator",
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
                  "name": "conta",
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
                  "name": "contagem",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "mem",
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
              "id": "cf8ad942-07a4-4c80-9967-4e222a662531",
              "name": "MEU_CONTATOR1",
              "type": {
                "definition": "derived",
                "value": "meu_contator"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": false,
            "connectedVariables": [
              {
                "handleId": "contagem",
                "type": "output",
                "variable": {
                  "name": "valor_conta2",
                  "class": "local",
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
          "width": 174,
          "height": 140,
          "measured": {
            "width": 174,
            "height": 140
          },
          "draggable": true,
          "selectable": true,
          "selected": false,
          "dragging": false
        },
        {
          "id": "CONTACT_73c14dc6-1caf-4a45-9cd3-8e4924a4ea83",
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
            "variant": "default",
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
            "numericId": "3701304",
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
              "blockId": "BLOCK_fbe0e2a5-07f4-4c82-a20c-6766c34c2d20",
              "handleId": "conta",
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
          "id": "right-rail-rung_main_39d047f7-098f-4f39-b039-7313c7782560",
          "type": "powerRail",
          "position": {
            "x": 691,
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
                "x": 691
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
                "x": 691
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
            "numericId": "8764352",
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
          "id": "VARIABLE_389aa72a-b455-4bee-bd63-8430c933fb0d",
          "type": "variable",
          "position": {
            "x": 461,
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
                  "x": 461,
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
                  "x": 461,
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
                "x": 461,
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
            "numericId": "3177283",
            "variable": {
              "name": "valor_conta2",
              "class": "local",
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
              "id": "BLOCK_fbe0e2a5-07f4-4c82-a20c-6766c34c2d20",
              "handleId": "contagem",
              "variableType": {
                "name": "contagem",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
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
          "id": "e_left-rail-rung_main_39d047f7-098f-4f39-b039-7313c7782560_BLOCK_fbe0e2a5-07f4-4c82-a20c-6766c34c2d20__left-rail_EN",
          "source": "left-rail-rung_main_39d047f7-098f-4f39-b039-7313c7782560",
          "target": "BLOCK_fbe0e2a5-07f4-4c82-a20c-6766c34c2d20",
          "sourceHandle": "left-rail",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_fbe0e2a5-07f4-4c82-a20c-6766c34c2d20_right-rail-rung_main_39d047f7-098f-4f39-b039-7313c7782560__ENO_right-rail",
          "source": "BLOCK_fbe0e2a5-07f4-4c82-a20c-6766c34c2d20",
          "target": "right-rail-rung_main_39d047f7-098f-4f39-b039-7313c7782560",
          "sourceHandle": "ENO",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_left-rail-rung_main_39d047f7-098f-4f39-b039-7313c7782560_CONTACT_73c14dc6-1caf-4a45-9cd3-8e4924a4ea83__branch_BLOCK_fbe0e2a5-07f4-4c82-a20c-6766c34c2d20_conta_input",
          "source": "left-rail-rung_main_39d047f7-098f-4f39-b039-7313c7782560",
          "target": "CONTACT_73c14dc6-1caf-4a45-9cd3-8e4924a4ea83",
          "sourceHandle": "branch_BLOCK_fbe0e2a5-07f4-4c82-a20c-6766c34c2d20_conta",
          "targetHandle": "input"
        },
        {
          "id": "e_CONTACT_73c14dc6-1caf-4a45-9cd3-8e4924a4ea83_BLOCK_fbe0e2a5-07f4-4c82-a20c-6766c34c2d20__output_conta",
          "source": "CONTACT_73c14dc6-1caf-4a45-9cd3-8e4924a4ea83",
          "target": "BLOCK_fbe0e2a5-07f4-4c82-a20c-6766c34c2d20",
          "sourceHandle": "output",
          "targetHandle": "conta"
        },
        {
          "id": "e_BLOCK_fbe0e2a5-07f4-4c82-a20c-6766c34c2d20_VARIABLE_389aa72a-b455-4bee-bd63-8430c933fb0d__contagem_input",
          "source": "BLOCK_fbe0e2a5-07f4-4c82-a20c-6766c34c2d20",
          "target": "VARIABLE_389aa72a-b455-4bee-bd63-8430c933fb0d",
          "sourceHandle": "contagem",
          "targetHandle": "input"
        }
      ],
      "handleBranches": [
        {
          "blockId": "BLOCK_fbe0e2a5-07f4-4c82-a20c-6766c34c2d20",
          "handleId": "conta",
          "direction": "input",
          "nodeIds": [
            "CONTACT_73c14dc6-1caf-4a45-9cd3-8e4924a4ea83"
          ]
        }
      ]
    }
  ]
}
END_PROGRAM