--RAINMAD SCRIPTS - discord.gg/rccvdkmA5X - rainmad.tebex.io
Config = {}

Config['UndergroundHeist'] = {
    ['framework'] = {
        name = 'QB', -- Only ESX or QB.
        scriptName = 'qb-core', -- Framework script name work framework exports. (Example: qb-core or es_extended)
        eventName = 'esx:getSharedObject', -- If your framework using trigger event for shared object, you can set in here.
    },
    ['bagClothesID'] = 85,
    ['buyerFinishScene'] = false,
    ["dispatch"] = "cd_dispatch", -- cd_dispatch | qs-dispatch | ps-dispatch | rcore_dispatch | default
    ['requiredPoliceCount'] = 10, -- required police count for start heist
    ['dispatchJobs'] = {'police', 'sheriff'},
    ['nextRob'] = 14400, -- Seconds for next heist
    ['requiredItems'] = { -- Add this items to database or shared. Don't change the order, you can change the item names
        'toolkit',
        'bag',
        'dynamite',
        'c4',
        'maliciousflashdrive'
    },
    ['rewardItems'] = { -- Add this items to database or shared. Don't change the order, you can change the item names. Also dont forget glass cutting and painting item names.(in bottom)
        {itemName = 'bagofweed', count = math.random(10, 15), sellPrice = 100}, -- for drugs grab
        {itemName = 'bagofcoke', count = math.random(10, 15), sellPrice = 100}, -- for drugs grab
        {itemName = 'WEAPON_PISTOL50', count = 1,  sellPrice = 100}, -- for virus grab
        {itemName = 'goldbar',       count = math.random(20, 25), sellPrice = 100}, -- for vault stack
        {itemName = 'diamond', count = math.random(8, 10), sellPrice = 100}, -- for chests
        {itemName = 'goldbar',    count = math.random(10, 15),  sellPrice = 100}, -- for safecrack
    },
    ['moneyStacksReward'] = math.random(115000, 130000), -- Reward from each money stacks 8
    ['black_money'] = {  -- If change true, all moneys will convert to black. QBCore users can change itemName
        status = true,
        itemName = 'markedbills'
    },
    ['startHeist'] ={ -- Heist start coords
        pos = vec3(827.8290, -812.6881, 26.3061),
        peds = {
            {pos = vec3(827.8290, -812.6881, 26.3061), heading = 318.1611, ped = 's_m_m_highsec_01'},
            {pos = vec3(827.1080, -811.5566, 26.2974), heading = 290.0267, ped = 's_m_m_highsec_02'},
            {pos = vec3(828.9506, -812.6377, 26.3054), heading = 2.3771, ped = 's_m_m_fiboffice_02'}
        }
    }
    -- ['finishHeist'] = { -- Heist finish coords
    --     buyerPos = vector3(729.451, -555.40, 25.5128)
    -- }
}

Config['UndergroundSetup'] = { -- I just write changeable things, dont change others cuzz fixed with map.
    ['bomb'] = vector3(918.698, -96.274, 25.8521),
    ['drugs'] = {
        { pos = vector3(910.180, -69.386, 25.3859), type = 'coke' },
        { pos = vector3(908.182, -70.970, 25.3859), type = 'weed' },
        { pos = vector3(906.054, -68.993, 25.3859), type = 'coke' },
        { pos = vector3(904.802, -66.561, 25.3859), type = 'weed' },
        { pos = vector3(907.195, -64.926, 25.3859), type = 'coke' },
    },
    ['virus'] = vector3(913.368, -51.289, 25.7015),
    ['safecrack'] = vector3(951.777, -57.657, 25.6324),
    ['plantCell'] = vector3(918.850, -84.848, 25.8908),
    ['vault'] = vector3(942.598, -97.969, 26.2259),
    ['vaultGold'] = vector3(946.140, -93.903, 25.574),
    ['extendedDoors'] = {vector3(946.6, -109.69, 24.8), vector3(948.69, -108.11, 24.8)},
    ['moneyStacks'] = { -- You can add new money stacks.
        {scenePos = vector3(968.731, -136.68, 24.82538), sceneRot = vector3(0.0, 0.0, 0.0)},
        {scenePos = vector3(978.096, -130.54, 24.82538), sceneRot = vector3(0.0, 0.0, 40.0)},
        {scenePos = vector3(965.026, -115.81, 24.82538), sceneRot = vector3(0.0, 0.0, 230.0)},
        {scenePos = vector3(997.874, -116.01, 24.82538), sceneRot = vector3(0.0, 0.0, 45.0)},
        {scenePos = vector3(981.545, -90.324, 24.82538), sceneRot = vector3(0.0, 0.0, 220.0)},
        {scenePos = vector3(983.099, -100.18, 24.82538), sceneRot = vector3(0.0, 0.0, 225.0)},
        {scenePos = vector3(984.596, -126.39, 24.82538), sceneRot = vector3(0.0, 0.0, 40.0)},
        {scenePos = vector3(980.140, -117.61, 24.82538), sceneRot = vector3(0.0, 0.0, 40.0)},
    },
    ['chests'] = { -- You can add new chests.
        {scenePos = vector3(989.419, -94.756, 24.8192), sceneRot = vector3(0.0, 0.0, 350.0)},
        {scenePos = vector3(1001.86, -106.92, 24.8192), sceneRot = vector3(0.0, 0.0, 315.0)},
        {scenePos = vector3(996.431, -110.46, 24.8192), sceneRot = vector3(0.0, 0.0, 260.0)},
        {scenePos = vector3(967.358, -113.07, 24.8192), sceneRot = vector3(0.0, 0.0, 20.0)},
        {scenePos = vector3(966.748, -95.998, 24.8192), sceneRot = vector3(0.0, 0.0, 40.0)},
        {scenePos = vector3(982.978, -95.709, 24.8192), sceneRot = vector3(0.0, 0.0, 225.0)},
        {scenePos = vector3(963.860, -122.88, 24.8192), sceneRot = vector3(0.0, 0.0, 2.0)},
    }
}

policeAlert = function(coords)
    if Config['UndergroundHeist']["dispatch"] == "default" then
        TriggerServerEvent('undergroundheist:server:policeAlert', coords)
    elseif Config['UndergroundHeist']["dispatch"] == "cd_dispatch" then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = Config["UndergroundHeist"]['dispatchJobs'], 
            coords = coords,
            title = 'Underground Robbery',
            message = 'A '..data.sex..' robbing a Underground at '..data.street, 
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 431, 
                scale = 1.2, 
                colour = 3,
                flashes = false, 
                text = '911 - Underground Robbery',
                time = 5,
                radius = 0,
            }
        })
    elseif Config['UndergroundHeist']["dispatch"] == "qs-dispatch" then
        exports['qs-dispatch']:UndergroundRobbery()
    elseif Config['UndergroundHeist']["dispatch"] == "ps-dispatch" then
        exports['ps-dispatch']:UndergroundRobbery()
    elseif Config['UndergroundHeist']["dispatch"] == "rcore_dispatch" then
        local data = {
            code = '10-64', -- string -> The alert code, can be for example '10-64' or a little bit longer sentence like '10-64 - Shop robbery'
            default_priority = 'high', -- 'low' | 'medium' | 'high' -> The alert priority
            coords = coords, -- vector3 -> The coords of the alert
            job = Config["UndergroundHeist"]['dispatchJobs'], -- string | table -> The job, for example 'police' or a table {'police', 'ambulance'}
            text = 'Underground Robbery', -- string -> The alert text
            type = 'alerts', -- alerts | shop_robbery | car_robbery | bank_robbery -> The alert type to track stats
            blip_time = 5, -- number (optional) -> The time until the blip fades
            blip = { -- Blip table (optional)
                sprite = 431, -- number -> The blip sprite: Find them here (https://docs.fivem.net/docs/game-references/blips/#blips)
                colour = 3, -- number -> The blip colour: Find them here (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
                scale = 1.2, -- number -> The blip scale
                text = 'Underground Robbery', -- number (optional) -> The blip text
                flashes = false, -- boolean (optional) -> Make the blip flash
                radius = 0, -- number (optional) -> Create a radius blip instead of a normal one
            }
        }
        TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
    elseif Config['UndergroundHeist']["dispatch"] == "sonoran_cad" then
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
    ['e_start'] = 'Press ~INPUT_CONTEXT~ to Start Underground Heist',
    ['start_heist'] = 'Go to Underground Tunnel. Check your gps!',
    ['start_heist2'] = 'Make sure you bring everything you\'ll need to break in!',
    ['plant_bomb'] = 'Press ~INPUT_CONTEXT~ to plant explosive',
    ['plant_bbomb'] = 'Press ~INPUT_CONTEXT~ to plant explosive',
    ['detonate_bombs'] = 'Press ~INPUT_CONTEXT~ to detonate bombs',
    ['grab1'] = 'Press ~INPUT_CONTEXT~ to grab golds',
    ['grab2'] = 'Press ~INPUT_CONTEXT~ to open box',
    ['grab3'] = 'Press ~INPUT_CONTEXT~ to grab drugs',
    ['grab4'] = 'Press ~INPUT_CONTEXT~ to grab moneys',
    ['chests'] = 'Press ~INPUT_CONTEXT~ to open chest',
    ['safecrack'] = 'Press ~INPUT_CONTEXT~ to start safecrack',
    ['hacking'] = 'Press ~INPUT_CONTEXT~ to use hack usb',
    ['drill'] = 'Press ~INPUT_CONTEXT~ to start opening vault door',
    ['wait_nextrob'] = 'You have to wait this long to undress again',
    ['minute'] = 'minute.',
    ['need_this'] = 'You are missing the required item.',
    ['deliver_to_buyer'] = 'Deliver the loot to the buyer. Check gps.',
    ['underground_blip'] = 'Underground Tunnel',
    ['buyer_blip'] = 'Buyer',
    ['need_police'] = 'Not enough police in the city.',
    ['total_money'] = 'You got this: ',
    ['police_alert'] = 'Underground robbery alert! Check your gps.',
    ['not_cop'] = 'You are not cop!',
}