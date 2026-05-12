local QBCore = exports['qb-core']:GetCoreObject()

local function openWeaponMenu()
    local input = exports['qb-input']:ShowInput({
        header = "Register weapon to the MDT",
        submitText = "Add Weapon",
        inputs = {
            {
                text = "Owner's (State ID)",
                name = "owner",
                type = "text",
                isRequired = true
            },
            {
                text = "Serial #",
                name = "serial",
                type = "text",
                isRequired = true
            }
        }
    })

    if input then
        QBCore.Functions.TriggerCallback('weaponMenu:checkRegister', function(data)
            if data and data.owner and data.serial then
                TriggerServerEvent('weaponMenu:addWeapon', input.owner, input.serial, data.item, data.label)
            else
                QBCore.Functions.Notify('Invalid entry. Please ensure you are using a valid State ID and Serial Number.', 'error')
            end
        end, input.owner, input.serial)        
    end
end

RegisterCommand('registerweapon', function()
    QBCore.Functions.TriggerCallback('weaponMenu:checkPermissions', function(hasPermission)
        if hasPermission then
            openWeaponMenu()
        else
            QBCore.Functions.Notify('You don\'t have the permissions', 'error')
        end
    end)
end, false)
