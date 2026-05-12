-- ──────────────────────────────────────────────────────────────────────────────
-- Dependency Check Helper                                                     
-- (Information) ► Returns the first matching started resource alias from provided table.
-- (Information) ► Used by Fuel/Keys/TextUI/Inventory/Target detection above.
-- ──────────────────────────────────────────────────────────────────────────────
function scriptCheck(data)            -- Do not modify unless you know what you're doing.
    for k, v in pairs(data) do
        if GetResourceState(k):find('started') ~= nil then
            return v
        end
    end
    return false
end

-- ──────────────────────────────────────────────────────────────────────────────
--  OTHERPLANET / OP Gangs 3.0 Main CONFIGURATION
-- ──────────────────────────────────────────────────────────────────────────────
--  This configuration file controls all customizable behaviour of OP Gangs 3.0.
--  Always make a backup before editing.
--  Wrong edits can break the resource.
-- ──────────────────────────────────────────────────────────────────────────────

Config = {}                           

-- ──────────────────────────────────────────────────────────────────────────────
-- Locale & Debug                                                             
-- (Information) ► Locale controls which language file from locales/* will be used.
-- (Information) ► Debug enables extra logging to help with issue tracking.
-- ──────────────────────────────────────────────────────────────────────────────
Config.Locale = "en"                  -- Supported: PL / ES / LT / HU / EN / FR / IT / PT / SK / TW / HR / EL / CZ / SI / AR / TR / DE / SV / NL / NO
Config.Debug  = false                 -- true = verbose debug output in console.

-- ──────────────────────────────────────────────────────────────────────────────
-- TIMEZONE                                                         
-- (Information) ► Full list of timezones is available in AvailableTimeZones.json
-- ──────────────────────────────────────────────────────────────────────────────

Config.TimeZone = "America/New_York"

-- ──────────────────────────────────────────────────────────────────────────────
-- Fuel Dependency Detection                                                   
-- (Information) ► Auto-detects your active fuel resource.
-- (Information) ► To add support for another fuel script, extend the list below and 
-- (Information) ► handle logic in the integrations where fuel is used.
-- ──────────────────────────────────────────────────────────────────────────────
local fuelScripts = {                 
    ['cdn-fuel']        = "cdn-fuel",
    ['ox_fuel']         = "ox-fuel",
    ['ps-fuel']         = "ps-fuel",
    ['LegacyFuel']      = "LegacyFuel",
    ['rcore_fuel']      = "rcore-fuel",
    ['codem-xfuel']     = "codem-xfuel",
    ['lc_fuel']         = "lc_fuel",
    ['stg-fuel']        = "stg-fuel",
}
Config.FuelDependency = scriptCheck(fuelScripts) or 'none'

-- ──────────────────────────────────────────────────────────────────────────────
-- Vehicle Keys Dependency Detection                                           
-- (Information) ► Auto-detects supported vehicle key systems.
-- (Information) ► If none is found, script will behave as if no key system is present.
-- ──────────────────────────────────────────────────────────────────────────────
local keyScripts = {                  
    ['brutal_keys']        = "brutal_keys",
    ['qbx_vehiclekeys'] = "qb-keys",
    ['qb-vehiclekeys']            = "qb-keys",
    ['wasabi_carlock']     = "wasabi_carlock",
    ['sna-vehiclekeys']    = "sna-vehiclekeys",
    ['dusa_vehiclekeys']   = "dusa_vehiclekeys",
    ['Renewed-Vehiclekeys']= "Renewed-Vehiclekeys",
    ['tgiann-hotwire']     = "tgiann-keys",
    ['ak47_vehiclekeys']   = "ak47_vehiclekeys",
    ['ak47_qb_vehiclekeys']= "ak47_qb_vehiclekeys",
    ['mVehicle']           = "mVehicle",
    ['sy_carkeys']         = "sy_carkeys",
    ['MrNewbVehicleKeys']  = "MrNewbVehicleKeys",
    ['vehicles_keys']      = "vehicles_keys",
}
Config.KeysDependency = scriptCheck(keyScripts) or 'none'

-- ──────────────────────────────────────────────────────────────────────────────
-- Text UI Dependency Detection                                                
-- (Information) ► Auto-detects supported 3D/2D Text UI libraries.
-- (Information) ► If none is found, some prompts may fallback to default behaviour.
-- ──────────────────────────────────────────────────────────────────────────────
local textUIScripts = {              
    ['ox_lib']        = "ox_lib",
    ['jg-textui']     = "jg-textui",
    ['okokTextUI']    = "okokTextUI",
    ['brutal_textui'] = "brutal_textui",
    ['0r-textui']     = "0r-textui",
}
Config.TextUI = scriptCheck(textUIScripts) or 'none' 

-- ──────────────────────────────────────────────────────────────────────────────
-- Garage Script                                                               
-- (Information) ► Manual selection of external garage script integration.
-- (Information) ► If set to 'none', OP-Crime will handle garage logic internally where applicable.
-- ──────────────────────────────────────────────────────────────────────────────
Config.GarageScript = 'jg-advancedgarages'          -- Options: 'none', 'op-garages', 'jg-advancedgarages'

-- ──────────────────────────────────────────────────────────────────────────────
-- Additional Script Integrations                                              
-- (Information) ► Toggle support for optional helper resources.
-- ──────────────────────────────────────────────────────────────────────────────
Config.AdditionalScripts = {         
    kq_shellcreator  = false,         -- (Information) ► true if you are using kq_shellcreator.
    advancedParking  = false          -- (Information) ► true if you use AdvancedParking.
}

local dispatchScripts = {            
    ['cd_dispatch']        = "cd_dispatch",
    ['codem_dispatch']     = "codem_dispatch",
    ['kartik-mdt']         = "kartik-mdt",
    ['lb-tablet']          = "lb-tablet",
    ['ps-dispatch']        = "ps-dispatch",
    ['rcore_dispatch']     = "rcore_dispatch",
    ['aty_dispatchv2']     = "aty_dispatchv2",
    ['frkn-dispatch']      = "frkn-dispatch",
    ['tk_dispatch']        = "tk_dispatch",
}
Config.dispatchScript = scriptCheck(dispatchScripts) or 'none'

-- ──────────────────────────────────────────────────────────────────────────────
-- Inventory System Detection                                                  
-- (Information) ► Auto-detects currently started inventory system.
-- (Information) ► To support more inventories, extend the list and update inventory integration.
-- ──────────────────────────────────────────────────────────────────────────────
local inventoryScripts = {            
    ['ox_inventory']     = "ox_inventory",
    ['qb-inventory']     = "qb-inventory",
    ['codem-inventory']  = "codem-inventory",
    ['tgiann-inventory'] = "tgiann_inventory",
    ['origen_inventory'] = "origen_inventory",
}

-- If you're using QB Inventory and it's not working properly set below option to:
-- Config.Inventory = {                  
--     inventoryScript = 'old-qb-inventory'
-- }

Config.Inventory = {                  
    inventoryScript = scriptCheck(inventoryScripts) or 'none'
}

-- ──────────────────────────────────────────────────────────────────────────────
-- Currency Formatting                                                         
-- (Information) ► Visual formatting of money values in the UI (JS Intl.NumberFormat).
-- (Information) ► This does NOT change internal game currency logic, only display.
-- ──────────────────────────────────────────────────────────────────────────────
Config.CurrencySettings = {           
    -- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat
    currency = "USD",                 -- 'USD','EUR','PLN', etc.
    style    = "currency",            -- 'currency','decimal','percent','unit'
    format   = "en-US"                -- Locale string for formatting.
}

-- ──────────────────────────────────────────────────────────────────────────────
-- Dirty Money Handling                                                        
-- (Information) ► ESX: Uses default 'black_money' account automatically.
-- (Information) ► QB/QBOX: Uses configured item as dirty cash equivalent.
-- ──────────────────────────────────────────────────────────────────────────────
Config.DirtyMoney = {                 
    itemName = "markedbills" -- Dirty money item name on QB/QBOX.
}

-- ──────────────────────────────────────────────────────────────────────────────
-- ⚒️ MISC CONFIGURATION ⚒️                                                   
-- (Information) ► General behaviour, markers, notifications, ranking limits, etc.
-- ──────────────────────────────────────────────────────────────────────────────

local targets = { -- Target libraries detection
    ['ox_target'] = "ox-target",
    ['qb-target'] = "qb-target"
}

local notifyScripts = { -- Notify libraries detection
    ['op-hud'] = "op_hud",
    -- ['okokNotify'] = "okokNotify",
    ['vms_notify'] = "vms_notify",
    ['ox_lib'] = "ox_lib",
    ['brutal_notify'] = "brutal_notify",
}

Config.Misc = {                       
    AccessMethod = scriptCheck(targets) or 'none', --  'ox-target' / 'qb-target' / 'none'
    zoneSize = 1.2,                   -- Marker radius for interaction zones.
    zoneColor = {                     -- Marker color (RGB).
        r = 219,
        g = 0,
        b = 0,
    },
    TowingTime = 5,                                -- Towing time in seconds.
    Notify = scriptCheck(notifyScripts) or 'none', -- Notify system: none / ESX / QBCORE / QBOX or auto detected from list 'notifyScripts'
    stashCapacityUpgradePer = 5,                   -- One stash upgrade = +X KG. Note: Changing this requires your changes in Locale file! UI description (will still display that upgrade adds 5kg until you adjust translation)
    ranksLimit   = 15,                              -- Max number of ranks per organisation.
    membersLimit = 20,                             -- Max number of members per organisation.
    limitBossMenu = false,                         -- true = only one player can access bossmenu at once. Note: You can limit bossmenu to one player at a time!
    disableGarage = true,                         -- true = completely disable garages & vehicle shop in bossmenu.
    disableDarkChat = false,                       -- true = disable darkchat in crime tablet.
    disableDarkChatNotificationAboveMap = true,   -- true = disable on-screen darkchat notifications.
    disableRanking = false,                        -- true = disable ranking page in tablet.
    defaultStashWeight = 5,                        -- Default Stash KG for new Gangs.
    defaultRanksSlotsAmount = 15,                   -- Default Ranks Slots for new Gangs.
    defaultRanksMembersAmount = 20,                 -- Default Member Slots for new Gangs.
    useDirtyMoneyInBossmenu = false,               -- Use Dirty money to purchase upgrades in bossmenu.
    disableGangBlip = true,                       -- Disables Gang Location Blip on gta Map
    disableStashes = false,                        -- Disable Stashes
} 

Config.SellVehiclePercentage = 20     -- Percentage of original vehicle price when selling in bossmenu.

-- ──────────────────────────────────────────────────────────────────────────────
-- Admin Commands & Permissions                                                
-- (Information) ► Configure admin commands and who is allowed to use them.
-- ──────────────────────────────────────────────────────────────────────────────
Config.AdminPanelCommand   = "managegangs"   -- Command for Crime Admin Panel.
Config.SetJobCommand       = "addgang"  -- Command to set selected player's crime job.
Config.AddCrimeVehicle     = "addgangcar"  -- Command to add vehicle to selected organisation.
Config.FireCommand         = "removegang"   -- Command to fire member from current organisation.
Config.ResetGangsStats     = "resetgangstats" -- Wipes all gangs stats (zones, missions, etc.) used in ranking.

-- List of allowed identifiers to use admin Commands /setcrimejob and /addcrimecar
-- (Information) ► Use identifiers from txAdmin -> IDs (no hardware IDs!).
-- (Information) ► You can also use character identifiers or citizenid on QBOX/QB.
-- E.g.: char1:7e0ec7b80d186fd8c29f6631e4377e75812fe8fd
Config.AdminCommandsPlayers = {      
    --['license:94792cad7ae764305aae8f1372d3cd287848ae7c'] = true,
    --['discord:571105311251890186'] = true,
    ['discord:210242805581348876'] = true, -- Damon
    ['discord:267509005910278146'] = true, -- Rae
    ['discord:226764257453146112'] = true, -- Buster
    ['discord:172885003053694976'] = true, -- Ava
    ['discord:198251263299682313'] = true, -- Kim
    ['discord:528824687850029067'] = true  -- Prospek
}

-- List of allowed identifiers to use /crimeadmin
-- Same rules as above (txAdmin IDs / character identifiers / citizenid).
Config.AdminPanelPlayers = {          
    --['license:94792cad7ae764305aae8f1372d3cd287848ae7c'] = true,
    --['discord:571105311251890186'] = true,
    ['discord:210242805581348876'] = true, -- Damon
    ['discord:267509005910278146'] = true, -- Rae
    ['discord:226764257453146112'] = true, -- Buster
    ['discord:172885003053694976'] = true, -- Ava
    ['discord:198251263299682313'] = true, -- Kim
    ['discord:528824687850029067'] = true  -- Prospek
}

-- List of allowed Ranks to use Admin Commands and Admin Panel.
Config.RanksPermissions = {
    AdminCommandsPlayers = {
        ['esx'] = {'superadmin', 'admin', 'mod', },
        ['qbcore'] = {'god', 'admin', },
        ['qbox'] = {'god', 'admin', },
    },
    AdminPanelPlayers = {
        ['esx'] = {'superadmin', 'admin', 'mod', },
        ['qbcore'] = {'god', 'admin', },
        ['qbox'] = {'god', 'admin', },
    },
}

-- ──────────────────────────────────────────────────────────────────────────────
-- 📱 TABLET CONFIGURATION 📱                                                 
-- (Information) ► Controls how crime tablet is accessed and how missions are handled.
-- ──────────────────────────────────────────────────────────────────────────────
Config.Tablet = {                     
    tabletASItem = false,             -- true = tablet is usable item, false = command-based.
    commandName = "gangmenu",      -- Command used when tabletASItem is false.
    item = {
        name = "crime_tablet"         -- Required item name if tabletASItem is true.
    },
    MissionsPerRestart = 3,           -- How many missions per organisation per update.
    DisableSeasonPass = true,        -- true = disable season pass feature Completly (As well from Boss Menu and Admin Panel).
    DisableFrames = false,            -- true = hide tablet frame UI elements.
    Animation = { -- Tablet Animation
        enable = true,
        dict = "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a",
        name = "idle_a",
        prop = { -- Replace prop table with false (prop = false) if you want to disable it!
            Prop = "prop_cs_tablet",
            PropBone = 28422,
            PropPlacement = {
                -0.05,
                0.0,
                0.0,
                0.0,
                -90.0,
                0.0
            }
        }
    }
}

Config.SeasonPass = {
    -- To disable/enable season pass check Config.Tablet.DisableSeasonPass
    -- Configure custom currency exports in `op-crime/integrations/server/utils/customCurrency.lua`
    enableCustomCurrency = false, 
    customCurrencyLabel = "GC", -- Label of coins, example: Purchase for 950GC
}

-- ──────────────────────────────────────────────────────────────────────────────
-- 🌍 BLIPS CONFIGURATION 🌍                                                  
-- (Information) ► Map blips for organisations, garages, zones and money laundry.
-- ──────────────────────────────────────────────────────────────────────────────
Config.Blips = {                      
    BlipScale = 0.8,                  -- Global blip scale.
    ShowBlipsOnMap = false,            -- false = hide money laundry, garages and illegal medic blips.
    ZonesShowBlipsOnMap = true,       -- false = hide PVP/turf zone blips.
    Medic = { blipId = 51, blipColor = 7 },
    Organisation = { blipId = 437, blipColor = 1 },
    Zone = { blipId = 379, blipColor = 3 },
    Garage = { blipId = 357, blipColor = 2 },
    MoneyLaundry = { blipId = 318, blipColor = 25 },
    MoneyLaundryLocation = { blipId = 478, blipColor = 1 },
    LaundryLocationRadiusBlip = { 
        Color = 49,
        Alpha = 222,
        Radius = 60.0
    }
}

-- ──────────────────────────────────────────────────────────────────────────────
-- 🧼 MONEY LAUNDRY CONFIGURATION 🧼                                         
-- (Information) ► Settings for dirty money washing missions.
-- ──────────────────────────────────────────────────────────────────────────────
Config.MoneyLaundry = {               
    Disable = true,                  -- true = disable entire money laundry feature.
    laundryAmountPerOneStop = 20000,  -- Amount of dirty money cleaned per location.
    laundryPercentage = 15,           -- Tax percentage taken from laundered amount.
    Ped = {                           -- Set to false to disable ped (Ped = false,).
        model = "a_m_m_afriamer_01",
        gender = "male", -- options: male/female
    },
    laundryMisc = {
        location = vec4(78.8508, 112.5588, 80.1682, 161.7077),
        vehicleSpawnCoords = vec4(68.4445, 119.2293, 79.1232, 161.5234),
        vehicleModel = 'boxville4',
        -- LAUNDRY MISSION OUTFIT IS LOCATED NOW IN config/ClothingConfig.lua
    },
    laundryLocations = {
        {
            coords = vec4(237.7540, 22.6503, 82.6137, 341.4727)
        },
        {
            coords = vec4(-77.5555, -1200.6666, 26.6352, 92.4784)
        },
        {
            coords = vec4(232.4930, -1771.4315, 27.6610, 48.4330)
        },
        {
            coords = vec4(967.5204, -1823.1718, 30.0824, 229.1019)
        },
        {
            coords = vec4(947.5532, -1698.1992, 29.0851, 84.8497)
        },
    }
}

-- ──────────────────────────────────────────────────────────────────────────────
-- 🏥 MEDIC CONFIGURATION 🏥                                                 
-- (Information) ► Illegal medic / healing spot configuration.
-- ──────────────────────────────────────────────────────────────────────────────
Config.Medic = {                      
    Disable = true,                  -- true = disable this feature.
    HealingTime = 10,                 -- Healing time in seconds.
    Ped = {
        model = "s_m_m_scientist_01",
        gender = "male",
        animation = {
            Dict = "missheistdockssetup1clipboard@base",
            Lib  = "base",
            Prop = {
                Prop = 'prop_notepad_01',
                PropBone = 18905,
                PropPlacement = {
                    0.1,
                    0.02,
                    0.05,
                    10.0,
                    0.0,
                    0.0
                }
            }
        }
    },
}

-- ──────────────────────────────────────────────────────────────────────────────
-- 📍 PVP ZONES CONFIGURATION 📍                                             
-- (Information) ► Non-turf PVP zones. For Turf Zones see: config/TurfConfig.lua
-- ──────────────────────────────────────────────────────────────────────────────

-- THIS IS SECTION FOR PVP ZONES (NO TURFZONES)
-- IF YOU WANT TO CONFIGURE TURF ZONES - GO TO config/TurfConfig.lua

Config.ZonesMisc = {                 
    PerOnePlayerInside = 3,           -- Time (in seconds) for 1% capture progress for one org.
    -- If there are 2 organisations in zone the zone capturing percentage will stop.
    ZonesCooldown   = 30,             -- Cooldown time (in minutes) after a capture.
    ZoneCaptureEXP  = 150,            -- EXP given per zone capture.
    Disable         = false,          -- true = disable PVP zones completely.
    ZoneTimers = {
        -- Time window when zones can be captured
        enable = false,
        -- WARNING: Make sure you configured correct Config.TimeZone in MainConfig.lua
        -- INFORMATION: Use 24 hours time format
        startTime = "02:00",
        endTime   = "11:00",
    }
}

Config.Zones = {                      -- Add custom PVP zones here.
    -- To create new zones use /pzcreate poly
    -- To add new point to created poly use /pzadd 
    -- More info: https://github.com/mkafrin/PolyZone
    {
        label = "Cayo Perico",
        index = "cayoperico",
        coords = vec3(5000.46, -5096.05, 5.27),
        rewards = {
            enable = false,
            list = {
                {
                    rewardType = "item",       ---@param rewardType "item" | "money" | "blackmoney"
                    itemName   = "spray_can",
                    amount     = 10,
                    -- EXAMPLE OF METADATA USAGE (only for ox_inv):
                    -- metadata   = {
                    --     testmeta = 69
                    -- }
                },
            }
        },
        Zone = function()
            return PolyZone:Create({
                vec2(5669.89, -5171.38),
                vec2(5401.26, -4851.04),
                vec2(5290.44, -4568.57),
                vec2(4807.92, -4196.15),
                vec2(4246.47, -4197.44),
                vec2(3931.37, -4405.71),
                vec2(3684.69, -4756.4),
                vec2(3969.75, -4969.89),
                vec2(4302.38, -4727.38),
                vec2(4455.9, -5004.33),
                vec2(4663.2, -5998.36),
                vec2(4859.68, -6153.81),
                vec2(5235.23, -6068.08),
                vec2(5607.36, -5989.94),
                vec2(5755.01, -5442.92)
            }, {
                name = "CayoPerico",
            })
        end,
    },
}

-- ──────────────────────────────────────────────────────────────────────────────
-- ROPE MENU                                                                 
-- (Information) ► Enables rope item / keybind usage with optional target integration.
-- ──────────────────────────────────────────────────────────────────────────────
Config.Rope = {                       
    Enable = false, -- false = disable rope completly
    Item = {
        Enable   = false,
        ItemName = "rope",             -- Rope item name.
        RemoveItem = false            -- Remove item when tie/untie
    },
    Keybind = {
        Enable = false,
        Bind   = "F6"                 -- Keybind used for rope menu when enabled.
    },
    Target = {
        RequireItemInInventory = false, 
        RequiredItemName = "rope",
        Enable = false                 -- true = add target options to every player.
        -- When it's enabled - will add options to every player on the server.
    },
}

-- ──────────────────────────────────────────────────────────────────────────────
-- GANG WARS                                                               
-- (Information) ► All configuration for Gang Wars.
-- ──────────────────────────────────────────────────────────────────────────────
Config.GangWars = {
    enable = false, -- Enable/Disable Gangwars
    requiredLevel = 1, -- Required minimum level to use gangwars!
    disableKillWars = false, 
    disableDrugWars = false
}

-- ──────────────────────────────────────────────────────────────────────────────
-- AIRDROPS                                                                  
-- (Information) ► Global configuration for Airdrop events, guards and rewards.
-- ──────────────────────────────────────────────────────────────────────────────
Config.AirDrop = {                    
    Guards = {
        enable = true,
        amount = 12, 
        weaponsList = {
            `weapon_SNSPISTOL`,
            `WEAPON_SNSPISTOL_MK2`,
            `WEAPON_VINTAGEPISTOL`,
            `WEAPON_PISTOL`
        },
        guardModels = { 
            "s_m_m_armoured_01", 
            -- "s_m_m_marine_01" 
        }
    },
    RequiredItems = {
        ["WEAPON_CROWBAR"] = {
           itemName = "WEAPON_CROWBAR",
           quanity = 1
        },
    },
    SpawnTimeWindow = {
        -- Time window when Air Drops are auto started.
        enable = true,
        -- WARNING: Make sure you configured correct Config.TimeZone in MainConfig.lua
        -- INFORMATION: Use 24 hours time format
        startTime = "18:30",
        endTime   = "02:30",
    },
    StartCommand = {
        Enable = true,               -- Allow your admins to start AirDrop manually.
        CommandName = "startAirDrop" -- Command name to start Airdrop.
    },
    TimeToLand = 3,                  -- Time in minutes before airdrop starts going down.
    Enable = true,                   -- Master toggle for Airdrop system.
    Timer = 2,                       -- Interval in hours between automatic airdrops.
    DespawnTime = 20,                -- Minutes after which unopened airdrop will despawn.
    Locations = {
        vec4(3700.1226, 4533.2456, 22.2974, 193.3774),
        vec4(-70.5034, 1910.8385, 195.1936, 196.7471),
        vec4(2744.6143, -675.3640, 10.4433, 224.4497),
        vec4(-2400.1296, 4252.6187, 10.0629, 75.5824),
        vec4(2485.8250, 1554.2612, 33.2540, 296.5901),
    },
    Exp = 100,                       -- EXP given for opening Airdrop.
    Blip = {
        EnableRadiusBlip = true, 
        Blip      = 550,
        BlipColor = 3,
    },
    RewardsAmount = 4,               -- Number of random rewards per airdrop.
    Rewards = {

        {
            rewardType = "blackmoney", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "markedbills",
            amount     = 40000,
            chance     = 60,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "heistmysterybox",
            amount     = 2,
            chance     = 50,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "partsmysterybox",
            amount     = 2,
            chance     = 50,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "heavyarmor",
            amount     = 10,
            chance     = 50,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "smg_case",
            amount     = 5,
            chance     = 50,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "rifle_case",
            amount     = 5,
            chance     = 50,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "shotgun_case",
            amount     = 5,
            chance     = 50,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "smg_extendedclip",
            amount     = 1,
            chance     = 40,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "pistol_extendedclip",
            amount     = 1,
            chance     = 40,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "shotgun_extendedclip",
            amount     = 1,
            chance     = 40,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "ar_extendedclip",
            amount     = 1,
            chance     = 40,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "attachment_drum",
            amount     = 1,
            chance     = 40,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "smgblueprint",
            amount     = 1,
            chance     = 2,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "rifleblueprint",
            amount     = 1,
            chance     = 2,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "shotgunblueprint",
            amount     = 1,
            chance     = 5,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "WEAPON_PT39",
            amount     = 1,
            chance     = 1,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "WEAPON_PCM4A1",
            amount     = 1,
            chance     = 1,
        },
        {
            rewardType = "item", ---@param rewardType "item" | "money" | "blackmoney"
            itemName   = "WEAPON_2S",
            amount     = 1,
            chance     = 2,
        },
        --[[
        EXAMPLE ITEM WITH METADATA:
        {
            rewardType = "item",       --@param rewardType "item" | "money" | "blackmoney"
            itemName   = "testitem",
            amount     = 15,
            chance     = 50,
            metadata   = {
                testmeta = 69
            }
        },--]]
        -- [Note]: Metadata currently works only for ox_inventory. 
        -- If you want metadata compatible with your inventory script:
        -- Files that need to be edited: `integrations/server/inventory/`
        -- and one of `framework/server` functions Fr.AddItem
    },
    ProgressTime = 10000,            -- Time in milliseconds for opening progress bar.
    SkillCheck = function()          -- Custom skill check function (uses ox_lib by default).
        return lib.skillCheck({'easy', 'easy', 'medium', 'easy', 'medium'}, {'w', 'a', 's', 'd'})
    end,
}

-- ──────────────────────────────────────────────────────────────────────────────
-- Garage Disable Marker Helper                                               
-- (Information) ► Some external garage scripts manage their own markers/blips.
-- (Information) ► This helper allows OP-Crime to disable its own markers when needed.
-- ──────────────────────────────────────────────────────────────────────────────
-- Do not touch function below if you don't know what you're changing!
Config.GarageDisableMarker = function() 
    if Config.GarageScript == 'jg-advancedgarages' then 
        return true
    else 
        return false
    end
end