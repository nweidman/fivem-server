local allowedHashes = {}
local activePlate = nil
local activeVehicle = nil

CreateThread(function()
    for i = 1, #Config.AllowedVehicles do
        allowedHashes[joaat(Config.AllowedVehicles[i])] = true
    end
end)

local function notify(msg, nType)
    lib.notify({
        title = Config.NotifyTitle,
        description = msg,
        type = nType or 'inform'
    })
end

local function trim(str)
    if not str then return nil end
    return (str:gsub('^%s*(.-)%s*$', '%1'))
end

local function getPlate(vehicle)
    if not vehicle or vehicle == 0 or not DoesEntityExist(vehicle) then
        return nil
    end

    local plate = GetVehicleNumberPlateText(vehicle)
    if not plate or plate == '' then
        return nil
    end

    return trim(plate)
end

local function isAllowedVehicle(vehicle)
    return vehicle and vehicle ~= 0 and DoesEntityExist(vehicle) and allowedHashes[GetEntityModel(vehicle)] == true
end

local function loadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return true end

    RequestAnimDict(dict)

    local timeout = GetGameTimer() + 5000
    while not HasAnimDictLoaded(dict) do
        Wait(50)
        if GetGameTimer() > timeout then
            return false
        end
    end

    return true
end

local function startInstallAnim()
    if not Config.Anim or not Config.Anim.dict or not Config.Anim.clip then
        return true
    end

    if not loadAnimDict(Config.Anim.dict) then
        return false
    end

    TaskPlayAnim(
        cache.ped,
        Config.Anim.dict,
        Config.Anim.clip,
        3.0,
        3.0,
        -1,
        Config.Anim.flag or 49,
        0.0,
        false,
        false,
        false
    )

    return true
end

local function stopInstallAnim()
    ClearPedTasks(cache.ped)
end

local function removeChipEffect(vehicle)
    if not vehicle or vehicle == 0 or not DoesEntityExist(vehicle) then
        activeVehicle = nil
        activePlate = nil
        return
    end

    local plate = getPlate(vehicle)
    local tuneData = plate and lib.callback.await(':server:getTuneData', false, plate) or nil
    local effectType = (tuneData and tuneData.effectType) or Config.EffectType or 'power'

    SetVehicleEnginePowerMultiplier(vehicle, 0.0)

    if effectType == 'handling' and tuneData and tuneData.baseForce then
        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveForce', tonumber(tuneData.baseForce) or 0.0)
        ModifyVehicleTopSpeed(vehicle, 1.0)
    end

    activeVehicle = nil
    activePlate = nil
end

local function applyChipEffect(vehicle, tuneData)
    if not vehicle or vehicle == 0 or not DoesEntityExist(vehicle) then return false end
    if not tuneData then return false end

    local effectType = tuneData.effectType or Config.EffectType or 'power'

    if effectType == 'power' then
        local power = tonumber(tuneData.powerMultiplier) or tonumber(Config.PowerMultiplier) or 15.0
        SetVehicleEnginePowerMultiplier(vehicle, power)
    else
        local baseForce = tonumber(tuneData.baseForce) or GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveForce')
        local bonus = tonumber(tuneData.accelerationBonus) or tonumber(Config.AccelerationBonus) or 0.10
        local newForce = baseForce + bonus

        SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveForce', newForce)
        ModifyVehicleTopSpeed(vehicle, 1.0)
    end

    activeVehicle = vehicle
    activePlate = getPlate(vehicle)
    return true
end

local function canUseOnVehicle(vehicle, showNotify)
    if not vehicle or vehicle == 0 or not DoesEntityExist(vehicle) then
        if showNotify ~= false then
            notify('You must be inside a vehicle.', 'error')
        end
        return false
    end

    if Config.DriverOnly and GetPedInVehicleSeat(vehicle, -1) ~= cache.ped then
        if showNotify ~= false then
            notify('You must be in the driver seat.', 'error')
        end
        return false
    end

    if Config.RequireEngineOn and not GetIsVehicleEngineRunning(vehicle) then
        if showNotify ~= false then
            notify('The engine must be running.', 'error')
        end
        return false
    end

    if not isAllowedVehicle(vehicle) then
        if showNotify ~= false then
            notify('This vehicle cannot use a tuner chip.', 'error')
        end
        return false
    end

    if Config.CancelOnVehicleMove and GetEntitySpeed(vehicle) > 0.5 then
        if showNotify ~= false then
            notify('Vehicle must be stopped.', 'error')
        end
        return false
    end

    return true
end

RegisterNetEvent('_tunerchip:client:useChip', function()
    local vehicle = cache.vehicle

    if not canUseOnVehicle(vehicle, true) then
        return
    end

    local plate = getPlate(vehicle)
    if not plate then
        notify('Unable to read vehicle plate.', 'error')
        return
    end

    local existing = lib.callback.await(':server:getTuneData', false, plate)
    if existing then
        notify('This vehicle already has a tuner chip active.', 'error')
        return
    end

    if not startInstallAnim() then
        notify('Failed to load install animation.', 'error')
        return
    end

    local finished = lib.progressBar({
        duration = Config.InstallTime,
        label = 'Installing tuner chip...',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = Config.CancelOnMove,
            combat = true,
            car = true,
            mouse = false
        }
    })

    stopInstallAnim()

    if not finished then
        notify('Installation cancelled.', 'error')
        return
    end

    vehicle = cache.vehicle
    if not canUseOnVehicle(vehicle, true) then
        return
    end

    local plate2 = getPlate(vehicle)
    if not plate2 then
        notify('Unable to read vehicle plate.', 'error')
        return
    end

    local netId = NetworkGetNetworkIdFromEntity(vehicle)
    if not netId or netId == 0 then
        notify('Vehicle is not networked.', 'error')
        return
    end

    local baseForce = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveForce')

    local success, msg = lib.callback.await(
        ':server:installChip',
        false,
        plate2,
        netId,
        baseForce
    )

    if not success then
        notify(msg or 'Install failed.', 'error')
        return
    end

    local tuneData = lib.callback.await(':server:getTuneData', false, plate2)
    applyChipEffect(vehicle, tuneData)
    notify('Tuner chip installed.', 'success')
end)

RegisterNetEvent(':client:syncInstall', function(plate, tuneData)
    local vehicle = cache.vehicle
    if not vehicle or vehicle == 0 or not DoesEntityExist(vehicle) then return end

    local myPlate = getPlate(vehicle)
    if myPlate == plate then
        applyChipEffect(vehicle, tuneData)
    end
end)

RegisterNetEvent(':client:syncRemove', function(plate)
    local vehicle = cache.vehicle
    if not vehicle or vehicle == 0 or not DoesEntityExist(vehicle) then
        if activePlate == plate then
            activeVehicle = nil
            activePlate = nil
        end
        return
    end

    local myPlate = getPlate(vehicle)
    if myPlate == plate then
        removeChipEffect(vehicle)
    end
end)

lib.onCache('vehicle', function(vehicle)
    if vehicle and vehicle ~= 0 then
        Wait(150)

        if not DoesEntityExist(vehicle) then return end
        if Config.DriverOnly and GetPedInVehicleSeat(vehicle, -1) ~= cache.ped then return end

        local plate = getPlate(vehicle)
        if not plate then return end

        local tuneData = lib.callback.await(':server:getTuneData', false, plate)
        if tuneData then
            applyChipEffect(vehicle, tuneData)
        end
    else
        if activePlate then
            local oldPlate = activePlate
            local oldVehicle = activeVehicle

            if oldVehicle and DoesEntityExist(oldVehicle) then
                removeChipEffect(oldVehicle)
            else
                activeVehicle = nil
                activePlate = nil
            end

            TriggerServerEvent(':server:removeChip', oldPlate)
        end
    end
end)