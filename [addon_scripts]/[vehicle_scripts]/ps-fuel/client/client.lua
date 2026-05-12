---@diagnostic disable: undefined-global

local QBX = exports.qbx_core
local lib = lib

local fuelSynced   = false
local inBlacklisted = false
local inGasStation  = false
local isFueling     = false
local Stations      = {}

local props = {
    'prop_gas_pump_1d',
    'prop_gas_pump_1a',
    'prop_gas_pump_1b',
    'prop_gas_pump_1c',
    'prop_vintage_pump',
    'prop_gas_pump_old2',
    'prop_gas_pump_old3',
}

local CurrentWeaponData = {}
local hasNozzle = false
local gasNozzle = nil
local refueling = false

-- ========================
-- Small helpers / wrappers
-- ========================

local function notify(desc, typ)
    lib.notify({ title = Lang and Lang:t('info.gas_station') or 'Gas Station', description = desc, type = typ or 'inform' })
end

local function loadModel(model)
    local hash = type(model) == 'number' and model or joaat(model)
    if HasModelLoaded(hash) then return true end
    RequestModel(hash)
    local t = GetGameTimer()
    while not HasModelLoaded(hash) do
        Wait(0)
        if GetGameTimer() - t > 5000 then return false end
    end
    return true
end

local function playAnim(dict, name, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) end
    TaskPlayAnim(PlayerPedId(), dict, name, 8.0, 1.0, -1, flag or 1, 0, false, false, false)
end

local function oxProgress(label, duration)
    return lib.progressBar({
        label = label or 'Working...',
        duration = duration or 10000,
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true,
            mouse = false
        }
    })
end

local function getPlayerMoney()
    local pd = QBX:GetPlayerData()
    return (pd and pd.money) or { cash = 0, bank = 0 }
end

local function closestVehicle(radius)
    radius = radius or 8.0
    local ped = PlayerPedId()
    local pcoords = GetEntityCoords(ped)
    local vehicles = GetGamePool('CVehicle')
    local closest, dist = 0, radius + 0.001
    for i = 1, #vehicles do
        local veh = vehicles[i]
        local d = #(GetEntityCoords(veh) - pcoords)
        if d < dist then
            closest = veh
            dist = d
        end
    end
    return closest ~= 0 and closest or nil
end

local function isHoldingWeapon(weaponHash)
    return GetSelectedPedWeapon(PlayerPedId()) == weaponHash
end

-- You must provide these in your shared Config or existing fuel resource:
--   GetFuel(vehicle), SetFuel(vehicle, value), Round(number, decimals), Config.FuelDecor, Config.FuelUsage, Config.Classes
--   Config.ShowNearestGasStationOnly, Config.GasStationsBlips, CreateBlip(coords), Config.GasStations (zones), etc.

local function ManageFuelUsage(vehicle)
	if not DecorExistOn(vehicle, Config.FuelDecor) then
		SetFuel(vehicle, math.random(200, 800) / 10)
	elseif not fuelSynced then
		SetFuel(vehicle, GetFuel(vehicle))
		fuelSynced = true
	end
	if IsVehicleEngineOn(vehicle) then
		SetFuel(vehicle, GetVehicleFuelLevel(vehicle) - Config.FuelUsage[Round(GetVehicleCurrentRpm(vehicle), 1)] * (Config.Classes[GetVehicleClass(vehicle)] or 1.0) / 10)
		SetVehicleEngineOn(veh, true, true, true)
	else
		SetVehicleEngineOn(veh, true, true, true)
	end
end

-- ========================
-- Target / Interact setup
-- ========================

CreateThread(function()
    if Config.interact then
        exports.interact:AddGlobalVehicleInteraction({
            id = 'refuel_vehicle',
            offset = vec3(0.0, 0.0, 0.0),
            distance = 7.0,
            interactDst = 5.0,
            options = {
                {
                    canInteract = function()
                        return (inGasStation and hasNozzle) or HasPedGotWeapon(PlayerPedId(), 883325847) -- petrol can
                    end,
                    label = Lang:t('info.refuel_vehicle'),
                    action = function()
                        TriggerEvent('ps-fuel:client:SendMenuToServer')
                    end
                },
            }
        })

        for _, model in ipairs(props) do
            exports.interact:AddModelInteraction({
                model = model,
                offset = vec3(0.0, 0.0, 1.0),
                name = 'fuelInteraction',
                id = 'fuelPumpInteraction_' .. model,
                distance = 8.0,
                interactDst = 2.0,
                options = {
                    {
                        event = "ps-fuel:client:takenozzle",
                        label = Lang:t('info.take_nozzle'),
                        canInteract = function()
                            return not IsPedInAnyVehicle(PlayerPedId()) and not hasNozzle
                        end,
                    },
                    {
                        event = "ps-fuel:client:returnnozzle",
                        label = Lang:t('info.return_nozzle'),
                        canInteract = function()
                            return hasNozzle and not refueling
                        end,
                    },
                    {
                        event = "ps-fuel:client:buyCanMenu",
                        label = Lang:t('info.buy_jerry_can'),
                        canInteract = function()
                            return not HasPedGotWeapon(PlayerPedId(), 883325847)
                        end,
                    },
                    {
                        event = "ps-fuel:client:refuelCanMenu",
                        label = Lang:t('info.refuel_jerry_can'),
                        canInteract = function()
                            return GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_petrolcan")
                        end,
                    },
                },
            })
        end

    elseif Config.oxtarget then
        local options = {
            {
                name = 'cdn-fuel:options:1',
                icon = "fas fa-gas-pump",
                canInteract = function()
                    return (inGasStation and hasNozzle) or HasPedGotWeapon(PlayerPedId(), 883325847)
                end,
                label = Lang:t('info.refuel_vehicle'),
                onSelect = function()
                    TriggerEvent('ps-fuel:client:SendMenuToServer')
                end
            },
        }
        exports.ox_target:addGlobalVehicle(options)

        local modelOptions = {
            {
                name = "cdn-fuel:modelOptions:option_1",
                event = "ps-fuel:client:takenozzle",
                icon = "fas fa-gas-pump",
                label = Lang:t('info.take_nozzle'),
                canInteract = function()
                    return not IsPedInAnyVehicle(PlayerPedId()) and not hasNozzle
                end,
            },
            {
                name = "cdn-fuel:modelOptions:option_2",
                event = "ps-fuel:client:returnnozzle",
                icon = "fas fa-gas-pump",
                label = Lang:t('info.return_nozzle'),
                canInteract = function()
                    return hasNozzle and not refueling
                end,
            },
            {
                name = "cdn-fuel:modelOptions:option_3",
                event = "ps-fuel:client:buyCanMenu",
                icon = "fas fa-burn",
                label = Lang:t('info.buy_jerry_can'),
                canInteract = function()
                    return not HasPedGotWeapon(PlayerPedId(), 883325847)
                end,
            },
            {
                name = "cdn-fuel:modelOptions:option_4",
                event = "ps-fuel:client:refuelCanMenu",
                icon = "fas fa-gas-pump",
                label = Lang:t('info.refuel_jerry_can'),
                canInteract = function()
                    return GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("weapon_petrolcan")
                end,
            },
        }
        exports.ox_target:addModel(props, modelOptions)

    else
        -- print('[ps-fuel] No target system enabled. Set Config.interact = true for ex_interact or Config.oxtarget = true for ox_target.')
    end
end)

-- ========================
-- Engine leave running
-- ========================

if Config.LeaveEngineRunning then
    CreateThread(function()
        while true do
            Wait(100)
            local ped = PlayerPedId()
            if DoesEntityExist(ped) and IsPedInAnyVehicle(ped, false) and IsControlPressed(2, 75) and not IsEntityDead(ped) and not IsPauseMenuActive() then
                local engineWasRunning = GetIsVehicleEngineRunning(GetVehiclePedIsIn(ped, true))
                Wait(1000)
                if DoesEntityExist(ped) and not IsPedInAnyVehicle(ped, false) and not IsEntityDead(ped) and not IsPauseMenuActive() then
                    local vehicle = GetVehiclePedIsIn(ped, true)
                    if engineWasRunning then
                        SetVehicleEngineOn(vehicle, true, true, true)
                    end
                end
            end
        end
    end)
end

-- ========================
-- Blips
-- ========================

if Config.ShowNearestGasStationOnly then
    CreateThread(function()
        local currentGasBlip = 0
        while true do
            local coords = GetEntityCoords(PlayerPedId())
            local closest = 1000
            local closestCoords
            for _, gasStationCoords in pairs(Config.GasStationsBlips) do
                local dst = #(coords - gasStationCoords)
                if dst < closest then
                    closest = dst
                    closestCoords = gasStationCoords
                end
            end
            if DoesBlipExist(currentGasBlip) then
                RemoveBlip(currentGasBlip)
            end
            if closestCoords then
                currentGasBlip = CreateBlip(closestCoords)
            end
            Wait(10000)
        end
    end)
else
    CreateThread(function()
        for _, gasStationCoords in pairs(Config.GasStationsBlips) do
            CreateBlip(gasStationCoords)
        end
    end)
end

-- ========================
-- PolyZone gas station in/out
-- ========================

CreateThread(function()
    for k=1, #Config.GasStations do
        Stations[k] = PolyZone:Create(Config.GasStations[k].zones, {
            name="GasStation"..k,
            minZ = Config.GasStations[k].minz,
            maxZ = Config.GasStations[k].maxz,
            debugPoly = false
        })
        Stations[k]:onPlayerInOut(function(isPointInside)
            inGasStation = isPointInside or false
        end)
    end
end)

-- ========================
-- Fuel tick / blacklist
-- ========================

CreateThread(function()
	DecorRegister(Config.FuelDecor, 1)
	for index = 1, #Config.Blacklist do
		if type(Config.Blacklist[index]) == 'string' then
			Config.Blacklist[GetHashKey(Config.Blacklist[index])] = true
		else
			Config.Blacklist[Config.Blacklist[index]] = true
		end
	end
	for index = #Config.Blacklist, 1, -1 do
		Config.Blacklist[index] = nil
	end
	while true do
		Wait(1000)
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsIn(ped)
			if Config.Blacklist[GetEntityModel(vehicle)] then
				inBlacklisted = true
			else
				inBlacklisted = false
			end
			if not inBlacklisted and GetPedInVehicleSeat(vehicle, -1) == ped then
				ManageFuelUsage(vehicle)
			end
		else
			if fuelSynced then
				fuelSynced = false
			end
			if inBlacklisted then
				inBlacklisted = false
			end
		end
	end
end)

-- ========================
-- UI
-- ========================

RegisterNetEvent('ps-fuel:client:buyCanMenu', function()
    lib.registerContext({
        id = 'ps_fuel_buy_can',
        title = Lang:t('info.gas_station'),
        options = {
            {
                title = Lang:t('info.total_can_cost', { value = Config.canCost }),
                description = Lang:t('info.buy_jerry_can'),
                onSelect = function()
                    TriggerEvent("ps-fuel:client:ShowCanInput")
                end
            }
        }
    })
    lib.showContext('ps_fuel_buy_can')
end)

RegisterNetEvent('ps-fuel:client:ShowCanInput', function()
    local money = getPlayerMoney()
    local input = lib.inputDialog('Gas Station', {
        { type = 'select', label = 'Payment Method', options = {
            { value = 'bank', label = 'Card' },
            { value = 'cash', label = 'Cash' },
        }, required = true }
    })
    if not input then return end
    local method = input[1]
    if (money[method] or 0) >= Config.canCost then
        TriggerServerEvent('ps-fuel:server:BuyCan', method)
    else
        notify(Lang:t("notify.no_money"), 'error')
    end
end)

RegisterNetEvent('ps-fuel:client:refuelCanMenu', function()
    if not CurrentWeaponData or not next(CurrentWeaponData) then
        notify(Lang:t("notify.jerrycan_empty"), 'error')
        return
    end

    local fuelToAdd = tonumber(100 - (CurrentWeaponData.durability or 0)) or 0
    if fuelToAdd == 0 then
        notify(Lang:t("already_full"), 'error')
        return
    end

    local money = getPlayerMoney()
    local price = math.floor(fuelToAdd * (Config.fuelPrice or 1))
    local input = lib.inputDialog('Gas Station', {
        { type = 'select', label = 'Payment Method', options = {
            { value = 'bank', label = 'Card' },
            { value = 'cash', label = 'Cash' },
        }, required = true }
    })
    if not input then return end
    local method = input[1]

    if (money[method] or 0) >= Config.refuelCost then
        lib.registerContext({
            id = 'ps_fuel_refuel_can_confirm',
            title = Lang:t('info.gas_station'),
            options = {
                {
                    title = Lang:t("info.total_refuel_cost", { value = Config.refuelCost }),
                    onSelect = function()
                        TriggerEvent('ps-fuel:client:refuelCan', method)
                    end
                }
            }
        })
        lib.showContext('ps_fuel_refuel_can_confirm')
    else
        notify(Lang:t("notify.no_money"), 'error')
    end
end)

RegisterNetEvent('ps-fuel:client:refuelCan', function(paymentMethod)
    local ped = PlayerPedId()
    -- local vehicle = closestVehicle(6.0)
    -- if not vehicle then
    --     notify(Lang:t("notify.no_vehicle_nearby") or "No vehicle nearby.", 'error')
    --     return
    -- end

    if (CurrentWeaponData.name or '') == "WEAPON_PETROLCAN" then
        if (CurrentWeaponData.durability or 0) < 100 then
            playAnim("weapon@w_sp_jerrycan", "fire", 1)
            local ok = oxProgress(Lang:t("Refueling...") or "Refueling", 10000)
            if ok then
                TriggerServerEvent('ps-fuel:server:PayForFuel', Config.refuelCost, paymentMethod, GetPlayerServerId(PlayerId()))
                TriggerServerEvent('ps-fuel:server:UpdateDurability', CurrentWeaponData)
                SetPedAmmo(ped, GetHashKey('WEAPON_PETROLCAN'), 100)
                PlaySound(-1, "5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
            else
                notify(Lang:t("notify.refuel_cancel"), 'error')
            end
            StopAnimTask(ped, "weapon@w_sp_jerrycan", "fire", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
        else
            notify(Lang:t("notify.jerrycan_full"), 'error')
        end
    end
end)

AddEventHandler('ox_inventory:currentWeapon', function(weapon)
    if weapon and next(weapon) then
        CurrentWeaponData = weapon
        CurrentWeaponData.durability = weapon.metadata and weapon.metadata.durability or 0
    else
        CurrentWeaponData = {}
    end
end)

RegisterNetEvent('ps-fuel:client:ShowInput', function(refillCost)
    local ped = PlayerPedId()
    if not HasPedGotWeapon(ped, 883325847) then
        local input = lib.inputDialog('Gas Station', {
            { type = 'select', label = 'Payment Method', options = {
                { value = 'bank', label = 'Card' },
                { value = 'cash', label = 'Cash' },
            }, required = true }
        })
        if not input then return end
        local method = input[1]
        local money = getPlayerMoney()
        if (money[method] or 0) >= (refillCost or 0) then
            TriggerEvent('ps-fuel:client:RefuelVehicle', refillCost, method)
        else
            notify(Lang:t("notify.no_money"), 'error')
        end
    else
        TriggerEvent('ps-fuel:client:RefuelVehicle')
    end
end)

RegisterNetEvent('ps-fuel:client:SendMenuToServer', function()
    local vehicle = closestVehicle(6.0)
    if not vehicle then
        notify(Lang:t("notify.no_vehicle_nearby") or "No vehicle nearby.", 'error')
        return
    end

    local curFuel = GetVehicleFuelLevel(vehicle)
    local refillCost = Round((Config.RefillCost - curFuel), 0) * (Config.CostMultiplier or 1)

    if (CurrentWeaponData.name or '') == "WEAPON_PETROLCAN" then
        if (CurrentWeaponData.durability or 0) ~= 0 then
            if curFuel < 95 then
                TriggerServerEvent('ps-fuel:server:OpenMenu', 0, inGasStation, true)
            else
                notify(Lang:t("notify.vehicle_full"), 'error')
            end
        else
            notify(Lang:t("notify.jerrycan_empty"), 'error')
        end
    else
        if curFuel < 95 then
            TriggerServerEvent('ps-fuel:server:OpenMenu', refillCost, inGasStation, false)
        else
            notify(Lang:t("notify.vehicle_full"), 'error')
        end
    end
end)

RegisterNetEvent('ps-fuel:client:RefuelVehicle', function(refillCost, paymentMethod)
    local ped = PlayerPedId()
    local vehicle = closestVehicle(6.0)
    if not vehicle then
        notify(Lang:t("notify.no_vehicle_nearby") or "No vehicle nearby.", 'error')
        return
    end

    local curFuel = GetFuel(vehicle)
    local time = (100 - curFuel) * 400
    local vcoords = GetEntityCoords(vehicle)

    if HasPedGotWeapon(ped, 883325847, false) then
        local needed = math.max(0, 100 - curFuel)
        if needed <= 0 then
            notify(Lang:t('error.vehicle_already_full'), 'error')
            return
        end

        local durability = tonumber(CurrentWeaponData and CurrentWeaponData.durability) or 0
        if durability <= 0 then
            notify(Lang:t('error.no_fuel_gas_can'), 'error')
            return
        end

        local fuelPerDur = tonumber(Config.JerryCanFuelPerDurability) or 0.25
        local availableFuel = durability * fuelPerDur

        local cap = Config.JerryCanMaxFuelPerUse
        local maxPour = availableFuel
        if cap and tonumber(cap) then
            maxPour = math.min(maxPour, tonumber(cap))
        end

        local addAmount = math.min(needed, maxPour)

        if addAmount <= 0 then
            notify(Lang:t('error.no_fuel_gas_can'), 'error')
            return
        end

        local time = math.max(2000, math.floor(addAmount * 400)) 
        local vcoords = GetEntityCoords(vehicle)

        playAnim("weapon@w_sp_jerrycan", "fire", 1)

        if GetIsVehicleEngineRunning(vehicle) and Config.VehicleBlowUp then
            local Chance = math.random(1, 100)
            if Chance <= Config.BlowUpChance then
                AddExplosion(vcoords, 5, 50.0, true, false, true)
                return
            end
        end

        TriggerEvent("ps-fuel:client:fuelTick", vehicle) -- keep your ticking if used elsewhere
        local ok = oxProgress(Lang:t("Refueling...") or "Refueling", time)
        if ok then
            local newFuel = math.min(100, curFuel + addAmount)
            SetFuel(vehicle, newFuel)

            local durDrain = math.ceil(addAmount / fuelPerDur)
            local newDurability = math.max(0, durability - durDrain)

            TriggerServerEvent("ps-fuel:server:UpdateDurability", CurrentWeaponData, newDurability)
            PlaySound(-1, "5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
            isFueling = false
        else
            notify(Lang:t("notify.refuel_cancel"), 'error')
        end
        StopAnimTask(ped, "weapon@w_sp_jerrycan", "fire", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
        return
    end

    if not inGasStation then return end

    TaskTurnPedToFaceEntity(ped, vehicle, 5000)
    Wait(600)

    playAnim("amb@world_human_security_shine_torch@male@base", "base", 1)
    refueling = true

    if GetIsVehicleEngineRunning(vehicle) and Config.VehicleBlowUp then
        local Chance = math.random(1, 100)
        if Chance <= Config.BlowUpChance then
            Wait(1000)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "fuelstop", 0.3)
            AddExplosion(vcoords, 5, 50.0, true, false, true)
            if gasNozzle and DoesEntityExist(gasNozzle) then DeleteObject(gasNozzle) end
            gasNozzle = nil
            refueling = false
            hasNozzle = false
            return
        end
    end

    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "putbacknozzle", 0.6)
    Wait(500)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "fueling-sound", 0.5)

    local ok = oxProgress(Lang:t("Refueling...") or "Refueling", time)
    if ok then
        refueling = false
        TriggerServerEvent('ps-fuel:server:PayForFuel', refillCost or 0, paymentMethod or 'cash', GetPlayerServerId(PlayerId()))
        SetFuel(vehicle, 100)
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "fuelstop", 0.6)
        PlaySound(-1, "5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
    else
        refueling = false
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "fuelstop", 0.6)
        notify(Lang:t("notify.refuel_cancel"), 'error')
    end

    StopAnimTask(ped, "amb@world_human_security_shine_torch@male@base", 'base', 3.0, 3.0, -1, 2, 0, 0, 0, 0)
end)

-- ========================
-- Nozzle attach / detach
-- ========================

RegisterNetEvent('ps-fuel:client:takenozzle', function()
    if hasNozzle then return end
    local ped = PlayerPedId()

    RequestAnimDict("anim@am_hold_up@male")
    while not HasAnimDictLoaded("anim@am_hold_up@male") do Wait(0) end
    TaskPlayAnim(ped, "anim@am_hold_up@male", "shoplift_high", 2.0, 8.0, 1000, 50, 0, 0, 0, 0)
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "pickupnozzle", 0.6)

    local nozzleProp = `prop_cs_fuel_nozle`
    if QBCore and QBCore.Functions and QBCore.Functions.LoadModel then
        QBCore.Functions.LoadModel(nozzleProp)
    else
        RequestModel(nozzleProp)
        while not HasModelLoaded(nozzleProp) do Wait(0) end
    end

    gasNozzle = CreateObject(nozzleProp, 1.0, 1.0, 1.0, true, true, false)
    if not DoesEntityExist(gasNozzle) then return end
    hasNozzle = true

-- PASTE ONE SET BELOW YOUR ATTACH CALL (try 1 → 5 first)

-- 1) LEFT hand (60309) – handle grip (baseline)
-- local BONE = 60309
-- local ox, oy, oz = 0.08, 0.025, -0.015
-- local rx, ry, rz = 170.0, -80.0, -80.0

-- 3) LEFT hand – raise a bit + more yaw
-- local BONE = 60309
-- local ox, oy, oz = 0.08, 0.030, -0.012
-- local rx, ry, rz = 168.0, -78.0, -88.0

-- 4) LEFT hand – closer to thumb side
-- local BONE = 60309
-- local ox, oy, oz = 0.07, 0.035, -0.015
-- local rx, ry, rz = 180.0, -70.0, -95.0

-- 5) LEFT hand – tighter roll, small forward shift
-- local BONE = 60309
-- local ox, oy, oz = 0.10, 0.020, -0.018
-- local rx, ry, rz = 165.0, -90.0, -72.0

-- 6) LEFT hand – neutral roll, less yaw
-- local BONE = 60309
-- local ox, oy, oz = 0.09, 0.020, -0.010
-- local rx, ry, rz = 170.0, -70.0, -70.0

-- 7) RIGHT hand (57005) – handle grip (baseline)
-- local BONE = 57005
-- local ox, oy, oz = 0.11, 0.020, -0.020
-- local rx, ry, rz = 170.0, 80.0, 100.0

-- 8) RIGHT hand – slightly higher + more yaw
-- local BONE = 57005
-- local ox, oy, oz = 0.10, 0.025, -0.015
-- local rx, ry, rz = 175.0, 75.0, 110.0

-- 9) RIGHT hand – deeper grip
-- local BONE = 57005
-- local ox, oy, oz = 0.12, 0.030, -0.022
-- local rx, ry, rz = 168.0, 85.0, 95.0

-- 10) RIGHT hand – flatter roll
-- local BONE = 57005
-- local ox, oy, oz = 0.10, 0.018, -0.010
-- local rx, ry, rz = 182.0, 70.0, 105.0

-- 11) INDEX/PALM bone (18905) – your original
-- local BONE = 18905
-- local ox, oy, oz = 0.13, 0.04, 0.01
-- local rx, ry, rz = -42.0, -115.0, -63.42

-- 12) INDEX/PALM (18905) – swapped ends (rx+180)
local BONE = 18905
local ox, oy, oz = 0.12, 0.015, 0.015
local rx, ry, rz = -138.0, -115.0, -323.42

    AttachEntityToEntity(
        gasNozzle, ped, GetPedBoneIndex(ped, BONE),
        ox, oy, oz, rx, ry, rz,
        false, true, false, true, 1, true
    )
end)

RegisterNetEvent('ps-fuel:client:returnnozzle', function()
    if not hasNozzle then return end
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "putbacknozzle", 0.6)
    hasNozzle = false
    if gasNozzle and DoesEntityExist(gasNozzle) then
        DeleteObject(gasNozzle)
    end
    gasNozzle = nil
end)