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
   60.0,
   80.0,
   1200.0,
   640.0
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
     "text": "WANDERER \u00b7 voice. One file slot: its audio buffer and the gen~ engine. Loaded 16 times by poly~.",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      4,
      700,
      20.0
     ],
     "fontsize": 10.0,
     "id": "obj-1"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "load / clear",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      30,
      200,
      20.0
     ],
     "fontsize": 10.0,
     "id": "obj-2"
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
      20,
      54,
      40,
      22.0
     ],
     "id": "obj-3"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "route load clear",
     "numinlets": 2,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "patching_rect": [
      20,
      84,
      113,
      22.0
     ],
     "id": "obj-4"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend replace",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      114,
      107,
      22.0
     ],
     "id": "obj-5"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "sizeinsamps 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      140,
      114,
      94,
      22.0
     ],
     "id": "obj-6"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "buffer~",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "float",
      "bang"
     ],
     "patching_rect": [
      20,
      150,
      57,
      22.0
     ],
     "id": "obj-7"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "after a load: sample rate, then 'loaded n'",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      186,
      300,
      20.0
     ],
     "fontsize": 10.0,
     "id": "obj-8"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "t b b b",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "bang",
      "bang",
      "bang"
     ],
     "patching_rect": [
      20,
      210,
      45,
      22.0
     ],
     "id": "obj-9"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "info~",
     "numinlets": 1,
     "numoutlets": 10,
     "outlettype": [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
     ],
     "patching_rect": [
      140,
      240,
      45,
      22.0
     ],
     "id": "obj-10"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "t b f",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      "float"
     ],
     "patching_rect": [
      140,
      270,
      45,
      22.0
     ],
     "id": "obj-11"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      140,
      300,
      40,
      22.0
     ],
     "id": "obj-12"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "pack 0 0.",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      140,
      330,
      69,
      22.0
     ],
     "id": "obj-13"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend sr",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      140,
      360,
      76,
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
      140,
      390,
      76,
      22.0
     ],
     "id": "obj-15"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend bsr",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      260,
      300,
      82,
      22.0
     ],
     "id": "obj-16"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "i",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      20,
      300,
      40,
      22.0
     ],
     "id": "obj-17"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend loaded",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      20,
      330,
      100,
      22.0
     ],
     "id": "obj-18"
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
      360,
      76,
      22.0
     ],
     "id": "obj-19"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "startup: name the buffer after this instance, bind gen~",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      420,
      30,
      400,
      20.0
     ],
     "fontsize": 10.0,
     "id": "obj-20"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadbang",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "bang"
     ],
     "patching_rect": [
      420,
      54,
      63,
      22.0
     ],
     "id": "obj-21"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "thispoly~",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "int",
      ""
     ],
     "patching_rect": [
      420,
      84,
      69,
      22.0
     ],
     "id": "obj-22"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "t i i i i i i",
     "numinlets": 1,
     "numoutlets": 6,
     "outlettype": [
      "int",
      "int",
      "int",
      "int",
      "int",
      "int"
     ],
     "patching_rect": [
      420,
      114,
      150,
      22.0
     ],
     "id": "obj-23"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "sprintf name ---aw%ld",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      620,
      150,
      144,
      22.0
     ],
     "id": "obj-24"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "sprintf w ---aw%ld",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      620,
      180,
      125,
      22.0
     ],
     "id": "obj-25"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "sprintf set ---aw%ld",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      620,
      210,
      138,
      22.0
     ],
     "id": "obj-26"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "- 1",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ],
     "patching_rect": [
      620,
      240,
      40,
      22.0
     ],
     "id": "obj-27"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "prepend inst",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      620,
      270,
      88,
      22.0
     ],
     "id": "obj-28"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "shared buffers + device-wide params",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      420,
      310,
      300,
      20.0
     ],
     "fontsize": 10.0,
     "id": "obj-29"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadmess pa ---apa",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      420,
      334,
      112,
      22.0
     ],
     "id": "obj-30"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadmess pb ---apb",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      540,
      334,
      112,
      22.0
     ],
     "id": "obj-31"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadmess st ---ast",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      660,
      334,
      112,
      22.0
     ],
     "id": "obj-32"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadmess cf ---acf",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      780,
      334,
      112,
      22.0
     ],
     "id": "obj-33"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadmess mem ---amem",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      900,
      334,
      112,
      22.0
     ],
     "id": "obj-34"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "loadmess sc ---asc",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1020,
      334,
      112,
      22.0
     ],
     "id": "obj-35"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "r ---all",
     "numinlets": 0,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      1020,
      334,
      63,
      22.0
     ],
     "id": "obj-36"
    }
   },
   {
    "box": {
     "maxclass": "comment",
     "text": "engine",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      420,
      200,
      20.0
     ],
     "fontsize": 10.0,
     "id": "obj-37"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "in~ 1",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      20,
      444,
      45,
      22.0
     ],
     "id": "obj-38"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "in~ 2",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      110,
      444,
      45,
      22.0
     ],
     "id": "obj-39"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "in~ 3",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "signal"
     ],
     "patching_rect": [
      200,
      444,
      45,
      22.0
     ],
     "id": "obj-40"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "gen~ @pa ---apa @pb ---apb @st ---ast @cf ---acf @mem ---amem @sc ---asc",
     "numinlets": 3,
     "numoutlets": 2,
     "outlettype": [
      "signal",
      "signal"
     ],
     "patching_rect": [
      20,
      520,
      420,
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
         "code": "// =====================================================================\n//  WANDERER  \u00b7  voice engine (one file slot)\n//  in1  song position in whole notes      out1  left\n//  in2  slide amount 0..1                 out2  right\n//  in3  transport playing (0/1)\n//\n//  Written for the gen~ compiler:\n//  - every loop sits at the top level; a loop that should not run gets\n//    a length of 0 instead of an enclosing if\n//  - inside loops, all peeks come first, then plain logic\n//  - the 6 playback voices and 4 grain heads are unrolled; their state lives\n//    in Data VS and only playing voices read and write it\n//  - work runs only when needed: hit code on a hit, jump hashes on a tick,\n//    filter coefficients at voice start (every 8 samples while they move)\n//  - no user function with side effects (rnd) is called inside an if block:\n//    gen~ can silently drop such code, so the random draw is written out there\n// =====================================================================\n\n// ---------- helpers (functions must come first) ----------------------\nrnd(R) {\n\tx = peek(R, 0, 0);\n\tx = (x * 16807) % 2147483647;\n\tpoke(R, x, 0, 0);\n\treturn x / 2147483647;\n}\n\nhash(a, b) {\n\treturn fract(sin(a * 12.9898 + b * 78.233) * 43758.5453);\n}\n\ndenorm(n, lo, hi, ex) {\n\treturn lo + (hi - lo) * pow(clamp(n, 0, 1), ex);\n}\n\nscalemask(s) {\n\tm = 4095;                         // chromatic\n\tif (s == 1) { m = 2741; }         // major\n\telse if (s == 2) { m = 1453; }    // minor\n\telse if (s == 3) { m = 1709; }    // dorian\n\telse if (s == 4) { m = 1451; }    // phrygian\n\telse if (s == 5) { m = 2773; }    // lydian\n\telse if (s == 6) { m = 1717; }    // mixolydian\n\telse if (s == 7) { m = 2477; }    // harmonic minor\n\telse if (s == 8) { m = 661; }     // major pentatonic\n\telse if (s == 9) { m = 1193; }    // minor pentatonic\n\telse if (s == 10) { m = 129; }    // fifths\n\telse if (s == 11) { m = 1; }      // octaves\n\treturn m;\n}\n\n// nearest semitone to x that belongs to the scale\nquant(x, m, on) {\n\tn = floor(x + 0.5);\n\tbest = n;\n\tbd = 999;\n\tnk = on > 0 ? 13 : 0;\n\tfor (k = 0; k < nk; k += 1) {\n\t\tc = n + k - 6;\n\t\tpc = wrap(c, 0, 12);\n\t\tbq = floor(m / pow(2, pc));\n\t\tbit = bq - 2 * floor(bq / 2);\n\t\tdd = abs(c - x);\n\t\tbetter = bit > 0.5 && dd < bd;\n\t\tbd = better ? dd : bd;\n\t\tbest = better ? c : best;\n\t}\n\treturn best;\n}\n\nswingoff(tg, sw) {\n\tx = tg * 16;\n\tk = floor(x + 0.5);\n\to = 0;\n\tif (abs(x - k) < 0.0001 && (k % 2) == 1) { o = sw / 48; }\n\treturn o;\n}\n\n// weight of one note value for the next wait\nwwait(nlen, dens, cont, last) {\n\tsh = (log2(1 / nlen) - 2.5) / 2.5;\n\twv = exp(3 * dens * sh);\n\tsim = exp(0 - abs(log2(nlen / last)));\n\treturn wv * exp(3 * cont * (sim - 0.5));\n}\n\n// pick a slice. mode: 0 random, 1 walk, 2 skip, 3 weighted, 4 position\n// ns = 0 makes every loop empty and returns -1\nchoose(tb, sb, ns, mode, spread, wstr, prev, u1, u2, ph) {\n\tres = -1;\n\tcnt = 0;\n\ttot = 0;\n\tpostarget = 0;\n\ten = 0;\n\twv = 0;\n\tpv = 0;\n\t// pass 1: enabled count, total weight, slice under the position\n\tfor (i = 0; i < ns; i += 1) {\n\t\ten = peek(tb, sb + i, 3);\n\t\twv = peek(tb, sb + i, 2);\n\t\tpv = peek(tb, sb + i, 4);\n\t\tif (en > 0.5) { cnt += 1; tot += mix(1, wv, wstr); }\n\t\tif (pv <= ph) { postarget = i; }\n\t}\n\t// direct picks: random (k-th enabled) and weighted (accumulate)\n\tdweight = (mode > 2.5 && mode < 3.5) ? 2 : 0;\n\tdirect = mode < 0.5 ? 1 : dweight;\n\tkk = floor(u1 * cnt);\n\tx = u1 * tot;\n\tacc = 0;\n\tn2 = direct > 0 ? ns : 0;\n\tfor (i = 0; i < n2; i += 1) {\n\t\ten = peek(tb, sb + i, 3);\n\t\twv = peek(tb, sb + i, 2);\n\t\tif (en > 0.5 && res < 0) {\n\t\t\tif (direct == 1) {\n\t\t\t\tif (kk < 0.5) { res = i; }\n\t\t\t\tkk -= 1;\n\t\t\t} else {\n\t\t\t\tacc += mix(1, wv, wstr);\n\t\t\t\tif (acc >= x) { res = i; }\n\t\t\t}\n\t\t}\n\t}\n\t// target picks: walk, skip, position\n\ttarget = -1;\n\tmx = max(1, floor(spread * ns * 0.5 + 0.5));\n\tsp = floor((u1 * 2 - 1) * mx + 0.5);\n\tif (sp == 0) { sp = u2 < 0.5 ? -1 : 1; }\n\tsk = prev + 1;\n\tif (u1 < spread * 0.7) {\n\t\tif (u2 < 0.45) { sk = prev + 2 + floor(u2 * 4.4); }\n\t\telse if (u2 < 0.75) { sk = prev; }\n\t\telse { sk = prev - 1; }\n\t}\n\tpt = postarget;\n\tif (u2 < spread) { pt = postarget + floor((u1 * 2 - 1) * 2.5 + 0.5); }\n\tif (ns > 0) {\n\t\tif (mode > 0.5 && mode < 1.5) { target = wrap(prev + sp, 0, ns); }\n\t\telse if (mode > 1.5 && mode < 2.5) { target = wrap(sk, 0, ns); }\n\t\telse if (mode > 3.5) { target = wrap(pt, 0, ns); }\n\t}\n\t// nearest enabled slice to the target\n\tn3 = (res < 0 && target >= 0) ? ns : 0;\n\tia = 0;\n\tib = 0;\n\tea = 0;\n\teb = 0;\n\tfor (d = 0; d < n3; d += 1) {\n\t\tia = wrap(target + d, 0, ns);\n\t\tib = wrap(target - d, 0, ns);\n\t\tea = peek(tb, sb + ia, 3);\n\t\teb = peek(tb, sb + ib, 3);\n\t\tif (res < 0) {\n\t\t\tif (ea > 0.5) { res = ia; }\n\t\t\telse if (eb > 0.5) { res = ib; }\n\t\t}\n\t}\n\treturn res;\n}\n\n// ---------- device-wide params (prepend name -> gen~) ----------------\nParam inst(0);        // slot index 0..15, set by the voice patch\nParam bsr(44100);     // sample rate of this file\nParam chaos(50);      // 0..100, 50 = ranges as set\nParam gdensity(0);    // -100..100, added to every file's density\nParam gpitch(0);      // global transpose, semitones\nParam gscale(0);      // scale index 0..11\nParam glock(0);       // global lock\nParam mutate(0);      // 0..100\nParam locklen(2);\nParam macro(100);\nParam gtrip(1);       // global Allow Triplets\nParam gdot(1);        // global Allow Dotted\nParam gptch(1);      // global Allow Pitch: 0 = no pitch change of any kind\nParam gquant(0);\nParam gqhit(2);      // Quant grid for main hits: 0 1/4, 1 1/8, 2 1/16, 3 1/32 (Allow Trip adds the triplet lines)\nParam gqext(1);      // Quant grid for repeats: 0 1/16, 1 1/32, 2 1/64\nParam glen(0);       // global Length -100..100: + fuller (Start, Length, Gate, release), - shorter\nParam grev(1);       // global Allow Reverse\nParam geven(0);      // global Even 0..100: pulls every slice toward the same loudness     // global Quantize 0..100: how hard hits are pulled onto the grid       // global Allow Pitch Envelope     // Macro: 0 = clean, 100 = as set, up to 175 = exaggerated     // 0..3 -> 1, 2, 4, 8 bars\n\n// ---------- shared buffers (rebound by name at load) -----------------\nBuffer pa(\"wanderer_pa\");    // per-file params, set A: base, range, mode\nBuffer pb(\"wanderer_pb\");    // per-file params, set B: slide target\nBuffer st(\"wanderer_st\");    // slice table: start, end, weight, enabled, position\nBuffer cf(\"wanderer_cf\");    // control: lock, mute, slices, loop len, derived weights, lock info\nBuffer mem(\"wanderer_mem\");  // per file: 512 hit rows x 43 (col 42: quantize grid), then the locked list (row, phase)\nBuffer w(\"wanderer_w\");      // this file's audio\nBuffer sc(\"wanderer_sc\");    // scale tables, filled by the brain: 12 scales x 512\n\n// ---------- internal state -------------------------------------------\nData PT(64, 3);     // param table: lo, hi, exponent\nData O(64, 1);      // random offsets of the hit being built (-1..1)\nData OP(64, 1);     // offsets of the last primary hit (for repeats)\nData WK(64, 1);     // walk state per param\nData HV(64, 1);     // resolved values of the hit being built\nData RP(16, 1);     // pending repeat times\nData RNG(1, 1);     // generator state\nData SC(8, 1);\nData CL(64, 3);     // Macro table per knob: clean value, scaling kind (0 none, 1 full, 2 capped at 125%, 3 none past 100%), base blended (1) or range only (0)      // values carried from one loop pass to the next (gen~ loses plain variables there)\nData VS(372, 1);     // voice state: one row per voice field, read at the top of each sample, written at the end\n\nHistory inited(0);\nHistory lastinst(-1);\nHistory wasplay(0);\nHistory lastP(0);\nHistory wnps(0);\nHistory nextgrid(0);\nHistory firetime(0);\nHistory lastlen(0.0625);\nHistory lastslice(-1);\nHistory lastsemis(0);\nHistory wc(0);\nHistory waslock(0);\nHistory lastlq(-1);    // quantized phase of the last locked hit in this pass\nHistory lpass(-1);\nHistory lptr(0);\nHistory mutptr(512);\nHistory jtick(-1);\nHistory rn(0);\nHistory ri(0);\nHistory rtotal(1);\nHistory rslice(-1);\nHistory rseed(0);\nHistory rsame(1);\nHistory rvary(0);\nHistory rstepv(0);\nHistory rfade(0);\nHistory mgain(1);\n\n// ---------- voice state (6 voices x 62 fields, unrolled) ----------\n\n// ---------- locals, declared once ----------\nrsT = 0;\nbackjump = 0; restart = 0; stall = 0;\nclc = 0; clk = 0; clb = 0; km1 = 0; km = 0; bbm = 0; mkfull = 0; mkrisk = 0; mkone = 0; chp = 0;\nmcE = 0; mcF = 0; keepF = 0; ncur = 0; ncl = 0; ncl2 = 0; nnew = 0; mcut = 0;\nrestp = 0; isrest = 0;\nchA = 0; chB = 0; chu = 0;\ncapn = 0; sp1 = 0; sk1 = 0; tt1 = 0; acc1 = 0; pk1 = 0; pd1 = 0;\nftvA = 0; ftvB = 0; ftv = 0; ftu = 0; ftsel = 0; ftc = 0; ftr = 0; tcut = 0; ftvary = 0;\nvcnt = 0; wcnt = 0;\nqok = 0; qix = 0; sptr = 0; sadv = 0;\npos = 0; sl = 0; playing = 0; sr = 0; bsrr = 0; pb0 = 0; sb = 0; cb = 0;\nmb = 0; lb0 = 0; cs = 0; mask = 0; lk = 0; ns = 0; flockv = 0; mutev = 0;\nflen = 0; lcnt = 0; lkl = 0; restoreflag = 0; swb = 0; nudb = 0; sprA = 0; wstA = 0;\nsmA = 0; lockon = 0; u1 = 0; u2 = 0; u3 = 0; u4 = 0; u5 = 0; u6 = 0;\nu7 = 0; u8 = 0; hit = 0; hslice = 0; hgrid = 0; hseed = 0; hurep = 0; hk = 0;\nseek = 0; dp = 0; started = 0; nclr = 0; r = 0; rising = 0; capture = 0; fst = 0;\nncap = 0; t0 = 0; cnt = 0; n = 0; rw = 0; tg = 0; rsl = 0; lplay = 0;\nlp = 0; lph = 0; doseek = 0; nseek = 0; skipping = 0; q = 0; qph = 0; domut = 0;\nmrow = 0; mra = 0; mtg = 0; mprev = 0; mutnow = 0; nmut = 0; c = 0; mmd = 0;\nmu = 0; mph = 0; ms = 0; lrow = 0; leph = 0; lra = 0; lsl = 0; lur = 0;\nsa1 = 0; sa2 = 0; sa3 = 0; sa4 = 0; sa5 = 0; sa6 = 0; sa7 = 0; sa8 = 0; sab = 0; sad = 0; sac = 0;\nrx = 0; rqg = 0; qtri = 0; lwt = 0; ltri = 0; rtri = 0; nfr = 0; nvf1 = 0; qd = 0; qv = 0; kq0 = 0; kq1 = 0; kq2 = 0; kq3 = 0; kq4 = 0; kq5 = 0;\nqgh = 0; qge = 0; qtr = 0; qs = 0; qt = 0; qna = 0; qnb = 0; qnx = 0;\nlqs = 0; lqt = 0; lna = 0; lnb = 0; lnx = 0; rqs = 0; rqt = 0; rqn = 0; rna = 0; rnb = 0; rnx = 0;\nlgk = 0; lgp = 0; lgn = 0; lspan = 0; lxf = 0; xzf = 0; xz = 0; p2 = 0; i2 = 0; f2 = 0;\ntc0 = 0; tc1 = 0; td0 = 0; td1 = 0; tl2 = 0; trr2 = 0; efv = 0; gedge = 0; gspan = 0; glo = 0; ghi = 0; gmid = 0;\nrpr = 0; rqp = 0; r16 = 0; rk16 = 0; rsw = 0;\nftraw = 0; slg = 1; qg = 0; qn = 0; qbad = 0;\nlsd = 0; leoff = 0; nload = 0; lo = 0; rpt = 0; pitchoff = 0; pfile = 0; nres = 0;\np = 0; ia = 0; ba = 0; bB = 0; rA = 0; rB = 0; mA = 0; mB = 0;\nwk = 0; ol = 0; op = 0; plo = 0; phiv = 0; pex = 0; coin = 0; u = 0;\nhv1 = 0; hv2 = 0; bb = 0; rr = 0; md = 0; oo = 0; nn = 0; ndisc = 0;\ndva = 0; dvb = 0; hvDens = 0; hvCont = 0; hvSwing = 0; hvNudge = 0; hvSpread = 0; hvWstr = 0;\nhvJump = 0; hvStart = 0; hvLen = 0; hvRev = 0; hvLoop = 0; hvPenv = 0; hvPdec = 0; hvGlide = 0;\nhvAtt = 0; hvDec = 0; hvGate = 0; hvVol = 0; hvPan = 0; hvWidth = 0; hvCut = 0; hvRes = 0;\nhvFenv = 0; hvFdec = 0; hvTrack = 0; hvRchance = 0; hvRcount = 0; hvRshape = 0; hvRfade = 0; hvRstep = 0;\nhvRsame = 0; hvRvar = 0; hvGsize = 0; hvGdens = 0; hvScan = 0; hvGjit = 0; hvGspread = 0; hvV1 = 0;\nhvV2 = 0; hvV4 = 0; hvV8 = 0; hvV16 = 0; hvV32 = 0; hvTrip = 0; hvDot = 0; hvDerived = 0;\nhvSmode = 0; hvChoke = 0; hvEngine = 0; hvFtype = 0; hvRspace = 0; pq = 0; scb = 0; qdeg = 0;\nrsteps = 0; rq = 0; fph = 0; rnew = 0; cprev = 0; cu1 = 0; cu2 = 0; csel = 0;\nhen = 0; badslice = 0; fsel = 0; ra = 0; nrec = 0; ov = 0; prim = 0; ncp = 0;\nrcnt = 0; dorep = 0; spc = 0; nrp = 0; tt = 0; k = 0; startv = 0; hgain = 0;\ns0 = 0; s1 = 0; ra0 = 0; rb0 = 0; ndr = 0; semis = 0; spd = 0; durs = 0;\nngl = 0; nat = 0; ndc = 0; k2 = 0; th = 0; nla = 0; nlb = 0; ll = 0;\nchk = 0; ngd = 0; npos0 = 0; ngain = 0; npl = 0; npr = 0; npd = 0; ngt = 0;\nnfd = 0; ngsz = 0; nseed = 0; nv = 0; oldest = 0; oage = 0; actives = 0; busy0 = 0;\nkill0 = 0; cand0 = 0; older0 = 0; free0 = 0; busy1 = 0; kill1 = 0; cand1 = 0; older1 = 0;\nfree1 = 0; busy2 = 0; kill2 = 0; cand2 = 0; older2 = 0; free2 = 0; busy3 = 0; kill3 = 0;\ncand3 = 0; older3 = 0; free3 = 0; busy4 = 0; kill4 = 0; cand4 = 0; older4 = 0; free4 = 0;\nbusy5 = 0; kill5 = 0; cand5 = 0; older5 = 0; free5 = 0; steal0 = 0; steal1 = 0; steal2 = 0;\nsteal3 = 0; steal4 = 0; steal5 = 0; nvf = 0; go0 = 0; go1 = 0; go2 = 0; go3 = 0;\ngo4 = 0; go5 = 0; dens = 0; cont = 0; anyv = 0; nw = 0; tot = 0; i = 0;\nvon = 0; dwv = 0; onv = 0; dw = 0; ln0 = 0; x = 0; acc = 0; pick = 0;\npicked = 0; w0 = 0; w1 = 0; w2 = 0; t0w = 0; h0w = 0; t1w = 0; h1w = 0;\nt2w = 0; h2w = 0; fin = 0; tk = 0; tch = 0; jsl = 0; jh0 = 0; jgo0 = 0;\njh1 = 0; jgo1 = 0; jh2 = 0; jgo2 = 0; jh3 = 0; jgo3 = 0; jh4 = 0; jgo4 = 0;\njh5 = 0; jgo5 = 0; outl = 0; outr = 0; dk = 0; ef = 0; nch = 0; jn0 = 0;\njn1 = 0; dku = 0; dkn = 0; dended = 0; cutv = 0; swv = 0; dup = 0; ddn = 0;\nfr = 0; na = 0; nb = 0; nl = 0; nla2 = 0; nlb2 = 0; jp = 0; jpc = 0;\njpos = 0; swl = 0; env = 0; gended = 0; glw = 0; glk = 0; sm = 0; ratio = 0;\ni0 = 0; f0 = 0; ta0 = 0; ta1 = 0; tb0 = 0; tb1 = 0; tl = 0; trr = 0;\ntr2 = 0; gnorm = 0; gsl = 0; gsr = 0; gph = 0; gwrap = 0; gspawn = 0; sd = 0;\ngnst = 0; gnrt = 0; rp = 0; gi0 = 0; gf = 0; ga0 = 0; ga1 = 0; gb0 = 0;\ngb1 = 0; gw = 0; gwin = 0; gl0 = 0; gr0 = 0; gr1 = 0; isg = 0; xl = 0;\nxr = 0; adv = 0; looping = 0; span = 0; wrapf = 0; wrapb = 0; pwb = 0; outr0 = 0;\nedgl = 0; edgr = 0; edo = 0; edg = 0; filt = 0; fc = 0; gg = 0; kk = 0;\na1 = 0; a2 = 0; a3 = 0; v3 = 0; v1 = 0; v2 = 0; hpl = 0; sell = 0;\nfl = 0; n1l = 0; n2l = 0; hpr = 0; selr = 0; frr = 0; n1r = 0; n2r = 0;\nmid = 0; sid = 0; envo = 0; amp = 0;\nv0_act = 0; v0_pos = 0; v0_a = 0; v0_b = 0; v0_dir = 0; v0_age = 0; v0_gl = 0; v0_at = 0;\nv0_dc = 0; v0_gain = 0; v0_pl = 0; v0_pr = 0; v0_wid = 0; v0_semi = 0; v0_pe = 0; v0_pd = 0;\nv0_gfrom = 0; v0_gt = 0; v0_cut = 0; v0_res = 0; v0_fe = 0; v0_fd = 0; v0_trk = 0; v0_ft = 0;\nv0_eng = 0; v0_la = 0; v0_lb = 0; v0_kill = 0; v0_duck = 0; v0_ddir = 0; v0_pend = 0; v0_scan = 0;\nv0_gsz = 0; v0_gd = 0; v0_gj = 0; v0_gsp = 0; v0_s1l = 0; v0_s2l = 0; v0_s1r = 0; v0_s2r = 0;\nv0_slc = 0; v0_seed = 0; v0_jc = 0; v0_stn = 0; v0_lnn = 0; v0_lpn = 0; v0_g0ph = 0; v0_g0st = 0;\nv0_g0rt = 0; v0_g0al = 0; v0_g1ph = 0; v0_g1st = 0; v0_g1rt = 0; v0_g1al = 0; v0_g2ph = 0; v0_g2st = 0;\nv0_g2rt = 0; v0_g2al = 0; v0_g3ph = 0; v0_g3st = 0; v0_g3rt = 0; v0_g3al = 0; v1_act = 0; v1_pos = 0;\nv1_a = 0; v1_b = 0; v1_dir = 0; v1_age = 0; v1_gl = 0; v1_at = 0; v1_dc = 0; v1_gain = 0;\nv1_pl = 0; v1_pr = 0; v1_wid = 0; v1_semi = 0; v1_pe = 0; v1_pd = 0; v1_gfrom = 0; v1_gt = 0;\nv1_cut = 0; v1_res = 0; v1_fe = 0; v1_fd = 0; v1_trk = 0; v1_ft = 0; v1_eng = 0; v1_la = 0;\nv1_lb = 0; v1_kill = 0; v1_duck = 0; v1_ddir = 0; v1_pend = 0; v1_scan = 0; v1_gsz = 0; v1_gd = 0;\nv1_gj = 0; v1_gsp = 0; v1_s1l = 0; v1_s2l = 0; v1_s1r = 0; v1_s2r = 0; v1_slc = 0; v1_seed = 0;\nv1_jc = 0; v1_stn = 0; v1_lnn = 0; v1_lpn = 0; v1_g0ph = 0; v1_g0st = 0; v1_g0rt = 0; v1_g0al = 0;\nv1_g1ph = 0; v1_g1st = 0; v1_g1rt = 0; v1_g1al = 0; v1_g2ph = 0; v1_g2st = 0; v1_g2rt = 0; v1_g2al = 0;\nv1_g3ph = 0; v1_g3st = 0; v1_g3rt = 0; v1_g3al = 0; v2_act = 0; v2_pos = 0; v2_a = 0; v2_b = 0;\nv2_dir = 0; v2_age = 0; v2_gl = 0; v2_at = 0; v2_dc = 0; v2_gain = 0; v2_pl = 0; v2_pr = 0;\nv2_wid = 0; v2_semi = 0; v2_pe = 0; v2_pd = 0; v2_gfrom = 0; v2_gt = 0; v2_cut = 0; v2_res = 0;\nv2_fe = 0; v2_fd = 0; v2_trk = 0; v2_ft = 0; v2_eng = 0; v2_la = 0; v2_lb = 0; v2_kill = 0;\nv2_duck = 0; v2_ddir = 0; v2_pend = 0; v2_scan = 0; v2_gsz = 0; v2_gd = 0; v2_gj = 0; v2_gsp = 0;\nv2_s1l = 0; v2_s2l = 0; v2_s1r = 0; v2_s2r = 0; v2_slc = 0; v2_seed = 0; v2_jc = 0; v2_stn = 0;\nv2_lnn = 0; v2_lpn = 0; v2_g0ph = 0; v2_g0st = 0; v2_g0rt = 0; v2_g0al = 0; v2_g1ph = 0; v2_g1st = 0;\nv2_g1rt = 0; v2_g1al = 0; v2_g2ph = 0; v2_g2st = 0; v2_g2rt = 0; v2_g2al = 0; v2_g3ph = 0; v2_g3st = 0;\nv2_g3rt = 0; v2_g3al = 0; v3_act = 0; v3_pos = 0; v3_a = 0; v3_b = 0; v3_dir = 0; v3_age = 0;\nv3_gl = 0; v3_at = 0; v3_dc = 0; v3_gain = 0; v3_pl = 0; v3_pr = 0; v3_wid = 0; v3_semi = 0;\nv3_pe = 0; v3_pd = 0; v3_gfrom = 0; v3_gt = 0; v3_cut = 0; v3_res = 0; v3_fe = 0; v3_fd = 0;\nv3_trk = 0; v3_ft = 0; v3_eng = 0; v3_la = 0; v3_lb = 0; v3_kill = 0; v3_duck = 0; v3_ddir = 0;\nv3_pend = 0; v3_scan = 0; v3_gsz = 0; v3_gd = 0; v3_gj = 0; v3_gsp = 0; v3_s1l = 0; v3_s2l = 0;\nv3_s1r = 0; v3_s2r = 0; v3_slc = 0; v3_seed = 0; v3_jc = 0; v3_stn = 0; v3_lnn = 0; v3_lpn = 0;\nv3_g0ph = 0; v3_g0st = 0; v3_g0rt = 0; v3_g0al = 0; v3_g1ph = 0; v3_g1st = 0; v3_g1rt = 0; v3_g1al = 0;\nv3_g2ph = 0; v3_g2st = 0; v3_g2rt = 0; v3_g2al = 0; v3_g3ph = 0; v3_g3st = 0; v3_g3rt = 0; v3_g3al = 0;\nv4_act = 0; v4_pos = 0; v4_a = 0; v4_b = 0; v4_dir = 0; v4_age = 0; v4_gl = 0; v4_at = 0;\nv4_dc = 0; v4_gain = 0; v4_pl = 0; v4_pr = 0; v4_wid = 0; v4_semi = 0; v4_pe = 0; v4_pd = 0;\nv4_gfrom = 0; v4_gt = 0; v4_cut = 0; v4_res = 0; v4_fe = 0; v4_fd = 0; v4_trk = 0; v4_ft = 0;\nv4_eng = 0; v4_la = 0; v4_lb = 0; v4_kill = 0; v4_duck = 0; v4_ddir = 0; v4_pend = 0; v4_scan = 0;\nv4_gsz = 0; v4_gd = 0; v4_gj = 0; v4_gsp = 0; v4_s1l = 0; v4_s2l = 0; v4_s1r = 0; v4_s2r = 0;\nv4_slc = 0; v4_seed = 0; v4_jc = 0; v4_stn = 0; v4_lnn = 0; v4_lpn = 0; v4_g0ph = 0; v4_g0st = 0;\nv4_g0rt = 0; v4_g0al = 0; v4_g1ph = 0; v4_g1st = 0; v4_g1rt = 0; v4_g1al = 0; v4_g2ph = 0; v4_g2st = 0;\nv4_g2rt = 0; v4_g2al = 0; v4_g3ph = 0; v4_g3st = 0; v4_g3rt = 0; v4_g3al = 0; v5_act = 0; v5_pos = 0;\nv5_a = 0; v5_b = 0; v5_dir = 0; v5_age = 0; v5_gl = 0; v5_at = 0; v5_dc = 0; v5_gain = 0;\nv5_pl = 0; v5_pr = 0; v5_wid = 0; v5_semi = 0; v5_pe = 0; v5_pd = 0; v5_gfrom = 0; v5_gt = 0;\nv5_cut = 0; v5_res = 0; v5_fe = 0; v5_fd = 0; v5_trk = 0; v5_ft = 0; v5_eng = 0; v5_la = 0;\nv5_lb = 0; v5_kill = 0; v5_duck = 0; v5_ddir = 0; v5_pend = 0; v5_scan = 0; v5_gsz = 0; v5_gd = 0;\nv5_gj = 0; v5_gsp = 0; v5_s1l = 0; v5_s2l = 0; v5_s1r = 0; v5_s2r = 0; v5_slc = 0; v5_seed = 0;\nv5_jc = 0; v5_stn = 0; v5_lnn = 0; v5_lpn = 0; v5_g0ph = 0; v5_g0st = 0; v5_g0rt = 0; v5_g0al = 0;\nv5_g1ph = 0; v5_g1st = 0; v5_g1rt = 0; v5_g1al = 0; v5_g2ph = 0; v5_g2st = 0; v5_g2rt = 0; v5_g2al = 0;\nv5_g3ph = 0; v5_g3st = 0; v5_g3rt = 0; v5_g3al = 0;\n\n// ---------- one-time init ---------------------------------------------\n// ---------- parameter range + Macro tables: filled once; a reset zeroes Data, the marker\n// reads 0 again and they are refilled\nif (peek(CL, 63, 2) < 0.5) {\n\tpoke(PT, 0.0, 0, 0); poke(PT, 100.0, 0, 1); poke(PT, 1.0, 0, 2);   // dens\n\tpoke(PT, -100.0, 1, 0); poke(PT, 100.0, 1, 1); poke(PT, 1.0, 1, 2);   // cont\n\tpoke(PT, 0.0, 2, 0); poke(PT, 100.0, 2, 1); poke(PT, 1.0, 2, 2);   // swing\n\tpoke(PT, -30.0, 3, 0); poke(PT, 30.0, 3, 1); poke(PT, 1.0, 3, 2);   // nudge\n\tpoke(PT, 0.0, 4, 0); poke(PT, 100.0, 4, 1); poke(PT, 1.0, 4, 2);   // spread\n\tpoke(PT, 0.0, 5, 0); poke(PT, 100.0, 5, 1); poke(PT, 1.0, 5, 2);   // wstr\n\tpoke(PT, 0.0, 6, 0); poke(PT, 100.0, 6, 1); poke(PT, 1.0, 6, 2);   // jump\n\tpoke(PT, 0.0, 7, 0); poke(PT, 100.0, 7, 1); poke(PT, 1.0, 7, 2);   // start\n\tpoke(PT, 1.0, 8, 0); poke(PT, 100.0, 8, 1); poke(PT, 1.0, 8, 2);   // length\n\tpoke(PT, 0.0, 9, 0); poke(PT, 100.0, 9, 1); poke(PT, 1.0, 9, 2);   // rev\n\tpoke(PT, 0.0, 10, 0); poke(PT, 100.0, 10, 1); poke(PT, 1.0, 10, 2);   // loop\n\tpoke(PT, -24.0, 11, 0); poke(PT, 24.0, 11, 1); poke(PT, 1.0, 11, 2);   // pitch\n\tpoke(PT, -24.0, 12, 0); poke(PT, 24.0, 12, 1); poke(PT, 1.0, 12, 2);   // penv\n\tpoke(PT, 5.0, 13, 0); poke(PT, 1000.0, 13, 1); poke(PT, 3.0, 13, 2);   // pdec\n\tpoke(PT, 0.0, 14, 0); poke(PT, 500.0, 14, 1); poke(PT, 2.0, 14, 2);   // glide\n\tpoke(PT, 0.0, 15, 0); poke(PT, 1000.0, 15, 1); poke(PT, 3.0, 15, 2);   // att\n\tpoke(PT, 5.0, 16, 0); poke(PT, 2000.0, 16, 1); poke(PT, 3.0, 16, 2);   // dec\n\tpoke(PT, 1.0, 17, 0); poke(PT, 100.0, 17, 1); poke(PT, 1.0, 17, 2);   // gate\n\tpoke(PT, -36.0, 18, 0); poke(PT, 6.0, 18, 1); poke(PT, 1.0, 18, 2);   // vol\n\tpoke(PT, -100.0, 19, 0); poke(PT, 100.0, 19, 1); poke(PT, 1.0, 19, 2);   // pan\n\tpoke(PT, 0.0, 20, 0); poke(PT, 200.0, 20, 1); poke(PT, 1.0, 20, 2);   // width\n\tpoke(PT, 20.0, 21, 0); poke(PT, 20000.0, 21, 1); poke(PT, 3.0, 21, 2);   // cut\n\tpoke(PT, 0.0, 22, 0); poke(PT, 100.0, 22, 1); poke(PT, 1.0, 22, 2);   // res\n\tpoke(PT, -100.0, 23, 0); poke(PT, 100.0, 23, 1); poke(PT, 1.0, 23, 2);   // fenv\n\tpoke(PT, 5.0, 24, 0); poke(PT, 2000.0, 24, 1); poke(PT, 3.0, 24, 2);   // fdec\n\tpoke(PT, 0.0, 25, 0); poke(PT, 100.0, 25, 1); poke(PT, 1.0, 25, 2);   // track\n\tpoke(PT, 0.0, 26, 0); poke(PT, 100.0, 26, 1); poke(PT, 1.0, 26, 2);   // rchance\n\tpoke(PT, 1.0, 27, 0); poke(PT, 16.0, 27, 1); poke(PT, 1.0, 27, 2);   // rcount\n\tpoke(PT, -100.0, 28, 0); poke(PT, 100.0, 28, 1); poke(PT, 1.0, 28, 2);   // rshape\n\tpoke(PT, -100.0, 29, 0); poke(PT, 100.0, 29, 1); poke(PT, 1.0, 29, 2);   // rvol\n\tpoke(PT, -7.0, 30, 0); poke(PT, 7.0, 30, 1); poke(PT, 1.0, 30, 2);   // rstep\n\tpoke(PT, 0.0, 31, 0); poke(PT, 100.0, 31, 1); poke(PT, 1.0, 31, 2);   // rsame\n\tpoke(PT, 0.0, 32, 0); poke(PT, 100.0, 32, 1); poke(PT, 1.0, 32, 2);   // rvar\n\tpoke(PT, 10.0, 33, 0); poke(PT, 500.0, 33, 1); poke(PT, 2.0, 33, 2);   // gsize\n\tpoke(PT, 1.0, 34, 0); poke(PT, 4.0, 34, 1); poke(PT, 1.0, 34, 2);   // gdens\n\tpoke(PT, 0.0, 35, 0); poke(PT, 200.0, 35, 1); poke(PT, 1.0, 35, 2);   // scan\n\tpoke(PT, 0.0, 36, 0); poke(PT, 100.0, 36, 1); poke(PT, 1.0, 36, 2);   // gjit\n\tpoke(PT, 0.0, 37, 0); poke(PT, 12.0, 37, 1); poke(PT, 1.0, 37, 2);   // gspread\n\t// Macro table\n\tpoke(CL, 0.500000, 0, 0); poke(CL, 0, 0, 1); poke(CL, 1, 0, 2);   // dens\n\tpoke(CL, 0.500000, 1, 0); poke(CL, 0, 1, 1); poke(CL, 1, 1, 2);   // cont\n\tpoke(CL, 0.000000, 2, 0); poke(CL, 0, 2, 1); poke(CL, 1, 2, 2);   // swing\n\tpoke(CL, 0.500000, 3, 0); poke(CL, 0, 3, 1); poke(CL, 1, 3, 2);   // nudge\n\tpoke(CL, 0.300000, 4, 0); poke(CL, 0, 4, 1); poke(CL, 1, 4, 2);   // spread\n\tpoke(CL, 1.000000, 5, 0); poke(CL, 0, 5, 1); poke(CL, 1, 5, 2);   // wstr\n\tpoke(CL, 0.000000, 6, 0); poke(CL, 2, 6, 1); poke(CL, 1, 6, 2);   // jump\n\tpoke(CL, 0.000000, 7, 0); poke(CL, 3, 7, 1); poke(CL, 1, 7, 2);   // start\n\tpoke(CL, 1.000000, 8, 0); poke(CL, 3, 8, 1); poke(CL, 1, 8, 2);   // length\n\tpoke(CL, 0.000000, 9, 0); poke(CL, 1, 9, 1); poke(CL, 1, 9, 2);   // rev\n\tpoke(CL, 0.000000, 10, 0); poke(CL, 1, 10, 1); poke(CL, 1, 10, 2);   // loop\n\tpoke(CL, 0.500000, 11, 0); poke(CL, 2, 11, 1); poke(CL, 0, 11, 2);   // pitch\n\tpoke(CL, 0.500000, 12, 0); poke(CL, 2, 12, 1); poke(CL, 1, 12, 2);   // penv\n\tpoke(CL, 0.422422, 13, 0); poke(CL, 1, 13, 1); poke(CL, 1, 13, 2);   // pdec\n\tpoke(CL, 0.000000, 14, 0); poke(CL, 1, 14, 1); poke(CL, 1, 14, 2);   // glide\n\tpoke(CL, 0.000000, 15, 0); poke(CL, 1, 15, 1); poke(CL, 1, 15, 2);   // att\n\tpoke(CL, 0.135834, 16, 0); poke(CL, 1, 16, 1); poke(CL, 1, 16, 2);   // dec\n\tpoke(CL, 1.000000, 17, 0); poke(CL, 3, 17, 1); poke(CL, 1, 17, 2);   // gate\n\tpoke(CL, 0.857143, 18, 0); poke(CL, 0, 18, 1); poke(CL, 1, 18, 2);   // vol\n\tpoke(CL, 0.500000, 19, 0); poke(CL, 1, 19, 1); poke(CL, 1, 19, 2);   // pan\n\tpoke(CL, 0.500000, 20, 0); poke(CL, 1, 20, 1); poke(CL, 1, 20, 2);   // width\n\tpoke(CL, 1.000000, 21, 0); poke(CL, 1, 21, 1); poke(CL, 0, 21, 2);   // cut\n\tpoke(CL, 0.000000, 22, 0); poke(CL, 2, 22, 1); poke(CL, 1, 22, 2);   // res\n\tpoke(CL, 0.500000, 23, 0); poke(CL, 1, 23, 1); poke(CL, 1, 23, 2);   // fenv\n\tpoke(CL, 0.417326, 24, 0); poke(CL, 1, 24, 1); poke(CL, 1, 24, 2);   // fdec\n\tpoke(CL, 0.000000, 25, 0); poke(CL, 1, 25, 1); poke(CL, 1, 25, 2);   // track\n\tpoke(CL, 0.000000, 26, 0); poke(CL, 2, 26, 1); poke(CL, 1, 26, 2);   // rchance\n\tpoke(CL, 0.133333, 27, 0); poke(CL, 2, 27, 1); poke(CL, 1, 27, 2);   // rcount\n\tpoke(CL, 0.500000, 28, 0); poke(CL, 1, 28, 1); poke(CL, 1, 28, 2);   // rshape\n\tpoke(CL, 0.300000, 29, 0); poke(CL, 1, 29, 1); poke(CL, 1, 29, 2);   // rvol\n\tpoke(CL, 0.500000, 30, 0); poke(CL, 1, 30, 1); poke(CL, 1, 30, 2);   // rstep\n\tpoke(CL, 1.000000, 31, 0); poke(CL, 1, 31, 1); poke(CL, 1, 31, 2);   // rsame\n\tpoke(CL, 0.000000, 32, 0); poke(CL, 1, 32, 1); poke(CL, 1, 32, 2);   // rvar\n\tpoke(CL, 0.377964, 33, 0); poke(CL, 1, 33, 1); poke(CL, 1, 33, 2);   // gsize\n\tpoke(CL, 0.333333, 34, 0); poke(CL, 1, 34, 1); poke(CL, 1, 34, 2);   // gdens\n\tpoke(CL, 0.500000, 35, 0); poke(CL, 1, 35, 1); poke(CL, 1, 35, 2);   // scan\n\tpoke(CL, 0.100000, 36, 0); poke(CL, 1, 36, 1); poke(CL, 1, 36, 2);   // gjit\n\tpoke(CL, 0.000000, 37, 0); poke(CL, 2, 37, 1); poke(CL, 1, 37, 2);   // gspread\n\tpoke(CL, 1, 63, 2);\n}\ninited = 1;\nif (inst != lastinst) {\n\tpoke(RNG, 1 + inst * 7919 + 12345, 0, 0);\n\tlastinst = inst;\n}\n\n// ---------- voice state: read only for voices that are playing\n\nv0_act = peek(VS, 0, 0);\nif (v0_act > 0.5) {\n\tv0_pos = peek(VS, 1, 0);\n\tv0_a = peek(VS, 2, 0);\n\tv0_b = peek(VS, 3, 0);\n\tv0_dir = peek(VS, 4, 0);\n\tv0_age = peek(VS, 5, 0);\n\tv0_gl = peek(VS, 6, 0);\n\tv0_at = peek(VS, 7, 0);\n\tv0_dc = peek(VS, 8, 0);\n\tv0_gain = peek(VS, 9, 0);\n\tv0_pl = peek(VS, 10, 0);\n\tv0_pr = peek(VS, 11, 0);\n\tv0_wid = peek(VS, 12, 0);\n\tv0_semi = peek(VS, 13, 0);\n\tv0_pe = peek(VS, 14, 0);\n\tv0_pd = peek(VS, 15, 0);\n\tv0_gfrom = peek(VS, 16, 0);\n\tv0_gt = peek(VS, 17, 0);\n\tv0_cut = peek(VS, 18, 0);\n\tv0_res = peek(VS, 19, 0);\n\tv0_fe = peek(VS, 20, 0);\n\tv0_fd = peek(VS, 21, 0);\n\tv0_trk = peek(VS, 22, 0);\n\tv0_ft = peek(VS, 23, 0);\n\tv0_eng = peek(VS, 24, 0);\n\tv0_la = peek(VS, 25, 0);\n\tv0_lb = peek(VS, 26, 0);\n\tv0_kill = peek(VS, 27, 0);\n\tv0_duck = peek(VS, 28, 0);\n\tv0_ddir = peek(VS, 29, 0);\n\tv0_pend = peek(VS, 30, 0);\n\tv0_scan = peek(VS, 31, 0);\n\tv0_gsz = peek(VS, 32, 0);\n\tv0_gd = peek(VS, 33, 0);\n\tv0_gj = peek(VS, 34, 0);\n\tv0_gsp = peek(VS, 35, 0);\n\tv0_s1l = peek(VS, 36, 0);\n\tv0_s2l = peek(VS, 37, 0);\n\tv0_s1r = peek(VS, 38, 0);\n\tv0_s2r = peek(VS, 39, 0);\n\tv0_slc = peek(VS, 40, 0);\n\tv0_seed = peek(VS, 41, 0);\n\tv0_jc = peek(VS, 42, 0);\n\tv0_stn = peek(VS, 43, 0);\n\tv0_lnn = peek(VS, 44, 0);\n\tv0_lpn = peek(VS, 45, 0);\n\tv0_g0ph = peek(VS, 46, 0);\n\tv0_g0st = peek(VS, 47, 0);\n\tv0_g0rt = peek(VS, 48, 0);\n\tv0_g0al = peek(VS, 49, 0);\n\tv0_g1ph = peek(VS, 50, 0);\n\tv0_g1st = peek(VS, 51, 0);\n\tv0_g1rt = peek(VS, 52, 0);\n\tv0_g1al = peek(VS, 53, 0);\n\tv0_g2ph = peek(VS, 54, 0);\n\tv0_g2st = peek(VS, 55, 0);\n\tv0_g2rt = peek(VS, 56, 0);\n\tv0_g2al = peek(VS, 57, 0);\n\tv0_g3ph = peek(VS, 58, 0);\n\tv0_g3st = peek(VS, 59, 0);\n\tv0_g3rt = peek(VS, 60, 0);\n\tv0_g3al = peek(VS, 61, 0);\n}\nv1_act = peek(VS, 62, 0);\nif (v1_act > 0.5) {\n\tv1_pos = peek(VS, 63, 0);\n\tv1_a = peek(VS, 64, 0);\n\tv1_b = peek(VS, 65, 0);\n\tv1_dir = peek(VS, 66, 0);\n\tv1_age = peek(VS, 67, 0);\n\tv1_gl = peek(VS, 68, 0);\n\tv1_at = peek(VS, 69, 0);\n\tv1_dc = peek(VS, 70, 0);\n\tv1_gain = peek(VS, 71, 0);\n\tv1_pl = peek(VS, 72, 0);\n\tv1_pr = peek(VS, 73, 0);\n\tv1_wid = peek(VS, 74, 0);\n\tv1_semi = peek(VS, 75, 0);\n\tv1_pe = peek(VS, 76, 0);\n\tv1_pd = peek(VS, 77, 0);\n\tv1_gfrom = peek(VS, 78, 0);\n\tv1_gt = peek(VS, 79, 0);\n\tv1_cut = peek(VS, 80, 0);\n\tv1_res = peek(VS, 81, 0);\n\tv1_fe = peek(VS, 82, 0);\n\tv1_fd = peek(VS, 83, 0);\n\tv1_trk = peek(VS, 84, 0);\n\tv1_ft = peek(VS, 85, 0);\n\tv1_eng = peek(VS, 86, 0);\n\tv1_la = peek(VS, 87, 0);\n\tv1_lb = peek(VS, 88, 0);\n\tv1_kill = peek(VS, 89, 0);\n\tv1_duck = peek(VS, 90, 0);\n\tv1_ddir = peek(VS, 91, 0);\n\tv1_pend = peek(VS, 92, 0);\n\tv1_scan = peek(VS, 93, 0);\n\tv1_gsz = peek(VS, 94, 0);\n\tv1_gd = peek(VS, 95, 0);\n\tv1_gj = peek(VS, 96, 0);\n\tv1_gsp = peek(VS, 97, 0);\n\tv1_s1l = peek(VS, 98, 0);\n\tv1_s2l = peek(VS, 99, 0);\n\tv1_s1r = peek(VS, 100, 0);\n\tv1_s2r = peek(VS, 101, 0);\n\tv1_slc = peek(VS, 102, 0);\n\tv1_seed = peek(VS, 103, 0);\n\tv1_jc = peek(VS, 104, 0);\n\tv1_stn = peek(VS, 105, 0);\n\tv1_lnn = peek(VS, 106, 0);\n\tv1_lpn = peek(VS, 107, 0);\n\tv1_g0ph = peek(VS, 108, 0);\n\tv1_g0st = peek(VS, 109, 0);\n\tv1_g0rt = peek(VS, 110, 0);\n\tv1_g0al = peek(VS, 111, 0);\n\tv1_g1ph = peek(VS, 112, 0);\n\tv1_g1st = peek(VS, 113, 0);\n\tv1_g1rt = peek(VS, 114, 0);\n\tv1_g1al = peek(VS, 115, 0);\n\tv1_g2ph = peek(VS, 116, 0);\n\tv1_g2st = peek(VS, 117, 0);\n\tv1_g2rt = peek(VS, 118, 0);\n\tv1_g2al = peek(VS, 119, 0);\n\tv1_g3ph = peek(VS, 120, 0);\n\tv1_g3st = peek(VS, 121, 0);\n\tv1_g3rt = peek(VS, 122, 0);\n\tv1_g3al = peek(VS, 123, 0);\n}\nv2_act = peek(VS, 124, 0);\nif (v2_act > 0.5) {\n\tv2_pos = peek(VS, 125, 0);\n\tv2_a = peek(VS, 126, 0);\n\tv2_b = peek(VS, 127, 0);\n\tv2_dir = peek(VS, 128, 0);\n\tv2_age = peek(VS, 129, 0);\n\tv2_gl = peek(VS, 130, 0);\n\tv2_at = peek(VS, 131, 0);\n\tv2_dc = peek(VS, 132, 0);\n\tv2_gain = peek(VS, 133, 0);\n\tv2_pl = peek(VS, 134, 0);\n\tv2_pr = peek(VS, 135, 0);\n\tv2_wid = peek(VS, 136, 0);\n\tv2_semi = peek(VS, 137, 0);\n\tv2_pe = peek(VS, 138, 0);\n\tv2_pd = peek(VS, 139, 0);\n\tv2_gfrom = peek(VS, 140, 0);\n\tv2_gt = peek(VS, 141, 0);\n\tv2_cut = peek(VS, 142, 0);\n\tv2_res = peek(VS, 143, 0);\n\tv2_fe = peek(VS, 144, 0);\n\tv2_fd = peek(VS, 145, 0);\n\tv2_trk = peek(VS, 146, 0);\n\tv2_ft = peek(VS, 147, 0);\n\tv2_eng = peek(VS, 148, 0);\n\tv2_la = peek(VS, 149, 0);\n\tv2_lb = peek(VS, 150, 0);\n\tv2_kill = peek(VS, 151, 0);\n\tv2_duck = peek(VS, 152, 0);\n\tv2_ddir = peek(VS, 153, 0);\n\tv2_pend = peek(VS, 154, 0);\n\tv2_scan = peek(VS, 155, 0);\n\tv2_gsz = peek(VS, 156, 0);\n\tv2_gd = peek(VS, 157, 0);\n\tv2_gj = peek(VS, 158, 0);\n\tv2_gsp = peek(VS, 159, 0);\n\tv2_s1l = peek(VS, 160, 0);\n\tv2_s2l = peek(VS, 161, 0);\n\tv2_s1r = peek(VS, 162, 0);\n\tv2_s2r = peek(VS, 163, 0);\n\tv2_slc = peek(VS, 164, 0);\n\tv2_seed = peek(VS, 165, 0);\n\tv2_jc = peek(VS, 166, 0);\n\tv2_stn = peek(VS, 167, 0);\n\tv2_lnn = peek(VS, 168, 0);\n\tv2_lpn = peek(VS, 169, 0);\n\tv2_g0ph = peek(VS, 170, 0);\n\tv2_g0st = peek(VS, 171, 0);\n\tv2_g0rt = peek(VS, 172, 0);\n\tv2_g0al = peek(VS, 173, 0);\n\tv2_g1ph = peek(VS, 174, 0);\n\tv2_g1st = peek(VS, 175, 0);\n\tv2_g1rt = peek(VS, 176, 0);\n\tv2_g1al = peek(VS, 177, 0);\n\tv2_g2ph = peek(VS, 178, 0);\n\tv2_g2st = peek(VS, 179, 0);\n\tv2_g2rt = peek(VS, 180, 0);\n\tv2_g2al = peek(VS, 181, 0);\n\tv2_g3ph = peek(VS, 182, 0);\n\tv2_g3st = peek(VS, 183, 0);\n\tv2_g3rt = peek(VS, 184, 0);\n\tv2_g3al = peek(VS, 185, 0);\n}\nv3_act = peek(VS, 186, 0);\nif (v3_act > 0.5) {\n\tv3_pos = peek(VS, 187, 0);\n\tv3_a = peek(VS, 188, 0);\n\tv3_b = peek(VS, 189, 0);\n\tv3_dir = peek(VS, 190, 0);\n\tv3_age = peek(VS, 191, 0);\n\tv3_gl = peek(VS, 192, 0);\n\tv3_at = peek(VS, 193, 0);\n\tv3_dc = peek(VS, 194, 0);\n\tv3_gain = peek(VS, 195, 0);\n\tv3_pl = peek(VS, 196, 0);\n\tv3_pr = peek(VS, 197, 0);\n\tv3_wid = peek(VS, 198, 0);\n\tv3_semi = peek(VS, 199, 0);\n\tv3_pe = peek(VS, 200, 0);\n\tv3_pd = peek(VS, 201, 0);\n\tv3_gfrom = peek(VS, 202, 0);\n\tv3_gt = peek(VS, 203, 0);\n\tv3_cut = peek(VS, 204, 0);\n\tv3_res = peek(VS, 205, 0);\n\tv3_fe = peek(VS, 206, 0);\n\tv3_fd = peek(VS, 207, 0);\n\tv3_trk = peek(VS, 208, 0);\n\tv3_ft = peek(VS, 209, 0);\n\tv3_eng = peek(VS, 210, 0);\n\tv3_la = peek(VS, 211, 0);\n\tv3_lb = peek(VS, 212, 0);\n\tv3_kill = peek(VS, 213, 0);\n\tv3_duck = peek(VS, 214, 0);\n\tv3_ddir = peek(VS, 215, 0);\n\tv3_pend = peek(VS, 216, 0);\n\tv3_scan = peek(VS, 217, 0);\n\tv3_gsz = peek(VS, 218, 0);\n\tv3_gd = peek(VS, 219, 0);\n\tv3_gj = peek(VS, 220, 0);\n\tv3_gsp = peek(VS, 221, 0);\n\tv3_s1l = peek(VS, 222, 0);\n\tv3_s2l = peek(VS, 223, 0);\n\tv3_s1r = peek(VS, 224, 0);\n\tv3_s2r = peek(VS, 225, 0);\n\tv3_slc = peek(VS, 226, 0);\n\tv3_seed = peek(VS, 227, 0);\n\tv3_jc = peek(VS, 228, 0);\n\tv3_stn = peek(VS, 229, 0);\n\tv3_lnn = peek(VS, 230, 0);\n\tv3_lpn = peek(VS, 231, 0);\n\tv3_g0ph = peek(VS, 232, 0);\n\tv3_g0st = peek(VS, 233, 0);\n\tv3_g0rt = peek(VS, 234, 0);\n\tv3_g0al = peek(VS, 235, 0);\n\tv3_g1ph = peek(VS, 236, 0);\n\tv3_g1st = peek(VS, 237, 0);\n\tv3_g1rt = peek(VS, 238, 0);\n\tv3_g1al = peek(VS, 239, 0);\n\tv3_g2ph = peek(VS, 240, 0);\n\tv3_g2st = peek(VS, 241, 0);\n\tv3_g2rt = peek(VS, 242, 0);\n\tv3_g2al = peek(VS, 243, 0);\n\tv3_g3ph = peek(VS, 244, 0);\n\tv3_g3st = peek(VS, 245, 0);\n\tv3_g3rt = peek(VS, 246, 0);\n\tv3_g3al = peek(VS, 247, 0);\n}\nv4_act = peek(VS, 248, 0);\nif (v4_act > 0.5) {\n\tv4_pos = peek(VS, 249, 0);\n\tv4_a = peek(VS, 250, 0);\n\tv4_b = peek(VS, 251, 0);\n\tv4_dir = peek(VS, 252, 0);\n\tv4_age = peek(VS, 253, 0);\n\tv4_gl = peek(VS, 254, 0);\n\tv4_at = peek(VS, 255, 0);\n\tv4_dc = peek(VS, 256, 0);\n\tv4_gain = peek(VS, 257, 0);\n\tv4_pl = peek(VS, 258, 0);\n\tv4_pr = peek(VS, 259, 0);\n\tv4_wid = peek(VS, 260, 0);\n\tv4_semi = peek(VS, 261, 0);\n\tv4_pe = peek(VS, 262, 0);\n\tv4_pd = peek(VS, 263, 0);\n\tv4_gfrom = peek(VS, 264, 0);\n\tv4_gt = peek(VS, 265, 0);\n\tv4_cut = peek(VS, 266, 0);\n\tv4_res = peek(VS, 267, 0);\n\tv4_fe = peek(VS, 268, 0);\n\tv4_fd = peek(VS, 269, 0);\n\tv4_trk = peek(VS, 270, 0);\n\tv4_ft = peek(VS, 271, 0);\n\tv4_eng = peek(VS, 272, 0);\n\tv4_la = peek(VS, 273, 0);\n\tv4_lb = peek(VS, 274, 0);\n\tv4_kill = peek(VS, 275, 0);\n\tv4_duck = peek(VS, 276, 0);\n\tv4_ddir = peek(VS, 277, 0);\n\tv4_pend = peek(VS, 278, 0);\n\tv4_scan = peek(VS, 279, 0);\n\tv4_gsz = peek(VS, 280, 0);\n\tv4_gd = peek(VS, 281, 0);\n\tv4_gj = peek(VS, 282, 0);\n\tv4_gsp = peek(VS, 283, 0);\n\tv4_s1l = peek(VS, 284, 0);\n\tv4_s2l = peek(VS, 285, 0);\n\tv4_s1r = peek(VS, 286, 0);\n\tv4_s2r = peek(VS, 287, 0);\n\tv4_slc = peek(VS, 288, 0);\n\tv4_seed = peek(VS, 289, 0);\n\tv4_jc = peek(VS, 290, 0);\n\tv4_stn = peek(VS, 291, 0);\n\tv4_lnn = peek(VS, 292, 0);\n\tv4_lpn = peek(VS, 293, 0);\n\tv4_g0ph = peek(VS, 294, 0);\n\tv4_g0st = peek(VS, 295, 0);\n\tv4_g0rt = peek(VS, 296, 0);\n\tv4_g0al = peek(VS, 297, 0);\n\tv4_g1ph = peek(VS, 298, 0);\n\tv4_g1st = peek(VS, 299, 0);\n\tv4_g1rt = peek(VS, 300, 0);\n\tv4_g1al = peek(VS, 301, 0);\n\tv4_g2ph = peek(VS, 302, 0);\n\tv4_g2st = peek(VS, 303, 0);\n\tv4_g2rt = peek(VS, 304, 0);\n\tv4_g2al = peek(VS, 305, 0);\n\tv4_g3ph = peek(VS, 306, 0);\n\tv4_g3st = peek(VS, 307, 0);\n\tv4_g3rt = peek(VS, 308, 0);\n\tv4_g3al = peek(VS, 309, 0);\n}\nv5_act = peek(VS, 310, 0);\nif (v5_act > 0.5) {\n\tv5_pos = peek(VS, 311, 0);\n\tv5_a = peek(VS, 312, 0);\n\tv5_b = peek(VS, 313, 0);\n\tv5_dir = peek(VS, 314, 0);\n\tv5_age = peek(VS, 315, 0);\n\tv5_gl = peek(VS, 316, 0);\n\tv5_at = peek(VS, 317, 0);\n\tv5_dc = peek(VS, 318, 0);\n\tv5_gain = peek(VS, 319, 0);\n\tv5_pl = peek(VS, 320, 0);\n\tv5_pr = peek(VS, 321, 0);\n\tv5_wid = peek(VS, 322, 0);\n\tv5_semi = peek(VS, 323, 0);\n\tv5_pe = peek(VS, 324, 0);\n\tv5_pd = peek(VS, 325, 0);\n\tv5_gfrom = peek(VS, 326, 0);\n\tv5_gt = peek(VS, 327, 0);\n\tv5_cut = peek(VS, 328, 0);\n\tv5_res = peek(VS, 329, 0);\n\tv5_fe = peek(VS, 330, 0);\n\tv5_fd = peek(VS, 331, 0);\n\tv5_trk = peek(VS, 332, 0);\n\tv5_ft = peek(VS, 333, 0);\n\tv5_eng = peek(VS, 334, 0);\n\tv5_la = peek(VS, 335, 0);\n\tv5_lb = peek(VS, 336, 0);\n\tv5_kill = peek(VS, 337, 0);\n\tv5_duck = peek(VS, 338, 0);\n\tv5_ddir = peek(VS, 339, 0);\n\tv5_pend = peek(VS, 340, 0);\n\tv5_scan = peek(VS, 341, 0);\n\tv5_gsz = peek(VS, 342, 0);\n\tv5_gd = peek(VS, 343, 0);\n\tv5_gj = peek(VS, 344, 0);\n\tv5_gsp = peek(VS, 345, 0);\n\tv5_s1l = peek(VS, 346, 0);\n\tv5_s2l = peek(VS, 347, 0);\n\tv5_s1r = peek(VS, 348, 0);\n\tv5_s2r = peek(VS, 349, 0);\n\tv5_slc = peek(VS, 350, 0);\n\tv5_seed = peek(VS, 351, 0);\n\tv5_jc = peek(VS, 352, 0);\n\tv5_stn = peek(VS, 353, 0);\n\tv5_lnn = peek(VS, 354, 0);\n\tv5_lpn = peek(VS, 355, 0);\n\tv5_g0ph = peek(VS, 356, 0);\n\tv5_g0st = peek(VS, 357, 0);\n\tv5_g0rt = peek(VS, 358, 0);\n\tv5_g0al = peek(VS, 359, 0);\n\tv5_g1ph = peek(VS, 360, 0);\n\tv5_g1st = peek(VS, 361, 0);\n\tv5_g1rt = peek(VS, 362, 0);\n\tv5_g1al = peek(VS, 363, 0);\n\tv5_g2ph = peek(VS, 364, 0);\n\tv5_g2st = peek(VS, 365, 0);\n\tv5_g2rt = peek(VS, 366, 0);\n\tv5_g2al = peek(VS, 367, 0);\n\tv5_g3ph = peek(VS, 368, 0);\n\tv5_g3st = peek(VS, 369, 0);\n\tv5_g3rt = peek(VS, 370, 0);\n\tv5_g3al = peek(VS, 371, 0);\n}\n// ---------- per-sample context ----------------------------------------\npos = in1;\nsl = clamp(in2, 0, 1);\nplaying = in3 > 0.5;\nsr = samplerate;\nbsrr = max(1000, bsr) / samplerate;   // no ternary, no local: gen~ hoists this\npb0 = inst * 64;\nsb = inst * 256;\ncb = inst * 32;\nmb = inst * 1024;\nlb0 = (mb + 512) * 43;          // start of this file's locked list\ncs = chaos / 50;\nmask = scalemask(gscale);\nlk = 8;\nlk = locklen < 2.5 ? 4 : lk;\nlk = locklen < 1.5 ? 2 : lk;\nlk = locklen < 0.5 ? 1 : lk;\n\nns = peek(cf, cb + 2, 0);\nflockv = peek(cf, cb, 0);\nmutev = peek(cf, cb + 1, 0);\nflen = max(0.25, peek(cf, cb + 3, 0));\nlcnt = peek(cf, cb + 16, 0);\nlkl = max(1, peek(cf, cb + 17, 0));\nrestoreflag = peek(cf, cb + 19, 0);\nswb = mix(peek(pa, pb0 + 2, 0), peek(pb, pb0 + 2, 0), sl);\nnudb = denorm(mix(peek(pa, pb0 + 3, 0), peek(pb, pb0 + 3, 0), sl), -30, 30, 1);\nsprA = peek(pa, pb0 + 4, 0);\nwstA = peek(pa, pb0 + 5, 0);\nsmA = peek(pa, pb0 + 47, 0);\nlockon = max(flockv, glock) > 0.5;\n\nu1 = rnd(RNG);\nu2 = rnd(RNG);\nu3 = rnd(RNG);\nu4 = rnd(RNG);\nu5 = rnd(RNG);\nu6 = rnd(RNG);\nu7 = rnd(RNG);\nu8 = rnd(RNG);\n\nhit = 0;          // 0 none, 1 free primary, 2 locked primary, 3 repeat\nhslice = -1;\nhgrid = pos;\nhseed = 0;\nhurep = 1;\nhk = 0;\nseek = 0;\n\n// ---------- tempo (whole notes per sample) ----------------------------\ndp = pos - lastP;\nbackjump = playing && dp < -0.001;            // the count restarted (Live may report play before the reset)\nif (playing && dp > 0 && dp < 0.01) { wnps = wnps + (dp - wnps) * 0.01; }\nif (wnps <= 0) { wnps = 0.5 / sr; }\nlastP = pos;\n\n// ---------- transport start: every file waits for the next bar --------\nstarted = playing && wasplay < 0.5;\nnclr = (started && lockon == 0) ? 512 : 0;\nfor (r = 0; r < nclr; r += 1) { poke(mem, 0, (mb + r) * 43 + 1, 0); }\nrestart = started || backjump;\nif (restart) {\n\tif (started && lockon == 0) { wc = 0; }\n\tnextgrid = ceil(pos - 0.000001);\n\tfiretime = nextgrid;\n\trn = 0;\n\tri = 0;\n\tjtick = -1;\n\tseek = 1;\n}\nwasplay = playing;\n\n// ---------- clock watchdog: never wait longer than any real wait could be ----------\nstall = playing && (firetime > pos + 2 || isnan(firetime));\nnextgrid = stall ? (floor(pos * 16) + 1) / 16 : nextgrid;\nfiretime = stall ? nextgrid : firetime;\n\n// ---------- lock: capture the last lk whole notes ---------------------\n// two passes over the hit rows in time order; the locked list holds\n// (row, loop phase) pairs sorted by phase\nrising = lockon && waslock < 0.5;\ncapture = rising && restoreflag < 0.5;\nfst = max(0, wc - 512);\nncap = capture ? wc - fst : 0;\nt0 = floor(pos / lk) * lk;\npoke(SC, 0, 0, 0);\nvcnt = 0;\nwcnt = 0;\nfor (n = 0; n < ncap; n += 1) {\n\trw = (fst + n) % 512;\n\ttg = peek(mem, (mb + rw) * 43, 0);\n\trsl = peek(mem, (mb + rw) * 43 + 1, 0);\n\tvcnt += rsl > 0.5;\n\twcnt += rsl > 0.5 && tg <= pos && tg > pos - lk;\n\tcapn = peek(SC, 0, 0);\n\tqok = rsl > 0.5 && tg <= pos && tg > pos - lk && tg >= t0 && capn < 512;\n\tqix = qok ? lb0 + capn * 2 : lb0 + 1100;         // not wanted: write to a scratch slot\n\tpoke(mem, rw, qix, 0);\n\tpoke(mem, tg - t0, qix + 1, 0);\n\tpoke(SC, capn + qok, 0, 0);\n}\nfor (n = 0; n < ncap; n += 1) {\n\trw = (fst + n) % 512;\n\ttg = peek(mem, (mb + rw) * 43, 0);\n\trsl = peek(mem, (mb + rw) * 43 + 1, 0);\n\tcapn = peek(SC, 0, 0);\n\tqok = rsl > 0.5 && tg <= pos && tg > pos - lk && tg < t0 && capn < 512;\n\tqix = qok ? lb0 + capn * 2 : lb0 + 1100;         // not wanted: write to a scratch slot\n\tpoke(mem, rw, qix, 0);\n\tpoke(mem, tg - (t0 - lk), qix + 1, 0);\n\tpoke(SC, capn + qok, 0, 0);\n}\ncapn = peek(SC, 0, 0);\nif (capture) {\n\tpoke(cf, capn, cb + 16, 0);\n\tpoke(cf, lk, cb + 17, 0);\n\tlcnt = capn;\n\tlkl = lk;\n}\nif (rising) { seek = 1; }\nif (lockon && restoreflag > 0.5) { poke(cf, 0, cb + 19, 0); }\nif (lockon == 0 && waslock > 0.5) {\n\tnextgrid = (floor(pos * 16) + 1) / 16;\n\tfiretime = nextgrid;\n}\nwaslock = lockon;\n\n// ---------- locked playback: position in the loop ---------------------\nlplay = lockon && playing;\nlp = floor(pos / lkl);\nlph = pos - lp * lkl;\nif (lplay && seek < 0.5 && lp != lpass) {\n\tmutptr = (lp == lpass + 1 && mutate > 0) ? 0 : 512;\n\tlpass = lp;\n\tlptr = 0;\n}\ndoseek = lplay && seek > 0.5;\nif (doseek) {\n\tlpass = lp;\n\tlptr = 0;\n\tmutptr = 512;\n\tlastlq = -1;\n}\nnseek = doseek ? lcnt : 0;\nskipping = 1;\npoke(SC, lptr, 1, 0);\npoke(SC, 1, 2, 0);\nfor (q = 0; q < nseek; q += 1) {\n\tqph = peek(mem, lb0 + q * 2 + 1, 0);\n\tsp1 = peek(SC, 1, 0);\n\tsk1 = peek(SC, 2, 0);\n\tsadv = sk1 > 0 && qph <= lph;\n\tpoke(SC, sadv ? q + 1 : sp1, 1, 0);\n\tpoke(SC, sadv ? sk1 : 0, 2, 0);\n}\nlptr = peek(SC, 1, 0);\n\n// ---------- mutate: one locked hit per sample after each loop pass ----\ndomut = lplay && mutptr < lcnt;\nmrow = peek(mem, lb0 + mutptr * 2, 0);\nmra = (mb + mrow) * 43;\nmtg = peek(mem, mra, 0);\nmprev = peek(mem, mra + 1, 0) - 1;\nmutnow = domut && u1 < mutate / 100;\nnmut = mutnow ? 38 : 0;\nfor (c = 0; c < nmut; c += 1) {\n\tmmd = peek(pa, pb0 + c, 2);\n\tmu = rnd(RNG) * 2 - 1;\n\tpoke(mem, mmd > 0.5 ? mu : 0, mra + 2 + c, 0);\n}\nmph = (mtg - floor(mtg / flen) * flen) / flen;\nms = choose(st, sb, mutnow ? ns : 0, smA, sprA, wstA, mprev, u2, u3, mph);\nif (mutnow) {\n\tif (ms >= 0) { poke(mem, ms + 1, mra + 1, 0); }\n\tpoke(mem, u4, mra + 40, 0);\n\tpoke(mem, floor(u5 * 100000) / 100, mra + 41, 0);\n}\nif (domut) { mutptr += 1; }\n\n// ---------- quantize -----------------------------------------------------\n// main hits snap to the Hits grid, repeats to the Extra grid. Each hit uses lines of its own kind:\n// triplet waits / spacings use the triplet lines (only with Allow Trip), all others the straight lines.\n// Swing moves the odd 16ths; Quant fades Swing out (100% = straight).\n// Quant also moves Start to the nearest attack in the slice and caps the attack at 15 ms.\n// Two hits never share a line: a later one moves to the next line.\nqa = clamp(gquant / 100, 0, 1);\nqgh = 0.03125;\nqgh = gqhit < 2.5 ? 0.0625 : qgh;\nqgh = gqhit < 1.5 ? 0.125 : qgh;\nqgh = gqhit < 0.5 ? 0.25 : qgh;\nqge = 0.015625;\nqge = gqext < 1.5 ? 0.03125 : qge;\nqge = gqext < 0.5 ? 0.0625 : qge;\nqtr = gtrip > 0.5;\nswb = swb * (1 - qa);                                   // Quant takes Swing out: 100% = straight\n\n// ---------- locked hit -------------------------------------------------\nlrow = peek(mem, lb0 + lptr * 2, 0);\nleph = peek(mem, lb0 + lptr * 2 + 1, 0);\nlra = (mb + lrow) * 43;\nlsl = peek(mem, lra + 1, 0);\nlur = peek(mem, lra + 40, 0);\nlsd = peek(mem, lra + 41, 0);\nlqs = floor(leph / qgh + 0.5) * qgh;\nlqt = floor(leph / (qgh * 2 / 3) + 0.5) * (qgh * 2 / 3);\nlwt = max(peek(mem, lra + 42, 0), 0.000001);            // the wait that led to this hit when it was captured\nltri = qtr && abs(log2(lwt * 3) - floor(log2(lwt * 3) + 0.5)) < 0.01;\nlqn = ltri ? lqt : lqs;\nlqprev = lptr == 0 ? -1 : lastlq;\nlna = (floor(lqprev / qgh + 0.000001) + 1) * qgh;\nlnb = (floor(lqprev / (qgh * 2 / 3) + 0.000001) + 1) * (qgh * 2 / 3);\nlnx = ltri ? lnb : lna;\nlqn = max(lqn, lnx);                                     // two hits on one grid line: the later one moves on\nlfr = leph + swingoff(leph, swb) + nudb * 0.001 * wnps * sr;\nlfq = lqn + swingoff(lqn, swb);\nleoff = min(lkl - 0.0001, mix(lfr, lfq, qa));\nif (lplay && lptr < lcnt && leoff <= lph) {\n\tlastlq = lqn;\n\thit = 2;\n\thslice = lsl - 1;\n\thgrid = leph + lp * lkl;\n\thurep = lur;\n\thseed = lsd;\n\tlptr += 1;\n}\nnload = hit == 2 ? 38 : 0;\nfor (c = 0; c < nload; c += 1) {\n\tlo = peek(mem, lra + 2 + c, 0);\n\tpoke(O, lo, c, 0);\n}\n\n// ---------- free running clock -----------------------------------------\nif (lockon == 0 && playing && hit == 0 && pos >= firetime) {\n\thit = 1;\n\thgrid = nextgrid;\n\thurep = u6;\n\thseed = floor(u7 * 100000) / 100;\n}\n\n// ---------- pending repeats --------------------------------------------\nrpt = peek(RP, ri, 0);\nif (hit == 0 && playing && ri < rn && pos >= rpt) {\n\thit = 3;\n\thk = ri + 1;\n\thseed = rseed;\n\tri += 1;\n}\n\n// =====================================================================\n//  TRIGGER\n// =====================================================================\n\n// ---- 1. resolve per-file params, blending set A -> B by slide ----\nmkfull = clamp(macro, 0, 175) / 100;\nmkrisk = min(mkfull, 1.25);\nmkone = min(mkfull, 1);\npitchoff = 0;\npfile = 0;\nnres = hit > 0 ? 38 : 0;\nfor (p = 0; p < nres; p += 1) {\n\tia = pb0 + p;\n\tba = peek(pa, ia, 0);\n\tbB = peek(pb, ia, 0);\n\trA = peek(pa, ia, 1);\n\trB = peek(pb, ia, 1);\n\tmA = peek(pa, ia, 2);\n\tmB = peek(pb, ia, 2);\n\twk = peek(WK, p, 0);\n\tol = peek(O, p, 0);\n\top = peek(OP, p, 0);\n\tclc = peek(CL, p, 0);\n\tclk = peek(CL, p, 1);\n\tclb = peek(CL, p, 2);\n\tplo = peek(PT, p, 0);\n\tphiv = peek(PT, p, 1);\n\tpex = peek(PT, p, 2);\n\tcoin = rnd(RNG);\n\tu = rnd(RNG) * 2 - 1;\n\thv1 = hash(rseed, hk * 41 + p * 1.7);\n\thv2 = hash(rseed, hk * 53 + p * 2.9) * 2 - 1;\n\tbb = mix(ba, bB, sl);\n\trr = mix(rA, rB, sl);\n\tkm1 = clk > 1.5 ? mkrisk : mkfull;\n\tkm1 = clk > 2.5 ? mkone : km1;                     // kind 3: no overshoot (start, length, gate)\n\tkm = clk > 0.5 ? km1 : 1;\n\tbbm = clamp(clc + (bb - clc) * km, 0, 1);\n\tbb = clb > 0.5 ? bbm : bb;\n\trr = clamp(rr * km, 0, 1);\n\tmd = coin < sl ? mB : mA;\n\too = 0;\n\tif (md > 0.5) {\n\t\tif (hit == 1) {\n\t\t\tif (md > 1.5) {\n\t\t\t\too = clamp(wk + u * 0.35, -1, 1);\n\t\t\t\tpoke(WK, oo, p, 0);\n\t\t\t} else {\n\t\t\t\too = u;\n\t\t\t}\n\t\t} else if (hit == 2) {\n\t\t\too = ol;\n\t\t} else {\n\t\t\too = hv1 < rvary ? hv2 : op;\n\t\t}\n\t}\n\tpoke(O, oo, p, 0);\n\tnn = clamp(bb + oo * rr * cs, 0, 1);\n\tpoke(HV, denorm(nn, plo, phiv, pex), p, 0);\n\tif (p == 11) {\n\t\tpfile = denorm(bb, -24, 24, 1);\n\t\tpitchoff = oo * rr * cs * 48;\n\t}\n}\nndisc = hit > 0 ? 14 : 0;\nfor (p = 0; p < ndisc; p += 1) {\n\tdva = peek(pa, pb0 + 38 + p, 0);\n\tdvb = peek(pb, pb0 + 38 + p, 0);\n\tcoin = rnd(RNG);\n\tpoke(HV, coin < sl ? dvb : dva, 38 + p, 0);\n}\n\n// ---- resolved values ----\nhvDens = peek(HV, 0, 0);\nhvCont = peek(HV, 1, 0);\nhvSwing = peek(HV, 2, 0) * (1 - qa);                    // Quant takes Swing out: 100% = straight\nhvNudge = peek(HV, 3, 0);\nhvSpread = peek(HV, 4, 0) / 100;\nhvWstr = peek(HV, 5, 0) / 100;\nhvJump = peek(HV, 6, 0) / 100;\nhvStart = peek(HV, 7, 0) / 100;\nhvLen = peek(HV, 8, 0) / 100;\nhvRev = peek(HV, 9, 0) / 100;\nhvLoop = peek(HV, 10, 0) / 100;\nhvPenv = peek(HV, 12, 0);\nhvPdec = peek(HV, 13, 0);\nhvGlide = peek(HV, 14, 0);\nhvAtt = peek(HV, 15, 0);\nhvDec = peek(HV, 16, 0);\nhvGate = peek(HV, 17, 0) / 100;\nhvVol = peek(HV, 18, 0);\nhvPan = peek(HV, 19, 0) / 100;\nhvWidth = peek(HV, 20, 0) / 100;\nhvCut = peek(HV, 21, 0);\nhvRes = peek(HV, 22, 0) / 100;\nhvFenv = peek(HV, 23, 0) / 100;\nhvFdec = peek(HV, 24, 0);\nhvTrack = peek(HV, 25, 0) / 100;\nhvRchance = peek(HV, 26, 0) / 100;\nhvRcount = peek(HV, 27, 0);\nhvRshape = peek(HV, 28, 0) / 100;\nhvRfade = peek(HV, 29, 0) / 100;\nhvRstep = peek(HV, 30, 0);\nhvRsame = peek(HV, 31, 0) / 100;\nhvRvar = peek(HV, 32, 0) / 100;\nhvGsize = peek(HV, 33, 0);\nhvGdens = peek(HV, 34, 0);\nhvScan = peek(HV, 35, 0) / 100;\nhvGjit = peek(HV, 36, 0) / 100;\nhvGspread = peek(HV, 37, 0);\nhvV1 = peek(HV, 38, 0);\nhvV2 = peek(HV, 39, 0);\nhvV4 = peek(HV, 40, 0);\nhvV8 = peek(HV, 41, 0);\nhvV16 = peek(HV, 42, 0);\nhvV32 = peek(HV, 43, 0);\nhvTrip = peek(HV, 44, 0);\nhvDot = peek(HV, 45, 0);\nhvDerived = peek(HV, 46, 0);\nhvSmode = peek(HV, 47, 0);\nhvChoke = peek(HV, 48, 0);\nhvEngine = peek(HV, 49, 0);\nhvFtype = peek(HV, 50, 0);\nhvRspace = peek(HV, 51, 0);\n// global Allow switches: off removes triplet / dotted waits (and triplet repeat spacing) for every file\nhvTrip = gtrip > 0.5 ? hvTrip : 0;\nhvDot = gdot > 0.5 ? hvDot : 0;\nhvPenv = gptch > 0.5 ? hvPenv : 0;               // Pitch off: no envelope, no glide, no grain spread\nhvGlide = gptch > 0.5 ? hvGlide : 0;\nhvGspread = gptch > 0.5 ? hvGspread : 0;\nhvRev = grev > 0.5 ? hvRev : 0;                 // Allow Rev off: every hit plays forward              // Allow P.Env off: hits start at their pitch, no swoop\nrsT = hvRspace > 2.5 && gtrip < 0.5;\nhvRspace = rsT ? hvRspace - 3 : hvRspace;\n// global Length: + pulls Start to 0 and Length, Gate and release toward full; - shortens them\nlgk = clamp(glen / 100, -1, 1);\nlgp = max(lgk, 0);\nlgn = min(lgk, 0);\nhvStart = hvStart * (1 - lgp);\nhvLen = (hvLen + (1 - hvLen) * lgp) * (1 + lgn * 0.85);\nhvGate = (hvGate + (1 - hvGate) * lgp) * (1 + lgn * 0.85);\nhvDec = hvDec * (1 + lgp * 3) * (1 + lgn * 0.75);\n\n// ---- per-hit filter type (Type Var): seeded per hit, so Lock replays it exactly ----\nftvA = peek(pa, pb0 + 60, 0);\nftvB = peek(pb, pb0 + 60, 0);\nftv = clamp(mix(ftvA, ftvB, sl) * mkfull, 0, 1);   // stored 0..1, faded by Macro\nftu = hash(hseed, 17.3 + hk);\nftsel = hash(hseed, 23.9 + hk);\nftc = hash(hseed, 31.7 + hk);\nftr = 2;\nftr = ftsel < 0.85 ? 1 : ftr;\nftr = ftsel < 0.7 ? 0 : ftr;\ntcut = 3000 * pow(6.6667, ftc);\ntcut = ftr > 0.5 ? 40 * pow(37.5, ftc) : tcut;\ntcut = ftr > 1.5 ? 500 * pow(8, ftc) : tcut;\nftvary = ftu < ftv;\nhvCut = ftvary ? tcut : hvCut;\nhvFtype = ftvary ? ftr : hvFtype;\n\n// ---- Macro on sound-character menus: per-hit coin (seeded, so Lock replays it) ----\nmcE = hash(hseed, 71.3 + hk);\nhvEngine = mcE < mkone ? hvEngine : 0;\nmcF = hash(hseed, 77.9 + hk);\nkeepF = mcF < mkone || ftvary;\nhvFtype = keepF ? hvFtype : 0;\n// cutoff blends toward the clean value of the type this hit uses: LP open, HP closed, BP as set\nncur = pow(clamp((hvCut - 20) / 19980, 0, 1), 0.3333333);\nncl = hvFtype > 0.5 ? 0 : 1;\nncl2 = hvFtype > 1.5 ? ncur : ncl;\nnnew = clamp(ncl2 + (ncur - ncl2) * mkrisk, 0, 1);   // cutoff overshoot capped like the risky knobs\nmcut = 20 + 19980 * pow(nnew, 3);\nhvCut = ftvary ? hvCut : mcut;\n\n// ---- pitch: file pitch + per-hit offset quantized to the scale ----\n// repeat steps use the scale tables: note -> degree, then degree + steps -> note\npq = quant(pitchoff, mask, hit > 0);\nscb = clamp(floor(gscale + 0.5), 0, 11) * 512;\nqdeg = peek(sc, scb + clamp(pq, -48, 48) + 48, 0);\nrsteps = hit == 3 ? hk * rstepv : 0;\nrq = peek(sc, scb + 100 + clamp(qdeg + rsteps, -200, 200) + 200, 0);\n\n// ---- 2. slice ----\nfph = (hgrid - floor(hgrid / flen) * flen) / flen;\nrnew = hit == 3 && hash(rseed, hk * 7.13) >= rsame;\ncprev = hit == 1 ? lastslice : rslice;\ncu1 = hit == 1 ? u8 : hash(rseed, hk * 3.1);\ncu2 = hit == 1 ? u2 : hash(rseed, hk * 5.7);\ncsel = choose(st, sb, (hit == 1 || rnew) ? ns : 0, hvSmode, hvSpread, hvWstr, cprev, cu1, cu2, fph);\nif (hit == 1 || rnew) { hslice = csel; }\nelse if (hit == 3) { hslice = rslice; }\nhen = peek(st, sb + max(0, hslice), 3);\nbadslice = hit > 0 && hslice >= 0 && (hslice >= ns || hen < 0.5);\nfsel = choose(st, sb, badslice ? ns : 0, 1, 0, 1, hslice, hash(hseed, 9.1), 0.5, fph);\nif (badslice) { hslice = fsel; }\n\n// ---- global density below 0: free hits may become rests (the rhythm keeps its timing) ----\nrestp = clamp(0 - gdensity / 100, 0, 1) * 0.85;\nisrest = hit == 1 && hash(hseed, 61.7) < restp;\nhslice = isrest ? -1 : hslice;\n\n// ---- 3. free hits go into the rolling memory ----\nra = (mb + (wc % 512)) * 43;\nnrec = hit == 1 ? 38 : 0;\nfor (c = 0; c < nrec; c += 1) {\n\tov = peek(O, c, 0);\n\tpoke(mem, ov, ra + 2 + c, 0);\n}\nif (hit == 1) {\n\tpoke(mem, hgrid, ra, 0);\n\tpoke(mem, hslice + 1, ra + 1, 0);\n\tpoke(mem, hurep, ra + 40, 0);\n\tpoke(mem, hseed, ra + 41, 0);\n\tpoke(mem, lastlen, ra + 42, 0);\n\twc += 1;\n}\n\n// ---- 4. primary hits schedule repeats ----\nprim = hit == 1 || hit == 2;\nncp = prim ? 38 : 0;\nfor (c = 0; c < ncp; c += 1) {\n\tov = peek(O, c, 0);\n\tpoke(OP, ov, c, 0);\n}\nrcnt = clamp(floor(hvRcount + 0.5), 1, 16);\nif (prim) {\n\trn = 0;\n\tri = 0;\n\trslice = hslice;\n\trseed = hseed;\n\trsame = hvRsame;\n\trvary = hvRvar;\n\trstepv = floor(hvRstep + 0.5);\n\trfade = hvRfade;\n\trtotal = rcnt;\n}\ndorep = prim && hurep < hvRchance && hslice >= 0;\nspc = 0.0208333;\nspc = hvRspace < 3.5 ? 0.0416667 : spc;\nspc = hvRspace < 2.5 ? 0.015625 : spc;\nspc = hvRspace < 1.5 ? 0.03125 : spc;\nspc = hvRspace < 0.5 ? 0.0625 : spc;\nnrp = dorep ? rcnt : 0;\nrtri = qtr && abs(log2(spc * 3) - floor(log2(spc * 3) + 0.5)) < 0.01;   // triplet repeat spacing\ntt = pos;\npoke(SC, pos, 3, 0);\npoke(SC, pos, 7, 0);\nfor (k = 0; k < nrp; k += 1) {\n\trpr = peek(SC, 3, 0);\n\trqp = peek(SC, 7, 0);\n\ttt1 = rpr + spc * pow(2, 0 - hvRshape * k / max(1, rcnt - 1));\n\trqs = floor(tt1 / qge + 0.5) * qge;\n\trqt = floor(tt1 / (qge * 2 / 3) + 0.5) * (qge * 2 / 3);\n\trqn = rtri ? rqt : rqs;\n\trna = (floor(rqp / qge + 0.000001) + 1) * qge;\n\trnb = (floor(rqp / (qge * 2 / 3) + 0.000001) + 1) * (qge * 2 / 3);\n\trnx = rtri ? rnb : rna;\n\trqg = max(rqn, rnx);\n\tr16 = rqg * 16;\n\trk16 = floor(r16 + 0.5);\n\trsw = qge > 0.02 && abs(r16 - rk16) < 0.0001 && (rk16 % 2) == 1;   // odd 16ths follow Swing like the main hits\n\tpoke(RP, mix(tt1, rqg + rsw * hvSwing / 4800, qa), k, 0);\n\tpoke(SC, tt1, 3, 0);\n\tpoke(SC, rqg, 7, 0);\n}\nif (dorep) { rn = rcnt; }\n\n// ---- 5. start a voice: shared values ----\nstartv = hit > 0 && hslice >= 0;\nhgain = hit == 3 ? clamp(1 + rfade * hk / rtotal, 0, 2) : 1;\ns0 = peek(st, sb + max(0, hslice), 0);\ns1 = peek(st, sb + max(0, hslice), 1);\nslg = peek(st, sb + max(0, hslice), 5);          // Even: gain that brings this slice to the common loudness\nslg = slg > 0 ? slg : 1;\nra0 = s0 + hvStart * (s1 - s0);\n// Quant: move the start to the nearest attack in the slice (the slice start counts as one).\n// The brain stores up to 8 attack positions per slice in st channels 6..13; unused ones equal the slice start.\nsa1 = peek(st, sb + max(0, hslice), 6);\nsa2 = peek(st, sb + max(0, hslice), 7);\nsa3 = peek(st, sb + max(0, hslice), 8);\nsa4 = peek(st, sb + max(0, hslice), 9);\nsa5 = peek(st, sb + max(0, hslice), 10);\nsa6 = peek(st, sb + max(0, hslice), 11);\nsa7 = peek(st, sb + max(0, hslice), 12);\nsa8 = peek(st, sb + max(0, hslice), 13);\nsab = s0;\nsad = abs(s0 - ra0);\nsac = (sa1 > s0 && sa1 < s1) ? abs(sa1 - ra0) : 1000000000;\nsab = sac < sad ? sa1 : sab;\nsad = min(sad, sac);\nsac = (sa2 > s0 && sa2 < s1) ? abs(sa2 - ra0) : 1000000000;\nsab = sac < sad ? sa2 : sab;\nsad = min(sad, sac);\nsac = (sa3 > s0 && sa3 < s1) ? abs(sa3 - ra0) : 1000000000;\nsab = sac < sad ? sa3 : sab;\nsad = min(sad, sac);\nsac = (sa4 > s0 && sa4 < s1) ? abs(sa4 - ra0) : 1000000000;\nsab = sac < sad ? sa4 : sab;\nsad = min(sad, sac);\nsac = (sa5 > s0 && sa5 < s1) ? abs(sa5 - ra0) : 1000000000;\nsab = sac < sad ? sa5 : sab;\nsad = min(sad, sac);\nsac = (sa6 > s0 && sa6 < s1) ? abs(sa6 - ra0) : 1000000000;\nsab = sac < sad ? sa6 : sab;\nsad = min(sad, sac);\nsac = (sa7 > s0 && sa7 < s1) ? abs(sa7 - ra0) : 1000000000;\nsab = sac < sad ? sa7 : sab;\nsad = min(sad, sac);\nsac = (sa8 > s0 && sa8 < s1) ? abs(sa8 - ra0) : 1000000000;\nsab = sac < sad ? sa8 : sab;\nsad = min(sad, sac);\nra0 = sad <= qa * (s1 - s0) ? sab : ra0;               // 100%: always; lower: only attacks close by\nrb0 = min(s1, ra0 + max(64, hvLen * (s1 - ra0)));\nndr = hash(hseed, 1.37 + hk) < hvRev ? -1 : 1;\nsemis = gpitch + (gptch > 0.5 ? pfile + rq : 0);   // the global Pitch dial always applies\nspd = hvEngine > 0.5 ? hvScan : pow(2, semis / 12);\ndurs = (rb0 - ra0) / max(0.0001, spd * bsrr);\nngl = clamp(hvGate * durs, 128, sr * 60);\nnat = max(0.003 * sr, hvAtt * sr / 1000);           // at least 3 ms: no tick when a hit starts mid-waveform\nnat = mix(nat, min(nat, 0.015 * sr), qa);           // Quant: slow fade-ins shortened, 100% = at most 15 ms\nndc = max(0.003 * sr, hvDec * sr / 1000);\nk2 = (nat + ndc > ngl) ? ngl / (nat + ndc) : 1;\nnat = max(0.0015 * sr, nat * k2);\nndc = max(0.0015 * sr, ndc * k2);\nth = (hvPan + 1) * pi * 0.25;\nnla = 0;\nnlb = 0;\nll = max(256, hvLoop * (rb0 - ra0));\nif (hvLoop > 0) {\n\tif (ndr > 0) { nla = ra0; nlb = min(rb0, ra0 + ll); }\n\telse { nlb = rb0; nla = max(ra0, rb0 - ll); }\n}\nchA = peek(pa, pb0 + 61, 0);\nchB = peek(pb, pb0 + 61, 0);\nchu = hash(hseed, 41.3 + hk);\nchp = clamp(1 + (mix(chA, chB, sl) - 1) * mkfull, 0, 1);   // Macro fades toward always-choke\nchk = chu < chp;                       // Choke: chance this hit cuts the previous one\nngd = clamp(floor(hvGdens + 0.5), 1, 4);\nnpos0 = ndr > 0 ? ra0 : rb0 - 1;\nngain = dbtoa(hvVol) * hgain * mix(1, slg, clamp(geven / 100, 0, 1));\nnpl = cos(th) * sqrt(2);\nnpr = sin(th) * sqrt(2);\nnpd = max(1, hvPdec * sr / 1000);\nngt = hvGlide * sr / 1000;\nnfd = max(1, hvFdec * sr / 1000);\nngsz = max(64, hvGsize * sr / 1000);\nnseed = hseed + hk * 0.71;\n\n// ---- 5b. voice allocation (unrolled) ----\nnv = -1;\noldest = -1;\noage = -1;\nactives = 0;\nbusy0 = v0_act > 0.5 && v0_kill < 0.5;\nkill0 = startv && busy0 && chk;\ncand0 = startv && busy0 && chk == 0;\nactives += cand0;\nolder0 = cand0 && v0_age > oage;\noage = older0 ? v0_age : oage;\noldest = older0 ? 0 : oldest;\nfree0 = startv && v0_act < 0.5 && nv < 0;\nnv = free0 ? 0 : nv;\nv0_kill = kill0 ? 1 : v0_kill;\nv0_ddir = kill0 ? -1 : v0_ddir;\nbusy1 = v1_act > 0.5 && v1_kill < 0.5;\nkill1 = startv && busy1 && chk;\ncand1 = startv && busy1 && chk == 0;\nactives += cand1;\nolder1 = cand1 && v1_age > oage;\noage = older1 ? v1_age : oage;\noldest = older1 ? 1 : oldest;\nfree1 = startv && v1_act < 0.5 && nv < 0;\nnv = free1 ? 1 : nv;\nv1_kill = kill1 ? 1 : v1_kill;\nv1_ddir = kill1 ? -1 : v1_ddir;\nbusy2 = v2_act > 0.5 && v2_kill < 0.5;\nkill2 = startv && busy2 && chk;\ncand2 = startv && busy2 && chk == 0;\nactives += cand2;\nolder2 = cand2 && v2_age > oage;\noage = older2 ? v2_age : oage;\noldest = older2 ? 2 : oldest;\nfree2 = startv && v2_act < 0.5 && nv < 0;\nnv = free2 ? 2 : nv;\nv2_kill = kill2 ? 1 : v2_kill;\nv2_ddir = kill2 ? -1 : v2_ddir;\nbusy3 = v3_act > 0.5 && v3_kill < 0.5;\nkill3 = startv && busy3 && chk;\ncand3 = startv && busy3 && chk == 0;\nactives += cand3;\nolder3 = cand3 && v3_age > oage;\noage = older3 ? v3_age : oage;\noldest = older3 ? 3 : oldest;\nfree3 = startv && v3_act < 0.5 && nv < 0;\nnv = free3 ? 3 : nv;\nv3_kill = kill3 ? 1 : v3_kill;\nv3_ddir = kill3 ? -1 : v3_ddir;\nbusy4 = v4_act > 0.5 && v4_kill < 0.5;\nkill4 = startv && busy4 && chk;\ncand4 = startv && busy4 && chk == 0;\nactives += cand4;\nolder4 = cand4 && v4_age > oage;\noage = older4 ? v4_age : oage;\noldest = older4 ? 4 : oldest;\nfree4 = startv && v4_act < 0.5 && nv < 0;\nnv = free4 ? 4 : nv;\nv4_kill = kill4 ? 1 : v4_kill;\nv4_ddir = kill4 ? -1 : v4_ddir;\nbusy5 = v5_act > 0.5 && v5_kill < 0.5;\nkill5 = startv && busy5 && chk;\ncand5 = startv && busy5 && chk == 0;\nactives += cand5;\nolder5 = cand5 && v5_age > oage;\noage = older5 ? v5_age : oage;\noldest = older5 ? 5 : oldest;\nfree5 = startv && v5_act < 0.5 && nv < 0;\nnv = free5 ? 5 : nv;\nv5_kill = kill5 ? 1 : v5_kill;\nv5_ddir = kill5 ? -1 : v5_ddir;\nsteal0 = startv && chk == 0 && actives >= 4 && oldest == 0;\nv0_kill = steal0 ? 1 : v0_kill;\nv0_ddir = steal0 ? -1 : v0_ddir;\nsteal1 = startv && chk == 0 && actives >= 4 && oldest == 1;\nv1_kill = steal1 ? 1 : v1_kill;\nv1_ddir = steal1 ? -1 : v1_ddir;\nsteal2 = startv && chk == 0 && actives >= 4 && oldest == 2;\nv2_kill = steal2 ? 1 : v2_kill;\nv2_ddir = steal2 ? -1 : v2_ddir;\nsteal3 = startv && chk == 0 && actives >= 4 && oldest == 3;\nv3_kill = steal3 ? 1 : v3_kill;\nv3_ddir = steal3 ? -1 : v3_ddir;\nsteal4 = startv && chk == 0 && actives >= 4 && oldest == 4;\nv4_kill = steal4 ? 1 : v4_kill;\nv4_ddir = steal4 ? -1 : v4_ddir;\nsteal5 = startv && chk == 0 && actives >= 4 && oldest == 5;\nv5_kill = steal5 ? 1 : v5_kill;\nv5_ddir = steal5 ? -1 : v5_ddir;\nqd = 2;\nqv = -1;\nkq0 = v0_act > 0.5 && v0_kill > 0.5 && v0_duck < qd;\nqd = kq0 ? v0_duck : qd;\nqv = kq0 ? 0 : qv;\nkq1 = v1_act > 0.5 && v1_kill > 0.5 && v1_duck < qd;\nqd = kq1 ? v1_duck : qd;\nqv = kq1 ? 1 : qv;\nkq2 = v2_act > 0.5 && v2_kill > 0.5 && v2_duck < qd;\nqd = kq2 ? v2_duck : qd;\nqv = kq2 ? 2 : qv;\nkq3 = v3_act > 0.5 && v3_kill > 0.5 && v3_duck < qd;\nqd = kq3 ? v3_duck : qd;\nqv = kq3 ? 3 : qv;\nkq4 = v4_act > 0.5 && v4_kill > 0.5 && v4_duck < qd;\nqd = kq4 ? v4_duck : qd;\nqv = kq4 ? 4 : qv;\nkq5 = v5_act > 0.5 && v5_kill > 0.5 && v5_duck < qd;\nqd = kq5 ? v5_duck : qd;\nqv = kq5 ? 5 : qv;\nnvf1 = oldest >= 0 ? oldest : 0;\nnvf = qv >= 0 ? qv : nvf1;\nnv = (startv && nv < 0) ? nvf : nv;\ngo0 = startv && nv == 0;\nv0_act = go0 ? 1 : v0_act;\nv0_pos = go0 ? npos0 : v0_pos;\nv0_a = go0 ? ra0 : v0_a;\nv0_b = go0 ? rb0 : v0_b;\nv0_dir = go0 ? ndr : v0_dir;\nv0_age = go0 ? 0 : v0_age;\nv0_gl = go0 ? ngl : v0_gl;\nv0_at = go0 ? nat : v0_at;\nv0_dc = go0 ? ndc : v0_dc;\nv0_gain = go0 ? ngain : v0_gain;\nv0_pl = go0 ? npl : v0_pl;\nv0_pr = go0 ? npr : v0_pr;\nv0_wid = go0 ? hvWidth : v0_wid;\nv0_semi = go0 ? semis : v0_semi;\nv0_pe = go0 ? hvPenv : v0_pe;\nv0_pd = go0 ? npd : v0_pd;\nv0_gfrom = go0 ? lastsemis : v0_gfrom;\nv0_gt = go0 ? ngt : v0_gt;\nv0_cut = go0 ? hvCut : v0_cut;\nv0_res = go0 ? hvRes : v0_res;\nv0_fe = go0 ? hvFenv : v0_fe;\nv0_fd = go0 ? nfd : v0_fd;\nv0_trk = go0 ? hvTrack : v0_trk;\nv0_ft = go0 ? hvFtype : v0_ft;\nv0_eng = go0 ? hvEngine : v0_eng;\nv0_la = go0 ? nla : v0_la;\nv0_lb = go0 ? nlb : v0_lb;\nv0_kill = go0 ? 0 : v0_kill;\nv0_duck = go0 ? 1 : v0_duck;\nv0_ddir = go0 ? 0 : v0_ddir;\nv0_pend = go0 ? -1 : v0_pend;\nv0_scan = go0 ? hvScan : v0_scan;\nv0_gsz = go0 ? ngsz : v0_gsz;\nv0_gd = go0 ? ngd : v0_gd;\nv0_gj = go0 ? hvGjit : v0_gj;\nv0_gsp = go0 ? hvGspread : v0_gsp;\nv0_s1l = go0 ? 0 : v0_s1l;\nv0_s2l = go0 ? 0 : v0_s2l;\nv0_s1r = go0 ? 0 : v0_s1r;\nv0_s2r = go0 ? 0 : v0_s2r;\nv0_slc = go0 ? hslice : v0_slc;\nv0_seed = go0 ? nseed : v0_seed;\nv0_jc = go0 ? hvJump : v0_jc;\nv0_stn = go0 ? hvStart : v0_stn;\nv0_lnn = go0 ? hvLen : v0_lnn;\nv0_lpn = go0 ? hvLoop : v0_lpn;\nv0_g0ph = go0 ? 0 / ngd : v0_g0ph;\nv0_g0al = go0 ? 0 : v0_g0al;\nv0_g1ph = go0 ? 1 / ngd : v0_g1ph;\nv0_g1al = go0 ? 0 : v0_g1al;\nv0_g2ph = go0 ? 2 / ngd : v0_g2ph;\nv0_g2al = go0 ? 0 : v0_g2al;\nv0_g3ph = go0 ? 3 / ngd : v0_g3ph;\nv0_g3al = go0 ? 0 : v0_g3al;\n\ngo1 = startv && nv == 1;\nv1_act = go1 ? 1 : v1_act;\nv1_pos = go1 ? npos0 : v1_pos;\nv1_a = go1 ? ra0 : v1_a;\nv1_b = go1 ? rb0 : v1_b;\nv1_dir = go1 ? ndr : v1_dir;\nv1_age = go1 ? 0 : v1_age;\nv1_gl = go1 ? ngl : v1_gl;\nv1_at = go1 ? nat : v1_at;\nv1_dc = go1 ? ndc : v1_dc;\nv1_gain = go1 ? ngain : v1_gain;\nv1_pl = go1 ? npl : v1_pl;\nv1_pr = go1 ? npr : v1_pr;\nv1_wid = go1 ? hvWidth : v1_wid;\nv1_semi = go1 ? semis : v1_semi;\nv1_pe = go1 ? hvPenv : v1_pe;\nv1_pd = go1 ? npd : v1_pd;\nv1_gfrom = go1 ? lastsemis : v1_gfrom;\nv1_gt = go1 ? ngt : v1_gt;\nv1_cut = go1 ? hvCut : v1_cut;\nv1_res = go1 ? hvRes : v1_res;\nv1_fe = go1 ? hvFenv : v1_fe;\nv1_fd = go1 ? nfd : v1_fd;\nv1_trk = go1 ? hvTrack : v1_trk;\nv1_ft = go1 ? hvFtype : v1_ft;\nv1_eng = go1 ? hvEngine : v1_eng;\nv1_la = go1 ? nla : v1_la;\nv1_lb = go1 ? nlb : v1_lb;\nv1_kill = go1 ? 0 : v1_kill;\nv1_duck = go1 ? 1 : v1_duck;\nv1_ddir = go1 ? 0 : v1_ddir;\nv1_pend = go1 ? -1 : v1_pend;\nv1_scan = go1 ? hvScan : v1_scan;\nv1_gsz = go1 ? ngsz : v1_gsz;\nv1_gd = go1 ? ngd : v1_gd;\nv1_gj = go1 ? hvGjit : v1_gj;\nv1_gsp = go1 ? hvGspread : v1_gsp;\nv1_s1l = go1 ? 0 : v1_s1l;\nv1_s2l = go1 ? 0 : v1_s2l;\nv1_s1r = go1 ? 0 : v1_s1r;\nv1_s2r = go1 ? 0 : v1_s2r;\nv1_slc = go1 ? hslice : v1_slc;\nv1_seed = go1 ? nseed : v1_seed;\nv1_jc = go1 ? hvJump : v1_jc;\nv1_stn = go1 ? hvStart : v1_stn;\nv1_lnn = go1 ? hvLen : v1_lnn;\nv1_lpn = go1 ? hvLoop : v1_lpn;\nv1_g0ph = go1 ? 0 / ngd : v1_g0ph;\nv1_g0al = go1 ? 0 : v1_g0al;\nv1_g1ph = go1 ? 1 / ngd : v1_g1ph;\nv1_g1al = go1 ? 0 : v1_g1al;\nv1_g2ph = go1 ? 2 / ngd : v1_g2ph;\nv1_g2al = go1 ? 0 : v1_g2al;\nv1_g3ph = go1 ? 3 / ngd : v1_g3ph;\nv1_g3al = go1 ? 0 : v1_g3al;\n\ngo2 = startv && nv == 2;\nv2_act = go2 ? 1 : v2_act;\nv2_pos = go2 ? npos0 : v2_pos;\nv2_a = go2 ? ra0 : v2_a;\nv2_b = go2 ? rb0 : v2_b;\nv2_dir = go2 ? ndr : v2_dir;\nv2_age = go2 ? 0 : v2_age;\nv2_gl = go2 ? ngl : v2_gl;\nv2_at = go2 ? nat : v2_at;\nv2_dc = go2 ? ndc : v2_dc;\nv2_gain = go2 ? ngain : v2_gain;\nv2_pl = go2 ? npl : v2_pl;\nv2_pr = go2 ? npr : v2_pr;\nv2_wid = go2 ? hvWidth : v2_wid;\nv2_semi = go2 ? semis : v2_semi;\nv2_pe = go2 ? hvPenv : v2_pe;\nv2_pd = go2 ? npd : v2_pd;\nv2_gfrom = go2 ? lastsemis : v2_gfrom;\nv2_gt = go2 ? ngt : v2_gt;\nv2_cut = go2 ? hvCut : v2_cut;\nv2_res = go2 ? hvRes : v2_res;\nv2_fe = go2 ? hvFenv : v2_fe;\nv2_fd = go2 ? nfd : v2_fd;\nv2_trk = go2 ? hvTrack : v2_trk;\nv2_ft = go2 ? hvFtype : v2_ft;\nv2_eng = go2 ? hvEngine : v2_eng;\nv2_la = go2 ? nla : v2_la;\nv2_lb = go2 ? nlb : v2_lb;\nv2_kill = go2 ? 0 : v2_kill;\nv2_duck = go2 ? 1 : v2_duck;\nv2_ddir = go2 ? 0 : v2_ddir;\nv2_pend = go2 ? -1 : v2_pend;\nv2_scan = go2 ? hvScan : v2_scan;\nv2_gsz = go2 ? ngsz : v2_gsz;\nv2_gd = go2 ? ngd : v2_gd;\nv2_gj = go2 ? hvGjit : v2_gj;\nv2_gsp = go2 ? hvGspread : v2_gsp;\nv2_s1l = go2 ? 0 : v2_s1l;\nv2_s2l = go2 ? 0 : v2_s2l;\nv2_s1r = go2 ? 0 : v2_s1r;\nv2_s2r = go2 ? 0 : v2_s2r;\nv2_slc = go2 ? hslice : v2_slc;\nv2_seed = go2 ? nseed : v2_seed;\nv2_jc = go2 ? hvJump : v2_jc;\nv2_stn = go2 ? hvStart : v2_stn;\nv2_lnn = go2 ? hvLen : v2_lnn;\nv2_lpn = go2 ? hvLoop : v2_lpn;\nv2_g0ph = go2 ? 0 / ngd : v2_g0ph;\nv2_g0al = go2 ? 0 : v2_g0al;\nv2_g1ph = go2 ? 1 / ngd : v2_g1ph;\nv2_g1al = go2 ? 0 : v2_g1al;\nv2_g2ph = go2 ? 2 / ngd : v2_g2ph;\nv2_g2al = go2 ? 0 : v2_g2al;\nv2_g3ph = go2 ? 3 / ngd : v2_g3ph;\nv2_g3al = go2 ? 0 : v2_g3al;\n\ngo3 = startv && nv == 3;\nv3_act = go3 ? 1 : v3_act;\nv3_pos = go3 ? npos0 : v3_pos;\nv3_a = go3 ? ra0 : v3_a;\nv3_b = go3 ? rb0 : v3_b;\nv3_dir = go3 ? ndr : v3_dir;\nv3_age = go3 ? 0 : v3_age;\nv3_gl = go3 ? ngl : v3_gl;\nv3_at = go3 ? nat : v3_at;\nv3_dc = go3 ? ndc : v3_dc;\nv3_gain = go3 ? ngain : v3_gain;\nv3_pl = go3 ? npl : v3_pl;\nv3_pr = go3 ? npr : v3_pr;\nv3_wid = go3 ? hvWidth : v3_wid;\nv3_semi = go3 ? semis : v3_semi;\nv3_pe = go3 ? hvPenv : v3_pe;\nv3_pd = go3 ? npd : v3_pd;\nv3_gfrom = go3 ? lastsemis : v3_gfrom;\nv3_gt = go3 ? ngt : v3_gt;\nv3_cut = go3 ? hvCut : v3_cut;\nv3_res = go3 ? hvRes : v3_res;\nv3_fe = go3 ? hvFenv : v3_fe;\nv3_fd = go3 ? nfd : v3_fd;\nv3_trk = go3 ? hvTrack : v3_trk;\nv3_ft = go3 ? hvFtype : v3_ft;\nv3_eng = go3 ? hvEngine : v3_eng;\nv3_la = go3 ? nla : v3_la;\nv3_lb = go3 ? nlb : v3_lb;\nv3_kill = go3 ? 0 : v3_kill;\nv3_duck = go3 ? 1 : v3_duck;\nv3_ddir = go3 ? 0 : v3_ddir;\nv3_pend = go3 ? -1 : v3_pend;\nv3_scan = go3 ? hvScan : v3_scan;\nv3_gsz = go3 ? ngsz : v3_gsz;\nv3_gd = go3 ? ngd : v3_gd;\nv3_gj = go3 ? hvGjit : v3_gj;\nv3_gsp = go3 ? hvGspread : v3_gsp;\nv3_s1l = go3 ? 0 : v3_s1l;\nv3_s2l = go3 ? 0 : v3_s2l;\nv3_s1r = go3 ? 0 : v3_s1r;\nv3_s2r = go3 ? 0 : v3_s2r;\nv3_slc = go3 ? hslice : v3_slc;\nv3_seed = go3 ? nseed : v3_seed;\nv3_jc = go3 ? hvJump : v3_jc;\nv3_stn = go3 ? hvStart : v3_stn;\nv3_lnn = go3 ? hvLen : v3_lnn;\nv3_lpn = go3 ? hvLoop : v3_lpn;\nv3_g0ph = go3 ? 0 / ngd : v3_g0ph;\nv3_g0al = go3 ? 0 : v3_g0al;\nv3_g1ph = go3 ? 1 / ngd : v3_g1ph;\nv3_g1al = go3 ? 0 : v3_g1al;\nv3_g2ph = go3 ? 2 / ngd : v3_g2ph;\nv3_g2al = go3 ? 0 : v3_g2al;\nv3_g3ph = go3 ? 3 / ngd : v3_g3ph;\nv3_g3al = go3 ? 0 : v3_g3al;\n\ngo4 = startv && nv == 4;\nv4_act = go4 ? 1 : v4_act;\nv4_pos = go4 ? npos0 : v4_pos;\nv4_a = go4 ? ra0 : v4_a;\nv4_b = go4 ? rb0 : v4_b;\nv4_dir = go4 ? ndr : v4_dir;\nv4_age = go4 ? 0 : v4_age;\nv4_gl = go4 ? ngl : v4_gl;\nv4_at = go4 ? nat : v4_at;\nv4_dc = go4 ? ndc : v4_dc;\nv4_gain = go4 ? ngain : v4_gain;\nv4_pl = go4 ? npl : v4_pl;\nv4_pr = go4 ? npr : v4_pr;\nv4_wid = go4 ? hvWidth : v4_wid;\nv4_semi = go4 ? semis : v4_semi;\nv4_pe = go4 ? hvPenv : v4_pe;\nv4_pd = go4 ? npd : v4_pd;\nv4_gfrom = go4 ? lastsemis : v4_gfrom;\nv4_gt = go4 ? ngt : v4_gt;\nv4_cut = go4 ? hvCut : v4_cut;\nv4_res = go4 ? hvRes : v4_res;\nv4_fe = go4 ? hvFenv : v4_fe;\nv4_fd = go4 ? nfd : v4_fd;\nv4_trk = go4 ? hvTrack : v4_trk;\nv4_ft = go4 ? hvFtype : v4_ft;\nv4_eng = go4 ? hvEngine : v4_eng;\nv4_la = go4 ? nla : v4_la;\nv4_lb = go4 ? nlb : v4_lb;\nv4_kill = go4 ? 0 : v4_kill;\nv4_duck = go4 ? 1 : v4_duck;\nv4_ddir = go4 ? 0 : v4_ddir;\nv4_pend = go4 ? -1 : v4_pend;\nv4_scan = go4 ? hvScan : v4_scan;\nv4_gsz = go4 ? ngsz : v4_gsz;\nv4_gd = go4 ? ngd : v4_gd;\nv4_gj = go4 ? hvGjit : v4_gj;\nv4_gsp = go4 ? hvGspread : v4_gsp;\nv4_s1l = go4 ? 0 : v4_s1l;\nv4_s2l = go4 ? 0 : v4_s2l;\nv4_s1r = go4 ? 0 : v4_s1r;\nv4_s2r = go4 ? 0 : v4_s2r;\nv4_slc = go4 ? hslice : v4_slc;\nv4_seed = go4 ? nseed : v4_seed;\nv4_jc = go4 ? hvJump : v4_jc;\nv4_stn = go4 ? hvStart : v4_stn;\nv4_lnn = go4 ? hvLen : v4_lnn;\nv4_lpn = go4 ? hvLoop : v4_lpn;\nv4_g0ph = go4 ? 0 / ngd : v4_g0ph;\nv4_g0al = go4 ? 0 : v4_g0al;\nv4_g1ph = go4 ? 1 / ngd : v4_g1ph;\nv4_g1al = go4 ? 0 : v4_g1al;\nv4_g2ph = go4 ? 2 / ngd : v4_g2ph;\nv4_g2al = go4 ? 0 : v4_g2al;\nv4_g3ph = go4 ? 3 / ngd : v4_g3ph;\nv4_g3al = go4 ? 0 : v4_g3al;\n\ngo5 = startv && nv == 5;\nv5_act = go5 ? 1 : v5_act;\nv5_pos = go5 ? npos0 : v5_pos;\nv5_a = go5 ? ra0 : v5_a;\nv5_b = go5 ? rb0 : v5_b;\nv5_dir = go5 ? ndr : v5_dir;\nv5_age = go5 ? 0 : v5_age;\nv5_gl = go5 ? ngl : v5_gl;\nv5_at = go5 ? nat : v5_at;\nv5_dc = go5 ? ndc : v5_dc;\nv5_gain = go5 ? ngain : v5_gain;\nv5_pl = go5 ? npl : v5_pl;\nv5_pr = go5 ? npr : v5_pr;\nv5_wid = go5 ? hvWidth : v5_wid;\nv5_semi = go5 ? semis : v5_semi;\nv5_pe = go5 ? hvPenv : v5_pe;\nv5_pd = go5 ? npd : v5_pd;\nv5_gfrom = go5 ? lastsemis : v5_gfrom;\nv5_gt = go5 ? ngt : v5_gt;\nv5_cut = go5 ? hvCut : v5_cut;\nv5_res = go5 ? hvRes : v5_res;\nv5_fe = go5 ? hvFenv : v5_fe;\nv5_fd = go5 ? nfd : v5_fd;\nv5_trk = go5 ? hvTrack : v5_trk;\nv5_ft = go5 ? hvFtype : v5_ft;\nv5_eng = go5 ? hvEngine : v5_eng;\nv5_la = go5 ? nla : v5_la;\nv5_lb = go5 ? nlb : v5_lb;\nv5_kill = go5 ? 0 : v5_kill;\nv5_duck = go5 ? 1 : v5_duck;\nv5_ddir = go5 ? 0 : v5_ddir;\nv5_pend = go5 ? -1 : v5_pend;\nv5_scan = go5 ? hvScan : v5_scan;\nv5_gsz = go5 ? ngsz : v5_gsz;\nv5_gd = go5 ? ngd : v5_gd;\nv5_gj = go5 ? hvGjit : v5_gj;\nv5_gsp = go5 ? hvGspread : v5_gsp;\nv5_s1l = go5 ? 0 : v5_s1l;\nv5_s2l = go5 ? 0 : v5_s2l;\nv5_s1r = go5 ? 0 : v5_s1r;\nv5_s2r = go5 ? 0 : v5_s2r;\nv5_slc = go5 ? hslice : v5_slc;\nv5_seed = go5 ? nseed : v5_seed;\nv5_jc = go5 ? hvJump : v5_jc;\nv5_stn = go5 ? hvStart : v5_stn;\nv5_lnn = go5 ? hvLen : v5_lnn;\nv5_lpn = go5 ? hvLoop : v5_lpn;\nv5_g0ph = go5 ? 0 / ngd : v5_g0ph;\nv5_g0al = go5 ? 0 : v5_g0al;\nv5_g1ph = go5 ? 1 / ngd : v5_g1ph;\nv5_g1al = go5 ? 0 : v5_g1al;\nv5_g2ph = go5 ? 2 / ngd : v5_g2ph;\nv5_g2al = go5 ? 0 : v5_g2al;\nv5_g3ph = go5 ? 3 / ngd : v5_g3ph;\nv5_g3al = go5 ? 0 : v5_g3al;\n\nif (startv) {\n\tlastslice = hslice;\n\tlastsemis = semis;\n}\n\n// ---- 6. free clock: choose the next wait ----\ndens = clamp(hvDens / 50 - 1 + gdensity / 100 * 3, -3, 3);   // global density pulls 3x as hard\ncont = hvCont / 100;\nanyv = (hvV1 > 0.5) + (hvV2 > 0.5) + (hvV4 > 0.5) + (hvV8 > 0.5) + (hvV16 > 0.5) + (hvV32 > 0.5);\nnw = hit == 1 ? 6 : 0;\ntot = 0;\nfor (i = 0; i < nw; i += 1) {\n\tvon = peek(HV, 38 + i, 0);\n\tdwv = peek(cf, cb + 5 + i, 0);\n\tonv = von > 0.5 || (anyv == 0 && i == 4);\n\tdw = hvDerived > 0.5 ? max(0.02, dwv) : 1;\n\tln0 = pow(0.5, i);\n\ttot += onv ? dw * wwait(ln0, dens, cont, lastlen) : 0;\n\ttot += (onv && hvTrip > 0.5) ? dw * wwait(ln0 * 2 / 3, dens, cont, lastlen) : 0;\n\ttot += (onv && hvDot > 0.5) ? dw * wwait(ln0 * 1.5, dens, cont, lastlen) : 0;\n}\nx = u3 * tot;\nacc = 0;\npick = 0.0625;\npicked = 0;\npoke(SC, 0, 4, 0);\npoke(SC, 0.0625, 5, 0);\npoke(SC, 0, 6, 0);\nfor (i = 0; i < nw; i += 1) {\n\tvon = peek(HV, 38 + i, 0);\n\tdwv = peek(cf, cb + 5 + i, 0);\n\tonv = von > 0.5 || (anyv == 0 && i == 4);\n\tdw = hvDerived > 0.5 ? max(0.02, dwv) : 1;\n\tln0 = pow(0.5, i);\n\tw0 = onv ? dw * wwait(ln0, dens, cont, lastlen) : 0;\n\tw1 = (onv && hvTrip > 0.5) ? dw * wwait(ln0 * 2 / 3, dens, cont, lastlen) : 0;\n\tw2 = (onv && hvDot > 0.5) ? dw * wwait(ln0 * 1.5, dens, cont, lastlen) : 0;\n\tacc1 = peek(SC, 4, 0);\n\tpk1 = peek(SC, 5, 0);\n\tpd1 = peek(SC, 6, 0);\n\tt0w = pd1 == 0 && w0 > 0;\n\tacc1 = t0w ? acc1 + w0 : acc1;\n\th0w = t0w && acc1 >= x;\n\tpk1 = h0w ? ln0 : pk1;\n\tpd1 = h0w ? 1 : pd1;\n\tt1w = pd1 == 0 && w1 > 0;\n\tacc1 = t1w ? acc1 + w1 : acc1;\n\th1w = t1w && acc1 >= x;\n\tpk1 = h1w ? ln0 * 2 / 3 : pk1;\n\tpd1 = h1w ? 1 : pd1;\n\tt2w = pd1 == 0 && w2 > 0;\n\tacc1 = t2w ? acc1 + w2 : acc1;\n\th2w = t2w && acc1 >= x;\n\tpk1 = h2w ? ln0 * 1.5 : pk1;\n\tpd1 = h2w ? 1 : pd1;\n\tpoke(SC, acc1, 4, 0);\n\tpoke(SC, pk1, 5, 0);\n\tpoke(SC, pd1, 6, 0);\n}\npick = peek(SC, 5, 0);\nif (hit == 1) {\n\tlastlen = pick;\n\tnextgrid = (floor(hgrid / pick + 0.000001) + 1) * pick;\n\tif (nextgrid <= pos) { nextgrid = (floor(pos / pick) + 1) * pick; }\n\tftraw = nextgrid + swingoff(nextgrid, hvSwing / 100) + hvNudge * 0.001 * wnps * sr;\n\tqs = floor(nextgrid / qgh + 0.5) * qgh;\n\tqt = floor(nextgrid / (qgh * 2 / 3) + 0.5) * (qgh * 2 / 3);\n\tqtri = qtr && abs(log2(pick * 3) - floor(log2(pick * 3) + 0.5)) < 0.01;   // this wait was a triplet\n\tqn = qtri ? qt : qs;\n\tqna = (floor(pos / qgh + 0.000001) + 1) * qgh;\n\tqnb = (floor(pos / (qgh * 2 / 3) + 0.000001) + 1) * (qgh * 2 / 3);\n\tqnx = qtri ? qnb : qna;\n\tqn = max(qn, qnx);                                  // never on or before this hit\n\tfiretime = mix(ftraw, qn + swingoff(qn, hvSwing / 100), qa);\n}\n\n// =====================================================================\n//  JUMP: on each tick of the finest note value, voices may jump\n// =====================================================================\nfin = 0.0625;\nfin = hvV1 > 0.5 ? 1 : fin;\nfin = hvV2 > 0.5 ? 0.5 : fin;\nfin = hvV4 > 0.5 ? 0.25 : fin;\nfin = hvV8 > 0.5 ? 0.125 : fin;\nfin = hvV16 > 0.5 ? 0.0625 : fin;\nfin = hvV32 > 0.5 ? 0.03125 : fin;\ntk = floor(pos / fin);\ntch = playing && ns > 0 && tk != jtick;\nif (playing) { jtick = tk; }\njsl = choose(st, sb, tch ? ns : 0, hvSmode, hvSpread, hvWstr, lastslice, hash(tk, 1.7), hash(tk, 2.3), 0.5);\njh0 = hash(v0_seed, tk * 0.913);\njgo0 = tch && v0_act > 0.5 && v0_age > 0.5 && v0_kill < 0.5 && v0_pend < 0 && v0_jc > 0 && jsl >= 0 && jsl != v0_slc && jh0 < v0_jc;\nv0_pend = jgo0 ? jsl : v0_pend;\nv0_ddir = jgo0 ? -1 : v0_ddir;\njh1 = hash(v1_seed, tk * 0.913);\njgo1 = tch && v1_act > 0.5 && v1_age > 0.5 && v1_kill < 0.5 && v1_pend < 0 && v1_jc > 0 && jsl >= 0 && jsl != v1_slc && jh1 < v1_jc;\nv1_pend = jgo1 ? jsl : v1_pend;\nv1_ddir = jgo1 ? -1 : v1_ddir;\njh2 = hash(v2_seed, tk * 0.913);\njgo2 = tch && v2_act > 0.5 && v2_age > 0.5 && v2_kill < 0.5 && v2_pend < 0 && v2_jc > 0 && jsl >= 0 && jsl != v2_slc && jh2 < v2_jc;\nv2_pend = jgo2 ? jsl : v2_pend;\nv2_ddir = jgo2 ? -1 : v2_ddir;\njh3 = hash(v3_seed, tk * 0.913);\njgo3 = tch && v3_act > 0.5 && v3_age > 0.5 && v3_kill < 0.5 && v3_pend < 0 && v3_jc > 0 && jsl >= 0 && jsl != v3_slc && jh3 < v3_jc;\nv3_pend = jgo3 ? jsl : v3_pend;\nv3_ddir = jgo3 ? -1 : v3_ddir;\njh4 = hash(v4_seed, tk * 0.913);\njgo4 = tch && v4_act > 0.5 && v4_age > 0.5 && v4_kill < 0.5 && v4_pend < 0 && v4_jc > 0 && jsl >= 0 && jsl != v4_slc && jh4 < v4_jc;\nv4_pend = jgo4 ? jsl : v4_pend;\nv4_ddir = jgo4 ? -1 : v4_ddir;\njh5 = hash(v5_seed, tk * 0.913);\njgo5 = tch && v5_act > 0.5 && v5_age > 0.5 && v5_kill < 0.5 && v5_pend < 0 && v5_jc > 0 && jsl >= 0 && jsl != v5_slc && jh5 < v5_jc;\nv5_pend = jgo5 ? jsl : v5_pend;\nv5_ddir = jgo5 ? -1 : v5_ddir;\n\n// =====================================================================\n//  VOICES (unrolled)\n// =====================================================================\noutl = 0;\noutr = 0;\ndk = 1 / (0.003 * sr);      // 3 ms duck for choke and jump\nef = 0.002 * sr;            // 2 ms declick at slice edges (scaled by playback speed per voice)\nnch = channels(w);\nnfr = dim(w);\n\n// ---------------- voice 0 ----------------\n// branchless inside: flags first, then every History assigned once\nif (v0_act > 0.5) {\n\tv0_age += 1;\n\tjn0 = peek(st, sb + max(0, v0_pend), 0);\n\tjn1 = peek(st, sb + max(0, v0_pend), 1);\n\n\t// duck: fade out to cut (choke) or to switch slice (jump)\n\tdku = v0_ddir > 0 ? v0_duck + dk : v0_duck;\n\tdkn = v0_ddir < 0 ? v0_duck - dk : dku;\n\tdended = v0_ddir < 0 && dkn <= 0;\n\tcutv = dended && v0_kill > 0.5;\n\tswv = dended && v0_kill < 0.5;\n\tdup = v0_ddir > 0 && dkn >= 1;\n\tv0_duck = clamp(dkn, 0, 1);\n\tddn = dup ? 0 : v0_ddir;\n\tv0_ddir = swv ? 1 : ddn;\n\n\t// jump: switch slice, keeping the relative position\n\tfr = clamp((v0_pos - v0_a) / max(1, v0_b - v0_a), 0, 1);\n\tna = jn0 + v0_stn * (jn1 - jn0);\n\tnb = min(jn1, na + max(64, v0_lnn * (jn1 - na)));\n\tnl = max(256, v0_lpn * (nb - na));\n\tnla2 = v0_dir > 0 ? na : max(na, nb - nl);\n\tnlb2 = v0_dir > 0 ? min(nb, na + nl) : nb;\n\tjp = na + fr * (nb - na);\n\tjpc = clamp(jp, nla2, nlb2);\n\tjpos = v0_lpn > 0 ? jpc : jp;\n\tswl = swv && v0_lpn > 0;\n\tv0_a = swv ? na : v0_a;\n\tv0_b = swv ? nb : v0_b;\n\tv0_la = swl ? nla2 : v0_la;\n\tv0_lb = swl ? nlb2 : v0_lb;\n\tv0_pos = swv ? jpos : v0_pos;\n\tv0_slc = swv ? v0_pend : v0_slc;\n\tv0_g0al = swv ? 0 : v0_g0al;\n\tv0_g1al = swv ? 0 : v0_g1al;\n\tv0_g2al = swv ? 0 : v0_g2al;\n\tv0_g3al = swv ? 0 : v0_g3al;\n\tv0_pend = swv ? -1 : v0_pend;\n\n\t// envelope: attack, then fade out ending at the gate\n\tenv = min(1, v0_age / v0_at);\n\tenv = min(env, clamp((v0_gl - v0_age) / v0_dc, 0, 1));\n\tgended = v0_age >= v0_gl;\n\n\t// pitch: target + pitch envelope + glide\n\tglw = exp(0 - v0_age / max(1, v0_gt));\n\tglk = v0_gt > 1 ? glw : 0;\n\tsm = v0_semi + v0_pe * exp(0 - v0_age / v0_pd) + (v0_gfrom - v0_semi) * glk;\n\tratio = pow(2, sm / 12);\n\n\t// tape read\n\ti0 = floor(v0_pos);\n\tf0 = v0_pos - i0;\n\tta0 = peek(w, i0, 0);\n\tta1 = peek(w, i0 + 1, 0);\n\ttb0 = peek(w, i0, 1);\n\ttb1 = peek(w, i0 + 1, 1);\n\ttl = mix(ta0, ta1, f0);\n\ttrr = mix(tb0, tb1, f0);\n\t// loop: crossfade into the other end over ~5 ms instead of dipping to silence\n\tlspan = v0_lb - v0_la;\n\tlxf = clamp(0.005 * sr * ratio * bsrr, 32, max(32, lspan * 0.4));\n\txzf = v0_dir > 0 ? (v0_pos - (v0_lb - lxf)) / lxf : ((v0_la + lxf) - v0_pos) / lxf;\n\txz = v0_lb > v0_la ? clamp(xzf, 0, 1) : 0;\n\tp2 = clamp(v0_dir > 0 ? v0_pos - lspan : v0_pos + lspan, 0, nfr - 2);\n\ti2 = floor(p2);\n\tf2 = p2 - i2;\n\ttc0 = peek(w, i2, 0);\n\ttc1 = peek(w, i2 + 1, 0);\n\ttd0 = peek(w, i2, 1);\n\ttd1 = peek(w, i2 + 1, 1);\n\ttl2 = mix(tc0, tc1, f2);\n\ttrr2 = mix(td0, td1, f2);\n\ttl = mix(tl, tl2, xz);\n\ttrr = mix(trr, trr2, xz);\n\ttr2 = nch > 1 ? trr : tl;\n\n\t// grain read (4 heads)\n\tgnorm = v0_gd < 1.5 ? 1 : 2 / v0_gd;\n\tgsl = 0;\n\tgsr = 0;\n\t// grain head 0\n\tgph = v0_g0ph + 1 / v0_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v0_g0al < 0.5) && 0 < v0_gd;\n\tsd = v0_seed + v0_age * 0.0137 + 0 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v0_gsp / 12);\n\tgspan = v0_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v0_dir > 0 ? v0_a : v0_a + gspan;\n\tghi = v0_dir > 0 ? v0_b - 1 - gspan : v0_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v0_pos + (hash(sd, 1.1) - 0.5) * 2 * v0_gj * v0_gsz, min(glo, gmid), max(ghi, gmid));\n\tv0_g0st = gspawn ? gnst : v0_g0st;\n\tv0_g0rt = gspawn ? gnrt : v0_g0rt;\n\tv0_g0al = gspawn ? 1 : v0_g0al;\n\tv0_g0ph = gph;\n\trp = v0_g0st + v0_dir * gph * v0_gsz * v0_g0rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v0_a, v0_b - 1 - rp) / 256, 0, 1);\n\tgwin = 0 < v0_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 1\n\tgph = v0_g1ph + 1 / v0_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v0_g1al < 0.5) && 1 < v0_gd;\n\tsd = v0_seed + v0_age * 0.0137 + 1 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v0_gsp / 12);\n\tgspan = v0_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v0_dir > 0 ? v0_a : v0_a + gspan;\n\tghi = v0_dir > 0 ? v0_b - 1 - gspan : v0_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v0_pos + (hash(sd, 1.1) - 0.5) * 2 * v0_gj * v0_gsz, min(glo, gmid), max(ghi, gmid));\n\tv0_g1st = gspawn ? gnst : v0_g1st;\n\tv0_g1rt = gspawn ? gnrt : v0_g1rt;\n\tv0_g1al = gspawn ? 1 : v0_g1al;\n\tv0_g1ph = gph;\n\trp = v0_g1st + v0_dir * gph * v0_gsz * v0_g1rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v0_a, v0_b - 1 - rp) / 256, 0, 1);\n\tgwin = 1 < v0_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 2\n\tgph = v0_g2ph + 1 / v0_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v0_g2al < 0.5) && 2 < v0_gd;\n\tsd = v0_seed + v0_age * 0.0137 + 2 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v0_gsp / 12);\n\tgspan = v0_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v0_dir > 0 ? v0_a : v0_a + gspan;\n\tghi = v0_dir > 0 ? v0_b - 1 - gspan : v0_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v0_pos + (hash(sd, 1.1) - 0.5) * 2 * v0_gj * v0_gsz, min(glo, gmid), max(ghi, gmid));\n\tv0_g2st = gspawn ? gnst : v0_g2st;\n\tv0_g2rt = gspawn ? gnrt : v0_g2rt;\n\tv0_g2al = gspawn ? 1 : v0_g2al;\n\tv0_g2ph = gph;\n\trp = v0_g2st + v0_dir * gph * v0_gsz * v0_g2rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v0_a, v0_b - 1 - rp) / 256, 0, 1);\n\tgwin = 2 < v0_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 3\n\tgph = v0_g3ph + 1 / v0_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v0_g3al < 0.5) && 3 < v0_gd;\n\tsd = v0_seed + v0_age * 0.0137 + 3 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v0_gsp / 12);\n\tgspan = v0_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v0_dir > 0 ? v0_a : v0_a + gspan;\n\tghi = v0_dir > 0 ? v0_b - 1 - gspan : v0_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v0_pos + (hash(sd, 1.1) - 0.5) * 2 * v0_gj * v0_gsz, min(glo, gmid), max(ghi, gmid));\n\tv0_g3st = gspawn ? gnst : v0_g3st;\n\tv0_g3rt = gspawn ? gnrt : v0_g3rt;\n\tv0_g3al = gspawn ? 1 : v0_g3al;\n\tv0_g3ph = gph;\n\trp = v0_g3st + v0_dir * gph * v0_gsz * v0_g3rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v0_a, v0_b - 1 - rp) / 256, 0, 1);\n\tgwin = 3 < v0_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\n\tisg = v0_eng > 0.5;\n\txl = isg ? gsl : tl;\n\txr = isg ? gsr : tr2;\n\tadv = isg ? v0_scan : ratio;\n\tv0_pos += adv * bsrr * v0_dir;\n\n\t// region, loop and edge declick\n\tlooping = v0_lb > v0_la;\n\tspan = v0_lb - v0_la;\n\twrapf = looping && v0_dir > 0 && v0_pos >= v0_lb;\n\twrapb = looping && v0_dir < 0 && v0_pos < v0_la;\n\tpwb = wrapb ? v0_pos + span : v0_pos;\n\tv0_pos = wrapf ? v0_pos - span : pwb;\n\toutr0 = looping == 0 && (v0_pos >= v0_b || v0_pos < v0_a);\n\tefv = max(16, ef * abs(adv) * bsrr);                // 2 ms of output, whatever the speed\n\tedgr = clamp(min(v0_pos - v0_a, v0_b - v0_pos) / efv, 0, 1);\n\tedo = outr0 ? 0 : edgr;\n\tedg = (looping || isg) ? 1 : edo;\n\n\t// filter: stereo TPT state variable\n\tfilt = v0_ft > 0.5 || v0_cut < 19000 || v0_fe != 0 || v0_trk != 0;\n\tfc = clamp(v0_cut * pow(2, v0_fe * 4 * exp(0 - v0_age / v0_fd) + v0_trk * sm / 12), 20, sr * 0.45);\n\tgg = tan(pi * fc / sr);\n\tkk = 2 - 1.96 * v0_res;\n\ta1 = 1 / (1 + gg * (gg + kk));\n\ta2 = gg * a1;\n\ta3 = gg * a2;\n\tv3 = xl - v0_s2l;\n\tv1 = a1 * v0_s1l + a2 * v3;\n\tv2 = v0_s2l + a2 * v0_s1l + a3 * v3;\n\thpl = xl - kk * v1 - v2;\n\tsell = v0_ft < 1.5 ? hpl : v1;\n\tfl = v0_ft < 0.5 ? v2 : sell;\n\tn1l = 2 * v1 - v0_s1l;\n\tn2l = 2 * v2 - v0_s2l;\n\tv3 = xr - v0_s2r;\n\tv1 = a1 * v0_s1r + a2 * v3;\n\tv2 = v0_s2r + a2 * v0_s1r + a3 * v3;\n\thpr = xr - kk * v1 - v2;\n\tselr = v0_ft < 1.5 ? hpr : v1;\n\tfrr = v0_ft < 0.5 ? v2 : selr;\n\tn1r = 2 * v1 - v0_s1r;\n\tn2r = 2 * v2 - v0_s2r;\n\tv0_s1l = filt ? n1l : v0_s1l;\n\tv0_s2l = filt ? n2l : v0_s2l;\n\tv0_s1r = filt ? n1r : v0_s1r;\n\tv0_s2r = filt ? n2r : v0_s2r;\n\txl = filt ? fl : xl;\n\txr = filt ? frr : xr;\n\n\t// width, pan, gain\n\tmid = (xl + xr) * 0.5;\n\tsid = (xl - xr) * 0.5 * v0_wid;\n\tenvo = gended ? 0 : env;\n\tamp = envo * edg * v0_duck * v0_gain;\n\toutl += (mid + sid) * amp * v0_pl;\n\toutr += (mid - sid) * amp * v0_pr;\n\tv0_act = (cutv || gended || outr0) ? 0 : v0_act;\n}\n\n// ---------------- voice 1 ----------------\n// branchless inside: flags first, then every History assigned once\nif (v1_act > 0.5) {\n\tv1_age += 1;\n\tjn0 = peek(st, sb + max(0, v1_pend), 0);\n\tjn1 = peek(st, sb + max(0, v1_pend), 1);\n\n\t// duck: fade out to cut (choke) or to switch slice (jump)\n\tdku = v1_ddir > 0 ? v1_duck + dk : v1_duck;\n\tdkn = v1_ddir < 0 ? v1_duck - dk : dku;\n\tdended = v1_ddir < 0 && dkn <= 0;\n\tcutv = dended && v1_kill > 0.5;\n\tswv = dended && v1_kill < 0.5;\n\tdup = v1_ddir > 0 && dkn >= 1;\n\tv1_duck = clamp(dkn, 0, 1);\n\tddn = dup ? 0 : v1_ddir;\n\tv1_ddir = swv ? 1 : ddn;\n\n\t// jump: switch slice, keeping the relative position\n\tfr = clamp((v1_pos - v1_a) / max(1, v1_b - v1_a), 0, 1);\n\tna = jn0 + v1_stn * (jn1 - jn0);\n\tnb = min(jn1, na + max(64, v1_lnn * (jn1 - na)));\n\tnl = max(256, v1_lpn * (nb - na));\n\tnla2 = v1_dir > 0 ? na : max(na, nb - nl);\n\tnlb2 = v1_dir > 0 ? min(nb, na + nl) : nb;\n\tjp = na + fr * (nb - na);\n\tjpc = clamp(jp, nla2, nlb2);\n\tjpos = v1_lpn > 0 ? jpc : jp;\n\tswl = swv && v1_lpn > 0;\n\tv1_a = swv ? na : v1_a;\n\tv1_b = swv ? nb : v1_b;\n\tv1_la = swl ? nla2 : v1_la;\n\tv1_lb = swl ? nlb2 : v1_lb;\n\tv1_pos = swv ? jpos : v1_pos;\n\tv1_slc = swv ? v1_pend : v1_slc;\n\tv1_g0al = swv ? 0 : v1_g0al;\n\tv1_g1al = swv ? 0 : v1_g1al;\n\tv1_g2al = swv ? 0 : v1_g2al;\n\tv1_g3al = swv ? 0 : v1_g3al;\n\tv1_pend = swv ? -1 : v1_pend;\n\n\t// envelope: attack, then fade out ending at the gate\n\tenv = min(1, v1_age / v1_at);\n\tenv = min(env, clamp((v1_gl - v1_age) / v1_dc, 0, 1));\n\tgended = v1_age >= v1_gl;\n\n\t// pitch: target + pitch envelope + glide\n\tglw = exp(0 - v1_age / max(1, v1_gt));\n\tglk = v1_gt > 1 ? glw : 0;\n\tsm = v1_semi + v1_pe * exp(0 - v1_age / v1_pd) + (v1_gfrom - v1_semi) * glk;\n\tratio = pow(2, sm / 12);\n\n\t// tape read\n\ti0 = floor(v1_pos);\n\tf0 = v1_pos - i0;\n\tta0 = peek(w, i0, 0);\n\tta1 = peek(w, i0 + 1, 0);\n\ttb0 = peek(w, i0, 1);\n\ttb1 = peek(w, i0 + 1, 1);\n\ttl = mix(ta0, ta1, f0);\n\ttrr = mix(tb0, tb1, f0);\n\t// loop: crossfade into the other end over ~5 ms instead of dipping to silence\n\tlspan = v1_lb - v1_la;\n\tlxf = clamp(0.005 * sr * ratio * bsrr, 32, max(32, lspan * 0.4));\n\txzf = v1_dir > 0 ? (v1_pos - (v1_lb - lxf)) / lxf : ((v1_la + lxf) - v1_pos) / lxf;\n\txz = v1_lb > v1_la ? clamp(xzf, 0, 1) : 0;\n\tp2 = clamp(v1_dir > 0 ? v1_pos - lspan : v1_pos + lspan, 0, nfr - 2);\n\ti2 = floor(p2);\n\tf2 = p2 - i2;\n\ttc0 = peek(w, i2, 0);\n\ttc1 = peek(w, i2 + 1, 0);\n\ttd0 = peek(w, i2, 1);\n\ttd1 = peek(w, i2 + 1, 1);\n\ttl2 = mix(tc0, tc1, f2);\n\ttrr2 = mix(td0, td1, f2);\n\ttl = mix(tl, tl2, xz);\n\ttrr = mix(trr, trr2, xz);\n\ttr2 = nch > 1 ? trr : tl;\n\n\t// grain read (4 heads)\n\tgnorm = v1_gd < 1.5 ? 1 : 2 / v1_gd;\n\tgsl = 0;\n\tgsr = 0;\n\t// grain head 0\n\tgph = v1_g0ph + 1 / v1_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v1_g0al < 0.5) && 0 < v1_gd;\n\tsd = v1_seed + v1_age * 0.0137 + 0 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v1_gsp / 12);\n\tgspan = v1_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v1_dir > 0 ? v1_a : v1_a + gspan;\n\tghi = v1_dir > 0 ? v1_b - 1 - gspan : v1_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v1_pos + (hash(sd, 1.1) - 0.5) * 2 * v1_gj * v1_gsz, min(glo, gmid), max(ghi, gmid));\n\tv1_g0st = gspawn ? gnst : v1_g0st;\n\tv1_g0rt = gspawn ? gnrt : v1_g0rt;\n\tv1_g0al = gspawn ? 1 : v1_g0al;\n\tv1_g0ph = gph;\n\trp = v1_g0st + v1_dir * gph * v1_gsz * v1_g0rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v1_a, v1_b - 1 - rp) / 256, 0, 1);\n\tgwin = 0 < v1_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 1\n\tgph = v1_g1ph + 1 / v1_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v1_g1al < 0.5) && 1 < v1_gd;\n\tsd = v1_seed + v1_age * 0.0137 + 1 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v1_gsp / 12);\n\tgspan = v1_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v1_dir > 0 ? v1_a : v1_a + gspan;\n\tghi = v1_dir > 0 ? v1_b - 1 - gspan : v1_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v1_pos + (hash(sd, 1.1) - 0.5) * 2 * v1_gj * v1_gsz, min(glo, gmid), max(ghi, gmid));\n\tv1_g1st = gspawn ? gnst : v1_g1st;\n\tv1_g1rt = gspawn ? gnrt : v1_g1rt;\n\tv1_g1al = gspawn ? 1 : v1_g1al;\n\tv1_g1ph = gph;\n\trp = v1_g1st + v1_dir * gph * v1_gsz * v1_g1rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v1_a, v1_b - 1 - rp) / 256, 0, 1);\n\tgwin = 1 < v1_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 2\n\tgph = v1_g2ph + 1 / v1_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v1_g2al < 0.5) && 2 < v1_gd;\n\tsd = v1_seed + v1_age * 0.0137 + 2 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v1_gsp / 12);\n\tgspan = v1_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v1_dir > 0 ? v1_a : v1_a + gspan;\n\tghi = v1_dir > 0 ? v1_b - 1 - gspan : v1_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v1_pos + (hash(sd, 1.1) - 0.5) * 2 * v1_gj * v1_gsz, min(glo, gmid), max(ghi, gmid));\n\tv1_g2st = gspawn ? gnst : v1_g2st;\n\tv1_g2rt = gspawn ? gnrt : v1_g2rt;\n\tv1_g2al = gspawn ? 1 : v1_g2al;\n\tv1_g2ph = gph;\n\trp = v1_g2st + v1_dir * gph * v1_gsz * v1_g2rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v1_a, v1_b - 1 - rp) / 256, 0, 1);\n\tgwin = 2 < v1_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 3\n\tgph = v1_g3ph + 1 / v1_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v1_g3al < 0.5) && 3 < v1_gd;\n\tsd = v1_seed + v1_age * 0.0137 + 3 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v1_gsp / 12);\n\tgspan = v1_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v1_dir > 0 ? v1_a : v1_a + gspan;\n\tghi = v1_dir > 0 ? v1_b - 1 - gspan : v1_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v1_pos + (hash(sd, 1.1) - 0.5) * 2 * v1_gj * v1_gsz, min(glo, gmid), max(ghi, gmid));\n\tv1_g3st = gspawn ? gnst : v1_g3st;\n\tv1_g3rt = gspawn ? gnrt : v1_g3rt;\n\tv1_g3al = gspawn ? 1 : v1_g3al;\n\tv1_g3ph = gph;\n\trp = v1_g3st + v1_dir * gph * v1_gsz * v1_g3rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v1_a, v1_b - 1 - rp) / 256, 0, 1);\n\tgwin = 3 < v1_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\n\tisg = v1_eng > 0.5;\n\txl = isg ? gsl : tl;\n\txr = isg ? gsr : tr2;\n\tadv = isg ? v1_scan : ratio;\n\tv1_pos += adv * bsrr * v1_dir;\n\n\t// region, loop and edge declick\n\tlooping = v1_lb > v1_la;\n\tspan = v1_lb - v1_la;\n\twrapf = looping && v1_dir > 0 && v1_pos >= v1_lb;\n\twrapb = looping && v1_dir < 0 && v1_pos < v1_la;\n\tpwb = wrapb ? v1_pos + span : v1_pos;\n\tv1_pos = wrapf ? v1_pos - span : pwb;\n\toutr0 = looping == 0 && (v1_pos >= v1_b || v1_pos < v1_a);\n\tefv = max(16, ef * abs(adv) * bsrr);                // 2 ms of output, whatever the speed\n\tedgr = clamp(min(v1_pos - v1_a, v1_b - v1_pos) / efv, 0, 1);\n\tedo = outr0 ? 0 : edgr;\n\tedg = (looping || isg) ? 1 : edo;\n\n\t// filter: stereo TPT state variable\n\tfilt = v1_ft > 0.5 || v1_cut < 19000 || v1_fe != 0 || v1_trk != 0;\n\tfc = clamp(v1_cut * pow(2, v1_fe * 4 * exp(0 - v1_age / v1_fd) + v1_trk * sm / 12), 20, sr * 0.45);\n\tgg = tan(pi * fc / sr);\n\tkk = 2 - 1.96 * v1_res;\n\ta1 = 1 / (1 + gg * (gg + kk));\n\ta2 = gg * a1;\n\ta3 = gg * a2;\n\tv3 = xl - v1_s2l;\n\tv1 = a1 * v1_s1l + a2 * v3;\n\tv2 = v1_s2l + a2 * v1_s1l + a3 * v3;\n\thpl = xl - kk * v1 - v2;\n\tsell = v1_ft < 1.5 ? hpl : v1;\n\tfl = v1_ft < 0.5 ? v2 : sell;\n\tn1l = 2 * v1 - v1_s1l;\n\tn2l = 2 * v2 - v1_s2l;\n\tv3 = xr - v1_s2r;\n\tv1 = a1 * v1_s1r + a2 * v3;\n\tv2 = v1_s2r + a2 * v1_s1r + a3 * v3;\n\thpr = xr - kk * v1 - v2;\n\tselr = v1_ft < 1.5 ? hpr : v1;\n\tfrr = v1_ft < 0.5 ? v2 : selr;\n\tn1r = 2 * v1 - v1_s1r;\n\tn2r = 2 * v2 - v1_s2r;\n\tv1_s1l = filt ? n1l : v1_s1l;\n\tv1_s2l = filt ? n2l : v1_s2l;\n\tv1_s1r = filt ? n1r : v1_s1r;\n\tv1_s2r = filt ? n2r : v1_s2r;\n\txl = filt ? fl : xl;\n\txr = filt ? frr : xr;\n\n\t// width, pan, gain\n\tmid = (xl + xr) * 0.5;\n\tsid = (xl - xr) * 0.5 * v1_wid;\n\tenvo = gended ? 0 : env;\n\tamp = envo * edg * v1_duck * v1_gain;\n\toutl += (mid + sid) * amp * v1_pl;\n\toutr += (mid - sid) * amp * v1_pr;\n\tv1_act = (cutv || gended || outr0) ? 0 : v1_act;\n}\n\n// ---------------- voice 2 ----------------\n// branchless inside: flags first, then every History assigned once\nif (v2_act > 0.5) {\n\tv2_age += 1;\n\tjn0 = peek(st, sb + max(0, v2_pend), 0);\n\tjn1 = peek(st, sb + max(0, v2_pend), 1);\n\n\t// duck: fade out to cut (choke) or to switch slice (jump)\n\tdku = v2_ddir > 0 ? v2_duck + dk : v2_duck;\n\tdkn = v2_ddir < 0 ? v2_duck - dk : dku;\n\tdended = v2_ddir < 0 && dkn <= 0;\n\tcutv = dended && v2_kill > 0.5;\n\tswv = dended && v2_kill < 0.5;\n\tdup = v2_ddir > 0 && dkn >= 1;\n\tv2_duck = clamp(dkn, 0, 1);\n\tddn = dup ? 0 : v2_ddir;\n\tv2_ddir = swv ? 1 : ddn;\n\n\t// jump: switch slice, keeping the relative position\n\tfr = clamp((v2_pos - v2_a) / max(1, v2_b - v2_a), 0, 1);\n\tna = jn0 + v2_stn * (jn1 - jn0);\n\tnb = min(jn1, na + max(64, v2_lnn * (jn1 - na)));\n\tnl = max(256, v2_lpn * (nb - na));\n\tnla2 = v2_dir > 0 ? na : max(na, nb - nl);\n\tnlb2 = v2_dir > 0 ? min(nb, na + nl) : nb;\n\tjp = na + fr * (nb - na);\n\tjpc = clamp(jp, nla2, nlb2);\n\tjpos = v2_lpn > 0 ? jpc : jp;\n\tswl = swv && v2_lpn > 0;\n\tv2_a = swv ? na : v2_a;\n\tv2_b = swv ? nb : v2_b;\n\tv2_la = swl ? nla2 : v2_la;\n\tv2_lb = swl ? nlb2 : v2_lb;\n\tv2_pos = swv ? jpos : v2_pos;\n\tv2_slc = swv ? v2_pend : v2_slc;\n\tv2_g0al = swv ? 0 : v2_g0al;\n\tv2_g1al = swv ? 0 : v2_g1al;\n\tv2_g2al = swv ? 0 : v2_g2al;\n\tv2_g3al = swv ? 0 : v2_g3al;\n\tv2_pend = swv ? -1 : v2_pend;\n\n\t// envelope: attack, then fade out ending at the gate\n\tenv = min(1, v2_age / v2_at);\n\tenv = min(env, clamp((v2_gl - v2_age) / v2_dc, 0, 1));\n\tgended = v2_age >= v2_gl;\n\n\t// pitch: target + pitch envelope + glide\n\tglw = exp(0 - v2_age / max(1, v2_gt));\n\tglk = v2_gt > 1 ? glw : 0;\n\tsm = v2_semi + v2_pe * exp(0 - v2_age / v2_pd) + (v2_gfrom - v2_semi) * glk;\n\tratio = pow(2, sm / 12);\n\n\t// tape read\n\ti0 = floor(v2_pos);\n\tf0 = v2_pos - i0;\n\tta0 = peek(w, i0, 0);\n\tta1 = peek(w, i0 + 1, 0);\n\ttb0 = peek(w, i0, 1);\n\ttb1 = peek(w, i0 + 1, 1);\n\ttl = mix(ta0, ta1, f0);\n\ttrr = mix(tb0, tb1, f0);\n\t// loop: crossfade into the other end over ~5 ms instead of dipping to silence\n\tlspan = v2_lb - v2_la;\n\tlxf = clamp(0.005 * sr * ratio * bsrr, 32, max(32, lspan * 0.4));\n\txzf = v2_dir > 0 ? (v2_pos - (v2_lb - lxf)) / lxf : ((v2_la + lxf) - v2_pos) / lxf;\n\txz = v2_lb > v2_la ? clamp(xzf, 0, 1) : 0;\n\tp2 = clamp(v2_dir > 0 ? v2_pos - lspan : v2_pos + lspan, 0, nfr - 2);\n\ti2 = floor(p2);\n\tf2 = p2 - i2;\n\ttc0 = peek(w, i2, 0);\n\ttc1 = peek(w, i2 + 1, 0);\n\ttd0 = peek(w, i2, 1);\n\ttd1 = peek(w, i2 + 1, 1);\n\ttl2 = mix(tc0, tc1, f2);\n\ttrr2 = mix(td0, td1, f2);\n\ttl = mix(tl, tl2, xz);\n\ttrr = mix(trr, trr2, xz);\n\ttr2 = nch > 1 ? trr : tl;\n\n\t// grain read (4 heads)\n\tgnorm = v2_gd < 1.5 ? 1 : 2 / v2_gd;\n\tgsl = 0;\n\tgsr = 0;\n\t// grain head 0\n\tgph = v2_g0ph + 1 / v2_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v2_g0al < 0.5) && 0 < v2_gd;\n\tsd = v2_seed + v2_age * 0.0137 + 0 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v2_gsp / 12);\n\tgspan = v2_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v2_dir > 0 ? v2_a : v2_a + gspan;\n\tghi = v2_dir > 0 ? v2_b - 1 - gspan : v2_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v2_pos + (hash(sd, 1.1) - 0.5) * 2 * v2_gj * v2_gsz, min(glo, gmid), max(ghi, gmid));\n\tv2_g0st = gspawn ? gnst : v2_g0st;\n\tv2_g0rt = gspawn ? gnrt : v2_g0rt;\n\tv2_g0al = gspawn ? 1 : v2_g0al;\n\tv2_g0ph = gph;\n\trp = v2_g0st + v2_dir * gph * v2_gsz * v2_g0rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v2_a, v2_b - 1 - rp) / 256, 0, 1);\n\tgwin = 0 < v2_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 1\n\tgph = v2_g1ph + 1 / v2_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v2_g1al < 0.5) && 1 < v2_gd;\n\tsd = v2_seed + v2_age * 0.0137 + 1 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v2_gsp / 12);\n\tgspan = v2_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v2_dir > 0 ? v2_a : v2_a + gspan;\n\tghi = v2_dir > 0 ? v2_b - 1 - gspan : v2_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v2_pos + (hash(sd, 1.1) - 0.5) * 2 * v2_gj * v2_gsz, min(glo, gmid), max(ghi, gmid));\n\tv2_g1st = gspawn ? gnst : v2_g1st;\n\tv2_g1rt = gspawn ? gnrt : v2_g1rt;\n\tv2_g1al = gspawn ? 1 : v2_g1al;\n\tv2_g1ph = gph;\n\trp = v2_g1st + v2_dir * gph * v2_gsz * v2_g1rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v2_a, v2_b - 1 - rp) / 256, 0, 1);\n\tgwin = 1 < v2_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 2\n\tgph = v2_g2ph + 1 / v2_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v2_g2al < 0.5) && 2 < v2_gd;\n\tsd = v2_seed + v2_age * 0.0137 + 2 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v2_gsp / 12);\n\tgspan = v2_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v2_dir > 0 ? v2_a : v2_a + gspan;\n\tghi = v2_dir > 0 ? v2_b - 1 - gspan : v2_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v2_pos + (hash(sd, 1.1) - 0.5) * 2 * v2_gj * v2_gsz, min(glo, gmid), max(ghi, gmid));\n\tv2_g2st = gspawn ? gnst : v2_g2st;\n\tv2_g2rt = gspawn ? gnrt : v2_g2rt;\n\tv2_g2al = gspawn ? 1 : v2_g2al;\n\tv2_g2ph = gph;\n\trp = v2_g2st + v2_dir * gph * v2_gsz * v2_g2rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v2_a, v2_b - 1 - rp) / 256, 0, 1);\n\tgwin = 2 < v2_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 3\n\tgph = v2_g3ph + 1 / v2_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v2_g3al < 0.5) && 3 < v2_gd;\n\tsd = v2_seed + v2_age * 0.0137 + 3 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v2_gsp / 12);\n\tgspan = v2_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v2_dir > 0 ? v2_a : v2_a + gspan;\n\tghi = v2_dir > 0 ? v2_b - 1 - gspan : v2_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v2_pos + (hash(sd, 1.1) - 0.5) * 2 * v2_gj * v2_gsz, min(glo, gmid), max(ghi, gmid));\n\tv2_g3st = gspawn ? gnst : v2_g3st;\n\tv2_g3rt = gspawn ? gnrt : v2_g3rt;\n\tv2_g3al = gspawn ? 1 : v2_g3al;\n\tv2_g3ph = gph;\n\trp = v2_g3st + v2_dir * gph * v2_gsz * v2_g3rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v2_a, v2_b - 1 - rp) / 256, 0, 1);\n\tgwin = 3 < v2_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\n\tisg = v2_eng > 0.5;\n\txl = isg ? gsl : tl;\n\txr = isg ? gsr : tr2;\n\tadv = isg ? v2_scan : ratio;\n\tv2_pos += adv * bsrr * v2_dir;\n\n\t// region, loop and edge declick\n\tlooping = v2_lb > v2_la;\n\tspan = v2_lb - v2_la;\n\twrapf = looping && v2_dir > 0 && v2_pos >= v2_lb;\n\twrapb = looping && v2_dir < 0 && v2_pos < v2_la;\n\tpwb = wrapb ? v2_pos + span : v2_pos;\n\tv2_pos = wrapf ? v2_pos - span : pwb;\n\toutr0 = looping == 0 && (v2_pos >= v2_b || v2_pos < v2_a);\n\tefv = max(16, ef * abs(adv) * bsrr);                // 2 ms of output, whatever the speed\n\tedgr = clamp(min(v2_pos - v2_a, v2_b - v2_pos) / efv, 0, 1);\n\tedo = outr0 ? 0 : edgr;\n\tedg = (looping || isg) ? 1 : edo;\n\n\t// filter: stereo TPT state variable\n\tfilt = v2_ft > 0.5 || v2_cut < 19000 || v2_fe != 0 || v2_trk != 0;\n\tfc = clamp(v2_cut * pow(2, v2_fe * 4 * exp(0 - v2_age / v2_fd) + v2_trk * sm / 12), 20, sr * 0.45);\n\tgg = tan(pi * fc / sr);\n\tkk = 2 - 1.96 * v2_res;\n\ta1 = 1 / (1 + gg * (gg + kk));\n\ta2 = gg * a1;\n\ta3 = gg * a2;\n\tv3 = xl - v2_s2l;\n\tv1 = a1 * v2_s1l + a2 * v3;\n\tv2 = v2_s2l + a2 * v2_s1l + a3 * v3;\n\thpl = xl - kk * v1 - v2;\n\tsell = v2_ft < 1.5 ? hpl : v1;\n\tfl = v2_ft < 0.5 ? v2 : sell;\n\tn1l = 2 * v1 - v2_s1l;\n\tn2l = 2 * v2 - v2_s2l;\n\tv3 = xr - v2_s2r;\n\tv1 = a1 * v2_s1r + a2 * v3;\n\tv2 = v2_s2r + a2 * v2_s1r + a3 * v3;\n\thpr = xr - kk * v1 - v2;\n\tselr = v2_ft < 1.5 ? hpr : v1;\n\tfrr = v2_ft < 0.5 ? v2 : selr;\n\tn1r = 2 * v1 - v2_s1r;\n\tn2r = 2 * v2 - v2_s2r;\n\tv2_s1l = filt ? n1l : v2_s1l;\n\tv2_s2l = filt ? n2l : v2_s2l;\n\tv2_s1r = filt ? n1r : v2_s1r;\n\tv2_s2r = filt ? n2r : v2_s2r;\n\txl = filt ? fl : xl;\n\txr = filt ? frr : xr;\n\n\t// width, pan, gain\n\tmid = (xl + xr) * 0.5;\n\tsid = (xl - xr) * 0.5 * v2_wid;\n\tenvo = gended ? 0 : env;\n\tamp = envo * edg * v2_duck * v2_gain;\n\toutl += (mid + sid) * amp * v2_pl;\n\toutr += (mid - sid) * amp * v2_pr;\n\tv2_act = (cutv || gended || outr0) ? 0 : v2_act;\n}\n\n// ---------------- voice 3 ----------------\n// branchless inside: flags first, then every History assigned once\nif (v3_act > 0.5) {\n\tv3_age += 1;\n\tjn0 = peek(st, sb + max(0, v3_pend), 0);\n\tjn1 = peek(st, sb + max(0, v3_pend), 1);\n\n\t// duck: fade out to cut (choke) or to switch slice (jump)\n\tdku = v3_ddir > 0 ? v3_duck + dk : v3_duck;\n\tdkn = v3_ddir < 0 ? v3_duck - dk : dku;\n\tdended = v3_ddir < 0 && dkn <= 0;\n\tcutv = dended && v3_kill > 0.5;\n\tswv = dended && v3_kill < 0.5;\n\tdup = v3_ddir > 0 && dkn >= 1;\n\tv3_duck = clamp(dkn, 0, 1);\n\tddn = dup ? 0 : v3_ddir;\n\tv3_ddir = swv ? 1 : ddn;\n\n\t// jump: switch slice, keeping the relative position\n\tfr = clamp((v3_pos - v3_a) / max(1, v3_b - v3_a), 0, 1);\n\tna = jn0 + v3_stn * (jn1 - jn0);\n\tnb = min(jn1, na + max(64, v3_lnn * (jn1 - na)));\n\tnl = max(256, v3_lpn * (nb - na));\n\tnla2 = v3_dir > 0 ? na : max(na, nb - nl);\n\tnlb2 = v3_dir > 0 ? min(nb, na + nl) : nb;\n\tjp = na + fr * (nb - na);\n\tjpc = clamp(jp, nla2, nlb2);\n\tjpos = v3_lpn > 0 ? jpc : jp;\n\tswl = swv && v3_lpn > 0;\n\tv3_a = swv ? na : v3_a;\n\tv3_b = swv ? nb : v3_b;\n\tv3_la = swl ? nla2 : v3_la;\n\tv3_lb = swl ? nlb2 : v3_lb;\n\tv3_pos = swv ? jpos : v3_pos;\n\tv3_slc = swv ? v3_pend : v3_slc;\n\tv3_g0al = swv ? 0 : v3_g0al;\n\tv3_g1al = swv ? 0 : v3_g1al;\n\tv3_g2al = swv ? 0 : v3_g2al;\n\tv3_g3al = swv ? 0 : v3_g3al;\n\tv3_pend = swv ? -1 : v3_pend;\n\n\t// envelope: attack, then fade out ending at the gate\n\tenv = min(1, v3_age / v3_at);\n\tenv = min(env, clamp((v3_gl - v3_age) / v3_dc, 0, 1));\n\tgended = v3_age >= v3_gl;\n\n\t// pitch: target + pitch envelope + glide\n\tglw = exp(0 - v3_age / max(1, v3_gt));\n\tglk = v3_gt > 1 ? glw : 0;\n\tsm = v3_semi + v3_pe * exp(0 - v3_age / v3_pd) + (v3_gfrom - v3_semi) * glk;\n\tratio = pow(2, sm / 12);\n\n\t// tape read\n\ti0 = floor(v3_pos);\n\tf0 = v3_pos - i0;\n\tta0 = peek(w, i0, 0);\n\tta1 = peek(w, i0 + 1, 0);\n\ttb0 = peek(w, i0, 1);\n\ttb1 = peek(w, i0 + 1, 1);\n\ttl = mix(ta0, ta1, f0);\n\ttrr = mix(tb0, tb1, f0);\n\t// loop: crossfade into the other end over ~5 ms instead of dipping to silence\n\tlspan = v3_lb - v3_la;\n\tlxf = clamp(0.005 * sr * ratio * bsrr, 32, max(32, lspan * 0.4));\n\txzf = v3_dir > 0 ? (v3_pos - (v3_lb - lxf)) / lxf : ((v3_la + lxf) - v3_pos) / lxf;\n\txz = v3_lb > v3_la ? clamp(xzf, 0, 1) : 0;\n\tp2 = clamp(v3_dir > 0 ? v3_pos - lspan : v3_pos + lspan, 0, nfr - 2);\n\ti2 = floor(p2);\n\tf2 = p2 - i2;\n\ttc0 = peek(w, i2, 0);\n\ttc1 = peek(w, i2 + 1, 0);\n\ttd0 = peek(w, i2, 1);\n\ttd1 = peek(w, i2 + 1, 1);\n\ttl2 = mix(tc0, tc1, f2);\n\ttrr2 = mix(td0, td1, f2);\n\ttl = mix(tl, tl2, xz);\n\ttrr = mix(trr, trr2, xz);\n\ttr2 = nch > 1 ? trr : tl;\n\n\t// grain read (4 heads)\n\tgnorm = v3_gd < 1.5 ? 1 : 2 / v3_gd;\n\tgsl = 0;\n\tgsr = 0;\n\t// grain head 0\n\tgph = v3_g0ph + 1 / v3_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v3_g0al < 0.5) && 0 < v3_gd;\n\tsd = v3_seed + v3_age * 0.0137 + 0 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v3_gsp / 12);\n\tgspan = v3_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v3_dir > 0 ? v3_a : v3_a + gspan;\n\tghi = v3_dir > 0 ? v3_b - 1 - gspan : v3_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v3_pos + (hash(sd, 1.1) - 0.5) * 2 * v3_gj * v3_gsz, min(glo, gmid), max(ghi, gmid));\n\tv3_g0st = gspawn ? gnst : v3_g0st;\n\tv3_g0rt = gspawn ? gnrt : v3_g0rt;\n\tv3_g0al = gspawn ? 1 : v3_g0al;\n\tv3_g0ph = gph;\n\trp = v3_g0st + v3_dir * gph * v3_gsz * v3_g0rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v3_a, v3_b - 1 - rp) / 256, 0, 1);\n\tgwin = 0 < v3_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 1\n\tgph = v3_g1ph + 1 / v3_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v3_g1al < 0.5) && 1 < v3_gd;\n\tsd = v3_seed + v3_age * 0.0137 + 1 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v3_gsp / 12);\n\tgspan = v3_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v3_dir > 0 ? v3_a : v3_a + gspan;\n\tghi = v3_dir > 0 ? v3_b - 1 - gspan : v3_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v3_pos + (hash(sd, 1.1) - 0.5) * 2 * v3_gj * v3_gsz, min(glo, gmid), max(ghi, gmid));\n\tv3_g1st = gspawn ? gnst : v3_g1st;\n\tv3_g1rt = gspawn ? gnrt : v3_g1rt;\n\tv3_g1al = gspawn ? 1 : v3_g1al;\n\tv3_g1ph = gph;\n\trp = v3_g1st + v3_dir * gph * v3_gsz * v3_g1rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v3_a, v3_b - 1 - rp) / 256, 0, 1);\n\tgwin = 1 < v3_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 2\n\tgph = v3_g2ph + 1 / v3_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v3_g2al < 0.5) && 2 < v3_gd;\n\tsd = v3_seed + v3_age * 0.0137 + 2 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v3_gsp / 12);\n\tgspan = v3_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v3_dir > 0 ? v3_a : v3_a + gspan;\n\tghi = v3_dir > 0 ? v3_b - 1 - gspan : v3_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v3_pos + (hash(sd, 1.1) - 0.5) * 2 * v3_gj * v3_gsz, min(glo, gmid), max(ghi, gmid));\n\tv3_g2st = gspawn ? gnst : v3_g2st;\n\tv3_g2rt = gspawn ? gnrt : v3_g2rt;\n\tv3_g2al = gspawn ? 1 : v3_g2al;\n\tv3_g2ph = gph;\n\trp = v3_g2st + v3_dir * gph * v3_gsz * v3_g2rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v3_a, v3_b - 1 - rp) / 256, 0, 1);\n\tgwin = 2 < v3_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 3\n\tgph = v3_g3ph + 1 / v3_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v3_g3al < 0.5) && 3 < v3_gd;\n\tsd = v3_seed + v3_age * 0.0137 + 3 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v3_gsp / 12);\n\tgspan = v3_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v3_dir > 0 ? v3_a : v3_a + gspan;\n\tghi = v3_dir > 0 ? v3_b - 1 - gspan : v3_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v3_pos + (hash(sd, 1.1) - 0.5) * 2 * v3_gj * v3_gsz, min(glo, gmid), max(ghi, gmid));\n\tv3_g3st = gspawn ? gnst : v3_g3st;\n\tv3_g3rt = gspawn ? gnrt : v3_g3rt;\n\tv3_g3al = gspawn ? 1 : v3_g3al;\n\tv3_g3ph = gph;\n\trp = v3_g3st + v3_dir * gph * v3_gsz * v3_g3rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v3_a, v3_b - 1 - rp) / 256, 0, 1);\n\tgwin = 3 < v3_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\n\tisg = v3_eng > 0.5;\n\txl = isg ? gsl : tl;\n\txr = isg ? gsr : tr2;\n\tadv = isg ? v3_scan : ratio;\n\tv3_pos += adv * bsrr * v3_dir;\n\n\t// region, loop and edge declick\n\tlooping = v3_lb > v3_la;\n\tspan = v3_lb - v3_la;\n\twrapf = looping && v3_dir > 0 && v3_pos >= v3_lb;\n\twrapb = looping && v3_dir < 0 && v3_pos < v3_la;\n\tpwb = wrapb ? v3_pos + span : v3_pos;\n\tv3_pos = wrapf ? v3_pos - span : pwb;\n\toutr0 = looping == 0 && (v3_pos >= v3_b || v3_pos < v3_a);\n\tefv = max(16, ef * abs(adv) * bsrr);                // 2 ms of output, whatever the speed\n\tedgr = clamp(min(v3_pos - v3_a, v3_b - v3_pos) / efv, 0, 1);\n\tedo = outr0 ? 0 : edgr;\n\tedg = (looping || isg) ? 1 : edo;\n\n\t// filter: stereo TPT state variable\n\tfilt = v3_ft > 0.5 || v3_cut < 19000 || v3_fe != 0 || v3_trk != 0;\n\tfc = clamp(v3_cut * pow(2, v3_fe * 4 * exp(0 - v3_age / v3_fd) + v3_trk * sm / 12), 20, sr * 0.45);\n\tgg = tan(pi * fc / sr);\n\tkk = 2 - 1.96 * v3_res;\n\ta1 = 1 / (1 + gg * (gg + kk));\n\ta2 = gg * a1;\n\ta3 = gg * a2;\n\tv3 = xl - v3_s2l;\n\tv1 = a1 * v3_s1l + a2 * v3;\n\tv2 = v3_s2l + a2 * v3_s1l + a3 * v3;\n\thpl = xl - kk * v1 - v2;\n\tsell = v3_ft < 1.5 ? hpl : v1;\n\tfl = v3_ft < 0.5 ? v2 : sell;\n\tn1l = 2 * v1 - v3_s1l;\n\tn2l = 2 * v2 - v3_s2l;\n\tv3 = xr - v3_s2r;\n\tv1 = a1 * v3_s1r + a2 * v3;\n\tv2 = v3_s2r + a2 * v3_s1r + a3 * v3;\n\thpr = xr - kk * v1 - v2;\n\tselr = v3_ft < 1.5 ? hpr : v1;\n\tfrr = v3_ft < 0.5 ? v2 : selr;\n\tn1r = 2 * v1 - v3_s1r;\n\tn2r = 2 * v2 - v3_s2r;\n\tv3_s1l = filt ? n1l : v3_s1l;\n\tv3_s2l = filt ? n2l : v3_s2l;\n\tv3_s1r = filt ? n1r : v3_s1r;\n\tv3_s2r = filt ? n2r : v3_s2r;\n\txl = filt ? fl : xl;\n\txr = filt ? frr : xr;\n\n\t// width, pan, gain\n\tmid = (xl + xr) * 0.5;\n\tsid = (xl - xr) * 0.5 * v3_wid;\n\tenvo = gended ? 0 : env;\n\tamp = envo * edg * v3_duck * v3_gain;\n\toutl += (mid + sid) * amp * v3_pl;\n\toutr += (mid - sid) * amp * v3_pr;\n\tv3_act = (cutv || gended || outr0) ? 0 : v3_act;\n}\n\n// ---------------- voice 4 ----------------\n// branchless inside: flags first, then every History assigned once\nif (v4_act > 0.5) {\n\tv4_age += 1;\n\tjn0 = peek(st, sb + max(0, v4_pend), 0);\n\tjn1 = peek(st, sb + max(0, v4_pend), 1);\n\n\t// duck: fade out to cut (choke) or to switch slice (jump)\n\tdku = v4_ddir > 0 ? v4_duck + dk : v4_duck;\n\tdkn = v4_ddir < 0 ? v4_duck - dk : dku;\n\tdended = v4_ddir < 0 && dkn <= 0;\n\tcutv = dended && v4_kill > 0.5;\n\tswv = dended && v4_kill < 0.5;\n\tdup = v4_ddir > 0 && dkn >= 1;\n\tv4_duck = clamp(dkn, 0, 1);\n\tddn = dup ? 0 : v4_ddir;\n\tv4_ddir = swv ? 1 : ddn;\n\n\t// jump: switch slice, keeping the relative position\n\tfr = clamp((v4_pos - v4_a) / max(1, v4_b - v4_a), 0, 1);\n\tna = jn0 + v4_stn * (jn1 - jn0);\n\tnb = min(jn1, na + max(64, v4_lnn * (jn1 - na)));\n\tnl = max(256, v4_lpn * (nb - na));\n\tnla2 = v4_dir > 0 ? na : max(na, nb - nl);\n\tnlb2 = v4_dir > 0 ? min(nb, na + nl) : nb;\n\tjp = na + fr * (nb - na);\n\tjpc = clamp(jp, nla2, nlb2);\n\tjpos = v4_lpn > 0 ? jpc : jp;\n\tswl = swv && v4_lpn > 0;\n\tv4_a = swv ? na : v4_a;\n\tv4_b = swv ? nb : v4_b;\n\tv4_la = swl ? nla2 : v4_la;\n\tv4_lb = swl ? nlb2 : v4_lb;\n\tv4_pos = swv ? jpos : v4_pos;\n\tv4_slc = swv ? v4_pend : v4_slc;\n\tv4_g0al = swv ? 0 : v4_g0al;\n\tv4_g1al = swv ? 0 : v4_g1al;\n\tv4_g2al = swv ? 0 : v4_g2al;\n\tv4_g3al = swv ? 0 : v4_g3al;\n\tv4_pend = swv ? -1 : v4_pend;\n\n\t// envelope: attack, then fade out ending at the gate\n\tenv = min(1, v4_age / v4_at);\n\tenv = min(env, clamp((v4_gl - v4_age) / v4_dc, 0, 1));\n\tgended = v4_age >= v4_gl;\n\n\t// pitch: target + pitch envelope + glide\n\tglw = exp(0 - v4_age / max(1, v4_gt));\n\tglk = v4_gt > 1 ? glw : 0;\n\tsm = v4_semi + v4_pe * exp(0 - v4_age / v4_pd) + (v4_gfrom - v4_semi) * glk;\n\tratio = pow(2, sm / 12);\n\n\t// tape read\n\ti0 = floor(v4_pos);\n\tf0 = v4_pos - i0;\n\tta0 = peek(w, i0, 0);\n\tta1 = peek(w, i0 + 1, 0);\n\ttb0 = peek(w, i0, 1);\n\ttb1 = peek(w, i0 + 1, 1);\n\ttl = mix(ta0, ta1, f0);\n\ttrr = mix(tb0, tb1, f0);\n\t// loop: crossfade into the other end over ~5 ms instead of dipping to silence\n\tlspan = v4_lb - v4_la;\n\tlxf = clamp(0.005 * sr * ratio * bsrr, 32, max(32, lspan * 0.4));\n\txzf = v4_dir > 0 ? (v4_pos - (v4_lb - lxf)) / lxf : ((v4_la + lxf) - v4_pos) / lxf;\n\txz = v4_lb > v4_la ? clamp(xzf, 0, 1) : 0;\n\tp2 = clamp(v4_dir > 0 ? v4_pos - lspan : v4_pos + lspan, 0, nfr - 2);\n\ti2 = floor(p2);\n\tf2 = p2 - i2;\n\ttc0 = peek(w, i2, 0);\n\ttc1 = peek(w, i2 + 1, 0);\n\ttd0 = peek(w, i2, 1);\n\ttd1 = peek(w, i2 + 1, 1);\n\ttl2 = mix(tc0, tc1, f2);\n\ttrr2 = mix(td0, td1, f2);\n\ttl = mix(tl, tl2, xz);\n\ttrr = mix(trr, trr2, xz);\n\ttr2 = nch > 1 ? trr : tl;\n\n\t// grain read (4 heads)\n\tgnorm = v4_gd < 1.5 ? 1 : 2 / v4_gd;\n\tgsl = 0;\n\tgsr = 0;\n\t// grain head 0\n\tgph = v4_g0ph + 1 / v4_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v4_g0al < 0.5) && 0 < v4_gd;\n\tsd = v4_seed + v4_age * 0.0137 + 0 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v4_gsp / 12);\n\tgspan = v4_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v4_dir > 0 ? v4_a : v4_a + gspan;\n\tghi = v4_dir > 0 ? v4_b - 1 - gspan : v4_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v4_pos + (hash(sd, 1.1) - 0.5) * 2 * v4_gj * v4_gsz, min(glo, gmid), max(ghi, gmid));\n\tv4_g0st = gspawn ? gnst : v4_g0st;\n\tv4_g0rt = gspawn ? gnrt : v4_g0rt;\n\tv4_g0al = gspawn ? 1 : v4_g0al;\n\tv4_g0ph = gph;\n\trp = v4_g0st + v4_dir * gph * v4_gsz * v4_g0rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v4_a, v4_b - 1 - rp) / 256, 0, 1);\n\tgwin = 0 < v4_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 1\n\tgph = v4_g1ph + 1 / v4_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v4_g1al < 0.5) && 1 < v4_gd;\n\tsd = v4_seed + v4_age * 0.0137 + 1 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v4_gsp / 12);\n\tgspan = v4_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v4_dir > 0 ? v4_a : v4_a + gspan;\n\tghi = v4_dir > 0 ? v4_b - 1 - gspan : v4_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v4_pos + (hash(sd, 1.1) - 0.5) * 2 * v4_gj * v4_gsz, min(glo, gmid), max(ghi, gmid));\n\tv4_g1st = gspawn ? gnst : v4_g1st;\n\tv4_g1rt = gspawn ? gnrt : v4_g1rt;\n\tv4_g1al = gspawn ? 1 : v4_g1al;\n\tv4_g1ph = gph;\n\trp = v4_g1st + v4_dir * gph * v4_gsz * v4_g1rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v4_a, v4_b - 1 - rp) / 256, 0, 1);\n\tgwin = 1 < v4_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 2\n\tgph = v4_g2ph + 1 / v4_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v4_g2al < 0.5) && 2 < v4_gd;\n\tsd = v4_seed + v4_age * 0.0137 + 2 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v4_gsp / 12);\n\tgspan = v4_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v4_dir > 0 ? v4_a : v4_a + gspan;\n\tghi = v4_dir > 0 ? v4_b - 1 - gspan : v4_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v4_pos + (hash(sd, 1.1) - 0.5) * 2 * v4_gj * v4_gsz, min(glo, gmid), max(ghi, gmid));\n\tv4_g2st = gspawn ? gnst : v4_g2st;\n\tv4_g2rt = gspawn ? gnrt : v4_g2rt;\n\tv4_g2al = gspawn ? 1 : v4_g2al;\n\tv4_g2ph = gph;\n\trp = v4_g2st + v4_dir * gph * v4_gsz * v4_g2rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v4_a, v4_b - 1 - rp) / 256, 0, 1);\n\tgwin = 2 < v4_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 3\n\tgph = v4_g3ph + 1 / v4_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v4_g3al < 0.5) && 3 < v4_gd;\n\tsd = v4_seed + v4_age * 0.0137 + 3 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v4_gsp / 12);\n\tgspan = v4_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v4_dir > 0 ? v4_a : v4_a + gspan;\n\tghi = v4_dir > 0 ? v4_b - 1 - gspan : v4_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v4_pos + (hash(sd, 1.1) - 0.5) * 2 * v4_gj * v4_gsz, min(glo, gmid), max(ghi, gmid));\n\tv4_g3st = gspawn ? gnst : v4_g3st;\n\tv4_g3rt = gspawn ? gnrt : v4_g3rt;\n\tv4_g3al = gspawn ? 1 : v4_g3al;\n\tv4_g3ph = gph;\n\trp = v4_g3st + v4_dir * gph * v4_gsz * v4_g3rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v4_a, v4_b - 1 - rp) / 256, 0, 1);\n\tgwin = 3 < v4_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\n\tisg = v4_eng > 0.5;\n\txl = isg ? gsl : tl;\n\txr = isg ? gsr : tr2;\n\tadv = isg ? v4_scan : ratio;\n\tv4_pos += adv * bsrr * v4_dir;\n\n\t// region, loop and edge declick\n\tlooping = v4_lb > v4_la;\n\tspan = v4_lb - v4_la;\n\twrapf = looping && v4_dir > 0 && v4_pos >= v4_lb;\n\twrapb = looping && v4_dir < 0 && v4_pos < v4_la;\n\tpwb = wrapb ? v4_pos + span : v4_pos;\n\tv4_pos = wrapf ? v4_pos - span : pwb;\n\toutr0 = looping == 0 && (v4_pos >= v4_b || v4_pos < v4_a);\n\tefv = max(16, ef * abs(adv) * bsrr);                // 2 ms of output, whatever the speed\n\tedgr = clamp(min(v4_pos - v4_a, v4_b - v4_pos) / efv, 0, 1);\n\tedo = outr0 ? 0 : edgr;\n\tedg = (looping || isg) ? 1 : edo;\n\n\t// filter: stereo TPT state variable\n\tfilt = v4_ft > 0.5 || v4_cut < 19000 || v4_fe != 0 || v4_trk != 0;\n\tfc = clamp(v4_cut * pow(2, v4_fe * 4 * exp(0 - v4_age / v4_fd) + v4_trk * sm / 12), 20, sr * 0.45);\n\tgg = tan(pi * fc / sr);\n\tkk = 2 - 1.96 * v4_res;\n\ta1 = 1 / (1 + gg * (gg + kk));\n\ta2 = gg * a1;\n\ta3 = gg * a2;\n\tv3 = xl - v4_s2l;\n\tv1 = a1 * v4_s1l + a2 * v3;\n\tv2 = v4_s2l + a2 * v4_s1l + a3 * v3;\n\thpl = xl - kk * v1 - v2;\n\tsell = v4_ft < 1.5 ? hpl : v1;\n\tfl = v4_ft < 0.5 ? v2 : sell;\n\tn1l = 2 * v1 - v4_s1l;\n\tn2l = 2 * v2 - v4_s2l;\n\tv3 = xr - v4_s2r;\n\tv1 = a1 * v4_s1r + a2 * v3;\n\tv2 = v4_s2r + a2 * v4_s1r + a3 * v3;\n\thpr = xr - kk * v1 - v2;\n\tselr = v4_ft < 1.5 ? hpr : v1;\n\tfrr = v4_ft < 0.5 ? v2 : selr;\n\tn1r = 2 * v1 - v4_s1r;\n\tn2r = 2 * v2 - v4_s2r;\n\tv4_s1l = filt ? n1l : v4_s1l;\n\tv4_s2l = filt ? n2l : v4_s2l;\n\tv4_s1r = filt ? n1r : v4_s1r;\n\tv4_s2r = filt ? n2r : v4_s2r;\n\txl = filt ? fl : xl;\n\txr = filt ? frr : xr;\n\n\t// width, pan, gain\n\tmid = (xl + xr) * 0.5;\n\tsid = (xl - xr) * 0.5 * v4_wid;\n\tenvo = gended ? 0 : env;\n\tamp = envo * edg * v4_duck * v4_gain;\n\toutl += (mid + sid) * amp * v4_pl;\n\toutr += (mid - sid) * amp * v4_pr;\n\tv4_act = (cutv || gended || outr0) ? 0 : v4_act;\n}\n\n// ---------------- voice 5 ----------------\n// branchless inside: flags first, then every History assigned once\nif (v5_act > 0.5) {\n\tv5_age += 1;\n\tjn0 = peek(st, sb + max(0, v5_pend), 0);\n\tjn1 = peek(st, sb + max(0, v5_pend), 1);\n\n\t// duck: fade out to cut (choke) or to switch slice (jump)\n\tdku = v5_ddir > 0 ? v5_duck + dk : v5_duck;\n\tdkn = v5_ddir < 0 ? v5_duck - dk : dku;\n\tdended = v5_ddir < 0 && dkn <= 0;\n\tcutv = dended && v5_kill > 0.5;\n\tswv = dended && v5_kill < 0.5;\n\tdup = v5_ddir > 0 && dkn >= 1;\n\tv5_duck = clamp(dkn, 0, 1);\n\tddn = dup ? 0 : v5_ddir;\n\tv5_ddir = swv ? 1 : ddn;\n\n\t// jump: switch slice, keeping the relative position\n\tfr = clamp((v5_pos - v5_a) / max(1, v5_b - v5_a), 0, 1);\n\tna = jn0 + v5_stn * (jn1 - jn0);\n\tnb = min(jn1, na + max(64, v5_lnn * (jn1 - na)));\n\tnl = max(256, v5_lpn * (nb - na));\n\tnla2 = v5_dir > 0 ? na : max(na, nb - nl);\n\tnlb2 = v5_dir > 0 ? min(nb, na + nl) : nb;\n\tjp = na + fr * (nb - na);\n\tjpc = clamp(jp, nla2, nlb2);\n\tjpos = v5_lpn > 0 ? jpc : jp;\n\tswl = swv && v5_lpn > 0;\n\tv5_a = swv ? na : v5_a;\n\tv5_b = swv ? nb : v5_b;\n\tv5_la = swl ? nla2 : v5_la;\n\tv5_lb = swl ? nlb2 : v5_lb;\n\tv5_pos = swv ? jpos : v5_pos;\n\tv5_slc = swv ? v5_pend : v5_slc;\n\tv5_g0al = swv ? 0 : v5_g0al;\n\tv5_g1al = swv ? 0 : v5_g1al;\n\tv5_g2al = swv ? 0 : v5_g2al;\n\tv5_g3al = swv ? 0 : v5_g3al;\n\tv5_pend = swv ? -1 : v5_pend;\n\n\t// envelope: attack, then fade out ending at the gate\n\tenv = min(1, v5_age / v5_at);\n\tenv = min(env, clamp((v5_gl - v5_age) / v5_dc, 0, 1));\n\tgended = v5_age >= v5_gl;\n\n\t// pitch: target + pitch envelope + glide\n\tglw = exp(0 - v5_age / max(1, v5_gt));\n\tglk = v5_gt > 1 ? glw : 0;\n\tsm = v5_semi + v5_pe * exp(0 - v5_age / v5_pd) + (v5_gfrom - v5_semi) * glk;\n\tratio = pow(2, sm / 12);\n\n\t// tape read\n\ti0 = floor(v5_pos);\n\tf0 = v5_pos - i0;\n\tta0 = peek(w, i0, 0);\n\tta1 = peek(w, i0 + 1, 0);\n\ttb0 = peek(w, i0, 1);\n\ttb1 = peek(w, i0 + 1, 1);\n\ttl = mix(ta0, ta1, f0);\n\ttrr = mix(tb0, tb1, f0);\n\t// loop: crossfade into the other end over ~5 ms instead of dipping to silence\n\tlspan = v5_lb - v5_la;\n\tlxf = clamp(0.005 * sr * ratio * bsrr, 32, max(32, lspan * 0.4));\n\txzf = v5_dir > 0 ? (v5_pos - (v5_lb - lxf)) / lxf : ((v5_la + lxf) - v5_pos) / lxf;\n\txz = v5_lb > v5_la ? clamp(xzf, 0, 1) : 0;\n\tp2 = clamp(v5_dir > 0 ? v5_pos - lspan : v5_pos + lspan, 0, nfr - 2);\n\ti2 = floor(p2);\n\tf2 = p2 - i2;\n\ttc0 = peek(w, i2, 0);\n\ttc1 = peek(w, i2 + 1, 0);\n\ttd0 = peek(w, i2, 1);\n\ttd1 = peek(w, i2 + 1, 1);\n\ttl2 = mix(tc0, tc1, f2);\n\ttrr2 = mix(td0, td1, f2);\n\ttl = mix(tl, tl2, xz);\n\ttrr = mix(trr, trr2, xz);\n\ttr2 = nch > 1 ? trr : tl;\n\n\t// grain read (4 heads)\n\tgnorm = v5_gd < 1.5 ? 1 : 2 / v5_gd;\n\tgsl = 0;\n\tgsr = 0;\n\t// grain head 0\n\tgph = v5_g0ph + 1 / v5_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v5_g0al < 0.5) && 0 < v5_gd;\n\tsd = v5_seed + v5_age * 0.0137 + 0 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v5_gsp / 12);\n\tgspan = v5_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v5_dir > 0 ? v5_a : v5_a + gspan;\n\tghi = v5_dir > 0 ? v5_b - 1 - gspan : v5_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v5_pos + (hash(sd, 1.1) - 0.5) * 2 * v5_gj * v5_gsz, min(glo, gmid), max(ghi, gmid));\n\tv5_g0st = gspawn ? gnst : v5_g0st;\n\tv5_g0rt = gspawn ? gnrt : v5_g0rt;\n\tv5_g0al = gspawn ? 1 : v5_g0al;\n\tv5_g0ph = gph;\n\trp = v5_g0st + v5_dir * gph * v5_gsz * v5_g0rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v5_a, v5_b - 1 - rp) / 256, 0, 1);\n\tgwin = 0 < v5_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 1\n\tgph = v5_g1ph + 1 / v5_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v5_g1al < 0.5) && 1 < v5_gd;\n\tsd = v5_seed + v5_age * 0.0137 + 1 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v5_gsp / 12);\n\tgspan = v5_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v5_dir > 0 ? v5_a : v5_a + gspan;\n\tghi = v5_dir > 0 ? v5_b - 1 - gspan : v5_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v5_pos + (hash(sd, 1.1) - 0.5) * 2 * v5_gj * v5_gsz, min(glo, gmid), max(ghi, gmid));\n\tv5_g1st = gspawn ? gnst : v5_g1st;\n\tv5_g1rt = gspawn ? gnrt : v5_g1rt;\n\tv5_g1al = gspawn ? 1 : v5_g1al;\n\tv5_g1ph = gph;\n\trp = v5_g1st + v5_dir * gph * v5_gsz * v5_g1rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v5_a, v5_b - 1 - rp) / 256, 0, 1);\n\tgwin = 1 < v5_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 2\n\tgph = v5_g2ph + 1 / v5_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v5_g2al < 0.5) && 2 < v5_gd;\n\tsd = v5_seed + v5_age * 0.0137 + 2 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v5_gsp / 12);\n\tgspan = v5_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v5_dir > 0 ? v5_a : v5_a + gspan;\n\tghi = v5_dir > 0 ? v5_b - 1 - gspan : v5_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v5_pos + (hash(sd, 1.1) - 0.5) * 2 * v5_gj * v5_gsz, min(glo, gmid), max(ghi, gmid));\n\tv5_g2st = gspawn ? gnst : v5_g2st;\n\tv5_g2rt = gspawn ? gnrt : v5_g2rt;\n\tv5_g2al = gspawn ? 1 : v5_g2al;\n\tv5_g2ph = gph;\n\trp = v5_g2st + v5_dir * gph * v5_gsz * v5_g2rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v5_a, v5_b - 1 - rp) / 256, 0, 1);\n\tgwin = 2 < v5_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\t// grain head 3\n\tgph = v5_g3ph + 1 / v5_gsz;\n\tgwrap = gph >= 1;\n\tgph = gwrap ? gph - 1 : gph;\n\tgspawn = (gwrap || v5_g3al < 0.5) && 3 < v5_gd;\n\tsd = v5_seed + v5_age * 0.0137 + 3 * 0.31;\n\tgnrt = ratio * pow(2, (hash(sd, 2.3) - 0.5) * 2 * v5_gsp / 12);\n\tgspan = v5_gsz * gnrt * bsrr;                       // source samples one grain travels\n\tglo = v5_dir > 0 ? v5_a : v5_a + gspan;\n\tghi = v5_dir > 0 ? v5_b - 1 - gspan : v5_b - 1;\n\tgmid = (glo + ghi) * 0.5;\n\tgnst = clamp(v5_pos + (hash(sd, 1.1) - 0.5) * 2 * v5_gj * v5_gsz, min(glo, gmid), max(ghi, gmid));\n\tv5_g3st = gspawn ? gnst : v5_g3st;\n\tv5_g3rt = gspawn ? gnrt : v5_g3rt;\n\tv5_g3al = gspawn ? 1 : v5_g3al;\n\tv5_g3ph = gph;\n\trp = v5_g3st + v5_dir * gph * v5_gsz * v5_g3rt * bsrr;\n\tgi0 = floor(rp);\n\tgf = rp - gi0;\n\tga0 = peek(w, gi0, 0);\n\tga1 = peek(w, gi0 + 1, 0);\n\tgb0 = peek(w, gi0, 1);\n\tgb1 = peek(w, gi0 + 1, 1);\n\tgw = (0.5 - 0.5 * cos(twopi * gph)) * gnorm;\n\tgedge = clamp(min(rp - v5_a, v5_b - 1 - rp) / 256, 0, 1);\n\tgwin = 3 < v5_gd ? gw * gedge : 0;\n\tgl0 = mix(ga0, ga1, gf);\n\tgr0 = mix(gb0, gb1, gf);\n\tgr1 = nch > 1 ? gr0 : gl0;\n\tgsl += gl0 * gwin;\n\tgsr += gr1 * gwin;\n\n\tisg = v5_eng > 0.5;\n\txl = isg ? gsl : tl;\n\txr = isg ? gsr : tr2;\n\tadv = isg ? v5_scan : ratio;\n\tv5_pos += adv * bsrr * v5_dir;\n\n\t// region, loop and edge declick\n\tlooping = v5_lb > v5_la;\n\tspan = v5_lb - v5_la;\n\twrapf = looping && v5_dir > 0 && v5_pos >= v5_lb;\n\twrapb = looping && v5_dir < 0 && v5_pos < v5_la;\n\tpwb = wrapb ? v5_pos + span : v5_pos;\n\tv5_pos = wrapf ? v5_pos - span : pwb;\n\toutr0 = looping == 0 && (v5_pos >= v5_b || v5_pos < v5_a);\n\tefv = max(16, ef * abs(adv) * bsrr);                // 2 ms of output, whatever the speed\n\tedgr = clamp(min(v5_pos - v5_a, v5_b - v5_pos) / efv, 0, 1);\n\tedo = outr0 ? 0 : edgr;\n\tedg = (looping || isg) ? 1 : edo;\n\n\t// filter: stereo TPT state variable\n\tfilt = v5_ft > 0.5 || v5_cut < 19000 || v5_fe != 0 || v5_trk != 0;\n\tfc = clamp(v5_cut * pow(2, v5_fe * 4 * exp(0 - v5_age / v5_fd) + v5_trk * sm / 12), 20, sr * 0.45);\n\tgg = tan(pi * fc / sr);\n\tkk = 2 - 1.96 * v5_res;\n\ta1 = 1 / (1 + gg * (gg + kk));\n\ta2 = gg * a1;\n\ta3 = gg * a2;\n\tv3 = xl - v5_s2l;\n\tv1 = a1 * v5_s1l + a2 * v3;\n\tv2 = v5_s2l + a2 * v5_s1l + a3 * v3;\n\thpl = xl - kk * v1 - v2;\n\tsell = v5_ft < 1.5 ? hpl : v1;\n\tfl = v5_ft < 0.5 ? v2 : sell;\n\tn1l = 2 * v1 - v5_s1l;\n\tn2l = 2 * v2 - v5_s2l;\n\tv3 = xr - v5_s2r;\n\tv1 = a1 * v5_s1r + a2 * v3;\n\tv2 = v5_s2r + a2 * v5_s1r + a3 * v3;\n\thpr = xr - kk * v1 - v2;\n\tselr = v5_ft < 1.5 ? hpr : v1;\n\tfrr = v5_ft < 0.5 ? v2 : selr;\n\tn1r = 2 * v1 - v5_s1r;\n\tn2r = 2 * v2 - v5_s2r;\n\tv5_s1l = filt ? n1l : v5_s1l;\n\tv5_s2l = filt ? n2l : v5_s2l;\n\tv5_s1r = filt ? n1r : v5_s1r;\n\tv5_s2r = filt ? n2r : v5_s2r;\n\txl = filt ? fl : xl;\n\txr = filt ? frr : xr;\n\n\t// width, pan, gain\n\tmid = (xl + xr) * 0.5;\n\tsid = (xl - xr) * 0.5 * v5_wid;\n\tenvo = gended ? 0 : env;\n\tamp = envo * edg * v5_duck * v5_gain;\n\toutl += (mid + sid) * amp * v5_pl;\n\toutr += (mid - sid) * amp * v5_pr;\n\tv5_act = (cutv || gended || outr0) ? 0 : v5_act;\n}\n\n// ---------- file mute (smoothed) --------------------------------------\nmgain = mgain + ((mutev > 0.5 ? 0 : 1) - mgain) * 0.002;\nout1 = outl * mgain;\nout2 = outr * mgain;\n\n// ---------- report to the brain (it captures Lock loops from these) ----\npoke(cf, pos, cb + 20, 0);\npoke(cf, wc, cb + 21, 0);\npoke(cf, lk, cb + 22, 0);\n\n// ---------- voice state: written only for voices that are playing\n\npoke(VS, v0_act, 0, 0);\nif (v0_act > 0.5) {\n\tpoke(VS, v0_pos, 1, 0);\n\tpoke(VS, v0_a, 2, 0);\n\tpoke(VS, v0_b, 3, 0);\n\tpoke(VS, v0_dir, 4, 0);\n\tpoke(VS, v0_age, 5, 0);\n\tpoke(VS, v0_gl, 6, 0);\n\tpoke(VS, v0_at, 7, 0);\n\tpoke(VS, v0_dc, 8, 0);\n\tpoke(VS, v0_gain, 9, 0);\n\tpoke(VS, v0_pl, 10, 0);\n\tpoke(VS, v0_pr, 11, 0);\n\tpoke(VS, v0_wid, 12, 0);\n\tpoke(VS, v0_semi, 13, 0);\n\tpoke(VS, v0_pe, 14, 0);\n\tpoke(VS, v0_pd, 15, 0);\n\tpoke(VS, v0_gfrom, 16, 0);\n\tpoke(VS, v0_gt, 17, 0);\n\tpoke(VS, v0_cut, 18, 0);\n\tpoke(VS, v0_res, 19, 0);\n\tpoke(VS, v0_fe, 20, 0);\n\tpoke(VS, v0_fd, 21, 0);\n\tpoke(VS, v0_trk, 22, 0);\n\tpoke(VS, v0_ft, 23, 0);\n\tpoke(VS, v0_eng, 24, 0);\n\tpoke(VS, v0_la, 25, 0);\n\tpoke(VS, v0_lb, 26, 0);\n\tpoke(VS, v0_kill, 27, 0);\n\tpoke(VS, v0_duck, 28, 0);\n\tpoke(VS, v0_ddir, 29, 0);\n\tpoke(VS, v0_pend, 30, 0);\n\tpoke(VS, v0_scan, 31, 0);\n\tpoke(VS, v0_gsz, 32, 0);\n\tpoke(VS, v0_gd, 33, 0);\n\tpoke(VS, v0_gj, 34, 0);\n\tpoke(VS, v0_gsp, 35, 0);\n\tpoke(VS, v0_s1l, 36, 0);\n\tpoke(VS, v0_s2l, 37, 0);\n\tpoke(VS, v0_s1r, 38, 0);\n\tpoke(VS, v0_s2r, 39, 0);\n\tpoke(VS, v0_slc, 40, 0);\n\tpoke(VS, v0_seed, 41, 0);\n\tpoke(VS, v0_jc, 42, 0);\n\tpoke(VS, v0_stn, 43, 0);\n\tpoke(VS, v0_lnn, 44, 0);\n\tpoke(VS, v0_lpn, 45, 0);\n\tpoke(VS, v0_g0ph, 46, 0);\n\tpoke(VS, v0_g0st, 47, 0);\n\tpoke(VS, v0_g0rt, 48, 0);\n\tpoke(VS, v0_g0al, 49, 0);\n\tpoke(VS, v0_g1ph, 50, 0);\n\tpoke(VS, v0_g1st, 51, 0);\n\tpoke(VS, v0_g1rt, 52, 0);\n\tpoke(VS, v0_g1al, 53, 0);\n\tpoke(VS, v0_g2ph, 54, 0);\n\tpoke(VS, v0_g2st, 55, 0);\n\tpoke(VS, v0_g2rt, 56, 0);\n\tpoke(VS, v0_g2al, 57, 0);\n\tpoke(VS, v0_g3ph, 58, 0);\n\tpoke(VS, v0_g3st, 59, 0);\n\tpoke(VS, v0_g3rt, 60, 0);\n\tpoke(VS, v0_g3al, 61, 0);\n}\npoke(VS, v1_act, 62, 0);\nif (v1_act > 0.5) {\n\tpoke(VS, v1_pos, 63, 0);\n\tpoke(VS, v1_a, 64, 0);\n\tpoke(VS, v1_b, 65, 0);\n\tpoke(VS, v1_dir, 66, 0);\n\tpoke(VS, v1_age, 67, 0);\n\tpoke(VS, v1_gl, 68, 0);\n\tpoke(VS, v1_at, 69, 0);\n\tpoke(VS, v1_dc, 70, 0);\n\tpoke(VS, v1_gain, 71, 0);\n\tpoke(VS, v1_pl, 72, 0);\n\tpoke(VS, v1_pr, 73, 0);\n\tpoke(VS, v1_wid, 74, 0);\n\tpoke(VS, v1_semi, 75, 0);\n\tpoke(VS, v1_pe, 76, 0);\n\tpoke(VS, v1_pd, 77, 0);\n\tpoke(VS, v1_gfrom, 78, 0);\n\tpoke(VS, v1_gt, 79, 0);\n\tpoke(VS, v1_cut, 80, 0);\n\tpoke(VS, v1_res, 81, 0);\n\tpoke(VS, v1_fe, 82, 0);\n\tpoke(VS, v1_fd, 83, 0);\n\tpoke(VS, v1_trk, 84, 0);\n\tpoke(VS, v1_ft, 85, 0);\n\tpoke(VS, v1_eng, 86, 0);\n\tpoke(VS, v1_la, 87, 0);\n\tpoke(VS, v1_lb, 88, 0);\n\tpoke(VS, v1_kill, 89, 0);\n\tpoke(VS, v1_duck, 90, 0);\n\tpoke(VS, v1_ddir, 91, 0);\n\tpoke(VS, v1_pend, 92, 0);\n\tpoke(VS, v1_scan, 93, 0);\n\tpoke(VS, v1_gsz, 94, 0);\n\tpoke(VS, v1_gd, 95, 0);\n\tpoke(VS, v1_gj, 96, 0);\n\tpoke(VS, v1_gsp, 97, 0);\n\tpoke(VS, v1_s1l, 98, 0);\n\tpoke(VS, v1_s2l, 99, 0);\n\tpoke(VS, v1_s1r, 100, 0);\n\tpoke(VS, v1_s2r, 101, 0);\n\tpoke(VS, v1_slc, 102, 0);\n\tpoke(VS, v1_seed, 103, 0);\n\tpoke(VS, v1_jc, 104, 0);\n\tpoke(VS, v1_stn, 105, 0);\n\tpoke(VS, v1_lnn, 106, 0);\n\tpoke(VS, v1_lpn, 107, 0);\n\tpoke(VS, v1_g0ph, 108, 0);\n\tpoke(VS, v1_g0st, 109, 0);\n\tpoke(VS, v1_g0rt, 110, 0);\n\tpoke(VS, v1_g0al, 111, 0);\n\tpoke(VS, v1_g1ph, 112, 0);\n\tpoke(VS, v1_g1st, 113, 0);\n\tpoke(VS, v1_g1rt, 114, 0);\n\tpoke(VS, v1_g1al, 115, 0);\n\tpoke(VS, v1_g2ph, 116, 0);\n\tpoke(VS, v1_g2st, 117, 0);\n\tpoke(VS, v1_g2rt, 118, 0);\n\tpoke(VS, v1_g2al, 119, 0);\n\tpoke(VS, v1_g3ph, 120, 0);\n\tpoke(VS, v1_g3st, 121, 0);\n\tpoke(VS, v1_g3rt, 122, 0);\n\tpoke(VS, v1_g3al, 123, 0);\n}\npoke(VS, v2_act, 124, 0);\nif (v2_act > 0.5) {\n\tpoke(VS, v2_pos, 125, 0);\n\tpoke(VS, v2_a, 126, 0);\n\tpoke(VS, v2_b, 127, 0);\n\tpoke(VS, v2_dir, 128, 0);\n\tpoke(VS, v2_age, 129, 0);\n\tpoke(VS, v2_gl, 130, 0);\n\tpoke(VS, v2_at, 131, 0);\n\tpoke(VS, v2_dc, 132, 0);\n\tpoke(VS, v2_gain, 133, 0);\n\tpoke(VS, v2_pl, 134, 0);\n\tpoke(VS, v2_pr, 135, 0);\n\tpoke(VS, v2_wid, 136, 0);\n\tpoke(VS, v2_semi, 137, 0);\n\tpoke(VS, v2_pe, 138, 0);\n\tpoke(VS, v2_pd, 139, 0);\n\tpoke(VS, v2_gfrom, 140, 0);\n\tpoke(VS, v2_gt, 141, 0);\n\tpoke(VS, v2_cut, 142, 0);\n\tpoke(VS, v2_res, 143, 0);\n\tpoke(VS, v2_fe, 144, 0);\n\tpoke(VS, v2_fd, 145, 0);\n\tpoke(VS, v2_trk, 146, 0);\n\tpoke(VS, v2_ft, 147, 0);\n\tpoke(VS, v2_eng, 148, 0);\n\tpoke(VS, v2_la, 149, 0);\n\tpoke(VS, v2_lb, 150, 0);\n\tpoke(VS, v2_kill, 151, 0);\n\tpoke(VS, v2_duck, 152, 0);\n\tpoke(VS, v2_ddir, 153, 0);\n\tpoke(VS, v2_pend, 154, 0);\n\tpoke(VS, v2_scan, 155, 0);\n\tpoke(VS, v2_gsz, 156, 0);\n\tpoke(VS, v2_gd, 157, 0);\n\tpoke(VS, v2_gj, 158, 0);\n\tpoke(VS, v2_gsp, 159, 0);\n\tpoke(VS, v2_s1l, 160, 0);\n\tpoke(VS, v2_s2l, 161, 0);\n\tpoke(VS, v2_s1r, 162, 0);\n\tpoke(VS, v2_s2r, 163, 0);\n\tpoke(VS, v2_slc, 164, 0);\n\tpoke(VS, v2_seed, 165, 0);\n\tpoke(VS, v2_jc, 166, 0);\n\tpoke(VS, v2_stn, 167, 0);\n\tpoke(VS, v2_lnn, 168, 0);\n\tpoke(VS, v2_lpn, 169, 0);\n\tpoke(VS, v2_g0ph, 170, 0);\n\tpoke(VS, v2_g0st, 171, 0);\n\tpoke(VS, v2_g0rt, 172, 0);\n\tpoke(VS, v2_g0al, 173, 0);\n\tpoke(VS, v2_g1ph, 174, 0);\n\tpoke(VS, v2_g1st, 175, 0);\n\tpoke(VS, v2_g1rt, 176, 0);\n\tpoke(VS, v2_g1al, 177, 0);\n\tpoke(VS, v2_g2ph, 178, 0);\n\tpoke(VS, v2_g2st, 179, 0);\n\tpoke(VS, v2_g2rt, 180, 0);\n\tpoke(VS, v2_g2al, 181, 0);\n\tpoke(VS, v2_g3ph, 182, 0);\n\tpoke(VS, v2_g3st, 183, 0);\n\tpoke(VS, v2_g3rt, 184, 0);\n\tpoke(VS, v2_g3al, 185, 0);\n}\npoke(VS, v3_act, 186, 0);\nif (v3_act > 0.5) {\n\tpoke(VS, v3_pos, 187, 0);\n\tpoke(VS, v3_a, 188, 0);\n\tpoke(VS, v3_b, 189, 0);\n\tpoke(VS, v3_dir, 190, 0);\n\tpoke(VS, v3_age, 191, 0);\n\tpoke(VS, v3_gl, 192, 0);\n\tpoke(VS, v3_at, 193, 0);\n\tpoke(VS, v3_dc, 194, 0);\n\tpoke(VS, v3_gain, 195, 0);\n\tpoke(VS, v3_pl, 196, 0);\n\tpoke(VS, v3_pr, 197, 0);\n\tpoke(VS, v3_wid, 198, 0);\n\tpoke(VS, v3_semi, 199, 0);\n\tpoke(VS, v3_pe, 200, 0);\n\tpoke(VS, v3_pd, 201, 0);\n\tpoke(VS, v3_gfrom, 202, 0);\n\tpoke(VS, v3_gt, 203, 0);\n\tpoke(VS, v3_cut, 204, 0);\n\tpoke(VS, v3_res, 205, 0);\n\tpoke(VS, v3_fe, 206, 0);\n\tpoke(VS, v3_fd, 207, 0);\n\tpoke(VS, v3_trk, 208, 0);\n\tpoke(VS, v3_ft, 209, 0);\n\tpoke(VS, v3_eng, 210, 0);\n\tpoke(VS, v3_la, 211, 0);\n\tpoke(VS, v3_lb, 212, 0);\n\tpoke(VS, v3_kill, 213, 0);\n\tpoke(VS, v3_duck, 214, 0);\n\tpoke(VS, v3_ddir, 215, 0);\n\tpoke(VS, v3_pend, 216, 0);\n\tpoke(VS, v3_scan, 217, 0);\n\tpoke(VS, v3_gsz, 218, 0);\n\tpoke(VS, v3_gd, 219, 0);\n\tpoke(VS, v3_gj, 220, 0);\n\tpoke(VS, v3_gsp, 221, 0);\n\tpoke(VS, v3_s1l, 222, 0);\n\tpoke(VS, v3_s2l, 223, 0);\n\tpoke(VS, v3_s1r, 224, 0);\n\tpoke(VS, v3_s2r, 225, 0);\n\tpoke(VS, v3_slc, 226, 0);\n\tpoke(VS, v3_seed, 227, 0);\n\tpoke(VS, v3_jc, 228, 0);\n\tpoke(VS, v3_stn, 229, 0);\n\tpoke(VS, v3_lnn, 230, 0);\n\tpoke(VS, v3_lpn, 231, 0);\n\tpoke(VS, v3_g0ph, 232, 0);\n\tpoke(VS, v3_g0st, 233, 0);\n\tpoke(VS, v3_g0rt, 234, 0);\n\tpoke(VS, v3_g0al, 235, 0);\n\tpoke(VS, v3_g1ph, 236, 0);\n\tpoke(VS, v3_g1st, 237, 0);\n\tpoke(VS, v3_g1rt, 238, 0);\n\tpoke(VS, v3_g1al, 239, 0);\n\tpoke(VS, v3_g2ph, 240, 0);\n\tpoke(VS, v3_g2st, 241, 0);\n\tpoke(VS, v3_g2rt, 242, 0);\n\tpoke(VS, v3_g2al, 243, 0);\n\tpoke(VS, v3_g3ph, 244, 0);\n\tpoke(VS, v3_g3st, 245, 0);\n\tpoke(VS, v3_g3rt, 246, 0);\n\tpoke(VS, v3_g3al, 247, 0);\n}\npoke(VS, v4_act, 248, 0);\nif (v4_act > 0.5) {\n\tpoke(VS, v4_pos, 249, 0);\n\tpoke(VS, v4_a, 250, 0);\n\tpoke(VS, v4_b, 251, 0);\n\tpoke(VS, v4_dir, 252, 0);\n\tpoke(VS, v4_age, 253, 0);\n\tpoke(VS, v4_gl, 254, 0);\n\tpoke(VS, v4_at, 255, 0);\n\tpoke(VS, v4_dc, 256, 0);\n\tpoke(VS, v4_gain, 257, 0);\n\tpoke(VS, v4_pl, 258, 0);\n\tpoke(VS, v4_pr, 259, 0);\n\tpoke(VS, v4_wid, 260, 0);\n\tpoke(VS, v4_semi, 261, 0);\n\tpoke(VS, v4_pe, 262, 0);\n\tpoke(VS, v4_pd, 263, 0);\n\tpoke(VS, v4_gfrom, 264, 0);\n\tpoke(VS, v4_gt, 265, 0);\n\tpoke(VS, v4_cut, 266, 0);\n\tpoke(VS, v4_res, 267, 0);\n\tpoke(VS, v4_fe, 268, 0);\n\tpoke(VS, v4_fd, 269, 0);\n\tpoke(VS, v4_trk, 270, 0);\n\tpoke(VS, v4_ft, 271, 0);\n\tpoke(VS, v4_eng, 272, 0);\n\tpoke(VS, v4_la, 273, 0);\n\tpoke(VS, v4_lb, 274, 0);\n\tpoke(VS, v4_kill, 275, 0);\n\tpoke(VS, v4_duck, 276, 0);\n\tpoke(VS, v4_ddir, 277, 0);\n\tpoke(VS, v4_pend, 278, 0);\n\tpoke(VS, v4_scan, 279, 0);\n\tpoke(VS, v4_gsz, 280, 0);\n\tpoke(VS, v4_gd, 281, 0);\n\tpoke(VS, v4_gj, 282, 0);\n\tpoke(VS, v4_gsp, 283, 0);\n\tpoke(VS, v4_s1l, 284, 0);\n\tpoke(VS, v4_s2l, 285, 0);\n\tpoke(VS, v4_s1r, 286, 0);\n\tpoke(VS, v4_s2r, 287, 0);\n\tpoke(VS, v4_slc, 288, 0);\n\tpoke(VS, v4_seed, 289, 0);\n\tpoke(VS, v4_jc, 290, 0);\n\tpoke(VS, v4_stn, 291, 0);\n\tpoke(VS, v4_lnn, 292, 0);\n\tpoke(VS, v4_lpn, 293, 0);\n\tpoke(VS, v4_g0ph, 294, 0);\n\tpoke(VS, v4_g0st, 295, 0);\n\tpoke(VS, v4_g0rt, 296, 0);\n\tpoke(VS, v4_g0al, 297, 0);\n\tpoke(VS, v4_g1ph, 298, 0);\n\tpoke(VS, v4_g1st, 299, 0);\n\tpoke(VS, v4_g1rt, 300, 0);\n\tpoke(VS, v4_g1al, 301, 0);\n\tpoke(VS, v4_g2ph, 302, 0);\n\tpoke(VS, v4_g2st, 303, 0);\n\tpoke(VS, v4_g2rt, 304, 0);\n\tpoke(VS, v4_g2al, 305, 0);\n\tpoke(VS, v4_g3ph, 306, 0);\n\tpoke(VS, v4_g3st, 307, 0);\n\tpoke(VS, v4_g3rt, 308, 0);\n\tpoke(VS, v4_g3al, 309, 0);\n}\npoke(VS, v5_act, 310, 0);\nif (v5_act > 0.5) {\n\tpoke(VS, v5_pos, 311, 0);\n\tpoke(VS, v5_a, 312, 0);\n\tpoke(VS, v5_b, 313, 0);\n\tpoke(VS, v5_dir, 314, 0);\n\tpoke(VS, v5_age, 315, 0);\n\tpoke(VS, v5_gl, 316, 0);\n\tpoke(VS, v5_at, 317, 0);\n\tpoke(VS, v5_dc, 318, 0);\n\tpoke(VS, v5_gain, 319, 0);\n\tpoke(VS, v5_pl, 320, 0);\n\tpoke(VS, v5_pr, 321, 0);\n\tpoke(VS, v5_wid, 322, 0);\n\tpoke(VS, v5_semi, 323, 0);\n\tpoke(VS, v5_pe, 324, 0);\n\tpoke(VS, v5_pd, 325, 0);\n\tpoke(VS, v5_gfrom, 326, 0);\n\tpoke(VS, v5_gt, 327, 0);\n\tpoke(VS, v5_cut, 328, 0);\n\tpoke(VS, v5_res, 329, 0);\n\tpoke(VS, v5_fe, 330, 0);\n\tpoke(VS, v5_fd, 331, 0);\n\tpoke(VS, v5_trk, 332, 0);\n\tpoke(VS, v5_ft, 333, 0);\n\tpoke(VS, v5_eng, 334, 0);\n\tpoke(VS, v5_la, 335, 0);\n\tpoke(VS, v5_lb, 336, 0);\n\tpoke(VS, v5_kill, 337, 0);\n\tpoke(VS, v5_duck, 338, 0);\n\tpoke(VS, v5_ddir, 339, 0);\n\tpoke(VS, v5_pend, 340, 0);\n\tpoke(VS, v5_scan, 341, 0);\n\tpoke(VS, v5_gsz, 342, 0);\n\tpoke(VS, v5_gd, 343, 0);\n\tpoke(VS, v5_gj, 344, 0);\n\tpoke(VS, v5_gsp, 345, 0);\n\tpoke(VS, v5_s1l, 346, 0);\n\tpoke(VS, v5_s2l, 347, 0);\n\tpoke(VS, v5_s1r, 348, 0);\n\tpoke(VS, v5_s2r, 349, 0);\n\tpoke(VS, v5_slc, 350, 0);\n\tpoke(VS, v5_seed, 351, 0);\n\tpoke(VS, v5_jc, 352, 0);\n\tpoke(VS, v5_stn, 353, 0);\n\tpoke(VS, v5_lnn, 354, 0);\n\tpoke(VS, v5_lpn, 355, 0);\n\tpoke(VS, v5_g0ph, 356, 0);\n\tpoke(VS, v5_g0st, 357, 0);\n\tpoke(VS, v5_g0rt, 358, 0);\n\tpoke(VS, v5_g0al, 359, 0);\n\tpoke(VS, v5_g1ph, 360, 0);\n\tpoke(VS, v5_g1st, 361, 0);\n\tpoke(VS, v5_g1rt, 362, 0);\n\tpoke(VS, v5_g1al, 363, 0);\n\tpoke(VS, v5_g2ph, 364, 0);\n\tpoke(VS, v5_g2st, 365, 0);\n\tpoke(VS, v5_g2rt, 366, 0);\n\tpoke(VS, v5_g2al, 367, 0);\n\tpoke(VS, v5_g3ph, 368, 0);\n\tpoke(VS, v5_g3st, 369, 0);\n\tpoke(VS, v5_g3rt, 370, 0);\n\tpoke(VS, v5_g3al, 371, 0);\n}\n\n\n",
         "fontface": 0,
         "fontname": "<Monospaced>",
         "fontsize": 12.0,
         "numinlets": 3,
         "numoutlets": 2,
         "outlettype": [
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
         "text": "in 2",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          140.0,
          20.0,
          40,
          22.0
         ],
         "id": "obj-3"
        }
       },
       {
        "box": {
         "maxclass": "newobj",
         "text": "in 3",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          260.0,
          20.0,
          40,
          22.0
         ],
         "id": "obj-4"
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
         "id": "obj-5"
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
          "obj-3",
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
          "obj-4",
          0
         ],
         "destination": [
          "obj-1",
          2
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
          "obj-5",
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
          "obj-6",
          0
         ]
        }
       }
      ]
     },
     "id": "obj-41"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "out~ 1",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      20,
      570,
      51,
      22.0
     ],
     "id": "obj-42"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "out~ 2",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      280,
      570,
      51,
      22.0
     ],
     "id": "obj-43"
    }
   },
   {
    "box": {
     "id": "obj-rebind",
     "maxclass": "comment",
     "text": "after each load: re-send slot number and buffer bindings (gen~ may have missed them while compiling)",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      180,
      190,
      360,
      20
     ],
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "sel 1",
     "numinlets": 2,
     "numoutlets": 2,
     "outlettype": [
      "bang",
      ""
     ],
     "patching_rect": [
      580,
      84,
      40,
      22
     ],
     "id": "obj-ver-sel"
    }
   },
   {
    "box": {
     "maxclass": "message",
     "text": "wanderer: voice engine 2026-10-08f - Quant tightness and global Pitch",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      580,
      110,
      330,
      22
     ],
     "id": "obj-ver-msg"
    }
   },
   {
    "box": {
     "maxclass": "newobj",
     "text": "print",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": [],
     "patching_rect": [
      580,
      136,
      40,
      22
     ],
     "id": "obj-ver-print"
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
      "obj-7",
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
      "obj-6",
      0
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
      "obj-7",
      1
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
      1
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
      1
     ],
     "destination": [
      "obj-13",
      1
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
      "obj-12",
      0
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
      "obj-11",
      1
     ],
     "destination": [
      "obj-16",
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
      "obj-18",
      0
     ],
     "destination": [
      "obj-19",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-21",
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
      5
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
      "obj-23",
      4
     ],
     "destination": [
      "obj-25",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-23",
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
      "obj-23",
      2
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
      "obj-23",
      1
     ],
     "destination": [
      "obj-12",
      1
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
      "obj-17",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-24",
      0
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
      "obj-26",
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
      "obj-38",
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
      "obj-39",
      0
     ],
     "destination": [
      "obj-41",
      1
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
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-30",
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
      "obj-31",
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
      "obj-32",
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
      "obj-33",
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
      "obj-34",
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
      "obj-35",
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
      "obj-36",
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
      "obj-25",
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
      "obj-28",
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
      "obj-16",
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
      "obj-41",
      1
     ],
     "destination": [
      "obj-43",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      2
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
      "obj-9",
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
      "obj-9",
      2
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
      "obj-9",
      2
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
      "obj-9",
      2
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
      "obj-9",
      2
     ],
     "destination": [
      "obj-34",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      2
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
      "obj-22",
      0
     ],
     "destination": [
      "obj-ver-sel",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-ver-sel",
      0
     ],
     "destination": [
      "obj-ver-msg",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-ver-msg",
      0
     ],
     "destination": [
      "obj-ver-print",
      0
     ]
    }
   }
  ]
 }
}