----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

Config = {}
-- Core settings you can ignore these if you have not renamed your core
Config.CoreSettings = {
    Core = 'QBCore', -- The name of your core. Default; QBCore
    CoreFolder = 'qb-core', -- The name of your core folder. Default; qb-core
    TargetName = 'ox_target', -- The name of your third eye targeting. Default; qb-target
    MenuName = 'ox_lib', -- The name of your menu. Default; qb-menu
    InputName = 'ox_lib', -- The name of your input menu for billing. Default; qb-input
    ItemCheckEvent = 'QBCore:HasItem', -- The name of your item check event. Default; 'QBCore:HasItem'
    MetaDataEvent = 'QBCore:Server:SetMetaData', -- The name of your set metadata event. Default; 'QBCore:Server:SetMetaData'
    DutyEvent = 'QBCore:ToggleDuty', -- The name of your duty event. Default; 'QBCore:ToggleDuty'
    AddStressEvent = 'hud:server:GainStress', -- Event to remove stress from player. Default; 'hud:server:GainStress'
    RemoveStressEvent = 'hud:server:RelieveStress', -- Event to remove stress from player. Default; 'hud:server:RelieveStress'
    BossMenuEvent = 'qb-bossmenu:client:OpenMenu', -- Name of your boss menu event. Default; 'qb-bossmenu:client:OpenMenu'
    PhoneEvent = 'qb-phone:RefreshPhone', -- The name of your phone event this is needed for billing. Default; 'qb-phone:RefreshPhone'
    ClothingEvent = 'qb-clothing:client:openOutfitMenu', -- The name of your clothing event this is needed to open outfit menu. Default; 'qb-clothing:client:OpenOutfitMenu'
    FuelEvent = 'ps-fuel' -- The name of your fuel event. Default; LegacyFuel
}
-- Blips
Config.UseBlips = true -- Enable blips
Config.Blips = {
	{title='High Notes', colour=2, id=140, x = -849.13, y = -234.96, z = 37.22, scale = 0.3},
}
-- MLO version toggle
Config.MLOVersion = 'v2' -- MLO Version options; 'v1' or 'v2' -- 'v2' = https://mosbaekdesign.com/vare/white-widow-cannabis-cafe-shop-mlo-v2-update/
-- Job settings
Config.JobSettings = {
    JobName = 'highnote', -- Name of your job in your `qb-core/shared/jobs.lua`
    MenuItem = 'highnotemenu', -- Name of your menu item
    Locations = {
        -- Duty = {{name = 'ww_duty', coords = vector3(-853.06, -240.87, 62), length = 1.0, width = 2.0, heading = 210.54, debugPoly = true, minZ = 61.8, maxZ = 62.8, distance = 1.5}},
    
        -- Boss = {{name = 'ww_bossmenu', coords = vector3(-853.06, -240.87, 62), length = 1.0, width = 2.0, heading = 210.54, debugPoly = true, minZ = 61.8, maxZ = 62.8, distance = 1.5}},
        -- JobStorage = {{name = 'ww_jobstorage', coords = vector3(-848.90, -243.10, 31.01), length = 2.0, width = 2.0, heading = 67.01, debugPoly = true, minZ = 53.25, maxZ = 55.50, distance = 1.5}},
        -- BossStorage = {{name = 'ww_bossstorage', coords = vector3(-850.60, -235.69, 38.10), length = 1.2, width = 1.2, heading = 340.54, debugPoly = true, minZ = 53.25, maxZ = 54.50, distance = 1.5}},
        -- EPOS = {
        --     {name = 'ww_epos1', coords = vector3(-848.6, -234.57, 37.00), length = 0.6, width = 0.6, heading = 300, debugPoly = true, minZ = 36.8, maxZ = 37.60, distance = 1.5},
        -- },
        -- Tray = {
        --     {name = 'ww_tray1', coords = vector3(-847.99, -235.63, 36.81), length = 0.65, width = 0.75, heading = 115.00, debugPoly = true, minZ = 36.40, maxZ = 37.49, distance = 1.0},
        --     {name = 'ww_tray2', coords = vector3(-849.11, -233.53, 37.21), length = 0.65, width = 0.75, heading = 115.00, debugPoly = true, minZ = 36.40, maxZ = 37.49, distance = 1.0}
        -- },
        -- Rolling = {{name = 'ww_rolling', coords = vector3(-848.89, -237.55, 29), length = 1.1, width = 2.6, heading = 205.55, debugPoly = true, minZ = 27.97, maxZ = 30.00, distance = 1.0}},
        -- JobStore = {{name = 'ww_jobshop', coords = vector3(195.09, -233.35, 54.07), length = 1.0, width = 2.8, heading = 341.90, debugPoly = true, minZ = 53.25, maxZ = 54.50, distance = 1.0}},
        -- SnackTable = {{name = 'ww_snacktable', coords = vector3(187.23, -247.67, 54.07), length = 1.0, width = 2.8, heading = 69.90, debugPoly = true, minZ = 53.25, maxZ = 54.50, distance = 1.0}},
        -- Clothing = {
        --     -- {name = 'ww_wardrobe1', coords = vector3(184.36, -242.07, 54.07), length = 1.0, width = 2.0, heading = 250.65, debugPoly = false, minZ = 53.25, maxZ = 55.50, distance = 2.0},
        --     -- {name = 'ww_wardrobe2', coords = vector3(173.96, -235.16, 50.06), length = 2.0, width = 2.0, heading = 342.10, debugPoly = false, minZ = 49.25, maxZ = 51.50, distance = 2.0},
        --     -- {name = 'ww_wardrobe3', coords = vector3(182.55, -243.77, 49.66), length = 1.0, width = 2.0, heading = 250.65, debugPoly = false, minZ = 48.25, maxZ = 50.50, distance = 2.0}
        -- },
        -- Trimming = {
        --     {name = 'ww_trim1', coords = vector3(-844.90, -234.37, 30.0), length = 3.2, width = 2.3, heading = 205.55, debugPoly = true, minZ = 27.7, maxZ = 31.00, distance = 1.5},
        -- },
        Harvest = {
            Strain1 = {
                {name = 'ww_strain1_1', coords = vector3(-850.81, -233.49, 31.03), length = 2.6, width = 0.7, heading = 205.55, debugPoly = false, minZ = 28.03, maxZ = 32.03, distance = 1.5},
            },
            Strain2 = {
                {name = 'ww_strain2_1', coords = vector3(-853.22, -229.88, 30.83), length = 0.7, width = 4.6, heading = 205.55, debugPoly = false, minZ = 27.83, maxZ = 32.43, distance = 1.5},
            },
            Strain3 = {
                {name = 'ww_strain3_1', coords = vector3(-848.23, -227.18, 30.83), length = 0.7, width = 4.6, heading = 205.55, debugPoly = false, minZ = 27.83, maxZ = 32.43, distance = 1.5},
            },
            Strain4 = {
                {name = 'ww_strain4_1', coords = vector3(-850.73, -228.58, 30.83), length = 0.7, width = 4.6, heading = 205.55, debugPoly = false, minZ = 27.83, maxZ = 32.43, distance = 1.5},
            },
            Strain5 = {
                {name = 'ww_strain5_1', coords = vector3(-846.81, -231.49, 31.03), length = 2.6, width = 0.7, heading = 205.55, debugPoly = false, minZ = 28.03, maxZ = 32.03, distance = 1.5},
            },
        },
        BongTables = {
            -- {name = 'ww_bongtable1', coords = vector3(180.28, -247.74, 53.31), length = 2.5, width = 2.5, heading = 69.00, debugPoly = false, minZ = 53.11, maxZ = 54.50, distance = 1.5},
            -- {name = 'ww_bongtable2', coords = vector3(199.54, -247.01, 53.31), length = 2.5, width = 2.5, heading = 69.00, debugPoly = false, minZ = 53.11, maxZ = 54.50, distance = 1.5},
            -- {name = 'ww_bongtable3', coords = vector3(188.09, -252.81, 53.31), length = 2.5, width = 2.5, heading = 69.00, debugPoly = false, minZ = 53.11, maxZ = 54.50, distance = 1.5},
            -- {name = 'ww_bongtable4', coords = vector3(197.35, -253.10, 53.31), length = 2.5, width = 2.5, heading = 69.00, debugPoly = false, minZ = 53.11, maxZ = 54.50, distance = 1.5},
            -- {name = 'ww_bongtable5', coords = vector3(195.73, -257.55, 53.31), length = 2.5, width = 2.5, heading = 69.00, debugPoly = false, minZ = 53.11, maxZ = 54.50, distance = 1.5},
            -- {name = 'ww_bongtable6', coords = vector3(186.01, -258.53, 53.31), length = 2.5, width = 2.5, heading = 69.00, debugPoly = false, minZ = 53.11, maxZ = 54.50, distance = 1.5},
            -- {name = 'ww_bongtable7', coords = vector3(193.71, -263.11, 53.31), length = 2.5, width = 2.5, heading = 69.00, debugPoly = false, minZ = 53.11, maxZ = 54.50, distance = 1.5},
            -- {name = 'ww_bongtable8', coords = vector3(183.75, -264.74, 53.31), length = 2.5, width = 2.5, heading = 69.00, debugPoly = false, minZ = 53.11, maxZ = 54.50, distance = 1.5},
            -- {name = 'ww_bongtable9', coords = vector3(192.02, -267.75, 53.31), length = 2.5, width = 2.5, heading = 69.00, debugPoly = false, minZ = 53.11, maxZ = 54.50, distance = 1.5},
        },
        -- Edibles = {
        --    {name = 'ww_ediblestable', coords = vector3(-841.81, -236.61, 29.92), length = 2.2, width = 1.0, heading = 205.55, debugPoly = true, minZ = 28.89, maxZ = 31.22, distance = 1.5},
        -- },
        -- V1Garage = {
        --     --{name = 'ww_garage', coords = vector3(1, 1, 1), length = 6.0, width = 6.0, heading = 246.46, debugPoly = false, minZ = 49.11, maxZ = 53.50, distance = 6.0},
        -- }
    },
    Raid = {
        JobName = 'police', -- Name of your police job in your `qb-core/shared/
        ForceEntryTime = math.random(8,15), -- Time in (s) for police to force entry into storages
        ForceEntryAnimationDict = 'mini@safe_cracking',
        ForceEntryAnimation = 'door_open_succeed_stand',
        ForceEntryFlags = 49,
    },
    Stores = {
        JobStore = {
            -- [1] = { name = 'lighter',           price = 1,  amount = 2000, info = {}, type = 'item', slot = 1 }, -- Required
            -- [2] = { name = 'rollingpapers',     price = 1,  amount = 1000, info = {}, type = 'item', slot = 2 }, -- Required     
            -- [3] = { name = 'drug_grinder',      price = 1,  amount = 1000, info = {}, type = 'item', slot = 3 }, -- Required
            -- [4] = { name = 'emptybaggy',         price = 1,  amount = 1000, info = {}, type = 'item', slot = 4 }, -- Required
            -- [5] = { name = 'drug_shears',       price = 50, amount = 1000, info = {}, type = 'item', slot = 5 }, -- Required
			-- [6] = { name = 'gelatine',       	price = 1, amount = 1000, info = {}, type = 'item', slot = 6 }, -- Required
			-- [7] = { name = 'rawhoney',       	price = 1, amount = 1000, info = {}, type = 'item', slot = 7 }, -- Required
			-- [8] = { name = 'wwmenu',       	    price = 0, amount = 1000, info = {}, type = 'item', slot = 8 }, -- Required
        },
        SnackTable = { -- Example food items not required for script to function change these to whatever food your city uses
            -- [1] = { name = 'water',       	price = 5,  amount = 100,  info = {}, type = 'item', slot = 1 },
            -- [2] = { name = 'cocacola',      price = 5, 	amount = 100,  info = {}, type = 'item', slot = 2 }, 
			-- [3] = { name = 'pepsi',      		price = 5, 	amount = 100,  info = {}, type = 'item', slot = 3 },
            -- [4] = { name = 'mountaindew',      		price = 5, 	amount = 100,  info = {}, type = 'item', slot = 4 }, 	
            -- [5] = { name = 'drpepper',      		price = 5, 	amount = 100,  info = {}, type = 'item', slot = 5 }, 	
            -- [6] = { name = 'hersheysbar',      		price = 5, 	amount = 100,  info = {}, type = 'item', slot = 6 },
            -- [7] = { name = 'peanutmandms',      		price = 5, 	amount = 100,  info = {}, type = 'item', slot = 7 }, 			
        }
    }, 
    Harvest = {
        HarvestItem = 'drug_shears', -- Item required to harvest plants
        ProgressAnimationDict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@', -- Animation dictionary for progress bar
        ProgressAnimation = 'weed_crouch_checkingleaves_idle_01_inspector', -- Animation for progress bar
        ProgressFlags = 49, -- Animation flags for progress bar
        Prop = 'v_ret_gc_scissors',
        Bone =  18905,
        Coords = vector3(0.13, 0.1, -0.03),
        Rotation = vector3(-15.0, 34.0, -30.0),
        Strain1 = {
            Time = math.random(4,7), -- Time in (s) to harvest
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'weddingcake_crop',   label = 'Wedding Cake Crop',    amount = 3},
            }
        },
        Strain2 = {
            Time = math.random(4,7), -- Time in (s) to harvest
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'sourdiesel_crop',   label = 'Sour Diesel Crop',    amount = 3},
            }
        },
        Strain3 = {
            Time = math.random(4,7), -- Time in (s) to harvest
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'granddaddypurple_crop',   label = 'Grand Daddy Purple Crop',    amount = 3},
            }
        },
        Strain4 = {
            Time = math.random(4,7), -- Time in (s) to harvest
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'afghankush_crop',   label = 'Afghan Kush Crop',    amount = 3},
            }
        },
        Strain5 = {
            Time = math.random(4,7), -- Time in (s) to harvest
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'jackherrer_crop',   label = 'Jack Herrer Crop',    amount = 3},
            }
        },
    },
    Trimming = {
        ProgressAnimationDict = 'amb@prop_human_parking_meter@female@base',
        ProgressAnimation = 'base_female',
        ProgressFlags = 49,
        ProgressProp = 'h4_prop_h4_weed_bud_02b',
        ProgressBone =  28422,
        ProgressCoords = vector3(0.09, -0.075, 0.0),
        ProgressRotation = vector3(-90.0, 0.0, 0.0),
        Strain1 = {
            Time = math.random(6,11), -- Time in (s) to trim skunk crops
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that! Client will return the same as the amount of `empty_weed_bag` required
                ['1'] = { name = 'weddingcake_bud',   label = 'Wedding Cake Buds', amount = 3},
            },
            RequiredItems = { -- Do not exceed 3 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_shears',             label = 'Trimming Shears'},
                ['2'] = { name = 'weddingcake_crop',     label = 'Wedding Cake Crop',   amount = 3},
                ['3'] = { name = 'emptybaggy',          label = 'Empty Bags',  amount = 3},
            }
        },
        Strain2 = {
            Time = math.random(6,11), -- Time in (s) to trim kush crops
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that! Client will return the same as the amount of `empty_weed_bag` required
                ['1'] = { name = 'sourdiesel_bud',   label = 'Sour Diesel Buds', amount = 3},
            },
            RequiredItems = { -- Do not exceed 3 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_shears',             label = 'Trimming Shears'},
                ['2'] = { name = 'sourdiesel_crop',   label = 'Sour Diesel Crop',   amount = 3},
                ['3'] = { name = 'emptybaggy',          label = 'Empty Bags',  amount = 3},
            }
        },
        Strain3 = {
            Time = math.random(8,15), -- Time in (s) to trim white-widow crops
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that! Client will return the same as the amount of `empty_weed_bag` required
                ['1'] = { name = 'granddaddypurple_bud',   label = 'Grand Daddy Purple Buds', amount = 3},
            },
            RequiredItems = { -- Do not exceed 3 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_shears',                 label = 'Trimming Shears'},
                ['2'] = { name = 'granddaddypurple_crop',   label = 'Grand Daddy Purple Crop',   amount = 3},
                ['3'] = { name = 'emptybaggy',              label = 'Empty Bags',  amount = 3},
            }
        },
        Strain4 = {
            Time = math.random(8,15), -- Time in (s) to trim ak47 crops
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that! Client will return the same as the amount of `empty_weed_bag` required
                ['1'] = { name = 'afghankush_bud',   label = 'Afghan Kush Buds', amount = 3},
            },
            RequiredItems = { -- Do not exceed 3 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_shears',             label = 'Trimming Shears'},
                ['2'] = { name = 'afghankush_crop',      label = 'Afghan Kush Crop',   amount = 3},
                ['3'] = { name = 'emptybaggy',          label = 'Empty Bags',  amount = 3},
            }
        },
        Strain5 = {
            Time = math.random(8,15), -- Time in (s) to trim ak47 crops
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that! Client will return the same as the amount of `empty_weed_bag` required
                ['1'] = { name = 'jackherrer_bud',   label = 'Jack Herrer Buds', amount = 3},
            },
            RequiredItems = { -- Do not exceed 3 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_shears',             label = 'Trimming Shears'},
                ['2'] = { name = 'jackherrer_crop',   label = 'Jack Herrer Crop',   amount = 3},
                ['3'] = { name = 'emptybaggy',          label = 'Empty Bags',  amount = 3},
            }
        }
    },
    JointRolling = {
        ProgressAnimationDict = 'amb@prop_human_parking_meter@female@base', -- Animation dictionary for progress bar
        ProgressAnimation = 'base_female', -- Animation for progress bar
        ProgressFlags = 49, -- Animation flags for progress bar
        Prop = 'p_cs_papers_02',
        Bone =  57005,
        Coords = vector3(0.08, 0.0, -0.01),
        Rotation = vector3(182.0, -9.0, 56.0),
        Strain1 = {
            Time = math.random(2,5), -- Time in (s) to roll joints
            RemoveAmount = 3, -- Amount of bags to remove when rolling joints
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'weddingcake_joint',   label = 'Wedding Cake Joint', amount = 3},
            },
            RequiredItems = { -- Do not exceed 2 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_grinder',    label = 'Grinder'},
                ['2'] = { name = 'rollingpapers',   label = 'Rolling Papers', amount = 3},
            },
        },
        Strain2 = {
            Time = math.random(2,5), -- Time in (s) to roll joints
            RemoveAmount = 3, -- Amount of bags to remove when rolling joints
            ReturnAmount = 3, -- Amount of joint to return when rolling
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'sourdiesel_joint',   label = 'Sour Diesel Joint', amount = 3},
            },
            RequiredItems = { -- Do not exceed 2 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_grinder',    label = 'Grinder'},
                ['2'] = { name = 'rollingpapers',   label = 'Rolling Papers', amount = 3},
            },
        },
        Strain3 = {
            Time = math.random(2,5), -- Time in (s) to roll joints
            RemoveAmount = 3, -- Amount of bags to remove when rolling joints
            ReturnAmount = 3, -- Amount of joint to return when rolling
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'granddaddypurple_joint',   label = 'Grand Daddy Purple Joint', amount = 3},
            },
            RequiredItems = { -- Do not exceed 2 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_grinder',    label = 'Grinder'},
                ['2'] = { name = 'rollingpapers',   label = 'Rolling Papers', amount = 3},
            },
        },
        Strain4 = {
            Time = math.random(2,5), -- Time in (s) to roll joints
            RemoveAmount = 3, -- Amount of bags to remove when rolling joints
            ReturnAmount = 3, -- Amount of joint to return when rolling
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'afghankush_joint',   label = 'Afghan Kush Joint', amount = 3},
            },
            RequiredItems = { -- Do not exceed 2 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_grinder',    label = 'Grinder'},
                ['2'] = { name = 'rollingpapers',   label = 'Rolling Papers', amount = 3},
            },
        },
        Strain5 = {
            Time = math.random(2,5), -- Time in (s) to roll joints
            RemoveAmount = 3, -- Amount of bags to remove when rolling joints
            ReturnAmount = 3, -- Amount of joint to return when rolling
            ReturnItem = { -- Do not exceed 1 item the server side is not coded for that!
                ['1'] = { name = 'jackherrer_joint',   label = 'Jack Herrer Joint', amount = 3},
            },
            RequiredItems = { -- Do not exceed 2 items or change the order the server side is not coded for that!
                ['1'] = { name = 'drug_grinder',    label = 'Grinder'},
                ['2'] = { name = 'rollingpapers',   label = 'Rolling Papers', amount = 3},
            },
        }
    },
    Edibles = {
        ProgressAnimationDict = 'amb@prop_human_bbq@male@idle_a',
        ProgressAnimation = 'idle_b',
        ProgressFlags = 49,
        Strain1 = {
            Time = math.random(8,15), -- Time in (s) to prepare edibles
            RemoveAmount = 3, -- Amount of crops to remove when preparing edibles will remove harvest return item for strain 1
            ReturnItem = {
                ['1'] = { name = 'gummy_weddingcake',   label = 'Wedding Cake Gummy', amount = 3},
            },
            RequiredItems = {
                ['1'] = { name = 'gummymould',   label = 'Gummy Bear Mould'},
                ['2'] = { name = 'gelatine',   label = 'Gelatine', amount = 3},
                ['3'] = { name = 'rawhoney',   label = 'Raw Honey', amount = 3},
            },
        },
        Strain2 = {
            Time = math.random(8,15), -- Time in (s) to prepare edibles
            RemoveAmount = 3, -- Amount of crops to remove when preparing edibles will remove harvest return item for strain 2
            ReturnItem = {
                ['1'] = { name = 'gummy_sourdiesel',   label = 'Sour Diesel Gummy', amount = 3},
            },
            RequiredItems = {
                ['1'] = { name = 'gummymould',   label = 'Gummy Bear Mould'},
                ['2'] = { name = 'gelatine',   label = 'Gelatine', amount = 3},
                ['3'] = { name = 'rawhoney',   label = 'Raw Honey', amount = 3},
            },
        },
        Strain3 = {
            Time = math.random(8,15), -- Time in (s) to prepare edibles
            RemoveAmount = 3, -- Amount of crops to remove when preparing edibles will remove harvest return item for strain 3
            ReturnItem = {
                ['1'] = { name = 'gummy_granddaddypurple',   label = 'Grand Daddy Purple Gummy', amount = 3},
            },
            RequiredItems = {
                ['1'] = { name = 'gummymould',   label = 'Gummy Bear Mould'},
                ['2'] = { name = 'gelatine',   label = 'Gelatine', amount = 3},
                ['3'] = { name = 'rawhoney',   label = 'Raw Honey', amount = 3},
            },
        },
        Strain4 = {
            Time = math.random(8,15), -- Time in (s) to prepare edibles
            RemoveAmount = 3, -- Amount of crops to remove when preparing edibles will remove harvest return item for strain 4
            ReturnItem = {
                ['1'] = { name = 'gummy_afghankush',   label = 'Afghan Kush Gummy', amount = 3},
            },
            RequiredItems = {
                ['1'] = { name = 'gummymould',   label = 'Gummy Bear Mould'},
                ['2'] = { name = 'gelatine',   label = 'Gelatine', amount = 3},
                ['3'] = { name = 'rawhoney',   label = 'Raw Honey', amount = 3},
            },
        },
        Strain5 = {
            Time = math.random(8,15), -- Time in (s) to prepare edibles
            RemoveAmount = 3, -- Amount of crops to remove when preparing edibles will remove harvest return item for strain 5
            ReturnItem = {
                ['1'] = { name = 'gummy_jackherrer',   label = 'Jack Herrer Gummy', amount = 3},
            },
            RequiredItems = {
                ['1'] = { name = 'gummymould',   label = 'Gummy Bear Mould'},
                ['2'] = { name = 'gelatine',   label = 'Gelatine', amount = 3},
                ['3'] = { name = 'rawhoney',   label = 'Raw Honey', amount = 3},
            }, 
        },
    },
    Garage = {
        MoneyType = 'bank', -- Money type used for vehicle deposits
        Vehicle = 'speedo', -- White widow company vehicle use any vehicle you want here
        Deposit = 100, -- Price to take out company van will return 50%
        Heading = 246.68, -- Vehicle spawn heading
        Spawn = vector4(198.13, -269.06, 49.99, 246.68), -- Vehicle spawn location
        --<!>-- ONLY USED IF USING MLO VERSION V2 OTHERWISE IGNORE --<!>--
        V2Garage = {
            Heading = 68.78, -- Vehicle spawn heading for v2 garage
            Spawn = vector4(190.45, -252.89, 49.54, 68.78), -- Vehicle spawn location for v2 garage
            Peds = {
                -- {name = 'Garage', x = 192.73, y = -250.05, z = 49.66, h = 113.97, hash = 0xF06B849D, model = 's_m_m_autoshop_02', scenario = 'WORLD_HUMAN_CLIPBOARD'} -- Garage ped for Whitewidow MLO v2
            },
        }           
    }
}
-- Drug settings
Config.DrugSettings = {
    Joints = {
        ScreenEffects = true, -- Toggle screen effects; true = enabled, false = disabled
        EffectTime = 1, -- Amount of time in (mins) for drug effects to last
        SmokeItem = 'lighter', -- Item required to smoke joints
        ProgressAnimationDict = 'timetable@gardener@smoking_joint', -- Animation dictionary for progress bar
        ProgressAnimation = 'smoke_idle', -- Animation for progress bar
        ProgressFlags = 49, -- Animation flags for progress bar
        Prop = 'prop_sh_joint_01',
        Bone =  57005,
        Coords = vector3(0.12, 0.03, -0.05),
        Rotation = vector3(0.0, 10.0, 70.0),
        Strain1 = {
            Time = math.random(2,5), -- Time in (s) to smoke joints
            Stress = 50, -- Amount of stress relived by smoking joints
            Armour = 0, -- Amount of armour to gain by smoking joints
        },
        Strain2 = {
            Time = math.random(2,5), -- Time in (s) to smoke joints
            Stress = 50, -- Amount of stress relived by smoking joints
            Armour = 0, -- Amount of armour to gain by smoking joints
        },
        Strain3 = {
            Time = math.random(2,5), -- Time in (s) to smoke joints
            Stress = 50, -- Amount of stress relived by smoking joints
            Armour = 0, -- Amount of armour to gain by smoking joints
        },
        Strain4 = {
            Time = math.random(2,5), -- Time in (s) to smoke joints
            Stress = 50, -- Amount of stress relived by smoking joints
            Armour = 0, -- Amount of armour to gain by smoking joints
        },
        Strain5 = {
            Time = math.random(2,5), -- Time in (s) to smoke joints
            Stress = 50, -- Amount of stress relived by smoking joints
            Armour = 0, -- Amount of armour to gain by smoking joints
        }
    },
    BongTables = {
        ScreenEffects = true, -- Toggle screen effects; true = enabled, false = disabled
        EffectTime = 1, -- Amount of time in (mins) for drug effects to last
        SmokeItem = 'lighter', -- Item required to smoke bongs
        ProgressAnimationDict = 'anim@safehouse@bong', -- Animation dictionary for progress bar
        ProgressAnimation = 'bong_stage3', -- Animation for progress bar
        ProgressFlags = 49, -- Animation flags for progress bar
        Prop = 'prop_bong_01',
        Bone =  18905,
        Coords = vector3(0.1, -0.2, 0.08),
        Rotation = vector3(256.0, 0.0, 0.0),
        Strain1 = { 
            Time = math.random(8,15), -- Time in (s) to hit the bong
            Stress = math.random(5,13), -- Amount of stress relived by smoking bongs
            Armour = math.random(5,13), -- Amount of armour to gain by smoking bongs
        },
        Strain2 = {
            Time = math.random(8,15), -- Time in (s) to hit the bong
            Stress = math.random(5,13), -- Amount of stress relived by smoking bongs
            Armour = math.random(5,13), -- Amount of armour to gain by smoking bongs
        },
        Strain3 = {
            Time = math.random(8,15), -- Time in (s) to hit the bong
            Stress = math.random(5,13), -- Amount of stress relived by smoking bongs
            Armour = math.random(5,13), -- Amount of armour to gain by smoking bongs
        },
        Strain4 = {
            Time = math.random(8,15), -- Time in (s) to hit the bong
            Stress = math.random(5,13), -- Amount of stress relived by smoking bongs
            Armour = math.random(5,13), -- Amount of armour to gain by smoking bongs
        },
        Strain5 = {
            Time = math.random(8,15), -- Time in (s) to hit the bong
            Stress = math.random(5,13), -- Amount of stress relived by smoking bongs
            Armour = math.random(5,13), -- Amount of armour to gain by smoking bongs
        },
    },
    Edibles = {
        ScreenEffects = true, -- Toggle screen effects; true = enabled, false = disabled
        EffectTime = 1, -- Amount of time in (mins) for drug effects to last
        ProgressAnimationDict = 'mp_suicide', -- Animation dictionary for progress bar
        ProgressAnimation = 'pill', -- Animation for progress bar
        ProgressFlags = 49, -- Animation flags for progress bar
        Strain1 = { 
            Time = math.random(2,3), -- Time in (s) to consume edibles
            Stress = 25, -- Amount of stress relived by smoking joints
            Armour = 0, -- Amount of armour to gain by smoking joints
        },
        Strain2 = {
            Time = math.random(2,3), -- Time in (s) to consume edibles
            Stress = 25, -- Amount of stress relived by smoking joints
            Armour = 0, -- Amount of armour to gain by smoking joints
        },
        Strain3 = {
            Time = math.random(2,3), -- Time in (s) to consume edibles
            Stress = 25, -- Amount of stress relived by smoking joints
            Armour = 0, -- Amount of armour to gain by smoking joints
        },
        Strain4 = {
            Time = math.random(2,3), -- Time in (s) to consume edibles
            Stress = 25, -- Amount of stress relived by smoking joints
            Armour = 0, -- Amount of armour to gain by smoking joints
        },
        Strain5 = {
            Time = math.random(2,3), -- Time in (s) to consume edibles
            Stress = 25, -- Amount of stress relived by smoking joints
            Armour = 0, -- Amount of armour to gain by smoking joints
        },
    }
}
