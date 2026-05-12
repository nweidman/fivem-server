Config.GeneralTiersConfig = {
    ["Spots"] = {
        ["RequireBag"] = false, -- If true, the player will need to have a bag in order to search loot spots
    },
    ["Props"] = {
        ["RequireBag"] = false, -- If true, the player will need to have a bag in order to take props
    },
    ["Cash"] = {
        ["RequireBag"] = false, -- If true, the player will need to have a bag in order to loot cash
    },
    ["Display"] = {
        ["RequireBag"] = false, -- If true, the player will need to have a bag in order to rob displays
        ["RequiredItem"] = "cutter", -- Item required (set to false if you don't want a required item)
        ["ItemBreakChance"] = 20, -- Chance of breaking the item required after opening the display
    },
    ["Painting"] = {
        ["RequireBag"] = false, -- If true, the player will need to have a bag in order to rob paintings
        ["ItemBreakChance"] = 20, -- Chance of breaking the item required after cutting the painting (WEAPON_SWITCHBLADE, this item can't be changed otherwise the animation wouldn't make sense)
        ["RequireSwitchBlade"] = false, -- If true, the player will need to have a switch blade in his inventory to be able to take items from the house
        ["RequiredItem"] = false, -- If you want an item to be required instead of the switchblade, add the item here and set ["RequireSwitchBlade"] to false
    },
    ["Safe"] = {
        ["RequireBag"] = false, -- If true, the player will need to have a bag in order to rob safes
        ["RequiredItem"] = false, -- Item required (set to false if you don't want a required item)
        ["ItemBreakChance"] = 20, -- Chance of breaking the item required after opening the safe
    },
}

Config.Tiers = {
    [1] = {
        ["Level"] = 0, -- Level required for this tier (exp system)

        ["Interior"] = "k4_house4_furn",

        ["Approach"] = {"door"}, -- Approaches available in this tier, could be a table or a string of 1 approach

        ["RequiredItemForLockpicking"] = "advancedlockpick", -- Required item to break into houses in this tier, set to false if u dont want a required item

        ["ExpOnDone"] = 10, -- Exp Reward on robbery done
        ["ExpForAllGroupMembers"] = false, -- If true, all group members will receive Exp (You need a group system in place for this to work)

        -- All Lootable Props and Spots (Pulls loot locations from house-presets.lua file depending on the Shell or IPL name)
        ["LootableSpots"] = {1, 2, 3, 4},
        ["LootableProps"] = {1, 2, 3},
        ["LootableCash"] =  {1},
        ["LootableSafes"] = {},
        ["LootableDisplays"] = {},
        ["LootablePaintings"] = {1},
        ["LootableHighValueItems"] = {},

        ["Spots"] = {
            ["Enable"] = true, -- Enable/Disable Props in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning props
            ["SpotCount"] = {min = 2, max = 4}, -- Number of cash spots that can spawn (Has to match the amount of LootableSpots configured)
        },

        ["Props"] = {
            ["Enable"] = true, -- Enable/Disable Props in the house
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 100, -- (%) Chance of spawning props
            ["PropCount"] = {min = 2, max = 3}, -- Number of prop spots that can spawn (Has to match the amount of LootableProps configured)
        },

        ["Cash"] = {
            ["Enable"] = true, -- Enable/Disable Cash in the house
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 100, -- (%) Chance of spawning cash
            ["CashCount"] = {min = 1, max = 1}, -- Number of cash spots that can spawn (Has to match the amount of LootableCash configured)
        },

        ["Painting"] = {
            ["Enable"] = true, -- Enable/Disable painting in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning paintings
            ["PaintingCount"] = {min = 1, max = 1}, -- Number of paintings that can spawn (Has to match the amount of LootablePaintings configured)
        },

        ["Tenants"] = {
            ["Enable"] = true, -- Enable/Disable tenants
            ["SpawnChance"] = 100, -- (%) Chance of spawning
            ["WeaponChance"] = 50, -- (%) Chance of tenant having a weapon
            ["RandomWeapons"] = {"WEAPON_BAT", "WEAPON_KNIFE", "WEAPON_PISTOL", "WEAPON_PUMPSHOTGUN"}, -- Weapons that can be given to tenants
            ["Count"] = {min = 1, max = 3}, -- max is 4 by default, if you want to add more, do it in house-presets.lua file
        },

        ["Pets"] = {
            ["Enable"] = true, -- Enable/Disable tenants
            ["SpawnChance"] = 40, -- (%) Chance of spawning
            ["Count"] = {min = 1, max = 1}, -- max is 2 by default, if you want to add more, do it in house-presets.lua file
        },

        ["LootTable"] = {
            LootPerSearch = {min = 1, max = 1}, -- How many different items that can be obtained per search
            FindingLootChance = 60, -- Chance of getting an item while searching
            LootChanceAfterAlarmTriggered = 40, -- Chance of getting an item while searching after the alarm is triggered
            Exp = {min = 3, max = 4},

            ["drawer"] = {  -- The total chance of this section should be = 100
                {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "advancedlockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 5, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "boostingtablet", Chance = 5, Amount = {min = 1, max = 1}},
            },
            ["cabinet"] = { -- The total chance of this section should be = 100
                {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "lockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
            ["closet"] = {  -- The total chance of this section should be = 100
                {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "advancedlockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
            },
            ["kitchen"] = {  -- The total chance of this section should be = 100
                {Name = "bandage", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "painkillers", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "ifaks", Chance = 18, Amount = {min = 1, max = 1}},
                {Name = "hoagie", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "bakingsoda", Chance = 14, Amount = {min = 1, max = 2}},
                {Name = "weapon_knife", Chance = 12, Amount = {min = 1, max = 1}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
        },
    },
    [2] = {
        ["Level"] = 2, -- Level required for this tier (exp system)

        ["Interior"] = "lev_apartment_shell",

        ["Approach"] = {"door"}, -- Approaches available in this tier, could be a table or a string of 1 approach

        ["RequiredItemForLockpicking"] = "advancedlockpick", -- Required item to break into houses in this tier, set to false if u dont want a required item

        ["ExpOnDone"] = 10, -- Exp Reward on robbery done
        ["ExpForAllGroupMembers"] = false, -- If true, all group members will receive Exp (You need a group system in place for this to work)

        -- All Lootable Props and Spots (Pulls loot locations from house-presets.lua file depending on the ["Shell"] or ["IPL"] name)
        ["LootableSpots"] = {1, 2, 3},
        ["LootableProps"] = {1, 2, 3},
        ["LootableCash"] =  {1},
        ["LootableSafes"] = {1},
        ["LootableDisplays"] = {},
        ["LootablePaintings"] = {},
        ["LootableHighValueItems"] = {1},

        ["Spots"] = {
            ["Enable"] = true, -- Enable/Disable Props in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning props
            ["SpotCount"] = {min = 3, max = 3}, -- Number of cash spots that can spawn (Has to match the amount of LootableSpots configured)
        },

        ["Props"] = {
            ["Enable"] = true, -- Enable/Disable Props in the house
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 100, -- (%) Chance of spawning props
            ["PropCount"] = {min = 2, max = 3}, -- Number of prop spots that can spawn (Has to match the amount of LootableProps configured)
        },

        ["Cash"] = {
            ["Enable"] = true, -- Enable/Disable Cash in the house
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 100, -- (%) Chance of spawning cash
            ["CashCount"] = {min = 1, max = 1}, -- Number of cash spots that can spawn (Has to match the amount of LootableCash configured)
        },

        ["Safe"] = {
            ["Enable"] = true, -- Enable/Disable safe in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning safes
            ["SafeCount"] = {min = 1, max = 1}, -- Number of safes that can spawn (Has to match the amount of LootableSafes configured)
            ["Exp"] = 10, -- XP Reward
            ["RewardCount"] = {min = 1, max = 2}, -- How many times it goes through the table to give rewards
            ["Reward"] = {
                {Name = "goldbar", Chance = 10, Amount = {min = 2, max = 3}},
                {Name = "tenkgoldchain", Chance = 20, Amount = {min = 3, max = 5}},
                {Name = "pistol_ammo", Chance = 20, Amount = {min = 10, max = 36}},
                {Name = "weapon_pistol", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "weapon_vintagepistol", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "hackdevice", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "shotgunbody", Chance = 5, Amount = {min = 1, max = 1}},
                {Name = "shotgunbarrel", Chance = 5, Amount = {min = 1, max = 1}},
                {Name = "pistolparts", Chance = 10, Amount = {min = 2, max = 5}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
        },

        ["HighValueItems"] = {
            ["Enable"] = true, -- Enable/Disable high value item
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 50, -- (%) Chance of spawning
        },

        ["Tenants"] = {
            ["Enable"] = true, -- Enable/Disable tenants
            ["SpawnChance"] = 100, -- (%) Chance of spawning
            ["WeaponChance"] = 50, -- (%) Chance of tenant having a weapon
            ["RandomWeapons"] = {"WEAPON_BAT", "WEAPON_KNIFE", "WEAPON_PISTOL", "WEAPON_PUMPSHOTGUN"}, -- Weapons that can be given to tenants
            ["Count"] = {min = 2, max = 3}, -- max is 4 by default, if you want to add more, do it in house-presets.lua file
        },

        ["Pets"] = {
            ["Enable"] = true, -- Enable/Disable tenants
            ["SpawnChance"] = 80, -- (%) Chance of spawning
            ["Count"] = {min = 1, max = 1}, -- max is 2 by default, if you want to add more, do it in house-presets.lua file
        },

        ["LootTable"] = {
            LootPerSearch = {min = 1, max = 1}, -- How many different items that can be obtained per search
            FindingLootChance = 70, -- Chance of getting an item while searching
            LootChanceAfterAlarmTriggered = 50, -- Chance of getting an item while searching after the alarm is triggered
            Exp = {min = 5, max = 6},

            ["drawer"] = {  -- The total chance of this section should be = 100
                {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "advancedlockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
            },
            ["cabinet"] = {  -- The total chance of this section should be = 100
                {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "advancedlockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 5, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "boostingtablet", Chance = 5, Amount = {min = 1, max = 1}},
            },
            ["closet"] = {  -- The total chance of this section should be = 100
                {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "advancedlockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
            },
            ["kitchen"] = {  -- The total chance of this section should be = 100
                {Name = "bandage", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "painkillers", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "ifaks", Chance = 18, Amount = {min = 1, max = 1}},
                {Name = "hoagie", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "bakingsoda", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "weapon_knife", Chance = 10, Amount = {min = 1, max = 1}},
            },
        },
    },
    [3] = {
        ["Level"] = 1, -- Level required for this tier (exp system)

        ["Interior"] = "k4_house4_furn",

        ["Approach"] = {"door"}, -- Approaches available in this tier, could be a table or a string of 1 approach

        ["RequiredItemForLockpicking"] = "advancedlockpick", -- Required item to break into houses in this tier, set to false if u dont want a required item

        ["ExpOnDone"] = 10, -- Exp Reward on robbery done
        ["ExpForAllGroupMembers"] = false, -- If true, all group members will receive Exp (You need a group system in place for this to work)

        -- All Lootable Props and Spots (Pulls loot locations from house-presets.lua file depending on the ["Shell"] or ["IPL"] name)
        ["LootableSpots"] = {1, 3, 4, 5},
        ["LootableProps"] = {2},
        ["LootableCash"] =  {1},
        ["LootableSafes"] = {1},
        ["LootableDisplays"] = {1},
        ["LootablePaintings"] = {1},
        ["LootableHighValueItems"] = {1},

        ["Spots"] = {
            ["Enable"] = true, -- Enable/Disable Props in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning props
            ["SpotCount"] = {min = 3, max = 3}, -- Number of cash spots that can spawn (Has to match the amount of LootableSpots configured)
        },

        ["Props"] = {
            ["Enable"] = true, -- Enable/Disable Props in the house
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 100, -- (%) Chance of spawning props
            ["PropCount"] = {min = 1, max = 2}, -- Number of prop spots that can spawn (Has to match the amount of LootableProps configured)
        },

        ["Cash"] = {
            ["Enable"] = true, -- Enable/Disable Cash in the house
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 100, -- (%) Chance of spawning cash
            ["CashCount"] = {min = 1, max = 1}, -- Number of cash spots that can spawn (Has to match the amount of LootableCash configured)
        },

        ["Display"] = {
            ["Enable"] = false, -- Enable/Disable Displays in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning displays
            ["DisplayCount"] = {min = 1, max = 1}, -- Number of displays that can spawn (Has to match the amount of LootableDisplays configured)
        },

        ["Painting"] = {
            ["Enable"] = true, -- Enable/Disable painting in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning paintings
            ["PaintingCount"] = {min = 1, max = 1}, -- Number of paintings that can spawn (Has to match the amount of LootablePaintings configured)
        },

        ["Safe"] = {
            ["Enable"] = true, -- Enable/Disable safe in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning safes
            ["SafeCount"] = {min = 1, max = 1}, -- Number of safes that can spawn (Has to match the amount of LootableSafes configured)
            ["Exp"] = 10, -- XP Reward
            ["RewardCount"] = {min = 1, max = 2}, -- How many times it goes through the table to give rewards
            ["Reward"] = {
                {Name = "goldbar", Chance = 10, Amount = {min = 2, max = 3}},
                {Name = "tenkgoldchain", Chance = 20, Amount = {min = 3, max = 5}},
                {Name = "pistol_ammo", Chance = 20, Amount = {min = 10, max = 36}},
                {Name = "weapon_pistol", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "weapon_vintagepistol", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "hackdevice", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "shotgunbody", Chance = 5, Amount = {min = 1, max = 1}},
                {Name = "shotgunbarrel", Chance = 5, Amount = {min = 1, max = 1}},
                {Name = "pistolparts", Chance = 10, Amount = {min = 2, max = 5}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
        },

        ["HighValueItems"] = {
            ["Enable"] = false, -- Enable/Disable high value item
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 100, -- (%) Chance of spawning
        },

        ["Tenants"] = {
            ["Enable"] = true, -- Enable/Disable tenants
            ["SpawnChance"] = 100, -- (%) Chance of spawning
            ["WeaponChance"] = 50, -- (%) Chance of tenant having a weapon
            ["RandomWeapons"] = {"WEAPON_BAT", "WEAPON_KNIFE", "WEAPON_PISTOL", "WEAPON_PUMPSHOTGUN"}, -- Weapons that can be given to tenants
            ["Count"] = {min = 3, max = 4}, -- max is 4 by default, if you want to add more, do it in house-presets.lua file
        },

        ["Pets"] = {
            ["Enable"] = true, -- Enable/Disable tenants
            ["SpawnChance"] = 100, -- (%) Chance of spawning
            ["Count"] = {min = 1, max = 2}, -- max is 2 by default, if you want to add more, do it in house-presets.lua file
        },

        ["LootTable"] = {
            LootPerSearch = {min = 1, max = 1}, -- How many different items that can be obtained per search
            FindingLootChance = 80, -- Chance of getting an item while searching
            LootChanceAfterAlarmTriggered = 60, -- Chance of getting an item while searching after the alarm is triggered
            Exp = {min = 7, max = 8},

            ["drawer"] = {  -- The total chance of this section should be = 100
                {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "advancedlockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
            },
            ["cabinet"] = {  -- The total chance of this section should be = 100
                {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "advancedlockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 5, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "boostingtablet", Chance = 5, Amount = {min = 1, max = 1}},
            },
            ["closet"] = {  -- The total chance of this section should be = 100
                {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "advancedlockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
            },
            ["kitchen"] = {  -- The total chance of this section should be = 100
                 {Name = "bandage", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "painkillers", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "ifaks", Chance = 18, Amount = {min = 1, max = 1}},
                {Name = "hoagie", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "bakingsoda", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "weapon_knife", Chance = 10, Amount = {min = 1, max = 1}},
            },
        },
    },
    [4] = {
        ["Level"] = 3, -- Level required for this tier (exp system)

        ["Interior"] = "MissionRowApartment",

        ["Approach"] = {"door"}, -- Approaches available in this tier, could be a table or a string of 1 approach

        ["RequiredItemForLockpicking"] = "advancedlockpick", -- Required item to break into houses in this tier, set to false if u dont want a required item

        ["ExpOnDone"] = 10, -- Exp Reward on robbery done
        ["ExpForAllGroupMembers"] = false, -- If true, all group members will receive Exp (You need a group system in place for this to work)

        -- All Lootable Props and Spots (Pulls loot locations from house-presets.lua file depending on the ["Shell"] name)
        ["LootableSpots"] = {1, 2, 3, 4, 5},
        ["LootableProps"] = {1, 2, 3},
        ["LootableCash"] =  {1, 2},
        ["LootableSafes"] = {},
        ["LootableDisplays"] = {},
        ["LootablePaintings"] = {},
        ["LootableHighValueItems"] = {1},

        ["Spots"] = {
            ["Enable"] = true, -- Enable/Disable Props in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning props
            ["SpotCount"] = {min = 4, max = 5}, -- Number of cash spots that can spawn (Has to match the amount of LootableSpots configured)
        },

        ["Props"] = {
            ["Enable"] = true, -- Enable/Disable Props in the house
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 100, -- (%) Chance of spawning props
            ["PropCount"] = {min = 3, max = 3}, -- Number of prop spots that can spawn (Has to match the amount of LootableProps configured)
        },

        ["Cash"] = {
            ["Enable"] = true, -- Enable/Disable Cash in the house
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 100, -- (%) Chance of spawning cash
            ["CashCount"] = {min = 2, max = 2}, -- Number of cash spots that can spawn (Has to match the amount of LootableCash configured)
        },

        ["HighValueItems"] = {
            ["Enable"] = false, -- Enable/Disable high value item
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 100, -- (%) Chance of spawning
        },

        ["Tenants"] = {
            ["Enable"] = true, -- Enable/Disable tenants
            ["SpawnChance"] = 100, -- (%) Chance of spawning
            ["WeaponChance"] = 50, -- (%) Chance of tenant having a weapon
            ["RandomWeapons"] = {"WEAPON_BAT", "WEAPON_KNIFE", "WEAPON_PISTOL", "WEAPON_PUMPSHOTGUN"}, -- Weapons that can be given to tenants
            ["Count"] = {min = 3, max = 5}, -- max is 4 by default, if you want to add more, do it in house-presets.lua file
        },

        ["Pets"] = {
            ["Enable"] = true, -- Enable/Disable tenants
            ["SpawnChance"] = 100, -- (%) Chance of spawning
            ["Count"] = {min = 2, max = 2}, -- max is 2 by default, if you want to add more, do it in house-presets.lua file
        },

        ["LootTable"] = {
            LootPerSearch = {min = 1, max = 1}, -- How many different items that can be obtained per search
            FindingLootChance = 85, -- Chance of getting an item while searching
            LootChanceAfterAlarmTriggered = 65, -- Chance of getting an item while searching after the alarm is triggered
            Exp = {min = 9, max = 10},

            ["drawer"] = {  -- The total chance of this section should be = 100
                 {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "lockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
            ["cabinet"] = {  -- The total chance of this section should be = 100
                 {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "lockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 3, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "boostingtablet", Chance = 5, Amount = {min = 1, max = 1}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
            ["closet"] = {  -- The total chance of this section should be = 100
                 {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "lockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
            ["kitchen"] = {  -- The total chance of this section should be = 100
                {Name = "bandage", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "painkillers", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "ifaks", Chance = 18, Amount = {min = 1, max = 1}},
                {Name = "hoagie", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "bakingsoda", Chance = 14, Amount = {min = 1, max = 2}},
                {Name = "weapon_knife", Chance = 12, Amount = {min = 1, max = 1}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
        },
    },
    [5] = {
        ["Level"] = 4, -- Level required for this tier (exp system)

        ["Interior"] = "EclipseTowersPenthouse2",

        ["Approach"] = {"door"}, -- Approaches available in this tier, could be a table or a string of 1 approach

        ["RequiredItemForLockpicking"] = "advancedlockpick", -- Required item to break into houses in this tier, set to false if u dont want a required item

        ["ExpOnDone"] = 10, -- Exp Reward on robbery done
        ["ExpForAllGroupMembers"] = false, -- If true, all group members will receive Exp (You need a group system in place for this to work)

        -- All Lootable Props and Spots (Pulls loot locations from house-presets.lua file depending on the ["Shell"] name)
        ["LootableSpots"] = {1, 2, 3, 4, 5},
        ["LootableProps"] = {1, 2, 3, 4, 5},
        ["LootableCash"] =  {1, 2},
        ["LootableSafes"] = {1},
        ["LootableDisplays"] = {1},
        ["LootablePaintings"] = {1, 2},
        ["LootableHighValueItems"] = {1},

        ["Spots"] = {
            ["Enable"] = true, -- Enable/Disable Props in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning props
            ["SpotCount"] = {min = 4, max = 5}, -- Number of cash spots that can spawn (Has to match the amount of LootableSpots configured)
        },

        ["Props"] = {
            ["Enable"] = true, -- Enable/Disable Props in the house
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 100, -- (%) Chance of spawning props
            ["PropCount"] = {min = 5, max = 5}, -- Number of prop spots that can spawn (Has to match the amount of LootableProps configured)
        },

        ["Cash"] = {
            ["Enable"] = true, -- Enable/Disable Cash in the house
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 100, -- (%) Chance of spawning cash
            ["CashCount"] = {min = 2, max = 2}, -- Number of cash spots that can spawn (Has to match the amount of LootableCash configured)
        },

        ["Display"] = {
            ["Enable"] = true, -- Enable/Disable Displays in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning displays
            ["DisplayCount"] = {min = 1, max = 1}, -- Number of displays that can spawn (Has to match the amount of LootableDisplays configured)
        },

        ["Painting"] = {
            ["Enable"] = true, -- Enable/Disable painting in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning paintings
            ["PaintingCount"] = {min = 2, max = 2}, -- Number of paintings that can spawn (Has to match the amount of LootablePaintings configured)
        },

        ["Safe"] = {
            ["Enable"] = true, -- Enable/Disable safe in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning safes
            ["SafeCount"] = {min = 1, max = 1}, -- Number of safes that can spawn (Has to match the amount of LootableSafes configured)
            ["Exp"] = 10, -- XP Reward
            ["RewardCount"] = {min = 1, max = 1}, -- How many times it goes through the table to give rewards
            ["Reward"] = {
                {Name = "goldbar", Chance = 10, Amount = {min = 2, max = 3}},
                {Name = "tenkgoldchain", Chance = 20, Amount = {min = 3, max = 5}},
                {Name = "pistol_ammo", Chance = 20, Amount = {min = 10, max = 36}},
                {Name = "weapon_pistol", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "weapon_vintagepistol", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "hackdevice", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "shotgunbody", Chance = 5, Amount = {min = 1, max = 1}},
                {Name = "shotgunbarrel", Chance = 5, Amount = {min = 1, max = 1}},
                {Name = "pistolparts", Chance = 10, Amount = {min = 2, max = 5}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
        },

        ["HighValueItems"] = {
            ["Enable"] = true, -- Enable/Disable high value item
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 100, -- (%) Chance of spawning
        },

        ["Tenants"] = {
            ["Enable"] = true, -- Enable/Disable tenants
            ["SpawnChance"] = 100, -- (%) Chance of spawning
            ["WeaponChance"] = 100, -- (%) Chance of tenant having a weapon
            ["RandomWeapons"] = {"WEAPON_BAT", "WEAPON_KNIFE", "WEAPON_PISTOL", "WEAPON_PUMPSHOTGUN"}, -- Weapons that can be given to tenants
            ["Count"] = {min = 3, max = 5}, -- max is 4 by default, if you want to add more, do it in house-presets.lua file
        },

        ["Pets"] = {
            ["Enable"] = true, -- Enable/Disable tenants
            ["SpawnChance"] = 100, -- (%) Chance of spawning
            ["Count"] = {min = 2, max = 3}, -- max is 2 by default, if you want to add more, do it in house-presets.lua file
        },

        ["LootTable"] = {
            LootPerSearch = {min = 1, max = 1}, -- How many different items that can be obtained per search
            FindingLootChance = 90, -- Chance of getting an item while searching
            LootChanceAfterAlarmTriggered = 70, -- Chance of getting an item while searching after the alarm is triggered
            Exp = {min = 9, max = 10},

            ["drawer"] = {  -- The total chance of this section should be = 100
                {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "lockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
            ["cabinet"] = {  -- The total chance of this section should be = 100
                {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "lockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 3, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "boostingtablet", Chance = 5, Amount = {min = 1, max = 1}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
            ["closet"] = {  -- The total chance of this section should be = 100
                {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "lockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
            ["kitchen"] = {  -- The total chance of this section should be = 100
                {Name = "bandage", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "painkillers", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "ifaks", Chance = 18, Amount = {min = 1, max = 1}},
                {Name = "hoagie", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "bakingsoda", Chance = 14, Amount = {min = 1, max = 2}},
                {Name = "weapon_knife", Chance = 12, Amount = {min = 1, max = 1}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
        },
    },
    [6] = {
        ["Level"] = 5, -- Level required for this tier (exp system)

        ["Interior"] = "3655WildOatsDrive",

        ["Approach"] = {"door"}, -- Approaches available in this tier, could be a table or a string of 1 approach

        ["RequiredItemForLockpicking"] = "advancedlockpick", -- Required item to break into houses in this tier, set to false if u dont want a required item

        ["ExpOnDone"] = 10, -- Exp Reward on robbery done
        ["ExpForAllGroupMembers"] = false, -- If true, all group members will receive Exp (You need a group system in place for this to work)

        -- All Lootable Props and Spots (Pulls loot locations from house-presets.lua file depending on the ["Shell"] name)
        ["LootableSpots"] = {1, 2, 4, 5},
        ["LootableProps"] = {1, 2, 3},
        ["LootableCash"] =  {1, 2},
        ["LootableSafes"] = {1},
        ["LootableDisplays"] = {1},
        ["LootablePaintings"] = {1},
        ["LootableHighValueItems"] = {},

        ["Spots"] = {
            ["Enable"] = true, -- Enable/Disable Props in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning props
            ["SpotCount"] = {min = 4, max = 4}, -- Number of cash spots that can spawn (Has to match the amount of LootableSpots configured)
        },

        ["Props"] = {
            ["Enable"] = true, -- Enable/Disable Props in the house
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 100, -- (%) Chance of spawning props
            ["PropCount"] = {min = 3, max = 3}, -- Number of prop spots that can spawn (Has to match the amount of LootableProps configured)
        },

        ["Cash"] = {
            ["Enable"] = true, -- Enable/Disable Cash in the house
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 100, -- (%) Chance of spawning cash
            ["CashCount"] = {min = 2, max = 2}, -- Number of cash spots that can spawn (Has to match the amount of LootableCash configured)
        },

        ["Display"] = {
            ["Enable"] = true, -- Enable/Disable Displays in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning displays
            ["DisplayCount"] = {min = 1, max = 1}, -- Number of displays that can spawn (Has to match the amount of LootableDisplays configured)
        },

        ["Painting"] = {
            ["Enable"] = true, -- Enable/Disable painting in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning paintings
            ["PaintingCount"] = {min = 1, max = 1}, -- Number of paintings that can spawn (Has to match the amount of LootablePaintings configured)
        },

        ["Safe"] = {
            ["Enable"] = true, -- Enable/Disable safe in the house

            ["SpawnChance"] = 100, -- (%) Chance of spawning safes
            ["SafeCount"] = {min = 1, max = 1}, -- Number of safes that can spawn (Has to match the amount of LootableSafes configured)
            ["Exp"] = 10, -- XP Reward
            ["RewardCount"] = {min = 1, max = 2}, -- How many times it goes through the table to give rewards
            ["Reward"] = {
                {Name = "goldbar", Chance = 10, Amount = {min = 2, max = 3}},
                {Name = "tenkgoldchain", Chance = 20, Amount = {min = 3, max = 5}},
                {Name = "pistol_ammo", Chance = 20, Amount = {min = 10, max = 36}},
                {Name = "weapon_pistol", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "weapon_vintagepistol", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "hackdevice", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "shotgunbody", Chance = 5, Amount = {min = 1, max = 1}},
                {Name = "shotgunbarrel", Chance = 5, Amount = {min = 1, max = 1}},
                {Name = "pistolparts", Chance = 10, Amount = {min = 2, max = 5}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
        },

        ["HighValueItems"] = {
            ["Enable"] = false, -- Enable/Disable high value item
            ["Outline"] = false, -- Enable/Disable outline on props

            ["SpawnChance"] = 100, -- (%) Chance of spawning
        },

        ["Tenants"] = {
            ["Enable"] = true, -- Enable/Disable tenants
            ["SpawnChance"] = 100, -- (%) Chance of spawning
            ["WeaponChance"] = 50, -- (%) Chance of tenant having a weapon
            ["RandomWeapons"] = {"WEAPON_BAT", "WEAPON_KNIFE", "WEAPON_PISTOL"}, -- Weapons that can be given to tenants
            ["Count"] = {min = 1, max = 3}, -- max is 4 by default, if you want to add more, do it in house-presets.lua file
        },

        ["Pets"] = {
            ["Enable"] = true, -- Enable/Disable tenants
            ["SpawnChance"] = 100, -- (%) Chance of spawning
            ["Count"] = {min = 1, max = 2}, -- max is 2 by default, if you want to add more, do it in house-presets.lua file
        },

        ["LootTable"] = {
            LootPerSearch = {min = 1, max = 1}, -- How many different items that can be obtained per search
            FindingLootChance = 90, -- Chance of getting an item while searching
            LootChanceAfterAlarmTriggered = 70, -- Chance of getting an item while searching after the alarm is triggered
            Exp = {min = 9, max = 10},

            ["drawer"] = {  -- The total chance of this section should be = 100
                 {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "advancedlockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
            ["cabinet"] = {  -- The total chance of this section should be = 100
                {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "advancedlockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 3, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "boostingtablet", Chance = 5, Amount = {min = 1, max = 1}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
            ["closet"] = {  -- The total chance of this section should be = 100
                {Name = "rolex", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "goldchain", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "diamond", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "advancedlockpick", Chance = 10, Amount = {min = 1, max = 1}},
                {Name = "cryptostick", Chance = 10, Amount = {min = 1, max = 3}},
                {Name = "wires", Chance = 10, Amount = {min = 1, max = 2}},
                {Name = "circuitboard", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "cryptoharddrive", Chance = 8, Amount = {min = 1, max = 1}},
                {Name = "phone", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "fitbit", Chance = 4, Amount = {min = 1, max = 1}},
                {Name = "laptop", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "cutter", Chance = 6, Amount = {min = 1, max = 1}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
            ["kitchen"] = {  -- The total chance of this section should be = 100
                {Name = "bandage", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "painkillers", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "ifaks", Chance = 18, Amount = {min = 1, max = 1}},
                {Name = "hoagie", Chance = 18, Amount = {min = 1, max = 2}},
                {Name = "bakingsoda", Chance = 14, Amount = {min = 1, max = 2}},
                {Name = "weapon_knife", Chance = 12, Amount = {min = 1, max = 1}},
                {Name = "whiteusb", Chance = 2, Amount = {min = 1, max = 1}},
            },
        },
    },
}