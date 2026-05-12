itemChecker = {
    ['esx'] = function ()
        local ESX = exports['es_extended']:getSharedObject()
        return ESX.SearchInventory(Config.MegaphoneItemName, 1) > 0
    end,
    ['qb-core'] = function ()
        local QBCore = exports['qb-core']:GetCoreObject()
        return QBCore.Functions.HasItem(Config.MegaphoneItemName)
    end,
    ['qbox'] = function ()
        local cnt = exports.ox_inventory:GetItemCount(Config.MegaphoneItemName)
        return cnt > 0
    end,
    ['ox'] = function ()
        local cnt = exports.ox_inventory:GetItemCount(Config.MegaphoneItemName)
        return cnt > 0
    end,


    ['standalone'] = function ()
        return true
    end
}