--RAINMAD SCRIPTS - discord.gg/rccvdkmA5X - rainmad.tebex.io
Config = {}

Config['YachtHeist'] = {
    ['framework'] = {
        name = 'QB', -- Only ESX or QB.
        scriptName = 'qb-core', -- Only for QB users.
        eventName = 'GetCoreObject' -- Only for ESX users.
    },
    ['bagClothesID'] = 84,
    ['buyerFinishScene'] = false,
    ["dispatch"] = "cd_dispatch", -- cd_dispatch | qs-dispatch | ps-dispatch | rcore_dispatch | default
    ['requiredPoliceCount'] = 6, -- required police count for start heist
    ['dispatchJobs'] = {'police', 'sheriff'},
    ['nextRob'] = 5400, -- Seconds for next heist.
    ['requiredItems'] = { -- Add this items to database or shared. Don't change the order, you can change the item names.
        'bag'
    },
    ['rewardItems'] = { -- Add this items to database or shared. Don't change the order, you can change the item names.
        {itemName = 'goldbar', count = 20, sellPrice = 100}, -- For stacks.
        {itemName = 'bagofcoke', count = 50, sellPrice = 100}, -- For stacks.
        {itemName = 'bagofweed', count = 50, sellPrice = 100}, -- For stacks.
    },
    ['rewardMoneys'] = {
        ['stacks'] = function()
            return math.random(80000, 90000) -- Per money stacks
        end,
    },
    ['black_money'] = {  -- If change true, all moneys will convert to black. QBCore users can change itemName
        status = false,
        itemName = 'markedbills'
    },
    ['startHeist'] ={ -- Heist start coords
        pos = vec3(-1989.5951, -332.2613, 32.0970),
        peds = {
            {pos = vec3(-1989.5951, -332.2613, 32.0970), heading = 146.2304, ped = 's_m_m_highsec_01'},
            {pos = vec3(-1989.0559, -333.1780, 32.0970), heading = 102.9193, ped = 's_m_m_highsec_02'},
            {pos = vec3(-1990.5490, -332.1594, 32.0970), heading = 166.8340,  ped = 's_m_m_highsec_02'}
        }
    },
    ['finishHeist'] = { -- Heist finish coords.
        buyerPos = vector3(-736.13, -1485.6, 4.00020)
    },
    ['enableIPL'] = false -- If you dont have any ipl script, you need change to true
}

Config['YachtSetup'] = {
    ['yachtPos'] = vector3(-2087.7, -1024.4, 4.88214),
    ['guards'] = { 
        ['peds'] = {-- These coords are for guard peds, you can add new guard peds.
            {coords = vector3(-2034.4, -1028.1, 5.88201),  heading = 270.87, model = 's_m_m_highsec_02'},
            {coords = vector3(-2034.9, -1030.0, 5.88211),  heading = 177.93, model = 'ig_stevehains'},
            {coords = vector3(-2038.3, -1040.4, 5.88255),  heading = 354.93, model = 'ig_fbisuit_01'},
            {coords = vector3(-2032.7, -1040.4, 5.88216),  heading = 177.88, model = 'ig_tylerdix'},
            {coords = vector3(-2049.4, -1036.5, 5.88307),  heading = 268.28, model = 'csb_vincent'},
            {coords = vector3(-2065.6, -1031.2, 5.88297),  heading = 268.3,  model = 'csb_tomcasino'},
            {coords = vector3(-2046.4, -1023.5, 5.88342),  heading = 359.44, model = 'ig_fbisuit_01'},
            {coords = vector3(-2046.4, -1023.5, 5.88342),  heading = 265.05, model = 'ig_tylerdix'},
            {coords = vector3(-2075.7, -1021.4, 5.88412),  heading = 174.77, model = 'csb_vincent'},
            {coords = vector3(-2084.9, -1023.9, 5.88345),  heading = 180.79, model = 'ig_fbisuit_01'},
            {coords = vector3(-2095.5, -1019.6, 5.90781),  heading = 180.79, model = 'ig_fbisuit_01'},
            {coords = vector3(-2094.8, -1014.0, 5.88435),  heading = 180.79, model = 'csb_vincent'},
            {coords = vector3(-2088.2, -1015.5, 5.88413),  heading = 180.79, model = 'ig_fbisuit_01'},
            {coords = vector3(-2083.9, -1015.1, 5.88413),  heading = 180.79, model = 's_m_m_highsec_02'},
            {coords = vector3(-2118.1, -1005.4, 7.90748),  heading = 180.79, model = 'ig_tylerdix'},
            {coords = vector3(-2117.9, -1010.7, 7.83777),  heading = 180.79, model = 'csb_tomcasino'},
            {coords = vector3(-2110.3, -1011.9, 8.96900),  heading = 180.79, model = 'ig_stevehains'},
            {coords = vector3(-2108.6, -1008.2, 8.95518),  heading = 180.79, model = 's_m_m_highsec_02'},
            {coords = vector3(-2101.2, -1012.6, 8.98279),  heading = 180.79, model = 'ig_stevehains'},
        },
        ['weapon'] = 'WEAPON_PISTOL', -- You can change this
    },
    ['tables'] = { -- You can add new table with money/gold/weed/coke stacks.
        {coords = vector3(-2087.7, -1024.4, 4.88214), heading = 163.0, type = 'money'},
        {coords = vector3(-2099.6, -1020.3, 4.88214), heading = 163.0, type = 'money'},
        {coords = vector3(-2093.0, -1008.2, 4.88214), heading = 342.0, type = 'gold'},
        {coords = vector3(-2081.8, -1012.1, 4.88214), heading = 342.0, type = 'money'},
        {coords = vector3(-2070.2, -1019.4, 4.88214), heading = 253.0, type = 'money'},
    },
    ['artifacts'] = { -- You can add new artifacts.
        -- {coords = vector3(-2071.6, -1024.2, 5.76413),  heading = 250.0, model = 'vw_prop_vw_pogo_gold_01a',     itemName = 'pogo',     sellPrice = 100},
        -- {coords = vector3(-2085.4, -1013.9, 5.76413),  heading = 250.0, model = 'h4_prop_h4_t_bottle_02b',      itemName = 'bottle',   sellPrice = 100},
        -- {coords = vector3(-2089.7, -1009.4, 5.88413),  heading = 80.0,  model = 'h4_prop_h4_necklace_01a',      itemName = 'necklace', sellPrice = 100, displayObj = {model = 'h4_prop_h4_neck_disp_01a', rot = vector3(360.0, 0.0, 80.0)}},
        -- {coords = vector3(-2096.05, -1007.2, 5.88434), heading = 80.0,  model = 'h4_prop_h4_diamond_01a',       itemName = 'diamond',  sellPrice = 100, displayObj = {model = 'h4_prop_h4_diamond_disp_01a', rot = vector3(360.0, 0.0, 120.0)}},
        -- {coords = vector3(-2085.0, -1022.0, 5.80413),  heading = 0.0,   model = 'h4_prop_h4_art_pant_01a',      itemName = 'panther',  sellPrice = 100},
        -- {coords = vector3(-2099.6, -1014.7, 4.88413),  heading = 72.0,  model = 'vw_prop_casino_art_gun_02a',   itemName = 'artgun',   sellPrice = 100},
        -- {coords = vector3(-2078.0, -1022.35, 5.78434), heading = 75.0,  model = 'vw_prop_casino_art_skull_01b', itemName = 'artskull', sellPrice = 100},
        -- {coords = vector3(-2092.7, -1022.9, 5.56413),  heading = 152.0, model = 'vw_prop_casino_art_egg_01a',   itemName = 'artegg',   sellPrice = 100},
        -- {coords = vector3(-2096.1, -1022.0, 5.56413),  heading = 152.0, model = 'vw_prop_casino_art_lampf_01a', itemName = 'artlamp',  sellPrice = 100},
        -- {coords = vector3(-2078.4, -1025.75, 5.76413), heading = 192.0, model = 'vw_prop_casino_art_horse_01b', itemName = 'arthorse', sellPrice = 100},
    }
}

policeAlert = function(coords)
    if Config['YachtHeist']["dispatch"] == "default" then
        TriggerServerEvent('yachtheist:server:policeAlert', coords)
    elseif Config['YachtHeist']["dispatch"] == "cd_dispatch" then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = Config["YachtHeist"]['dispatchJobs'], 
            coords = coords,
            title = 'Yacht Robbery',
            message = 'A '..data.sex..' robbing a Yatcht at '..data.street, 
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 431, 
                scale = 1.8, 
                colour = 49,
                flashes = true, 
                text = '911 - Yacht Robbery',
                time = 5,
                radius = 0,
            }
        })
    elseif Config['YachtHeist']["dispatch"] == "qs-dispatch" then
        exports['qs-dispatch']:YachtHeist()
    elseif Config['YachtHeist']["dispatch"] == "ps-dispatch" then
        exports['ps-dispatch']:YachtHeist()
    elseif Config['YachtHeist']["dispatch"] == "rcore_dispatch" then
        local data = {
            code = '10-64', -- string -> The alert code, can be for example '10-64' or a little bit longer sentence like '10-64 - Shop robbery'
            default_priority = 'high', -- 'low' | 'medium' | 'high' -> The alert priority
            coords = coords, -- vector3 -> The coords of the alert
            job = Config["YachtHeist"]['dispatchJobs'], -- string | table -> The job, for example 'police' or a table {'police', 'ambulance'}
            text = 'Yacht Robbery', -- string -> The alert text
            type = 'alerts', -- alerts | shop_robbery | car_robbery | bank_robbery -> The alert type to track stats
            blip_time = 5, -- number (optional) -> The time until the blip fades
            blip = { -- Blip table (optional)
                sprite = 431, -- number -> The blip sprite: Find them here (https://docs.fivem.net/docs/game-references/blips/#blips)
                colour = 3, -- number -> The blip colour: Find them here (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
                scale = 1.2, -- number -> The blip scale
                text = 'Yacht Robbery', -- number (optional) -> The blip text
                flashes = false, -- boolean (optional) -> Make the blip flash
                radius = 0, -- number (optional) -> Create a radius blip instead of a normal one
            }
        }
        TriggerServerEvent('rcore_dispatch:server:sendAlert', data)
    elseif Config['YachtHeist']["dispatch"] == "sonoran_cad" then
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
    ['e_start'] = 'Press ~INPUT_CONTEXT~ to Start Yacht Heist',
    ['start_heist'] = 'Go to Yacht. Check your gps!',
    ['start_heist2'] = 'Required things for robbery: A lots of guns and bags',
    ['yacht_blip'] = 'Yacht',
    ['grab_stack'] = 'Press ~INPUT_CONTEXT~ to grab stack',
    ['grab_artifact'] = 'Press ~INPUT_CONTEXT~ to collect artifact',
    ['wait_nextrob'] = 'You have to wait this long to undress again',
    ['minute'] = 'minute.',
    ['need_this'] = 'You need this: ',
    ['need_police'] = 'Not enough police in the city.',
    ['total_money'] = 'You got this: ',
    ['police_alert'] = 'Yacht robbery alert! Check your gps.',
    ['not_cop'] = 'You are not cop!',
    -- ['buyer_blip'] = 'Buyer',
    -- ['deliver_to_buyer'] = 'Deliver the loot to the buyer. Check gps.',
    ['timerbar'] = 'COLLECTING'
    
}