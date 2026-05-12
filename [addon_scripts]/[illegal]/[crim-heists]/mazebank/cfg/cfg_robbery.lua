cfg.robbery = {
	{ -- 01
		doors = {
			{ -- 01
				type = "door", -- "door","vault","automatic"
				position = {-1305.3,-819.73,17.29,217.99}, -- {x,y,z,heading}
				model = 1834101966, -- model_hash
				status = false, -- false is closed true is open and "opening" is opening

				swapmodel = GetHashKey("robbery_mazebank_unclejust_door_02a"), -- model_hash

				range = 1.0, -- Range for the function that gets the Objects, dont put too high because it can get other doors
			},
			{ -- 02
				type = "vault", -- "door","vault","automatic"
				position = {-1307.83703,-816.48761,17.81905,35.74}, -- {x,y,z,heading}
				model = GetHashKey("v_ilev_bk_vaultdoor"), -- model_hash
				status = false, -- false is closed true is open and "opening" is opening

				vault_time_to_open = 60 * 1000, --  time is in miliseconds
				vault_finish_heading = -94.26, -- Final Vault heading

				range = 1.0, -- Range for the function that gets the Objects, dont put too high because it can get other doors
			},
			{ -- 03
				type = "door", -- "door","vault","automatic"
				position = {-1307.46,-813.36,17.29,37.19}, -- {x,y,z,heading}
				model = -1071525272, -- model_hash
				status = false, -- false is closed true is open and "opening" is opening

				swapmodel = GetHashKey("robbery_mazebank_unclejust_door_04a"), -- model_hash

				range = 1.0, -- Range for the function that gets the Objects, dont put too high because it can get other doors
			},
		},
		interactables = {
			{ -- 01
				type = "interactable_door_01", -- type of loot

				spawn = {
					type = "nospawn", -- "nospawn" "normal" "rarity" "rarity_loot"
					model = GetHashKey("robbery_mazebank_unclejust_door_01a"), -- model_hash
					models = {},
					position = {-1306.33239,-820.52380,17.29175,0.0,0.0,37.25,0.0,0.0,0.0,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},

					freeze = true,
				},

				doors = {1}, -- {index,index,index,index,...}

				target_zone = {0.34898,0.268485,0.341211,0.19265,0.0018905,0.0024415,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ -- 01
						type = "thermite_door_01",
						
						door = {
							forward_position = {0.195,-0.05,-0.07,0.0}, -- {x_offset,y_offset,z_offset,heading_offset}
							backward_position = {0.195,0.05,-0.07,180.0}, -- {x_offset,y_offset,z_offset,heading_offset}
							time = 30, -- Time in SECONDS that will take for the thermite to melt the door
						},

						item_needed = {
							{"explosive",1,100.0}, -- {item_name,item_amount,percentage_to_remove}
						},

						-- minigame = {
						-- 	{ -- 01
						-- 		event = "MINIGAME:VOLTLAB_C",
						-- 		data = {
						-- 			time = 90, -- seconds , max is 3600 which is 1 hour.
						-- 		},
						-- 	},
						-- },

						interactions = {
							oxlib = {"[E] Place Thermite",51}, -- {text,control_key}
							displayhelp = {"~INPUT_CONTEXT~ Place Thermite",51}, -- {text,control_key}
							target = {"Place Explosive","fa-solid fa-fire"}, -- {label,targeticon}
						},

						checkforpolice = true, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = {
							call = true, -- if you want this option to call the police set to "true" otherwise set to "false".
							delay = 10, -- Delay to call the police when you start the action, it is in "seconds".

							code = "10-99", -- Code Prefix to "title"
							message = "A Maze Bank Robbery is in progress", -- Notification
							sprite = 468, -- Blip Sprite
							color = 1, -- Blip Color
							scale = 1.0, -- Blip Scale
							time = 300, -- Seconds
						},
					},
				},
			},

			{ -- 02
				type = "interactable_securitypanel_01", -- type of loot

				spawn = {
					type = "normal", -- "nospawn" "normal" "rarity"
					model = GetHashKey("interactable_securitypanel_01a"), -- model_hash
					models = {},
					position = {-1302.95459,-816.80700,17.14824,0.0,0.0,307.0,0.0,0.0,0.4,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},

					freeze = true,
					islocal = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{1,"done"}, -- {index,type}
					},
				},

				keycard_type = "mazebank_03", -- type of keycard it will spawn for the animation

				doors = {2}, -- {index,index,index,...}

				target_zone = {0.4585,0.1553,0.6099,-0.003508,-0.012782,0.001744,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ -- 01
						type = "hack_securitypanel_01", -- dont change

						item_needed = {
							{"mazecard",1,100.0}, -- {item_name,item_amount,percentage_to_remove}
							-- {"robbery_tools_laptop_01",1,100.0}, -- {item_name,item_amount,percentage_to_remove}
						},

						minigame = {
							{ -- 01
								event = "MINIGAME:VOLTLAB_C",
								data = {
									time = 90, -- seconds , max is 3600 which is 1 hour.
								},
							},
						},

						interactions = {
							oxlib = {"[E] Hack",51}, -- {text,control_key}
							displayhelp = {"~INPUT_CONTEXT~ Hack",51}, -- {text,control_key}
							target = {"Hack","fa-solid fa-laptop"}, -- {label,targeticon}
						},

						checkforpolice = false, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = {
							call = false, -- if you want this option to call the police set to "true" otherwise set to "false".
							delay = 5, -- Delay to call the police when you start the action, it is in "seconds".

							code = "10-99", -- Code Prefix to "title"
							message = "A Security Panel is being hacked.", -- Notification
							sprite = 772, -- Blip Sprite
							color = 1, -- Blip Color
							scale = 1.0, -- Blip Scale
							time = 300, -- Seconds
						},
					},
				},
			},
			{ -- 03
				type = "interactable_trolly_01", -- type of loot

				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity"
					model = "", -- model_hash
					models = {
						--[[
						{"none",40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01d"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_02a"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_02b"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_02c"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_02d"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_03a"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_03b"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_03c"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_03d"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01a"),10.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_02a"),10.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_03a"),10.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_silver_01a"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_silver_02a"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_silver_03a"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_bronze_01a"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_bronze_02a"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_bronze_03a"),20.0}, -- {model_hash,percentage}
						]]
						-- {GetHashKey("interactable_trolly_money_01a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_01b"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_01c"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_01d"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_02a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_02b"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_02c"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_02d"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_03a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_03b"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_03c"),100.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_03d"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_gold_01a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_gold_02a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_gold_03a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_silver_01a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_silver_02a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_silver_03a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_bronze_01a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_bronze_02a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_bronze_03a"),100.0}, -- {model_hash,percentage}
					},
					position = {-1306.15722,-813.33905,17.14827,0.0,0.0,125.0,0.0,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},

					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{2,"done"}, -- {index,type}
					},
				},

				target_zone = {1.03,0.5942,1.002,0.0,-0.013429,0.036374,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ -- 01
						type = "grab_trolly_01",

						item_to_give = {
							-- [GetHashKey("interactable_trolly_money_01a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",40000,45000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_01b")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",85000,90000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_01c")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",62500,67500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_01d")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",445000,450000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_02a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",40000,45000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_02b")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",85000,90000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_02c")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",62500,67500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_02d")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",445000,450000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_03a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",40000,45000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_03b")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",85000,90000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_03c")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",62500,67500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							[GetHashKey("interactable_trolly_money_03d")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",100000,120000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							-- [GetHashKey("interactable_trolly_gold_01a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_gold_02a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_gold_03a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_silver_01a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_silver_02a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_silver_03a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_bronze_01a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_bronze_02a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_bronze_03a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},

						interactions = {
							oxlib = {"[E] Grab",51}, -- {text,control_key}
							displayhelp = {"~INPUT_CONTEXT~ Grab",51}, -- {text,control_key}
							target = {"Grab","fa-solid fa-hand"}, -- {label,targeticon}
						},

						checkforpolice = false, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},

			{ -- 04
				type = "interactable_door_01", -- type of loot

				spawn = {
					type = "nospawn", -- "nospawn" "normal" "rarity" "rarity_loot"
					model = GetHashKey("robbery_mazebank_unclejust_door_03a"), -- model_hash
					models = {},
					position = {-1307.46167,-813.36230,17.29175,0.0,0.0,36.43,0.0,0.0,0.0,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},

					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{2,"done"}, -- {index,type}
					},
				},

				doors = {3}, -- {index,index,index,index,...}

				target_zone = {0.34898,0.278485,0.341211,-1.18765,0.0018905,-0.0375585,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ -- 01
						type = "thermite_door_01",

						door = {
							forward_position = {-1.19,-0.05,-0.07,0.0}, -- {x_offset,y_offset,z_offset,heading_offset}
							backward_position = {-1.19,0.05,-0.07,180.0}, -- {x_offset,y_offset,z_offset,heading_offset}
							time = 30, -- Time in SECONDS that will take for the thermite to melt the door
						},

						item_needed = {
							{"explosive",1,100.0}, -- {item_name,item_amount,percentage_to_remove}
						},

						interactions = {
							oxlib = {"[E] Place Thermite",51}, -- {text,control_key}
							displayhelp = {"~INPUT_CONTEXT~ Place Thermite",51}, -- {text,control_key}
							target = {"Place Thermite","fa-solid fa-fire"}, -- {label,targeticon}
						},

						checkforpolice = false, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = {
							call = false, -- if you want this option to call the police set to "true" otherwise set to "false".
							delay = 10, -- Delay to call the police when you start the action, it is in "seconds".

							code = "10-99", -- Code Prefix to "title"
							message = "A Door sensor as detected excessive heat.", -- Notification
							sprite = 468, -- Blip Sprite
							color = 1, -- Blip Color
							scale = 1.0, -- Blip Scale
							time = 300, -- Seconds
						},
					},
				},
			},
			{ -- 05
				type = "interactable_trolly_01", -- type of loot

				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity"
					model = "", -- model_hash
					models = {
						--[[
						{"none",40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01d"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_02a"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_02b"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_02c"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_02d"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_03a"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_03b"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_03c"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_03d"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01a"),10.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_02a"),10.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_03a"),10.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_silver_01a"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_silver_02a"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_silver_03a"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_bronze_01a"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_bronze_02a"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_bronze_03a"),20.0}, -- {model_hash,percentage}
						]]
						-- {GetHashKey("interactable_trolly_money_01a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_01b"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_01c"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_01d"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_02a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_02b"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_02c"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_02d"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_03a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_03b"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_03c"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_03d"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_gold_01a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_gold_02a"),100.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_03a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_silver_01a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_silver_02a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_silver_03a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_bronze_01a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_bronze_02a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_bronze_03a"),100.0}, -- {model_hash,percentage}
					},
					position = {-1309.00402,-809.98382,17.14827,0.0,0.0,165.0,0.0,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},

					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{4,"done"}, -- {index,type}
					},
				},

				target_zone = {1.03,0.5942,1.002,0.0,-0.013429,0.036374,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ -- 01
						type = "grab_trolly_01",

						item_to_give = {
							-- [GetHashKey("interactable_trolly_money_01a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",40000,45000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_01b")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",85000,90000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_01c")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",62500,67500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_01d")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",445000,450000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_02a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",40000,45000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_02b")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",85000,90000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_02c")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",62500,67500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_02d")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",445000,450000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_03a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",40000,45000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_03b")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",85000,90000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_03c")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",62500,67500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_03d")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",445000,450000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_gold_01a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_gold_02a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							[GetHashKey("interactable_trolly_gold_03a")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"goldbar",20,30,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							-- [GetHashKey("interactable_trolly_silver_01a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_silver_02a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_silver_03a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_bronze_01a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_bronze_02a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_bronze_03a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},

						interactions = {
							oxlib = {"[E] Grab",51}, -- {text,control_key}
							displayhelp = {"~INPUT_CONTEXT~ Grab",51}, -- {text,control_key}
							target = {"Grab","fa-solid fa-hand"}, -- {label,targeticon}
						},

						checkforpolice = false, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},
			{ -- 06
				type = "interactable_trolly_01", -- type of loot

				spawn = {
					type = "rarity", -- "nospawn" "normal" "rarity"
					model = "", -- model_hash
					models = {
						--[[
						{"none",40.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01a"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01b"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01c"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_01d"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_02a"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_02b"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_02c"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_02d"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_03a"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_03b"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_03c"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_03d"),30.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_01a"),10.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_02a"),10.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_gold_03a"),10.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_silver_01a"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_silver_02a"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_silver_03a"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_bronze_01a"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_bronze_02a"),20.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_bronze_03a"),20.0}, -- {model_hash,percentage}
						]]
						-- {GetHashKey("interactable_trolly_money_01a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_01b"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_01c"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_01d"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_02a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_02b"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_02c"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_02d"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_03a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_03b"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_money_03c"),100.0}, -- {model_hash,percentage}
						{GetHashKey("interactable_trolly_money_03d"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_gold_01a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_gold_02a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_gold_03a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_silver_01a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_silver_02a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_silver_03a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_bronze_01a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_bronze_02a"),100.0}, -- {model_hash,percentage}
						-- {GetHashKey("interactable_trolly_bronze_03a"),100.0}, -- {model_hash,percentage}
					},
					position = {-1309.74584,-813.70489,17.14826,0.0,0.0,293.0,0.0,0.0,-0.51,0.0}, -- {pos_x,pos_y,pos_z,rot_x,rot_y,rot_z,offset_x,offset_y,offset_z,offset_heading}
					positions = {},

					freeze = true,
				},

				blocked = {
					type = "and", -- "and" | "or" | "and" will check if all the interactables meet the criteria | "or" will check if one of the interactables meet the criteria.
					interactables = { -- "done" | "notdone" | "done" it will check if that interactable is done | "notdone" it will check if that interactable is not done.
						{4,"done"}, -- {index,type}
					},
				},

				target_zone = {1.03,0.5942,1.002,0.0,-0.013429,0.036374,2.0}, -- {length,width,height,offset_x,offset_y,offset_z,distance}
				options = {
					{ -- 01
						type = "grab_trolly_01",

						item_to_give = {
							-- [GetHashKey("interactable_trolly_money_01a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",40000,45000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_01b")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",85000,90000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_01c")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",62500,67500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_01d")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",445000,450000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_02a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",40000,45000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_02b")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",85000,90000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_02c")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",62500,67500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_02d")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",445000,450000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_03a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",40000,45000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_03b")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",85000,90000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_money_03c")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"money",62500,67500,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							[GetHashKey("interactable_trolly_money_03d")] = {
								type = "normal", -- "normal" "random" "server"
								items = {
									{"money",100000,120000,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
									{"vangelicosafekey",1,1,40.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
								},
							},
							-- [GetHashKey("interactable_trolly_gold_01a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_gold_02a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_gold_03a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_gold_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_silver_01a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_silver_02a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_silver_03a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_silver_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_bronze_01a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_bronze_02a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
							-- [GetHashKey("interactable_trolly_bronze_03a")] = {
							-- 	type = "normal", -- "normal" "random" "server"
							-- 	items = {
							-- 		{"robbery_ingot_bronze_01",45,45,100.0}, -- {item_name,item_amount_min,item_amount_max,item_percentage}
							-- 	},
							-- },
						},

						minigame = {
							action_key = 24, -- key
							interactions = {
								"Repeatedly tap ~INPUT_ATTACK~ to quickly grab the goodies.", -- text
							},
						},

						interactions = {
							oxlib = {"[E] Grab",51}, -- {text,control_key}
							displayhelp = {"~INPUT_CONTEXT~ Grab",51}, -- {text,control_key}
							target = {"Grab","fa-solid fa-hand"}, -- {label,targeticon}
						},

						checkforpolice = false, -- if true when you try to interact it will check for the police before you start the animation.
						camera = true, -- if you want the cinematic camera system put "true" otherwise put "false".
						dispatch = nil,
					},
				},
			},
		},
	},
}