if Config.Framework ~= 'esx' then return end

local ESX = exports['es_extended']:getSharedObject()

function GetSource(Player)
    return Player.source
end

function IsAdmin(Player, role)
    if Player.getGroup() == role then
        return true
    else
        return false
    end
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
    Player = xPlayer
end)
