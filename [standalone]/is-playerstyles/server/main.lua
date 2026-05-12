local QBCore = exports['qb-core'] and exports['qb-core']:GetCoreObject() or nil
if not QBCore and exports['qbx_core'] then
    QBCore = exports['qbx_core']:GetCoreObject()
end
assert(QBCore, '^1[is-playerstyles] Could not get CoreObject (qb-core / qbx_core).^7')

local ALLOWED_KINDS = { walkingStyle = true, mood = true }

local AllowedValues = {
    walkingStyle = {},
    mood = {}
}

CreateThread(function()
    if Config and Config.WalkingStyles then
        for _, v in pairs(Config.WalkingStyles) do
            if v and v.Style then AllowedValues.walkingStyle[v.Style] = true end
        end
        AllowedValues.walkingStyle[""] = true
    end
    if Config and Config.Moods then
        for _, v in pairs(Config.Moods) do
            if v and v.Mood then AllowedValues.mood[v.Mood] = true end
        end
    end
end)

local lastWrite = {}
local function rateLimited(src, kind, ms)
    local now = GetGameTimer()
    local t = (lastWrite[src] and lastWrite[src][kind]) or 0
    if now - t < (ms or 750) then return true end
    lastWrite[src] = lastWrite[src] or {}
    lastWrite[src][kind] = now
    return false
end

RegisterNetEvent('is-playerstyles:server:SaveStyle', function(kind, current)
    local src = source
    if type(kind) ~= 'string' or not ALLOWED_KINDS[kind] then return end
    if type(current) ~= 'string' or #current > 64 then return end
    if rateLimited(src, kind, 750) then return end

    local set = AllowedValues[kind]
    if not (set and set[current] ~= nil) then return end

    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    Player.Functions.SetMetaData(kind, current)

    if Config.ForceImmediateSave then
        if QBCore.Player and QBCore.Player.Save then
            QBCore.Player.Save(src)
        elseif QBCore.Functions and QBCore.Functions.Save and QBCore.Functions.Save.Player then
            pcall(QBCore.Functions.Save.Player, src)
        end
    end

    TriggerClientEvent('is-playerstyles:client:Saved', src, kind, current)
end)

QBCore.Functions.CreateCallback('is-playerstyles:server:GetSavedStyles', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return cb(nil) end
    local meta = Player.PlayerData and Player.PlayerData.metadata or {}
    cb({
        walkingStyle = meta.walkingStyle,
        mood = meta.mood
    })
end)

QBCore.Commands.Add(Config.CommandName or 'styles', 'Choose your styles', {}, false, function(source)
    TriggerClientEvent('is-playerstyles:client:OpenStylesMenu', source)
end, 'user')
