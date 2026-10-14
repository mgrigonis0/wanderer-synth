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
   80.0,
   100.0,
   520.0,
   260.0
  ],
  "bglocked": 0,
  "openinpresentation": 0,
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
     "text": "WANDERER \u00b7 conductor. Transport -> song position, play gate, Slide amount.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      4,
      600,
      20.0
     ],
     "fontsize": 10.0,
     "id": "obj-1"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "inlet",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      40,
      45,
      22.0
     ],
     "comment": "bar phase (signal), playing 0/1",
     "id": "obj-2"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "r ---cond",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      160,
      40,
      69,
      22.0
     ],
     "id": "obj-3"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "gen~",
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
      90,
      300,
      22.0
     ],
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 8,
       "minor": 6,
       "revision": 4,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "dsp.gen",
      "rect": [
       60.0,
       80.0,
       960.0,
       800.0
      ],
      "bglocked": 0,
      "openinpresentation": 0,
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
         "maxclass": "codebox",
         "code": "// =====================================================================\n//  WANDERER  \u00b7  conductor\n//  in1   bar phase (phasor~ 1n @lock 1)\n//  out1  song position in whole notes (counts from play start), 5 ms ahead:\n//        the output compressor delays the sound by 5 ms (lookahead), so hits start early by the same time\n//  out2  slide amount 0..1\n//  out3  playing gate\n//  out4  slide done gate\n// =====================================================================\n\nParam playing(0);    // from live.observer is_playing\nParam sldur(0);      // slide time in whole notes, 0 = instant\nParam slgo(0);       // changes -> start a slide\nParam slreset(0);    // changes -> slide back to 0 (after the brain commits)\n\nHistory P(0);\nHistory prevph(0);\nHistory wasplay(0);\nHistory sl(0);\nHistory lastgo(0);\nHistory lastreset(0);\nHistory wnps(0);\nHistory sh(0);\n\nph = in1;\nd = 0;\n\n// ---------- song position ----------------------------------------------\nif (playing > 0.5) {\n\tif (wasplay < 0.5) {\n\t\tP = ph;\n\t} else {\n\t\td = ph - prevph;\n\t\tif (d < -0.5) { d += 1; }\n\t\tif (d > 0 && d < 0.01) {\n\t\t\tP = P + d;\n\t\t\twnps = d;\n\t\t} else {\n\t\t\td = 0;\n\t\t}\n\t}\n}\nlan = floor(0.005 * samplerate + 0.5);       // lookahead in samples, same as wanderer.comp\nsh = (playing > 0.5 && wasplay > 0.5) ? lan * wnps : 0;\nprevph = ph;\nwasplay = playing > 0.5;\n\n// ---------- slide ramp in musical time ---------------------------------\nif (slreset != lastreset) {        // reset first: a recall during a slide commits, then starts the next slide\n\tlastreset = slreset;\n\tsl = 0;\n}\nif (slgo != lastgo) {\n\tlastgo = slgo;\n\tsl = sldur > 0 ? 0.000001 : 1;\n}\nif (sl > 0 && sl < 1) {\n\tadv = playing > 0.5 ? d : (wnps > 0 ? wnps : 0.5 / samplerate);\n\tsl = min(1, sl + adv / max(0.0001, sldur));\n}\n\nout1 = P + sh;\nout2 = sl;\nout3 = playing > 0.5;\nout4 = sl >= 1;\n",
         "fontface": 0,
         "fontname": "<Monospaced>",
         "fontsize": 12.0,
         "numinlets": 1,
         "numoutlets": 4,
         "outlettype": [
          "",
          "",
          "",
          ""
         ],
         "patching_rect": [
          20.0,
          70.0,
          900.0,
          640.0
         ],
         "id": "obj-1"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "in 1",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          20.0,
          20.0,
          40,
          22.0
         ],
         "id": "obj-2"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 1",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          20.0,
          730.0,
          45,
          22.0
         ],
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 2",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          140.0,
          730.0,
          45,
          22.0
         ],
         "id": "obj-4"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 3",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          260.0,
          730.0,
          45,
          22.0
         ],
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "out 4",
         "numinlets": 1,
         "numoutlets": 0,
         "outlettype": [],
         "patching_rect": [
          380.0,
          730.0,
          45,
          22.0
         ],
         "id": "obj-6"
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "source": [
          "obj-2",
          0
         ],
         "destination": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-1",
          0
         ],
         "destination": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-1",
          1
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
          "obj-1",
          2
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
          "obj-1",
          3
         ],
         "destination": [
          "obj-6",
          0
         ]
        }
       }
      ]
     },
     "id": "obj-4"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "outlet",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      20,
      150,
      51,
      22.0
     ],
     "comment": "song position (whole notes)",
     "id": "obj-5"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "outlet",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      110,
      150,
      51,
      22.0
     ],
     "comment": "slide amount",
     "id": "obj-6"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "outlet",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      200,
      150,
      51,
      22.0
     ],
     "comment": "playing gate",
     "id": "obj-7"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "outlet",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      290,
      150,
      51,
      22.0
     ],
     "comment": "slide done",
     "id": "obj-8"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-2",
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
      "obj-4",
      1
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
      "obj-4",
      2
     ],
     "destination": [
      "obj-7",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-4",
      3
     ],
     "destination": [
      "obj-8",
      0
     ]
    }
   }
  ]
 }
}