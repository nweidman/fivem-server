-- client.lua
local QBCore = exports['qb-core']:GetCoreObject()

local deadPlayers
local docPed -- spawned doctor ped handle

-- ========= Helpers =========
local function cNotify(type, title, description, duration)
    if lib and lib.notify then
        lib.notify({
            type = type or 'info',
            title = title or 'Info',
            description = description or '',
            duration = duration or 5000
        })
    else
        QBCore.Functions.Notify(("[%s] %s"):format(title or 'Info', description or ''), type or 'primary', duration or 5000)
    end
end

-- Prefer scanning around the doctor ped if configured/present, else around player
local function getScanCenter()
    if Config.UseDoctorCoords and docPed and DoesEntityExist(docPed) then
        return GetEntityCoords(docPed)
    end
    return GetEntityCoords(PlayerPedId())
end

-- ========= Progress UI (patient side) =========
RegisterNetEvent('dk:client:startProgress', function(ms, label)
    lib.progressCircle({
        duration = ms or (Config.HealWaitTime * 1000),
        label = label or (Config.Lang and Config.Lang.DR_RECOVERING) or 'Recovering...',
        position = 'bottom',
        useWhileDead = true,
        disable = { move = true, car = true, sprint = true, combat = true },
        canCancel = false,
    })
end)

-- ========= Downed player queries =========
local function requestNearbyDowned(radius)
    radius = radius or (Config.SearchRadius or 5.0)
    local c = getScanCenter()
    deadPlayers = lib.callback.await('dk:getDownedPlayers', false, {
        center = { x = c.x, y = c.y, z = c.z },
        radius = radius
    }) or {}
end

-- ========= Menu rendering =========
local function openPatientsMenu()
    if not deadPlayers or next(deadPlayers) == nil then
        cNotify('info', 'Doctor', (Config.Lang and Config.Lang.NO_PLAYERS_NEED_HEAL) or 'No players need healing right now.', 5000)
        return
    end

    local options = {}

    for _, v in pairs(deadPlayers) do
        local payAmount = (v.status == "isDead" and (Config.PayAmount and Config.PayAmount.Isdead or 0))
                       or (v.status == "isInlaststand" and (Config.PayAmount and Config.PayAmount.IsInlaststand or 0))
                       or 0

        local char = v.PlayerData and v.PlayerData.charinfo or {}
        local first = char.firstname or ''
        local last  = char.lastname  or ''
        local playerName = (first ~= '' or last ~= '') and (first .. ' ' .. last)
                           or ('ID ' .. (v.PlayerData and v.PlayerData.source or '?'))

        local distTxt = v.distance and (' • ' .. string.format('%.1fm', v.distance)) or ''

        options[#options+1] = {
            label = playerName,
            description = string.format('%s: $%s%s', (Config.Lang and Config.Lang.COST) or 'Cost', payAmount, distTxt),
            args = {
                status = v.status,
                sid    = v.PlayerData and v.PlayerData.source or v.source or 0,
                char   = char
            }
        }
    end

    lib.registerMenu({
        id = 'illegal_doc_patients_ui',
        title = (Config.Lang and Config.Lang.HEAL_PLAYERS) or 'Treatable patients',
        position = 'top-right',
        options = options
    }, function(_, _, args)
        if not args or not args.sid then return end
        local mySid = GetPlayerServerId(PlayerId())
        TriggerServerEvent("dk:server:RevivePlayer", mySid, {
            status     = args.status,
            PlayerData = { source = args.sid, charinfo = args.char or {} }
        })
    end)

    lib.showMenu('illegal_doc_patients_ui')
end

-- ========= Top-level menu (no “pick by name”) =========
RegisterNetEvent('dk:openDoctorMenu', function()
    local pd   = QBCore.Functions.GetPlayerData()
    local meta = (pd and pd.metadata) or {}
    local isSelfDown = (meta.isdead == true) or (meta.inlaststand == true)

    local options = {}

    if Config.AllowSelfRevive and isSelfDown then
        local cost = (Config.PayAmount and Config.PayAmount.Self) or 0
        if meta.isdead then
            cost = (Config.PayAmount and Config.PayAmount.Isdead) or cost
        elseif meta.inlaststand then
            cost = (Config.PayAmount and Config.PayAmount.IsInlaststand) or cost
        end

        options[#options+1] = {
            label = 'Revive me',
            description = string.format('%s: $%s', (Config.Lang and Config.Lang.COST) or 'Cost', cost),
            args = { isSelf = true, status = meta.isdead and 'isDead' or 'isInlaststand' }
        }
    end

    options[#options+1] = {
        label = 'Treat nearby patient',
        description = 'List downed players within ~' .. tostring(Config.SearchRadius or 5.0) .. 'm of doctor',
        args = { action = 'open_patients_near' }
    }

    lib.registerMenu({
        id = 'illegal_doc_main_ui',
        title = 'Illegal Doctor',
        position = 'top-right',
        options = options
    }, function(_, _, args)
        if not args then return end

        if args.isSelf then
            local mySid = GetPlayerServerId(PlayerId())
            TriggerServerEvent("dk:server:RevivePlayer", mySid, {
                status     = args.status,
                PlayerData = { source = mySid, charinfo = (pd and pd.charinfo) or {} }
            })
            return
        end

        if args.action == 'open_patients_near' then
            requestNearbyDowned(Config.SearchRadius or 5.0)
            openPatientsMenu()
        end
    end)

    lib.showMenu('illegal_doc_main_ui')
end)

-- ========= Ped spawn + target =========
local function spawnDoctorPed()
    local cfg = Config.Ped
    if not cfg or not cfg.coords then
        print('[dk_illegal_doc] Config.Ped is missing or incomplete')
        return
    end

    -- Support string model names ("mp_f_meth_01") or numeric hashes (`s_m_m_doctor_01`)
    local model = cfg.model or `s_m_m_doctor_01`
    local modelHash = type(model) == 'string' and joaat(model) or model

    lib.requestModel(modelHash, 5000)
    if not HasModelLoaded(modelHash) then
        print('[dk_illegal_doc] Failed to load ped model:', tostring(model))
        return
    end

    local x, y, z = cfg.coords.x, cfg.coords.y, cfg.coords.z
    local ped = CreatePed(4, modelHash, x, y, z - 1.0, cfg.heading or 0.0, false, true)
    if ped == 0 then
        print('[dk_illegal_doc] Failed to create ped')
        SetModelAsNoLongerNeeded(modelHash)
        return
    end

    SetEntityAsMissionEntity(ped, true, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedFleeAttributes(ped, 0, false)
    SetPedCombatAttributes(ped, 46, true)
    SetPedCanRagdoll(ped, false)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, cfg.heading or 0.0)

    if cfg.scenario then
        TaskStartScenarioInPlace(ped, cfg.scenario, 0, true)
    else
        ClearPedTasksImmediately(ped)
    end

    -- ox_target: open the menu when targeting the ped
    exports.ox_target:addLocalEntity(ped, {
        {
            name = 'dk_illegal_doc_menu',
            icon = cfg.targetIcon or 'fa-solid fa-briefcase-medical',
            label = cfg.targetLabel or 'Open Treatment Menu',
            distance = cfg.targetDist or 2.2,
            onSelect = function()
                TriggerEvent('dk:openDoctorMenu')
            end
        }
    })

    SetModelAsNoLongerNeeded(modelHash)
    docPed = ped
end

-- Cleanup on stop
AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() then return end
    if docPed and DoesEntityExist(docPed) then
        DeleteEntity(docPed)
        docPed = nil
    end
end)

-- Spawn doctor on client start
CreateThread(function()
    spawnDoctorPed()
end)
