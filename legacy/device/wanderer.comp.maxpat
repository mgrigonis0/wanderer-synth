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
   240.0
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
     "text": "WANDERER \u00b7 compressor. Stereo-linked, 5 ms lookahead (always in the path, the conductor runs 5 ms early to match). \"amount 0..100\" in the right inlet.",
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
     "comment": "left (signal)",
     "id": "obj-2"
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
      100,
      40,
      45,
      22.0
     ],
     "comment": "right (signal)",
     "id": "obj-9"
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
      180,
      40,
      45,
      22.0
     ],
     "comment": "amount 0..100",
     "id": "obj-10"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "gen~",
     "numinlets": 2,
     "numoutlets": 3,
     "outlettype": [
      "signal",
      "signal",
      "signal"
     ],
     "patching_rect": [
      20,
      100,
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
         "code": "// =====================================================================\n//  WANDERER  \u00b7  output compressor (stereo linked, 5 ms lookahead)\n//  in1/in2  left / right        out1/out2  compressed left / right\n//  out3     gain reduction in dB (positive)\n//  One amount: lower threshold, higher ratio and matching makeup together.\n//  0% = untouched (still delayed by the lookahead, so timing never shifts).\n// =====================================================================\n\nParam amount(0);      // 0..100\n\nDelay dl(4096);\nDelay dr(4096);\nHistory grs(0);\nHistory amtS(0);\n\nla = floor(0.005 * samplerate + 0.5);    // lookahead in samples: keep equal to the conductor's\nac = 1 - exp(-1 / (0.003 * samplerate));\nrc = 1 - exp(-1 / (0.12 * samplerate));\namtS = amtS + (clamp(amount / 100, 0, 1) - amtS) * (1 - exp(-1 / (0.02 * samplerate)));   // ~20 ms glide\namt = amtS;\nthr = -6 - 24 * amt;                     // -6 .. -30 dBFS\nratio = 1 + 5 * amt;                     // 1:1 .. 6:1\nsl = 1 - 1 / ratio;\nkw = 10;                                 // soft knee width in dB\nmk = max(0, -10 - thr) * sl * 0.8;       // makeup: keeps typical hits near their old level\n\nl = in1;\nr = in2;\n\n// ---------- detector on the undelayed signal -------------------------------\npk = max(abs(l), abs(r));\nlvl = atodb(max(pk, 0.000001));\nov = lvl - thr;\ngk = sl * (ov + kw / 2) * (ov + kw / 2) / (2 * kw);\ntgt = ov > kw / 2 ? ov * sl : gk;\ntgt = ov < 0 - kw / 2 ? 0 : tgt;\nco = tgt > grs ? ac : rc;\ngrs = grs + (tgt - grs) * co;\n\n// ---------- gain on the delayed signal ----------------------------------\ndl.write(l);\ndr.write(r);\ngn = dbtoa(mk - grs);\nout1 = dl.read(la) * gn;\nout2 = dr.read(la) * gn;\nout3 = grs;\n",
         "fontface": 0,
         "fontname": "<Monospaced>",
         "fontsize": 12.0,
         "numinlets": 2,
         "numoutlets": 3,
         "outlettype": [
          "",
          "",
          ""
         ],
         "patching_rect": [
          20.0,
          70.0,
          700.0,
          560.0
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
          650.0,
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
          650.0,
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
          650.0,
          45,
          22.0
         ],
         "id": "obj-5"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "in 2",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          200.0,
          20.0,
          40,
          22.0
         ],
         "id": "obj-7"
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
          "obj-7",
          0
         ],
         "destination": [
          "obj-1",
          1
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
      160,
      30,
      22.0
     ],
     "comment": "left",
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
      120,
      160,
      30,
      22.0
     ],
     "comment": "right",
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
      220,
      160,
      30,
      22.0
     ],
     "comment": "gain reduction in dB, positive (signal)",
     "id": "obj-7"
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
      "obj-9",
      0
     ],
     "destination": [
      "obj-4",
      1
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
   }
  ]
 }
}