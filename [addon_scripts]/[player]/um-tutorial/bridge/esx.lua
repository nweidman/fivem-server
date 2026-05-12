local rewards = require 'config'.rewards

if not rewards.status then return end

if GetResourceState('es_extended') ~= 'started' then return end

local ESX = exports['es_extended']:getSharedObject()

function GetPlayerBridge(src)
    return ESX.GetPlayerFromId(src)
end

function AddItemBridge(src, item, amount)
    return GetPlayerBridge(src).addInventoryItem(item, amount)
end
