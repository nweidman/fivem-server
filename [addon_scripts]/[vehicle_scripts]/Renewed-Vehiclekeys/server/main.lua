local utils = require 'utils.server'
local data = require 'data'

RegisterNetEvent('Renewed-Vehiclekeys:server:updateLocal', function(netId)
    local entity = utils.getEntityFromNetId(netId)

    if entity and #(GetEntityCoords(GetPlayerPed(source)) - GetEntityCoords(entity)) < 10 then
        local lockChance = GetPedInVehicleSeat(entity, -1) ~= 0 and data.lockChance or data.lockChance

        local state = Entity(entity).state

        if not state.vehicleLock then
            state:set('vehicleLock', {
                lock = math.random() <= lockChance and 2 or 1
            }, true)
        end
    end
end)

RegisterNetEvent('Renewed-Vehiclekeys:server:toggleLock', function(netId)
    local vehicle = utils.getEntityFromNetId(netId)

    if vehicle > 0 and utils.hasKey(source, GetVehicleNumberPlateText(vehicle)) then
        local state = Entity(vehicle).state

        local vehiclelock = state?.vehicleLock?.lock or 1

        local newLock = vehiclelock < 2 and 2 or 1

        if newLock == vehiclelock then
            state:set('vehicleLock', false, true)
        end

        state:set('vehicleLock', {
            lock = vehiclelock < 2 and 2 or 1,
            sound = true
        }, true)
    end
end)

RegisterNetEvent('Renewed-Vehiclekeys:server:setVehicleUnlocked', function(netId)
    local vehicle = utils.getEntityFromNetId(netId)

    if vehicle > 0 and utils.hasKey(source, GetVehicleNumberPlateText(vehicle)) then
        Entity(vehicle).state:set('vehicleLock', {
            lock = 1,
        }, true)
    end
end)

RegisterNetEvent('Renewed-Vehiclekeys:server:toggleLights', function(netId)
    local vehicle = utils.getEntityFromNetId(netId)

    if vehicle then
        TriggerClientEvent('Renewed-Vehiclekeys:client:toggleLights', NetworkGetEntityOwner(vehicle), netId)
    end
end)

RegisterNetEvent('Renewed-Vehiclekeys:server:searchVehicle', function()
    local src = source
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(src), false)

    if vehicle > 0 and DoesEntityExist(vehicle) then
        local state = Entity(vehicle).state

        if not state.searched then
            state:set('searched', true, true)

            if math.random() < data.searchPercent then
                local item = data.rewards[math.random(#data.rewards)]

                if item.name == 'key' then
                    utils.addKey(src, GetVehicleNumberPlateText(vehicle))
                else
                    exports.ox_inventory:AddItem(src, item.name, item.amount)
                end
            else
                TriggerClientEvent('QBCore:Notify', locale('found_nothing'), 'error', 5000)
                -- utils.notify(src, 'error', locale('found_nothing'))
            end
        end
    end
end)


RegisterNetEvent('Renewed-Vehiclekeys:server:lockpickDoor', function(netId, slot, item, degrade)
    local src = source
    local vehicle = utils.getEntityFromNetId(netId)

    local slotItem = vehicle and slot and exports.ox_inventory:GetSlot(src, slot)

    if not slotItem or slotItem.name ~= item then return end

    local success = lib.callback.await('Renewed-Vehiclekeys:client:lockPickCar', src, netId, item)

    if degrade then
        local minus = math.random(degrade.min, degrade.max)
        if minus > 0 then
            local newAmount = (slotItem?.metadata?.durability or 100) - minus

            if newAmount > 0 then
                utils.setDurability(src, slot, newAmount)
            else
                utils.removeItem(src, item, slot)
            end
        end
    end

    if success then
        local state = Entity(vehicle).state

        if state?.vehicleLock == 1 then
            state:set('vehicleLock', false, true)
        end

        state:set('vehicleLock', {
            lock = 1,
        }, true)
    else
        local break_chance = math.random(1, 100)
        if break_chance <= 30 then
            utils.removeItem(src, item, slot)
        end
    end
end)

RegisterNetEvent('Renewed-Vehiclekeys:server:StealCandyFromKid', function(deadPed, Vehicle)
    local src = source

    local ped, vehicle = utils.getEntityFromNetId(deadPed), utils.getEntityFromNetId(Vehicle)

    if ped == 0 or vehicle == 0 then return end

    if IsPedAPlayer(ped) then return end

    local pedCoords = GetEntityCoords(GetPlayerPed(src))

    if #(pedCoords - GetEntityCoords(ped)) > 10 or #(pedCoords - GetEntityCoords(vehicle)) > 20 then return end

    if lib.callback.await('Renewed-Vehiclekeys:client:stealFromPed', src, deadPed) then
        utils.addKey(src, GetVehicleNumberPlateText(vehicle))

        Entity(vehicle).state:set('vehicleLock', {
            lock = 1,
        }, true)
    end
end)

RegisterNetEvent('Renewed-Vehiclekeys:server:robPedKeys', function(robbedPed, Vehicle)
    local src = source

    local ped, vehicle = utils.getEntityFromNetId(robbedPed), utils.getEntityFromNetId(Vehicle)

    if ped == 0 or vehicle == 0 or IsPedAPlayer(ped) then return end

    local pedCoords = GetEntityCoords(GetPlayerPed(src))

    if #(pedCoords - GetEntityCoords(ped)) < 10 and #(pedCoords - GetEntityCoords(vehicle)) < 10 then
        local freeze = GetEntitySpeed(vehicle) < 0.5 and math.random() <= 0.90 -- 10% chance to not freeze, which would cause the ped to drive off

        FreezeEntityPosition(vehicle, freeze)

        local success = lib.callback.await('Renewed-Vehiclekeys:client:robPedKeys', src, robbedPed, Vehicle)

        if freeze then
            FreezeEntityPosition(vehicle, false)
        end

        if success then
            utils.addKey(src, GetVehicleNumberPlateText(vehicle))

            Entity(vehicle).state:set('vehicleLock', {
                lock = 1,
            }, true)
        end
    end
end)

lib.callback.register('Renewed-Vehiclekeys:server:getKeys', function(source)
    return utils.getKeys(source)
end)

lib.callback.register('Renewed-Vehiclekeys:server:hasKey', function(source, plate)
    return utils.hasKey(source, plate)
end)