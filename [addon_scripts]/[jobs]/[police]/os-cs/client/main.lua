-- COMMUNITY SERVICE (CLIENT) - Qbox compatible
-- deps: qb-core (Qbox shim), ox_lib (for input dialog)
-- fxmanifest: shared_script '@ox_lib/init.lua'

local QBCore = exports['qb-core']:GetCoreObject()

-- ===== toggles =====
local USE_SERVER_LABELS = false   -- true = fetch pretty labels via MakePlayerList; false = "ID n" only

-- ===== state =====
local isSentenced, communityServiceFinished = false, false
local actionsRemaining, availableActions = 0, {}
local disable_actions = false
local spatula_net = nil
local PlayerData, PlayerJob = {}, {}

-- =========================================================
-- Tablet anim (pure native, no dpemotes/animations deps)
-- Keeps anim active while the menu is open
-- =========================================================
local tablet = {
    using = false,
    prop = 0,
    dict = 'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a',
    clip = 'idle_a',
    model = `prop_cs_tablet`,
    loopThread = nil
}

local function ensureLoaded(dict, model)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) end
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
end

local function attachTabletProp(ped)
    local obj = CreateObject(tablet.model, 0.0, 0.0, 0.0, true, true, false)
    AttachEntityToEntity(
        obj, ped, GetPedBoneIndex(ped, 60309), -- RHAND
        0.03, 0.002, -0.02,                    -- position offsets
        10.0, 160.0, 0.0,                      -- rotation
        true, true, false, true, 1, true
    )
    tablet.prop = ObjToNet(obj)
end

local function playTabletAnim(ped)
    -- 49 = repeat, upper body only, allow movement
    TaskPlayAnim(ped, tablet.dict, tablet.clip, 4.0, -4.0, -1, 49, 0.0, false, false, false)
end

local function startTablet()
    if tablet.using then return end
    local ped = PlayerPedId()
    ensureLoaded(tablet.dict, tablet.model)
    attachTabletProp(ped)
    playTabletAnim(ped)
    tablet.using = true

    -- sticky loop to keep anim if some script clears tasks
    tablet.loopThread = CreateThread(function()
        while tablet.using do
            if not IsEntityPlayingAnim(ped, tablet.dict, tablet.clip, 3) then
                playTabletAnim(ped)
            end
            -- if prop somehow deleted, reattach
            if tablet.prop == 0 or not DoesEntityExist(NetToObj(tablet.prop)) then
                attachTabletProp(ped)
            end
            Wait(300)
        end
    end)
end

local function stopTablet()
    if not tablet.using then return end
    tablet.using = false

    if tablet.loopThread then
        -- thread will exit on next tick
        tablet.loopThread = nil
    end

    local ped = PlayerPedId()
    StopAnimTask(ped, tablet.dict, tablet.clip, 1.0)

    if tablet.prop ~= 0 then
        local obj = NetToObj(tablet.prop)
        if DoesEntityExist(obj) then
            DetachEntity(obj, true, true)
            DeleteEntity(obj)
        end
        tablet.prop = 0
    end
end

-- =========================================================
-- utilities
-- =========================================================
local function cNotify(type, msg, dur)
    if QBCore and QBCore.Functions and QBCore.Functions.Notify then
        QBCore.Functions.Notify(msg, type or 'primary', dur or 5000)
        return
    end
    if lib and lib.notify then
        lib.notify({ title = 'Community Service', description = msg, type = type or 'info', duration = dur or 5000 })
    end
end

local function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if not onScreen then return end
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextOutline()
    SetTextCentre(true)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(_x, _y)
end

local function draw2dText(text, pos)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextScale(0.45, 0.45)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow()
    SetTextOutline()
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(pos[1], pos[2])
end

local function removeSpatula()
    if spatula_net then
        local obj = NetToObj(spatula_net)
        if DoesEntityExist(obj) then
            DetachEntity(obj, true, true)
            DeleteEntity(obj)
        end
        spatula_net = nil
    end
end

local function GetNearbyPlayers(radius)
    local me = PlayerId()
    local myCoords = GetEntityCoords(PlayerPedId())
    local out = {}
    for _, pid in ipairs(GetActivePlayers()) do
        if pid ~= me then
            local ped = GetPlayerPed(pid)
            if DoesEntityExist(ped) then
                local dist = #(GetEntityCoords(ped) - myCoords)
                if dist <= radius then
                    out[#out+1] = { pid = pid, dist = dist, serverId = GetPlayerServerId(pid) }
                end
            end
        end
    end
    table.sort(out, function(a, b) return a.dist < b.dist end)
    return out
end

-- =========================================================
-- action table mgmt
-- =========================================================
local function sameCoords(a, b)
    return a and b and a.x == b.x and a.y == b.y and a.z == b.z
end

local function FillActionTable(last_action)
    -- require:
    --   Config.ServiceLocations = { { coords = vec3(x,y,z), type = "cleaning"|"gardening" }, ... }
    while #availableActions < 5 do
        local pick = Config.ServiceLocations[math.random(1, #Config.ServiceLocations)]
        local ok = true
        for i = 1, #availableActions do
            if sameCoords(pick.coords, availableActions[i].coords) then ok = false break end
        end
        if ok and last_action and sameCoords(pick.coords, last_action.coords) then ok = false end
        if ok then availableActions[#availableActions+1] = pick end
    end
end

local function RemoveAction(action)
    for i = 1, #availableActions do
        if sameCoords(action.coords, availableActions[i].coords) then
            table.remove(availableActions, i)
            return
        end
    end
end

local function DrawAvailableActions()
    for i = 1, #availableActions do
        local c = availableActions[i].coords
        DrawMarker(21, c.x, c.y, c.z, 0.0,0.0,0.0, 0.0,0.0,0.0, 0.5,0.5,0.5, 50,50,204,100, false,true,2,true,nil,nil,false)
    end
end

local function DisableViolentActions()
    local playerPed = PlayerPedId()

    if disable_actions then DisableAllControlActions(0) end

    RemoveAllPedWeapons(playerPed, true)
    DisableControlAction(0, 37, true)  -- TAB
    DisablePlayerFiring(playerPed, true)
    DisableControlAction(0, 106, true) -- LMB
    DisableControlAction(0, 140, true)
    DisableControlAction(0, 141, true)
    DisableControlAction(0, 142, true)

    if IsDisabledControlJustPressed(0, 37) or IsDisabledControlJustPressed(0, 106) then
        SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true)
    end
end

-- =========================================================
-- events / flow
-- =========================================================
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData() or {}
    PlayerJob  = PlayerData.job or {}
    local meta = PlayerData.metadata or {}
    TriggerEvent('esx_communityservice:inCommunityService', meta.communityservice)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(jobInfo)
    PlayerJob = jobInfo or PlayerJob
end)

AddEventHandler('onResourceStart', function(res)
    if res ~= GetCurrentResourceName() then return end
    if LocalPlayer.state.isLoggedIn then
        PlayerData = QBCore.Functions.GetPlayerData() or {}
        PlayerJob  = PlayerData.job or {}
        local meta = PlayerData.metadata or {}
        TriggerEvent('esx_communityservice:inCommunityService', meta.communityservice)
    end
end)

RegisterNetEvent('esx_communityservice:finishCommunityService', function()
    communityServiceFinished, isSentenced, actionsRemaining = true, false, 0
    removeSpatula()
end)

RegisterNetEvent('esx_communityservice:inCommunityService', function(actions_remaining)
    actions_remaining = tonumber(actions_remaining or 0) or 0
    if isSentenced or actions_remaining == 0 then return end

    actionsRemaining = actions_remaining
    FillActionTable()

    -- require:
    --   Config.ServiceLocation = vec3(x,y,z)
    SetEntityCoords(PlayerPedId(), Config.ServiceLocation.x, Config.ServiceLocation.y, Config.ServiceLocation.z, false,false,false,false)
    isSentenced, communityServiceFinished = true, false

    -- escape watchdog
    CreateThread(function()
        while actionsRemaining > 0 and not communityServiceFinished do
            local ped = PlayerPedId()
            local dist = #(GetEntityCoords(ped) - Config.ServiceLocation)
            if dist > 60.0 then
                if IsPedInAnyVehicle(ped, false) then ClearPedTasksImmediately(ped) end
                SetEntityCoords(ped, Config.ServiceLocation.x, Config.ServiceLocation.y, Config.ServiceLocation.z, false,false,false,false)
                TriggerServerEvent('esx_communityservice:extendService')
                actionsRemaining = actionsRemaining + (Config.ServiceExtensionOnEscape or 5)
                cNotify('error', 'You cannot escape. Your community service has been extended.')
            end
            Wait(20000)
        end
        TriggerServerEvent('esx_communityservice:finishCommunityService')
        isSentenced = false
    end)
end)

-- main tick
CreateThread(function()
    while true do
        local sleep = 3000

        if LocalPlayer.state.isLoggedIn and actionsRemaining > 0 and isSentenced then
            sleep = 0
            draw2dText(
                ('~b~You have ~s~%d~b~ more actions to complete before you can finish your service.'):format(math.floor(actionsRemaining + 0.5)),
                {0.70, 0.955}
            )

            DrawAvailableActions()
            DisableViolentActions()

            local ped = PlayerPedId()
            local pCoords = GetEntityCoords(ped)

            for i = 1, #availableActions do
                local ac = availableActions[i]
                if #(pCoords - ac.coords) < 1.5 then
                    DrawText3D(pCoords.x, pCoords.y, pCoords.z + 0.95, '~g~[E]~s~ Clear')
                    if IsControlJustReleased(0, 38) then -- E
                        RemoveAction(ac)
                        FillActionTable(ac)
                        disable_actions = true

                        TriggerServerEvent('esx_communityservice:completeService')
                        actionsRemaining = math.max(0, actionsRemaining - 1)

                        local cSCoords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, -5.0)
                        local propHash, scenario = nil, nil
                        if ac.type == 'cleaning'  then propHash = `prop_tool_broom2`        scenario = 'WORLD_HUMAN_JANITOR'
                        elseif ac.type == 'gardening' then propHash = `bkr_prop_coke_spatula_04` scenario = 'WORLD_HUMAN_GARDENER_PLANT' end

                        if propHash and scenario then
                            RequestModel(propHash) while not HasModelLoaded(propHash) do Wait(0) end
                            local obj = CreateObject(propHash, cSCoords.x, cSCoords.y, cSCoords.z, true, true, true)
                            spatula_net = ObjToNet(obj)
                            TaskStartScenarioInPlace(ped, scenario, 0, false)

                            Wait(14000)

                            disable_actions = false
                            removeSpatula()
                            ClearPedTasks(ped)
                        else
                            Wait(2500)
                            disable_actions = false
                        end

                        if actionsRemaining == 0 then
                            cNotify('success', 'You have completed your community service.')
                        end
                        break
                    end
                end
            end
        end

        Wait(sleep)
    end
end)

-- =========================================================
-- /comserv command (police/sheriff) with tablet around dialog
-- =========================================================
RegisterCommand('comserv', function()
    local jobName = (PlayerJob and PlayerJob.name) or 'unemployed'
    if jobName ~= 'police' and jobName ~= 'sheriff' then return end

    local nearby = GetNearbyPlayers(10.0)
    if #nearby == 0 then
        cNotify('error', 'No one is nearby to send on Community Service.')
        return
    end

    local labelsById = {}
    if USE_SERVER_LABELS and QBCore.Functions and QBCore.Functions.TriggerCallback then
        local done = false
        QBCore.Functions.TriggerCallback('MakePlayerList', function(list)
            if type(list) == 'table' then
                for _, v in ipairs(list) do
                    labelsById[tonumber(v.value)] = v.text
                end
            end
            done = true
        end)
        local t = GetGameTimer()
        while not done and (GetGameTimer() - t) < 1000 do Wait(0) end
    end

    local opts = {}
    for _, e in ipairs(nearby) do
        local sid = e.serverId
        local base = labelsById[sid] or ('ID %d'):format(sid)
        opts[#opts+1] = { label = ('%s (%dm)'):format(base, math.floor(e.dist + 0.5)), value = sid }
    end

    -- show tablet while dialog is open
    startTablet()
    local dlg = lib and lib.inputDialog and lib.inputDialog('Community Service', {
        { type = 'select', label = 'Player', options = opts, required = true },
        { type = 'number', label = 'Sentence Length (actions)', min = 1, max = 500, required = true },
    })
    stopTablet()

    if not dlg then return end
    local targetId, sentence = dlg[1], tonumber(dlg[2])
    if not targetId or not sentence then return end

    TriggerServerEvent('sendserverdatass', { id = targetId, kamu = sentence })
end, false)
