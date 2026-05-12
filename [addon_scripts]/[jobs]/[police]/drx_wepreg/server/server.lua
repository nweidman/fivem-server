local QBCore = exports['qb-core']:GetCoreObject()

local function findItemBySerial(playerId, serial)
    local items = exports.ox_inventory:GetInventoryItems(playerId)

    if items then
        for _, item in pairs(items) do
            if item.metadata and item.metadata.serial == serial then
                return item
            end
        end
    end

    return nil -- Not found
end


QBCore.Functions.CreateCallback('weaponMenu:checkPermissions', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.job.name == 'police' then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('weaponMenu:checkRegister', function(source, cb, owner, serial)
    local Owner = QBCore.Functions.GetPlayerByCitizenId(owner)
    local Player = QBCore.Functions.GetPlayer(source)
    local weapon = findItemBySerial(Player.PlayerData.source, serial)
    if Owner and weapon then
        cb({
            owner = true,
            serial = true,
            item = weapon.name,
            label = weapon.label
        })
    else
        cb(false)
    end
end)

RegisterNetEvent('weaponMenu:addWeapon', function(owner, serial, weapon, label)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name ~= 'police' then
        TriggerClientEvent('QBCore:Notify', src, 'You don\'t have permission to do that', 'error')
        return
    end

    exports.oxmysql:scalar('SELECT COUNT(*) FROM drx_mdt_weapons WHERE serial = ?', {serial}, function(count)
        if count > 0 then
            TriggerClientEvent('QBCore:Notify', src, 'Serial number already used', 'error')
        else
            exports.oxmysql:insert('INSERT INTO drx_mdt_weapons (owner, serial, weapon, label, content, evidence, tags) VALUES (?, ?, ?, ?, "", "", "")', {
                owner, serial, weapon, label
            }, function(id)
                if id > 0 then
                    TriggerClientEvent('QBCore:Notify', src, 'Weapon added successfully', 'success')
                else
                    TriggerClientEvent('QBCore:Notify', src, 'Error while trying to add the weapon to BDD', 'error')
                end
            end)
        end
    end)
end)