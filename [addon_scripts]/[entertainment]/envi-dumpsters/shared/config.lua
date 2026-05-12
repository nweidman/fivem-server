Config = {}

-- WHEN UPDATING TO V2 - MOST OF THE NEW CONFIGS ARE IN v2-config.lua BUT THERE ARE SOME CHANGES HERE TOO!
-- Config.Lang table has been moved to shared/lang.lua
-- Pro Tip: Search for NEW to find the new stuff!

Config.DebugMode = false -- Set to false to disable debug messages
Config.TrashCooldown = 10 -- The time in MINS a player must wait before they can search the same trash again.

Config.AdvancedCheaterCheck = true -- Set to false to disable the advanced cheater check. [WaveShield does not like this..]

Config.JobLocked = false -- Set to 'jobname' to lock the trash functionality to a job. [Default: false - anyone can search the trash] -- Config.JobLocked = {'job1', 'job2', 'job3'}
Config.StashesEnabled = true -- Set to false to disable the stashes

-- [ NEW ] -- 
Config.ClearDumpstersOnRestart = true -- Set to true if you do not want the dumpster storage to be persistent between restarts

--------------------------------

Config.HideInDumpstersEnabled = true -- Set to false to disable the hide in dumpster feature
Config.LeaveDumpsterHeight = 0.5  -- Added height value when leaving dumpster (only for servers that have an issue with players getting stuck or falling through floor on leaving dumpster)

Config.RustleSoundWhenHiding = true -- NEW!! - Set to false to disable the sound when hiding in a dumpster (added in v2 to easily find a player hiding in a dumpster)

Config.ProgressBars = false -- Set to true to enable progress bars (editable in envi-bridge/utils/client.lua) -- work in progress - MAY BE BUGGY - suggested to use false for now - (may be not fully working for all progress bar types, please keep false if you have any issues)

Config.Fails = {
    EnableFail = true, -- Set to false to disable the fail
    EnableRatEvent = true, -- Set to false to disable RAT / RACOON events
    EnableNeedleEvent = true, -- Set to false to disable NEEDLE events
    FailChancePercent = 25, -- The probability, as a percentage, that a player will fail when attempting to search the trash. A higher number means a greater chance of failure.
    DirtyNeedlesChancePercent = 25, -- The chance, as a percentage, of encountering dirty needles when a failure occurs during trash pickup. This only applies if needle events are enabled.
    DirtyNeedlesEffectTime = 60, -- The time, in seconds, that the dirty needles effect will last. This only applies if needle events are enabled.
    RatChancePercent = 60, -- The chance, as a percentage, of encountering a rat OR racoon when a failure occurs during trash pickup. This only applies if rat events are enabled and is calculated after the dirty needles chance.
    DirtyNeedlesHealthLoss = 20, -- The amount of health a player will lose if they are affected by the dirty needles event.
    HealthLoss = 10, -- The of health a player will lose on a generic fail event, where no specific event like dirty needles or a rat is triggered.
    RatHealthLoss = 5, -- The amount of health a player will lose if they are affected by the rat event. This is a fixed value and only applies if rat events are enabled.
    RacoonChancePercent = 70, -- NEW - The chance, as a percentage, of encountering a racoon instead of a rat. This only applies if rat events are enabled.
    RacoonHealthLoss = 25, -- NEW - The fixed amount of health a player will lose if they are affected by the racoon event.
}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- Aggressive Ped Settings --

Config.AggressivePedsAttack = true -- Set to false to disable hostile hobo events
Config.AggressivePedDistance = 25 -- The distance, in meters, that a player must be from a hobo before they will become hostile. This only applies if hostile hobo events are enabled.
                                  -- BEWARE: This distance is DOUBLED when searching a model from 'otherSearchables' (Homeless Props)

Config.AggressivePeds = {  -- Hobo Models
    'a_m_m_tramp_01',
    'a_m_m_trampbeac_01',
    'A_M_M_Hillbilly_02',
    'A_M_M_RurMeth_01',
    'A_M_M_Salton_01',
    'A_M_M_Salton_02',
    'A_M_M_Salton_03',
    'A_M_M_Salton_04',
    'a_f_m_skidrow_01',
    'a_f_m_trampbeac_01',
    'a_f_o_salton_01',
    'a_f_y_hippie_01',
    'a_f_y_rurmeth_01',
    'a_m_m_skidrow_01',
    'a_m_o_tramp_01',
    'a_m_o_beach_01',
    'a_m_o_salton_01',
    'a_m_o_soucent_02',
    'a_m_o_soucent_03',
    'a_m_y_methhead_01',
    'a_m_y_salton_01',
}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- Rewards Settings --

Config.RandomSelection = { -- Configuration for the random item selection
    itemCountMin = 1, -- Number of items to select randomly (DEFAULT: random between 1 and 5)
    itemCountMax = 3, -- Number of items to select randomly (DEFAULT: random between 1 and 5)
}
-- NEW! -- Added Rarity (number 1-100) to each item, the higher the number, the rarer the item
Config.BeachCanItems = {
    {name = "emptybaggy", metadata = {}, min = 1, max = 1, rarity = 25},
    {name = "vodka", metadata = {}, min = 1, max = 1, rarity = 50},
    {name = "whiskey", metadata = {}, min = 1, max = 1, rarity = 50},
    {name = "tequila", metadata = {}, min = 1, max = 1, rarity = 25},
    {name = "lighter", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "lockpick", metadata = {}, min = 1, max = 1, rarity = 60},
    {name = "icecream", metadata = {}, min = 1, max = 1, rarity = 25},
    {name = "scrap_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "cloth_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "plastic_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "electronic_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "broken_phone", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "food_waste", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "medical_waste", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "paper_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "wooden_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "copper_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "glass_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    -- ADD AS MANY AS YOU LIKE
}

Config.BeachCanItemsRare = {
    {name = "diamond_ring", metadata = {}, min = 1, max = 1, rarity = 40},
    {name = "goldbar", metadata = {}, min = 1, max = 2, rarity = 35},
    {name = "rolex", metadata = {}, min = 1, max = 1, rarity = 75},
    {name = "goldchain", metadata = {}, min = 1, max = 1, rarity = 75},
    {name = "WEAPON_SANDAL", metadata = {}, min = 1, max = 10, rarity = 20},
    -- ADD AS MANY AS YOU LIKE
}

Config.BeachCanItemsRareChance = 5 -- The chance, as a percentage, of finding an extra rare item!

--------------------------------------------------------

Config.DumpsterItems = {
    {name = "tequila", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "lighter", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "lockpick", metadata = {}, min = 1, max = 1, rarity = 60},
    {name = "sandwich", metadata = {}, min = 1, max = 1, rarity = 25},
    {name = "scrap_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "cloth_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "plastic_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "electronic_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "broken_phone", metadata = {}, min = 1, max = 2, rarity = 40},
    {name = "food_waste", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "medical_waste", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "paper_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "wooden_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "copper_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "glass_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    -- ADD AS MANY AS YOU LIKE
}

Config.DumpsterItemsRare = {
    {name = "10k_goldchain", metadata = {}, min = 1, max = 1, rarity = 40},
    {name = "hack_usb", metadata = {}, min = 1, max = 1, rarity = 50},
    {name = "goldbar", metadata = {}, min = 1, max = 1, rarity = 60},
    {name = "cryptostick", metadata = {}, min = 1, max = 1, rarity = 60},
    {name = "painkillers", metadata = {}, min = 2, max = 5, rarity = 60},
    {name = "pistol_ammo", metadata = {}, min = 3, max = 16, rarity = 15},
    {name = "ducttape", metadata = {}, min = 2, max = 5, rarity = 60},
    {name = "WEAPON_HOBO_PIPE", metadata = {}, min = 1, max = 1, rarity = 1}, -- NEW! HOBO WEAPONS!
    {name = "WEAPON_HOBO_PLANK", metadata = {}, min = 1, max = 1, rarity = 1}, -- NEW! HOBO WEAPONS!
    {name = "WEAPON_HOBO_OLDMACHETE", metadata = {}, min = 1, max = 1, rarity = 1}, -- NEW! HOBO WEAPONS!
    {name = "WEAPON_HOBO_TOILET", metadata = {}, min = 1, max = 1, rarity = 1}, -- NEW! HOBO WEAPONS!
    {name = "WEAPON_HOBO_REBAR", metadata = {}, min = 1, max = 1, rarity = 1}, -- NEW! HOBO WEAPONS!
    -- ADD AS MANY AS YOU LIKE 

}

Config.DumpsterItemsRareChance = 10 -- The chance, as a percentage, of finding an extra rare item!

--------------------------------------------------------

Config.GarbageCanItems = {
    {name = "emptybaggy", metadata = {}, min = 1, max = 1, rarity = 15},
    {name = "lighter", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "bandage", metadata = {}, min = 1, max = 3, rarity = 60},
    {name = "oxy", metadata = {}, min = 1, max = 4, rarity = 60},
    {name = "sandwich", metadata = {}, min = 1, max = 1, rarity = 25},
    {name = "wood", metadata = {}, min = 1, max = 3, rarity = 40},
    {name = "advancedlockpick", metadata = {}, min = 1, max = 1, rarity = 75},
    {name = "binoculars", metadata = {}, min = 1, max = 1, rarity = 80},
    {name = "scrap_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "cloth_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "plastic_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "electronic_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "broken_phone", metadata = {}, min = 1, max = 1, rarity = 40},
    {name = "food_waste", metadata = {}, min = 1, max = 1, rarity = 40},
    {name = "medical_waste", metadata = {}, min = 1, max = 1, rarity = 40},
    {name = "paper_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "wooden_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "copper_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "glass_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    -- ADD AS MANY AS YOU LIKE
}

Config.GarbageCanItemsRare = {
    {name = "diamond", metadata = {}, min = 1, max = 1, rarity = 60},
    {name = "sourdiesel_joint", metadata = {}, min = 1, max = 1, rarity = 75},
    {name = "bagofmeth", metadata = {}, min = 1, max = 1, rarity = 85},
    {name = "WEAPON_HOBO_PIPE", metadata = {}, min = 1, max = 1, rarity = 1}, -- NEW! HOBO WEAPONS!
    {name = "WEAPON_HOBO_SPONGE", metadata = {}, min = 1, max = 12, rarity = 1}, -- NEW! HOBO WEAPONS!
    {name = "WEAPON_SANDAL", metadata = {}, min = 1, max = 12, rarity = 1}, -- NEW! HOBO WEAPONS!
    -- ADD AS MANY AS YOU LIKE
}

Config.GarbageCanItemsRareChance = 15 -- The chance, as a percentage, of finding an extra rare item!




----------------------------------------------------------------

Config.OtherSeachablesItems = {
    {name = "emptybaggy", metadata = {}, min = 1, max = 1, rarity = 25},
    {name = "vodka", metadata = {}, min = 1, max = 1, rarity = 50},
    {name = "water", metadata = {}, min = 1, max = 1, rarity = 25},
    {name = "lighter", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "offportcigarette", metadata = {}, min = 1, max = 1, rarity = 25},
    {name = "glass", metadata = {}, min = 1, max = 1, rarity = 25},
    {name = "advancedlockpick", metadata = {}, min = 1, max = 1, rarity = 25},
    {name = "lockpick", metadata = {}, min = 1, max = 1, rarity = 65},
    -- ADD AS MANY AS YOU LIKE
}

Config.OtherSeachablesItemsRare = {
    {name = "weapon_bat", metadata = {}, min = 1, max = 1, rarity = 75},
    {name = "weapon_switchblade", metadata = {}, min = 1, max = 1, rarity = 75},
    {name = "weapon_crowbar", metadata = {}, min = 1, max = 1, rarity = 75},
    {name = "weapon_golfclub", metadata = {}, min = 1, max = 1, rarity = 75},
    {name = "bagofmeth", metadata = {}, min = 1, max = 3, rarity = 65},
    {name = "crack_baggy", metadata = {}, min = 1, max = 3, rarity = 20},
    {name = "xtcbaggy", metadata = {}, min = 1, max = 2, rarity = 20},
    {name = "WEAPON_HOBO_PLANK", metadata = {}, min = 1, max = 1, rarity = 1}, -- NEW! HOBO WEAPONS!
    {name = "WEAPON_HOBO_OLDMACHETE", metadata = {}, min = 1, max = 1, rarity = 1}, -- NEW! HOBO WEAPONS!
    {name = "WEAPON_HOBO_MOP", metadata = {}, min = 1, max = 1, rarity = 1}, -- NEW! HOBO WEAPONS!
    -- ADD AS MANY AS YOU LIKE
}

Config.OtherSeachablesItemsRareChance = 2 -- The chance, as a percentage, of finding an extra rare item!

----------------------------------------------------------------

Config.GarbageBagsItems = {

    {name = "lighter", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "sandwich", metadata = {}, min = 1, max = 1, rarity = 25},
    {name = "lockpick", metadata = {}, min = 1, max = 2, rarity = 25},
    {name = "glass", metadata = {}, min = 1, max = 1, rarity = 25},
    {name = "advancedlockpick", metadata = {}, min = 1, max = 1, rarity = 25},
    {name = "binoculars", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "emptybaggy", metadata = {}, min = 1, max = 1, rarity = 25},
    {name = "vodka", metadata = {}, min = 1, max = 1, rarity = 50},
    {name = "water", metadata = {}, min = 1, max = 1, rarity = 25},
    {name = "scrap_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "cloth_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "plastic_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "electronic_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "broken_phone", metadata = {}, min = 1, max = 1, rarity = 40},
    {name = "food_waste", metadata = {}, min = 1, max = 1, rarity = 40},
    {name = "medical_waste", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "paper_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "wooden_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "copper_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "glass_junk", metadata = {}, min = 1, max = 1, rarity = 30},
    -- ADD AS MANY AS YOU LIKE

}

Config.GarbageBagsItemsRare = {
    {name = "diamond", metadata = {}, min = 1, max = 1, rarity = 50},
    {name = "sourdiesel_joint", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "phone", metadata = {}, min = 1, max = 1, rarity = 30},
    {name = "WEAPON_HOBO_PLANK", metadata = {}, min = 1, max = 1, rarity = 1}, -- NEW! HOBO WEAPONS!
    {name = "WEAPON_HOBO_SHARD", metadata = {}, min = 1, max = 1, rarity = 1}, -- NEW! HOBO WEAPONS!
    -- ADD AS MANY AS YOU LIKE

}


Config.GarbageBagsItemsRareChance = 15 -- The chance, as a percentage, of finding an extra rare item!
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- Storage Settings --

Config.BeachCanStorageSlots = 3 -- The number of slots in the beach can storage
Config.BeachCanStorageWeight = 10000 -- The maximum weight of the beach can storage

Config.DumpsterStorageSlots = 8 -- The number of slots in the dumpster storage
Config.DumpsterStorageWeight = 50000 -- The maximum weight of the dumpster storage

Config.GarbageCanStorageSlots = 4 -- The number of slots in the garbage can storage
Config.GarbageCanStorageWeight = 12000 -- The maximum weight of the garbage can storage

Config.OtherStorageSlots = 5 -- The number of slots in the other storage
Config.OtherStorageWeight = 15000 -- The maximum weight of the other storage

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- Exclusive Item Zones --
-- IF YOU ARE IN THESE AREAS, YOU WILL SOMETIMES FIND THESE ITEMS INSTEAD

Config.ExclusiveItemZones = {
    {name = "Pier",  -- must have a unique name
    coords = vector3(-1823.4736, -1203.1621, 10.6167),
    radius = 70.0,
    chance = 10, -- The chance, as a percentage, of finding these items in this area
    restrictedZone = false, -- If true, there is a chance that the police will be called if you are searching this area
    snitchChance = 100, -- The chance, as a percentage, that a snitch will call the police/employees if you are searching this area
    jobsToInform = {'police'}, -- The jobs that will be informed if a snitch calls the police
    items = {
        {name = "fleecacard", metadata = {}, min = 1, max = 1},
        {name = "bagofmeth", metadata = {}, min = 3, max = 5},
        {name = "bagofcoke", metadata = {}, min = 3, max = 5},
        {name = "weapon_pistol", metadata = {}, min = 1, max = 1},
        {name = "head_bag", metadata = {}, min = 1, max = 1},
        {name = "crack_baggy", metadata = {}, min = 3, max = 8},
        {name = "cryptoharddrive", metadata = {}, min = 1, max = 1},
        {name = "xtcbaggy", metadata = {}, min = 3, max = 8},
        {name = "scrap_junk", metadata = {}, min = 1, max = 1},
        {name = "cloth_junk", metadata = {}, min = 1, max = 1},
        {name = "plastic_junk", metadata = {}, min = 1, max = 1},
        {name = "electronic_junk", metadata = {}, min = 1, max = 1},
        {name = "broken_phone", metadata = {}, min = 1, max = 2},
        {name = "food_waste", metadata = {}, min = 1, max = 2},
        {name = "medical_waste", metadata = {}, min = 1, max = 2},
        {name = "paper_junk", metadata = {}, min = 1, max = 1},
        {name = "wooden_junk", metadata = {}, min = 1, max = 1},
        {name = "copper_junk", metadata = {}, min = 1, max = 1},
        {name = "glass_junk", metadata = {}, min = 1, max = 1},
         -- ADD AS ITEMS MANY AS YOU LIKE
        },
    },

    {name = "Bennys",  -- must have a unique name
    coords = vector3(-190.6704, -1313.2731, 43.1890),
    radius = 65.0,
    chance = 10, -- The chance, as a percentage, of finding these items in this area
    restrictedZone = false, -- If true, there is a chance that the police will be called if you are searching this area
    snitchChance = false, -- The chance, as a percentage, that a snitch will call the police/employees if you are searching this area
    jobsToInform = {}, -- The jobs that will be informed if a snitch calls the police
    items = {
        {name = "fleecacard", metadata = {}, min = 1, max = 1},
        {name = "bagofmeth", metadata = {}, min = 3, max = 5},
        {name = "bagofcoke", metadata = {}, min = 3, max = 5},
        {name = "weapon_pistol", metadata = {}, min = 1, max = 1},
        {name = "head_bag", metadata = {}, min = 1, max = 1},
        {name = "crack_baggy", metadata = {}, min = 3, max = 8},
        {name = "cryptoharddrive", metadata = {}, min = 1, max = 1},
        {name = "xtcbaggy", metadata = {}, min = 3, max = 8},
        {name = "scrap_junk", metadata = {}, min = 1, max = 1},
        {name = "cloth_junk", metadata = {}, min = 1, max = 1},
        {name = "plastic_junk", metadata = {}, min = 1, max = 1},
        {name = "electronic_junk", metadata = {}, min = 1, max = 1},
        {name = "broken_phone", metadata = {}, min = 1, max = 2},
        {name = "food_waste", metadata = {}, min = 1, max = 2},
        {name = "medical_waste", metadata = {}, min = 1, max = 2},
        {name = "paper_junk", metadata = {}, min = 1, max = 1},
        {name = "wooden_junk", metadata = {}, min = 1, max = 1},
        {name = "copper_junk", metadata = {}, min = 1, max = 1},
        {name = "glass_junk", metadata = {}, min = 1, max = 1},
         -- ADD AS ITEMS MANY AS YOU LIKE
        },
    },


    {name = "HoboCamp",  -- must have a unique name
    coords = vector3(1444.3568, 6342.2412, 25.9395),
    radius = 50.0,
    chance = 10, -- The chance, as a percentage, of finding these items in this area
    restrictedZone = false, -- If true, there is a chance that the police will be called if you are searching this area
    snitchChance = false, -- The chance, as a percentage, that a snitch will call the police/employees if you are searching this area
    jobsToInform = {}, -- The jobs that will be informed if a snitch calls the police
    items = {
        {name = "fleecacard", metadata = {}, min = 1, max = 1},
        {name = "bagofmeth", metadata = {}, min = 3, max = 5},
        {name = "bagofcoke", metadata = {}, min = 3, max = 5},
        {name = "weapon_pistol", metadata = {}, min = 1, max = 1},
        {name = "head_bag", metadata = {}, min = 1, max = 1},
        {name = "crack_baggy", metadata = {}, min = 3, max = 8},
        {name = "cryptoharddrive", metadata = {}, min = 1, max = 1},
        {name = "xtcbaggy", metadata = {}, min = 3, max = 8},
        {name = "scrap_junk", metadata = {}, min = 1, max = 1},
        {name = "cloth_junk", metadata = {}, min = 1, max = 1},
        {name = "plastic_junk", metadata = {}, min = 1, max = 1},
        {name = "electronic_junk", metadata = {}, min = 1, max = 1},
        {name = "broken_phone", metadata = {}, min = 1, max = 2},
        {name = "food_waste", metadata = {}, min = 1, max = 2},
        {name = "medical_waste", metadata = {}, min = 1, max = 2},
        {name = "paper_junk", metadata = {}, min = 1, max = 1},
        {name = "wooden_junk", metadata = {}, min = 1, max = 1},
        {name = "copper_junk", metadata = {}, min = 1, max = 1},
        {name = "glass_junk", metadata = {}, min = 1, max = 1},
         -- ADD AS ITEMS MANY AS YOU LIKE
        },
    },
    

    {name = "LSC",  -- must have a unique name
    coords = vector3(-357.8333, -88.1545, 46.4184),
    radius = 25.0,
    chance = 10, -- The chance, as a percentage, of finding these items in this area
    restrictedZone = false, -- If true, there is a chance that the police will be called if you are searching this area
    snitchChance = false, -- The chance, as a percentage, that a snitch will call the police/employees if you are searching this area
    jobsToInform = {}, -- The jobs that will be informed if a snitch calls the police
    items = {
        {name = "fleecacard", metadata = {}, min = 1, max = 1},
        {name = "bagofmeth", metadata = {}, min = 3, max = 5},
        {name = "bagofcoke", metadata = {}, min = 3, max = 5},
        {name = "weapon_pistol", metadata = {}, min = 1, max = 1},
        {name = "head_bag", metadata = {}, min = 1, max = 1},
        {name = "crack_baggy", metadata = {}, min = 3, max = 8},
        {name = "cryptoharddrive", metadata = {}, min = 1, max = 1},
        {name = "xtcbaggy", metadata = {}, min = 3, max = 8},
        {name = "scrap_junk", metadata = {}, min = 1, max = 1},
        {name = "cloth_junk", metadata = {}, min = 1, max = 1},
        {name = "plastic_junk", metadata = {}, min = 1, max = 1},
        {name = "electronic_junk", metadata = {}, min = 1, max = 1},
        {name = "broken_phone", metadata = {}, min = 1, max = 2},
        {name = "food_waste", metadata = {}, min = 1, max = 2},
        {name = "medical_waste", metadata = {}, min = 1, max = 2},
        {name = "paper_junk", metadata = {}, min = 1, max = 1},
        {name = "wooden_junk", metadata = {}, min = 1, max = 1},
        {name = "copper_junk", metadata = {}, min = 1, max = 1},
        {name = "glass_junk", metadata = {}, min = 1, max = 1},
            -- ADD AS ITEMS MANY AS YOU LIKE
        },
    },


    {name = "Pillbox",  -- must have a unique name
    coords = vector3(296.0401, -590.5907, 43.2658),
    radius = 45.0,
    chance = 10, -- The chance, as a percentage, of finding these items in this area
    restrictedZone = false, -- If true, there is a chance that the police will be called if you are searching this area
    snitchChance = false, -- The chance, as a percentage, that a snitch will call the police/employees if you are searching this area
    jobsToInform = {}, -- The jobs that will be informed if a snitch calls the police
    items = {
        {name = "fleecacard", metadata = {}, min = 1, max = 1},
        {name = "bagofmeth", metadata = {}, min = 3, max = 5},
        {name = "bagofcoke", metadata = {}, min = 3, max = 5},
        {name = "head_bag", metadata = {}, min = 1, max = 1},
        {name = "crack_baggy", metadata = {}, min = 3, max = 8},
        {name = "cryptoharddrive", metadata = {}, min = 1, max = 1},
        {name = "xtcbaggy", metadata = {}, min = 3, max = 8},
        {name = "scrap_junk", metadata = {}, min = 1, max = 1},
        {name = "cloth_junk", metadata = {}, min = 1, max = 1},
        {name = "plastic_junk", metadata = {}, min = 1, max = 1},
        {name = "electronic_junk", metadata = {}, min = 1, max = 1},
        {name = "broken_phone", metadata = {}, min = 1, max = 2},
        {name = "food_waste", metadata = {}, min = 1, max = 2},
        {name = "medical_waste", metadata = {}, min = 1, max = 2},
        {name = "paper_junk", metadata = {}, min = 1, max = 1},
        {name = "wooden_junk", metadata = {}, min = 1, max = 1},
        {name = "copper_junk", metadata = {}, min = 1, max = 1},
        {name = "glass_junk", metadata = {}, min = 1, max = 1},
        {name = "medical_care_package", metadata = {}, min = 1, max = 1},
            -- ADD AS ITEMS MANY AS YOU LIKE
        },
    },


    {name = "SandyMed",  -- must have a unique name
    coords = vector3(1746.4122, 3633.7686, 35.1409),
    radius = 45.0,
    chance = 10, -- The chance, as a percentage, of finding these items in this area
    restrictedZone = false, -- If true, there is a chance that the police will be called if you are searching this area
    snitchChance = false, -- The chance, as a percentage, that a snitch will call the police/employees if you are searching this area
    jobsToInform = {}, -- The jobs that will be informed if a snitch calls the police
    items = {
        {name = "fleecacard", metadata = {}, min = 1, max = 1},
        {name = "bagofmeth", metadata = {}, min = 3, max = 5},
        {name = "bagofcoke", metadata = {}, min = 3, max = 5},
        {name = "head_bag", metadata = {}, min = 1, max = 1},
        {name = "crack_baggy", metadata = {}, min = 3, max = 8},
        {name = "cryptoharddrive", metadata = {}, min = 1, max = 1},
        {name = "xtcbaggy", metadata = {}, min = 3, max = 8},
        {name = "scrap_junk", metadata = {}, min = 1, max = 1},
        {name = "cloth_junk", metadata = {}, min = 1, max = 1},
        {name = "plastic_junk", metadata = {}, min = 1, max = 1},
        {name = "electronic_junk", metadata = {}, min = 1, max = 1},
        {name = "broken_phone", metadata = {}, min = 1, max = 2},
        {name = "food_waste", metadata = {}, min = 1, max = 2},
        {name = "medical_waste", metadata = {}, min = 1, max = 2},
        {name = "paper_junk", metadata = {}, min = 1, max = 1},
        {name = "wooden_junk", metadata = {}, min = 1, max = 1},
        {name = "copper_junk", metadata = {}, min = 1, max = 1},
        {name = "glass_junk", metadata = {}, min = 1, max = 1},
        {name = "medical_care_package", metadata = {}, min = 1, max = 1},
            -- ADD AS ITEMS MANY AS YOU LIKE
        },
    },


    {name = "ESM",  -- must have a unique name
    coords = vector3(915.8211, -2123.4729, 46.1986),
    radius = 75.0,
    chance = 10, -- The chance, as a percentage, of finding these items in this area
    restrictedZone = false, -- If true, there is a chance that the police will be called if you are searching this area
    snitchChance = false, -- The chance, as a percentage, that a snitch will call the police/employees if you are searching this area
    jobsToInform = {}, -- The jobs that will be informed if a snitch calls the police
    items = {
        {name = "fleecacard", metadata = {}, min = 1, max = 1},
        {name = "bagofmeth", metadata = {}, min = 3, max = 5},
        {name = "bagofcoke", metadata = {}, min = 3, max = 5},
        {name = "weapon_pistol", metadata = {}, min = 1, max = 1},
        {name = "head_bag", metadata = {}, min = 1, max = 1},
        {name = "crack_baggy", metadata = {}, min = 3, max = 8},
        {name = "cryptoharddrive", metadata = {}, min = 1, max = 1},
        {name = "xtcbaggy", metadata = {}, min = 3, max = 8},
        {name = "scrap_junk", metadata = {}, min = 1, max = 1},
        {name = "cloth_junk", metadata = {}, min = 1, max = 1},
        {name = "plastic_junk", metadata = {}, min = 1, max = 1},
        {name = "electronic_junk", metadata = {}, min = 1, max = 1},
        {name = "broken_phone", metadata = {}, min = 1, max = 2},
        {name = "food_waste", metadata = {}, min = 1, max = 2},
        {name = "medical_waste", metadata = {}, min = 1, max = 2},
        {name = "paper_junk", metadata = {}, min = 1, max = 1},
        {name = "wooden_junk", metadata = {}, min = 1, max = 1},
        {name = "copper_junk", metadata = {}, min = 1, max = 1},
        {name = "glass_junk", metadata = {}, min = 1, max = 1},
            -- ADD AS ITEMS MANY AS YOU LIKE
        },
    },


    {name = "Greasy",  -- must have a unique name
    coords = vector3(58.3033, 6477.4526, 40.2712),
    radius = 100.0,
    chance = 10, -- The chance, as a percentage, of finding these items in this area
    restrictedZone = false, -- If true, there is a chance that the police will be called if you are searching this area
    snitchChance = false, -- The chance, as a percentage, that a snitch will call the police/employees if you are searching this area
    jobsToInform = {}, -- The jobs that will be informed if a snitch calls the police
    items = {
        {name = "fleecacard", metadata = {}, min = 1, max = 1},
        {name = "bagofmeth", metadata = {}, min = 3, max = 5},
        {name = "bagofcoke", metadata = {}, min = 3, max = 5},
        {name = "weapon_pistol", metadata = {}, min = 1, max = 1},
        {name = "head_bag", metadata = {}, min = 1, max = 1},
        {name = "crack_baggy", metadata = {}, min = 3, max = 8},
        {name = "cryptoharddrive", metadata = {}, min = 1, max = 1},
        {name = "xtcbaggy", metadata = {}, min = 3, max = 8},
        {name = "scrap_junk", metadata = {}, min = 1, max = 1},
        {name = "cloth_junk", metadata = {}, min = 1, max = 1},
        {name = "plastic_junk", metadata = {}, min = 1, max = 1},
        {name = "electronic_junk", metadata = {}, min = 1, max = 1},
        {name = "broken_phone", metadata = {}, min = 1, max = 2},
        {name = "food_waste", metadata = {}, min = 1, max = 2},
        {name = "medical_waste", metadata = {}, min = 1, max = 2},
        {name = "paper_junk", metadata = {}, min = 1, max = 1},
        {name = "wooden_junk", metadata = {}, min = 1, max = 1},
        {name = "copper_junk", metadata = {}, min = 1, max = 1},
        {name = "glass_junk", metadata = {}, min = 1, max = 1},
        {name = "medical_care_package", metadata = {}, min = 1, max = 1},
            -- ADD AS ITEMS MANY AS YOU LIKE
        },
    },
    -- ADD AS MANY ZONES AS YOU LIKE

}



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- Target Models --

BeachCans = {
    "prop_bin_beach_01a",
    "prop_bin_beach_01d",
    "prop_bin_delpiero",
    "prop_bin_delpiero_b",
}

Dumpsters = {
    "prop_cs_dumpster_01a",
    "p_dumpster_t",
    "prop_dumpster_01a",
    "prop_dumpster_02a",
    "prop_dumpster_02b",
    "prop_dumpster_3a",
    "prop_dumpster_4a",
    "prop_dumpster_4b",
}

GarbageCans = {
    "prop_bin_01a",
    "prop_bin_02a",
    "prop_bin_03a",
    "prop_bin_04a",
    "prop_bin_05a",
    "prop_bin_06a",
    "prop_bin_07a",
    "prop_bin_07b",
    "prop_bin_07c",
    "prop_bin_07d",
    "prop_bin_08a",
    "prop_bin_08open",
    "prop_bin_09a",
    "prop_bin_10a",
    "prop_bin_10b",
    "prop_bin_11a",
    "prop_bin_11b",
    "prop_bin_12a",
    "zprop_bin_01a_old",
}

OtherSearchables = {
    "prop_skid_tent_01",
    "prop_skid_tent_01b",
    "prop_skid_tent_03",
}

TrashBagModels = {
    'prop_rub_binbag_01b',
    'prop_rub_binbag_04',
    'prop_rub_binbag_06',

    -- ADD MORE IF YOU LIKE, BUT THESE ONES WORK BEST
}


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- Animation Settings --
-- Fail Animations --
Config.RatFailAnim = { dict = 'misscarsteal2_bin', anim = 'trev_sink_exit' }
Config.DirtyNeedlesFailAnim = { dict = 'misscarsteal2_bin', anim = 'trev_sink_exit' }
Config.FailAnim = { dict = 'move_p_m_two_idles@generic', anim = 'fidget_sniff_fingers'} 

-- Search Animations --
BeachCanAnims = {
    { dict = 'anim@gangops@van@drive_grab@', anim = 'grab_drive' },
    { dict = 'amb@code_human_in_car_mp_actions@arse_pick@std@ps@base', anim = 'enter' },
    { dict = 'rcmepsilonism8', anim = 'bag_handler_grab_walk_left' },
    { dict = 'anim@scripted@player@freemode@gen_grab@heeled@', anim = 'low_multi' },
    { dict = 'anim@move_m@trash', anim = 'pickup' },
    { dict = 'anim@heists@prison_heiststation@heels', anim = 'pickup_bus_schedule' },
}

DumpsterAnims = {
    { dict = 'weapons@first_person@aim_idle@generic@melee@knife@shared@core', anim = 'fidget_low_loop' },
    -- { dict = 'missheistpaletoscore2', anim = 'dump_exit_franklin' },
    { dict = 'anim@gangops@facility@servers@bodysearch@', anim = 'player_search' },
    { dict = 'anim@gangops@morgue@table@', anim = 'player_search' },
    { dict = 'missexile3', anim = 'ex03_dingy_search_case_a_michael' },
    { dict = 'anim@amb@inspect@crouch@male_a@base', anim = 'base' },
}

GarbageCanAnims = {
    { dict = 'switch@trevor@garbage_food', anim = 'loop_trevor' },
    { dict = 'amb@prop_human_bum_bin@base', anim = 'base' },
    { dict = 'amb@prop_human_bum_bin@idle_b', anim = 'idle_d' },
    { dict = 'anim@heists@money_grab@briefcase', anim = 'enter' },
}

TrashBagAnims = {
    { dict = 'anim@gangops@facility@servers@bodysearch@', anim = 'player_search' },
    { dict = 'missexile3', anim = 'ex03_dingy_search_case_a_michael' },
    { dict = 'amb@medic@standing@kneel@base', anim = 'base' },
    { dict = 'amb@world_human_bum_wash@male@low@base', anim = 'base' },
    { dict = 'anim@am_hold_up@male', anim = 'shoplift_low' },


}


HideInDumpsterAnims ={
    { dict = 'anim@veh@apc@ds@enter_exit_front', anim = 'climb_up' },

}

KickedOutDumpsterAnims = {
    { dict = 'anim@veh@truck@squaddie@rps@enter_exit', anim = 'jump_out'},
   -- { dict = 'anim@veh@low@lm87@ds@enter_exit', anim = 'jump_out' },
}


Config.GetOutKey = 73 -- The key to get out of the dumpster while hiding inside. (Default: X)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Config.Lang table has been moved to shared/lang.lua