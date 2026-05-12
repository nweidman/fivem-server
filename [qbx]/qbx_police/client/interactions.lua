local config = require 'config.client'
local isEscorting = false
local cuffType = 1

exports('IsHandcuffed', function()
    return QBX.PlayerData.metadata.ishandcuffed
end)

local function isTargetDead(playerId)
    return lib.callback.await('police:server:isPlayerDead', false, playerId)
end

local function IsCopDead(targetServerId)
    -- returns true/false (nil -> false)
    return lib.callback.await('police:isCopDead', false, targetServerId) or false
end

-- Pose constants
local CUFF_IDLE_DICT, CUFF_IDLE_CLIP = 'mp_arresting', 'idle'
local CUFF_MOVE_CLIPSET = 'move_m@prisoner_cuffed'  -- works for both M/F

local function ensureDict(dict)
    if HasAnimDictLoaded(dict) then return end
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) end
end

local function ensureMoveClipset()
    if HasAnimSetLoaded(CUFF_MOVE_CLIPSET) then return end
    RequestAnimSet(CUFF_MOVE_CLIPSET)
    while not HasAnimSetLoaded(CUFF_MOVE_CLIPSET) do Wait(0) end
end

-- Apply the behind-back pose + movement style (non-freezing)
local function applyCuffPose(ped, flag)
    ped = ped or (cache and cache.ped) or PlayerPedId()
    ensureDict(CUFF_IDLE_DICT)
    TaskPlayAnim(ped, CUFF_IDLE_DICT, CUFF_IDLE_CLIP, 8.0, -8.0, -1, flag or (cuffType or 49), 0, false, false, false)
    ensureMoveClipset()
    SetPedMovementClipset(ped, CUFF_MOVE_CLIPSET, 0.25)
    -- keep native handcuff flag on so other scripts behave
    SetEnableHandcuffs(ped, true)
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
end

-- Clear the pose on uncuff (you already call most of this; safe to call twice)
local function clearCuffPose(ped)
    ped = ped or (cache and cache.ped) or PlayerPedId()
    StopAnimTask(ped, CUFF_IDLE_DICT, CUFF_IDLE_CLIP, 1.0)
    ResetPedMovementClipset(ped, 0.0)
    ResetPedStrafeClipset(ped)
    ResetPedWeaponMovementClipset(ped)
    RemoveAnimDict(CUFF_IDLE_DICT)
end

-- Keeps hands-behind-back while cuffed. Lets ragdoll/death happen,
-- then restores the pose when alive again.
CreateThread(function()
    while true do
        if isHandcuffed then
            local ped = (cache and cache.ped) or PlayerPedId()

            -- If not dead/downed and not in vehicle/ladder, enforce pose
            local alive = not IsEntityDead(ped)
            local inVeh = IsPedInAnyVehicle(ped, false)
            local onLadder = IsPedOnFoot(ped) and IsPedClimbing(ped)

            if alive and not inVeh and not onLadder then
                -- If the anim got knocked off, reapply
                if not IsEntityPlayingAnim(ped, CUFF_IDLE_DICT, CUFF_IDLE_CLIP, 3) then
                    applyCuffPose(ped, cuffType or 49)
                end
                -- Ensure clipset stays loaded/applied
                ensureMoveClipset()
                SetPedMovementClipset(ped, CUFF_MOVE_CLIPSET, 0.25)
                SetEnableHandcuffs(ped, true)
            else
                -- In vehicle / climbing / ragdoll: don't fight it, but keep native flag on
                SetEnableHandcuffs(ped, true)
                -- remove idle so it doesn't clash with ragdoll/vehicle seats
                StopAnimTask(ped, CUFF_IDLE_DICT, CUFF_IDLE_CLIP, 0.5)
            end
        end
        Wait(400)
    end
end)

-- Helper: detect dead / downed / last stand (qbx, statebag, natives)
local function IsDownOrDead(ped)
    ped = ped or (cache and cache.ped) or PlayerPedId()
    if IsEntityDead(ped) then return true end

    -- statebag flags various scripts use
    local st = LocalPlayer and LocalPlayer.state
    if st and (st.isDead or st.dead or st.isDowned or st.downed or st.inLaststand or st.isInLaststand) then
        return true
    end

    -- qbx metadata (covers common key variants)
    local pd = exports.qbx_core:GetPlayerData()
    local m = (pd and pd.metadata) or {}
    if m.isdead or m.isDead or m.inlaststand or m.inLaststand or m.isInLaststand or m.isdowned or m.isDowned then
        return true
    end

    return false
end

-- === COP-SIDE HANDCUFF ANIMATION (non-freezing) ===
function handCuffAnimation(targetServerId)
    local cop = (cache and cache.ped) or PlayerPedId()

    -- face the target if streamed in (optional)
    local targetPed = 0
    if targetServerId then
        local p = GetPlayerFromServerId(targetServerId)
        if p ~= -1 then targetPed = GetPlayerPed(p) end
    end

    lib.requestAnimDict('mp_arrest_paired')

    if targetPed ~= 0 then
        TaskTurnPedToFaceEntity(cop, targetPed, 500)
        Wait(500)
    end

    -- play the cop side of the paired anim; 48 = upper body + loop (non-root)
    TaskPlayAnim(cop, 'mp_arrest_paired', 'cop_p2_back_right', 3.0, 3.0, 3500, 48, 0, false, false, false)
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'Cuff', 0.2)
    Wait(3500)
    TaskPlayAnim(cop, 'mp_arrest_paired', 'exit', 3.0, 3.0, 1000, 48, 0, false, false, false)
    Wait(1000)
    RemoveAnimDict('mp_arrest_paired')
end

-- Optional: call this from the server to make the cuffer play their side
RegisterNetEvent('police:client:PlayCuffAnim', function(targetServerId)
    handCuffAnimation(targetServerId)
end)

local cuffsProp
local CUFF_MODELS = { `p_cs_cuffs_02_s`, `prop_cs_cuffs_01` } -- primary + fallback

-- Better bone for paired anim stability:
local CUFF_BONE = 28422 -- IK_R_Hand (try 57005 = SKEL_R_Hand if you prefer)

-- Tuned defaults (was sideways/too low)
local DEFAULT_ATTACH = {
    pos = vec3(-0.010, 0.062, -0.005), -- raise Z (3rd value)
    rot = vec3(90.0, -12.0, 90.0),      -- yaw 90 so rings sit correctly
}
local FEMALE_Z_ADJUST = 0.010        -- tiny lift for mp_f_freemode_01

-- local cuffAttachOverride -- set by /cuffstune for live tuning

local function loadModel(hash)
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        while not HasModelLoaded(hash) do Wait(0) end
    end
end

local function chooseCuffModel()
    for _, h in ipairs(CUFF_MODELS) do
        if IsModelValid(h) then return h end
    end
end

local function getAttachForPed(ped)
    local pos = DEFAULT_ATTACH.pos
    local rot = DEFAULT_ATTACH.rot

    local mdl = GetEntityModel(ped)
    if mdl == `mp_f_freemode_01` then
        pos = vec3(pos.x, pos.y, pos.z + FEMALE_Z_ADJUST)
    end
    if cuffAttachOverride then
        pos = cuffAttachOverride.pos or pos
        rot = cuffAttachOverride.rot or rot
    end
    return pos, rot
end

local function addCuffsProp(ped)
    if DoesEntityExist(cuffsProp) then return end

    local hash = chooseCuffModel()
    if not hash then return end
    loadModel(hash)

    local x, y, z = table.unpack(GetEntityCoords(ped))
    cuffsProp = CreateObject(hash, x, y, z, true, true, false)
    if not DoesEntityExist(cuffsProp) then return end

    SetEntityAsMissionEntity(cuffsProp, true, true)
    SetEntityCollision(cuffsProp, false, false)

    local pos, rot = getAttachForPed(ped)
    AttachEntityToEntity(
        cuffsProp, ped, GetPedBoneIndex(ped, CUFF_BONE),
        pos.x, pos.y, pos.z,
        rot.x, rot.y, rot.z,
        true,  -- p9
        true,  -- useSoftPinning
        false, -- collision (false keeps it from bumping)
        true,  -- isPed
        2,     -- vertexIndex
        true   -- fixedRot
    )
    SetModelAsNoLongerNeeded(hash)
end

local function removeCuffsProp()
    if DoesEntityExist(cuffsProp) then
        DetachEntity(cuffsProp, true, true)
        DeleteEntity(cuffsProp)
        cuffsProp = nil
    end
end

-- Optional: live tuning of offsets/rotation
-- RegisterCommand('cuffstune', function(_, args)
--     local dx = tonumber(args[1]); local dy = tonumber(args[2]); local dz = tonumber(args[3])
--     local rx = tonumber(args[4]); local ry = tonumber(args[5]); local rz = tonumber(args[6])
--     if not (dx and dy and dz and rx and ry and rz) then
--         return exports.qbx_core:Notify('Usage: /cuffstune dx dy dz rx ry rz', 'error')
--     end
--     cuffAttachOverride = { pos = vec3(dx, dy, dz), rot = vec3(rx, ry, rz) }
--     local ped = (cache and cache.ped) or PlayerPedId()
--     removeCuffsProp()
--     addCuffsProp(ped)
--     exports.qbx_core:Notify(('Cuffs tuned: pos(%.3f, %.3f, %.3f) rot(%.1f, %.1f, %.1f)'):format(dx, dy, dz, rx, ry, rz), 'success')
-- end, false)


------------------------------------------------------------
-- Non-freezing paired cuff animation (adds prop)
------------------------------------------------------------
local function getCuffedAnimation(playerId, isSoftcuff)
    local ped = (cache and cache.ped) or PlayerPedId()
    local cuffer = GetPlayerFromServerId(playerId)
    local cufferPed = (cuffer ~= -1) and GetPlayerPed(cuffer) or 0

    -- If cuffer isn't streamed, short fallback and still add cuffs
    if cufferPed == 0 then
        lib.requestAnimDict('mp_arresting')
        TaskPlayAnim(ped, 'mp_arresting', 'idle', 3.0, 3.0, 1500, 49, 0, false, false, false) -- 49 = non-rooted
        RemoveAnimDict('mp_arresting')
        SetEnableHandcuffs(ped, true)
        SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
        addCuffsProp(ped)
        return
    end

    local heading = GetEntityHeading(cufferPed)
    TriggerServerEvent('InteractSound_SV:PlayOnSource', 'Cuff', 0.2)

    lib.requestAnimDict('mp_arrest_paired')

    -- Small nudge for sync (not a freeze)
    local offset = GetOffsetFromEntityInWorldCoords(cufferPed, 0.0, 0.45, 0.0)
    SetEntityCoords(ped, offset.x, offset.y, offset.z, true, false, false, false)
    Wait(50)
    SetEntityHeading(ped, heading)

    -- Crook side animation; 49 keeps movement control
    TaskPlayAnim(ped, 'mp_arrest_paired', 'crook_p2_back_right', 3.0, 3.0, 2500, 49, 0, false, false, false)

    SetEnableHandcuffs(ped, true)
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)

    addCuffsProp(ped)

    CreateThread(function()
        Wait(1000)
        RemoveAnimDict('mp_arrest_paired')
    end)
end

-- Back-compat alias
function GetCuffedAnimation(playerId) return getCuffedAnimation(playerId) end

local function escortActions()
    DisableAllControlActions(0)
    EnableControlAction(0, 1, true)
    EnableControlAction(0, 2, true)
    EnableControlAction(0, 245, true)
    EnableControlAction(0, 38, true)
    EnableControlAction(0, 322, true)
    EnableControlAction(0, 249, true)
    EnableControlAction(0, 46, true)
end

local function handcuffActions()
    lib.disableControls()
    DisableControlAction(27, 75, true) -- Disable exit vehicle
    EnableControlAction(0, 249, true)  -- Added for talking while cuffed
    EnableControlAction(0, 46, true)   -- Added for talking while cuffed
end

local function handcuffedEscorted()
    local sleep = 1000
    local anim = { { dict = 'mp_arresting', anim = 'idle' }, { dict = 'mp_arrest_paired', anim = 'crook_p2_back_right' } }

    if not LocalPlayer.state.isLoggedIn then return sleep end
    if IsEscorted then
        sleep = 0
        escortActions()
    end
    if not QBX.PlayerData.metadata.ishandcuffed then return sleep end
    sleep = 0
    handcuffActions()
    if QBX.PlayerData.metadata.isdead or QBX.PlayerData.metadata.inlaststand then return sleep end
    for i = 1, #anim do
        if IsEntityPlayingAnim(cache.ped, anim[i].dict, anim[i].anim, 3) then return sleep end
    end
    lib.playAnim(cache.ped, 'mp_arresting', 'idle', 8.0, -8, -1, cuffType, 0, false, false, false)

    return sleep
end

RegisterNetEvent('police:client:SetOutVehicle', function()
    if not cache.vehicle then return end
    TaskLeaveVehicle(cache.ped, cache.vehicle, 16)
end)

RegisterNetEvent('police:client:PutInVehicle', function()
    if not QBX.PlayerData.metadata.ishandcuffed and not IsEscorted then return end

    local coords = GetEntityCoords(cache.ped)
    local vehicle = lib.getClosestVehicle(coords)
    if not vehicle or not DoesEntityExist(vehicle) then return end

    for i = GetVehicleMaxNumberOfPassengers(vehicle), 0, -1 do
        if IsVehicleSeatFree(vehicle, i) then
            IsEscorted = false
            TriggerEvent('hospital:client:isEscorted', IsEscorted)
            ClearPedTasks(cache.ped)
            DetachEntity(cache.ped, true, false)
            Wait(100)
            SetPedIntoVehicle(cache.ped, vehicle, i)
            return
        end
    end
end)

---Check for closest player within distance or 2.5 units
---@param distance number?
---@return number? playerId
---@return number? playerPed
local function getClosestPlayer(distance)
    local coords = GetEntityCoords(cache.ped)
    local player, playerPed = lib.getClosestPlayer(coords, distance or 2.5)
    if not player then
        return exports.qbx_core:Notify(locale('error.none_nearby'), 'error')
    end

    return player, playerPed
end

RegisterNetEvent('police:client:SearchPlayer', function()
    local player = getClosestPlayer()
    if not player then return end
    local playerId = GetPlayerServerId(player)
    -- exports.ox_inventory:openNearbyInventory(playerId)
    TriggerServerEvent('police:server:SearchPlayer', playerId)
end)

RegisterNetEvent('police:client:SeizeCash', function()
    local player = getClosestPlayer()
    if not player then return end
    local playerId = GetPlayerServerId(player)
    TriggerServerEvent('police:server:SeizeCash', playerId)
end)

local function IsCopDead(playerId)
    local retval = false
    local hasReturned = false
    local data = lib.callback.await('police:server:isCopDead', false, playerId)
    return data
end

RegisterNetEvent('police:client:RobPlayer', function()
    local player, playerPed = getClosestPlayer()
    if not player or not playerPed then return end
    local playerId = GetPlayerServerId(player)

    if not (IsEntityPlayingAnim(playerPed, 'missminuteman_1ig_2', 'handsup_base', 3)
            or IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3)
            or isTargetDead(playerId))
    then
        return exports.qbx_core:Notify(locale('error.no_rob'), 'error')
    end
    if IsCopDead(playerId) then
        exports.qbx_core:Notify('You can\'t rob this person!', 'error')
        return
    end

    if lib.progressCircle({
            duration = math.random(5000, 7000),
            position = 'bottom',
            label = locale('progressbar.robbing'),
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
                car = true,
                combat = true,
                mouse = false
            },
            anim = {
                dict = 'random@shop_robbery',
                clip = 'robbery_action_b',
                flags = 16
            }
        })
    then
        local playerCoords = GetEntityCoords(playerPed)
        local pos = GetEntityCoords(cache.ped)
        if #(pos - playerCoords) < 2.5 then
            StopAnimTask(cache.ped, 'random@shop_robbery', 'robbery_action_b', 1.0)
            exports.ox_inventory:openNearbyInventory(playerId)
            -- TriggerServerEvent('police:server:RobPlayer', playerId)
        else
            exports.qbx_core:Notify(locale('error.none_nearby'), 'error')
        end
    else
        StopAnimTask(cache.ped, 'random@shop_robbery', 'robbery_action_b', 1.0)
        exports.qbx_core:Notify(locale('error.canceled'), 'error')
    end
end)

-- RegisterNetEvent('police:client:JailPlayer', function()
--     local player = getClosestPlayer()
--     if not player then return end
--     local playerId = GetPlayerServerId(player)
--     local dialog = lib.inputDialog(locale('info.jail_time_input'), {
--         { type = 'number', label = locale('info.time_months'), min = 0 }
--     })
--     if dialog and dialog[1] > 0 then
--         TriggerServerEvent('police:server:JailPlayer', playerId, dialog[1])
--     else
--         exports.qbx_core:Notify(locale('error.time_higher'), 'error')
--     end
-- end)

RegisterNetEvent('police:client:BillPlayer', function()
    local player = getClosestPlayer()
    if not player then return end
    local playerId = GetPlayerServerId(player)
    local dialog = lib.inputDialog(locale('info.bill'), {
        { type = 'number', label = locale('info.amount'), min = 0 }
    })
    if dialog and dialog[1] > 0 then
        TriggerServerEvent('police:server:BillPlayer', playerId, dialog[1])
    else
        exports.qbx_core:Notify(locale('error.time_higher'), 'error')
    end
end)

local function triggerIfHandsFree(eventName)
    local player = getClosestPlayer()
    if not player then return end
    local playerId = GetPlayerServerId(player)
    if QBX.PlayerData.metadata.ishandcuffed or IsEscorted then return end
    TriggerServerEvent(eventName, playerId)
end

RegisterNetEvent('police:client:PutPlayerInVehicle', function()
    triggerIfHandsFree('police:server:PutPlayerInVehicle')
end)

RegisterNetEvent('police:client:SetPlayerOutVehicle', function()
    triggerIfHandsFree('police:server:SetPlayerOutVehicle')
end)

RegisterNetEvent('police:client:EscortPlayer', function()
    triggerIfHandsFree('police:server:EscortPlayer')
end)

RegisterNetEvent('police:client:KidnapPlayer', function()
    local player, playerPed = getClosestPlayer()
    if not player or not playerPed then return end
    local playerId = GetPlayerServerId(player)
    if IsPedInAnyVehicle(playerPed, false) or QBX.PlayerData.metadata.ishandcuffed or IsEscorted then return end
    TriggerServerEvent('police:server:KidnapPlayer', playerId)
end)

RegisterNetEvent('police:client:CuffPlayerSoft', function()
    if IsPedRagdoll(cache.ped) then return end
    local player, playerPed = getClosestPlayer(1.5)
    if not player or not playerPed then return end
    local playerId = GetPlayerServerId(player)

    if IsPedInAnyVehicle(playerPed, false) or cache.vehicle then
        return exports.qbx_core:Notify(locale('error.vehicle_cuff'), 'error')
    end

    if lib.callback.await('police:server:CuffPlayer', false, playerId, true) then
        handCuffAnimation()
    end
end)

RegisterNetEvent('police:client:CuffPlayer', function()
    if IsPedRagdoll(cache.ped) then return end
    local player, playerPed = getClosestPlayer()
    if not player or not playerPed then return end

    if exports.ox_inventory:Search('count', config.handcuffItems) == 0 then
        return exports.qbx_core:Notify(locale('error.no_cuff'), 'error')
    end

    local playerId = GetPlayerServerId(player)

    if IsPedInAnyVehicle(playerPed, false) or cache.vehicle then
        return exports.qbx_core:Notify(locale('error.vehicle_cuff'), 'error')
    end

    if lib.callback.await('police:server:CuffPlayer', false, playerId, false) then
        handCuffAnimation()
    end
end)

RegisterNetEvent('police:client:GetEscorted', function(playerId)
    if not (QBX.PlayerData.metadata.isdead
            or QBX.PlayerData.metadata.ishandcuffed
            or QBX.PlayerData.metadata.inlaststand)
    then
        return
    end

    if not IsEscorted then
        IsEscorted = true
        local dragger = GetPlayerPed(GetPlayerFromServerId(playerId))
        local offset = GetOffsetFromEntityInWorldCoords(dragger, 0.0, 0.45, 0.0)
        SetEntityCoords(cache.ped, offset.x, offset.y, offset.z, true, false, false, false)
        AttachEntityToEntity(cache.ped, dragger, 11816, 0.45, 0.45, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2,
            true)
    else
        IsEscorted = false
        DetachEntity(cache.ped, true, false)
    end
    TriggerEvent('hospital:client:isEscorted', IsEscorted)
end)

RegisterNetEvent('police:client:DeEscort', function()
    IsEscorted = false
    TriggerEvent('hospital:client:isEscorted', IsEscorted)
    DetachEntity(cache.ped, true, false)
end)

RegisterNetEvent('police:client:GetKidnappedTarget', function(playerId)
    if QBX.PlayerData.metadata.isdead
        or QBX.PlayerData.metadata.ishandcuffed
        or QBX.PlayerData.metadata.inlaststand
    then
        if not IsEscorted then
            IsEscorted = true
            local dragger = GetPlayerPed(GetPlayerFromServerId(playerId))
            lib.playAnim(cache.ped, 'nm', 'firemans_carry', 8.0, -8.0, 100000, 33, 0, false, false, false)
            AttachEntityToEntity(cache.ped, dragger, 0, 0.27, 0.15, 0.63, 0.5, 0.5, 0.0, false, false, false, false, 2,
                false)
        else
            IsEscorted = false
            DetachEntity(cache.ped, true, false)
            ClearPedTasksImmediately(cache.ped)
        end
        TriggerEvent('hospital:client:isEscorted', IsEscorted)
    end
end)

RegisterNetEvent('police:client:GetKidnappedDragger', function()
    if not isEscorting then
        lib.playAnim(cache.ped, 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 8.0, -8.0, 100000, 49, 0, false, false,
            false)
        isEscorting = true
    else
        ClearPedSecondaryTask(cache.ped)
        ClearPedTasksImmediately(cache.ped)
        isEscorting = false
    end
    TriggerEvent('hospital:client:SetEscortingState', isEscorting)
    TriggerEvent('qb-kidnapping:client:SetKidnapping', isEscorting)
end)

local cuffstreak = 0

RegisterNetEvent('police:client:GetCuffed', function(cufferId, isSoftcuff)
    local ped = (cache and cache.ped) or PlayerPedId()

    if not isHandcuffed then
        -- minigame escape (skip if dead/downed)
        local doQTE = not IsDownOrDead(ped)
        if doQTE then
            if cuffstreak <= 2 then
                local success = exports['rm_minigames']:quickTimeEvent('hard')
                if success then
                    cuffstreak = cuffstreak + 1
                    -- exports.qbx_core:Notify(locale('info.cuff_escaped'), 'success')
                    return
                end
            end
        end

        -- apply cuff state
        isHandcuffed = true
        cuffstreak = 0
        TriggerServerEvent('police:server:CuffSuccess', cufferId)
        TriggerServerEvent('police:server:SetHandcuffStatus', true)

        ClearPedTasksImmediately(ped)
        if GetSelectedPedWeapon(ped) ~= `WEAPON_UNARMED` then
            SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
        end

        if LocalPlayer and LocalPlayer.state and (LocalPlayer.state.radioChannel or 0) ~= 0 then
            exports['pma-voice']:setVoiceProperty('radioEnabled', false)
            exports['pma-voice']:setRadioChannel(0)
            exports["pma-voice"]:sendUIMessage({
                radioEnabled = false
            })
        end

        cuffType = isSoftcuff and 49 or 16
        getCuffedAnimation(cufferId, isSoftcuff) -- keeps non-freezing + cuffs prop

        exports.qbx_core:Notify(locale(isSoftcuff and 'info.cuffed_walk' or 'info.cuff'), 'primary')

    else
        -- Uncuffing (unchanged cleanup)
        isHandcuffed = false
        isEscorted = false

        TriggerServerEvent('police:server:UnCuffSuccess', cufferId)
        TriggerEvent('hospital:client:isEscorted', isEscorted)
        TriggerServerEvent('police:server:SetHandcuffStatus', false)

        DetachEntity(ped, true, false)
        SetEnableHandcuffs(ped, false)
        SetPedCanPlayGestureAnims(ped, true)
        SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
        ClearPedSecondaryTask(ped)
        StopAnimTask(ped, 'mp_arrest_paired', 'crook_p2_back_right', 1.0)
        StopAnimTask(ped, 'mp_arresting', 'idle', 1.0)
        RemoveAnimDict('mp_arrest_paired')
        RemoveAnimDict('mp_arresting')
        ResetPedMovementClipset(ped, 0.0)
        ResetPedStrafeClipset(ped)
        ResetPedWeaponMovementClipset(ped)
        if removeCuffsProp then removeCuffsProp() end
        ClearPedTasksImmediately(ped)
        cuffType = nil

        TriggerServerEvent('InteractSound_SV:PlayOnSource', 'Uncuff', 0.2)
        exports.qbx_core:Notify(locale('success.uncuffed'), 'success')
        TriggerEvent('police:client:DeEscort')
    end
end)

local DISABLED_CONTROLS = {
    -- 21,  -- Sprint
    24,  -- Attack
    257, -- Attack 2
    25,  -- Aim
    263, -- Melee Attack 1
    45,  -- Reload
    22,  -- Jump
    -- 44,  -- Cover
    37,  -- Select Weapon
    23,  -- Also 'enter'?
    288, -- Disable phone
    289, -- Inventory
    170, -- Animations
    167, -- Job
    26,  -- Disable looking behind
    73,  -- Disable clearing animation
    199, -- Disable pause screen
    59,  -- Disable steering in vehicle
    71,  -- Disable driving forward in vehicle
    72,  -- Disable reversing in vehicle
    36,  -- Disable going stealth
    264, -- Disable melee
    257, -- Disable melee
    140, -- Disable melee
    141, -- Disable melee
    142, -- Disable melee
    143, -- Disable melee
    75   -- Disable exit vehicle
}

CreateThread(function()
    local hasDisabledControls = false
    while true do
        local sleep = handcuffedEscorted()
        -- print(hasDisabledControls)
        -- print(sleep)
        if sleep > 0 and hasDisabledControls then --if sleep is greater than 0, activates controls
            lib.disableControls:Remove(DISABLED_CONTROLS)
            hasDisabledControls = false
        elseif sleep == 0 and not hasDisabledControls then
            lib.disableControls:Add(DISABLED_CONTROLS)
            hasDisabledControls = true
        end
        Wait(sleep)
    end
end)