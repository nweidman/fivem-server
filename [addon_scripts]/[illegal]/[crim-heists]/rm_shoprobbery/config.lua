Config = {}

Config['ShopRobbery'] = {
    ['framework'] = {
        name = 'QB', -- Only ESX or QB.
        scriptName = 'qb-core', -- Only for QB users.
        eventName = 'esx:getSharedObject', -- Only for ESX users.
    },
    ["dispatch"] = "cd_dispatch", -- cd_dispatch | qs-dispatch | ps-dispatch | rcore_dispatch | default
    ['requiredPoliceCount'] = 2, -- required police count for start heist
    ['dispatchJobs'] = {'police', 'sheriff'},
    ['cooldown'] = { -- If you set globalCooldown to true, players can rob one shop in same time. Cooldown time is the time it takes to each shop or global.
        globalCooldown = true,
        time = 30,
    },
    ['rewardItems'] = { -- Add this items to database or shared. Don't change the order, you can change the item names.
        {itemName = 'goldbar', count = math.random(8, 14)}, -- For safecrack reward
        {itemName = 'mazecard', count = math.random(1, 1)}, -- For safecrack reward
    },
    ['rewardMoneys'] = {
        ['safecrack'] = function()
            return math.random(35000, 50000) -- For safecrack money reward (Increased from 1000 9000)
        end,
        ['till'] = function() -- For till money reward
            return math.random(8000, 12000) --Increased from 1000 5500
        end,
    },
    ['tillGrabTime'] = 45000, -- For grab till time (miliseconds)
    ['clerkWeaponChance'] = 100, -- Chance that the clerk will get scared or pull a gun
    ['clerkWeapon'] = GetHashKey('WEAPON_PUMPSHOTGUN'), -- Clerk weapon
    ['black_money'] = true,  -- If change true, all moneys will convert to black.
}

Config['deleteSafeObjects'] = {
    {
        model = -1375589668, -- Safe object model
        coords = vector3(-1478.74, -375.24, 39.16),
    },
    {
        model = -1375589668, -- Safe object model
        coords = vector3(1169.23, 2717.65, 37.16),
    },
    {
        model = -1375589668, -- Safe object model
        coords = vector3(1126.81, -980.21, 45.12),
    },
}

Config['ShopRobberySetup'] = {
    [1] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(372.658, 327.282, 102.566), heading = 250.0}, -- For shop clerk settings: Ped model, coords and heading.
        safecrackSetup = {coords = vector3(374.2858, 333.2662, 99.4544), heading = 344.4365}, -- For shop safecrack object: Object coords and heading
        lixeiroCharmoso = {marketId = "market_6", tillAmount = 2, remainingTill = 2} -- For lixeiroCharmoso stores script: Market Id from his config file and the amount of tills
    },
    [2] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(-46.675, -1758.3, 28.4210), heading = 50.0},
        safecrackSetup = {coords = vector3(-41.688, -1749.3, 28.4210), heading = 320.47},
        lixeiroCharmoso = {marketId = "market_13", tillAmount = 2, remainingTill = 2}
    },
    [3] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(1165.26, -322.95, 68.2050), heading = 100.0},
        safecrackSetup = {coords = vector3(1161.55, -313.43, 68.2050), heading = 278.47},
        lixeiroCharmoso = {marketId = "market_4", tillAmount = 2, remainingTill = 2}
    },
    [4] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(-705.62, -913.89, 18.2155), heading = 90.0},
        safecrackSetup = {coords = vector3(-707.70, -904.08, 18.2155), heading = 0.47},
        lixeiroCharmoso = {marketId = "market_1", tillAmount = 2, remainingTill = 2}
    },
    [5] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(24.0687, -1346.2, 28.4970), heading = 270.0},
        safecrackSetup = {coords = vector3(24.5548, -1340.3798, 25.3849), heading = 357.6970},
        lixeiroCharmoso = {marketId = "market_2", tillAmount = 2, remainingTill = 2}
    },
    [6] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(1728.06, 6416.29, 34.0372), heading = 240.0},
        safecrackSetup = {coords = vector3(1731.0488, 6421.4165, 30.9251), heading = 332.1883},
        lixeiroCharmoso = {marketId = "market_8", tillAmount = 2, remainingTill = 2}
    },
    [7] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(549.554, 2670.23, 41.1564), heading = 100.0},
        safecrackSetup = {coords = vector3(549.9026, 2664.5581, 38.0443), heading = 187.4283},
        lixeiroCharmoso = {marketId = "market_9", tillAmount = 2, remainingTill = 2}
    },
    [8] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(-3243.3, 999.759, 11.8307), heading = 350.0},
        safecrackSetup = {coords = vector3(-3249.1672, 1000.6781, 8.7186), heading = 85.4252},
        lixeiroCharmoso = {marketId = "market_7", tillAmount = 2, remainingTill = 2}
    },
    [9] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(-1819.5, 794.251, 137.079), heading = 140.0},
        safecrackSetup = {coords = vector3(-1828.23, 799.83, 137.1), heading = 44.47},
        lixeiroCharmoso = {marketId = "market_5", tillAmount = 2, remainingTill = 2}
    },
    [10] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(1697.57, 4922.87, 41.0636), heading = 320.0},
        safecrackSetup = {coords = vector3(1706.87, 4919.76, 41.0636), heading = 237.47},
        lixeiroCharmoso = {marketId = "market_12", tillAmount = 2, remainingTill = 2}
    },
    [11] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(1959.32, 3740.79, 31.3437), heading = 300.0},
        safecrackSetup = {coords = vector3(1956.7189, 3745.9541, 28.2316), heading = 30.4476},
        lixeiroCharmoso = {marketId = "market_10", tillAmount = 2, remainingTill = 2}
    },
    [12] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(2676.91, 3279.72, 54.2411), heading = 330.0},
        safecrackSetup = {coords = vector3(2671.9182, 3282.8242, 51.1290), heading =  60.3878},
        lixeiroCharmoso = {marketId = "market_11", tillAmount = 2, remainingTill = 2}
    },
    [13] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(2555.68, 380.539, 107.623), heading = 350.0},
        safecrackSetup = {coords = vector3(2550.1094, 381.2107, 104.5107), heading = 88.7598},
        lixeiroCharmoso = {marketId = "market_3", tillAmount = 2, remainingTill = 2}
    },
    [14] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(-3040.2, 583.874, 6.90893), heading = 25.0},
        safecrackSetup = {coords = vector3(-3045.4004, 582.4692, 3.7968), heading = 107.4732},
        lixeiroCharmoso = {marketId = "market_15", tillAmount = 2, remainingTill = 2}
    },
    [15] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(1166.06, 2710.83, 37.16), heading = 178.0},
        safecrackSetup = {coords = vector3(1169.0, 2719.89, 36.16), heading = 350.8},
        lixeiroCharmoso = {marketId = "market_16", tillAmount = 1, remainingTill = 1}
    },
    [16] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(160.7289, 6642.0776, 30.6985), heading = 229.6095},
        safecrackSetup = {coords = vector3(167.5827, 6642.7681, 30.6986), heading = 136.00},
        lixeiroCharmoso = {marketId = "market_17", tillAmount = 1, remainingTill = 1}
    },
    [17] = {
        pedSetup = {model = 'mp_m_shopkeep_01', coords = vector3(1943.3290, 3845.7383, 31.4725), heading = 206.1076},
        safecrackSetup = {coords = vector3(1954.3087, 3831.1699, 31.4726), heading = 300.0203},
        lixeiroCharmoso = {marketId = "market_18", tillAmount = 1, remainingTill = 1}
    },
}

policeAlert = function(coords)
    if Config['ShopRobbery']["dispatch"] == "default" then
        TriggerServerEvent('shoprobbery:server:policeAlert', coords)
    elseif Config['ShopRobbery']["dispatch"] == "cd_dispatch" then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = Config["ShopRobbery"]['dispatchJobs'], 
            coords = coords,
            title = 'Shop Robbery',
            message = 'A '..data.sex..' robbing a Shop at '..data.street, 
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 431, 
                scale = 1.2, 
                colour = 3,
                flashes = false, 
                text = '911 - Shop Robbery',
                time = 5,
                radius = 0,
            }
        })
    elseif Config['ShopRobbery']["dispatch"] == "qs-dispatch" then
        exports['qs-dispatch']:StoreRobbery()
    elseif Config['ShopRobbery']["dispatch"] == "ps-dispatch" then
        exports['ps-dispatch']:StoreRobbery(camId)
    elseif Config['ShopRobbery']["dispatch"] == "rcore_dispatch" then
        local data = {
            code = '10-64', -- string -> The alert code, can be for example '10-64' or a little bit longer sentence like '10-64 - Shop robbery'
            default_priority = 'high', -- 'low' | 'medium' | 'high' -> The alert priority
            coords = coords, -- vector3 -> The coords of the alert
            job = Config["ShopRobbery"]['dispatchJobs'], -- string | table -> The job, for example 'police' or a table {'police', 'ambulance'}
            text = 'Shop Robbery', -- string -> The alert text
            type = 'alerts', -- alerts | shop_robbery | car_robbery | bank_robbery -> The alert type to track stats
            blip_time = 5, -- number (optional) -> The time until the blip fades
            blip = { -- Blip table (optional)
                sprite = 431, -- number -> The blip sprite: Find them here (https://docs.fivem.net/docs/game-references/blips/#blips)
                colour = 3, -- number -> The blip colour: Find them here (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
                scale = 1.2, -- number -> The blip scale
                text = 'Shop Robbery', -- number (optional) -> The blip text
                flashes = false, -- boolean (optional) -> Make the blip flash
                radius = 0, -- number (optional) -> Create a radius blip instead of a normal one
            }
        }
        TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
    elseif Config['ShopRobbery']["dispatch"] == "sonoran_cad" then
        local pos = GetEntityCoords(PlayerPedId())
        local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
        local street1 = GetStreetNameFromHashKey(s1)
        local street2 = GetStreetNameFromHashKey(s2)
        local streetLabel = street1
        if street2 ~= nil then
            streetLabel = streetLabel .. ' ' .. street2
        end
        TriggerServerEvent('SonoranScripts::Call911', 'Bystander', streetLabel, 'A silent alarm has been triggered at ' .. streetLabel .. '.', exports['nearest-postal']:getPostal(), nil)
    end
end

Strings = {
    ["closest_player"] = "You cannot do this when someone is with you.",
    ['grab_till'] = 'Press ~INPUT_CONTEXT~ to grab till',
    ['safecrack'] = 'Press ~INPUT_CONTEXT~ to start safecrack',
    ['pickup'] = 'Press ~INPUT_CONTEXT~ to pickup bag',
    ['wait_nextrob'] = 'You have to wait this long to undress again',
    ['minute'] = 'minute.',
    ['need_this'] = 'You need this: ',
    ['need_police'] = 'Not enough police in the city.',
    ['total_money'] = 'You got this: ',
    ['police_alert'] = 'Shop robbery alert! Check your gps.',
    ['not_cop'] = 'You are not cop!',
    ['not_near'] = 'There is no shop nearby',
    ['safecrack_help'] = '~INPUT_FRONTEND_LEFT~ ~INPUT_FRONTEND_RIGHT~ Rotate\n~INPUT_FRONTEND_RDOWN~ Check',
    ['charmoso_log_title'] = 'Money stolen',
    ['charmoso_store_being_robbed'] = 'Your store is being robbed!',
    ['charmoso_no_owner_online'] = 'This store is closed!',
}

-- Set this as true if you're using the "Stores" script from LixeiroCharmoso (https://discord.gg/U5YDgbh). 
-- When enabled, the reward items and the money will be got from stores stocks and stores money. If the stores does not have owner, it wil be the values you configured in rewardMoneys and rewardItems
-- ATTENTION: remove the -- from this line "@mysql-async/lib/MySQL.lua" inside the server_scripts on fxmanifest.lua
-- If you need any support related to this, send a DM on discord: Lixeiro Charmoso#1104
Config['enableLixeiroCharmosoMarkets'] = false
Config['LixeiroCharmosoMarketsSettings'] = {
    money_percentage_earned = 0.7, -- Amount of money that will be taken from store bank in %
    items_percentage_earned = 0.7, -- Amount of items that will be taken from store stock in %
	require_owner_be_online = true -- true: the store can only be robbed if the owner is online | false: the store can be robbed at any time
}