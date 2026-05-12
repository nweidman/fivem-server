---@class BridgeNamespace
Bridge = {}
Framework = nil
local QBCore, ESX = nil, nil

local AllowedUsers = { -- add your allowed users here if Config.UsePerms is true.
    -- Example Useage:
    -- ["license:xxxxxxxxxxxxxxxxxxxxxxxx"] = true,
    -- ["discord:xxxxxxxxxxx"] = true,
    -- ["fivem:xxxxxx"] = true,
    -- ["steam:1100001475ecc83"] = true, -- Unknown
}

-- Framework Detection and Initialization
if GetResourceState('qbx_core') == "started" then
    Framework = 'qbx_core'
elseif GetResourceState('qb-core') == "started" then
    QBCore = exports['qb-core']:GetCoreObject()
    Framework = 'qb-core'
elseif GetResourceState('es_extended') == "started" then
    Framework = 'es_extended'
    ESX = exports.es_extended:getSharedObject()
else
    print("^1[XMMX-DEBUG] ^3No Valid Framework Detected! ^0 Configure your framework.")
end

Bridge.Notification = function(src, _message, _type, _time)
    if Framework == "qb-core" then
        QBCore.Functions.Notify(src, _message, _type, _time or 5000)
    elseif Framework == "qbx_core" then
        if _type == "primary" then
            exports.qbx_core:Notify(src, _message, "inform", _time or 5000)
        else
            exports.qbx_core:Notify(src, _message, _type, _time or 5000)
        end
    elseif Framework == "es_extended" then
        if _type == "primary" then 
            TriggerClientEvent('esx:showNotification', src, _message, 'info', time or 5000)
        else
            TriggerClientEvent('esx:showNotification', src, _message, _type, time or 5000)
        end  
    end
end

lib.callback.register('xmmx_photolights:server:checkPerms', function(source)
    if Framework == "qbx_core" then
        local Player = exports.qbx_core:GetPlayer(source)
        if not Player or not Player.PlayerData or not Player.PlayerData.job then
            return false
        end

        local jobName = Player.PlayerData.job.name
        if jobName == 'photo' then
            return true
        end

        return false
    end

    for _, id in ipairs(GetPlayerIdentifiers(source) or {}) do
        if AllowedUsers[id:lower()] then
            return true
        end
    end

    return false
end)

local ITEM_NAME = 'photography_lightcase' 

exports.ox_inventory:registerHook('useItem', function(payload)
    if payload.item.name ~= 'photography_lightcase' then
        return
    end

    return false
end)

