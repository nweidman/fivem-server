Config = Config or {}
Loc = {}

-- //////////////////////////////////////////////////
-- ///////////////// Our Discord ////////////////////
-- //////// https://discord.gg/bJNxYDAm5u ///////////
-- //////////////////////////////////////////////////

Config = {
    debug = false, -- Shows polyzones created inside the game
    Lan = 'en', -- Translation, 'en' 'pl' 'de' 'da' 'fr' 'in' 'am' 'ph' 'no' 'nl' 'ja' 'da' 'ru' 'gr' 'se' 'lt' 'ar' 'bg' 'bs', 'cn', 'cs', 'ee', 'el', 'en', 'es', 'et', 'fa', 'fi', 'ge', 'he', 'hu', 'id', 'is', 'it', 'lv', 'pt', 'pt-br', 'ro', 'rs', 'sl', 'sv', 'th', 'tr', 'vn'
    Framework = 'qbox', -- 'qb-core' 'qbox' 'esx' or 'custom'
    Core = {resource = "qb-core", name = "QBCore", abbrev = "qb"}, -- (QBCore Only) If you arent using qb-core no need to change anything here
    ESX = "new", -- (only for ESX users) "new" or "old" chosoe the version of ESX you are using
    Inventory = "ox", -- "ox" "qb" "codem" "tgiann" "esx" "lj" "ps", if you arent using any of these inventories, put it as "other" and you will need to edit the inventory export function, or open a ticket on discord.
    Dispatch = "cd", -- "ps" "cd" "origen" "tk" "codem" "rcore" "l2s" "redutzu" "lb" "sonoran" or "outlaw", if you arent using any of these dispatch systems, put it as "other" and you will need to edit the dispatch export function, or open a ticket on discord.
    Notification = "ox", -- "ox" or "qb" or "esx"
    Progressbar = "ox", -- "ox" or "qb"

    Interaction = 'ox_target', -- ox_target, qb-target, drawtext, interact -- You can type in your custom target name aswell

    -- Drawtext Options
    DrawtextButton = 38, -- [E] by default
    Drawtext = "OX", -- OLDQB for old qb-drawtext, QB for new qbcore drawtext, OX for ox_lib
    DrawTextZoneSize = vec3(0.8, 0.8, 2), -- Size of the drawtext zone
    DrawTextRotation = 70.0, -- Rotation of the drawtext zone

    -- Testing Mode (No Minigames)
    TestingMode = false, -- Enable/Disable Testing Mode

    DiscordLogStatus = true, -- Choose whether u want to turn on discord logs or not, you need to add a webhook below for it to work
    -- To add your webhook go to opensource -> server, line 1 and add your webhook there

    PoliceJobs = {["police"] = true}, -- Jobs that can receive the dispatch, to add more follow this format: {["police"] = true, ["fbi"] = true}
    MinimumPolice = 4, -- Minimum police required to start the robbery

    ResetHeist = 60, -- (Minutes) Time to reset the heist after a robbery
    AllRobberiesCooldown = false, -- For this to work you need to download projectx-utility from our github
    AutoAlarmOff = 5, -- (Minutes) Time to turn off the alarm automatically
    RequireBag = true, -- If they need a bag to loot

    DisableParticles = false, -- Disable Laser Damage
    ParticleTimer = 10, -- (Minutes) How long the smoke lasts

    -- Progression item (Item that can be obtained at the end of the heist, can be used for the next heist) 
    Bonus = {
        Status = true, -- Enable/Disable Bonus items
        BonusChance = 35, -- Chance of an item being given
        ItemCount = 1, -- How many items can be given from the table below
        Items = { -- You can remove items and add items as you wish
            {Name = "yellowusb", Chance = 50, Amount = {min = 1, max = 1}}, -- Chance(%) -- Amount(Items given from that type)
            {Name = "whiteusb", Chance = 50, Amount = {min = 1, max = 1}},
            -- {Name = "paletocardone", Chance = 20, Amount = {min = 1, max = 1}},
        },
    },

    -- Skill System
    SkillSystem = false, -- If want to use a skill system to initiate the heist set this to true
    MinimumLevel = 10, -- Minimum level required to start the heist
    ServerSideEvents = true, -- If you use a server sided skill events set this to true, if you use a client sided skill events set this to false

    -- Evidence and Stress Systems
    Evidence = {
        ["Status"] = true, -- Choose whether you want to have evidence dropped on the crime scene
        ["Chance"] = 50, -- Chance of fingerprints on the crime scene
    },

    Stress = { -- Stress gets applied on minigames failing only
        ["Status"] = true, -- Choose whether you want to have stress system
        ["Chance"] = 90, -- Chance of stress on the crime scene
        ["Amount"] = {min = 5, max = 10}, -- Amount of stress applied
    },

    DispatchLocation = { -- Choose where the alarm gets triggered, only one should be picked
        ["Loud"] = true,
        ["Silent"] = true,

        ["Security"] = true, -- Security step
        ["Key"] = false, -- Opening the vault
        ["Fusebox"] = false, -- Fusebox step
    },

    Code = { -- Password for the number pad
        ["Password"] = {min = 10000, max = 99999}, -- Code range
        ["Header"] = "Keypad code", -- Change Translation
        ["Content"] = "Code", -- Change Translation
        ["Input"] = {Title = 'Code', Label = 'Keypad code', Description = 'Enter the code', Icon = 'fas fa-lock'}, -- Change Translation
    },

    Props = {
        ["Keypad"] = "ch_prop_fingerprint_scanner_01e",
        ["Envelope"] = "prop_cash_envelope_01",
        ["Bonds"] = "h4_prop_h4_cash_bon_01a",
        ["PowerBox"] = "xm_prop_x17_powerbox_01",
    },

    -- Durations
    NotificationDuration = 2500, -- Notification duration

    NpcDuration = 6000, -- Npc duration
    ButtonDuration = 6000, -- Button duration
    KeypadDuration = 6000, -- Keypad duration
    PropDuration = 6000, -- Clothing duration
    VentilationDuration = 6000, -- Ventilation duration
    FuseboxDuration = 6000, -- Fusebox duration
}

Config.StartingPoint = {
    Npc = vec4(748.5849, -1692.4872, 28.3183, 168.9378),
    Model = "g_m_y_armgoon_02",
    Animation = "WORLD_HUMAN_AA_SMOKE",
}

Config.NPCs = {
    ["Security"] = {
        ['Model'] = "s_f_y_cop_01", -- Model (https://docs.fivem.net/docs/game-references/ped-models/)
        ['Coords'] = vector4(133.28, -1348.47, 28.29, 46.43), -- Coords
    },
    ["Employee1"] = {
        ['Model'] = "a_f_y_business_04", -- Model (https://docs.fivem.net/docs/game-references/ped-models/)
        ['Coords'] = vector4(130.73, -1344.83, 28.29, 178.52), -- Coords
    },
    ["Employee2"] = {
        ['Model'] = "s_m_m_fiboffice_02", -- Model (https://docs.fivem.net/docs/game-references/ped-models/)
        ['Coords'] = vector4(129.44, -1344.37, 28.29, 134.18), -- Coords
    },
    ["Employee3"] = {
        ['Model'] = "a_m_m_business_01", -- Model (https://docs.fivem.net/docs/game-references/ped-models/)
        ['Coords'] = vector4(128.95, -1343.36, 28.29, 90.42), -- coords
    }
}

Config.CashExchangeSteps = {
    ["NpcLegion"] = {
        name = "NpcLegion",
        label = "Disgruntled Cash Exchange employee",
        coords = vector3(186.39, -1273.05, 29.2),
        drawtext = vector3(186.39, -1273.05, 29.2),
        distance = 1.5,
        icon = "fas fa-note-sticky",
        size = 0.8,
    },
    ["VentilationLegion"] = {
        name = "VentilationLegion",
        label = "Turn off ventilation",
        coords = vector3(137.32, -1334.37, 29.51),
        drawtext = vector3(137.81, -1333.99, 29.2),
        distance = 1.0,
        icon = "fas fa-bolt-lightning",
        size = 0.5,
    },
    ["Keypad"] = {
        name = "Keypad",
        label = "Enter code",
        coords = vector3(139.24, -1336.73, 29.4),
        drawtext = vector3(139.79, -1336.26, 29.2),
        distance = 1.0,
        icon = "fas fa-bolt-lightning",
        size = 0.5,
    },
    ["Security"] = {
        name = "Security",
        label = "Threaten security",
        coords = vector3(133.28, -1348.47, 29.69),
        drawtext = vector3(132.45, -1347.79, 29.29),
        distance = 2.0,
        icon = "fas fa-comment-dots",
        size = 0.8,
    },
    ["Employee1"] = {
        name = "Employee1",
        label = "Threaten employee",
        coords = vector3(130.73, -1344.83, 29.69),
        drawtext = vector3(131.63, -1344.31, 29.29),
        distance = 2.0,
        icon = "fas fa-comment-dots",
        size = 0.8,
    },
    ["Employee2"] = {
        name = "Employee1",
        label = "Threaten employee",
        coords = vector3(129.44, -1344.37, 29.69),
        drawtext = vector3(130.21, -1343.61, 29.29),
        distance = 2.0,
        icon = "fas fa-comment-dots",
        size = 0.8,
    },
    ["Employee3"] = {
        name = "Employee1",
        label = "Threaten employee",
        coords = vector3(128.95, -1343.36, 29.69),
        drawtext = vector3(129.44, -1342.54, 29.29),
        distance = 2.0,
        icon = "fas fa-comment-dots",
        size = 0.8,
    },
    ["PowerBox"] = {
        name = "PowerBox",
        label = "Turn off power box",
        coords = vector3(133.73, -1337.09, 29.66),
        drawtext = vector3(133.16, -1337.54, 29.29),
        heading = 315.13,
        distance = 1.0,
        icon = "fas fa-bolt-lightning",
        size = 0.4,
    },
    ["Fusebox"] = {
        name = "Fusebox",
        label = "Disable fusebox",
        coords = vector3(132.54, -1337.25, 29.59),
        drawtext = vector3(132.8, -1337.57, 29.29),
        distance = 1.0,
        icon = "fas fa-bolt-lightning",
        size = 0.4,
    },
    ["Key"] = {
        name = "Key",
        label = "Unlock door",
        coords = vector3(133.07, -1339.69, 29.60),
        drawtext = vector3(132.7, -1339.36, 29.29),
        distance = 1.0,
        icon = "fas fa-key",
        size = 0.4,
    },
    ["Prop1"] = {
        name = "Prop1",
        label = "Collect Envelope",
        coords = vector3(130.30, -1339.94, 29.47),
        drawtext = vector3(130.71, -1340.38, 29.29),
        distance = 1.0,
        icon = "fas fa-money-bill-wave",
        size = 0.4,
    },
    ["Prop2"] = {
        name = "Prop2",
        label = "Collect Envelope",
        coords = vector3(133.19, -1344.69, 29.12),
        drawtext = vector3(132.66, -1344.95, 29.29),
        distance = 1.0,
        icon = "fas fa-money-bill-wave",
        size = 0.4,
    },
    ["Prop3"] = {
        name = "Prop3",
        label = "Collect Bonds",
        coords = vector3(128.04, -1340.79, 29.19),
        drawtext = vector3(128.45, -1340.69, 29.29),
        distance = 1.0,
        icon = "fas fa-money-bill-wave",
        size = 0.4,
    },
}

Config.Sounds = {
    ["DoorUnlockSound"] = 'DoorOpen', -- The sound that is played when unlocking doors
    ["DoorUnlockSoundVolume"] = 2.0, -- The volume of the sound that is played
    ["DoorUnlockSoundDistance"] = 3.0, -- The distance that the sound reaches
    ["AlarmSound"] = 'security-alarm', -- The sound name
    ["AlarmVolume"] = 0.01, -- The volume of the sound that is played
    ["AlarmDistance"] = 10.0, -- The distance that the sound reaches
    ["AlarmLocation"] = vector3(122.81, -1348.37, 30.3), -- The location of the alarm
}

Config.Items = {
    ["USB"] = "maliciousflashdrive",
    ["USB2"] = "cashexchangebadge",
    ["Key"] = "cashexchangekey",
    ["Bag"] = "bag",
    ["Circuit"] = "pliers",
}

Config.ItemsBreak = { -- Percentage for the item to break on use
    ["Circuit"] = 0,
}

Config.Rewardcash = {
    ["ObtainPerPickup"] = false, -- Obtain the specified items below per cash stack pickup from the trolley, false - Obtain the item/cash specified below at the end of the trolley animation
    ['Cash'] = false, -- Set this to false to use a cash "item", or true to use cash
    ['Item'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
    ['StackAmount'] = {min = 135000, max = 150000}, -- Cash that is recieved from each cash stack, if you have ["ObtainPerPickup"] set to false, this will be the amount of cash you recieve at the end of the trolley animation
    ['ItemInfo'] = true, -- Item info for the cash item, this is used if you have markedbills that has random amount of money in info
}

Config.PropsRewards = {
    ["Prop1"] = {
        CashReward = true, -- if this is true, the player wont get a item reward
        Cash = 10000,
        Item = "markedbills", Amount = {min = 1, max = 1}
    },
    ["Prop2"] = {
        CashReward = true, -- if this is true, the player wont get a item reward
        Cash = 10000,
        Item = "markedbills", Amount = {min = 1, max = 1}
    },
    ["Prop3"] = {
        CashReward = true, -- if this is true, the player wont get a item reward
        Cash = 10000,
        Item = "markedbills", Amount = {min = 1, max = 1}
    },
}

Config.Trollys = {
    ['Trolly1'] = {
        Type = "cash", -- Type of the trolley (cash/gold/diamond)
        Name = 'Trolly1', -- !!! Do not touch !!!
        Coords = vector3(133.48, -1342.55, 29.29),
        Drawtext = vector3(133.78, -1342.22, 29.29),
        Heading = 318.33,
        Icon = 'fas fa-hand-back-fist',
        Distance = 1.0, -- Target Distance
        Size = 0.5, -- Circle Zone size
    },
    ['Trolly2'] = {
        Type = "cash", -- Type of the trolley (cash/gold/diamond)
        Name = 'Trolly2', -- !!! Do not touch !!!
        Coords = vector3(132.76, -1341.69, 29.29),
        Drawtext = vector3(132.98, -1341.46, 29.29),
        Heading = 319.88,
        Icon = 'fas fa-hand-back-fist',
        Distance = 1.0, -- Target Distance
        Size = 0.5, -- Circle Zone size
    },
}

Config.SecurityGuards = {
    ["Security1"] = {
        Status = true, -- Set weather you want to spawn this ped or not
        Model = "s_f_y_cop_01", -- Security guards ped models (https://docs.fivem.net/docs/game-references/ped-models/)
        Coords = vector4(133.28, -1348.47, 28.29, 46.43), -- You can change his location (only choose locations in the backhallway and security room)
        Weapon = 736523883, -- Weapon hash (https://gtahash.ru/weapons/?page=2)
        Ammo = 200, -- How much ammo the ped has
    },
}

Config.SecurityOptions = { -- Those options are applied for all the security guard peds
    ["MaxHealth"] = 100, -- 0-200
    ["Health"] = 100, -- 0-200
    ["Armour"] = 100, -- 0-100
    ["CombatMovement"] = 1,
    ["CombatRange"] = 2,
    ["Accuracy"] = 100, -- 0-100
    ["CombatAbility"] = 100,
    ["SeeingRange"] = 150.0,
    ["HearingRange"] = 150.0,
    ["Alertness"] = 3,
}

Config.MaleNoGloves = { 
        [0] = true, 
        [1] = true, 
        [2] = true, 
        [3] = true, 
        [4] = true, 
        [5] = true, 
        [6] = true,
        [7] = true,
        [8] = true,
        [9] = true,
        [10] = true,
        [11] = true,
        [12] = true,
        [13] = true,  
        [14] = true,
        [15] = true,
        [18] = true,
        [52] = true,
        [53] = true, 
        [54] = true, 
        [55] = true, 
        [56] = true, 
        [57] = true, 
        [58] = true, 
        [59] = true, 
        [60] = true, 
        [61] = true,
        [62] = true,  
        [112] = true, 
        [113] = true, 
        [114] = true, 
        [118] = true, 
        [125] = true, 
        [132] = true, 
        [184] = true, 
        [188] = true, 
        [196] = true, 
        [198] = true, 
        [202] = true, 
        [214] = true,
        [215] = true,
        [216] = true,
        [217] = true,
        [218] = true,
        [219] = true,
        [220] = true,
        [221] = true,
        [222] = true, 
        [223] = true,
}

Config.FemaleNoGloves = { 
        [0] = true,
        [1] = true,
        [2] = true,
        [3] = true,
        [4] = true,
        [5] = true,
        [6] = true,
        [7] = true,
        [8] = true,
        [9] = true,
        [10] = true,
        [11] = true,
        [12] = true,
        [13] = true,
        [14] = true,
        [15] = true,
        [19] = true,
        [59] = true,
        [60] = true,
        [61] = true,
        [62] = true,
        [63] = true,
        [64] = true,
        [65] = true,
        [66] = true,
        [67] = true,
        [68] = true,
        [69] = true,
        [70] = true,
        [71] = true,
        [129] = true,
        [130] = true,
        [131] = true,
        [135] = true,
        [142] = true,
        [149] = true,
        [153] = true,
        [157] = true,
        [161] = true,
        [165] = true,
        [229] = true,
        [233] = true,
        [241] = true,
        [248] = true,
        [249] = true,
        [250] = true,
        [251] = true,
        [252] = true,
        [253] = true,
        [254] = true,
        [255] = true,
        [256] = true,
        [257] = true,
        [258] = true,
        [259] = true,
        [260] = true,
        [261] = true,
        [262] = true,
        [263] = true,
        [264] = true,
        [265] = true,
        [266] = true,
        [267] = true,
        [268] = true,
        [269] = true,
        [270] = true,
        [271] = true,
        [272] = true,
        [273] = true,
        [274] = true,
        [275] = true,
        [276] = true,
        [277] = true,
        [278] = true,
        [279] = true,
        [280] = true,
        [281] = true,
        [282] = true,
        [283] = true,
        [284] = true,
        [285] = true,
        [286] = true,
        [287] = true,
        [288] = true,
        [289] = true,
        [290] = true,
        [291] = true,
        [292] = true,
        [293] = true,
        [294] = true,
        [295] = true,
        [296] = true,
        [297] = true,
        [298] = true,
        [299] = true,
        [300] = true,
        [301] = true,
        [302] = true,
        [303] = true,
        [304] = true,
        [305] = true,
        [306] = true,
        [307] = true,
        [308] = true,
        [309] = true,
        [310] = true,
        [311] = true,
        [312] = true,
        [313] = true,
        [314] = true,
        [315] = true,
        [316] = true,
        [317] = true,
        [318] = true,
        [319] = true,
        [320] = true,
        [321] = true,
        [322] = true,
        [323] = true,
        [324] = true,
        [325] = true,
        [326] = true,
        [327] = true,
        [328] = true,
        [329] = true,
        [330] = true,
        [331] = true,
        [332] = true,
        [333] = true,
        [334] = true,
        [335] = true,
        [336] = true,
        [337] = true,
        [338] = true,
        [339] = true,
        [340] = true,
        [341] = true,
        [342] = true,
        [343] = true,
        [344] = true,
        [345] = true,
        [346] = true,
        [347] = true,
        [348] = true,
        [349] = true,
        [350] = true,
        [351] = true,
        [352] = true,
        [353] = true,
        [354] = true,
        [355] = true,
        [356] = true,
}
Config.UseDecor = false
Config.Decorname = "SpawnedPed"

Config.MeleeWeapons = { -- Choose which weapons are required to have in hand to initiate the heist (Loud way)
    -- Melee
    "WEAPON_NIGHTSTICK", -- Night Stick
    "WEAPON_HAMMER", -- Hammer
    "WEAPON_BAT", -- Bat
    "WEAPON_CROWBAR", -- Crowbar
    "WEAPON_GOLFCLUB", -- Golfclub
    "WEAPON_HATCHET", -- Hatchet
    "WEAPON_MACHETE", -- Machete
    "WEAPON_WRENCH", -- Wrench
    "WEAPON_BATTLEAXE", -- Battle Axe
}

Config.Weapons = {
    'WEAPON_ASSAULTRIFLE',
    'WEAPON_BULLPUPRIFLE',
    'WEAPON_COMBATPISTOL',
    'WEAPON_CARBINERIFLE',
    'WEAPON_CARBINERIFLE_MK2',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_MICROSMG',
    'WEAPON_MUSKET',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_PISTOL50',
    'WEAPON_PUMPSHOTGUN',
    'WEAPON_REVOLVER',
    'WEAPON_SNSPISTOL',
    'WEAPON_SMG',
    'WEAPON_SPECIALCARBINE',
    'WEAPON_SAWNOFFSHOTGUN',
    'weapon_appistol',
    'weapon_stungun',
    'weapon_vintagepistol',
    'weapon_marksmanpistol',
    'weapon_revolver_mk2',
    'weapon_doubleaction',
    'weapon_snspistol_mk2',
    'weapon_ceramicpistol',
    'weapon_navyrevolver',
    'weapon_gadgetpistol',
    'weapon_pistolxm3',
    'weapon_2011',
    'weapon_smg_mk2',
    'weapon_assaultsmg',
    'weapon_combatpdw',
    'weapon_machinepistol',
    'weapon_minismg',
    'weapon_assaultshotgun',
    'weapon_bullpupshotgun',
    'weapon_musket',
    'weapon_heavyshotgun',
    'weapon_dbshotgun',
    'weapon_autoshotgun',
    'weapon_pumpshotgun_mk2',
    'weapon_combatshotgun',
    'weapon_assaultrifle_mk2',
    'weapon_carbinerifle_mk2',
    'weapon_advancedrifle',
    'weapon_compactrifle',
    'weapon_specialcarbine_mk2',
    'weapon_bullpuprifle_mk2',
    'weapon_militaryrifle',
    'weapon_projectx',
    'WEAPON_PROJECTXSMG',
    'WEAPON_PROJECTXPISTOL',
    'WEAPON_ARCTIC516',
    'weapon_ak47',
    'weapon_de',
    'weapon_fnx45',
    'weapon_glock17',
    'weapon_m4',
    'weapon_m9',
    'weapon_m70',	
    'weapon_m1911',	
    'weapon_uzi',	
    'weapon_mac10',
    'weapon_mossberg', 
    'weapon_remington',
    'weapon_scarh',
    'weapon_shiv',	
    'weapon_ar15',	
    'weapon_mk14',
    'weapon_sledgehammer',
    'weapon_mp9',			
    'weapon_m110',			
    'weapon_hk416',	
    'weapon_ak74',
    'weapon_aks74',	
    'weapon_glock18c',	
    'weapon_glock22',
    'weapon_mp5',
    'weapon_karambit',	
    'weapon_mcxspear', 		
    'weapon_nsr9', 
    'weapon_beanbagshotgun',
    'weapon_rfb',         
    'weapon_2011',
    'weapon_hk416b',    
    'weapon_agc',	
    'weapon_kvr',
    'weapon_p5',	
    'weapon_pm4',
    'weapon_mrevolver',
    'weapon_x19',
    'weapon_gang1',
    'weapon_gang2',
    'weapon_gang3',
    'weapon_gang4',
    'weapon_gang5',
    'weapon_gang6',
    'weapon_gang7',
    'weapon_gang8',
    'weapon_gang9',
    'weapon_gang10',
    'WEAPON_EASTERAP',
    'WEAPON_EASTERSEMI',
    'WEAPON_EASTERHB',
    'WEAPON_MK18',	
    'WEAPON_M320b',	
    'WEAPON_590',
    'weapon_x17',
    'weapon_c36',		
    'weapon_mi9',			
    'weapon_mutant_long',		
    'weapon_virtus_4',	
    'weapon_bluearp762',       
    'weapon_g19xcustom',   
    'weapon_arpsc',
    'weapon_sfarp',
    'weapon_glock41',        
    'weapon_plr16kt',          
    'weapon_g19xblack',               
    'weapon_g17g5mos',          
    'weapon_g26switchp',
    'weapon_cg17p80s',         
    'weapon_mdsh',
    'WEAPON_MB47',
    'WEAPON_2S',		
    'WEAPON_A45',
    'WEAPON_RATREV',
    'WEAPON_FMICRODRAGON',
    'WEAPON_PSTRIKEH',
    'WEAPON_PSPIKE',
    'WEAPON_PH4',
    'WEAPON_PT39',
    'WEAPON_P1911KT',
    'WEAPON_PT19',
    'WEAPON_PPH120',
    'WEAPON_PCM4A1',
    'WEAPON_PMK40H1',
    'WEAPON_PXS9',
    'WEAPON_PT17',
    'WEAPON_PMK14',
    'WEAPON_PHW45',
    'WEAPON_PPH350',
    'WEAPON_PDBATON',
    'WEAPON_BTASER',
    'WEAPON_YTASER',
    'WEAPON_PDT19',
    'WEAPON_PDPT870',
    'WEAPON_PDPT700',
    'WEAPON_MK417',
    'WEAPON_PDDT607',
    'WEAPON_PDDT7',
    'WEAPON_PDT22',
    'WEAPON_PDBR5',
    'WEAPON_PDFC66',
    'WEAPON_PDMK45',
    'WEAPON_PDMK33',
    'WEAPON_PDMKUSP',
    'WEAPON_PROJECTXPISTOLUM',
}

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- |   |   |   |   |   |   |   |   |   |   |    DO NOT TOUCH ANYTHING UNDER THIS LINE  |   |   |   |   |   |   |   |   |   |   |    |
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

Config.Steps = {}
Config.ExtraSteps = {}
Config.Tasks = {}

Config.DoorStates = {} -- Sync
Config.DoorList = {
    	-- Main Door (1)
	{
        objCoords = vector3(133.75, -1347.67, 29.46),
        objHash = 749848321,
        objYaw = 316.0,
        locked = true,
	},
        -- Jail Door (2)
    {
        objCoords = vector3(132.12, -1340.82, 29.65),
        objHash = 1138434540,
        objYaw = 45.94,
        locked = true,
	},
        -- Backdoor (3)
    {
        objCoords = vector3(139.82, -1338.36, 29.36),
        objHash = 1163942983,
        objYaw = 126.35,
        locked = true,
    },
}