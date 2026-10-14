{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 8,
   "minor": 6,
   "revision": 4,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   30.0,
   70.0,
   1500.0,
   1150.0
  ],
  "bglocked": 0,
  "openinpresentation": 1,
  "default_fontsize": 10.0,
  "default_fontface": 0,
  "default_fontname": "Arial Bold",
  "gridonopen": 1,
  "gridsize": [
   8.0,
   8.0
  ],
  "gridsnaponopen": 1,
  "objectsnaponopen": 1,
  "statusbarvisible": 2,
  "toolbarvisible": 1,
  "lefttoolbarpinned": 0,
  "toptoolbarpinned": 0,
  "righttoolbarpinned": 0,
  "bottomtoolbarpinned": 0,
  "toolbars_unpinned_last_save": 0,
  "tallnewobj": 0,
  "boxanimatetime": 200,
  "enablehscroll": 1,
  "enablevscroll": 1,
  "devicewidth": 1118.0,
  "description": "",
  "digest": "",
  "tags": "",
  "style": "",
  "subpatcher_template": "",
  "assistshowspatchername": 0,
  "boxes": [
   {
    "box": {
     "maxclass": "panel",
     "id": "obj-zone-panel",
     "numinlets": 1,
     "numoutlets": 0,
     "background": 1,
     "ignoreclick": 1,
     "bgcolor": [
      0.314,
      0.549,
      1.0,
      0.1
     ],
     "border": 0,
     "rounded": 5,
     "presentation": 1,
     "presentation_rect": [
      403,
      1,
      286,
      167
     ],
     "patching_rect": [
      1120,
      1160,
      24,
      24
     ]
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "id": "obj-zone-glob",
     "numinlets": 1,
     "numoutlets": 0,
     "background": 1,
     "ignoreclick": 1,
     "bgcolor": [
      1.0,
      0.706,
      0.235,
      0.1
     ],
     "border": 0,
     "rounded": 5,
     "presentation": 1,
     "presentation_rect": [
      691,
      1,
      278,
      78
     ],
     "patching_rect": [
      1154,
      1160,
      24,
      24
     ]
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "id": "obj-zone-mem",
     "numinlets": 1,
     "numoutlets": 0,
     "background": 1,
     "ignoreclick": 1,
     "bgcolor": [
      0.667,
      0.431,
      1.0,
      0.1
     ],
     "border": 0,
     "rounded": 5,
     "presentation": 1,
     "presentation_rect": [
      691,
      81,
      278,
      87
     ],
     "patching_rect": [
      1188,
      1160,
      24,
      24
     ]
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "id": "obj-zone-det",
     "numinlets": 1,
     "numoutlets": 0,
     "background": 1,
     "ignoreclick": 1,
     "bgcolor": [
      0.353,
      0.784,
      0.471,
      0.1
     ],
     "border": 0,
     "rounded": 5,
     "presentation": 1,
     "presentation_rect": [
      973,
      1,
      46,
      167
     ],
     "patching_rect": [
      1222,
      1160,
      24,
      24
     ]
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "id": "obj-zone-out",
     "numinlets": 1,
     "numoutlets": 0,
     "background": 1,
     "ignoreclick": 1,
     "bgcolor": [
      1.0,
      0.431,
      0.431,
      0.1
     ],
     "border": 0,
     "rounded": 5,
     "presentation": 1,
     "presentation_rect": [
      1023,
      1,
      94,
      167
     ],
     "patching_rect": [
      1256,
      1160,
      24,
      24
     ]
    }
   },
   {
    "box": {
     "maxclass": "panel",
     "id": "obj-zone-frame",
     "numinlets": 1,
     "numoutlets": 0,
     "background": 1,
     "ignoreclick": 1,
     "bgcolor": [
      0,
      0,
      0,
      0
     ],
     "border": 1,
     "bordercolor": [
      0.431,
      0.784,
      0.843,
      1.0
     ],
     "rounded": 0,
     "presentation": 1,
     "presentation_rect": [
      403,
      21,
      284,
      147
     ],
     "patching_rect": [
      1290,
      1160,
      24,
      24
     ]
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "WANDERER  \u00b7  Max for Live Instrument  \u00b7  see the Wanderer spec for the full design",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      4,
      700,
      20.0
     ],
     "fontsize": 12.0,
     "id": "obj-1"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "1 \u00b7 TIME \u2014 transport, tempo, conductor",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      36,
      300,
      20.0
     ],
     "fontsize": 10.0,
     "id": "obj-2"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "live.thisdevice",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "bang",
      "int",
      "int"
     ],
     "patching_rect": [
      20,
      60,
      107,
      22.0
     ],
     "id": "obj-3"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "path live_set",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      90,
      94,
      22.0
     ],
     "id": "obj-4"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "live.path",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "patching_rect": [
      20,
      120,
      69,
      22.0
     ],
     "id": "obj-5"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "live.observer is_playing",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      20,
      160,
      162,
      22.0
     ],
     "id": "obj-6"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "live.observer tempo",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      200,
      160,
      131,
      22.0
     ],
     "id": "obj-7"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend playing",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      190,
      107,
      22.0
     ],
     "id": "obj-8"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend tempo",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200,
      190,
      94,
      22.0
     ],
     "id": "obj-9"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      200,
      220,
      76,
      22.0
     ],
     "id": "obj-10"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "phasor~ 1n @lock 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      20,
      240,
      125,
      22.0
     ],
     "id": "obj-11"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "wanderer.conductor",
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      20,
      280,
      220,
      22.0
     ],
     "id": "obj-12"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "edge~",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "bang"
     ],
     "patching_rect": [
      240,
      320,
      45,
      22.0
     ],
     "id": "obj-13"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "t slidedone",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      240,
      350,
      82,
      22.0
     ],
     "id": "obj-14"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      240,
      380,
      76,
      22.0
     ],
     "id": "obj-15"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "2 \u00b7 VOICES \u2014 16 file slots",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      420,
      300,
      20.0
     ],
     "fontsize": 10.0,
     "id": "obj-16"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "r ---poly",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      444,
      69,
      22.0
     ],
     "id": "obj-17"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "poly~ wanderer.voice 16",
     "numinlets": 3,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patching_rect": [
      20,
      474,
      230,
      22.0
     ],
     "id": "obj-18"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "plugout~ 1 2",
     "numinlets": 2,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      260,
      692,
      80,
      22
     ],
     "id": "obj-20"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "3 \u00b7 BRAIN \u2014 state, slots, saving. Everything talks to it via s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      420,
      36,
      460,
      20.0
     ],
     "fontsize": 10.0,
     "id": "obj-21"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadmess ---a",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      420,
      60,
      94,
      22.0
     ],
     "id": "obj-22"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend root",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      420,
      90,
      88,
      22.0
     ],
     "id": "obj-23"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      420,
      120,
      76,
      22.0
     ],
     "id": "obj-24"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "r ---brain",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      600,
      60,
      76,
      22.0
     ],
     "id": "obj-25"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pattr state",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "patching_rect": [
      800,
      90,
      82,
      22.0
     ],
     "parameter_enable": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "State",
       "parameter_shortname": "State",
       "parameter_type": 3,
       "parameter_invisible": 1
      }
     },
     "id": "obj-26"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "js wanderer.state.js",
     "numinlets": 1,
     "numoutlets": 5,
     "outlettype": [
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      600,
      160,
      200,
      22.0
     ],
     "id": "obj-27"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---poly",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      600,
      200,
      69,
      22.0
     ],
     "id": "obj-28"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route ampslice onset novelty ampgate",
     "numinlets": 2,
     "numoutlets": 5,
     "outlettype": [
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      640,
      330,
      230,
      22.0
     ],
     "id": "obj-29"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---cond",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      780,
      230,
      69,
      22.0
     ],
     "id": "obj-30"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "opendialog sound",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "patching_rect": [
      900,
      200,
      113,
      22.0
     ],
     "id": "obj-31"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend relink",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      900,
      230,
      100,
      22.0
     ],
     "id": "obj-32"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      900,
      260,
      76,
      22.0
     ],
     "id": "obj-33"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "4 \u00b7 ANALYSIS \u2014 FluCoMa, driven by the brain",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      640,
      300,
      300,
      20.0
     ],
     "fontsize": 10.0,
     "id": "obj-34"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "fluid.bufampslice~ @indices ---aix @blocking 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      640,
      380,
      200,
      22.0
     ],
     "id": "obj-35"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "fluid.bufonsetslice~ @indices ---aix @blocking 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      640,
      410,
      200,
      22.0
     ],
     "id": "obj-36"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "fluid.bufnoveltyslice~ @indices ---aix @blocking 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      640,
      440,
      210,
      22.0
     ],
     "id": "obj-37"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "fluid.bufampgate~ @indices ---aix @blocking 0",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      640,
      470,
      200,
      22.0
     ],
     "id": "obj-38"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "deferlow",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      900,
      500,
      63,
      22.0
     ],
     "id": "obj-39"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "t fluiddone",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      900,
      530,
      82,
      22.0
     ],
     "id": "obj-40"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      900,
      560,
      76,
      22.0
     ],
     "id": "obj-41"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "5 \u00b7 BUFFERS \u2014 shared between brain, voices and analysis",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1120,
      36,
      360,
      20.0
     ],
     "fontsize": 10.0,
     "id": "obj-42"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadmess sizeinsamps 1024 3",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1120,
      60,
      200,
      22.0
     ],
     "id": "obj-43"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "buffer~ ---apa 0 3",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "bang"
     ],
     "patching_rect": [
      1120,
      86,
      160,
      22.0
     ],
     "id": "obj-44"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadmess sizeinsamps 1024 3",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1120,
      120,
      200,
      22.0
     ],
     "id": "obj-45"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "buffer~ ---apb 0 3",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "bang"
     ],
     "patching_rect": [
      1120,
      146,
      160,
      22.0
     ],
     "id": "obj-46"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadmess sizeinsamps 4096 14",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1120,
      180,
      200,
      22.0
     ],
     "id": "obj-47"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "buffer~ ---ast 0 14",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "bang"
     ],
     "patching_rect": [
      1120,
      206,
      160,
      22.0
     ],
     "id": "obj-48"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadmess sizeinsamps 512 1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1120,
      240,
      200,
      22.0
     ],
     "id": "obj-49"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "buffer~ ---acf 0 1",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "bang"
     ],
     "patching_rect": [
      1120,
      266,
      160,
      22.0
     ],
     "id": "obj-50"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadmess sizeinsamps 704512 1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1120,
      300,
      200,
      22.0
     ],
     "id": "obj-51"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "buffer~ ---amem 0 1",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "bang"
     ],
     "patching_rect": [
      1120,
      326,
      160,
      22.0
     ],
     "id": "obj-52"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadmess sizeinsamps 16 2",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1120,
      360,
      200,
      22.0
     ],
     "id": "obj-53"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "buffer~ ---aix 0 2",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "bang"
     ],
     "patching_rect": [
      1120,
      386,
      160,
      22.0
     ],
     "id": "obj-54"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadmess sizeinsamps 6144 1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1120,
      420,
      200,
      22.0
     ],
     "id": "obj-55"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "buffer~ ---asc 0 1",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "bang"
     ],
     "patching_rect": [
      1120,
      446,
      160,
      22.0
     ],
     "id": "obj-56"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "6 \u00b7 INTERFACE \u2014 each control announces itself on a bus",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      720,
      400,
      20.0
     ],
     "fontsize": 10.0,
     "id": "obj-57"
    }
   },
   {
    "box": {
     "maxclass": "jsui",
     "filename": "wanderer.slots.js",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "parameter_enable": 0,
     "border": 0,
     "varname": "slots",
     "patching_rect": [
      20,
      750,
      88,
      88
     ],
     "presentation": 1,
     "presentation_rect": [
      4,
      4,
      88,
      88
     ],
     "annotation": "File slots. Click to select a file. Red slots are missing: click to relink.",
     "annotation_name": "Files",
     "id": "obj-58"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      846,
      76,
      22.0
     ],
     "id": "obj-59"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend drop",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      130,
      804,
      88,
      22.0
     ],
     "id": "obj-61"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      130,
      830,
      76,
      22.0
     ],
     "id": "obj-62"
    }
   },
   {
    "box": {
     "maxclass": "jsui",
     "filename": "wanderer.wave.js",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "parameter_enable": 0,
     "border": 0,
     "varname": "wave",
     "patching_rect": [
      240,
      750,
      300,
      138
     ],
     "presentation": 1,
     "presentation_rect": [
      98,
      4,
      300,
      138
     ],
     "annotation": "Selected file and its slices. Click a slice to disable it. Weighted + Manual: drag in the lower strip to set weights.",
     "annotation_name": "Waveform",
     "id": "obj-64"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      240,
      896,
      76,
      22.0
     ],
     "id": "obj-65"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "patching_rect": [
      240,
      930,
      57,
      17
     ],
     "presentation": 1,
     "presentation_rect": [
      98,
      146,
      54,
      17
     ],
     "varname": "flock",
     "text": "Lock",
     "texton": "Lock",
     "mode": 1,
     "annotation": "Loops this file's last Lock length of hits. Knobs still work.",
     "annotation_name": "File Lock",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "flock",
       "parameter_shortname": "Lock",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "off",
        "on"
       ],
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-66"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend flock",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      240,
      956,
      94,
      22.0
     ],
     "id": "obj-67"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      240,
      982,
      76,
      22.0
     ],
     "id": "obj-68"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "patching_rect": [
      350,
      930,
      57,
      17
     ],
     "presentation": 1,
     "presentation_rect": [
      155,
      146,
      54,
      17
     ],
     "varname": "fmute",
     "text": "Mute",
     "texton": "Mute",
     "mode": 1,
     "annotation": "Silences this file.",
     "annotation_name": "File Mute",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "fmute",
       "parameter_shortname": "Mute",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "off",
        "on"
       ],
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-69"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend fmute",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      350,
      956,
      94,
      22.0
     ],
     "id": "obj-70"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      350,
      982,
      76,
      22.0
     ],
     "id": "obj-71"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "patching_rect": [
      460,
      930,
      57,
      17
     ],
     "presentation": 1,
     "presentation_rect": [
      212,
      146,
      44,
      17
     ],
     "varname": "frand",
     "text": "Random",
     "texton": "Random",
     "mode": 0,
     "annotation": "Randomizes every tab of this file.",
     "annotation_name": "File Random",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "frand",
       "parameter_shortname": "Random",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "off",
        "on"
       ],
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-72"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend frand",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      460,
      956,
      45,
      22.0
     ],
     "id": "obj-73"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      460,
      1008,
      76,
      22.0
     ],
     "id": "obj-75"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "patching_rect": [
      570,
      930,
      57,
      17
     ],
     "presentation": 1,
     "presentation_rect": [
      278,
      146,
      58,
      17
     ],
     "varname": "fclear",
     "text": "Clear",
     "texton": "Clear",
     "mode": 0,
     "annotation": "Removes the file from this slot. Settings stay.",
     "annotation_name": "Clear File",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "fclear",
       "parameter_shortname": "Clear",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "off",
        "on"
       ],
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-76"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend fclear",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      570,
      956,
      45,
      22.0
     ],
     "id": "obj-77"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      570,
      1008,
      76,
      22.0
     ],
     "id": "obj-79"
    }
   },
   {
    "box": {
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      790,
      750,
      282,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      404,
      4,
      282,
      16
     ],
     "varname": "tabs",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Pages of the selected file's settings.",
     "annotation_name": "Tabs",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "tabs",
       "parameter_shortname": "Tab",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "Clock",
        "Slice",
        "Play",
        "Pitch",
        "Env",
        "Filter",
        "Repeat",
        "Grain",
        "Detect"
       ],
       "parameter_mmax": 8.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-80"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend tab",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      790,
      774,
      80,
      22.0
     ],
     "id": "obj-81"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      790,
      800,
      74,
      22.0
     ],
     "id": "obj-82"
    }
   },
   {
    "box": {
     "maxclass": "bpatcher",
     "name": "wanderer.panel.maxpat",
     "numinlets": 0,
     "numoutlets": 0,
     "offset": [
      0.0,
      0.0
     ],
     "enablehscroll": 0,
     "enablevscroll": 0,
     "lockeddragscroll": 0,
     "bgmode": 0,
     "border": 0,
     "clickthrough": 0,
     "viewvisibility": 1,
     "varname": "panel",
     "patching_rect": [
      790,
      830,
      282,
      145
     ],
     "presentation": 1,
     "presentation_rect": [
      404,
      22,
      282,
      145
     ],
     "id": "obj-83"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1230,
      750,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      740,
      2,
      44,
      48
     ],
     "varname": "chaos",
     "annotation": "Scales every random range. 50% uses ranges as set, 0% freezes, 100% doubles.",
     "annotation_name": "Chaos",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Chaos",
       "parameter_shortname": "Chaos",
       "parameter_type": 0,
       "parameter_invisible": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        50.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-84",
     "activedialcolor": [
      1.0,
      0.706,
      0.235,
      1.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend chaos",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1230,
      806,
      92,
      22.0
     ],
     "id": "obj-85"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1230,
      832,
      62,
      22.0
     ],
     "id": "obj-86"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1340,
      750,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      786,
      2,
      44,
      48
     ],
     "varname": "gdensity",
     "annotation": "Makes all files busier or sparser. Below 0, hits also turn into rests (up to 85% at -100).",
     "annotation_name": "Density",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "G.Density",
       "parameter_shortname": "Density",
       "parameter_type": 0,
       "parameter_invisible": 0,
       "parameter_mmin": -100.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-87",
     "activedialcolor": [
      1.0,
      0.706,
      0.235,
      1.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend gdensity",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1340,
      806,
      110,
      22.0
     ],
     "id": "obj-88"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1340,
      832,
      62,
      22.0
     ],
     "id": "obj-89"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1450,
      750,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      832,
      2,
      44,
      48
     ],
     "varname": "gpitch",
     "annotation": "Transposes everything.",
     "annotation_name": "Pitch",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "G.Pitch",
       "parameter_shortname": "Pitch",
       "parameter_type": 0,
       "parameter_invisible": 0,
       "parameter_mmin": -24.0,
       "parameter_mmax": 24.0,
       "parameter_unitstyle": 7,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-90",
     "activedialcolor": [
      1.0,
      0.706,
      0.235,
      1.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend gpitch",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1450,
      806,
      98,
      22.0
     ],
     "id": "obj-91"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1450,
      832,
      62,
      22.0
     ],
     "id": "obj-92"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1560,
      750,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      878,
      2,
      44,
      48
     ],
     "varname": "mutate",
     "annotation": "Chance each locked hit rerolls its slice and random values per loop pass.",
     "annotation_name": "Mutate",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Mutate",
       "parameter_shortname": "Mutate",
       "parameter_type": 0,
       "parameter_invisible": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-93",
     "activedialcolor": [
      1.0,
      0.706,
      0.235,
      1.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend mutate",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1560,
      806,
      98,
      22.0
     ],
     "id": "obj-94"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1560,
      832,
      62,
      22.0
     ],
     "id": "obj-95"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Scale",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1120,
      884,
      60,
      16.0
     ],
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      694,
      52,
      66,
      12
     ],
     "id": "obj-96"
    }
   },
   {
    "box": {
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1120,
      904,
      86,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      694,
      64,
      66,
      15
     ],
     "varname": "gscale",
     "annotation": "Interval set for per-hit pitch and repeat steps. No root note.",
     "annotation_name": "Scale",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Scale",
       "parameter_shortname": "Scale",
       "parameter_type": 2,
       "parameter_invisible": 0,
       "parameter_enum": [
        "Chromatic",
        "Major",
        "Minor",
        "Dorian",
        "Phrygian",
        "Lydian",
        "Mixolydian",
        "Harm. Minor",
        "Major Pent.",
        "Minor Pent.",
        "Fifths",
        "Octaves"
       ],
       "parameter_mmax": 11.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-97"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend gscale",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1120,
      926,
      98,
      22.0
     ],
     "id": "obj-98"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1120,
      952,
      62,
      22.0
     ],
     "id": "obj-99"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Lock",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1560,
      884,
      40,
      16.0
     ],
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      880,
      52,
      30,
      12
     ],
     "id": "obj-100"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1560,
      904,
      40,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      880,
      64,
      30,
      15
     ],
     "varname": "glock",
     "text": "Lock",
     "texton": "Lock",
     "mode": 1,
     "annotation": "Locks every file.",
     "annotation_name": "Global Lock",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Lock",
       "parameter_shortname": "Lock",
       "parameter_type": 2,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ],
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-101",
     "activebgoncolor": [
      1.0,
      0.706,
      0.235,
      1.0
     ],
     "activetextoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend glock",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1560,
      926,
      92,
      22.0
     ],
     "id": "obj-102"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1560,
      978,
      62,
      22.0
     ],
     "id": "obj-104"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1560,
      1004,
      74,
      22.0
     ],
     "id": "obj-105"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Bars",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1670,
      884,
      50,
      16.0
     ],
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      916,
      52,
      48,
      12
     ],
     "id": "obj-106"
    }
   },
   {
    "box": {
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1670,
      904,
      48,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      916,
      64,
      48,
      15
     ],
     "varname": "locklen",
     "annotation": "Bars looped by Lock. A change applies at the next Lock.",
     "annotation_name": "Lock Length",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Lock Length",
       "parameter_shortname": "Length",
       "parameter_type": 2,
       "parameter_invisible": 0,
       "parameter_enum": [
        "1",
        "2",
        "4",
        "8"
       ],
       "parameter_mmax": 3.0,
       "parameter_initial": [
        2.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-107"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend locklen",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1670,
      926,
      104,
      22.0
     ],
     "id": "obj-108"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1670,
      952,
      62,
      22.0
     ],
     "id": "obj-109"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Memory",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1120,
      1030,
      60,
      16.0
     ],
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      694,
      84,
      74,
      12
     ],
     "id": "obj-110"
    }
   },
   {
    "box": {
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1120,
      1046,
      124,
      30
     ],
     "presentation": 1,
     "presentation_rect": [
      694,
      97,
      138,
      30
     ],
     "varname": "slot",
     "num_lines_patching": 2,
     "num_lines_presentation": 2,
     "annotation": "Recalls a memory slot. Automate this to automate everything.",
     "annotation_name": "Memory Slot",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Slot",
       "parameter_shortname": "Slot",
       "parameter_type": 2,
       "parameter_invisible": 0,
       "parameter_enum": [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8"
       ],
       "parameter_mmax": 7.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-111",
     "activebgoncolor": [
      0.667,
      0.431,
      1.0,
      1.0
     ],
     "activetextoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend slot",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1120,
      1084,
      86,
      22.0
     ],
     "id": "obj-112"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1120,
      1110,
      74,
      22.0
     ],
     "id": "obj-113"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1270,
      1046,
      54,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      836,
      97,
      42,
      14
     ],
     "varname": "store",
     "text": "Store",
     "texton": "Store",
     "mode": 0,
     "annotation": "Saves all file settings into the selected slot.",
     "annotation_name": "Store",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Store",
       "parameter_shortname": "Store",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "off",
        "on"
       ],
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-114"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend store",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1270,
      1084,
      92,
      22.0
     ],
     "id": "obj-115"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1270,
      1110,
      74,
      22.0
     ],
     "id": "obj-117"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Slide",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1380,
      1030,
      50,
      16.0
     ],
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      880,
      114,
      42,
      12
     ],
     "id": "obj-118"
    }
   },
   {
    "box": {
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1380,
      1046,
      54,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      836,
      113,
      42,
      14
     ],
     "varname": "slide",
     "annotation": "How long a slot recall takes. Knobs glide; switches change by chance.",
     "annotation_name": "Slide",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Slide",
       "parameter_shortname": "Slide",
       "parameter_type": 2,
       "parameter_invisible": 0,
       "parameter_enum": [
        "Off",
        "1/4",
        "1",
        "2",
        "4",
        "8",
        "16"
       ],
       "parameter_mmax": 6.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-119"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend slide",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1380,
      1084,
      92,
      22.0
     ],
     "id": "obj-120"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1380,
      1110,
      74,
      22.0
     ],
     "id": "obj-121"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1490,
      1046,
      124,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      694,
      134,
      104,
      15
     ],
     "varname": "grand",
     "text": "Random All",
     "texton": "Random All",
     "mode": 0,
     "annotation": "Randomizes every loaded file.",
     "annotation_name": "Random All",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Random All",
       "parameter_shortname": "Random",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "off",
        "on"
       ],
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-122"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend grand",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1490,
      1084,
      92,
      22.0
     ],
     "id": "obj-123"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1490,
      1110,
      74,
      22.0
     ],
     "id": "obj-125"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "appearance": 1,
     "showname": 0,
     "shownumber": 0,
     "varname": "depth_file",
     "patching_rect": [
      524,
      930,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      258,
      147,
      16,
      16
     ],
     "annotation": "How far the random button moves things. 10% moves values a tenth of the way to a new random value; switches change with that chance.",
     "annotation_name": "File random depth",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Depth File",
       "parameter_shortname": "Depth",
       "parameter_type": 0,
       "parameter_invisible": 1,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-d1021",
     "activedialcolor": [
      0.431,
      0.647,
      0.902,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-d1021a",
     "maxclass": "newobj",
     "text": "prepend rdepth file",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      524,
      980,
      128,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-d1021b",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      524,
      1034,
      74,
      22
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "appearance": 1,
     "showname": 0,
     "shownumber": 0,
     "varname": "depth_all",
     "patching_rect": [
      1620,
      1046,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      800,
      133,
      16,
      16
     ],
     "annotation": "How far the random button moves things. 10% moves values a tenth of the way to a new random value; switches change with that chance.",
     "annotation_name": "Random All depth",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Depth All",
       "parameter_shortname": "Depth",
       "parameter_type": 0,
       "parameter_invisible": 1,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-d1024",
     "activedialcolor": [
      0.431,
      0.647,
      0.902,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-d1024a",
     "maxclass": "newobj",
     "text": "prepend rdepth all",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1620,
      1084,
      122,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-d1024b",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1620,
      1110,
      74,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-livedrop",
     "maxclass": "live.drop",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "varname": "drop",
     "legend": "Drop audio",
     "patching_rect": [
      130,
      748,
      88,
      46
     ],
     "presentation": 1,
     "presentation_rect": [
      4,
      96,
      88,
      46
     ],
     "annotation": "Drop an audio file here. It goes to the selected empty slot, else the first empty one.",
     "annotation_name": "Drop",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_invisible": 2,
       "parameter_longname": "Drop",
       "parameter_shortname": "Drop",
       "parameter_type": 4
      }
     }
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "patching_rect": [
      680,
      930,
      57,
      17
     ],
     "presentation": 1,
     "presentation_rect": [
      339,
      146,
      59,
      17
     ],
     "varname": "finit",
     "text": "Init",
     "texton": "Init",
     "mode": 0,
     "annotation": "Sets this file's settings back to defaults. Slices stay.",
     "annotation_name": "Init File",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "finit",
       "parameter_shortname": "Init",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "off",
        "on"
       ],
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-finit"
    }
   },
   {
    "box": {
     "id": "obj-finitp",
     "maxclass": "newobj",
     "text": "prepend finit",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      680,
      956,
      90,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-finits",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      680,
      982,
      70,
      22
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1670,
      750,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      974,
      14,
      44,
      48
     ],
     "varname": "msens",
     "annotation": "Shifts every file's Sensitivity up or down. Re-slices all files.",
     "annotation_name": "Master Sensitivity",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Master Sensitivity",
       "parameter_shortname": "M.Sens",
       "parameter_type": 0,
       "parameter_invisible": 0,
       "parameter_mmin": -50.0,
       "parameter_mmax": 50.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-msens",
     "activedialcolor": [
      0.353,
      0.784,
      0.471,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-msens-p",
     "maxclass": "newobj",
     "text": "prepend msens",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1670,
      806,
      92,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-msens-s",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1670,
      832,
      74,
      22
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1780,
      750,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      974,
      72,
      44,
      48
     ],
     "varname": "mlen",
     "annotation": "Scales every file's Min Len: -100 = x0.25, 0 = x1, +100 = x4. Re-slices all files.",
     "annotation_name": "Master Length",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Master Length",
       "parameter_shortname": "M.Len",
       "parameter_type": 0,
       "parameter_invisible": 0,
       "parameter_mmin": -100.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-mlen",
     "activedialcolor": [
      0.353,
      0.784,
      0.471,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-mlen-p",
     "maxclass": "newobj",
     "text": "prepend mlen",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1780,
      806,
      86,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-mlen-s",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1780,
      832,
      74,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-mdet-c",
     "maxclass": "comment",
     "text": "Detect",
     "numinlets": 1,
     "numoutlets": 0,
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      976,
      2,
      44,
      12
     ],
     "patching_rect": [
      1440,
      726,
      60,
      20
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1120,
      750,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      694,
      2,
      44,
      48
     ],
     "varname": "macro",
     "annotation": "Fades all processing between clean (0%), as set (100%) and exaggerated (up to 175%). Leaves rhythm, slicing, volume and file pitch alone. Does not move the knobs.",
     "annotation_name": "Macro",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Macro",
       "parameter_shortname": "Macro",
       "parameter_type": 0,
       "parameter_invisible": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 175.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-macro",
     "activedialcolor": [
      1.0,
      0.706,
      0.235,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-macro-p",
     "maxclass": "newobj",
     "text": "prepend macro",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1120,
      806,
      92,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-macro-s",
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1120,
      832,
      62,
      22
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      20,
      510,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1070,
      2,
      44,
      48
     ],
     "varname": "volume",
     "annotation": "Output level of the whole device.",
     "annotation_name": "Volume",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Volume",
       "parameter_shortname": "Out",
       "parameter_type": 0,
       "parameter_invisible": 0,
       "parameter_mmin": -70.0,
       "parameter_mmax": 6.0,
       "parameter_unitstyle": 4,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-vol",
     "activedialcolor": [
      1.0,
      0.431,
      0.431,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-vol-db",
     "maxclass": "newobj",
     "text": "if $f1 <= -69.9 then -999. else $f1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      566,
      180,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-vol-pk",
     "maxclass": "newobj",
     "text": "pack 0. 20",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      616,
      94,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-vol-ln",
     "maxclass": "newobj",
     "text": "line~",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "bang"
     ],
     "patching_rect": [
      20,
      640,
      59,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-vol-l",
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      20,
      664,
      40,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-vol-r",
     "maxclass": "newobj",
     "text": "*~",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      80,
      664,
      40,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-meter-l",
     "maxclass": "live.meter~",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "list"
     ],
     "presentation": 1,
     "presentation_rect": [
      1079,
      56,
      11,
      86
     ],
     "patching_rect": [
      360,
      640,
      11,
      60
     ]
    }
   },
   {
    "box": {
     "id": "obj-meter-r",
     "maxclass": "live.meter~",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "list"
     ],
     "presentation": 1,
     "presentation_rect": [
      1093,
      56,
      11,
      86
     ],
     "patching_rect": [
      380,
      640,
      11,
      60
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1230,
      904,
      40,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      764,
      64,
      24,
      15
     ],
     "varname": "gtrip",
     "text": "Trip",
     "texton": "Trip",
     "mode": 1,
     "annotation": "Allow triplet waits in every file. Off removes them, and triplet repeat spacing plays straight.",
     "annotation_name": "Allow Triplets",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Allow Trip",
       "parameter_shortname": "Trip",
       "parameter_type": 2,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ],
       "parameter_mmax": 1.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-gtrip",
     "activebgoncolor": [
      1.0,
      0.706,
      0.235,
      1.0
     ],
     "activetextoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-gtrip-p",
     "maxclass": "newobj",
     "text": "prepend gtrip",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1230,
      926,
      92,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-gtrip-s",
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1230,
      952,
      62,
      22
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1340,
      904,
      40,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      790,
      64,
      24,
      15
     ],
     "varname": "gdot",
     "text": "Dot",
     "texton": "Dot",
     "mode": 1,
     "annotation": "Allow dotted waits in every file. Off removes them.",
     "annotation_name": "Allow Dotted",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Allow Dot",
       "parameter_shortname": "Dot",
       "parameter_type": 2,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ],
       "parameter_mmax": 1.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-gdot",
     "activebgoncolor": [
      1.0,
      0.706,
      0.235,
      1.0
     ],
     "activetextoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-gdot-p",
     "maxclass": "newobj",
     "text": "prepend gdot",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1340,
      926,
      86,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-gdot-s",
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1340,
      952,
      62,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-chaos-b",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1230,
      858,
      74,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-allow-c",
     "maxclass": "comment",
     "text": "Allow",
     "numinlets": 1,
     "numoutlets": 0,
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      764,
      52,
      100,
      12
     ],
     "patching_rect": [
      1230,
      884,
      80,
      16.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "patching_rect": [
      20,
      880,
      88,
      17
     ],
     "presentation": 1,
     "presentation_rect": [
      4,
      146,
      88,
      17
     ],
     "varname": "clearall",
     "text": "Clear All",
     "texton": "Clear All",
     "mode": 0,
     "annotation": "Wipes the whole device: all files, slices, settings, locks and memory slots. Press twice: the first press arms it (Sure?), the second clears.",
     "annotation_name": "Clear All",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "clearall",
       "parameter_shortname": "Clear All",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "off",
        "on"
       ],
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-clearall"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend clearall",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      905,
      100,
      22
     ],
     "id": "obj-clearall-p"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      20,
      930,
      70,
      22
     ],
     "id": "obj-clearall-s"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1450,
      904,
      40,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      816,
      64,
      30,
      15
     ],
     "varname": "gptch",
     "text": "Pitch",
     "texton": "Pitch",
     "mode": 1,
     "annotation": "Allow pitch changes in every file. Off: every slice plays at its own pitch and speed (no file Pitch, scale notes, Glide, pitch envelope, repeat steps or grain spread). The global Pitch dial still transposes everything.",
     "annotation_name": "Allow Pitch",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Allow Pitch",
       "parameter_shortname": "Pitch",
       "parameter_type": 2,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ],
       "parameter_mmax": 1.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-gpenv",
     "activebgoncolor": [
      1.0,
      0.706,
      0.235,
      1.0
     ],
     "activetextoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend gptch",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1450,
      926,
      92,
      22
     ],
     "id": "obj-gpenv-p"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1450,
      952,
      62,
      22
     ],
     "id": "obj-gpenv-s"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "wanderer.limiter",
     "numinlets": 3,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patching_rect": [
      20,
      692,
      140,
      22
     ],
     "id": "obj-lim"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "patching_rect": [
      220,
      566,
      44,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      1070,
      148,
      44,
      15
     ],
     "varname": "limit",
     "text": "Limit",
     "texton": "Limit",
     "mode": 1,
     "annotation": "Soft limiter on the output, ceiling -0.3 dB. Catches peaks from stacked hits and resonance.",
     "annotation_name": "Limiter",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Limiter",
       "parameter_shortname": "Limit",
       "parameter_type": 2,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ],
       "parameter_mmax": 1.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-limit",
     "activebgoncolor": [
      1.0,
      0.431,
      0.431,
      1.0
     ],
     "activetextoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend on",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      220,
      592,
      70,
      22
     ],
     "id": "obj-limit-p"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1890,
      750,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      924,
      84,
      44,
      48
     ],
     "varname": "quant",
     "annotation": "How tight the timing is. Pulls hits onto the grid (Hits and Extra pick the grids, Allow Trip adds triplet lines), takes Swing out, moves Start to the nearest note attack in the slice and shortens slow attacks to 15 ms. 0% leaves everything as set.",
     "annotation_name": "Quantize",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Quantize",
       "parameter_shortname": "Quant",
       "parameter_type": 0,
       "parameter_invisible": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-quant",
     "activedialcolor": [
      0.749,
      0.588,
      1.0,
      1.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend gquant",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1890,
      806,
      98,
      22
     ],
     "id": "obj-quant-p"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1890,
      832,
      62,
      22
     ],
     "id": "obj-quant-s"
    }
   },
   {
    "box": {
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 1,
     "patching_rect": [
      1780,
      904,
      40,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      848,
      64,
      24,
      15
     ],
     "varname": "grev",
     "text": "Rev",
     "texton": "Rev",
     "mode": 1,
     "annotation": "Allow reversed hits in every file. Off plays every hit forward.",
     "annotation_name": "Allow Reverse",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Allow Rev",
       "parameter_shortname": "Rev",
       "parameter_type": 2,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ],
       "parameter_mmax": 1.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-grev",
     "activebgoncolor": [
      1.0,
      0.706,
      0.235,
      1.0
     ],
     "activetextoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ],
     "textoncolor": [
      0.1,
      0.1,
      0.1,
      1.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend grev",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1780,
      926,
      86,
      22
     ],
     "id": "obj-grev-p"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1780,
      952,
      62,
      22
     ],
     "id": "obj-grev-s"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      2000,
      750,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1024,
      2,
      44,
      48
     ],
     "varname": "even",
     "annotation": "Brings every slice toward the same loudness before it plays, so quiet and loud files and hits sit level. 0% leaves them as recorded.",
     "annotation_name": "Even",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Even",
       "parameter_shortname": "Even",
       "parameter_type": 0,
       "parameter_invisible": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-even",
     "activedialcolor": [
      1.0,
      0.431,
      0.431,
      1.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend geven",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2000,
      806,
      92,
      22
     ],
     "id": "obj-even-p"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      2000,
      832,
      62,
      22
     ],
     "id": "obj-even-s"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      460,
      500,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1024,
      58,
      44,
      48
     ],
     "varname": "comp",
     "annotation": "Compresses the summed sound before Volume, with 5 ms lookahead. Turning up lowers the threshold and raises ratio and makeup together.",
     "annotation_name": "Compressor",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Compressor",
       "parameter_shortname": "Comp",
       "parameter_type": 0,
       "parameter_invisible": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-comp",
     "activedialcolor": [
      1.0,
      0.431,
      0.431,
      1.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend amount",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      460,
      556,
      98,
      22
     ],
     "id": "obj-comp-p"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "wanderer.comp",
     "numinlets": 3,
     "numoutlets": 3,
     "outlettype": [
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      300,
      500,
      140,
      22
     ],
     "id": "obj-cmp"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "snapshot~ 40",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "float"
     ],
     "patching_rect": [
      300,
      530,
      80,
      22
     ],
     "id": "obj-gr-snap"
    }
   },
   {
    "box": {
     "maxclass": "multislider",
     "id": "obj-gr",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "parameter_enable": 0,
     "patching_rect": [
      300,
      560,
      80,
      10
     ],
     "presentation": 1,
     "presentation_rect": [
      1026,
      110,
      40,
      5
     ],
     "size": 1,
     "setminmax": [
      0.0,
      24.0
     ],
     "setstyle": 1,
     "orientation": 0,
     "ignoreclick": 1,
     "slidercolor": [
      1.0,
      0.431,
      0.431,
      1.0
     ],
     "bgcolor": [
      0.0,
      0.0,
      0.0,
      0.25
     ],
     "border": 0
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "id": "obj-gr-c",
     "text": "GR",
     "numinlets": 1,
     "numoutlets": 0,
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      1035,
      116,
      30,
      12
     ],
     "patching_rect": [
      390,
      558,
      30,
      16
     ],
     "textcolor": [
      0.55,
      0.55,
      0.55,
      1.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      2110,
      904,
      48,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      826,
      145,
      44,
      15
     ],
     "varname": "qhit",
     "annotation": "Grid the main hits snap to. Allow Trip adds its triplet lines.",
     "annotation_name": "Quant Hits",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Quant Hits",
       "parameter_shortname": "Hits",
       "parameter_type": 2,
       "parameter_invisible": 0,
       "parameter_enum": [
        "1/4",
        "1/8",
        "1/16",
        "1/32"
       ],
       "parameter_mmax": 3.0,
       "parameter_initial": [
        2.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-qhit"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "id": "obj-qhit-c",
     "text": "Hits",
     "numinlets": 1,
     "numoutlets": 0,
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      826,
      132,
      44,
      12
     ],
     "patching_rect": [
      2110,
      884,
      48,
      16
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend gqhit",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2110,
      926,
      80,
      22
     ],
     "id": "obj-qhit-p"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      2110,
      952,
      62,
      22
     ],
     "id": "obj-qhit-s"
    }
   },
   {
    "box": {
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      2220,
      904,
      48,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      874,
      145,
      44,
      15
     ],
     "varname": "qext",
     "annotation": "Grid the repeats and ratchets snap to. Allow Trip adds its triplet lines.",
     "annotation_name": "Quant Extra",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Quant Extra",
       "parameter_shortname": "Extra",
       "parameter_type": 2,
       "parameter_invisible": 0,
       "parameter_enum": [
        "1/16",
        "1/32",
        "1/64"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-qext"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "id": "obj-qext-c",
     "text": "Extra",
     "numinlets": 1,
     "numoutlets": 0,
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      874,
      132,
      44,
      12
     ],
     "patching_rect": [
      2220,
      884,
      48,
      16
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend gqext",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2220,
      926,
      80,
      22
     ],
     "id": "obj-qext-p"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      2220,
      952,
      62,
      22
     ],
     "id": "obj-qext-s"
    }
   },
   {
    "box": {
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      2110,
      750,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      924,
      2,
      44,
      48
     ],
     "varname": "glen",
     "annotation": "Makes every file fuller or shorter. Up: Start moves to 0 and Length, Gate and release stretch toward full. Down: everything gets choppier.",
     "annotation_name": "Length",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "G.Length",
       "parameter_shortname": "Length",
       "parameter_type": 0,
       "parameter_invisible": 0,
       "parameter_mmin": -100.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-glen",
     "activedialcolor": [
      1.0,
      0.706,
      0.235,
      1.0
     ]
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend glen",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2110,
      806,
      80,
      22
     ],
     "id": "obj-glen-p"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "s ---all",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      2110,
      832,
      62,
      22
     ],
     "id": "obj-glen-s"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "dbtoa",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      592,
      50,
      22
     ],
     "id": "obj-vol-db2"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-3",
      0
     ],
     "destination": [
      "obj-4",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-4",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-5",
      0
     ],
     "destination": [
      "obj-6",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-5",
      0
     ],
     "destination": [
      "obj-7",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-6",
      0
     ],
     "destination": [
      "obj-8",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-7",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      0
     ],
     "destination": [
      "obj-10",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-11",
      0
     ],
     "destination": [
      "obj-12",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-8",
      0
     ],
     "destination": [
      "obj-12",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-12",
      3
     ],
     "destination": [
      "obj-13",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-13",
      0
     ],
     "destination": [
      "obj-14",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-14",
      0
     ],
     "destination": [
      "obj-15",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-17",
      0
     ],
     "destination": [
      "obj-18",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-12",
      0
     ],
     "destination": [
      "obj-18",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-12",
      1
     ],
     "destination": [
      "obj-18",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-12",
      2
     ],
     "destination": [
      "obj-18",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-22",
      0
     ],
     "destination": [
      "obj-23",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-23",
      0
     ],
     "destination": [
      "obj-24",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-3",
      0
     ],
     "destination": [
      "obj-22",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-25",
      0
     ],
     "destination": [
      "obj-27",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-26",
      0
     ],
     "destination": [
      "obj-27",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-27",
      0
     ],
     "destination": [
      "obj-28",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-27",
      1
     ],
     "destination": [
      "obj-29",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-27",
      2
     ],
     "destination": [
      "obj-30",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-27",
      3
     ],
     "destination": [
      "obj-26",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-27",
      4
     ],
     "destination": [
      "obj-31",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-31",
      0
     ],
     "destination": [
      "obj-32",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-32",
      0
     ],
     "destination": [
      "obj-33",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-29",
      0
     ],
     "destination": [
      "obj-35",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-35",
      0
     ],
     "destination": [
      "obj-39",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-29",
      1
     ],
     "destination": [
      "obj-36",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-36",
      0
     ],
     "destination": [
      "obj-39",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-29",
      2
     ],
     "destination": [
      "obj-37",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-37",
      0
     ],
     "destination": [
      "obj-39",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-29",
      3
     ],
     "destination": [
      "obj-38",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-38",
      0
     ],
     "destination": [
      "obj-39",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-39",
      0
     ],
     "destination": [
      "obj-40",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-40",
      0
     ],
     "destination": [
      "obj-41",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-43",
      0
     ],
     "destination": [
      "obj-44",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-45",
      0
     ],
     "destination": [
      "obj-46",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-47",
      0
     ],
     "destination": [
      "obj-48",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-49",
      0
     ],
     "destination": [
      "obj-50",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-51",
      0
     ],
     "destination": [
      "obj-52",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-53",
      0
     ],
     "destination": [
      "obj-54",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-55",
      0
     ],
     "destination": [
      "obj-56",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-58",
      0
     ],
     "destination": [
      "obj-59",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-61",
      0
     ],
     "destination": [
      "obj-62",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-64",
      0
     ],
     "destination": [
      "obj-65",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-66",
      0
     ],
     "destination": [
      "obj-67",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-67",
      0
     ],
     "destination": [
      "obj-68",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-69",
      0
     ],
     "destination": [
      "obj-70",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-70",
      0
     ],
     "destination": [
      "obj-71",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-72",
      0
     ],
     "destination": [
      "obj-73",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-76",
      0
     ],
     "destination": [
      "obj-77",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-80",
      0
     ],
     "destination": [
      "obj-81",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-81",
      0
     ],
     "destination": [
      "obj-82",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-84",
      0
     ],
     "destination": [
      "obj-85",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-85",
      0
     ],
     "destination": [
      "obj-86",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-87",
      0
     ],
     "destination": [
      "obj-88",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-88",
      0
     ],
     "destination": [
      "obj-89",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-90",
      0
     ],
     "destination": [
      "obj-91",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-91",
      0
     ],
     "destination": [
      "obj-92",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-93",
      0
     ],
     "destination": [
      "obj-94",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-94",
      0
     ],
     "destination": [
      "obj-95",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-97",
      0
     ],
     "destination": [
      "obj-98",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-98",
      0
     ],
     "destination": [
      "obj-99",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-101",
      0
     ],
     "destination": [
      "obj-102",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-107",
      0
     ],
     "destination": [
      "obj-108",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-108",
      0
     ],
     "destination": [
      "obj-109",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-111",
      0
     ],
     "destination": [
      "obj-112",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-112",
      0
     ],
     "destination": [
      "obj-113",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-114",
      0
     ],
     "destination": [
      "obj-115",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-119",
      0
     ],
     "destination": [
      "obj-120",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-120",
      0
     ],
     "destination": [
      "obj-121",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-122",
      0
     ],
     "destination": [
      "obj-123",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-73",
      0
     ],
     "destination": [
      "obj-75",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-77",
      0
     ],
     "destination": [
      "obj-79",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-115",
      0
     ],
     "destination": [
      "obj-117",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-123",
      0
     ],
     "destination": [
      "obj-125",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1021",
      0
     ],
     "destination": [
      "obj-d1021a",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1021a",
      0
     ],
     "destination": [
      "obj-d1021b",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1024",
      0
     ],
     "destination": [
      "obj-d1024a",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1024a",
      0
     ],
     "destination": [
      "obj-d1024b",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-livedrop",
      0
     ],
     "destination": [
      "obj-61",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-finit",
      0
     ],
     "destination": [
      "obj-finitp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-finitp",
      0
     ],
     "destination": [
      "obj-finits",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-msens",
      0
     ],
     "destination": [
      "obj-msens-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-msens-p",
      0
     ],
     "destination": [
      "obj-msens-s",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-mlen",
      0
     ],
     "destination": [
      "obj-mlen-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-mlen-p",
      0
     ],
     "destination": [
      "obj-mlen-s",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-macro",
      0
     ],
     "destination": [
      "obj-macro-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-macro-p",
      0
     ],
     "destination": [
      "obj-macro-s",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-vol",
      0
     ],
     "destination": [
      "obj-vol-db",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-vol-db2",
      0
     ],
     "destination": [
      "obj-vol-pk",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-vol-pk",
      0
     ],
     "destination": [
      "obj-vol-ln",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-vol-ln",
      0
     ],
     "destination": [
      "obj-vol-l",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-vol-ln",
      0
     ],
     "destination": [
      "obj-vol-r",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-gtrip",
      0
     ],
     "destination": [
      "obj-gtrip-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-gtrip-p",
      0
     ],
     "destination": [
      "obj-gtrip-s",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-gdot",
      0
     ],
     "destination": [
      "obj-gdot-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-gdot-p",
      0
     ],
     "destination": [
      "obj-gdot-s",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-85",
      0
     ],
     "destination": [
      "obj-chaos-b",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-clearall",
      0
     ],
     "destination": [
      "obj-clearall-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-clearall-p",
      0
     ],
     "destination": [
      "obj-clearall-s",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-gpenv",
      0
     ],
     "destination": [
      "obj-gpenv-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-gpenv-p",
      0
     ],
     "destination": [
      "obj-gpenv-s",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-vol-l",
      0
     ],
     "destination": [
      "obj-lim",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-vol-r",
      0
     ],
     "destination": [
      "obj-lim",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-lim",
      0
     ],
     "destination": [
      "obj-20",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-lim",
      1
     ],
     "destination": [
      "obj-20",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-lim",
      0
     ],
     "destination": [
      "obj-meter-l",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-lim",
      1
     ],
     "destination": [
      "obj-meter-r",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-limit",
      0
     ],
     "destination": [
      "obj-limit-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-limit-p",
      0
     ],
     "destination": [
      "obj-lim",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-quant",
      0
     ],
     "destination": [
      "obj-quant-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-quant-p",
      0
     ],
     "destination": [
      "obj-quant-s",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-grev",
      0
     ],
     "destination": [
      "obj-grev-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-grev-p",
      0
     ],
     "destination": [
      "obj-grev-s",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-even",
      0
     ],
     "destination": [
      "obj-even-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-even-p",
      0
     ],
     "destination": [
      "obj-even-s",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      0
     ],
     "destination": [
      "obj-cmp",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
      1
     ],
     "destination": [
      "obj-cmp",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-cmp",
      0
     ],
     "destination": [
      "obj-vol-l",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-cmp",
      1
     ],
     "destination": [
      "obj-vol-r",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-comp",
      0
     ],
     "destination": [
      "obj-comp-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-comp-p",
      0
     ],
     "destination": [
      "obj-cmp",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-cmp",
      2
     ],
     "destination": [
      "obj-gr-snap",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-gr-snap",
      0
     ],
     "destination": [
      "obj-gr",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-qhit",
      0
     ],
     "destination": [
      "obj-qhit-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-qhit-p",
      0
     ],
     "destination": [
      "obj-qhit-s",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-qext",
      0
     ],
     "destination": [
      "obj-qext-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-qext-p",
      0
     ],
     "destination": [
      "obj-qext-s",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-glen",
      0
     ],
     "destination": [
      "obj-glen-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-glen-p",
      0
     ],
     "destination": [
      "obj-glen-s",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-vol-db",
      0
     ],
     "destination": [
      "obj-vol-db2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-102",
      0
     ],
     "destination": [
      "obj-104",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-102",
      0
     ],
     "destination": [
      "obj-105",
      0
     ]
    }
   }
  ]
 }
}