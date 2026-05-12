local GetEntityCoords = GetEntityCoords
local GetEntityPlayerIsFreeAimingAt = GetEntityPlayerIsFreeAimingAt
local GetEntitySpeed = GetEntitySpeed
local GetVehiclePedIsIn = GetVehiclePedIsIn
local GetVehiclePedIsTryingToEnter = GetVehiclePedIsTryingToEnter
local GetSeatPedIsTryingToEnter = GetSeatPedIsTryingToEnter
local GetVehicleDoorsLockedForPlayer = GetVehicleDoorsLockedForPlayer
local GetPedInVehicleSeat = GetPedInVehicleSeat
local SetVehicleDoorsLockedForPlayer = SetVehicleDoorsLockedForPlayer
local IsEntityDead = IsEntityDead
local IsPedAPlayer = IsPedAPlayer
local GetVehicleDoorLockStatus = GetVehicleDoorLockStatus
local IsControlJustPressed = IsControlJustPressed
local GetVehicleNumberPlateText = GetVehicleNumberPlateText
local GetEntityModel = GetEntityModel
local GetIsVehicleEngineRunning = GetIsVehicleEngineRunning
local SetTimeout = SetTimeout
local GetVehicleClass = GetVehicleClass
local Wait = Wait
local inNoDispatchZone = false
-- Natives Dump --

lib.locale()


local utils = require 'utils.client'
local data = require 'data'
local doorsBlocked = data.doorsBlocked
local progressBar = data.circleProgress and lib.progressCircle or lib.progressBar

local animDict, anim = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer'
local huDict, huAnim = 'missminuteman_1ig_2', 'handsup_base'
local lockpickDic, lockpickAnim = 'veh@break_in@0h@p_m_one@', 'low_force_entry_ds'

local hasCurrentKey = false
local foundCar = 0
local playerId = cache.playerId

if data.Locations['NoDispatchZones'][1] then
    for _, nodispatch in pairs(data.Locations["NoDispatchZones"]) do
        nodispatchzone = lib.zones.box({
            coords = nodispatch.coords,
            size = vec3(nodispatch.length, nodispatch.width, nodispatch.maxZ - nodispatch.minZ),
            rotation = nodispatch.heading,
            debug = false,
            onEnter = function()
                inNoDispatchZone = true
            end,
            onExit = function()
                inNoDispatchZone = false
            end
        })
    end
end

local function getText(vehicle)
    local class = GetVehicleClass(vehicle)
    local searchTime = data.vehicles[class].search
    local search = searchTime and searchTime > 0 and not Entity(vehicle)?.state?.searched
    local hotwire = data.useHotwireSystem and data.vehicles[class].hotwire
    local text = {}

    if search then
        text[#text + 1] = ('%s  \n'):format(locale('search'))
    end

    if hotwire then
        text[#text + 1] = ('%s  \n'):format(locale('hotwire'))
    end

    return text, hotwire, search, searchTime
end

local function carAnim()
    lib.requestAnimDict(animDict, 1000)
    while lib.progressActive() or lib.skillCheckActive() do
        if cache.vehicle and not IsEntityPlayingAnim(cache.ped, animDict, anim, 3) then
            TaskPlayAnim(cache.ped, animDict, anim, 3.0, 3.0, -1, 49, 0, false, false, false)
        end

        Wait(100)
    end

    StopAnimTask(cache.ped, animDict, anim, 3.0)
    RemoveAnimDict(animDict)
end

local function searchVehicle(searchTime)
    SetTimeout(100, carAnim)
    return progressBar({
        duration = searchTime,
        label = locale('search_vehicle'),
        useWhileDead = false,
        canCancel = true,
        position = 'bottom',
        disable = {
            car = true,
            move = true,
            combat = true
        },
    })
end

local function toggleEngine()
    if cache.seat == -1 and (data.immune[GetEntityModel(cache.vehicle)] or utils.hasKey(GetVehicleNumberPlateText(cache.vehicle))) then
        if GetResourceState('Renewed-Fuel') ~= 'missing' then
            local fuel = GetVehicleFuelLevel(cache.vehicle)

            if fuel <= 0 then
                return utils.notify(locale('no_fuel'), 'error')
            end
        end

        local engineHealth, bodyHealth = GetVehicleEngineHealth(cache.vehicle), GetVehicleBodyHealth(cache.vehicle)

        if engineHealth <= 100 or bodyHealth <= 100 then
            return utils.notify(locale('engine_damaged'), 'error')
        end

        local engine = GetIsVehicleEngineRunning(cache.vehicle)

        SetVehicleEngineOn(cache.vehicle, not engine, false, true)

        if not engine then
            local class = GetVehicleClass(cache.vehicle)
            local isBike = class == 8 or class == 9
            local startDict = isBike and 'veh@bike@quad@front@base' or 'oddjobs@towing'

            lib.requestAnimDict(startDict, 1000)
            TaskPlayAnim(cache.ped, startDict, 'start_engine', 8.0, 8.0, isBike and 2250 or 1750, 48, 0, false, false, false)

            Wait(800)

            RemoveAnimDict(startDict)
        end


        utils.notify(locale('engine'):format(engine and locale('stopped') or locale('started')))
    end
end exports('toggleEngine', toggleEngine)

local DisableControlAction = DisableControlAction
local function vehLoop()
    hasCurrentKey = utils.hasKey(GetVehicleNumberPlateText(cache.vehicle))

    if data.vehicleAutoStart then
        if not GetIsVehicleEngineRunning(cache.vehicle) then
            toggleEngine()
        end
    end
    local isEngineStarting = false

    Citizen.CreateThread(function()
        local playerPed = PlayerPedId()
        while IsPedInAnyVehicle(playerPed, false) do
            if GetPedInVehicleSeat(cache.vehicle, -1) ~= playerPed then break end
            local engineRunning = GetIsVehicleEngineRunning(vehicle)
            if not engineRunning and IsControlPressed(0, 71) and hasCurrentKey then -- 71 = INPUT_VEH_ACCELERATE
                if not isEngineStarting then
                    isEngineStarting = true
                    SetVehicleEngineOn(cache.vehicle, true, false, true) -- Start the engine
                    Wait(2000) -- Prevent immediate re-triggering
                    isEngineStarting = false
                end
            end      
            Wait(100)
        end
    end)

    if not data.immune[GetEntityModel(cache.vehicle)] and not utils.setEngineStatus(cache.vehicle) and not hasCurrentKey then
        local text, canHotwire, canSearch, searchTime = getText(cache.vehicle)

        if #text > 0 then
            utils.textUi(table.concat(text))
        end

        while cache.vehicle do
            DisableControlAction(0, 71, true) -- disable vehicle acceleration
            DisableControlAction(0, 72, true) -- disable vehicle braking
            DisableControlAction(0, 32, true) -- disable moving forward
            DisableControlAction(0, 33, true) -- disable moving backwards
            DisableControlAction(0, 34, true) -- disable left strafe
            DisableControlAction(0, 35, true) -- disable right strafe

            if hasCurrentKey or cache.seat ~= -1 or GetIsVehicleEngineRunning(cache.vehicle) then
                break
            end

            if canSearch and IsControlJustPressed(0, 47) then
                SetTimeout(100, carAnim)

                local success = searchVehicle(searchTime)

                if cache.seat == -1 and success then
                    TriggerServerEvent('Renewed-Vehiclekeys:server:searchVehicle')

                    canSearch = false

                    table.remove(text, 1)

                    if #text > 0 then
                        utils.textUi(table.concat(text))
                    else
                        utils.hideTextUi()
                    end
                end
            elseif canHotwire and IsControlJustPressed(0, 38) then
                SetTimeout(100, carAnim)

                
                local difficulty = data.vehicles[GetVehicleClass(cache.vehicle)].hotwire
                local minigame = difficulty and data.difficulties[difficulty]

                local success = minigame and utils.hotwireMinigame(math.random(minigame.turns.min, minigame.turns.max), math.random(minigame.time.min, minigame.time.max))
                if not success and not inNoDispatchZone then 
                    utils.alertHotwire(cache.vehicle) 
                else
                    local rand = math.random(100)
                    if rand < 30 and not inNoDispatchZone then
                        utils.alertLockpick(cache.vehicle)
                    end
                end
                if cache.seat == -1 and success then
                    if GetVehicleAlarmTimeLeft(cache.vehicle) > 0 then
                        SetVehicleAlarm(cache.vehicle, false)
                        SetVehicleAlarmTimeLeft(cache.vehicle, 0)
                    end
                    TriggerServerEvent('Renewed-Vehiclekeys:server:addKey', GetVehicleNumberPlateText(cache.vehicle), true)
                    SetVehicleEngineOn(cache.vehicle, true, true, true)
                end
            end

            Wait(0)
        end

        utils.hideTextUi()
    end
end

local touchlessKey = GetConvarInt('vehiclekeys_usetouchlesskey', 0) == 1

local lastTouched = GetGameTimer()

local function idleVehicle()
    local hasChecked = {}
    while not cache.vehicle do
        local vehicle = GetVehiclePedIsTryingToEnter(cache.ped)
        if vehicle > 0 then
            local model = GetEntityModel(vehicle)
            local seat = GetSeatPedIsTryingToEnter(cache.ped)
            local pedLocked = GetVehicleDoorsLockedForPlayer(vehicle, playerId)
            local ped = GetPedInVehicleSeat(vehicle, seat)
            local class = GetVehicleClass(vehicle)
            local lockStatus = GetVehicleDoorLockStatus(vehicle)

            if data.immune[model] or data.vehicles[class].noLocks then SetVehicleDoorsLocked(vehicle, 0) goto skip end

            if doorsBlocked[model] and doorsBlocked[model][seat] and not pedLocked then
                SetVehicleDoorsLockedForPlayer(vehicle, playerId, true)
                goto skip
            elseif pedLocked and doorsBlocked[model] and not doorsBlocked[model][seat] then
                SetVehicleDoorsLockedForPlayer(vehicle, playerId, false)
                pedLocked = false
            end

            if lockStatus ~= 2 then
                lockStatus = 0
                SetVehicleDoorsLocked(vehicle, 0)
            end

            if touchlessKey and lockStatus == 2 and not hasChecked[vehicle] and utils.hasKey(GetVehicleNumberPlateText(vehicle)) and (GetGameTimer() - lastTouched > 5000) then
                lastTouched = GetGameTimer()
                TriggerServerEvent('Renewed-Vehiclekeys:server:setVehicleUnlocked', VehToNet(vehicle))

                goto skip
            elseif not hasChecked[vehicle] then
                hasChecked[vehicle] = true
            end

            if ped > 0 and IsEntityDead(ped) and not IsPedAPlayer(ped) and not lib.progressActive() and foundCar ~= vehicle then
                TriggerServerEvent('Renewed-Vehiclekeys:server:StealCandyFromKid', PedToNet(ped), VehToNet(vehicle))
            elseif Entity(vehicle)?.state?.vehicleLock == nil and lockStatus == 0 and foundCar ~= vehicle then
                TriggerServerEvent('Renewed-Vehiclekeys:server:updateLocal', VehToNet(vehicle), GetIsVehicleEngineRunning(vehicle))
            end

            ::skip::

            if foundCar ~= vehicle then
                foundCar = vehicle
                SetEntityAsMissionEntity(vehicle, true, true)
                SetVehicleEngineOn(vehicle, GetIsVehicleEngineRunning(vehicle), true, true)
            end

        end
        Wait(100)
    end
end

if data.useKeybindKey then
    lib.addKeybind({
        name = 'engine',
        description = locale('engine_descrip'),
        defaultKey = data.engineKey,
        onPressed = toggleEngine
    })
end


local keyDict, keyAnim = 'anim@mp_player_intmenu@key_fob@', 'fob_click'
local locking = false

local function toggleLights(netId)
    local vehicle = NetToVeh(netId)

    local engineState = GetIsVehicleEngineRunning(vehicle)
    local _, light, highBeam = GetVehicleLightsState(vehicle)

    SetVehicleLights(vehicle, 1)

    local state = Entity(vehicle).state
    local lock = state?.vehicleLock?.lock or 1

    if lock == 1 then
        Wait(250)
        SetVehicleLights(vehicle, 2)
        Wait(200)

        SetVehicleLights(vehicle, 1)
        Wait(450)

    elseif lock == 2 then
        Wait(200)
        SetVehicleLights(vehicle, 2)

        Wait(100)

        SetVehicleLights(vehicle, 1)
        Wait(200)

        SetVehicleLights(vehicle, 2)

        Wait(400)

        SetVehicleLights(vehicle, 1)
    end

    local lightState = (light or highBeam) and 3 or 0

    SetVehicleLights(vehicle, lightState)

    if engineState ~= GetVehicleLightsState(vehicle) then
        SetVehicleEngineOn(vehicle, engineState, true, true)
    end
end

RegisterNetEvent('Renewed-Vehiclekeys:client:toggleLights', toggleLights)

local function toggleLocks(vehicle)
    if locking then return end
    locking = true

    local isUnlocking = Entity(vehicle).state?.vehicleLock?.lock == 2

    if not cache.vehicle then
        lib.requestAnimDict(keyDict, 1000)

        TaskPlayAnim(cache.ped, keyDict, keyAnim, 3.0, 3.0, -1, 49, 0, false, false, false)
    end

    TriggerServerEvent('Renewed-Vehiclekeys:server:toggleLights', VehToNet(vehicle))

    Wait(500)

    TriggerServerEvent('Renewed-Vehiclekeys:server:toggleLock', VehToNet(vehicle))

    Wait(400)

    if not cache.vehicle then
        if IsEntityPlayingAnim(cache.ped, keyDict, keyAnim, 3) then
            StopAnimTask(cache.ped, keyDict, keyAnim, 3.0)
        end

        RemoveAnimDict(keyDict)
    end


    utils.notify(locale('vehicle'):format(isUnlocking and locale('unlocked') or locale('locked')))

    locking = false
end

lib.addKeybind({
    name = 'lock',
    description = locale('lock_descrip'),
    defaultKey = data.lockKey,
    onPressed = function()
        if locking then return end

        if cache.vehicle then
            local plate = GetVehicleNumberPlateText(cache.vehicle)

            local class = GetVehicleClass(cache.vehicle)

            if not data.vehicles[class].noLocks and utils.hasKey(plate) then
                toggleLocks(cache.vehicle)
            end

            return
        end

        local closestKeyCar = utils.getClosestKeyCar()

        if closestKeyCar then
            toggleLocks(closestKeyCar)
        end
    end,
})

lib.onCache('ped', function(value)
    if value then
        SetPedConfigFlag(value, 170, false)
        SetPedConfigFlag(value, 241, true) -- Player will leave the engine on when exiting a vehicle normally
        SetPedConfigFlag(value, 426, false) -- Use Franklin's alternate lockpicking animations for forced entry
        SetPedConfigFlag(value, 429, true)
        SetPedConfigFlag(value, 448, true) -- Will prevent ped from forcing entry into cars that are open from TryLockedDoor state
    end
end)

lib.onCache('seat', function(value)
    if value == -1 then
        return SetTimeout(0, vehLoop)
    end

    hasCurrentKey = false

    SetTimeout(0, idleVehicle)
end)


if data.useWeaponRobbery then
    lib.onCache('weapon', function(value)
        if value and not data.blockedWeapons[value] then
            SetTimeout(0, function()
                while cache.weapon do
                    if not cache.vehicle and not lib.progressActive() then
                        local _, target = GetEntityPlayerIsFreeAimingAt(playerId)
                        local pedveh = target and GetVehiclePedIsIn(target, false) or 0

                        if pedveh > 0 then
                            local peds = utils.getPedsInCar(pedveh)
                            local pedAmount = peds and #peds or 0

                            if pedAmount == 0 or GetEntitySpeed(pedveh) > 3 or #(GetEntityCoords(cache.ped) - GetEntityCoords(target)) > 10 then goto skip end

                            if foundCar ~= pedveh and not data.immune[GetEntityModel(pedveh)] and not IsEntityDead(target) and not IsPedAPlayer(target) then
                                foundCar = pedveh

                                TriggerServerEvent('Renewed-Vehiclekeys:server:robPedKeys', PedToNet(target), VehToNet(pedveh))

                                lib.requestAnimDict(huDict, 1000)

                                for i = 1, pedAmount do
                                    TaskPlayAnim(peds[i], huDict, huAnim, 8.0, 8.0, -1, 50, 0, false, false, false)
                                end

                                RemoveAnimDict(huDict)
                            end
                        end
                    end

                    :: skip ::
                    Wait(150)
                end
            end)
        end
    end)
end

local function canLockPick(vehicle, item)
    local class = vehicle and GetVehicleClass(vehicle)

    if class then
        local itemNames = data.vehicles[class] and data.vehicles[class].pickItem

        if itemNames and next(itemNames) then
            return itemNames?[item]
        end
    end

    return false
end

AddEventHandler('lockpick:use', function(payload)
    if payload?.name == "advancedlockpick" then
        TriggerEvent("lockpicks:UseLockpick", true)
    end
    local vehicle = cache.vehicle or lib.getClosestVehicle(GetEntityCoords(cache.ped), 3.0)
    local canPick = vehicle and DoesEntityExist(vehicle) and canLockPick(vehicle, payload?.name)

    if cache.vehicle and cache.seat ~= -1 then return end

    if not canPick then return vehicle and utils.notify(locale('not_strong_enough'), 'error') end

    if not utils.canLockpick(vehicle) then return end

    local state = Entity(vehicle).state

    if not state.vehicleLock then
        TriggerServerEvent('Renewed-Vehiclekeys:server:updateLocal', VehToNet(vehicle))
        while not state.vehicleLock do
            Wait(100)
        end
    end

    local itemConfig = data?.vehicles?[GetVehicleClass(cache.vehicle)]?.pickItem?[payload?.name]

    if cache.seat == -1 and not GetIsVehicleEngineRunning(vehicle) then
        SetTimeout(100, carAnim)

        local minigame = itemConfig and itemConfig.difficulty and data.difficulties[itemConfig.difficulty]

        TriggerEvent('Renewed-Vehiclekeys:pickVehicle', vehicle, payload?.slot, payload?.name)

        local success = minigame and utils.lockpickGame(math.random(minigame.turns.min, minigame.turns.max), math.random(minigame.time.min, minigame.time.max))

        if cache.seat == -1 and success then
            if GetVehicleAlarmTimeLeft(vehicle) > 0 then
                SetVehicleAlarm(vehicle, false)
                SetVehicleAlarmTimeLeft(vehicle, 0)
            end

            SetVehicleEngineOn(vehicle, true, true, true)
        end

        StopAnimTask(cache.ped, animDict, anim, 3.0)
        if not success and not inNoDispatchZone then 
            utils.alertLockpick(vehicle)
        else
            local rand = math.random(100)
            if rand < 30 and not inNoDispatchZone then
                utils.alertLockpick(vehicle)
            end
        end
        return
    elseif GetVehicleDoorLockStatus(vehicle) == 2 or state?.vehicleLock?.lock == 2 then
        TriggerEvent('Renewed-Vehiclekeys:pickVehicle', vehicle, payload?.slot, payload?.name)
        TriggerServerEvent('Renewed-Vehiclekeys:server:lockpickDoor', VehToNet(vehicle), payload?.slot, payload?.name, itemConfig.degrade)
        
        if not inNoDispatchZone then utils.alertLockpick(vehicle) end
    end

end)


-- Statebags --
utils.stateBagWrapper('vehicleLock', function(entity, value)
    if type(value) == 'table' then
        SetVehicleDoorsLocked(entity, value.lock)

        if value.sound and #(GetEntityCoords(entity) - GetEntityCoords(cache.ped)) < 20 then

            while not RequestScriptAudioBank('dlc_vehiclekeys/vehiclekeys', false) do
                Wait(0)
            end

            local soundId = GetSoundId()

            PlaySoundFromEntity(soundId, value.lock == 2 and 'lock' or 'unlock', entity, 'DLC_VEHICLEKEYS_SET', 0, 0)

            ReleaseSoundId(soundId)

            ReleaseNamedScriptAudioBank('dlc_vehiclekeys/vehiclekeys')
        end
    end
end)

-- Callbacks --
local cancelPedSteal = false
lib.callback.register('Renewed-Vehiclekeys:client:stealFromPed', function(netId)
    local ped = NetToPed(netId)
    if not IsEntityDead(ped) then return false end

    cancelPedSteal = false
    SetTimeout(100, function()
        while lib.progressActive() do
            local vehicle = GetVehiclePedIsTryingToEnter(cache.ped)
            if GetVehiclePedIsIn(cache.ped, false) > 0 then return end

            if vehicle == 0 then
                cancelPedSteal = true
                lib.cancelProgress()

                break
            end
            Wait(100)
        end

        if cancelPedSteal then return end
        utils.pedFlee(vehicle)
    end)

    local success = lib.progressCircle({
        duration = 3000,
        label = locale('taking_keys'),
        position = 'bottom',
    })

    return success and cancelPedSteal == false
end)

lib.callback.register('Renewed-Vehiclekeys:client:robPedKeys', function(netId, vehicleNetId)
    local ped, vehicle = NetToPed(netId), NetToVeh(vehicleNetId)

    if not DoesEntityExist(ped) then return false end

    local haveAlerted = false
    cancelPedSteal = false

    SetTimeout(100, function()
        while lib.progressActive() do
            local distance = #(GetEntityCoords(cache.ped) - GetEntityCoords(ped))

            if not haveAlerted and not inNoDispatchZone then
                utils.alertVehicleTheft(vehicle, ped)
                haveAlerted = true
            end

            if IsPedDeadOrDying(ped) or distance > 10.0 or not cache.weapon or not IsPlayerFreeAiming(playerId) then
                cancelPedSteal = true
                lib.cancelProgress()

                Wait(100)

                foundCar = 0

                break
            end

            Wait(100)
        end

        if not cancelPedSteal then
            utils.pedFlee(vehicle)
        end
    end)

    local success = progressBar({
        duration = 3000,
        label = locale('stealing_keys'),
        position = 'bottom',
    })

    return success and not cancelPedSteal
end)

lib.callback.register('Renewed-Vehiclekeys:client:lockPickCar', function(netId, item)
    local vehicle = NetToVeh(netId)

    if not DoesEntityExist(vehicle) then return false end

    lib.requestAnimDict(lockpickDic, 1000)

    TaskTurnPedToFaceEntity(cache.ped, vehicle, 200)

    if not GetIsVehicleEngineRunning(vehicle) then
        SetVehicleAlarm(vehicle, true)
        SetVehicleAlarmTimeLeft(vehicle, 60000)
    end

    SetTimeout(0, function()
        while lib.skillCheckActive() do
            TaskPlayAnim(cache.ped, lockpickDic, lockpickAnim, 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Wait(1000)
        end
    end)

    local class = GetVehicleClass(vehicle)

    local difficulty = data?.vehicles?[class]?.pickItem?[item].difficulty
    local minigame = difficulty and data.difficulties[difficulty]

    local success = minigame and utils.lockpickGame(math.random(minigame.turns.min, minigame.turns.max), math.random(minigame.time.min, minigame.time.max))

    StopAnimTask(cache.ped, lockpickDic, lockpickAnim, 3.0)
    RemoveAnimDict(lockpickDic)

    return success
end)


if data.useKeyItem then
    AddEventHandler('ox_inventory:updateInventory', function(changes)
        if hasCurrentKey or cache.seat ~= -1 or GetIsVehicleEngineRunning(cache.vehicle) then return end

        local tempKeys = {}

        for k, v in pairs(changes) do
            if tempKeys[k] and v?.name ~= 'vehiclekey' then
                tempKeys[k] = nil
            elseif v?.name == 'vehiclekey' then
                tempKeys[k] = v?.metadata?.plate
            end
        end


        if next(tempKeys) then
            local plate = GetVehicleNumberPlateText(cache.vehicle)

            for _, v in pairs(tempKeys) do
                if v and v == plate then
                    hasCurrentKey = true
                    return
                end
            end

            hasCurrentKey = false
            SetTimeout(0, vehLoop)
        end
    end)
else
    local function loadKeys(Keys)
        Keys = Keys or lib.callback.await('Renewed-Vehiclekeys:server:getKeys', false)

        utils.setKeys(Keys)

        if cache.seat == -1 then
            hasCurrentKey = utils.hasKey(GetVehicleNumberPlateText(cache.vehicle))
        end
    end


    RegisterNetEvent('Renewed-Vehiclekeys:client:syncKeys', loadKeys)

    AddEventHandler('Renewed-Lib:client:PlayerLoaded', function()
        loadKeys()
    end)
end

AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
        if cache.vehicle then
            SetTimeout(0, vehLoop)
        else
            SetTimeout(0, idleVehicle)
        end

        SetPedConfigFlag(cache.ped, 170, false)
        SetPedConfigFlag(cache.ped, 241, true) -- Player will leave the engine on when exiting a vehicle normally
        SetPedConfigFlag(cache.ped, 426, false) -- Use Franklin's alternate lockpicking animations for forced entry
        SetPedConfigFlag(cache.ped, 429, true)
        SetPedConfigFlag(cache.ped, 448, true) -- Will prevent ped from forcing entry into cars that are open from TryLockedDoor state
   end
end)


CreateThread(function()
    while not GetResourceState('ox_inventory') == 'started' do
        Wait(100)
    end

    exports.ox_inventory:displayMetadata('plate', locale('plate'))
end)