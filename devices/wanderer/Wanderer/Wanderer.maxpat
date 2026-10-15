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
			60.0,
			1800.0,
			1300.0
		],
		"openrect": [
			0.0,
			0.0,
			1136.0,
			169.0
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
		"boxanimatetime": 200,
		"enablehscroll": 1,
		"enablevscroll": 1,
		"devicewidth": 1136.0,
		"description": "Wanderer",
		"digest": "",
		"tags": "",
		"style": "",
		"subpatcher_template": "",
		"boxes": [
			{
				"box": {
					"id": "obj-1",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						40.0,
						300.0,
						140.0,
						22.0
					],
					"outlettype": [
						"signal",
						"signal",
						""
					],
					"text": "wanderer~ ---wnd"
				}
			},
			{
				"box": {
					"id": "obj-2",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						40.0,
						260.0,
						120.0,
						22.0
					],
					"outlettype": [
						"signal"
					],
					"text": "phasor~ 1n @lock 1"
				}
			},
			{
				"box": {
					"id": "obj-3",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						40.0,
						350.0,
						60.0,
						22.0
					],
					"text": "plugout~"
				}
			},
			{
				"box": {
					"id": "obj-4",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						40.0,
						20.0,
						90.0,
						22.0
					],
					"outlettype": [
						"bang",
						"int",
						"int"
					],
					"text": "live.thisdevice"
				}
			},
			{
				"box": {
					"id": "obj-5",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						40.0,
						50.0,
						60.0,
						22.0
					],
					"outlettype": [
						"bang",
						"bang",
						"bang"
					],
					"text": "t b b b"
				}
			},
			{
				"box": {
					"id": "obj-6",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						40.0,
						80.0,
						40.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "init"
				}
			},
			{
				"box": {
					"id": "obj-7",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						140.0,
						80.0,
						90.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "path live_set"
				}
			},
			{
				"box": {
					"id": "obj-8",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						140.0,
						110.0,
						70.0,
						22.0
					],
					"outlettype": [
						"",
						"",
						""
					],
					"text": "live.path"
				}
			},
			{
				"box": {
					"id": "obj-9",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						250.0,
						80.0,
						110.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "property is_playing"
				}
			},
			{
				"box": {
					"id": "obj-10",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 2,
					"patching_rect": [
						250.0,
						140.0,
						90.0,
						22.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "live.observer"
				}
			},
			{
				"box": {
					"id": "obj-11",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						250.0,
						170.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend playing"
				}
			},
			{
				"box": {
					"id": "obj-12",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						390.0,
						80.0,
						110.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "property tempo"
				}
			},
			{
				"box": {
					"id": "obj-13",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 2,
					"patching_rect": [
						390.0,
						140.0,
						90.0,
						22.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "live.observer"
				}
			},
			{
				"box": {
					"id": "obj-14",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						390.0,
						170.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend tempo"
				}
			},
			{
				"box": {
					"id": "obj-15",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						40.0,
						1100.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "r ---ld1"
				}
			},
			{
				"box": {
					"id": "obj-16",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						40.0,
						1128.0,
						90.0,
						22.0
					],
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ ---w1"
				}
			},
			{
				"box": {
					"id": "obj-17",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						40.0,
						1156.0,
						60.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "loaded 0"
				}
			},
			{
				"box": {
					"id": "obj-18",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						160.0,
						1100.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "r ---ld2"
				}
			},
			{
				"box": {
					"id": "obj-19",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						160.0,
						1128.0,
						90.0,
						22.0
					],
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ ---w2"
				}
			},
			{
				"box": {
					"id": "obj-20",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						160.0,
						1156.0,
						60.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "loaded 1"
				}
			},
			{
				"box": {
					"id": "obj-21",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						280.0,
						1100.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "r ---ld3"
				}
			},
			{
				"box": {
					"id": "obj-22",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						280.0,
						1128.0,
						90.0,
						22.0
					],
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ ---w3"
				}
			},
			{
				"box": {
					"id": "obj-23",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						280.0,
						1156.0,
						60.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "loaded 2"
				}
			},
			{
				"box": {
					"id": "obj-24",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						400.0,
						1100.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "r ---ld4"
				}
			},
			{
				"box": {
					"id": "obj-25",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						400.0,
						1128.0,
						90.0,
						22.0
					],
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ ---w4"
				}
			},
			{
				"box": {
					"id": "obj-26",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						400.0,
						1156.0,
						60.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "loaded 3"
				}
			},
			{
				"box": {
					"id": "obj-27",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						520.0,
						1100.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "r ---ld5"
				}
			},
			{
				"box": {
					"id": "obj-28",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						520.0,
						1128.0,
						90.0,
						22.0
					],
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ ---w5"
				}
			},
			{
				"box": {
					"id": "obj-29",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						520.0,
						1156.0,
						60.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "loaded 4"
				}
			},
			{
				"box": {
					"id": "obj-30",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						640.0,
						1100.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "r ---ld6"
				}
			},
			{
				"box": {
					"id": "obj-31",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						640.0,
						1128.0,
						90.0,
						22.0
					],
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ ---w6"
				}
			},
			{
				"box": {
					"id": "obj-32",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						640.0,
						1156.0,
						60.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "loaded 5"
				}
			},
			{
				"box": {
					"id": "obj-33",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						760.0,
						1100.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "r ---ld7"
				}
			},
			{
				"box": {
					"id": "obj-34",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						760.0,
						1128.0,
						90.0,
						22.0
					],
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ ---w7"
				}
			},
			{
				"box": {
					"id": "obj-35",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						760.0,
						1156.0,
						60.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "loaded 6"
				}
			},
			{
				"box": {
					"id": "obj-36",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						880.0,
						1100.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "r ---ld8"
				}
			},
			{
				"box": {
					"id": "obj-37",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						880.0,
						1128.0,
						90.0,
						22.0
					],
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ ---w8"
				}
			},
			{
				"box": {
					"id": "obj-38",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						880.0,
						1156.0,
						60.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "loaded 7"
				}
			},
			{
				"box": {
					"id": "obj-39",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						40.0,
						1210.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "r ---ld9"
				}
			},
			{
				"box": {
					"id": "obj-40",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						40.0,
						1238.0,
						90.0,
						22.0
					],
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ ---w9"
				}
			},
			{
				"box": {
					"id": "obj-41",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						40.0,
						1266.0,
						60.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "loaded 8"
				}
			},
			{
				"box": {
					"id": "obj-42",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						160.0,
						1210.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "r ---ld10"
				}
			},
			{
				"box": {
					"id": "obj-43",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						160.0,
						1238.0,
						90.0,
						22.0
					],
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ ---w10"
				}
			},
			{
				"box": {
					"id": "obj-44",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						160.0,
						1266.0,
						60.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "loaded 9"
				}
			},
			{
				"box": {
					"id": "obj-45",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						280.0,
						1210.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "r ---ld11"
				}
			},
			{
				"box": {
					"id": "obj-46",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						280.0,
						1238.0,
						90.0,
						22.0
					],
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ ---w11"
				}
			},
			{
				"box": {
					"id": "obj-47",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						280.0,
						1266.0,
						60.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "loaded 10"
				}
			},
			{
				"box": {
					"id": "obj-48",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						400.0,
						1210.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "r ---ld12"
				}
			},
			{
				"box": {
					"id": "obj-49",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						400.0,
						1238.0,
						90.0,
						22.0
					],
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ ---w12"
				}
			},
			{
				"box": {
					"id": "obj-50",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						400.0,
						1266.0,
						60.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "loaded 11"
				}
			},
			{
				"box": {
					"id": "obj-51",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						520.0,
						1210.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "r ---ld13"
				}
			},
			{
				"box": {
					"id": "obj-52",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						520.0,
						1238.0,
						90.0,
						22.0
					],
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ ---w13"
				}
			},
			{
				"box": {
					"id": "obj-53",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						520.0,
						1266.0,
						60.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "loaded 12"
				}
			},
			{
				"box": {
					"id": "obj-54",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						640.0,
						1210.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "r ---ld14"
				}
			},
			{
				"box": {
					"id": "obj-55",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						640.0,
						1238.0,
						90.0,
						22.0
					],
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ ---w14"
				}
			},
			{
				"box": {
					"id": "obj-56",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						640.0,
						1266.0,
						60.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "loaded 13"
				}
			},
			{
				"box": {
					"id": "obj-57",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						760.0,
						1210.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "r ---ld15"
				}
			},
			{
				"box": {
					"id": "obj-58",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						760.0,
						1238.0,
						90.0,
						22.0
					],
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ ---w15"
				}
			},
			{
				"box": {
					"id": "obj-59",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						760.0,
						1266.0,
						60.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "loaded 14"
				}
			},
			{
				"box": {
					"id": "obj-60",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"patching_rect": [
						880.0,
						1210.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "r ---ld16"
				}
			},
			{
				"box": {
					"id": "obj-61",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						880.0,
						1238.0,
						90.0,
						22.0
					],
					"outlettype": [
						"float",
						"bang"
					],
					"text": "buffer~ ---w16"
				}
			},
			{
				"box": {
					"id": "obj-62",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						880.0,
						1266.0,
						60.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "loaded 15"
				}
			},
			{
				"box": {
					"id": "obj-63",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						600.0,
						300.0,
						82.0,
						22.0
					],
					"outlettype": [
						"",
						"",
						""
					],
					"text": "pattr state",
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "State",
							"parameter_shortname": "State",
							"parameter_type": 3,
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 1,
							"parameter_invisible": 1
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-64",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 7,
					"patching_rect": [
						200.0,
						400.0,
						330.0,
						22.0
					],
					"outlettype": [
						"",
						"",
						"",
						"",
						"",
						"",
						""
					],
					"text": "route fstate cleararm gset getstate dictionary relink"
				}
			},
			{
				"box": {
					"id": "obj-65",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						420.0,
						430.0,
						30.0,
						22.0
					],
					"outlettype": [
						"bang"
					],
					"text": "t b"
				}
			},
			{
				"box": {
					"id": "obj-66",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						480.0,
						460.0,
						110.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend dictionary"
				}
			},
			{
				"box": {
					"id": "obj-67",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						560.0,
						430.0,
						100.0,
						22.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "opendialog sound"
				}
			},
			{
				"box": {
					"id": "obj-68",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						560.0,
						460.0,
						110.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend relinkpath"
				}
			},
			{
				"box": {
					"id": "obj-69",
					"maxclass": "panel",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						900.0,
						20.0,
						60.0,
						30.0
					],
					"presentation": 1,
					"presentation_rect": [
						0.0,
						0.0,
						1136.0,
						169.0
					],
					"bgcolor": [
						0.239,
						0.243,
						0.255,
						1.0
					],
					"border": 0,
					"rounded": 0,
					"ignoreclick": 1
				}
			},
			{
				"box": {
					"id": "obj-70",
					"maxclass": "panel",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						970.0,
						20.0,
						40.0,
						30.0
					],
					"presentation": 1,
					"presentation_rect": [
						6.0,
						4.0,
						48.0,
						161.0
					],
					"bgcolor": [
						0.11,
						0.114,
						0.125,
						1.0
					],
					"border": 0,
					"rounded": 6,
					"ignoreclick": 1
				}
			},
			{
				"box": {
					"id": "obj-71",
					"maxclass": "panel",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						970.0,
						20.0,
						40.0,
						30.0
					],
					"presentation": 1,
					"presentation_rect": [
						59.0,
						4.0,
						262.0,
						161.0
					],
					"bgcolor": [
						0.11,
						0.114,
						0.125,
						1.0
					],
					"border": 0,
					"rounded": 6,
					"ignoreclick": 1
				}
			},
			{
				"box": {
					"id": "obj-72",
					"maxclass": "panel",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						970.0,
						20.0,
						40.0,
						30.0
					],
					"presentation": 1,
					"presentation_rect": [
						326.0,
						4.0,
						227.0,
						161.0
					],
					"bgcolor": [
						0.11,
						0.114,
						0.125,
						1.0
					],
					"border": 0,
					"rounded": 6,
					"ignoreclick": 1
				}
			},
			{
				"box": {
					"id": "obj-73",
					"maxclass": "panel",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						970.0,
						20.0,
						40.0,
						30.0
					],
					"presentation": 1,
					"presentation_rect": [
						558.0,
						4.0,
						295.0,
						161.0
					],
					"bgcolor": [
						0.11,
						0.114,
						0.125,
						1.0
					],
					"border": 0,
					"rounded": 6,
					"ignoreclick": 1
				}
			},
			{
				"box": {
					"id": "obj-74",
					"maxclass": "panel",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						970.0,
						20.0,
						40.0,
						30.0
					],
					"presentation": 1,
					"presentation_rect": [
						858.0,
						4.0,
						103.0,
						161.0
					],
					"bgcolor": [
						0.11,
						0.114,
						0.125,
						1.0
					],
					"border": 0,
					"rounded": 6,
					"ignoreclick": 1
				}
			},
			{
				"box": {
					"id": "obj-75",
					"maxclass": "panel",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						970.0,
						20.0,
						40.0,
						30.0
					],
					"presentation": 1,
					"presentation_rect": [
						966.0,
						4.0,
						56.0,
						161.0
					],
					"bgcolor": [
						0.11,
						0.114,
						0.125,
						1.0
					],
					"border": 0,
					"rounded": 6,
					"ignoreclick": 1
				}
			},
			{
				"box": {
					"id": "obj-76",
					"maxclass": "panel",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						970.0,
						20.0,
						40.0,
						30.0
					],
					"presentation": 1,
					"presentation_rect": [
						1027.0,
						4.0,
						103.0,
						161.0
					],
					"bgcolor": [
						0.11,
						0.114,
						0.125,
						1.0
					],
					"border": 0,
					"rounded": 6,
					"ignoreclick": 1
				}
			},
			{
				"box": {
					"id": "obj-77",
					"maxclass": "jsui",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						40.0,
						500.0,
						36.0,
						134.0
					],
					"outlettype": [
						""
					],
					"presentation": 1,
					"presentation_rect": [
						12.0,
						8.0,
						36.0,
						134.0
					],
					"filename": "wanderer.files.js",
					"parameter_enable": 0,
					"border": 0,
					"annotation": "The 16 file slots. Click one to show and edit it. Teal = loaded, red = not found (click to find it), amber bar = locked, grey bar = muted.",
					"annotation_name": "Files"
				}
			},
			{
				"box": {
					"id": "obj-78",
					"maxclass": "live.drop",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						40.0,
						650.0,
						36.0,
						15.0
					],
					"outlettype": [
						"",
						""
					],
					"presentation": 1,
					"presentation_rect": [
						12.0,
						146.0,
						36.0,
						15.0
					],
					"legend": "Drop",
					"varname": "drop",
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_invisible": 2,
							"parameter_longname": "Drop",
							"parameter_shortname": "Drop",
							"parameter_type": 4
						}
					},
					"annotation": "Drop audio files here. A file goes into the selected slot if it is empty, otherwise into the next empty one.",
					"annotation_name": "Drop",
					"fontsize": 8.0,
					"textcolor": [
						0.31,
						0.765,
						0.753,
						1.0
					],
					"bordercolor": [
						0.31,
						0.765,
						0.753,
						0.8
					]
				}
			},
			{
				"box": {
					"id": "obj-79",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						40.0,
						680.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend drop"
				}
			},
			{
				"box": {
					"id": "obj-80",
					"maxclass": "jsui",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						100.0,
						500.0,
						250.0,
						134.0
					],
					"outlettype": [
						""
					],
					"presentation": 1,
					"presentation_rect": [
						65.0,
						8.0,
						250.0,
						134.0
					],
					"filename": "wanderer.wave.js",
					"parameter_enable": 0,
					"border": 0,
					"annotation": "The selected file and its slices. Click a slice: switch it off or on. In Weighted order, drag up or down in a slice to set how often it plays.",
					"annotation_name": "Waveform"
				}
			},
			{
				"box": {
					"id": "obj-81",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1500.0,
						560.0,
						60.0,
						17.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "Free",
					"presentation": 1,
					"presentation_rect": [
						65.0,
						146.0,
						33.142857142857146,
						15.0
					],
					"texton": "Free",
					"mode": 1,
					"parameter_enable": 0,
					"annotation": "Free: this file keeps inventing new hits. Lock: it repeats the last bars it played as a loop (Bars sets the length).",
					"annotation_name": "Free / Lock",
					"fontsize": 8.5,
					"activebgoncolor": [
						0.31,
						0.765,
						0.753,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.31,
						0.765,
						0.753,
						1.0
					],
					"textcolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"rounded": 3
				}
			},
			{
				"box": {
					"id": "obj-82",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1570.0,
						560.0,
						60.0,
						17.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "Lock",
					"presentation": 1,
					"presentation_rect": [
						101.14285714285714,
						146.0,
						33.142857142857146,
						15.0
					],
					"texton": "Lock",
					"mode": 1,
					"parameter_enable": 0,
					"annotation": "Free: this file keeps inventing new hits. Lock: it repeats the last bars it played as a loop (Bars sets the length).",
					"annotation_name": "Free / Lock",
					"fontsize": 8.5,
					"activebgoncolor": [
						0.949,
						0.722,
						0.294,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.949,
						0.722,
						0.294,
						1.0
					],
					"textcolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"rounded": 3
				}
			},
			{
				"box": {
					"id": "obj-83",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						1500.0,
						590.0,
						50.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "flock 0"
				}
			},
			{
				"box": {
					"id": "obj-84",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						1570.0,
						590.0,
						50.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "flock 1"
				}
			},
			{
				"box": {
					"id": "obj-85",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1500.0,
						575.0,
						24.0,
						22.0
					],
					"outlettype": [
						"bang"
					],
					"text": "t b"
				}
			},
			{
				"box": {
					"id": "obj-86",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1570.0,
						575.0,
						24.0,
						22.0
					],
					"outlettype": [
						"bang"
					],
					"text": "t b"
				}
			},
			{
				"box": {
					"id": "obj-87",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1500.0,
						640.0,
						60.0,
						17.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "Mute",
					"presentation": 1,
					"presentation_rect": [
						137.28571428571428,
						146.0,
						33.142857142857146,
						15.0
					],
					"texton": "Mute",
					"mode": 1,
					"varname": "Mute",
					"annotation": "Silences this file (it keeps its place in time).",
					"annotation_name": "Mute",
					"fontsize": 8.5,
					"activebgoncolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"activebgcolor": [
						0.85,
						0.85,
						0.85,
						0.25
					],
					"textcolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"bordercolor": [
						0.85,
						0.85,
						0.85,
						0.9
					],
					"rounded": 3,
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-88",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1500.0,
						670.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend fmute"
				}
			},
			{
				"box": {
					"id": "obj-89",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1580.0,
						640.0,
						60.0,
						17.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "Init",
					"presentation": 1,
					"presentation_rect": [
						173.42857142857144,
						146.0,
						33.142857142857146,
						15.0
					],
					"texton": "Init",
					"mode": 0,
					"varname": "Init",
					"annotation": "This file's settings back to their defaults (its slicing stays).",
					"annotation_name": "Init",
					"fontsize": 8.5,
					"activebgoncolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"activebgcolor": [
						0.85,
						0.85,
						0.85,
						0.25
					],
					"textcolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"bordercolor": [
						0.85,
						0.85,
						0.85,
						0.9
					],
					"rounded": 3,
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-90",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1580.0,
						670.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend finit"
				}
			},
			{
				"box": {
					"id": "obj-91",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1660.0,
						640.0,
						60.0,
						17.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "Clear",
					"presentation": 1,
					"presentation_rect": [
						209.57142857142858,
						146.0,
						33.142857142857146,
						15.0
					],
					"texton": "Clear",
					"mode": 0,
					"varname": "Clear",
					"annotation": "Empties this slot.",
					"annotation_name": "Clear",
					"fontsize": 8.5,
					"activebgoncolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"activebgcolor": [
						0.85,
						0.85,
						0.85,
						0.25
					],
					"textcolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"bordercolor": [
						0.85,
						0.85,
						0.85,
						0.9
					],
					"rounded": 3,
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-92",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1660.0,
						670.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend fclear"
				}
			},
			{
				"box": {
					"id": "obj-93",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1740.0,
						640.0,
						60.0,
						17.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "Random file",
					"presentation": 1,
					"presentation_rect": [
						245.71428571428572,
						146.0,
						69.28571428571429,
						15.0
					],
					"texton": "Random file",
					"mode": 0,
					"varname": "Random file",
					"annotation": "New random settings for this file (Depth: Random All's). If it is locked, it also gets a fresh loop.",
					"annotation_name": "Random file",
					"fontsize": 8.5,
					"activebgoncolor": [
						0.31,
						0.765,
						0.753,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.31,
						0.765,
						0.753,
						1.0
					],
					"activebgcolor": [
						0.31,
						0.765,
						0.753,
						0.25
					],
					"textcolor": [
						0.31,
						0.765,
						0.753,
						1.0
					],
					"bordercolor": [
						0.31,
						0.765,
						0.753,
						0.9
					],
					"rounded": 3,
					"parameter_enable": 0
				}
			},
			{
				"box": {
					"id": "obj-94",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1740.0,
						670.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend frand"
				}
			},
			{
				"box": {
					"id": "obj-95",
					"maxclass": "jsui",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						400.0,
						500.0,
						215.0,
						153.0
					],
					"outlettype": [
						""
					],
					"presentation": 1,
					"presentation_rect": [
						332.0,
						8.0,
						215.0,
						153.0
					],
					"filename": "wanderer.page.js",
					"parameter_enable": 0,
					"border": 0,
					"annotation": "The selected file's settings. Left: the tabs. Drag a dial: its value. Drag its thin outer ring: how much it varies on every hit (scaled by Chaos). Click the text under a dial: fixed, rnd (a new value each hit) or walk (drifts from hit to hit). Double-click: default. Shift: fine.",
					"annotation_name": "File settings"
				}
			},
			{
				"box": {
					"id": "obj-96",
					"maxclass": "live.comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1000.0,
						135.0,
						80.0,
						18.0
					],
					"text": "GROOVE",
					"presentation": 1,
					"presentation_rect": [
						561.0,
						5.0,
						144.0,
						14.0
					],
					"textcolor": [
						0.416,
						0.659,
						0.941,
						1.0
					],
					"fontname": "Ableton Sans Bold",
					"fontsize": 9.5,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-97",
					"maxclass": "panel",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1100.0,
						136.0,
						80.0,
						2.0
					],
					"presentation": 1,
					"presentation_rect": [
						564.0,
						19.0,
						138.0,
						2.0
					],
					"bgcolor": [
						0.416,
						0.659,
						0.941,
						0.55
					],
					"border": 0,
					"rounded": 1,
					"ignoreclick": 1
				}
			},
			{
				"box": {
					"id": "obj-98",
					"maxclass": "live.comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1000.0,
						137.0,
						80.0,
						18.0
					],
					"text": "SHAPE",
					"presentation": 1,
					"presentation_rect": [
						706.0,
						5.0,
						144.0,
						14.0
					],
					"textcolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"fontname": "Ableton Sans Bold",
					"fontsize": 9.5,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-99",
					"maxclass": "panel",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1100.0,
						138.0,
						80.0,
						2.0
					],
					"presentation": 1,
					"presentation_rect": [
						709.0,
						19.0,
						138.0,
						2.0
					],
					"bgcolor": [
						0.941,
						0.627,
						0.314,
						0.55
					],
					"border": 0,
					"rounded": 1,
					"ignoreclick": 1
				}
			},
			{
				"box": {
					"id": "obj-100",
					"maxclass": "panel",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1100.0,
						900.0,
						2.0,
						40.0
					],
					"presentation": 1,
					"presentation_rect": [
						705.0,
						24.0,
						1.0,
						114.0
					],
					"bgcolor": [
						0.18,
						0.184,
						0.204,
						1.0
					],
					"border": 0,
					"rounded": 0,
					"ignoreclick": 1
				}
			},
			{
				"box": {
					"id": "obj-101",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						700.0,
						600.0,
						44.0,
						48.0
					],
					"outlettype": [
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						564.0,
						24.0,
						44.0,
						50.0
					],
					"varname": "Quant",
					"parameter_enable": 1,
					"annotation": "How tightly hits are pulled onto the grid set by Quant to. 0 = loose (swing and feel as set), 100 = on the grid, straight.",
					"annotation_name": "Quant",
					"fontsize": 8.5,
					"activedialcolor": [
						0.416,
						0.659,
						0.941,
						1.0
					],
					"activeneedlecolor": [
						0.416,
						0.659,
						0.941,
						1.0
					],
					"dialcolor": [
						0.055,
						0.055,
						0.063,
						1.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"showname": 1,
					"shownumber": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Quant",
							"parameter_shortname": "Quant",
							"parameter_type": 0,
							"parameter_mmin": 0,
							"parameter_mmax": 100,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 5
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-102",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						700.0,
						655.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend quant"
				}
			},
			{
				"box": {
					"id": "obj-103",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						760.0,
						600.0,
						44.0,
						48.0
					],
					"outlettype": [
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						611.0,
						24.0,
						44.0,
						50.0
					],
					"varname": "Density",
					"parameter_enable": 1,
					"annotation": "More or fewer hits for every file. Below 0 some hits become rests, so the rhythm keeps its shape.",
					"annotation_name": "Density",
					"fontsize": 8.5,
					"activedialcolor": [
						0.416,
						0.659,
						0.941,
						1.0
					],
					"activeneedlecolor": [
						0.416,
						0.659,
						0.941,
						1.0
					],
					"dialcolor": [
						0.055,
						0.055,
						0.063,
						1.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"showname": 1,
					"shownumber": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Density",
							"parameter_shortname": "Density",
							"parameter_type": 0,
							"parameter_mmin": -100,
							"parameter_mmax": 100,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 0
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-104",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						760.0,
						655.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend gdensity"
				}
			},
			{
				"box": {
					"id": "obj-105",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						820.0,
						600.0,
						44.0,
						48.0
					],
					"outlettype": [
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						658.0,
						24.0,
						44.0,
						50.0
					],
					"varname": "Length",
					"parameter_enable": 1,
					"annotation": "Every sound fuller (+) or shorter (-): Start, Length, Gate and release together.",
					"annotation_name": "Length",
					"fontsize": 8.5,
					"activedialcolor": [
						0.416,
						0.659,
						0.941,
						1.0
					],
					"activeneedlecolor": [
						0.416,
						0.659,
						0.941,
						1.0
					],
					"dialcolor": [
						0.055,
						0.055,
						0.063,
						1.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"showname": 1,
					"shownumber": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Length",
							"parameter_shortname": "Length",
							"parameter_type": 0,
							"parameter_mmin": -100,
							"parameter_mmax": 100,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 0
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-106",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						820.0,
						655.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend glen"
				}
			},
			{
				"box": {
					"id": "obj-107",
					"maxclass": "live.comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1200.0,
						146.0,
						60.0,
						18.0
					],
					"text": "Quant to",
					"presentation": 1,
					"presentation_rect": [
						562.0,
						80.0,
						48.0,
						13.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"fontsize": 8.5,
					"textjustification": 1
				}
			},
			{
				"box": {
					"id": "obj-108",
					"maxclass": "live.comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1200.0,
						147.0,
						60.0,
						18.0
					],
					"text": "Mode",
					"presentation": 1,
					"presentation_rect": [
						609.0,
						80.0,
						48.0,
						13.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"fontsize": 8.5,
					"textjustification": 1
				}
			},
			{
				"box": {
					"id": "obj-109",
					"maxclass": "live.comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1200.0,
						148.0,
						60.0,
						18.0
					],
					"text": "Bars",
					"presentation": 1,
					"presentation_rect": [
						656.0,
						80.0,
						48.0,
						13.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"fontsize": 8.5,
					"textjustification": 1
				}
			},
			{
				"box": {
					"id": "obj-110",
					"maxclass": "live.tab",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						1300.0,
						600.0,
						60.0,
						30.0
					],
					"outlettype": [
						"",
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						564.0,
						95.0,
						44.0,
						27.0
					],
					"num_lines_patching": 2,
					"num_lines_presentation": 2,
					"varname": "Quant To",
					"annotation": "The grid Quant pulls hits onto. Triplet waits use triplet lines when Trip is allowed.",
					"annotation_name": "Quant To",
					"activebgoncolor": [
						0.416,
						0.659,
						0.941,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.416,
						0.659,
						0.941,
						1.0
					],
					"textcolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"fontsize": 7.5,
					"rounded": 3,
					"spacing_x": 2,
					"spacing_y": 2,
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Quant To",
							"parameter_shortname": "Quant to",
							"parameter_type": 2,
							"parameter_mmin": 0,
							"parameter_mmax": 3,
							"parameter_initial": [
								2
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 9,
							"parameter_enum": [
								"1/4",
								"1/8",
								"1/16",
								"1/32"
							]
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-111",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1300.0,
						640.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend qhit"
				}
			},
			{
				"box": {
					"id": "obj-112",
					"maxclass": "live.tab",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						1380.0,
						600.0,
						60.0,
						30.0
					],
					"outlettype": [
						"",
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						611.0,
						95.0,
						44.0,
						27.0
					],
					"num_lines_patching": 2,
					"num_lines_presentation": 2,
					"varname": "Lock Mode",
					"annotation": "Free / Lock for every file at once (each file can still be switched on its own).",
					"annotation_name": "Lock Mode",
					"activebgoncolor": [
						0.949,
						0.722,
						0.294,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.949,
						0.722,
						0.294,
						1.0
					],
					"textcolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"fontsize": 7.5,
					"rounded": 3,
					"spacing_x": 2,
					"spacing_y": 2,
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Lock Mode",
							"parameter_shortname": "Mode",
							"parameter_type": 2,
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 9,
							"parameter_enum": [
								"Free",
								"Lock"
							]
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-113",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1380.0,
						640.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend glock"
				}
			},
			{
				"box": {
					"id": "obj-114",
					"maxclass": "live.tab",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						1460.0,
						600.0,
						60.0,
						30.0
					],
					"outlettype": [
						"",
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						658.0,
						95.0,
						44.0,
						27.0
					],
					"num_lines_patching": 2,
					"num_lines_presentation": 2,
					"varname": "Lock Bars",
					"annotation": "How many bars Lock keeps as a loop.",
					"annotation_name": "Lock Bars",
					"activebgoncolor": [
						0.949,
						0.722,
						0.294,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.949,
						0.722,
						0.294,
						1.0
					],
					"textcolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"fontsize": 7.5,
					"rounded": 3,
					"spacing_x": 2,
					"spacing_y": 2,
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Lock Bars",
							"parameter_shortname": "Bars",
							"parameter_type": 2,
							"parameter_mmin": 0,
							"parameter_mmax": 3,
							"parameter_initial": [
								1
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 9,
							"parameter_enum": [
								"1",
								"2",
								"4",
								"8"
							]
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-115",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1460.0,
						640.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend locklen"
				}
			},
			{
				"box": {
					"id": "obj-116",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						880.0,
						600.0,
						44.0,
						48.0
					],
					"outlettype": [
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						709.0,
						24.0,
						44.0,
						50.0
					],
					"varname": "Macro",
					"parameter_enable": 1,
					"annotation": "All files at once: 0 = clean (every knob toward neutral), 100 = as set, up to 175 = exaggerated.",
					"annotation_name": "Macro",
					"fontsize": 8.5,
					"activedialcolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"activeneedlecolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"dialcolor": [
						0.055,
						0.055,
						0.063,
						1.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"showname": 1,
					"shownumber": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Macro",
							"parameter_shortname": "Macro",
							"parameter_type": 0,
							"parameter_mmin": 0,
							"parameter_mmax": 175,
							"parameter_initial": [
								100
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 5
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-117",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						880.0,
						655.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend macro"
				}
			},
			{
				"box": {
					"id": "obj-118",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						940.0,
						600.0,
						44.0,
						48.0
					],
					"outlettype": [
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						756.0,
						24.0,
						44.0,
						50.0
					],
					"varname": "Chaos",
					"parameter_enable": 1,
					"annotation": "How much the per-hit ranges vary every hit. 50 = as drawn, 0 = no variation, 100 = double.",
					"annotation_name": "Chaos",
					"fontsize": 8.5,
					"activedialcolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"activeneedlecolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"dialcolor": [
						0.055,
						0.055,
						0.063,
						1.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"showname": 1,
					"shownumber": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Chaos",
							"parameter_shortname": "Chaos",
							"parameter_type": 0,
							"parameter_mmin": 0,
							"parameter_mmax": 100,
							"parameter_initial": [
								50
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 5
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-119",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						940.0,
						655.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend chaos"
				}
			},
			{
				"box": {
					"id": "obj-120",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1000.0,
						600.0,
						44.0,
						48.0
					],
					"outlettype": [
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						803.0,
						24.0,
						44.0,
						50.0
					],
					"varname": "Mutate",
					"parameter_enable": 1,
					"annotation": "Locked loops slowly change: after each pass, this share of hits gets a new slice and new values.",
					"annotation_name": "Mutate",
					"fontsize": 8.5,
					"activedialcolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"activeneedlecolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"dialcolor": [
						0.055,
						0.055,
						0.063,
						1.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"showname": 1,
					"shownumber": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Mutate",
							"parameter_shortname": "Mutate",
							"parameter_type": 0,
							"parameter_mmin": 0,
							"parameter_mmax": 100,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 5
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-121",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1000.0,
						655.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend mutate"
				}
			},
			{
				"box": {
					"id": "obj-122",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1060.0,
						600.0,
						44.0,
						48.0
					],
					"outlettype": [
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						709.0,
						82.0,
						44.0,
						50.0
					],
					"varname": "Pitch",
					"parameter_enable": 1,
					"annotation": "Transposes every file.",
					"annotation_name": "Pitch",
					"fontsize": 8.5,
					"activedialcolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"activeneedlecolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"dialcolor": [
						0.055,
						0.055,
						0.063,
						1.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"showname": 1,
					"shownumber": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Pitch",
							"parameter_shortname": "Pitch",
							"parameter_type": 0,
							"parameter_mmin": -24,
							"parameter_mmax": 24,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 7
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-123",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1060.0,
						655.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend gpitch"
				}
			},
			{
				"box": {
					"id": "obj-124",
					"maxclass": "live.comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1200.0,
						163.0,
						60.0,
						18.0
					],
					"text": "Scale",
					"presentation": 1,
					"presentation_rect": [
						754.0,
						80.0,
						48.0,
						13.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"fontsize": 8.5,
					"textjustification": 1
				}
			},
			{
				"box": {
					"id": "obj-125",
					"maxclass": "live.menu",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						1400.0,
						900.0,
						80.0,
						15.0
					],
					"outlettype": [
						"",
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						756.0,
						95.0,
						44.0,
						14.0
					],
					"varname": "Scale",
					"parameter_enable": 1,
					"annotation": "Per-hit pitch changes and repeat steps snap to this scale.",
					"annotation_name": "Scale",
					"fontsize": 8.0,
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"arrowcolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Scale",
							"parameter_shortname": "Scale",
							"parameter_type": 2,
							"parameter_mmin": 0,
							"parameter_mmax": 11,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 9,
							"parameter_enum": [
								"Chrom",
								"Major",
								"Minor",
								"Dorian",
								"Phryg",
								"Lydian",
								"Mixo",
								"HarMin",
								"MajPen",
								"MinPen",
								"Fifths",
								"Octave"
							]
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-126",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1400.0,
						930.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend gscale"
				}
			},
			{
				"box": {
					"id": "obj-127",
					"maxclass": "live.comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1200.0,
						166.0,
						60.0,
						18.0
					],
					"text": "Allow",
					"presentation": 1,
					"presentation_rect": [
						801.0,
						80.0,
						48.0,
						13.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"fontsize": 8.5,
					"textjustification": 1
				}
			},
			{
				"box": {
					"id": "obj-128",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1500.0,
						800.0,
						60.0,
						17.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "Trip",
					"presentation": 1,
					"presentation_rect": [
						803.0,
						95.0,
						20.5,
						12.0
					],
					"texton": "Trip",
					"mode": 1,
					"varname": "Allow Trip",
					"annotation": "Allow triplet waits (and triplet repeat spacing).",
					"annotation_name": "Allow Trip",
					"fontsize": 7.0,
					"activebgoncolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"activebgcolor": [
						0.941,
						0.627,
						0.314,
						0.25
					],
					"textcolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"bordercolor": [
						0.941,
						0.627,
						0.314,
						0.9
					],
					"rounded": 3,
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Allow Trip",
							"parameter_shortname": "Allow Trip",
							"parameter_type": 2,
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_initial": [
								1
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 9,
							"parameter_enum": [
								"off",
								"on"
							]
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-129",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1500.0,
						830.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend gtrip"
				}
			},
			{
				"box": {
					"id": "obj-130",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1570.0,
						800.0,
						60.0,
						17.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "Dot",
					"presentation": 1,
					"presentation_rect": [
						826.5,
						95.0,
						20.5,
						12.0
					],
					"texton": "Dot",
					"mode": 1,
					"varname": "Allow Dot",
					"annotation": "Allow dotted waits.",
					"annotation_name": "Allow Dot",
					"fontsize": 7.0,
					"activebgoncolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"activebgcolor": [
						0.941,
						0.627,
						0.314,
						0.25
					],
					"textcolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"bordercolor": [
						0.941,
						0.627,
						0.314,
						0.9
					],
					"rounded": 3,
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Allow Dot",
							"parameter_shortname": "Allow Dot",
							"parameter_type": 2,
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_initial": [
								1
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 9,
							"parameter_enum": [
								"off",
								"on"
							]
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-131",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1570.0,
						830.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend gdot"
				}
			},
			{
				"box": {
					"id": "obj-132",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1640.0,
						800.0,
						60.0,
						17.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "Pitch",
					"presentation": 1,
					"presentation_rect": [
						803.0,
						110.0,
						20.5,
						12.0
					],
					"texton": "Pitch",
					"mode": 1,
					"varname": "Allow Pitch",
					"annotation": "Allow pitch changes: file pitch, per-hit pitch, pitch envelope, glide, repeat steps. The global Pitch dial still transposes.",
					"annotation_name": "Allow Pitch",
					"fontsize": 7.0,
					"activebgoncolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"activebgcolor": [
						0.941,
						0.627,
						0.314,
						0.25
					],
					"textcolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"bordercolor": [
						0.941,
						0.627,
						0.314,
						0.9
					],
					"rounded": 3,
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Allow Pitch",
							"parameter_shortname": "Allow Pitch",
							"parameter_type": 2,
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_initial": [
								1
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 9,
							"parameter_enum": [
								"off",
								"on"
							]
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-133",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1640.0,
						830.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend gptch"
				}
			},
			{
				"box": {
					"id": "obj-134",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1710.0,
						800.0,
						60.0,
						17.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "Rev",
					"presentation": 1,
					"presentation_rect": [
						826.5,
						110.0,
						20.5,
						12.0
					],
					"texton": "Rev",
					"mode": 1,
					"varname": "Allow Rev",
					"annotation": "Allow reverse playback.",
					"annotation_name": "Allow Rev",
					"fontsize": 7.0,
					"activebgoncolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.941,
						0.627,
						0.314,
						1.0
					],
					"activebgcolor": [
						0.941,
						0.627,
						0.314,
						0.25
					],
					"textcolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"bordercolor": [
						0.941,
						0.627,
						0.314,
						0.9
					],
					"rounded": 3,
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Allow Rev",
							"parameter_shortname": "Allow Rev",
							"parameter_type": 2,
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_initial": [
								1
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 9,
							"parameter_enum": [
								"off",
								"on"
							]
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-135",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1710.0,
						830.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend grev"
				}
			},
			{
				"box": {
					"id": "obj-136",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1500.0,
						900.0,
						60.0,
						17.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "Random all",
					"presentation": 1,
					"presentation_rect": [
						564.0,
						146.0,
						91.0,
						15.0
					],
					"texton": "Random all",
					"mode": 0,
					"varname": "Random all",
					"annotation": "New random settings for every file (and fresh loops for locked files). Depth: how far they move.",
					"annotation_name": "Random all",
					"fontsize": 8.5,
					"activebgoncolor": [
						0.416,
						0.659,
						0.941,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.416,
						0.659,
						0.941,
						1.0
					],
					"activebgcolor": [
						0.416,
						0.659,
						0.941,
						0.35
					],
					"textcolor": [
						0.416,
						0.659,
						0.941,
						1.0
					],
					"bordercolor": [
						0.416,
						0.659,
						0.941,
						0.9
					],
					"rounded": 3,
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Random all",
							"parameter_shortname": "Random all",
							"parameter_type": 2,
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 9,
							"parameter_enum": [
								"off",
								"on"
							]
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-137",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1500.0,
						930.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend grand"
				}
			},
			{
				"box": {
					"id": "obj-138",
					"maxclass": "live.numbox",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1700.0,
						600.0,
						44.0,
						15.0
					],
					"outlettype": [
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						658.0,
						146.0,
						44.0,
						15.0
					],
					"varname": "Random Depth",
					"parameter_enable": 1,
					"annotation": "How far Random All moves the settings: 100 % = a completely new roll, lower = a nudge.",
					"annotation_name": "Random Depth",
					"fontsize": 8.0,
					"activeslidercolor": [
						0.416,
						0.659,
						0.941,
						1.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"bordercolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"appearance": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Random Depth",
							"parameter_shortname": "Depth",
							"parameter_type": 0,
							"parameter_mmin": 0,
							"parameter_mmax": 100,
							"parameter_initial": [
								100
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 5
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-139",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1700.0,
						630.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend rdall"
				}
			},
			{
				"box": {
					"id": "obj-140",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1580.0,
						900.0,
						60.0,
						17.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "Clear all",
					"presentation": 1,
					"presentation_rect": [
						803.0,
						146.0,
						44.0,
						15.0
					],
					"texton": "Clear all",
					"mode": 0,
					"varname": "Clear all",
					"annotation": "Empties every slot and memory and resets the device. Press twice within 2 seconds.",
					"annotation_name": "Clear all",
					"fontsize": 8.5,
					"activebgoncolor": [
						0.75,
						0.75,
						0.77,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.75,
						0.75,
						0.77,
						1.0
					],
					"activebgcolor": [
						0.75,
						0.75,
						0.77,
						0.25
					],
					"textcolor": [
						0.75,
						0.75,
						0.77,
						1.0
					],
					"bordercolor": [
						0.75,
						0.75,
						0.77,
						0.9
					],
					"rounded": 3,
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Clear all",
							"parameter_shortname": "Clear all",
							"parameter_type": 2,
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 9,
							"parameter_enum": [
								"off",
								"on"
							]
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-141",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1580.0,
						930.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend clearall"
				}
			},
			{
				"box": {
					"id": "obj-142",
					"maxclass": "jsui",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						700.0,
						500.0,
						75.0,
						112.0
					],
					"outlettype": [
						""
					],
					"presentation": 1,
					"presentation_rect": [
						864.0,
						8.0,
						91.0,
						112.0
					],
					"filename": "wanderer.memory.js",
					"parameter_enable": 0,
					"border": 0,
					"annotation": "Memory slots: click to recall (settings, Free/Lock and the loops, exactly as stored). Store saves into the selected slot, Clear empties it.",
					"annotation_name": "Memory"
				}
			},
			{
				"box": {
					"id": "obj-143",
					"maxclass": "live.comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1200.0,
						182.0,
						60.0,
						18.0
					],
					"text": "Slide",
					"presentation": 1,
					"presentation_rect": [
						862.0,
						125.0,
						48.0,
						13.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"fontsize": 8.5,
					"textjustification": 1
				}
			},
			{
				"box": {
					"id": "obj-144",
					"maxclass": "live.menu",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						1400.0,
						1000.0,
						80.0,
						15.0
					],
					"outlettype": [
						"",
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						911.0,
						126.0,
						44.0,
						14.0
					],
					"varname": "Slide",
					"parameter_enable": 1,
					"annotation": "Recall glides from the old settings to the new over this time.",
					"annotation_name": "Slide",
					"fontsize": 8.0,
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"arrowcolor": [
						0.663,
						0.545,
						0.91,
						1.0
					],
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Slide",
							"parameter_shortname": "Slide",
							"parameter_type": 2,
							"parameter_mmin": 0,
							"parameter_mmax": 6,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 9,
							"parameter_enum": [
								"Off",
								"1/4",
								"1 bar",
								"2 bar",
								"4 bar",
								"8 bar",
								"16 bar"
							]
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-145",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1400.0,
						1030.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend slide"
				}
			},
			{
				"box": {
					"id": "obj-146",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1660.0,
						900.0,
						60.0,
						17.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "Store",
					"presentation": 1,
					"presentation_rect": [
						864.0,
						146.0,
						44.0,
						15.0
					],
					"texton": "Store",
					"mode": 0,
					"varname": "Store",
					"annotation": "Saves everything into the selected memory slot.",
					"annotation_name": "Store",
					"fontsize": 8.5,
					"activebgoncolor": [
						0.663,
						0.545,
						0.91,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.663,
						0.545,
						0.91,
						1.0
					],
					"activebgcolor": [
						0.663,
						0.545,
						0.91,
						0.25
					],
					"textcolor": [
						0.663,
						0.545,
						0.91,
						1.0
					],
					"bordercolor": [
						0.663,
						0.545,
						0.91,
						0.9
					],
					"rounded": 3,
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Store",
							"parameter_shortname": "Store",
							"parameter_type": 2,
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 9,
							"parameter_enum": [
								"off",
								"on"
							]
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-147",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1660.0,
						930.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend store"
				}
			},
			{
				"box": {
					"id": "obj-148",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1740.0,
						900.0,
						60.0,
						17.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "Clear",
					"presentation": 1,
					"presentation_rect": [
						911.0,
						146.0,
						44.0,
						15.0
					],
					"texton": "Clear",
					"mode": 0,
					"varname": "Clear Slot",
					"annotation": "Empties the selected memory slot.",
					"annotation_name": "Clear Slot",
					"fontsize": 8.5,
					"activebgoncolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"activebgcolor": [
						0.85,
						0.85,
						0.85,
						0.25
					],
					"textcolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"bordercolor": [
						0.85,
						0.85,
						0.85,
						0.9
					],
					"rounded": 3,
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Clear Slot",
							"parameter_shortname": "Clear Slot",
							"parameter_type": 2,
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 9,
							"parameter_enum": [
								"off",
								"on"
							]
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-149",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1740.0,
						930.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend clearslot"
				}
			},
			{
				"box": {
					"id": "obj-150",
					"maxclass": "live.comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1000.0,
						189.0,
						80.0,
						18.0
					],
					"text": "DETECT",
					"presentation": 1,
					"presentation_rect": [
						969.0,
						5.0,
						50.0,
						14.0
					],
					"textcolor": [
						0.77,
						0.77,
						0.78,
						1.0
					],
					"fontname": "Ableton Sans Bold",
					"fontsize": 9.5,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-151",
					"maxclass": "panel",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1100.0,
						190.0,
						80.0,
						2.0
					],
					"presentation": 1,
					"presentation_rect": [
						972.0,
						19.0,
						44.0,
						2.0
					],
					"bgcolor": [
						0.77,
						0.77,
						0.78,
						0.55
					],
					"border": 0,
					"rounded": 1,
					"ignoreclick": 1
				}
			},
			{
				"box": {
					"id": "obj-152",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1120.0,
						600.0,
						44.0,
						48.0
					],
					"outlettype": [
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						972.0,
						24.0,
						44.0,
						50.0
					],
					"varname": "Detect Sens",
					"parameter_enable": 1,
					"annotation": "Detection sensitivity for every file, added to each file's own. Higher = more slices.",
					"annotation_name": "Detect Sens",
					"fontsize": 8.5,
					"activedialcolor": [
						0.77,
						0.77,
						0.78,
						1.0
					],
					"activeneedlecolor": [
						0.77,
						0.77,
						0.78,
						1.0
					],
					"dialcolor": [
						0.055,
						0.055,
						0.063,
						1.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"showname": 1,
					"shownumber": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Detect Sens",
							"parameter_shortname": "Sens",
							"parameter_type": 0,
							"parameter_mmin": -50,
							"parameter_mmax": 50,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 0
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-153",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1120.0,
						655.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend msens"
				}
			},
			{
				"box": {
					"id": "obj-154",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1180.0,
						600.0,
						44.0,
						48.0
					],
					"outlettype": [
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						972.0,
						82.0,
						44.0,
						50.0
					],
					"varname": "Detect Min Len",
					"parameter_enable": 1,
					"annotation": "Shortest slice for every file, as a multiple of each file's own.",
					"annotation_name": "Detect Min Len",
					"fontsize": 8.5,
					"activedialcolor": [
						0.77,
						0.77,
						0.78,
						1.0
					],
					"activeneedlecolor": [
						0.77,
						0.77,
						0.78,
						1.0
					],
					"dialcolor": [
						0.055,
						0.055,
						0.063,
						1.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"showname": 1,
					"shownumber": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Detect Min Len",
							"parameter_shortname": "Min len",
							"parameter_type": 0,
							"parameter_mmin": -100,
							"parameter_mmax": 100,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 0
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-155",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1180.0,
						655.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend mlen"
				}
			},
			{
				"box": {
					"id": "obj-156",
					"maxclass": "live.tab",
					"numinlets": 1,
					"numoutlets": 3,
					"patching_rect": [
						1540.0,
						600.0,
						60.0,
						30.0
					],
					"outlettype": [
						"",
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						972.0,
						146.0,
						44.0,
						15.0
					],
					"num_lines_patching": 1,
					"num_lines_presentation": 1,
					"varname": "Detect Method",
					"annotation": "Slicing for every file: Hits (loudness jumps: drums) or Notes (changes in sound: melodic material).",
					"annotation_name": "Detect Method",
					"activebgoncolor": [
						0.77,
						0.77,
						0.78,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.77,
						0.77,
						0.78,
						1.0
					],
					"textcolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"fontsize": 7.0,
					"rounded": 3,
					"spacing_x": 2,
					"spacing_y": 2,
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Detect Method",
							"parameter_shortname": "Method",
							"parameter_type": 2,
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 9,
							"parameter_enum": [
								"Hits",
								"Notes"
							]
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-157",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1540.0,
						640.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend gmethod"
				}
			},
			{
				"box": {
					"id": "obj-158",
					"maxclass": "live.comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1000.0,
						197.0,
						80.0,
						18.0
					],
					"text": "OUT",
					"presentation": 1,
					"presentation_rect": [
						1030.0,
						5.0,
						97.0,
						14.0
					],
					"textcolor": [
						0.937,
						0.541,
						0.47,
						1.0
					],
					"fontname": "Ableton Sans Bold",
					"fontsize": 9.5,
					"fontface": 1
				}
			},
			{
				"box": {
					"id": "obj-159",
					"maxclass": "panel",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						1100.0,
						198.0,
						80.0,
						2.0
					],
					"presentation": 1,
					"presentation_rect": [
						1033.0,
						19.0,
						91.0,
						2.0
					],
					"bgcolor": [
						0.937,
						0.541,
						0.47,
						0.55
					],
					"border": 0,
					"rounded": 1,
					"ignoreclick": 1
				}
			},
			{
				"box": {
					"id": "obj-160",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1240.0,
						600.0,
						44.0,
						48.0
					],
					"outlettype": [
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						1033.0,
						24.0,
						44.0,
						50.0
					],
					"varname": "Even",
					"parameter_enable": 1,
					"annotation": "Evens out loudness between slices: 100 % = every slice starts at the same level.",
					"annotation_name": "Even",
					"fontsize": 8.5,
					"activedialcolor": [
						0.937,
						0.541,
						0.47,
						1.0
					],
					"activeneedlecolor": [
						0.937,
						0.541,
						0.47,
						1.0
					],
					"dialcolor": [
						0.055,
						0.055,
						0.063,
						1.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"showname": 1,
					"shownumber": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Even",
							"parameter_shortname": "Even",
							"parameter_type": 0,
							"parameter_mmin": 0,
							"parameter_mmax": 100,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 5
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-161",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1240.0,
						655.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend even"
				}
			},
			{
				"box": {
					"id": "obj-162",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1300.0,
						600.0,
						44.0,
						48.0
					],
					"outlettype": [
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						1080.0,
						24.0,
						44.0,
						50.0
					],
					"varname": "Comp",
					"parameter_enable": 1,
					"annotation": "Glues the output: more = lower threshold, higher ratio, matching make-up. The bar shows the gain reduction.",
					"annotation_name": "Comp",
					"fontsize": 8.5,
					"activedialcolor": [
						0.937,
						0.541,
						0.47,
						1.0
					],
					"activeneedlecolor": [
						0.937,
						0.541,
						0.47,
						1.0
					],
					"dialcolor": [
						0.055,
						0.055,
						0.063,
						1.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"showname": 1,
					"shownumber": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Comp",
							"parameter_shortname": "Comp",
							"parameter_type": 0,
							"parameter_mmin": 0,
							"parameter_mmax": 100,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 5
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-163",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1300.0,
						655.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend comp"
				}
			},
			{
				"box": {
					"id": "obj-164",
					"maxclass": "jsui",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						900.0,
						500.0,
						30.0,
						5.0
					],
					"presentation": 1,
					"presentation_rect": [
						1086.0,
						71.0,
						32.0,
						3.0
					],
					"filename": "wanderer.gr.js",
					"parameter_enable": 0,
					"border": 0
				}
			},
			{
				"box": {
					"id": "obj-165",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1360.0,
						600.0,
						44.0,
						48.0
					],
					"outlettype": [
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						1033.0,
						82.0,
						44.0,
						50.0
					],
					"varname": "Stereo",
					"parameter_enable": 1,
					"annotation": "Stereo width of the whole output: 0 = mono, 100 % = as is, 200 % = extra wide.",
					"annotation_name": "Stereo",
					"fontsize": 8.5,
					"activedialcolor": [
						0.937,
						0.541,
						0.47,
						1.0
					],
					"activeneedlecolor": [
						0.937,
						0.541,
						0.47,
						1.0
					],
					"dialcolor": [
						0.055,
						0.055,
						0.063,
						1.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"showname": 1,
					"shownumber": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Stereo",
							"parameter_shortname": "Stereo",
							"parameter_type": 0,
							"parameter_mmin": 0,
							"parameter_mmax": 200,
							"parameter_initial": [
								100
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 5
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-166",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1360.0,
						655.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend stereo"
				}
			},
			{
				"box": {
					"id": "obj-167",
					"maxclass": "live.dial",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1420.0,
						600.0,
						44.0,
						48.0
					],
					"outlettype": [
						"",
						"float"
					],
					"presentation": 1,
					"presentation_rect": [
						1080.0,
						82.0,
						44.0,
						50.0
					],
					"varname": "Volume",
					"parameter_enable": 1,
					"annotation": "Output level.",
					"annotation_name": "Volume",
					"fontsize": 8.5,
					"activedialcolor": [
						0.937,
						0.541,
						0.47,
						1.0
					],
					"activeneedlecolor": [
						0.937,
						0.541,
						0.47,
						1.0
					],
					"dialcolor": [
						0.055,
						0.055,
						0.063,
						1.0
					],
					"textcolor": [
						0.925,
						0.925,
						0.925,
						1.0
					],
					"showname": 1,
					"shownumber": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Volume",
							"parameter_shortname": "Volume",
							"parameter_type": 0,
							"parameter_mmin": -70,
							"parameter_mmax": 6,
							"parameter_initial": [
								0
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 4
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-168",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1420.0,
						655.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend volume"
				}
			},
			{
				"box": {
					"id": "obj-169",
					"maxclass": "live.text",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						1820.0,
						900.0,
						60.0,
						17.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "Limit",
					"presentation": 1,
					"presentation_rect": [
						1033.0,
						146.0,
						44.0,
						15.0
					],
					"texton": "Limit",
					"mode": 1,
					"varname": "Limit",
					"annotation": "A soft limiter at the end: the output never goes over -0.3 dB.",
					"annotation_name": "Limit",
					"fontsize": 8.5,
					"activebgoncolor": [
						0.937,
						0.541,
						0.47,
						1.0
					],
					"activetextoncolor": [
						0.08,
						0.08,
						0.08,
						1.0
					],
					"bgcolor": [
						0.165,
						0.169,
						0.184,
						1.0
					],
					"bgoncolor": [
						0.937,
						0.541,
						0.47,
						1.0
					],
					"activebgcolor": [
						0.937,
						0.541,
						0.47,
						0.25
					],
					"textcolor": [
						0.85,
						0.85,
						0.85,
						1.0
					],
					"bordercolor": [
						0.937,
						0.541,
						0.47,
						0.9
					],
					"rounded": 3,
					"parameter_enable": 1,
					"saved_attribute_attributes": {
						"valueof": {
							"parameter_longname": "Limit",
							"parameter_shortname": "Limit",
							"parameter_type": 2,
							"parameter_mmin": 0,
							"parameter_mmax": 1,
							"parameter_initial": [
								1
							],
							"parameter_initial_enable": 1,
							"parameter_unitstyle": 9,
							"parameter_enum": [
								"off",
								"on"
							]
						}
					}
				}
			},
			{
				"box": {
					"id": "obj-170",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1820.0,
						930.0,
						100.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend limit"
				}
			},
			{
				"box": {
					"id": "obj-171",
					"maxclass": "live.meter~",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1000.0,
						360.0,
						30.0,
						6.0
					],
					"outlettype": [
						"list"
					],
					"presentation": 1,
					"presentation_rect": [
						1080.0,
						148.0,
						44.0,
						5.0
					],
					"orientation": 1,
					"parameter_enable": 0,
					"coldcolor": [
						0.612,
						0.8,
						0.353,
						1.0
					],
					"warmcolor": [
						0.949,
						0.722,
						0.294,
						1.0
					],
					"hotcolor": [
						0.937,
						0.541,
						0.47,
						1.0
					],
					"offcolor": [
						0.055,
						0.055,
						0.063,
						1.0
					]
				}
			},
			{
				"box": {
					"id": "obj-172",
					"maxclass": "live.meter~",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						1040.0,
						360.0,
						30.0,
						6.0
					],
					"outlettype": [
						"list"
					],
					"presentation": 1,
					"presentation_rect": [
						1080.0,
						155.0,
						44.0,
						5.0
					],
					"orientation": 1,
					"parameter_enable": 0,
					"coldcolor": [
						0.612,
						0.8,
						0.353,
						1.0
					],
					"warmcolor": [
						0.949,
						0.722,
						0.294,
						1.0
					],
					"hotcolor": [
						0.937,
						0.541,
						0.47,
						1.0
					],
					"offcolor": [
						0.055,
						0.055,
						0.063,
						1.0
					]
				}
			},
			{
				"box": {
					"id": "obj-173",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"patching_rect": [
						200.0,
						440.0,
						60.0,
						22.0
					],
					"outlettype": [
						"",
						""
					],
					"text": "unpack 0 0"
				}
			},
			{
				"box": {
					"id": "obj-174",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						200.0,
						470.0,
						80.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend set"
				}
			},
			{
				"box": {
					"id": "obj-175",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						290.0,
						470.0,
						80.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend set"
				}
			},
			{
				"box": {
					"id": "obj-176",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						110.0,
						470.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "expr 1 - $i1"
				}
			},
			{
				"box": {
					"id": "obj-177",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"patching_rect": [
						110.0,
						500.0,
						80.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "prepend set"
				}
			},
			{
				"box": {
					"id": "obj-178",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 3,
					"patching_rect": [
						300.0,
						440.0,
						60.0,
						22.0
					],
					"outlettype": [
						"bang",
						"bang",
						""
					],
					"text": "sel 1 0"
				}
			},
			{
				"box": {
					"id": "obj-179",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						300.0,
						500.0,
						70.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "text Sure?"
				}
			},
			{
				"box": {
					"id": "obj-180",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"patching_rect": [
						380.0,
						500.0,
						80.0,
						22.0
					],
					"outlettype": [
						""
					],
					"text": "text Clear all"
				}
			},
			{
				"box": {
					"id": "obj-181",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 21,
					"patching_rect": [
						200.0,
						540.0,
						500.0,
						22.0
					],
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
						"",
						"",
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
					"text": "route macro quant glen qhit gmethod chaos gdensity gpitch mutate gscale gtrip gdot gptch grev glock locklen slide msens mlen rdall"
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
						"obj-3",
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
						"obj-6",
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
						"obj-5",
						1
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
						"obj-5",
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
						"obj-8",
						0
					],
					"destination": [
						"obj-10",
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
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
						1
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
						"obj-8",
						0
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
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-15",
						0
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
						"obj-16",
						1
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
						"obj-1",
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
						"obj-19",
						1
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
						"obj-1",
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
						1
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
						"obj-1",
						0
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
						"obj-25",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-25",
						1
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
						"obj-1",
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
						"obj-28",
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
						"obj-29",
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
						"obj-30",
						0
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
						1
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
						"obj-1",
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
						"obj-34",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-34",
						1
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
						"obj-1",
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
						"obj-37",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-37",
						1
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
						"obj-1",
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
						1
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
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-42",
						0
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
						"obj-43",
						1
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
						"obj-1",
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
						"obj-46",
						1
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
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-48",
						0
					],
					"destination": [
						"obj-49",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-49",
						1
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
						"obj-1",
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
						"obj-52",
						1
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
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-54",
						0
					],
					"destination": [
						"obj-55",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-55",
						1
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
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-57",
						0
					],
					"destination": [
						"obj-58",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-58",
						1
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
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-60",
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
						"obj-61",
						1
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
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-63",
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
						2
					],
					"destination": [
						"obj-64",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-64",
						3
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
						"obj-63",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-64",
						4
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
						"obj-66",
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
						5
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
						"obj-68",
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
						"obj-79",
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
						"obj-81",
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
						"obj-83",
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
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-82",
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
						"obj-86",
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
						"obj-1",
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
						"obj-1",
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
						"obj-1",
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
						"obj-92",
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
						"obj-1",
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
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-103",
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
						"obj-104",
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
						"obj-105",
						0
					],
					"destination": [
						"obj-106",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-106",
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
						"obj-111",
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
						"obj-113",
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
						"obj-115",
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
						"obj-117",
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
						"obj-1",
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
						"obj-121",
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
						"obj-123",
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
						"obj-126",
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
						"obj-129",
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
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-132",
						0
					],
					"destination": [
						"obj-133",
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
						"obj-1",
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
						"obj-135",
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
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-138",
						0
					],
					"destination": [
						"obj-139",
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
						"obj-1",
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
						"obj-141",
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
						"obj-144",
						0
					],
					"destination": [
						"obj-145",
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
						"obj-1",
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
						"obj-147",
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
						"obj-1",
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
						"obj-153",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-153",
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
						"obj-154",
						0
					],
					"destination": [
						"obj-155",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-155",
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
						"obj-156",
						0
					],
					"destination": [
						"obj-157",
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
						"obj-1",
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
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-162",
						0
					],
					"destination": [
						"obj-163",
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
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-165",
						0
					],
					"destination": [
						"obj-166",
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
						"obj-1",
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
						"obj-168",
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
						"obj-171",
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
						"obj-172",
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
						"obj-77",
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
						"obj-80",
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
						"obj-95",
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
						"obj-142",
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
						"obj-164",
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
						"obj-1",
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
						"obj-1",
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
						"obj-1",
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
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
						2
					],
					"destination": [
						"obj-101",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
						2
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
						"obj-5",
						2
					],
					"destination": [
						"obj-105",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
						2
					],
					"destination": [
						"obj-110",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
						2
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
						"obj-5",
						2
					],
					"destination": [
						"obj-114",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
						2
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
						"obj-5",
						2
					],
					"destination": [
						"obj-118",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
						2
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
						"obj-5",
						2
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
						"obj-5",
						2
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
						"obj-5",
						2
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
						"obj-5",
						2
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
						"obj-5",
						2
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
						"obj-5",
						2
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
						"obj-5",
						2
					],
					"destination": [
						"obj-156",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
						2
					],
					"destination": [
						"obj-160",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-5",
						2
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
						"obj-5",
						2
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
						"obj-5",
						2
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
						"obj-64",
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
						"obj-173",
						1
					],
					"destination": [
						"obj-175",
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
						"obj-174",
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
						"obj-177",
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
						"obj-175",
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
						"obj-64",
						1
					],
					"destination": [
						"obj-178",
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
						"obj-178",
						1
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
						"obj-179",
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
						"obj-180",
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
						"obj-64",
						2
					],
					"destination": [
						"obj-181",
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
						"obj-116",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-181",
						1
					],
					"destination": [
						"obj-101",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-181",
						2
					],
					"destination": [
						"obj-105",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-181",
						3
					],
					"destination": [
						"obj-110",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-181",
						4
					],
					"destination": [
						"obj-156",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-181",
						5
					],
					"destination": [
						"obj-118",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-181",
						6
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
						"obj-181",
						7
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
						"obj-181",
						8
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
						"obj-181",
						9
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
						"obj-181",
						10
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
						"obj-181",
						11
					],
					"destination": [
						"obj-130",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-181",
						12
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
						"obj-181",
						13
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
						"obj-181",
						14
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
						"obj-181",
						15
					],
					"destination": [
						"obj-114",
						0
					]
				}
			},
			{
				"patchline": {
					"source": [
						"obj-181",
						16
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
						"obj-181",
						17
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
						"obj-181",
						18
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
						"obj-181",
						19
					],
					"destination": [
						"obj-138",
						0
					]
				}
			}
		],
		"dependency_cache": [
			{
				"name": "wanderer.page.js",
				"bootpath": ".",
				"patcherrelativepath": ".",
				"type": "TEXT",
				"implicit": 1
			},
			{
				"name": "wanderer.wave.js",
				"bootpath": ".",
				"patcherrelativepath": ".",
				"type": "TEXT",
				"implicit": 1
			},
			{
				"name": "wanderer.files.js",
				"bootpath": ".",
				"patcherrelativepath": ".",
				"type": "TEXT",
				"implicit": 1
			},
			{
				"name": "wanderer.memory.js",
				"bootpath": ".",
				"patcherrelativepath": ".",
				"type": "TEXT",
				"implicit": 1
			},
			{
				"name": "wanderer.gr.js",
				"bootpath": ".",
				"patcherrelativepath": ".",
				"type": "TEXT",
				"implicit": 1
			},
			{
				"name": "wanderer~.mxo",
				"type": "iLaX"
			}
		],
		"latency": 0,
		"is_mpe": 0,
		"minimum_live_version": "",
		"minimum_max_version": "",
		"platform_compatibility": 0,
		"project": {
			"version": 1,
			"creationdate": 3590052493,
			"modificationdate": 3590052493,
			"viewrect": [
				0.0,
				0.0,
				300.0,
				500.0
			],
			"autoorganize": 1,
			"hideprojectwindow": 1,
			"showdependencies": 1,
			"autolocalize": 0,
			"contents": {
				"patchers": {}
			},
			"layout": {},
			"searchpath": {},
			"detailsvisible": 0,
			"amxdtype": 1768515945,
			"readonly": 0,
			"devpathtype": 0,
			"devpath": ".",
			"sortmode": 0,
			"viewmode": 0,
			"includepackages": 0
		},
		"autosave": 0
	}
}