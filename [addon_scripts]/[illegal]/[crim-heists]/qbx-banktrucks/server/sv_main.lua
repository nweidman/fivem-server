local ox_inventory = exports.ox_inventory
local qbx = exports.qbx_core

-- =========================
-- Helpers
-- =========================
local function getPlayer(src)
    if qbx and qbx.GetPlayer then
        return qbx:GetPlayer(src)
    end
    return nil
end

local function countCops()
    local amount = 0
    for _, src in ipairs(GetPlayers()) do
        src = tonumber(src)
        local Player = getPlayer(src)
        if Player and Player.PlayerData and Player.PlayerData.job then
            local job = Player.PlayerData.job
            local name = job.name
            local onduty = job.onduty
            if (name == "police" or name == "sheriff") and onduty then
                amount += 1
            end
        end
    end
    return amount
end

local function removeItem(src, item, count)
    count = count or 1
    if not ox_inventory then return false end
    return ox_inventory:RemoveItem(src, item, count)
end

local function addItem(src, item, count, metadata)
    count = count or 1
    if not ox_inventory then return false end
    return ox_inventory:AddItem(src, item, count, metadata)
end

-- =========================
-- Events
-- =========================
RegisterNetEvent("qb-banktrucks:server:removeCard", function()
    local src = source
    local Player = getPlayer(src)
    if not Player then return end
    removeItem(src, "security_card_04", 1)
end)


-- Explosive breach item
RegisterNetEvent("qb-banktrucks:server:removeExplosive", function()
    local src = source
    local Player = getPlayer(src)
    if not Player then return end
    removeItem(src, Config.ExplosiveItem or 'c4', 1)
end)

RegisterNetEvent('qb-banktrucks:server:UpdatePlates', function(plate)
    Config.RobbedPlates[plate] = true
    TriggerClientEvent('qb-banktrucks:client:UpdatePlates', -1, plate)
end)


-- Broadcast beeps to nearby clients (clients distance-check using coords)
RegisterNetEvent('qb-banktrucks:server:syncBeep', function(truckNetId, coords, delay)
    TriggerClientEvent('qb-banktrucks:client:syncBeep', -1, truckNetId, coords, delay)
end)

RegisterNetEvent('qb-banktrucks:server:RemoveDoors', function(truckNetId)
    TriggerClientEvent('qb-banktrucks:client:RemoveDoors', -1, truckNetId)
end)


RegisterNetEvent('qb-banktrucks:server:receiveItem', function(netId)
    local src = source
    local Player = getPlayer(src)
    if not Player then return end

    local entity = NetworkGetEntityFromNetworkId(netId)
    if not DoesEntityExist(entity) then return end
    if GetEntityModel(entity) ~= `stockade` then
        -- basic sanity check
        DropPlayer(src, "Exploit detected.")
        return
    end

    local plate = GetVehicleNumberPlateText(entity)
    if Config.LootedTrucks[plate] then return end

    Config.LootedTrucks[plate] = true
    TriggerClientEvent('qb-banktrucks:client:UpdateLooted', -1, plate)

    local info = { worth = math.random(32000, 42000) }
    addItem(src, "markedbills", 1, info)

    local tierChance = math.random(100)
    local tier = 1

    if tierChance < 50 then
        tier = 1
    elseif tierChance < 75 then
        tier = 2
    else
        tier = 3
    end

    if tier == 1 then
        addItem(src, "markedbills", 1, info)
    elseif tier == 2 then
        addItem(src, "cashexchangekey", 1)
    elseif tier == 3 then
        addItem(src, "fleecacard", 1)
    end

    -- Optional qb-log integration (only if running)
    if GetResourceState('qb-log') == 'started' then
        local pdata = Player.PlayerData
        TriggerEvent("qb-log:server:CreateLog", "banktrucks", "Banktruck Rewards", "default",
            ("**PLAYER**\n**Name: **%s\n**Character Name: **%s %s\n**Citizen ID: **%s\n\n**REWARD**\n**Item:** markedbills ($%d)\n**Amount: **1")
            :format(pdata.name or 'Unknown',
                    pdata.charinfo and pdata.charinfo.firstname or 'N/A',
                    pdata.charinfo and pdata.charinfo.lastname or 'N/A',
                    pdata.citizenid or 'N/A',
                    info.worth)
        )
    end
end)

-- =========================
-- ox_lib callbacks
-- =========================
lib.callback.register('qb-banktrucks:server:getCops', function(source)
    return countCops()
end)

lib.callback.register('qb-banktrucks:server:getConfig', function(source)
    return Config.RobbedPlates, Config.LootedTrucks
end)

lib.callback.register('qb-banktrucks:server:hasExplosive', function(source)
    local item = Config.ExplosiveItem or 'c4'
    return (ox_inventory:Search(source, 'count', item) or 0) > 0
end)

