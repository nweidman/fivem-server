local rewards = require 'config'.rewards

if not rewards.status then return end

if GetResourceState('qb-core') ~= 'started' then return end

local QBCore = exports['qb-core']:GetCoreObject()

function GetPlayerBridge(src)
    return QBCore.Functions.GetPlayer(src)
end

function AddItemBridge(src, item, amount)
    return GetPlayerBridge(src).Functions.AddItem(item, amount)
end
