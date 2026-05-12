lib.addKeybind({
    name = 'tackle',
    description = 'Tackle',
    defaultKey = 'E',
    onReleased = function(self)
        if cache.vehicle then return end
        if QBX.PlayerData.metadata.ishandcuffed then return end
        if IsPedSprinting(cache.ped) or IsPedRunning(cache.ped) then
            local coords = GetEntityCoords(cache.ped)
            local targetId, targetPed, _ = lib.getClosestPlayer(coords, 1.6, false)
            if not targetPed then return end
            if IsPedInAnyVehicle(targetPed, true) then return end
            self:disable(true)
            TriggerServerEvent('tackle:server:TacklePlayer', GetPlayerServerId(targetId))
            lib.requestAnimDict('swimming@first_person@diving')
            TaskPlayAnim(cache.ped, 'swimming@first_person@diving', 'dive_run_fwd_-45_loop', 3.0, 3.0, -1, 49, 0, false, false, false)
            Wait(250)
            ClearPedTasks(cache.ped)
            SetPedToRagdoll(cache.ped, 150, 150, 0, 0, 0, 0)
            RemoveAnimDict('swimming@first_person@diving')
            SetTimeout(1000, function ()
                self:disable(false)
            end)
        end
    end
})

RegisterNetEvent('tackle:client:GetTackled', function()
    SetPedToRagdoll(cache.ped, 3000, 3000, 0, 0, 0, 0)
end)

local animDict = "missminuteman_1ig_2"
local anim = "handsup_base"
local handsup = false

-- Controls to disable while hands are up
local disabledControls = {
    24,  -- Attack
    25,  -- Aim
    37,  -- Select Weapon
    44,  -- Cover
    140, -- Melee Light
    141, -- Melee Heavy
    142, -- Melee Alternate
    143, -- Melee Block
}

local function EnsureAnimDict(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(10)
        end
    end
end

local disabledControls = {
    24, 25,           -- attack / aim
    37,               -- weapon wheel
    44,               -- cover
    140, 141, 142, 143, -- melee
    257, 263, 264,    -- attack/aim alternate
    45,            -- reload
}

RegisterCommand('handsup', function()
    local ped = PlayerPedId()

    -- prevent if handcuffed
    if exports['qbx_police'] and exports['qbx_police']:IsHandcuffed() then return end

    handsup = not handsup
    if handsup then
        EnsureAnimDict(animDict)
        TaskPlayAnim(ped, animDict, anim, 8.0, 8.0, -1, 50, 0, false, false, false)

        -- disable controls
        CreateThread(function()
            while handsup do
                for i = 1, #disabledControls do
                    DisableControlAction(0, disabledControls[i], true)
                end
                if IsPedInAnyVehicle(ped, false) then
                    DisableControlAction(0, 59, true) -- disable A/D turning
                end
                Wait(0)
            end
        end)
    else
        ClearPedTasks(ped)
    end
end, false)

RegisterKeyMapping('handsup', 'Hands Up', 'keyboard', 'X')

exports('getHandsup', function() return handsup end)

    --Pointing

-- local mp_pointing = false

-- local function startPointing()
--     local ped = PlayerPedId()
--     if IsPedInAnyVehicle(ped, false) then return end
--     if GetIsTaskActive(ped, 3) then return end
--     RequestAnimDict('anim@mp_point')
--     while not HasAnimDictLoaded('anim@mp_point') do
--         Wait(0)
--     end

--     SetPedCurrentWeaponVisible(ped, false, true, true, true)
--     SetPedConfigFlag(ped, 36, true) 
--     TaskMoveNetworkByName(ped, 'task_mp_pointing', 0.5, false, 'anim@mp_point', 24)
--     RemoveAnimDict('anim@mp_point')

--     mp_pointing = true
-- end

-- local function stopPointing()
--     local ped = PlayerPedId()
--     if not mp_pointing then return end

--     RequestTaskMoveNetworkStateTransition(ped, 'Stop')
--     Wait(0)
--     ClearPedSecondaryTask(ped)

--     if not IsPedInAnyVehicle(ped, false) then
--         SetPedCurrentWeaponVisible(ped, true, true, true, true)
--     end

--     SetPedConfigFlag(ped, 36, false)
--     mp_pointing = false
-- end

-- local function pointingTick()
--     local ped = PlayerPedId()

--     while mp_pointing do
--         if IsPedInAnyVehicle(ped, false)
--             or IsPedRagdoll(ped)
--             or IsPedDeadOrDying(ped)
--             or IsPedSwimming(ped)
--             or IsPedFalling(ped)
--             or IsPedShooting(ped)
--         then
--             stopPointing()
--             break
--         end

--         local camPitch = GetGameplayCamRelativePitch()
--         if camPitch < -70.0 then camPitch = -70.0 end
--         if camPitch >  42.0 then camPitch =  42.0 end
--         camPitch = (camPitch + 70.0) / 112.0

--         local camHeadingDeg = GetGameplayCamRelativeHeading()
--         if camHeadingDeg < -180.0 then camHeadingDeg = -180.0 end
--         if camHeadingDeg >  180.0 then camHeadingDeg =  180.0 end

--         local headingRad = math.rad(camHeadingDeg)
--         local cosH = math.cos(headingRad)
--         local sinH = math.sin(headingRad)

--         local normalizedHeading = (camHeadingDeg + 180.0) / 360.0

--         local coords = GetOffsetFromEntityInWorldCoords(
--             ped,
--             (cosH * -0.2) - (sinH * (0.4 * normalizedHeading + 0.3)),
--             (sinH * -0.2) + (cosH * (0.4 * normalizedHeading + 0.3)),
--             0.6
--         )

--         local ray = StartShapeTestCapsule(
--             coords.x, coords.y, coords.z - 0.2,
--             coords.x, coords.y, coords.z + 0.2,
--             0.4, 95, ped, 7
--         )
--         local _, hit = GetShapeTestResult(ray)

--         SetTaskMoveNetworkSignalFloat(ped, 'Pitch',   camPitch)
--         SetTaskMoveNetworkSignalFloat(ped, 'Heading', normalizedHeading * -1.0 + 1.0)
--         SetTaskMoveNetworkSignalBool (ped, 'isBlocked', hit == 1)
--         SetTaskMoveNetworkSignalBool (ped, 'isFirstPerson', GetCamViewModeForContext(GetCamActiveViewModeContext()) == 4)

--         if IsControlJustPressed(0, 25) or (IsPedArmed(ped, 6) and IsPlayerFreeAiming(PlayerId())) then
--             stopPointing()
--             break
--         end

--         Wait(0)
--     end
-- end

-- RegisterCommand('point', function()
--     if mp_pointing then
--         stopPointing()
--     else
--         startPointing()
--         CreateThread(pointingTick)
--     end
-- end, false)

-- RegisterKeyMapping('point', 'Toggle Pointing', 'keyboard', 'b')

    -- Map in menu

local inMenuMode = false
local playingAnim = false
local playerProps = {}

local CFG = {
    animDict = "amb@world_human_tourist_map@male@idle_b",
    animName = "idle_d",
    propModel = "p_tourist_map_01_s",
    propBone = 28422,
    propOff  = vec3(0.0, 0.0, 0.0),
    propRot  = vec3(0.0, 0.0, 0.0),
    pollMs   = 200,
    respectOxInv = true,
}

local featureEnabled = true
local oxInvOpen = false

local hasBabloPause = GetResourceState('bablo-pausemenu') == 'started'
local bablo = hasBabloPause and exports['bablo-pausemenu'] or nil

local function isAnyPauseOpen()
    local nativeOpen = IsPauseMenuActive()
    local babloOpen = false

    if bablo and bablo.isOpen then
        local ok, res = pcall(bablo.isOpen)
        if ok and type(res) == 'boolean' then
            babloOpen = res
        end
    end

    return nativeOpen or babloOpen
end

local function loadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return true end
    RequestAnimDict(dict)
    local t = GetGameTimer()
    while not HasAnimDictLoaded(dict) do
        Wait(0)
        if GetGameTimer() - t > 5000 then return false end
    end
    return true
end

local function loadModel(model)
    local hash = type(model) == 'number' and model or joaat(model)
    if HasModelLoaded(hash) then return true, hash end
    RequestModel(hash)
    local t = GetGameTimer()
    while not HasModelLoaded(hash) do
        Wait(0)
        if GetGameTimer() - t > 5000 then return false end
    end
    return true, hash
end

local function attachPropToPlayer(model, bone, off, rot)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    local ok, hash = loadModel(model)
    if not ok then return end

    local obj = CreateObject(hash, coords.x, coords.y, coords.z + 0.2, true, true, true)
    SetEntityCollision(obj, false, true)
    AttachEntityToEntity(
        obj, ped, GetPedBoneIndex(ped, bone),
        off.x or 0.0, off.y or 0.0, off.z or 0.0,
        rot.x or 0.0, rot.y or 0.0, rot.z or 0.0,
        true, true, false, true, 1, true
    )
    table.insert(playerProps, obj)
    SetModelAsNoLongerNeeded(hash)
end

local function destroyAllProps()
    for i = #playerProps, 1, -1 do
        local ent = playerProps[i]
        if DoesEntityExist(ent) then
            SetEntityAsMissionEntity(ent, true, true)
            DeleteEntity(ent)
        end
        playerProps[i] = nil
    end
end

local function stopOurAnim(ped, dict, name)
    if dict and name then
        StopAnimTask(ped, dict, name, 1.0)
    end
    ClearPedSecondaryTask(ped)
end

local function canPlayAnim(ped)
    return not IsPedInAnyVehicle(ped, true)
        and not IsPedGettingIntoAVehicle(ped)
        and not IsPedJumping(ped)
        and not IsPedSwimming(ped)
        and not IsPedDiving(ped)
        and not IsPedJacking(ped)
        and not IsPedRagdoll(ped)
        and not IsPedReloading(ped)
        and not IsPedShooting(ped)
        and not IsAimCamActive()
        and not IsEntityDead(ped)
end

local function startPauseAnim()
    if playingAnim then return end
    local ped = PlayerPedId()
    if not canPlayAnim(ped) then return end
    if not loadAnimDict(CFG.animDict) then return end

    attachPropToPlayer(CFG.propModel, CFG.propBone, CFG.propOff, CFG.propRot)

    TaskPlayAnim(ped, CFG.animDict, CFG.animName, 2.0, 2.0, -1, 49, 0.0, false, false, false)
    playingAnim = true
end

local function stopPauseAnim()
    if not playingAnim then return end
    local ped = PlayerPedId()
    stopOurAnim(ped, CFG.animDict, CFG.animName)
    destroyAllProps()
    playingAnim = false
end

RegisterNetEvent('ox_inventory:openInventory', function()
    if not CFG.respectOxInv then return end
    oxInvOpen = true
    stopPauseAnim()
end)

RegisterNetEvent('ox_inventory:closeInventory', function()
    if not CFG.respectOxInv then return end
    oxInvOpen = false
end)

CreateThread(function()
    local wasOpen = false

    while true do
        Wait(CFG.pollMs)

        if not featureEnabled then
            if playingAnim then stopPauseAnim() end
            wasOpen = false
            goto continue
        end

        if CFG.respectOxInv and oxInvOpen then
            if playingAnim then stopPauseAnim() end
            wasOpen = false
            goto continue
        end

        local escOpen = isAnyPauseOpen()

        if escOpen and not wasOpen then
            inMenuMode = true
            startPauseAnim()
        elseif (not escOpen and wasOpen) or (inMenuMode and not canPlayAnim(PlayerPedId())) then
            inMenuMode = false
            stopPauseAnim()
        end

        wasOpen = escOpen
        ::continue::
    end
end)

AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() then return end
    stopPauseAnim()
end)

-- Bablo NO OPEN WHEN CLOSE INVENTORY

local PauseMenu = exports["bablo-pausemenu"]
local disabledByInventory = false

local function setPauseDisabled(state)
    if state then
        if not PauseMenu:isDisabled() then
            PauseMenu:disableMenu(true)
            disabledByInventory = true
        end
    else
        if disabledByInventory and PauseMenu:isDisabled() then
            PauseMenu:disableMenu(false)
        end
        disabledByInventory = false
    end
end

AddStateBagChangeHandler('invOpen', nil, function(bagName, _key, value, _reserved, _replicated)
    if bagName == ('player:%s'):format(cache.serverId) then
        setPauseDisabled(value == true)
    end
end)

CreateThread(function()
    local isOpen = LocalPlayer and LocalPlayer.state and LocalPlayer.state.invOpen
    setPauseDisabled(isOpen == true)
end)
