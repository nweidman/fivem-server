local copsCalled = false
local banktruck = `stockade`
local lastExplosiveTime = 0
local EXPLOSIVE_COOLDOWN = 30 * 60 * 1000 -- 15 minutes (set to 15 * 60 * 1000 if you want)

-- =========================
-- Framework wrappers (QBX)
-- =========================
local function notify(msg, ntype, duration)
    if lib and lib.notify then
        lib.notify({
            title = 'Bank Trucks',
            description = msg,
            type = ntype or 'inform',
            duration = duration or 5000
        })
        return
    end
    -- fallback
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandThefeedPostTicker(false, duration or 5000)
end

local function progress(label, duration, anim)
    if lib and lib.progressCircle then
        return lib.progressCircle({
            duration = duration,
            label = label,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
                car = true,
                combat = true,
                mouse = false
            },
            anim = anim
        })
    end

    -- fallback: simple wait
    local start = GetGameTimer()
    while (GetGameTimer() - start) < duration do
        Wait(0)
        if IsControlJustPressed(0, 202) then -- ESC / B
            return false
        end
    end
    return true
end

--- Method to send an alert to cops and set a 5 minute cooldown for alerting cops
local function AlertCops()
    if copsCalled then return end
    copsCalled = true

    if GetResourceState('cd_dispatch') == 'started' then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = { 'police', 'sheriff' },
            coords = data.coords,
            title = 'Bank Truck Robbery',
            message = 'A ' .. data.sex .. ' robbing a bank truck at ' .. data.street,
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 67,
                scale = 1.2,
                colour = 1,
                flashes = false,
                text = 'Bank Truck robbery',
                time = 5,
                radius = 0,
            }
        })
    end

    CreateThread(function()
        Wait(5 * 60 * 1000)
        copsCalled = false
    end)
end

--- Method to spawn guards inside the truck and set it lootable
local function robTruck(veh, method)
    local pedmodel = `ig_casey`
    RequestModel(pedmodel)
    while not HasModelLoaded(pedmodel) do Wait(0) end

    local guard1 = CreatePedInsideVehicle(veh, 4, pedmodel, 1, true, 0.0)
    local guard2 = CreatePedInsideVehicle(veh, 4, pedmodel, 2, true, 0.0)

    GiveWeaponToPed(guard1, `WEAPON_SMG`, 420, false, true)
    GiveWeaponToPed(guard2, `WEAPON_SMG`, 420, false, true)

    SetPedMaxHealth(guard1, 350)
    SetPedMaxHealth(guard2, 350)
    SetPedDropsWeaponsWhenDead(guard1, false)
    SetPedDropsWeaponsWhenDead(guard2, false)

    SetPedRelationshipGroupDefaultHash(guard1, `COP`)
    SetPedRelationshipGroupDefaultHash(guard2, `COP`)
    SetPedRelationshipGroupHash(guard1, `COP`)
    SetPedRelationshipGroupHash(guard2, `COP`)
    SetPedAsCop(guard1, true)
    SetPedAsCop(guard2, true)
    SetCanAttackFriendly(guard1, false, true)
    SetCanAttackFriendly(guard2, false, true)

    TaskCombatPed(guard1, PlayerPedId(), 0, 16)
    TaskCombatPed(guard2, PlayerPedId(), 0, 16)

    if method == "explosive" or method == "thermite" then
        TriggerServerEvent('qb-banktrucks:server:RemoveDoors', NetworkGetNetworkIdFromEntity(veh))
    elseif method == "card" then
        SetVehicleDoorOpen(veh, 2, false, false)
        SetVehicleDoorOpen(veh, 3, false, false)
    end

    local plate = GetVehicleNumberPlateText(veh)
    TriggerServerEvent('qb-banktrucks:server:UpdatePlates', plate)
end

-- =========================
-- Explosive beep countdown
-- =========================
local function playBombBeep(veh)
    if veh and DoesEntityExist(veh) then
        -- 3D-ish beep attached to the vehicle
        PlaySoundFromEntity(-1, "Beep_Red", veh, "DLC_HEIST_HACKING_SNAKE_SOUNDS", false, 0)
    else
        -- fallback UI beep
        PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", true)
    end
end

local function beepCountdown(veh, totalMs)
    totalMs = totalMs or 5000
    if not Config.BeepEnabled then
        Wait(totalMs)
        return
    end

    local beepWindow = Config.BeepStartMs or totalMs
    beepWindow = math.min(beepWindow, totalMs)

    local preWait = totalMs - beepWindow
    if preWait > 0 then
        Wait(preWait)
    end

    local intervalStart = Config.BeepIntervalStart or 600
    local intervalEnd = Config.BeepIntervalEnd or 120

    local elapsed = 0
    while elapsed < beepWindow do
        local t = elapsed / beepWindow
        local interval = math.floor(intervalStart + (intervalEnd - intervalStart) * t)
        interval = math.max(60, interval)

        playBombBeep(veh)
        Wait(interval)
        elapsed = elapsed + interval
    end
end

-- =========================
-- Shared: actually place explosive + boom (used by explosive + thermite success)
-- =========================
local function placeExplosiveAndBoom(veh)
    -- Consume explosive when we ACTUALLY place it
    TriggerServerEvent("qb-banktrucks:server:removeExplosive")

    -- Plant prop
    local coords = GetEntityCoords(veh)
    local bomb = CreateObject(`prop_c4_final_green`, coords.x, coords.y, coords.z + 0.2, true, true, false)
    local bone = GetEntityBoneIndexByName(veh, 'door_dside_r')
    if bone == -1 then bone = 0 end

    AttachEntityToEntity(bomb, veh, bone, 0.75, 0.0, -0.35, 0.0, 0.0, 0.0, true, true, false, true, 1, true)

    -- Sync beeping for nearby players
    local delay = Config.ExplosionDelay or 5000
    local vcoords = GetEntityCoords(veh)
    TriggerServerEvent("qb-banktrucks:server:syncBeep", VehToNet(veh), vcoords, delay)
    Wait(delay)

    local boomAt = GetOffsetFromEntityInWorldCoords(veh, 0.0, -2.5, 0.3)
    AddExplosion(boomAt.x, boomAt.y, boomAt.z, 2, 6.0, true, false, 1.0)

    if DoesEntityExist(bomb) then DeleteEntity(bomb) end
end

-- =========================
-- Explosive method (original)
-- =========================
local function explosiveTruck(veh)
    local currentTime = GetGameTimer()
    if (currentTime - lastExplosiveTime) < EXPLOSIVE_COOLDOWN then
        local timeLeft = EXPLOSIVE_COOLDOWN - (currentTime - lastExplosiveTime)
        local minutesLeft = math.ceil(timeLeft / 60000)
        notify(("You must wait %d more minute(s) before attempting this again."):format(minutesLeft), "error", 5000)
        return
    end

    local cops = lib.callback.await('qb-banktrucks:server:getCops', false)
    local plate = GetVehicleNumberPlateText(veh)

    if Config.RobbedPlates[plate] then
        notify('This truck has recently been robbed', "error", 2000)
        return
    end

    if cops < Config.MinCops then
        notify('Not enough cops', "error", 2000)
        return
    end

    SetEntityAsMissionEntity(veh, true, true)

    AlertCops()

    -- Require explosive item (configurable)
    local hasExplosive = lib.callback.await('qb-banktrucks:server:hasExplosive', false)
    if not hasExplosive then
        notify(('You need %s.'):format(Config.ExplosiveItem or 'c4'), 'error', 3500)
        return
    end

    local ok = progress("Planting explosive..", 4500, {
        dict = "anim@heists@ornate_bank@thermal_charge",
        clip = "thermal_charge",
        flag = 49
    })

    if not ok then
        notify("Canceled..", "error", 2000)
        return
    end

    lastExplosiveTime = currentTime

    placeExplosiveAndBoom(veh)

    -- Break doors + spawn guards + flag robbed
    robTruck(veh, "explosive")
end

-- =========================
-- Thermite Door -> Minigame -> ONLY THEN place explosive (what you asked)
-- =========================
local function thermiteTruck(veh)
    local currentTime = GetGameTimer()
    if (currentTime - lastExplosiveTime) < EXPLOSIVE_COOLDOWN then
        local timeLeft = EXPLOSIVE_COOLDOWN - (currentTime - lastExplosiveTime)
        local minutesLeft = math.ceil(timeLeft / 60000)
        notify(("You must wait %d more minute(s) before attempting this again."):format(minutesLeft), "error", 5000)
        return
    end

    local cops = lib.callback.await('qb-banktrucks:server:getCops', false)
    local plate = GetVehicleNumberPlateText(veh)

    if Config.RobbedPlates[plate] then
        notify('This truck has recently been robbed', "error", 2000)
        return
    end

    if cops < Config.MinCops then
        notify('Not enough cops', "error", 2000)
        return
    end

    SetEntityAsMissionEntity(veh, true, true)
    AlertCops()

    -- Must have explosive item BEFORE attempting minigame
    local hasExplosive = lib.callback.await('qb-banktrucks:server:hasExplosive', false)
    if not hasExplosive then
        notify(('You need %s.'):format(Config.ExplosiveItem or 'c4'), 'error', 3500)
        return
    end

    local ok = progress("Preparing thermite..", 4500, {
        dict = "anim@heists@ornate_bank@thermal_charge",
        clip = "thermal_charge",
        flag = 49
    })

    if not ok then
        notify("Canceled..", "error", 2000)
        return
    end

    -- Start thermite minigame
    exports["memorygame"]:thermiteminigame(10, 3, 3, 10,
        function() -- success
            -- Only now we place/consume explosive
            lastExplosiveTime = currentTime
            placeExplosiveAndBoom(veh)
            robTruck(veh, "thermite") -- opens doors + spawns guards + flags robbed
        end,
        function() -- failure
            notify("Thermite failed.", "error", 2500)
        end
    )
end

--- Method to rob a specific banktruck with a black security card
local function useCard(veh)
    local cops = lib.callback.await('qb-banktrucks:server:getCops', false)
    local plate = GetVehicleNumberPlateText(veh)

    if Config.RobbedPlates[plate] then
        notify('This truck has recently been robbed', "error", 2000)
        return
    end

    if cops < Config.MinCops then
        notify('Not enough cops', "error", 2000)
        return
    end

    SetEntityAsMissionEntity(veh, true, true)

    AlertCops()

    local ok = progress("Unlocking Door", 9000, {
        dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        clip = "machinic_loop_mechandplayer",
        flag = 49
    })

    if not ok then
        notify("Canceled..", "error", 2000)
        return
    end

    robTruck(veh, "card")
    TriggerServerEvent("qb-banktrucks:server:removeCard")
end

--- Method to loot a specific banktruck and receive a reward
local function lootTruck(veh)
    local plate = GetVehicleNumberPlateText(veh)
    if Config.LootedTrucks[plate] then return end

    local ok = progress("Looting banktruck..", math.random(11000, 15000), {
        dict = "mini@repair",
        clip = "fixing_a_player",
        flag = 49
    })

    if not ok then
        notify("Canceled..", "error", 2000)
        return
    end

    local netId = NetworkGetNetworkIdFromEntity(veh)
    TriggerServerEvent('qb-banktrucks:server:receiveItem', netId)
end

-- Synced beep start (server broadcast)
RegisterNetEvent('qb-banktrucks:client:syncBeep', function(truckNetId, coords, delay)
    if not Config.BeepEnabled then return end
    if not coords then return end

    local myCoords = GetEntityCoords(PlayerPedId())
    local range = Config.BeepRange or 60.0
    if #(myCoords - vec3(coords.x, coords.y, coords.z)) > range then return end

    local veh = NetToVeh(truckNetId)
    if veh ~= 0 and DoesEntityExist(veh) then
        beepCountdown(veh, delay)
    else
        beepCountdown(nil, delay)
    end
end)

-- =========================
-- Net events
-- =========================

RegisterNetEvent('qb-banktrucks:client:RemoveDoors', function(truckNetId)
    local truck = NetworkGetEntityFromNetworkId(truckNetId)
    if truck and DoesEntityExist(truck) then
        SetVehicleDoorBroken(truck, 2, false)
        SetVehicleDoorBroken(truck, 3, false)
    end
end)

RegisterNetEvent('qb-banktrucks:client:UpdatePlates', function(plate)
    Config.RobbedPlates[plate] = true
end)

RegisterNetEvent('qb-banktrucks:client:UpdateLooted', function(plate)
    Config.LootedTrucks[plate] = true
end)

-- =========================
-- Initial config sync
-- =========================
CreateThread(function()
    -- wait until player is in-game and ox_lib is ready
    while not NetworkIsPlayerActive(PlayerId()) do Wait(250) end
    Wait(1500)

    local robbed, looted = lib.callback.await('qb-banktrucks:server:getConfig', false)
    Config.RobbedPlates = robbed or {}
    Config.LootedTrucks = looted or {}
end)

-- =========================
-- ox_target interactions
-- =========================
CreateThread(function()
    exports.ox_target:addModel({ banktruck }, {
        {
            name = 'banktrucks_thermite',
            icon = 'fa-solid fa-fire',
            label = 'Plant Explosive',
            items = { Config.ExplosiveItem or 'c4' },
            distance = 2.5,
            onSelect = function(data)
                thermiteTruck(data.entity)
            end,
            canInteract = function(entity, distance, coords, name)
                if Config.RobbedPlates[GetVehicleNumberPlateText(entity)] then return false end
                return #(GetEntityCoords(PlayerPedId()) - GetOffsetFromEntityInWorldCoords(entity, 0.0, -4.0, 0.0)) < 1.0
            end,
        },
        {
            name = 'banktrucks_loot',
            icon = 'fa-solid fa-coins',
            label = 'Loot Truck',
            distance = 2.5,
            onSelect = function(data)
                lootTruck(data.entity)
            end,
            canInteract = function(entity, distance, coords, name)
                local plate = GetVehicleNumberPlateText(entity)
                if Config.LootedTrucks[plate] or not Config.RobbedPlates[plate] then return false end
                return #(GetEntityCoords(PlayerPedId()) - GetOffsetFromEntityInWorldCoords(entity, 0.0, -4.0, 0.0)) < 1.0
            end,
        },
    })
end)
