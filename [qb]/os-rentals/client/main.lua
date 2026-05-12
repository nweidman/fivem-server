-- client.lua
-- deps: qbx_core, ox_lib, ox_target
-- keep your existing server handlers: qb-rental:rentalpapers / qb-rental:removepapers

local SpawnVehicle = false
local rentalVeh = nil

local function notify(msg, typ)
    exports.qbx_core:Notify(msg, typ or 'inform')
end

local function openRentalMenu()
    lib.registerContext({
        id = 'rental_menu',
        title = 'Rental Vehicles',
        options = {
            {
                title = 'Return Vehicle',
                description = 'Return your rented vehicle.',
                event = 'qb-rental:return'
            },
            {
                title = 'Asterope',
                description = '$1000.00',
                event = 'qb-rental:spawncar',
                args = { model = 'asterope', money = 1000 }
            },
            {
                title = 'Bison',
                description = '$1000.00',
                event = 'qb-rental:spawncar',
                args = { model = 'bison', money = 1000 }
            },
            {
                title = 'Glendale',
                description = '$1000.00',
                event = 'qb-rental:spawncar',
                args = { model = 'glendale', money = 1000 }
            },
            {
                title = 'Futo',
                description = '$1000.00',
                event = 'qb-rental:spawncar',
                args = { model = 'futo', money = 1000 }
            },
            {
                title = 'Sultan',
                description = '$1000.00',
                event = 'qb-rental:spawncar',
                args = { model = 'sultan', money = 1000 }
            },
        }
    })
    lib.showContext('rental_menu')
end

local function openBoatMenu()
    lib.registerContext({
        id = 'boat_rental_menu',
        title = 'Boat Rental Vehicles',
        options = {
            {
                title = 'Return Vehicle',
                description = 'Return your rented vehicle.',
                event = 'qb-rental:return'
            },
            {
                title = 'Jetski',
                description = '$1250.00',
                event = 'qb-rental:spawnboat',
                args = { model = 'seashark', money = 1250 }
            },
            {
                title = 'Jetmax',
                description = '$1750.00',
                event = 'qb-rental:spawnboat',
                args = { model = 'jetmax', money = 1750 }
            },
            {
                title = 'Dinghy',
                description = '$2500.00',
                event = 'qb-rental:spawnboat',
                args = { model = 'dinghy', money = 2500 }
            },
        }
    })
    lib.showContext('boat_rental_menu')
end

RegisterNetEvent('qb-rental:openMenu', openRentalMenu)
RegisterNetEvent('qb-rental:openBoatMenu', openBoatMenu)

----------------------------------------------------------------
-- NPC + Targets (ox_target)
----------------------------------------------------------------
local function createNpc(model, coords, heading, targetOpts)
    local hash = joaat(model)
    lib.requestModel(hash)

    local ped = CreatePed(5, hash, coords.x, coords.y, coords.z, heading, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
    SetEntityAsMissionEntity(ped, true, true)

    exports.ox_target:addLocalEntity(ped, {
        {
            name = targetOpts.name,
            icon = targetOpts.icon,
            label = targetOpts.label,
            distance = 3.0,
            onSelect = targetOpts.onSelect
        }
    })

    return ped
end

CreateThread(function()
    -- Car rental NPC
    createNpc(
        'a_m_y_business_03',
        vec3(240.55, -813.96, 29.39),
        72.57,
        {
            name = 'rental_vehicle_npc',
            icon = 'fa-solid fa-car',
            label = 'Rent Vehicle',
            onSelect = function() TriggerEvent('qb-rental:openMenu') end
        }
    )

    -- Boat rental NPC
    createNpc(
        'a_m_y_business_03',
        vec3(-1269.77, -1917.40, 4.86),
        315.94,
        {
            name = 'rental_boat_npc',
            icon = 'fa-solid fa-ship',
            label = 'Rent Boat',
            onSelect = function() TriggerEvent('qb-rental:openBoatMenu') end
        }
    )
end)

----------------------------------------------------------------
-- Vehicle spawning helpers (standalone natives)
----------------------------------------------------------------
local function spawnVehicleAt(model, where, heading)
    local hash = joaat(model)
    lib.requestModel(hash)

    local veh = CreateVehicle(hash, where.x, where.y, where.z, heading, true, false)
    SetEntityAsMissionEntity(veh, true, true)
    SetVehicleOnGroundProperly(veh)
    SetVehicleDirtLevel(veh, 0.0)

    -- fun plate
    SetVehicleNumberPlateText(veh, ('RENT%03d'):format(math.random(0, 999)))

    return veh
end

----------------------------------------------------------------
-- Spawn Car
----------------------------------------------------------------
RegisterNetEvent('qb-rental:spawncar', function(data)
    local money = data.money
    local model = data.model
    local ped = cache.ped or PlayerPedId()
    local Player = exports.qbx_core:GetPlayerData()
    if Player.money.bank < money then return exports.qbx_core:Notify('You do not have enough money in the bank!', 'error') end
    local veh = spawnVehicleAt(model, vec3(237.25, -809.42, 29.71), 69.87)
    TaskWarpPedIntoVehicle(ped, veh, -1)
    SetVehicleEngineOn(veh, true, true, false)

    rentalVeh = veh
    SpawnVehicle = true

    Wait(500)

    local vehicleLabel = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(veh)))
    local plate = GetVehicleNumberPlateText(veh)

    -- your keys system
    TriggerEvent('vehiclekeys:client:SetOwner', plate)

    -- your server-side billing/papers
    TriggerServerEvent('qb-rental:rentalpapers', plate, vehicleLabel, money)
end)

----------------------------------------------------------------
-- Spawn Boat
----------------------------------------------------------------
RegisterNetEvent('qb-rental:spawnboat', function(data)
    local money = data.money
    local model = data.model
    local ped = cache.ped or PlayerPedId()
    local Player = exports.qbx_core:GetPlayerData()
    if Player.money.bank < money then return exports.qbx_core:Notify('You do not have enough money in the bank!', 'error') end
    local veh = spawnVehicleAt(model, vec3(-1290.17, -1899.25, 1.34), 105.39)
    TaskWarpPedIntoVehicle(ped, veh, -1)
    SetVehicleEngineOn(veh, true, true, false)

    rentalVeh = veh
    SpawnVehicle = true

    Wait(500)

    local vehicleLabel = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(veh)))
    local plate = GetVehicleNumberPlateText(veh)

    TriggerEvent('vehiclekeys:client:SetOwner', plate)
    TriggerServerEvent('qb-rental:rentalpapers', plate, vehicleLabel, money)
end)

----------------------------------------------------------------
-- Return Vehicle
----------------------------------------------------------------
RegisterNetEvent('qb-rental:return', function()
    if not SpawnVehicle then
        notify('No vehicle to return.', 'error')
        return
    end

    notify('Returned vehicle!', 'success')
    TriggerServerEvent('qb-rental:removepapers')

    local veh = rentalVeh
    if veh and DoesEntityExist(veh) then
        NetworkFadeOutEntity(veh, true, false)
        Wait(800)
        SetEntityAsMissionEntity(veh, true, true)
        DeleteVehicle(veh)
    else
        -- fallback: try player’s current
        local alt = GetVehiclePedIsIn(PlayerPedId(), false)
        if alt ~= 0 then
            NetworkFadeOutEntity(alt, true, false)
            Wait(800)
            SetEntityAsMissionEntity(alt, true, true)
            DeleteVehicle(alt)
        end
    end

    rentalVeh = nil
    SpawnVehicle = false
end)

----------------------------------------------------------------
-- Blips
----------------------------------------------------------------
CreateThread(function()
    local blip = AddBlipForCoord(240.55, -813.96, 29.39)
    SetBlipSprite(blip, 56)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.6)
    SetBlipColour(blip, 24)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString('Vehicle Rental')
    EndTextCommandSetBlipName(blip)

    local blip2 = AddBlipForCoord(-1269.77, -1917.4, 4.86)
    SetBlipSprite(blip2, 427)
    SetBlipDisplay(blip2, 4)
    SetBlipScale(blip2, 0.5)
    SetBlipColour(blip2, 24)
    SetBlipAsShortRange(blip2, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString('Boat Rental')
    EndTextCommandSetBlipName(blip2)
end)
