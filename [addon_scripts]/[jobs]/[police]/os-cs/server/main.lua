-- COMMUNITY SERVICE (SERVER) - Qbox compatible
-- deps: qb-core (Qbox shim)

local QBCore = exports['qb-core']:GetCoreObject()

local function getPlayer(src)
    return QBCore.Functions.GetPlayer(src)
end

local function setCSMeta(player, value)
    value = tonumber(value or 0) or 0
    if value < 0 then value = 0 end
    player.Functions.SetMetaData('communityservice', value)
end

-- finish service for caller
RegisterNetEvent('esx_communityservice:finishCommunityService', function(_key)
    local src = source
    local xPlayer = getPlayer(src)
    if not xPlayer then return end

    setCSMeta(xPlayer, 0)
    TriggerClientEvent('esx_communityservice:finishCommunityService', xPlayer.PlayerData.source)
end)

-- start service for target player (server-initiated)
RegisterNetEvent('esx_communityservice:sendToCommunityService', function(player, count, _key)
    local tPlayer = getPlayer(tonumber(player))
    if not tPlayer then return end

    count = tonumber(count or 0) or 0
    setCSMeta(tPlayer, count)
    TriggerClientEvent('esx_communityservice:inCommunityService', tPlayer.PlayerData.source, count)
end)

-- one action complete (caller)
RegisterNetEvent('esx_communityservice:completeService', function(_key)
    local src = source
    local xPlayer = getPlayer(src)
    if not xPlayer then return end

    local cur = tonumber(xPlayer.PlayerData.metadata and xPlayer.PlayerData.metadata.communityservice or 0) or 0
    setCSMeta(xPlayer, cur - 1)
end)

-- extend sentence (escape)
RegisterNetEvent('esx_communityservice:extendService', function()
    local src = source
    local xPlayer = getPlayer(src)
    if not xPlayer then return end

    local cur = tonumber(xPlayer.PlayerData.metadata and xPlayer.PlayerData.metadata.communityservice or 0) or 0
    local extra = tonumber(Config.ServiceExtensionOnEscape or 5) or 5
    setCSMeta(xPlayer, cur + extra)
end)

-- alt entry point in your codebase
RegisterNetEvent('qb-communityservice:server:StartCommunityService', function(targetSourceId, sentence, _key)
    local tPlayer = getPlayer(tonumber(targetSourceId))
    if not tPlayer then return end

    local count = tonumber(sentence or 0) or 0
    setCSMeta(tPlayer, count)
    TriggerClientEvent('esx_communityservice:inCommunityService', tPlayer.PlayerData.source, count)
end)

-- tablet flow from /comserv
RegisterNetEvent('sendserverdatass', function(data)
    local src = source
    local xPlayer = getPlayer(src)
    if not xPlayer then return end

    local job = xPlayer.PlayerData.job and xPlayer.PlayerData.job.name or 'unemployed'
    if job ~= 'police' and job ~= 'sheriff' then return end

    local targetId = tonumber(data and data.id)
    local count    = tonumber(data and data.kamu) or 0
    if not targetId or count < 1 then
        TriggerClientEvent('QBCore:Notify', src, 'Invalid player or sentence.', 'error')
        return
    end

    local tPlayer = getPlayer(targetId)
    if not tPlayer then
        TriggerClientEvent('QBCore:Notify', src, 'There is no such player!', 'error')
        return
    end

    setCSMeta(tPlayer, count)
    TriggerClientEvent('esx_communityservice:inCommunityService', tPlayer.PlayerData.source, count)
    TriggerClientEvent('QBCore:Notify', src, 'Player has been sentenced to community service.')
end)

-- safe player list callback for labels
QBCore.Functions.CreateCallback('MakePlayerList', function(source, cb)
    local ok, result = pcall(function()
        local out = {}
        local list = QBCore.Functions.GetPlayers() or {}
        for _, sid in pairs(list) do
            sid = tonumber(sid)
            local P = getPlayer(sid)
            if P and P.PlayerData then
                local c = P.PlayerData.charinfo or {}
                out[#out+1] = {
                    value = sid,
                    text  = ('[%d] - %s %s'):format(sid, c.firstname or 'First', c.lastname or 'Last')
                }
            end
        end
        return out
    end)

    if not ok then
        print(('[communityservice] MakePlayerList callback error: %s'):format(result))
        cb({})
        return
    end

    cb(result)
end)

-- command to end service (police/sheriff)
QBCore.Commands.Add('endcomserv', 'End a player\'s community service', {{ name = 'id', help = 'Player ID' }}, true,
function(source, args)
    local xPlayer = getPlayer(source)
    if not xPlayer then return end

    local job = xPlayer.PlayerData.job and xPlayer.PlayerData.job.name or 'unemployed'
    if job ~= 'police' and job ~= 'sheriff' then return end

    local target = tonumber(args[1])
    if not target then
        TriggerClientEvent('QBCore:Notify', source, 'Invalid ID', 'error')
        return
    end

    local tPlayer = getPlayer(target)
    if not tPlayer then
        TriggerClientEvent('QBCore:Notify', source, 'There is no such player!', 'error')
        return
    end

    setCSMeta(tPlayer, 0)
    TriggerClientEvent('esx_communityservice:finishCommunityService', tPlayer.PlayerData.source)
end, 'user')
