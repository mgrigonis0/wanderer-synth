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
   40.0,
   80.0,
   1400.0,
   900.0
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
  "devicewidth": 0.0,
  "description": "",
  "digest": "",
  "tags": "",
  "style": "",
  "subpatcher_template": "",
  "assistshowspatchername": 0,
  "boxes": [
   {
    "box": {
     "maxclass": "comment",
     "text": "WANDERER \u00b7 per-file panel. Every control: [prepend kind key] -> [s ---brain]. Pages sit side by side; the device scrolls this bpatcher by tab.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      4,
      900,
      20.0
     ],
     "fontsize": 10.0,
     "id": "obj-1"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "1 \u00b7 CLOCK",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      40,
      300,
      20.0
     ],
     "fontsize": 12.0,
     "id": "obj-2"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Wait values",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      220,
      70,
      90,
      20.0
     ],
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      2,
      0,
      88,
      13
     ],
     "id": "obj-3"
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
      70,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      105,
      0,
      44,
      48
     ],
     "varname": "dens_b",
     "annotation": "Favors long waits (sparse) or short waits (busy).",
     "annotation_name": "Density",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.dens",
       "parameter_shortname": "Density",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-4",
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
     "maxclass": "newobj",
     "text": "prepend b dens",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      126,
      100,
      22.0
     ],
     "id": "obj-5"
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
      150,
      76,
      22.0
     ],
     "id": "obj-6"
    }
   },
   {
    "box": {
     "appearance": 1,
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      130,
      70,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      98,
      48,
      18,
      18
     ],
     "varname": "dens_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Density range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.dens",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-7",
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
     "maxclass": "newobj",
     "text": "prepend r dens",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      130,
      126,
      100,
      22.0
     ],
     "id": "obj-8"
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
      150,
      76,
      22.0
     ],
     "id": "obj-9"
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
      240,
      70,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      119,
      50.5,
      36,
      13
     ],
     "varname": "dens_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Density mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.dens",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-10"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m dens",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      240,
      126,
      100,
      22.0
     ],
     "id": "obj-11"
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
      150,
      76,
      22.0
     ],
     "id": "obj-12"
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
      180,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      167,
      0,
      44,
      48
     ],
     "varname": "cont_b",
     "annotation": "Positive: the next wait resembles the last. Negative: it contrasts.",
     "annotation_name": "Continuity",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.cont",
       "parameter_shortname": "Continuity",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-13",
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
     "maxclass": "newobj",
     "text": "prepend b cont",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      236,
      100,
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
      20,
      260,
      76,
      22.0
     ],
     "id": "obj-15"
    }
   },
   {
    "box": {
     "appearance": 1,
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      130,
      180,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      160,
      48,
      18,
      18
     ],
     "varname": "cont_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Continuity range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.cont",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-16",
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
     "maxclass": "newobj",
     "text": "prepend r cont",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      130,
      236,
      100,
      22.0
     ],
     "id": "obj-17"
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
      260,
      76,
      22.0
     ],
     "id": "obj-18"
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
      240,
      180,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      181,
      50.5,
      36,
      13
     ],
     "varname": "cont_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Continuity mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.cont",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-19"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m cont",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      240,
      236,
      100,
      22.0
     ],
     "id": "obj-20"
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
      260,
      76,
      22.0
     ],
     "id": "obj-21"
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
      290,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      105,
      66,
      44,
      48
     ],
     "varname": "swing_b",
     "annotation": "Delays offbeat 16ths. 100% is a triplet shuffle.",
     "annotation_name": "Swing",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.swing",
       "parameter_shortname": "Swing",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-22",
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
     "maxclass": "newobj",
     "text": "prepend b swing",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      346,
      107,
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
      20,
      370,
      76,
      22.0
     ],
     "id": "obj-24"
    }
   },
   {
    "box": {
     "appearance": 1,
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      130,
      290,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      98,
      114,
      18,
      18
     ],
     "varname": "swing_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Swing range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.swing",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-25",
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
     "maxclass": "newobj",
     "text": "prepend r swing",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      130,
      346,
      107,
      22.0
     ],
     "id": "obj-26"
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
      370,
      76,
      22.0
     ],
     "id": "obj-27"
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
      240,
      290,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      119,
      116.5,
      36,
      13
     ],
     "varname": "swing_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Swing mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.swing",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-28"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m swing",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      240,
      346,
      107,
      22.0
     ],
     "id": "obj-29"
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
      370,
      76,
      22.0
     ],
     "id": "obj-30"
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
      400,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      167,
      66,
      44,
      48
     ],
     "varname": "nudge_b",
     "annotation": "Shifts this file early or late.",
     "annotation_name": "Nudge",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.nudge",
       "parameter_shortname": "Nudge",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": -30.0,
       "parameter_mmax": 30.0,
       "parameter_unitstyle": 2,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-31",
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
     "maxclass": "newobj",
     "text": "prepend b nudge",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      456,
      107,
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
      20,
      480,
      76,
      22.0
     ],
     "id": "obj-33"
    }
   },
   {
    "box": {
     "appearance": 1,
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      130,
      400,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      160,
      114,
      18,
      18
     ],
     "varname": "nudge_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Nudge range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.nudge",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-34",
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
     "maxclass": "newobj",
     "text": "prepend r nudge",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      130,
      456,
      107,
      22.0
     ],
     "id": "obj-35"
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
      480,
      76,
      22.0
     ],
     "id": "obj-36"
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
      240,
      400,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      181,
      116.5,
      36,
      13
     ],
     "varname": "nudge_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Nudge mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.nudge",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-37"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m nudge",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      240,
      456,
      107,
      22.0
     ],
     "id": "obj-38"
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
      480,
      76,
      22.0
     ],
     "id": "obj-39"
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
      510,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      2,
      15,
      28,
      17
     ],
     "varname": "v1_v",
     "text": "1",
     "texton": "1",
     "mode": 1,
     "annotation": "Allow waits of 1 bar.",
     "annotation_name": "1",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.v1",
       "parameter_shortname": "1",
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
     "id": "obj-40"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend v v1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      534,
      88,
      22.0
     ],
     "id": "obj-41"
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
      558,
      76,
      22.0
     ],
     "id": "obj-42"
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
      590,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      32,
      15,
      28,
      17
     ],
     "varname": "v2_v",
     "text": "1/2",
     "texton": "1/2",
     "mode": 1,
     "annotation": "Allow waits of 1/2.",
     "annotation_name": "1/2",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.v2",
       "parameter_shortname": "1/2",
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
     "id": "obj-43"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend v v2",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      614,
      88,
      22.0
     ],
     "id": "obj-44"
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
      638,
      76,
      22.0
     ],
     "id": "obj-45"
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
      670,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      62,
      15,
      28,
      17
     ],
     "varname": "v4_v",
     "text": "1/4",
     "texton": "1/4",
     "mode": 1,
     "annotation": "Allow waits of 1/4.",
     "annotation_name": "1/4",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.v4",
       "parameter_shortname": "1/4",
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
     "id": "obj-46"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend v v4",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      694,
      88,
      22.0
     ],
     "id": "obj-47"
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
      718,
      76,
      22.0
     ],
     "id": "obj-48"
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
      750,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      2,
      36,
      28,
      17
     ],
     "varname": "v8_v",
     "text": "1/8",
     "texton": "1/8",
     "mode": 1,
     "annotation": "Allow waits of 1/8.",
     "annotation_name": "1/8",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.v8",
       "parameter_shortname": "1/8",
       "parameter_type": 2,
       "parameter_invisible": 2,
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
     "id": "obj-49"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend v v8",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      774,
      88,
      22.0
     ],
     "id": "obj-50"
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
      798,
      76,
      22.0
     ],
     "id": "obj-51"
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
      830,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      32,
      36,
      28,
      17
     ],
     "varname": "v16_v",
     "text": "1/16",
     "texton": "1/16",
     "mode": 1,
     "annotation": "Allow waits of 1/16.",
     "annotation_name": "1/16",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.v16",
       "parameter_shortname": "1/16",
       "parameter_type": 2,
       "parameter_invisible": 2,
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
     "id": "obj-52"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend v v16",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      854,
      94,
      22.0
     ],
     "id": "obj-53"
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
      878,
      76,
      22.0
     ],
     "id": "obj-54"
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
      910,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      62,
      36,
      28,
      17
     ],
     "varname": "v32_v",
     "text": "1/32",
     "texton": "1/32",
     "mode": 1,
     "annotation": "Allow waits of 1/32.",
     "annotation_name": "1/32",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.v32",
       "parameter_shortname": "1/32",
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
     "id": "obj-55"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend v v32",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      934,
      94,
      22.0
     ],
     "id": "obj-56"
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
      958,
      76,
      22.0
     ],
     "id": "obj-57"
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
      990,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      2,
      57,
      28,
      17
     ],
     "varname": "trip_v",
     "text": "Trip",
     "texton": "Trip",
     "mode": 1,
     "annotation": "Adds triplet versions of the active values.",
     "annotation_name": "Trip",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.trip",
       "parameter_shortname": "Trip",
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
     "id": "obj-58"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend v trip",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      1014,
      100,
      22.0
     ],
     "id": "obj-59"
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
      1038,
      76,
      22.0
     ],
     "id": "obj-60"
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
      1070,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      32,
      57,
      28,
      17
     ],
     "varname": "dot_v",
     "text": "Dot",
     "texton": "Dot",
     "mode": 1,
     "annotation": "Adds dotted versions of the active values.",
     "annotation_name": "Dot",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.dot",
       "parameter_shortname": "Dot",
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
     "id": "obj-61"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend v dot",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      1094,
      94,
      22.0
     ],
     "id": "obj-62"
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
      1118,
      76,
      22.0
     ],
     "id": "obj-63"
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
      1150,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      62,
      57,
      28,
      17
     ],
     "varname": "derived_v",
     "text": "Derive",
     "texton": "Derive",
     "mode": 1,
     "annotation": "Weights note values by the gaps between this file's own hits.",
     "annotation_name": "Derive",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.derived",
       "parameter_shortname": "Derive",
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
     "id": "obj-64"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend v derived",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      1174,
      119,
      22.0
     ],
     "id": "obj-65"
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
      1198,
      76,
      22.0
     ],
     "id": "obj-66"
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
      1230,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      252,
      132,
      28,
      13
     ],
     "varname": "dice_clock",
     "text": "Rnd",
     "texton": "Rnd",
     "mode": 0,
     "annotation": "Randomizes this tab for the selected file: values, ranges and modes.",
     "annotation_name": "Random Clock",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "dice.clock",
       "parameter_shortname": "Rnd",
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
     "id": "obj-67"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dice clock",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      1254,
      45,
      22.0
     ],
     "id": "obj-68"
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
      1302,
      76,
      22.0
     ],
     "id": "obj-70"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "2 \u00b7 SLICE",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      350,
      40,
      300,
      20.0
     ],
     "fontsize": 12.0,
     "id": "obj-71"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Mode",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      550,
      70,
      90,
      20.0
     ],
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      292,
      1,
      86,
      13
     ],
     "id": "obj-72"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Source",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      550,
      70,
      90,
      20.0
     ],
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      292,
      33,
      86,
      13
     ],
     "id": "obj-73"
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
      350,
      70,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      395,
      0,
      44,
      48
     ],
     "varname": "spread_b",
     "annotation": "How far Walk, Skip and Position choices can stray.",
     "annotation_name": "Spread",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.spread",
       "parameter_shortname": "Spread",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        30.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-74",
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
     "maxclass": "newobj",
     "text": "prepend b spread",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      350,
      126,
      113,
      22.0
     ],
     "id": "obj-75"
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
      150,
      76,
      22.0
     ],
     "id": "obj-76"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      70,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      388,
      48,
      18,
      18
     ],
     "varname": "spread_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Spread range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.spread",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-77",
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
     "maxclass": "newobj",
     "text": "prepend r spread",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      460,
      126,
      113,
      22.0
     ],
     "id": "obj-78"
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
      150,
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
      570,
      70,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      409,
      50.5,
      36,
      13
     ],
     "varname": "spread_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Spread mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.spread",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
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
     "text": "prepend m spread",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      570,
      126,
      113,
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
      570,
      150,
      76,
      22.0
     ],
     "id": "obj-82"
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
      350,
      180,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      457,
      0,
      44,
      48
     ],
     "varname": "wstr_b",
     "annotation": "Weighted mode: from equal odds to full weighting.",
     "annotation_name": "Strength",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.wstr",
       "parameter_shortname": "Strength",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-83",
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
     "maxclass": "newobj",
     "text": "prepend b wstr",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      350,
      236,
      100,
      22.0
     ],
     "id": "obj-84"
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
      260,
      76,
      22.0
     ],
     "id": "obj-85"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      180,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      450,
      48,
      18,
      18
     ],
     "varname": "wstr_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Strength range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.wstr",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-86",
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
     "maxclass": "newobj",
     "text": "prepend r wstr",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      460,
      236,
      100,
      22.0
     ],
     "id": "obj-87"
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
      260,
      76,
      22.0
     ],
     "id": "obj-88"
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
      570,
      180,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      471,
      50.5,
      36,
      13
     ],
     "varname": "wstr_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Strength mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.wstr",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-89"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m wstr",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      570,
      236,
      100,
      22.0
     ],
     "id": "obj-90"
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
      260,
      76,
      22.0
     ],
     "id": "obj-91"
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
      350,
      290,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      395,
      66,
      44,
      48
     ],
     "varname": "jump_b",
     "annotation": "Chance per tick to jump into another slice at the same position.",
     "annotation_name": "Jump",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.jump",
       "parameter_shortname": "Jump",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-92",
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
     "maxclass": "newobj",
     "text": "prepend b jump",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      350,
      346,
      100,
      22.0
     ],
     "id": "obj-93"
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
      370,
      76,
      22.0
     ],
     "id": "obj-94"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      290,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      388,
      114,
      18,
      18
     ],
     "varname": "jump_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Jump range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.jump",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-95",
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
     "maxclass": "newobj",
     "text": "prepend r jump",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      460,
      346,
      100,
      22.0
     ],
     "id": "obj-96"
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
      370,
      76,
      22.0
     ],
     "id": "obj-97"
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
      570,
      290,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      409,
      116.5,
      36,
      13
     ],
     "varname": "jump_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Jump mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.jump",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-98"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m jump",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      570,
      346,
      100,
      22.0
     ],
     "id": "obj-99"
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
      370,
      76,
      22.0
     ],
     "id": "obj-100"
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
      350,
      400,
      90,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      292,
      14,
      86,
      15
     ],
     "varname": "smode_v",
     "annotation": "How each hit picks a slice.",
     "annotation_name": "Mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.smode",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "Random",
        "Walk",
        "Skip",
        "Weighted",
        "Position"
       ],
       "parameter_mmax": 4.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-101"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend v smode",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      350,
      424,
      107,
      22.0
     ],
     "id": "obj-102"
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
      448,
      76,
      22.0
     ],
     "id": "obj-103"
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
      350,
      560,
      90,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      292,
      46,
      86,
      15
     ],
     "varname": "wsrc_v",
     "annotation": "Where Weighted mode gets each slice's weight. Manual: drag in the waveform's lower strip.",
     "annotation_name": "Source",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.wsrc",
       "parameter_shortname": "Source",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "Manual",
        "Loud",
        "Quiet",
        "Long",
        "Short",
        "Bright",
        "Dark"
       ],
       "parameter_mmax": 6.0,
       "parameter_initial": [
        0.0
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
     "text": "prepend v wsrc",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      350,
      584,
      100,
      22.0
     ],
     "id": "obj-108"
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
      608,
      76,
      22.0
     ],
     "id": "obj-109"
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
      640,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      542,
      132,
      28,
      13
     ],
     "varname": "dice_slice",
     "text": "Rnd",
     "texton": "Rnd",
     "mode": 0,
     "annotation": "Randomizes this tab for the selected file: values, ranges and modes.",
     "annotation_name": "Random Slice",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "dice.slice",
       "parameter_shortname": "Rnd",
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
     "id": "obj-110"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dice slice",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      350,
      664,
      45,
      22.0
     ],
     "id": "obj-111"
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
      712,
      76,
      22.0
     ],
     "id": "obj-113"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "3 \u00b7 PLAY",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      680,
      40,
      300,
      20.0
     ],
     "fontsize": 12.0,
     "id": "obj-114"
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
      680,
      70,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      589,
      0,
      44,
      48
     ],
     "varname": "start_b",
     "annotation": "Where playback begins inside the slice.",
     "annotation_name": "Start",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.start",
       "parameter_shortname": "Start",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-115",
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
     "maxclass": "newobj",
     "text": "prepend b start",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      680,
      126,
      107,
      22.0
     ],
     "id": "obj-116"
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
      680,
      150,
      76,
      22.0
     ],
     "id": "obj-117"
    }
   },
   {
    "box": {
     "appearance": 1,
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      790,
      70,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      582,
      48,
      18,
      18
     ],
     "varname": "start_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Start range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.start",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-118",
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
     "maxclass": "newobj",
     "text": "prepend r start",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      790,
      126,
      107,
      22.0
     ],
     "id": "obj-119"
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
      150,
      76,
      22.0
     ],
     "id": "obj-120"
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
      900,
      70,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      603,
      50.5,
      36,
      13
     ],
     "varname": "start_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Start mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.start",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-121"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m start",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      900,
      126,
      107,
      22.0
     ],
     "id": "obj-122"
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
      150,
      76,
      22.0
     ],
     "id": "obj-123"
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
      680,
      180,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      651,
      0,
      44,
      48
     ],
     "varname": "length_b",
     "annotation": "Shortens the slice from its start point.",
     "annotation_name": "Length",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.length",
       "parameter_shortname": "Length",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 1.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-124",
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
     "maxclass": "newobj",
     "text": "prepend b length",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      680,
      236,
      113,
      22.0
     ],
     "id": "obj-125"
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
      680,
      260,
      76,
      22.0
     ],
     "id": "obj-126"
    }
   },
   {
    "box": {
     "appearance": 1,
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      790,
      180,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      644,
      48,
      18,
      18
     ],
     "varname": "length_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Length range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.length",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-127",
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
     "maxclass": "newobj",
     "text": "prepend r length",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      790,
      236,
      113,
      22.0
     ],
     "id": "obj-128"
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
      260,
      76,
      22.0
     ],
     "id": "obj-129"
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
      900,
      180,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      665,
      50.5,
      36,
      13
     ],
     "varname": "length_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Length mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.length",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-130"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m length",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      900,
      236,
      113,
      22.0
     ],
     "id": "obj-131"
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
     "id": "obj-132"
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
      680,
      290,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      713,
      0,
      44,
      48
     ],
     "varname": "rev_b",
     "annotation": "Chance the slice plays backwards.",
     "annotation_name": "Reverse",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.rev",
       "parameter_shortname": "Reverse",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-133",
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
     "maxclass": "newobj",
     "text": "prepend b rev",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      680,
      346,
      94,
      22.0
     ],
     "id": "obj-134"
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
      680,
      370,
      76,
      22.0
     ],
     "id": "obj-135"
    }
   },
   {
    "box": {
     "appearance": 1,
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      790,
      290,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      706,
      48,
      18,
      18
     ],
     "varname": "rev_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Reverse range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.rev",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-136",
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
     "maxclass": "newobj",
     "text": "prepend r rev",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      790,
      346,
      94,
      22.0
     ],
     "id": "obj-137"
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
      370,
      76,
      22.0
     ],
     "id": "obj-138"
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
      900,
      290,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      727,
      50.5,
      36,
      13
     ],
     "varname": "rev_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Reverse mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.rev",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-139"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m rev",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      900,
      346,
      94,
      22.0
     ],
     "id": "obj-140"
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
      370,
      76,
      22.0
     ],
     "id": "obj-141"
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
      680,
      400,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      775,
      0,
      44,
      48
     ],
     "varname": "loop_b",
     "annotation": "Loops a section of this size. 0 is off.",
     "annotation_name": "Loop",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.loop",
       "parameter_shortname": "Loop",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-142",
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
     "maxclass": "newobj",
     "text": "prepend b loop",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      680,
      456,
      100,
      22.0
     ],
     "id": "obj-143"
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
      680,
      480,
      76,
      22.0
     ],
     "id": "obj-144"
    }
   },
   {
    "box": {
     "appearance": 1,
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      790,
      400,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      768,
      48,
      18,
      18
     ],
     "varname": "loop_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Loop range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.loop",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-145",
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
     "maxclass": "newobj",
     "text": "prepend r loop",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      790,
      456,
      100,
      22.0
     ],
     "id": "obj-146"
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
      480,
      76,
      22.0
     ],
     "id": "obj-147"
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
      900,
      400,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      789,
      50.5,
      36,
      13
     ],
     "varname": "loop_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Loop mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.loop",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-148"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m loop",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      900,
      456,
      100,
      22.0
     ],
     "id": "obj-149"
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
      480,
      76,
      22.0
     ],
     "id": "obj-150"
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
      510,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      832,
      132,
      28,
      13
     ],
     "varname": "dice_play",
     "text": "Rnd",
     "texton": "Rnd",
     "mode": 0,
     "annotation": "Randomizes this tab for the selected file: values, ranges and modes.",
     "annotation_name": "Random Play",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "dice.play",
       "parameter_shortname": "Rnd",
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
     "id": "obj-151"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dice play",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      680,
      534,
      45,
      22.0
     ],
     "id": "obj-152"
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
      680,
      582,
      76,
      22.0
     ],
     "id": "obj-154"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "4 \u00b7 PITCH",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1010,
      40,
      300,
      20.0
     ],
     "fontsize": 12.0,
     "id": "obj-155"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Engine",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1210,
      70,
      90,
      20.0
     ],
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      872,
      1,
      86,
      13
     ],
     "id": "obj-156"
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
      1010,
      70,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      975,
      0,
      44,
      48
     ],
     "varname": "pitch_b",
     "annotation": "Knob tunes the file. Range sets per-hit pitch, quantized to the scale.",
     "annotation_name": "Pitch",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.pitch",
       "parameter_shortname": "Pitch",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-157",
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
     "maxclass": "newobj",
     "text": "prepend b pitch",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1010,
      126,
      107,
      22.0
     ],
     "id": "obj-158"
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
      1010,
      150,
      76,
      22.0
     ],
     "id": "obj-159"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      70,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      968,
      48,
      18,
      18
     ],
     "varname": "pitch_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Pitch range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.pitch",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-160",
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
     "maxclass": "newobj",
     "text": "prepend r pitch",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1120,
      126,
      107,
      22.0
     ],
     "id": "obj-161"
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
      150,
      76,
      22.0
     ],
     "id": "obj-162"
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
      1230,
      70,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      989,
      50.5,
      36,
      13
     ],
     "varname": "pitch_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Pitch mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.pitch",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-163"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m pitch",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1230,
      126,
      107,
      22.0
     ],
     "id": "obj-164"
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
      1230,
      150,
      76,
      22.0
     ],
     "id": "obj-165"
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
      1010,
      180,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1037,
      0,
      44,
      48
     ],
     "varname": "penv_b",
     "annotation": "Pitch jump at the start of each hit.",
     "annotation_name": "P.Env",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.penv",
       "parameter_shortname": "P.Env",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-166",
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
     "maxclass": "newobj",
     "text": "prepend b penv",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1010,
      236,
      100,
      22.0
     ],
     "id": "obj-167"
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
      1010,
      260,
      76,
      22.0
     ],
     "id": "obj-168"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      180,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1030,
      48,
      18,
      18
     ],
     "varname": "penv_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "P.Env range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.penv",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-169",
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
     "maxclass": "newobj",
     "text": "prepend r penv",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1120,
      236,
      100,
      22.0
     ],
     "id": "obj-170"
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
      260,
      76,
      22.0
     ],
     "id": "obj-171"
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
      1230,
      180,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1051,
      50.5,
      36,
      13
     ],
     "varname": "penv_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "P.Env mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.penv",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-172"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m penv",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1230,
      236,
      100,
      22.0
     ],
     "id": "obj-173"
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
      1230,
      260,
      76,
      22.0
     ],
     "id": "obj-174"
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
      1010,
      290,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      975,
      66,
      44,
      48
     ],
     "varname": "pdec_b",
     "annotation": "How fast the pitch jump settles.",
     "annotation_name": "P.Decay",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.pdec",
       "parameter_shortname": "P.Decay",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 5.0,
       "parameter_mmax": 1000.0,
       "parameter_unitstyle": 2,
       "parameter_initial": [
        80.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 3.0
      }
     },
     "id": "obj-175",
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
     "maxclass": "newobj",
     "text": "prepend b pdec",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1010,
      346,
      100,
      22.0
     ],
     "id": "obj-176"
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
      1010,
      370,
      76,
      22.0
     ],
     "id": "obj-177"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      290,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      968,
      114,
      18,
      18
     ],
     "varname": "pdec_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "P.Decay range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.pdec",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-178",
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
     "maxclass": "newobj",
     "text": "prepend r pdec",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1120,
      346,
      100,
      22.0
     ],
     "id": "obj-179"
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
      370,
      76,
      22.0
     ],
     "id": "obj-180"
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
      1230,
      290,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      989,
      116.5,
      36,
      13
     ],
     "varname": "pdec_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "P.Decay mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.pdec",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-181"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m pdec",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1230,
      346,
      100,
      22.0
     ],
     "id": "obj-182"
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
      1230,
      370,
      76,
      22.0
     ],
     "id": "obj-183"
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
      1010,
      400,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1037,
      66,
      44,
      48
     ],
     "varname": "glide_b",
     "annotation": "Slides from the previous hit's pitch.",
     "annotation_name": "Glide",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.glide",
       "parameter_shortname": "Glide",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 500.0,
       "parameter_unitstyle": 2,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 2.0
      }
     },
     "id": "obj-184",
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
     "maxclass": "newobj",
     "text": "prepend b glide",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1010,
      456,
      107,
      22.0
     ],
     "id": "obj-185"
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
      1010,
      480,
      76,
      22.0
     ],
     "id": "obj-186"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      400,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1030,
      114,
      18,
      18
     ],
     "varname": "glide_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Glide range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.glide",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-187",
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
     "maxclass": "newobj",
     "text": "prepend r glide",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1120,
      456,
      107,
      22.0
     ],
     "id": "obj-188"
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
      480,
      76,
      22.0
     ],
     "id": "obj-189"
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
      1230,
      400,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1051,
      116.5,
      36,
      13
     ],
     "varname": "glide_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Glide mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.glide",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-190"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m glide",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1230,
      456,
      107,
      22.0
     ],
     "id": "obj-191"
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
      1230,
      480,
      76,
      22.0
     ],
     "id": "obj-192"
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
      1010,
      510,
      90,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      872,
      14,
      86,
      15
     ],
     "varname": "engine_v",
     "annotation": "Tape: pitch changes length. Grain: length stays.",
     "annotation_name": "Engine",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.engine",
       "parameter_shortname": "Engine",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "Tape",
        "Grain"
       ],
       "parameter_mmax": 1.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-193"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend v engine",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1010,
      534,
      113,
      22.0
     ],
     "id": "obj-194"
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
      1010,
      558,
      76,
      22.0
     ],
     "id": "obj-195"
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
      1010,
      590,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      1122,
      132,
      28,
      13
     ],
     "varname": "dice_pitch",
     "text": "Rnd",
     "texton": "Rnd",
     "mode": 0,
     "annotation": "Randomizes this tab for the selected file: values, ranges and modes.",
     "annotation_name": "Random Pitch",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "dice.pitch",
       "parameter_shortname": "Rnd",
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
     "id": "obj-196"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dice pitch",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1010,
      614,
      45,
      22.0
     ],
     "id": "obj-197"
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
      1010,
      662,
      76,
      22.0
     ],
     "id": "obj-199"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "5 \u00b7 ENV",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1340,
      40,
      300,
      20.0
     ],
     "fontsize": 12.0,
     "id": "obj-200"
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
      70,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1169,
      0,
      44,
      48
     ],
     "varname": "att_b",
     "annotation": "Fade-in time.",
     "annotation_name": "Attack",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.att",
       "parameter_shortname": "Attack",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 1000.0,
       "parameter_unitstyle": 2,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 3.0
      }
     },
     "id": "obj-201",
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
     "maxclass": "newobj",
     "text": "prepend b att",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1340,
      126,
      94,
      22.0
     ],
     "id": "obj-202"
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
      1340,
      150,
      76,
      22.0
     ],
     "id": "obj-203"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      70,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1162,
      48,
      18,
      18
     ],
     "varname": "att_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Attack range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.att",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-204",
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
     "maxclass": "newobj",
     "text": "prepend r att",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1450,
      126,
      94,
      22.0
     ],
     "id": "obj-205"
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
      1450,
      150,
      76,
      22.0
     ],
     "id": "obj-206"
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
      1560,
      70,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1183,
      50.5,
      36,
      13
     ],
     "varname": "att_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Attack mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.att",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-207"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m att",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1560,
      126,
      94,
      22.0
     ],
     "id": "obj-208"
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
      150,
      76,
      22.0
     ],
     "id": "obj-209"
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
      180,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1231,
      0,
      44,
      48
     ],
     "varname": "dec_b",
     "annotation": "Fade-out time before the gate ends.",
     "annotation_name": "Decay",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.dec",
       "parameter_shortname": "Decay",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 5.0,
       "parameter_mmax": 2000.0,
       "parameter_unitstyle": 2,
       "parameter_initial": [
        10.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 3.0
      }
     },
     "id": "obj-210",
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
     "maxclass": "newobj",
     "text": "prepend b dec",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1340,
      236,
      94,
      22.0
     ],
     "id": "obj-211"
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
      1340,
      260,
      76,
      22.0
     ],
     "id": "obj-212"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      180,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1224,
      48,
      18,
      18
     ],
     "varname": "dec_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Decay range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.dec",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-213",
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
     "maxclass": "newobj",
     "text": "prepend r dec",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1450,
      236,
      94,
      22.0
     ],
     "id": "obj-214"
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
      1450,
      260,
      76,
      22.0
     ],
     "id": "obj-215"
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
      1560,
      180,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1245,
      50.5,
      36,
      13
     ],
     "varname": "dec_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Decay mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.dec",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-216"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m dec",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1560,
      236,
      94,
      22.0
     ],
     "id": "obj-217"
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
      260,
      76,
      22.0
     ],
     "id": "obj-218"
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
      290,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1293,
      0,
      44,
      48
     ],
     "varname": "gate_b",
     "annotation": "How much of the slice plays.",
     "annotation_name": "Gate",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.gate",
       "parameter_shortname": "Gate",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 1.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-219",
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
     "maxclass": "newobj",
     "text": "prepend b gate",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1340,
      346,
      100,
      22.0
     ],
     "id": "obj-220"
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
      1340,
      370,
      76,
      22.0
     ],
     "id": "obj-221"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      290,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1286,
      48,
      18,
      18
     ],
     "varname": "gate_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Gate range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.gate",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-222",
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
     "maxclass": "newobj",
     "text": "prepend r gate",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1450,
      346,
      100,
      22.0
     ],
     "id": "obj-223"
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
      1450,
      370,
      76,
      22.0
     ],
     "id": "obj-224"
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
      1560,
      290,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1307,
      50.5,
      36,
      13
     ],
     "varname": "gate_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Gate mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.gate",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-225"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m gate",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1560,
      346,
      100,
      22.0
     ],
     "id": "obj-226"
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
      370,
      76,
      22.0
     ],
     "id": "obj-227"
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
      400,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1355,
      0,
      44,
      48
     ],
     "varname": "vol_b",
     "annotation": "Hit level.",
     "annotation_name": "Volume",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.vol",
       "parameter_shortname": "Volume",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": -36.0,
       "parameter_mmax": 6.0,
       "parameter_unitstyle": 4,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-228",
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
     "maxclass": "newobj",
     "text": "prepend b vol",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1340,
      456,
      94,
      22.0
     ],
     "id": "obj-229"
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
      1340,
      480,
      76,
      22.0
     ],
     "id": "obj-230"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      400,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1348,
      48,
      18,
      18
     ],
     "varname": "vol_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Volume range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.vol",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-231",
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
     "maxclass": "newobj",
     "text": "prepend r vol",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1450,
      456,
      94,
      22.0
     ],
     "id": "obj-232"
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
      1450,
      480,
      76,
      22.0
     ],
     "id": "obj-233"
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
      1560,
      400,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1369,
      50.5,
      36,
      13
     ],
     "varname": "vol_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Volume mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.vol",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-234"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m vol",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1560,
      456,
      94,
      22.0
     ],
     "id": "obj-235"
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
      480,
      76,
      22.0
     ],
     "id": "obj-236"
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
      510,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1169,
      66,
      44,
      48
     ],
     "varname": "pan_b",
     "annotation": "Stereo position.",
     "annotation_name": "Pan",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.pan",
       "parameter_shortname": "Pan",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": -100.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 6,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-237",
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
     "maxclass": "newobj",
     "text": "prepend b pan",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1340,
      566,
      94,
      22.0
     ],
     "id": "obj-238"
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
      1340,
      590,
      76,
      22.0
     ],
     "id": "obj-239"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      510,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1162,
      114,
      18,
      18
     ],
     "varname": "pan_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Pan range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.pan",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-240",
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
     "maxclass": "newobj",
     "text": "prepend r pan",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1450,
      566,
      94,
      22.0
     ],
     "id": "obj-241"
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
      1450,
      590,
      76,
      22.0
     ],
     "id": "obj-242"
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
      1560,
      510,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1183,
      116.5,
      36,
      13
     ],
     "varname": "pan_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Pan mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.pan",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-243"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m pan",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1560,
      566,
      94,
      22.0
     ],
     "id": "obj-244"
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
      590,
      76,
      22.0
     ],
     "id": "obj-245"
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
      620,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1231,
      66,
      44,
      48
     ],
     "varname": "width_b",
     "annotation": "Stereo width of the slice.",
     "annotation_name": "Width",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.width",
       "parameter_shortname": "Width",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 200.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-246",
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
     "maxclass": "newobj",
     "text": "prepend b width",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1340,
      676,
      107,
      22.0
     ],
     "id": "obj-247"
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
      1340,
      700,
      76,
      22.0
     ],
     "id": "obj-248"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      620,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1224,
      114,
      18,
      18
     ],
     "varname": "width_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Width range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.width",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-249",
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
     "maxclass": "newobj",
     "text": "prepend r width",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1450,
      676,
      107,
      22.0
     ],
     "id": "obj-250"
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
      1450,
      700,
      76,
      22.0
     ],
     "id": "obj-251"
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
      1560,
      620,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1245,
      116.5,
      36,
      13
     ],
     "varname": "width_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Width mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.width",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-252"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m width",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1560,
      676,
      107,
      22.0
     ],
     "id": "obj-253"
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
      700,
      76,
      22.0
     ],
     "id": "obj-254"
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
      730,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      1412,
      132,
      28,
      13
     ],
     "varname": "dice_env",
     "text": "Rnd",
     "texton": "Rnd",
     "mode": 0,
     "annotation": "Randomizes this tab for the selected file: values, ranges and modes.",
     "annotation_name": "Random Env",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "dice.env",
       "parameter_shortname": "Rnd",
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
     "id": "obj-255"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dice env",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1340,
      754,
      45,
      22.0
     ],
     "id": "obj-256"
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
      1340,
      802,
      76,
      22.0
     ],
     "id": "obj-258"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "6 \u00b7 FILTER",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1670,
      40,
      300,
      20.0
     ],
     "fontsize": 12.0,
     "id": "obj-259"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Type",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1870,
      70,
      90,
      20.0
     ],
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      1452,
      1,
      86,
      13
     ],
     "id": "obj-260"
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
      70,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1555,
      0,
      44,
      48
     ],
     "varname": "cut_b",
     "annotation": "Filter frequency.",
     "annotation_name": "Cutoff",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.cut",
       "parameter_shortname": "Cutoff",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 20.0,
       "parameter_mmax": 20000.0,
       "parameter_unitstyle": 3,
       "parameter_initial": [
        20000.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 3.0
      }
     },
     "id": "obj-261",
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
     "maxclass": "newobj",
     "text": "prepend b cut",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1670,
      126,
      94,
      22.0
     ],
     "id": "obj-262"
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
      1670,
      150,
      76,
      22.0
     ],
     "id": "obj-263"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      70,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1548,
      48,
      18,
      18
     ],
     "varname": "cut_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Cutoff range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.cut",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-264",
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
     "maxclass": "newobj",
     "text": "prepend r cut",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1780,
      126,
      94,
      22.0
     ],
     "id": "obj-265"
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
      1780,
      150,
      76,
      22.0
     ],
     "id": "obj-266"
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
      1890,
      70,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1569,
      50.5,
      36,
      13
     ],
     "varname": "cut_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Cutoff mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.cut",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-267"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m cut",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1890,
      126,
      94,
      22.0
     ],
     "id": "obj-268"
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
      1890,
      150,
      76,
      22.0
     ],
     "id": "obj-269"
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
      180,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1617,
      0,
      44,
      48
     ],
     "varname": "res_b",
     "annotation": "Resonance.",
     "annotation_name": "Res",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.res",
       "parameter_shortname": "Res",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-270",
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
     "maxclass": "newobj",
     "text": "prepend b res",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1670,
      236,
      94,
      22.0
     ],
     "id": "obj-271"
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
      1670,
      260,
      76,
      22.0
     ],
     "id": "obj-272"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      180,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1610,
      48,
      18,
      18
     ],
     "varname": "res_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Res range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.res",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-273",
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
     "maxclass": "newobj",
     "text": "prepend r res",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1780,
      236,
      94,
      22.0
     ],
     "id": "obj-274"
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
      1780,
      260,
      76,
      22.0
     ],
     "id": "obj-275"
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
      1890,
      180,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1631,
      50.5,
      36,
      13
     ],
     "varname": "res_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Res mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.res",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-276"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m res",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1890,
      236,
      94,
      22.0
     ],
     "id": "obj-277"
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
      1890,
      260,
      76,
      22.0
     ],
     "id": "obj-278"
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
      290,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1555,
      66,
      44,
      48
     ],
     "varname": "fenv_b",
     "annotation": "Sweep depth on each hit, up to 4 octaves.",
     "annotation_name": "F.Env",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.fenv",
       "parameter_shortname": "F.Env",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-279",
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
     "maxclass": "newobj",
     "text": "prepend b fenv",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1670,
      346,
      100,
      22.0
     ],
     "id": "obj-280"
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
      1670,
      370,
      76,
      22.0
     ],
     "id": "obj-281"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      290,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1548,
      114,
      18,
      18
     ],
     "varname": "fenv_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "F.Env range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.fenv",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-282",
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
     "maxclass": "newobj",
     "text": "prepend r fenv",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1780,
      346,
      100,
      22.0
     ],
     "id": "obj-283"
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
      1780,
      370,
      76,
      22.0
     ],
     "id": "obj-284"
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
      1890,
      290,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1569,
      116.5,
      36,
      13
     ],
     "varname": "fenv_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "F.Env mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.fenv",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-285"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m fenv",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1890,
      346,
      100,
      22.0
     ],
     "id": "obj-286"
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
      1890,
      370,
      76,
      22.0
     ],
     "id": "obj-287"
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
      400,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1617,
      66,
      44,
      48
     ],
     "varname": "fdec_b",
     "annotation": "Sweep time.",
     "annotation_name": "F.Decay",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.fdec",
       "parameter_shortname": "F.Decay",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 5.0,
       "parameter_mmax": 2000.0,
       "parameter_unitstyle": 2,
       "parameter_initial": [
        150.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 3.0
      }
     },
     "id": "obj-288",
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
     "maxclass": "newobj",
     "text": "prepend b fdec",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1670,
      456,
      100,
      22.0
     ],
     "id": "obj-289"
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
      1670,
      480,
      76,
      22.0
     ],
     "id": "obj-290"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      400,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1610,
      114,
      18,
      18
     ],
     "varname": "fdec_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "F.Decay range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.fdec",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-291",
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
     "maxclass": "newobj",
     "text": "prepend r fdec",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1780,
      456,
      100,
      22.0
     ],
     "id": "obj-292"
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
      1780,
      480,
      76,
      22.0
     ],
     "id": "obj-293"
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
      1890,
      400,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1631,
      116.5,
      36,
      13
     ],
     "varname": "fdec_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "F.Decay mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.fdec",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-294"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m fdec",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1890,
      456,
      100,
      22.0
     ],
     "id": "obj-295"
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
      1890,
      480,
      76,
      22.0
     ],
     "id": "obj-296"
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
      510,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1679,
      0,
      44,
      48
     ],
     "varname": "track_b",
     "annotation": "Cutoff follows the hit's pitch.",
     "annotation_name": "Track",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.track",
       "parameter_shortname": "Track",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-297",
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
     "maxclass": "newobj",
     "text": "prepend b track",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1670,
      566,
      107,
      22.0
     ],
     "id": "obj-298"
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
      1670,
      590,
      76,
      22.0
     ],
     "id": "obj-299"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      510,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1672,
      48,
      18,
      18
     ],
     "varname": "track_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Track range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.track",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-300",
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
     "maxclass": "newobj",
     "text": "prepend r track",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1780,
      566,
      107,
      22.0
     ],
     "id": "obj-301"
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
      1780,
      590,
      76,
      22.0
     ],
     "id": "obj-302"
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
      1890,
      510,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1693,
      50.5,
      36,
      13
     ],
     "varname": "track_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Track mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.track",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-303"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m track",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1890,
      566,
      107,
      22.0
     ],
     "id": "obj-304"
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
      1890,
      590,
      76,
      22.0
     ],
     "id": "obj-305"
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
      620,
      90,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      1452,
      14,
      86,
      15
     ],
     "varname": "ftype_v",
     "annotation": "Filter shape.",
     "annotation_name": "Type",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.ftype",
       "parameter_shortname": "Type",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "LP",
        "HP",
        "BP"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-306"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend v ftype",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1670,
      644,
      107,
      22.0
     ],
     "id": "obj-307"
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
      1670,
      668,
      76,
      22.0
     ],
     "id": "obj-308"
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
      1670,
      700,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      1702,
      132,
      28,
      13
     ],
     "varname": "dice_filter",
     "text": "Rnd",
     "texton": "Rnd",
     "mode": 0,
     "annotation": "Randomizes this tab for the selected file: values, ranges and modes.",
     "annotation_name": "Random Filter",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "dice.filter",
       "parameter_shortname": "Rnd",
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
     "id": "obj-309"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dice filter",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1670,
      724,
      45,
      22.0
     ],
     "id": "obj-310"
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
      1670,
      772,
      76,
      22.0
     ],
     "id": "obj-312"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "7 \u00b7 REPEAT",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      2000,
      40,
      300,
      20.0
     ],
     "fontsize": 12.0,
     "id": "obj-313"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Spacing",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      2200,
      70,
      90,
      20.0
     ],
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      1744,
      1,
      54,
      13
     ],
     "id": "obj-314"
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
      70,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1811,
      0,
      44,
      48
     ],
     "varname": "rchance_b",
     "annotation": "How often a hit repeats.",
     "annotation_name": "Chance",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.rchance",
       "parameter_shortname": "Chance",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-315",
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
     "maxclass": "newobj",
     "text": "prepend b rchance",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2000,
      126,
      119,
      22.0
     ],
     "id": "obj-316"
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
      2000,
      150,
      76,
      22.0
     ],
     "id": "obj-317"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      70,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1804,
      48,
      18,
      18
     ],
     "varname": "rchance_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Chance range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.rchance",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-318",
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
     "maxclass": "newobj",
     "text": "prepend r rchance",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2110,
      126,
      119,
      22.0
     ],
     "id": "obj-319"
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
      2110,
      150,
      76,
      22.0
     ],
     "id": "obj-320"
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
      2220,
      70,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1825,
      50.5,
      36,
      13
     ],
     "varname": "rchance_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Chance mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.rchance",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-321"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m rchance",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2220,
      126,
      119,
      22.0
     ],
     "id": "obj-322"
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
      2220,
      150,
      76,
      22.0
     ],
     "id": "obj-323"
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
      180,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1873,
      0,
      44,
      48
     ],
     "varname": "rcount_b",
     "annotation": "Number of repeats.",
     "annotation_name": "Count",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.rcount",
       "parameter_shortname": "Count",
       "parameter_type": 1,
       "parameter_invisible": 2,
       "parameter_mmin": 1.0,
       "parameter_mmax": 16.0,
       "parameter_unitstyle": 0,
       "parameter_initial": [
        3.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-324",
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
     "maxclass": "newobj",
     "text": "prepend b rcount",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2000,
      236,
      113,
      22.0
     ],
     "id": "obj-325"
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
      2000,
      260,
      76,
      22.0
     ],
     "id": "obj-326"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      180,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1866,
      48,
      18,
      18
     ],
     "varname": "rcount_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Count range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.rcount",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-327",
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
     "maxclass": "newobj",
     "text": "prepend r rcount",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2110,
      236,
      113,
      22.0
     ],
     "id": "obj-328"
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
      2110,
      260,
      76,
      22.0
     ],
     "id": "obj-329"
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
      2220,
      180,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1887,
      50.5,
      36,
      13
     ],
     "varname": "rcount_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Count mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.rcount",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-330"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m rcount",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2220,
      236,
      113,
      22.0
     ],
     "id": "obj-331"
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
      2220,
      260,
      76,
      22.0
     ],
     "id": "obj-332"
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
      290,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1935,
      0,
      44,
      48
     ],
     "varname": "rshape_b",
     "annotation": "Positive speeds up, negative slows down.",
     "annotation_name": "Shape",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.rshape",
       "parameter_shortname": "Shape",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-333",
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
     "maxclass": "newobj",
     "text": "prepend b rshape",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2000,
      346,
      113,
      22.0
     ],
     "id": "obj-334"
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
      2000,
      370,
      76,
      22.0
     ],
     "id": "obj-335"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      290,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1928,
      48,
      18,
      18
     ],
     "varname": "rshape_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Shape range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.rshape",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-336",
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
     "maxclass": "newobj",
     "text": "prepend r rshape",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2110,
      346,
      113,
      22.0
     ],
     "id": "obj-337"
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
      2110,
      370,
      76,
      22.0
     ],
     "id": "obj-338"
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
      2220,
      290,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1949,
      50.5,
      36,
      13
     ],
     "varname": "rshape_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Shape mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.rshape",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-339"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m rshape",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2220,
      346,
      113,
      22.0
     ],
     "id": "obj-340"
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
      2220,
      370,
      76,
      22.0
     ],
     "id": "obj-341"
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
      400,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1749,
      66,
      44,
      48
     ],
     "varname": "rvol_b",
     "annotation": "Repeats get quieter or louder.",
     "annotation_name": "Fade",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.rvol",
       "parameter_shortname": "Fade",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": -100.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        -40.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-342",
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
     "maxclass": "newobj",
     "text": "prepend b rvol",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2000,
      456,
      100,
      22.0
     ],
     "id": "obj-343"
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
      2000,
      480,
      76,
      22.0
     ],
     "id": "obj-344"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      400,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1742,
      114,
      18,
      18
     ],
     "varname": "rvol_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Fade range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.rvol",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-345",
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
     "maxclass": "newobj",
     "text": "prepend r rvol",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2110,
      456,
      100,
      22.0
     ],
     "id": "obj-346"
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
      2110,
      480,
      76,
      22.0
     ],
     "id": "obj-347"
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
      2220,
      400,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1763,
      116.5,
      36,
      13
     ],
     "varname": "rvol_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Fade mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.rvol",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-348"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m rvol",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2220,
      456,
      100,
      22.0
     ],
     "id": "obj-349"
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
      2220,
      480,
      76,
      22.0
     ],
     "id": "obj-350"
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
      510,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1811,
      66,
      44,
      48
     ],
     "varname": "rstep_b",
     "annotation": "Scale steps added per repeat.",
     "annotation_name": "Step",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.rstep",
       "parameter_shortname": "Step",
       "parameter_type": 1,
       "parameter_invisible": 2,
       "parameter_mmin": -7.0,
       "parameter_mmax": 7.0,
       "parameter_unitstyle": 0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-351",
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
     "maxclass": "newobj",
     "text": "prepend b rstep",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2000,
      566,
      107,
      22.0
     ],
     "id": "obj-352"
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
      2000,
      590,
      76,
      22.0
     ],
     "id": "obj-353"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      510,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1804,
      114,
      18,
      18
     ],
     "varname": "rstep_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Step range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.rstep",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-354",
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
     "maxclass": "newobj",
     "text": "prepend r rstep",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2110,
      566,
      107,
      22.0
     ],
     "id": "obj-355"
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
      2110,
      590,
      76,
      22.0
     ],
     "id": "obj-356"
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
      2220,
      510,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1825,
      116.5,
      36,
      13
     ],
     "varname": "rstep_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Step mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.rstep",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-357"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m rstep",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2220,
      566,
      107,
      22.0
     ],
     "id": "obj-358"
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
      2220,
      590,
      76,
      22.0
     ],
     "id": "obj-359"
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
      620,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1873,
      66,
      44,
      48
     ],
     "varname": "rsame_b",
     "annotation": "100% stutters one slice. 0% bursts new slices.",
     "annotation_name": "Same",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.rsame",
       "parameter_shortname": "Same",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-360",
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
     "maxclass": "newobj",
     "text": "prepend b rsame",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2000,
      676,
      107,
      22.0
     ],
     "id": "obj-361"
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
      2000,
      700,
      76,
      22.0
     ],
     "id": "obj-362"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      620,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1866,
      114,
      18,
      18
     ],
     "varname": "rsame_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Same range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.rsame",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-363",
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
     "maxclass": "newobj",
     "text": "prepend r rsame",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2110,
      676,
      107,
      22.0
     ],
     "id": "obj-364"
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
      2110,
      700,
      76,
      22.0
     ],
     "id": "obj-365"
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
      2220,
      620,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1887,
      116.5,
      36,
      13
     ],
     "varname": "rsame_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Same mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.rsame",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-366"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m rsame",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2220,
      676,
      107,
      22.0
     ],
     "id": "obj-367"
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
      2220,
      700,
      76,
      22.0
     ],
     "id": "obj-368"
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
      730,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1935,
      66,
      44,
      48
     ],
     "varname": "rvar_b",
     "annotation": "Chance each repeat rerolls its random values.",
     "annotation_name": "Vary",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.rvar",
       "parameter_shortname": "Vary",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-369",
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
     "maxclass": "newobj",
     "text": "prepend b rvar",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2000,
      786,
      100,
      22.0
     ],
     "id": "obj-370"
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
      2000,
      810,
      76,
      22.0
     ],
     "id": "obj-371"
    }
   },
   {
    "box": {
     "appearance": 1,
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
      730,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1928,
      114,
      18,
      18
     ],
     "varname": "rvar_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Vary range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.rvar",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-372",
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
     "maxclass": "newobj",
     "text": "prepend r rvar",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2110,
      786,
      100,
      22.0
     ],
     "id": "obj-373"
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
      2110,
      810,
      76,
      22.0
     ],
     "id": "obj-374"
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
      2220,
      730,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      1949,
      116.5,
      36,
      13
     ],
     "varname": "rvar_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Vary mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.rvar",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-375"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m rvar",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2220,
      786,
      100,
      22.0
     ],
     "id": "obj-376"
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
      2220,
      810,
      76,
      22.0
     ],
     "id": "obj-377"
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
      2000,
      840,
      90,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      1744,
      14,
      54,
      15
     ],
     "varname": "rspace_v",
     "annotation": "Base time between repeats.",
     "annotation_name": "Spacing",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.rspace",
       "parameter_shortname": "Spacing",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "1/16",
        "1/32",
        "1/64",
        "1/16T",
        "1/32T"
       ],
       "parameter_mmax": 4.0,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-378"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend v rspace",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2000,
      864,
      113,
      22.0
     ],
     "id": "obj-379"
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
      2000,
      888,
      76,
      22.0
     ],
     "id": "obj-380"
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
      2000,
      920,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      1992,
      132,
      28,
      13
     ],
     "varname": "dice_repeat",
     "text": "Rnd",
     "texton": "Rnd",
     "mode": 0,
     "annotation": "Randomizes this tab for the selected file: values, ranges and modes.",
     "annotation_name": "Random Repeat",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "dice.repeat",
       "parameter_shortname": "Rnd",
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
     "id": "obj-381"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dice repeat",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2000,
      944,
      45,
      22.0
     ],
     "id": "obj-382"
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
      2000,
      992,
      76,
      22.0
     ],
     "id": "obj-384"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "8 \u00b7 GRAIN",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      2330,
      40,
      300,
      20.0
     ],
     "fontsize": 12.0,
     "id": "obj-385"
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
      2330,
      70,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      2039,
      0,
      44,
      48
     ],
     "varname": "gsize_b",
     "annotation": "Grain length.",
     "annotation_name": "Size",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.gsize",
       "parameter_shortname": "Size",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 10.0,
       "parameter_mmax": 500.0,
       "parameter_unitstyle": 2,
       "parameter_initial": [
        80.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 2.0
      }
     },
     "id": "obj-386",
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
     "maxclass": "newobj",
     "text": "prepend b gsize",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2330,
      126,
      107,
      22.0
     ],
     "id": "obj-387"
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
      2330,
      150,
      76,
      22.0
     ],
     "id": "obj-388"
    }
   },
   {
    "box": {
     "appearance": 1,
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      2440,
      70,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      2032,
      48,
      18,
      18
     ],
     "varname": "gsize_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Size range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.gsize",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-389",
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
     "maxclass": "newobj",
     "text": "prepend r gsize",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2440,
      126,
      107,
      22.0
     ],
     "id": "obj-390"
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
      2440,
      150,
      76,
      22.0
     ],
     "id": "obj-391"
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
      2550,
      70,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      2053,
      50.5,
      36,
      13
     ],
     "varname": "gsize_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Size mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.gsize",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-392"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m gsize",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2550,
      126,
      107,
      22.0
     ],
     "id": "obj-393"
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
      2550,
      150,
      76,
      22.0
     ],
     "id": "obj-394"
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
      2330,
      180,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      2101,
      0,
      44,
      48
     ],
     "varname": "gdens_b",
     "annotation": "Overlapping grains.",
     "annotation_name": "Grains",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.gdens",
       "parameter_shortname": "Grains",
       "parameter_type": 1,
       "parameter_invisible": 2,
       "parameter_mmin": 1.0,
       "parameter_mmax": 4.0,
       "parameter_unitstyle": 0,
       "parameter_initial": [
        2.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-395",
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
     "maxclass": "newobj",
     "text": "prepend b gdens",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2330,
      236,
      107,
      22.0
     ],
     "id": "obj-396"
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
      2330,
      260,
      76,
      22.0
     ],
     "id": "obj-397"
    }
   },
   {
    "box": {
     "appearance": 1,
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      2440,
      180,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      2094,
      48,
      18,
      18
     ],
     "varname": "gdens_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Grains range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.gdens",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-398",
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
     "maxclass": "newobj",
     "text": "prepend r gdens",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2440,
      236,
      107,
      22.0
     ],
     "id": "obj-399"
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
      2440,
      260,
      76,
      22.0
     ],
     "id": "obj-400"
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
      2550,
      180,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      2115,
      50.5,
      36,
      13
     ],
     "varname": "gdens_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Grains mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.gdens",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-401"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m gdens",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2550,
      236,
      107,
      22.0
     ],
     "id": "obj-402"
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
      2550,
      260,
      76,
      22.0
     ],
     "id": "obj-403"
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
      2330,
      290,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      2163,
      0,
      44,
      48
     ],
     "varname": "scan_b",
     "annotation": "Speed through the slice. 100% is normal, 0% freezes.",
     "annotation_name": "Scan",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.scan",
       "parameter_shortname": "Scan",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 200.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-404",
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
     "maxclass": "newobj",
     "text": "prepend b scan",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2330,
      346,
      100,
      22.0
     ],
     "id": "obj-405"
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
      2330,
      370,
      76,
      22.0
     ],
     "id": "obj-406"
    }
   },
   {
    "box": {
     "appearance": 1,
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      2440,
      290,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      2156,
      48,
      18,
      18
     ],
     "varname": "scan_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Scan range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.scan",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-407",
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
     "maxclass": "newobj",
     "text": "prepend r scan",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2440,
      346,
      100,
      22.0
     ],
     "id": "obj-408"
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
      2440,
      370,
      76,
      22.0
     ],
     "id": "obj-409"
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
      2550,
      290,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      2177,
      50.5,
      36,
      13
     ],
     "varname": "scan_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Scan mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.scan",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-410"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m scan",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2550,
      346,
      100,
      22.0
     ],
     "id": "obj-411"
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
      2550,
      370,
      76,
      22.0
     ],
     "id": "obj-412"
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
      2330,
      400,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      2225,
      0,
      44,
      48
     ],
     "varname": "gjit_b",
     "annotation": "Randomizes grain read positions.",
     "annotation_name": "Jitter",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.gjit",
       "parameter_shortname": "Jitter",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        10.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-413",
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
     "maxclass": "newobj",
     "text": "prepend b gjit",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2330,
      456,
      100,
      22.0
     ],
     "id": "obj-414"
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
      2330,
      480,
      76,
      22.0
     ],
     "id": "obj-415"
    }
   },
   {
    "box": {
     "appearance": 1,
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      2440,
      400,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      2218,
      48,
      18,
      18
     ],
     "varname": "gjit_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "Jitter range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.gjit",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-416",
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
     "maxclass": "newobj",
     "text": "prepend r gjit",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2440,
      456,
      100,
      22.0
     ],
     "id": "obj-417"
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
      2440,
      480,
      76,
      22.0
     ],
     "id": "obj-418"
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
      2550,
      400,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      2239,
      50.5,
      36,
      13
     ],
     "varname": "gjit_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Jitter mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.gjit",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-419"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m gjit",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2550,
      456,
      100,
      22.0
     ],
     "id": "obj-420"
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
      2550,
      480,
      76,
      22.0
     ],
     "id": "obj-421"
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
      2330,
      510,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      2039,
      66,
      44,
      48
     ],
     "varname": "gspread_b",
     "annotation": "Random pitch spread per grain.",
     "annotation_name": "G.Spread",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.gspread",
       "parameter_shortname": "G.Spread",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 12.0,
       "parameter_unitstyle": 7,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-422",
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
     "maxclass": "newobj",
     "text": "prepend b gspread",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2330,
      566,
      119,
      22.0
     ],
     "id": "obj-423"
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
      2330,
      590,
      76,
      22.0
     ],
     "id": "obj-424"
    }
   },
   {
    "box": {
     "appearance": 1,
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      2440,
      510,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      2032,
      114,
      18,
      18
     ],
     "varname": "gspread_r",
     "annotation": "How far each hit can stray from the knob value. Chaos scales it.",
     "annotation_name": "G.Spread range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.gspread",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-425",
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
     "maxclass": "newobj",
     "text": "prepend r gspread",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2440,
      566,
      119,
      22.0
     ],
     "id": "obj-426"
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
      2440,
      590,
      76,
      22.0
     ],
     "id": "obj-427"
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
      2550,
      510,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      2053,
      116.5,
      36,
      13
     ],
     "varname": "gspread_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "G.Spread mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.gspread",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-428"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m gspread",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2550,
      566,
      119,
      22.0
     ],
     "id": "obj-429"
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
      2550,
      590,
      76,
      22.0
     ],
     "id": "obj-430"
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
      2330,
      620,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      2282,
      132,
      28,
      13
     ],
     "varname": "dice_grain",
     "text": "Rnd",
     "texton": "Rnd",
     "mode": 0,
     "annotation": "Randomizes this tab for the selected file: values, ranges and modes.",
     "annotation_name": "Random Grain",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "dice.grain",
       "parameter_shortname": "Rnd",
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
     "id": "obj-431"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dice grain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2330,
      644,
      45,
      22.0
     ],
     "id": "obj-432"
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
      2330,
      692,
      76,
      22.0
     ],
     "id": "obj-434"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "9 \u00b7 DETECT",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      2660,
      40,
      300,
      20.0
     ],
     "fontsize": 12.0,
     "id": "obj-435"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Method",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      2860,
      70,
      90,
      20.0
     ],
     "fontsize": 9.0,
     "presentation": 1,
     "presentation_rect": [
      2322,
      1,
      86,
      13
     ],
     "id": "obj-436"
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
      2660,
      70,
      90,
      15
     ],
     "presentation": 1,
     "presentation_rect": [
      2322,
      14,
      86,
      15
     ],
     "varname": "method_v",
     "annotation": "How the file is cut into slices.",
     "annotation_name": "Method",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.method",
       "parameter_shortname": "Method",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "Hits",
        "Soft",
        "Pitch",
        "Harmony",
        "Timbre",
        "Silence",
        "Grid"
       ],
       "parameter_mmax": 6.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-437"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend v method",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2660,
      94,
      113,
      22.0
     ],
     "id": "obj-438"
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
      2660,
      118,
      76,
      22.0
     ],
     "id": "obj-439"
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
      2660,
      150,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      2425,
      0,
      44,
      48
     ],
     "varname": "sens_b",
     "annotation": "More or fewer slices. For Grid, the number of slices.",
     "annotation_name": "Sensitivity",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.sens",
       "parameter_shortname": "Sensitivity",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        25.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-440",
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
     "maxclass": "newobj",
     "text": "prepend b sens",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2660,
      206,
      100,
      22.0
     ],
     "id": "obj-441"
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
      2660,
      230,
      76,
      22.0
     ],
     "id": "obj-442"
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
      2660,
      260,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      2487,
      0,
      44,
      48
     ],
     "varname": "minlen_b",
     "annotation": "No slice shorter than this.",
     "annotation_name": "Min Len",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.minlen",
       "parameter_shortname": "Min Len",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 10.0,
       "parameter_mmax": 1000.0,
       "parameter_unitstyle": 2,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 2.0
      }
     },
     "id": "obj-443",
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
     "maxclass": "newobj",
     "text": "prepend b minlen",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2660,
      316,
      113,
      22.0
     ],
     "id": "obj-444"
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
      2660,
      340,
      76,
      22.0
     ],
     "id": "obj-445"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "Re-slices the file. R/W draw a new value each re-slice.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      2660,
      370,
      200,
      20.0
     ],
     "fontsize": 9.0,
     "fontface": 0,
     "presentation": 1,
     "presentation_rect": [
      2322,
      40,
      92,
      40
     ],
     "id": "obj-446"
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
     "varname": "depth_clock",
     "patching_rect": [
      80,
      1230,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      257.0,
      114,
      18,
      18
     ],
     "annotation": "How far the random button moves things. 10% moves values a tenth of the way to a new random value; switches change with that chance.",
     "annotation_name": "Random depth: clock",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "depth.clock",
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
     "id": "obj-d1338",
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
     "id": "obj-d1338a",
     "maxclass": "newobj",
     "text": "prepend rdepth clock",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      80,
      1280,
      140,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-d1338b",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      80,
      1306,
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
     "appearance": 1,
     "showname": 0,
     "shownumber": 0,
     "varname": "depth_slice",
     "patching_rect": [
      410,
      640,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      547.0,
      114,
      18,
      18
     ],
     "annotation": "How far the random button moves things. 10% moves values a tenth of the way to a new random value; switches change with that chance.",
     "annotation_name": "Random depth: slice",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "depth.slice",
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
     "id": "obj-d1341",
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
     "id": "obj-d1341a",
     "maxclass": "newobj",
     "text": "prepend rdepth slice",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      410,
      690,
      140,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-d1341b",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      410,
      716,
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
     "appearance": 1,
     "showname": 0,
     "shownumber": 0,
     "varname": "depth_play",
     "patching_rect": [
      740,
      510,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      837.0,
      114,
      18,
      18
     ],
     "annotation": "How far the random button moves things. 10% moves values a tenth of the way to a new random value; switches change with that chance.",
     "annotation_name": "Random depth: play",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "depth.play",
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
     "id": "obj-d1344",
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
     "id": "obj-d1344a",
     "maxclass": "newobj",
     "text": "prepend rdepth play",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      740,
      560,
      140,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-d1344b",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      740,
      586,
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
     "appearance": 1,
     "showname": 0,
     "shownumber": 0,
     "varname": "depth_pitch",
     "patching_rect": [
      1070,
      590,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1127.0,
      114,
      18,
      18
     ],
     "annotation": "How far the random button moves things. 10% moves values a tenth of the way to a new random value; switches change with that chance.",
     "annotation_name": "Random depth: pitch",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "depth.pitch",
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
     "id": "obj-d1347",
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
     "id": "obj-d1347a",
     "maxclass": "newobj",
     "text": "prepend rdepth pitch",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1070,
      640,
      140,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-d1347b",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1070,
      666,
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
     "appearance": 1,
     "showname": 0,
     "shownumber": 0,
     "varname": "depth_env",
     "patching_rect": [
      1400,
      730,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1417.0,
      114,
      18,
      18
     ],
     "annotation": "How far the random button moves things. 10% moves values a tenth of the way to a new random value; switches change with that chance.",
     "annotation_name": "Random depth: env",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "depth.env",
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
     "id": "obj-d1350",
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
     "id": "obj-d1350a",
     "maxclass": "newobj",
     "text": "prepend rdepth env",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1400,
      780,
      140,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-d1350b",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1400,
      806,
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
     "appearance": 1,
     "showname": 0,
     "shownumber": 0,
     "varname": "depth_filter",
     "patching_rect": [
      1730,
      700,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1707.0,
      114,
      18,
      18
     ],
     "annotation": "How far the random button moves things. 10% moves values a tenth of the way to a new random value; switches change with that chance.",
     "annotation_name": "Random depth: filter",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "depth.filter",
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
     "id": "obj-d1353",
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
     "id": "obj-d1353a",
     "maxclass": "newobj",
     "text": "prepend rdepth filter",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1730,
      750,
      140,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-d1353b",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1730,
      776,
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
     "appearance": 1,
     "showname": 0,
     "shownumber": 0,
     "varname": "depth_repeat",
     "patching_rect": [
      2060,
      920,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      1997.0,
      114,
      18,
      18
     ],
     "annotation": "How far the random button moves things. 10% moves values a tenth of the way to a new random value; switches change with that chance.",
     "annotation_name": "Random depth: repeat",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "depth.repeat",
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
     "id": "obj-d1356",
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
     "id": "obj-d1356a",
     "maxclass": "newobj",
     "text": "prepend rdepth repeat",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2060,
      970,
      140,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-d1356b",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      2060,
      996,
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
     "appearance": 1,
     "showname": 0,
     "shownumber": 0,
     "varname": "depth_grain",
     "patching_rect": [
      2390,
      620,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      2287.0,
      114,
      18,
      18
     ],
     "annotation": "How far the random button moves things. 10% moves values a tenth of the way to a new random value; switches change with that chance.",
     "annotation_name": "Random depth: grain",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "depth.grain",
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
     "id": "obj-d1359",
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
     "id": "obj-d1359a",
     "maxclass": "newobj",
     "text": "prepend rdepth grain",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2390,
      670,
      140,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-d1359b",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      2390,
      696,
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
      1930,
      370,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      1679,
      66,
      44,
      48
     ],
     "varname": "ftvar_b",
     "annotation": "Chance each hit picks its own filter type (LP 70%, HP 15%, BP 15%) with a cutoff to match.",
     "annotation_name": "Type Var",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.ftvar",
       "parameter_shortname": "Type Var",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-ftvar",
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
     "id": "obj-ftvar-p",
     "maxclass": "newobj",
     "text": "prepend b ftvar",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1930,
      426,
      100,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-ftvar-s",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      1930,
      452,
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
      350,
      480,
      44,
      48
     ],
     "presentation": 1,
     "presentation_rect": [
      312,
      68,
      44,
      48
     ],
     "varname": "chokep_b",
     "annotation": "Chance a new hit cuts off the previous one. 100% always chokes; 0% lets up to 4 hits overlap.",
     "annotation_name": "Choke",
     "showname": 1,
     "shownumber": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "f.chokep",
       "parameter_shortname": "Choke",
       "parameter_type": 0,
       "parameter_invisible": 2,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_unitstyle": 5,
       "parameter_initial": [
        100.0
       ],
       "parameter_initial_enable": 1,
       "parameter_exponent": 1.0
      }
     },
     "id": "obj-chokep",
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
     "id": "obj-chokep-p",
     "maxclass": "newobj",
     "text": "prepend b chokep",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      350,
      536,
      110,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-chokep-s",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      350,
      562,
      70,
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
      2660,
      680,
      34,
      16
     ],
     "presentation": 1,
     "presentation_rect": [
      2572,
      132,
      28,
      13
     ],
     "varname": "dice_detect",
     "text": "Rnd",
     "texton": "Rnd",
     "mode": 0,
     "annotation": "Randomizes this tab for the selected file: values, ranges and modes.",
     "annotation_name": "Random Detect",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "dice.detect",
       "parameter_shortname": "Rnd",
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
     "id": "obj-431-det"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend dice detect",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2660,
      704,
      45,
      22.0
     ],
     "id": "obj-432-det"
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
      2660,
      752,
      76,
      22.0
     ],
     "id": "obj-434-det"
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
     "varname": "depth_detect",
     "patching_rect": [
      2720,
      680,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      2577.0,
      114,
      18,
      18
     ],
     "annotation": "How far the random button moves things. 10% moves values a tenth of the way to a new random value; switches change with that chance.",
     "annotation_name": "Random depth: Detect",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "depth.detect",
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
     "id": "obj-d1359-det",
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
     "id": "obj-d1359a-det",
     "maxclass": "newobj",
     "text": "prepend rdepth detect",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2720,
      730,
      140,
      22
     ]
    }
   },
   {
    "box": {
     "id": "obj-d1359b-det",
     "maxclass": "newobj",
     "text": "s ---brain",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      2720,
      756,
      70,
      22
     ]
    }
   },
   {
    "box": {
     "appearance": 1,
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      2770,
      150,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      2418,
      48,
      18,
      18
     ],
     "varname": "sens_r",
     "annotation": "How far each re-slice can stray from the knob. Chaos scales it.",
     "annotation_name": "Sensitivity range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.sens",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-7-sens-r",
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
     "maxclass": "newobj",
     "text": "prepend r sens",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2770,
      176,
      100,
      22.0
     ],
     "id": "obj-8-sens-r",
     "annotation": "How far each re-slice can stray from the knob. Chaos scales it."
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
      2770,
      202,
      76,
      22.0
     ],
     "id": "obj-9-sens-r",
     "annotation": "How far each re-slice can stray from the knob. Chaos scales it."
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
      2880,
      150,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      2439,
      50.5,
      36,
      13
     ],
     "varname": "sens_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Sensitivity mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.sens",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-10-sens-m"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m sens",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2880,
      176,
      100,
      22.0
     ],
     "id": "obj-11-sens-m"
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
      2880,
      202,
      76,
      22.0
     ],
     "id": "obj-12-sens-m"
    }
   },
   {
    "box": {
     "appearance": 1,
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      2770,
      260,
      18,
      18
     ],
     "presentation": 1,
     "presentation_rect": [
      2480,
      48,
      18,
      18
     ],
     "varname": "minlen_r",
     "annotation": "How far each re-slice can stray from the knob. Chaos scales it.",
     "annotation_name": "Min Len range",
     "showname": 0,
     "shownumber": 0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "r.minlen",
       "parameter_shortname": "Range",
       "parameter_type": 0,
       "parameter_invisible": 2,
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
     "id": "obj-7-minlen-r",
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
     "maxclass": "newobj",
     "text": "prepend r minlen",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2770,
      286,
      100,
      22.0
     ],
     "id": "obj-8-minlen-r",
     "annotation": "How far each re-slice can stray from the knob. Chaos scales it."
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
      2770,
      312,
      76,
      22.0
     ],
     "id": "obj-9-minlen-r",
     "annotation": "How far each re-slice can stray from the knob. Chaos scales it."
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
      2880,
      260,
      36,
      14
     ],
     "presentation": 1,
     "presentation_rect": [
      2501,
      50.5,
      36,
      13
     ],
     "varname": "minlen_m",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "annotation": "Fixed: the knob value. Random: a new value each hit. Walk: drifts step by step.",
     "annotation_name": "Min Len mode",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "m.minlen",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_invisible": 2,
       "parameter_enum": [
        "F",
        "R",
        "W"
       ],
       "parameter_mmax": 2.0,
       "parameter_initial": [
        0.0
       ],
       "parameter_initial_enable": 1
      }
     },
     "id": "obj-10-minlen-m"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend m minlen",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      2880,
      286,
      100,
      22.0
     ],
     "id": "obj-11-minlen-m"
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
      2880,
      312,
      76,
      22.0
     ],
     "id": "obj-12-minlen-m"
    }
   }
  ],
  "lines": [
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
      "obj-8",
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
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-10",
      0
     ],
     "destination": [
      "obj-11",
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
      "obj-16",
      0
     ],
     "destination": [
      "obj-17",
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
      "obj-19",
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
      "obj-20",
      0
     ],
     "destination": [
      "obj-21",
      0
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
      "obj-25",
      0
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
      "obj-28",
      0
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
      "obj-29",
      0
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
      "obj-34",
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
      "obj-36",
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
      "obj-41",
      0
     ],
     "destination": [
      "obj-42",
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
      "obj-44",
      0
     ],
     "destination": [
      "obj-45",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-46",
      0
     ],
     "destination": [
      "obj-47",
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
      "obj-50",
      0
     ],
     "destination": [
      "obj-51",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-52",
      0
     ],
     "destination": [
      "obj-53",
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
      "obj-56",
      0
     ],
     "destination": [
      "obj-57",
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
      "obj-59",
      0
     ],
     "destination": [
      "obj-60",
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
      "obj-62",
      0
     ],
     "destination": [
      "obj-63",
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
      "obj-65",
      0
     ],
     "destination": [
      "obj-66",
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
      "obj-74",
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
      "obj-75",
      0
     ],
     "destination": [
      "obj-76",
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
      "obj-78",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-78",
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
      "obj-83",
      0
     ],
     "destination": [
      "obj-84",
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
      "obj-86",
      0
     ],
     "destination": [
      "obj-87",
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
      "obj-89",
      0
     ],
     "destination": [
      "obj-90",
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
      "obj-92",
      0
     ],
     "destination": [
      "obj-93",
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
      "obj-95",
      0
     ],
     "destination": [
      "obj-96",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-96",
      0
     ],
     "destination": [
      "obj-97",
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
      "obj-99",
      0
     ],
     "destination": [
      "obj-100",
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
      "obj-102",
      0
     ],
     "destination": [
      "obj-103",
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
      "obj-110",
      0
     ],
     "destination": [
      "obj-111",
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
      "obj-116",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-116",
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
      "obj-118",
      0
     ],
     "destination": [
      "obj-119",
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
      "obj-121",
      0
     ],
     "destination": [
      "obj-122",
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
      "obj-124",
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
      "obj-125",
      0
     ],
     "destination": [
      "obj-126",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-127",
      0
     ],
     "destination": [
      "obj-128",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-128",
      0
     ],
     "destination": [
      "obj-129",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-130",
      0
     ],
     "destination": [
      "obj-131",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-131",
      0
     ],
     "destination": [
      "obj-132",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-133",
      0
     ],
     "destination": [
      "obj-134",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-134",
      0
     ],
     "destination": [
      "obj-135",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-136",
      0
     ],
     "destination": [
      "obj-137",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-137",
      0
     ],
     "destination": [
      "obj-138",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-139",
      0
     ],
     "destination": [
      "obj-140",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-140",
      0
     ],
     "destination": [
      "obj-141",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-142",
      0
     ],
     "destination": [
      "obj-143",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-143",
      0
     ],
     "destination": [
      "obj-144",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-145",
      0
     ],
     "destination": [
      "obj-146",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-146",
      0
     ],
     "destination": [
      "obj-147",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-148",
      0
     ],
     "destination": [
      "obj-149",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-149",
      0
     ],
     "destination": [
      "obj-150",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-151",
      0
     ],
     "destination": [
      "obj-152",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-157",
      0
     ],
     "destination": [
      "obj-158",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-158",
      0
     ],
     "destination": [
      "obj-159",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-160",
      0
     ],
     "destination": [
      "obj-161",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-161",
      0
     ],
     "destination": [
      "obj-162",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-163",
      0
     ],
     "destination": [
      "obj-164",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-164",
      0
     ],
     "destination": [
      "obj-165",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-166",
      0
     ],
     "destination": [
      "obj-167",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-167",
      0
     ],
     "destination": [
      "obj-168",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-169",
      0
     ],
     "destination": [
      "obj-170",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-170",
      0
     ],
     "destination": [
      "obj-171",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-172",
      0
     ],
     "destination": [
      "obj-173",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-173",
      0
     ],
     "destination": [
      "obj-174",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-175",
      0
     ],
     "destination": [
      "obj-176",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-176",
      0
     ],
     "destination": [
      "obj-177",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-178",
      0
     ],
     "destination": [
      "obj-179",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-179",
      0
     ],
     "destination": [
      "obj-180",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-181",
      0
     ],
     "destination": [
      "obj-182",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-182",
      0
     ],
     "destination": [
      "obj-183",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-184",
      0
     ],
     "destination": [
      "obj-185",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-185",
      0
     ],
     "destination": [
      "obj-186",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-187",
      0
     ],
     "destination": [
      "obj-188",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-188",
      0
     ],
     "destination": [
      "obj-189",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-190",
      0
     ],
     "destination": [
      "obj-191",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-191",
      0
     ],
     "destination": [
      "obj-192",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-193",
      0
     ],
     "destination": [
      "obj-194",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-194",
      0
     ],
     "destination": [
      "obj-195",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-196",
      0
     ],
     "destination": [
      "obj-197",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-201",
      0
     ],
     "destination": [
      "obj-202",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-202",
      0
     ],
     "destination": [
      "obj-203",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-204",
      0
     ],
     "destination": [
      "obj-205",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-205",
      0
     ],
     "destination": [
      "obj-206",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-207",
      0
     ],
     "destination": [
      "obj-208",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-208",
      0
     ],
     "destination": [
      "obj-209",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-210",
      0
     ],
     "destination": [
      "obj-211",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-211",
      0
     ],
     "destination": [
      "obj-212",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-213",
      0
     ],
     "destination": [
      "obj-214",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-214",
      0
     ],
     "destination": [
      "obj-215",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-216",
      0
     ],
     "destination": [
      "obj-217",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-217",
      0
     ],
     "destination": [
      "obj-218",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      0
     ],
     "destination": [
      "obj-220",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-220",
      0
     ],
     "destination": [
      "obj-221",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-222",
      0
     ],
     "destination": [
      "obj-223",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-223",
      0
     ],
     "destination": [
      "obj-224",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-225",
      0
     ],
     "destination": [
      "obj-226",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-226",
      0
     ],
     "destination": [
      "obj-227",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-228",
      0
     ],
     "destination": [
      "obj-229",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-229",
      0
     ],
     "destination": [
      "obj-230",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-231",
      0
     ],
     "destination": [
      "obj-232",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-232",
      0
     ],
     "destination": [
      "obj-233",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-234",
      0
     ],
     "destination": [
      "obj-235",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-235",
      0
     ],
     "destination": [
      "obj-236",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-237",
      0
     ],
     "destination": [
      "obj-238",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-238",
      0
     ],
     "destination": [
      "obj-239",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-240",
      0
     ],
     "destination": [
      "obj-241",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-241",
      0
     ],
     "destination": [
      "obj-242",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-243",
      0
     ],
     "destination": [
      "obj-244",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-244",
      0
     ],
     "destination": [
      "obj-245",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-246",
      0
     ],
     "destination": [
      "obj-247",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-247",
      0
     ],
     "destination": [
      "obj-248",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-249",
      0
     ],
     "destination": [
      "obj-250",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-250",
      0
     ],
     "destination": [
      "obj-251",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-252",
      0
     ],
     "destination": [
      "obj-253",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-253",
      0
     ],
     "destination": [
      "obj-254",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-255",
      0
     ],
     "destination": [
      "obj-256",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-261",
      0
     ],
     "destination": [
      "obj-262",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-262",
      0
     ],
     "destination": [
      "obj-263",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-264",
      0
     ],
     "destination": [
      "obj-265",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-265",
      0
     ],
     "destination": [
      "obj-266",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-267",
      0
     ],
     "destination": [
      "obj-268",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-268",
      0
     ],
     "destination": [
      "obj-269",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-270",
      0
     ],
     "destination": [
      "obj-271",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-271",
      0
     ],
     "destination": [
      "obj-272",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-273",
      0
     ],
     "destination": [
      "obj-274",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-274",
      0
     ],
     "destination": [
      "obj-275",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-276",
      0
     ],
     "destination": [
      "obj-277",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-277",
      0
     ],
     "destination": [
      "obj-278",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-279",
      0
     ],
     "destination": [
      "obj-280",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-280",
      0
     ],
     "destination": [
      "obj-281",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-282",
      0
     ],
     "destination": [
      "obj-283",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-283",
      0
     ],
     "destination": [
      "obj-284",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-285",
      0
     ],
     "destination": [
      "obj-286",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-286",
      0
     ],
     "destination": [
      "obj-287",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-288",
      0
     ],
     "destination": [
      "obj-289",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-289",
      0
     ],
     "destination": [
      "obj-290",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-291",
      0
     ],
     "destination": [
      "obj-292",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-292",
      0
     ],
     "destination": [
      "obj-293",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-294",
      0
     ],
     "destination": [
      "obj-295",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-295",
      0
     ],
     "destination": [
      "obj-296",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-297",
      0
     ],
     "destination": [
      "obj-298",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-298",
      0
     ],
     "destination": [
      "obj-299",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-300",
      0
     ],
     "destination": [
      "obj-301",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-301",
      0
     ],
     "destination": [
      "obj-302",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-303",
      0
     ],
     "destination": [
      "obj-304",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-304",
      0
     ],
     "destination": [
      "obj-305",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-306",
      0
     ],
     "destination": [
      "obj-307",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-307",
      0
     ],
     "destination": [
      "obj-308",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-309",
      0
     ],
     "destination": [
      "obj-310",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-315",
      0
     ],
     "destination": [
      "obj-316",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-316",
      0
     ],
     "destination": [
      "obj-317",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-318",
      0
     ],
     "destination": [
      "obj-319",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-319",
      0
     ],
     "destination": [
      "obj-320",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-321",
      0
     ],
     "destination": [
      "obj-322",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-322",
      0
     ],
     "destination": [
      "obj-323",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-324",
      0
     ],
     "destination": [
      "obj-325",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-325",
      0
     ],
     "destination": [
      "obj-326",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-327",
      0
     ],
     "destination": [
      "obj-328",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-328",
      0
     ],
     "destination": [
      "obj-329",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-330",
      0
     ],
     "destination": [
      "obj-331",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-331",
      0
     ],
     "destination": [
      "obj-332",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-333",
      0
     ],
     "destination": [
      "obj-334",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-334",
      0
     ],
     "destination": [
      "obj-335",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-336",
      0
     ],
     "destination": [
      "obj-337",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-337",
      0
     ],
     "destination": [
      "obj-338",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-339",
      0
     ],
     "destination": [
      "obj-340",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-340",
      0
     ],
     "destination": [
      "obj-341",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-342",
      0
     ],
     "destination": [
      "obj-343",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-343",
      0
     ],
     "destination": [
      "obj-344",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-345",
      0
     ],
     "destination": [
      "obj-346",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-346",
      0
     ],
     "destination": [
      "obj-347",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-348",
      0
     ],
     "destination": [
      "obj-349",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-349",
      0
     ],
     "destination": [
      "obj-350",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-351",
      0
     ],
     "destination": [
      "obj-352",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-352",
      0
     ],
     "destination": [
      "obj-353",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-354",
      0
     ],
     "destination": [
      "obj-355",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-355",
      0
     ],
     "destination": [
      "obj-356",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-357",
      0
     ],
     "destination": [
      "obj-358",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-358",
      0
     ],
     "destination": [
      "obj-359",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-360",
      0
     ],
     "destination": [
      "obj-361",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-361",
      0
     ],
     "destination": [
      "obj-362",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-363",
      0
     ],
     "destination": [
      "obj-364",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-364",
      0
     ],
     "destination": [
      "obj-365",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-366",
      0
     ],
     "destination": [
      "obj-367",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-367",
      0
     ],
     "destination": [
      "obj-368",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-369",
      0
     ],
     "destination": [
      "obj-370",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-370",
      0
     ],
     "destination": [
      "obj-371",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-372",
      0
     ],
     "destination": [
      "obj-373",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-373",
      0
     ],
     "destination": [
      "obj-374",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-375",
      0
     ],
     "destination": [
      "obj-376",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-376",
      0
     ],
     "destination": [
      "obj-377",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-378",
      0
     ],
     "destination": [
      "obj-379",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-379",
      0
     ],
     "destination": [
      "obj-380",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-381",
      0
     ],
     "destination": [
      "obj-382",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-386",
      0
     ],
     "destination": [
      "obj-387",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-387",
      0
     ],
     "destination": [
      "obj-388",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-389",
      0
     ],
     "destination": [
      "obj-390",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-390",
      0
     ],
     "destination": [
      "obj-391",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-392",
      0
     ],
     "destination": [
      "obj-393",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-393",
      0
     ],
     "destination": [
      "obj-394",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-395",
      0
     ],
     "destination": [
      "obj-396",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-396",
      0
     ],
     "destination": [
      "obj-397",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-398",
      0
     ],
     "destination": [
      "obj-399",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-399",
      0
     ],
     "destination": [
      "obj-400",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-401",
      0
     ],
     "destination": [
      "obj-402",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-402",
      0
     ],
     "destination": [
      "obj-403",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-404",
      0
     ],
     "destination": [
      "obj-405",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-405",
      0
     ],
     "destination": [
      "obj-406",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-407",
      0
     ],
     "destination": [
      "obj-408",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-408",
      0
     ],
     "destination": [
      "obj-409",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-410",
      0
     ],
     "destination": [
      "obj-411",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-411",
      0
     ],
     "destination": [
      "obj-412",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-413",
      0
     ],
     "destination": [
      "obj-414",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-414",
      0
     ],
     "destination": [
      "obj-415",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-416",
      0
     ],
     "destination": [
      "obj-417",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-417",
      0
     ],
     "destination": [
      "obj-418",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-419",
      0
     ],
     "destination": [
      "obj-420",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-420",
      0
     ],
     "destination": [
      "obj-421",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-422",
      0
     ],
     "destination": [
      "obj-423",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-423",
      0
     ],
     "destination": [
      "obj-424",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-425",
      0
     ],
     "destination": [
      "obj-426",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-426",
      0
     ],
     "destination": [
      "obj-427",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-428",
      0
     ],
     "destination": [
      "obj-429",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-429",
      0
     ],
     "destination": [
      "obj-430",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-431",
      0
     ],
     "destination": [
      "obj-432",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-437",
      0
     ],
     "destination": [
      "obj-438",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-438",
      0
     ],
     "destination": [
      "obj-439",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-440",
      0
     ],
     "destination": [
      "obj-441",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-441",
      0
     ],
     "destination": [
      "obj-442",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-443",
      0
     ],
     "destination": [
      "obj-444",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-444",
      0
     ],
     "destination": [
      "obj-445",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-68",
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
      "obj-111",
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
      "obj-152",
      0
     ],
     "destination": [
      "obj-154",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-197",
      0
     ],
     "destination": [
      "obj-199",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-256",
      0
     ],
     "destination": [
      "obj-258",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-310",
      0
     ],
     "destination": [
      "obj-312",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-382",
      0
     ],
     "destination": [
      "obj-384",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-432",
      0
     ],
     "destination": [
      "obj-434",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1338",
      0
     ],
     "destination": [
      "obj-d1338a",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1338a",
      0
     ],
     "destination": [
      "obj-d1338b",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1341",
      0
     ],
     "destination": [
      "obj-d1341a",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1341a",
      0
     ],
     "destination": [
      "obj-d1341b",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1344",
      0
     ],
     "destination": [
      "obj-d1344a",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1344a",
      0
     ],
     "destination": [
      "obj-d1344b",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1347",
      0
     ],
     "destination": [
      "obj-d1347a",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1347a",
      0
     ],
     "destination": [
      "obj-d1347b",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1350",
      0
     ],
     "destination": [
      "obj-d1350a",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1350a",
      0
     ],
     "destination": [
      "obj-d1350b",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1353",
      0
     ],
     "destination": [
      "obj-d1353a",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1353a",
      0
     ],
     "destination": [
      "obj-d1353b",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1356",
      0
     ],
     "destination": [
      "obj-d1356a",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1356a",
      0
     ],
     "destination": [
      "obj-d1356b",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1359",
      0
     ],
     "destination": [
      "obj-d1359a",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1359a",
      0
     ],
     "destination": [
      "obj-d1359b",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-ftvar",
      0
     ],
     "destination": [
      "obj-ftvar-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-ftvar-p",
      0
     ],
     "destination": [
      "obj-ftvar-s",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-chokep",
      0
     ],
     "destination": [
      "obj-chokep-p",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-chokep-p",
      0
     ],
     "destination": [
      "obj-chokep-s",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-431-det",
      0
     ],
     "destination": [
      "obj-432-det",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-432-det",
      0
     ],
     "destination": [
      "obj-434-det",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1359-det",
      0
     ],
     "destination": [
      "obj-d1359a-det",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-d1359a-det",
      0
     ],
     "destination": [
      "obj-d1359b-det",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-7-sens-r",
      0
     ],
     "destination": [
      "obj-8-sens-r",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-8-sens-r",
      0
     ],
     "destination": [
      "obj-9-sens-r",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-10-sens-m",
      0
     ],
     "destination": [
      "obj-11-sens-m",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-11-sens-m",
      0
     ],
     "destination": [
      "obj-12-sens-m",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-7-minlen-r",
      0
     ],
     "destination": [
      "obj-8-minlen-r",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-8-minlen-r",
      0
     ],
     "destination": [
      "obj-9-minlen-r",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-10-minlen-m",
      0
     ],
     "destination": [
      "obj-11-minlen-m",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-11-minlen-m",
      0
     ],
     "destination": [
      "obj-12-minlen-m",
      0
     ]
    }
   }
  ]
 }
}