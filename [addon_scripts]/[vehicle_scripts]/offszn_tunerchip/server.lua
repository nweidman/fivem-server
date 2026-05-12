local tunedVehicles = {}
local allowedHashes = {}

CreateThread(function()
    for i = 1, #Config.AllowedVehicles do
        allowedHashes[joaat(Config.AllowedVehicles[i])] = true
    end
end)

local function getVehicleFromNetId(netId)
    if not netId or netId == 0 then return nil end

    local entity = NetworkGetEntityFromNetworkId(netId)
    if entity and entity ~= 0 and DoesEntityExist(entity) then
        return entity
    end

    return nil
end

local function playerIsDriverOfVehicle(source, vehicle)
    local ped = GetPlayerPed(source)
    if not ped or ped == 0 then return false end
    if not vehicle or vehicle == 0 then return false end
    if GetVehiclePedIsIn(ped, false) ~= vehicle then return false end
    if Config.DriverOnly and GetPedInVehicleSeat(vehicle, -1) ~= ped then return false end
    return true
end

exports.qbx_core:CreateUseableItem(Config.ItemName, function(source)
    TriggerClientEvent(':client:useChip', source)
end)

lib.callback.register(':server:installChip', function(source, plate, netId, baseForce)
    local vehicle = getVehicleFromNetId(netId)
    if not vehicle then
        return false, 'Vehicle not found.'
    end

    if not playerIsDriverOfVehicle(source, vehicle) then
        return false, 'You must be in the driver seat.'
    end

    local model = GetEntityModel(vehicle)
    if not allowedHashes[model] then
        return false, 'This vehicle cannot use a tuner chip.'
    end

    if tunedVehicles[plate] then
        return false, 'This vehicle already has a tuner chip active.'
    end

    tunedVehicles[plate] = {
        installed = true,
        effectType = Config.EffectType or 'power',
        powerMultiplier = tonumber(Config.PowerMultiplier) or 15.0,
        accelerationBonus = tonumber(Config.AccelerationBonus) or 0.10,
        baseForce = tonumber(baseForce) or 0.0
    }

    TriggerClientEvent(':client:syncInstall', -1, plate, tunedVehicles[plate])
    return true, 'Tuner chip installed.'
end)

lib.callback.register(':server:getTuneData', function(_, plate)
    return tunedVehicles[plate]
end)

RegisterNetEvent(':server:removeChip', function(plate)
    if not plate or plate == '' then return end
    tunedVehicles[plate] = nil
    TriggerClientEvent(':client:syncRemove', -1, plate)
end)