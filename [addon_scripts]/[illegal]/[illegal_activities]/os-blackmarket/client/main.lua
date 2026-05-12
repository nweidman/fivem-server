local Ev = {}
do
    local sdEv = SD and SD.Events or nil
    function Ev.on(name, handler)
        if sdEv and type(sdEv) == 'table' and type(sdEv.Register) == 'function' then
            return sdEv.Register(name, handler)
        elseif sdEv and type(sdEv) == 'table' and type(sdEv.on) == 'function' then
            return sdEv.on(name, handler)
        else
            RegisterNetEvent(name)
            return AddEventHandler(name, handler)
        end
    end
    function Ev.emit(name, ...)
        if sdEv and type(sdEv) == 'table' and type(sdEv.Trigger) == 'function' then
            return sdEv.Trigger(name, ...)
        elseif sdEv and type(sdEv) == 'table' and type(sdEv.emit) == 'function' then
            return sdEv.emit(name, ...)
        else
            return TriggerEvent(name, ...)
        end
    end
    function Ev.emitServer(name, ...)
        if sdEv and type(sdEv) == 'table' and type(sdEv.TriggerServer) == 'function' then
            return sdEv.TriggerServer(name, ...)
        elseif sdEv and type(sdEv) == 'table' and type(sdEv.emitServer) == 'function' then
            return sdEv.emitServer(name, ...)
        else
            return TriggerServerEvent(name, ...)
        end
    end
end

local locale = 'Black Market'
local pedEntity, vehicleEntity, crateEntity, weaponEntity
local interactionPoint
local cachedData
local isUiOpen = false
local textVisible = false
local targetInteraction = nil
local currentInteractionMode = nil
local warnedTargetFallback = false

local TARGET_EVENT = 'dm-blackmarket:client:open'
local TARGET_OPTION = 'dm_blackmarket_open'

local spinThreadActive = false
local bobThreadActive  = false
local currentBaseZ     = 0.30

local camHandle        = nil
local camActive        = false
local camTargetUpdater = nil

local doorsThreadActive = false
local rearDoorIndices = {2, 3, 5}

local function hideText()
    if lib and textVisible then
        lib.hideTextUI()
        textVisible = false
    end
end

local function showText(msg)
    if lib and not isUiOpen then
        lib.showTextUI(msg)
        textVisible = true
    end
end

local function isResourceActive(name)
    if type(name) ~= 'string' or name == '' then
        return false
    end
    if GetResourceState then
        local state = GetResourceState(name)
        if state == 'started' or state == 'starting' then
            return true
        end
    end
    if exports and exports[name] then
        return true
    end
    return false
end

local function resolveInteractionMode()
    local cfg = Config.Interaction or {}
    local modeCfg = type(cfg.mode) == 'string' and cfg.mode:lower() or 'auto'
    local targetPref = type(cfg.targetSystem) == 'string' and cfg.targetSystem:lower() or 'auto'

    local availableTarget
    if targetPref == 'ox_target' then
        if isResourceActive('ox_target') then availableTarget = 'ox_target' end
    elseif targetPref == 'qb-target' then
        if isResourceActive('qb-target') then availableTarget = 'qb-target' end
    else
        if isResourceActive('ox_target') then
            availableTarget = 'ox_target'
        elseif isResourceActive('qb-target') then
            availableTarget = 'qb-target'
        end
    end

    local mode = 'textui'
    if modeCfg == 'target' or modeCfg == 'auto' then
        if availableTarget then
            mode = 'target'
            warnedTargetFallback = false
        elseif modeCfg == 'target' and not warnedTargetFallback then
            warnedTargetFallback = true
        end
    elseif modeCfg == 'textui' then
        mode = 'textui'
        warnedTargetFallback = false
    end

    return mode, availableTarget
end

local function getTargetLabel()
    local cfg = Config.Interaction or {}
    return cfg.label or ('Access the ' .. locale)
end

local function getTargetIcon()
    local cfg = Config.Interaction or {}
    return cfg.icon or 'fa-solid fa-gun'
end

local function getTargetBones()
    local cfg = Config.Interaction or {}
    local bones = cfg.bones
    if type(bones) == 'table' and #bones > 0 then
        return bones
    end
    return { 'bodyshell', 'boot' }
end

local function clearTargetInteraction()
    if not targetInteraction then return end
    local resource = targetInteraction.resource
    local entity = targetInteraction.entity
    local id = targetInteraction.id
    local method = targetInteraction.method

    if resource == 'ox_target' then
        pcall(function()
            local ox = exports and exports.ox_target
            if not ox then return end
            if ox.removeLocalEntity then
                ox:removeLocalEntity(entity, id)
            elseif ox.removeEntity then
                ox:removeEntity(entity, id)
            end
        end)
    elseif resource == 'qb-target' then
        pcall(function()
            exports['qb-target']:RemoveTargetEntity(entity)
        end)
    end

    targetInteraction = nil
end

local function clearInteraction()
    if interactionPoint then
        interactionPoint:remove()
        interactionPoint = nil
    end
    clearTargetInteraction()
    currentInteractionMode = nil
end

local function deleteIfExists(ent)
    if ent and DoesEntityExist(ent) then
        DeleteEntity(ent)
    end
end

local function tryLoadModel(name)
    if not name then return nil end
    if SD and SD.LoadModel then
        return SD.LoadModel(name)
    else
        local hash = joaat(name)
        if not IsModelInCdimage(hash) then return nil end
        RequestModel(hash)
        local timeout = GetGameTimer() + 5000
        while not HasModelLoaded(hash) do
            Wait(0)
            if GetGameTimer() > timeout then break end
        end
        return hash
    end
end

local function loadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return true end
    RequestAnimDict(dict)
    local timeout = GetGameTimer() + 5000
    while not HasAnimDictLoaded(dict) do
        Wait(0)
        if GetGameTimer() > timeout then
            return false
        end
    end
    return true
end

local function findItemByName(name)
    if not name or not cachedData or type(cachedData.items) ~= 'table' then return nil end
    for _, it in ipairs(cachedData.items) do
        if it and it.name == name then
            return it
        end
    end
    return nil
end

local function smoothstep01(t)
    if t <= 0.0 then return 0.0 end
    if t >= 1.0 then return 1.0 end
    return t * t * (3.0 - 2.0 * t)
end

local function spinWeapon()
    if not weaponEntity or not DoesEntityExist(weaponEntity) then return end
    if spinThreadActive then return end
    spinThreadActive = true
    CreateThread(function()
        local speed = (Config.PreviewSpinSpeed or 22.5) + 0.0
        local h = GetEntityHeading(weaponEntity)
        while spinThreadActive and weaponEntity and DoesEntityExist(weaponEntity) do
            Wait(0)
            h = (h + speed * GetFrameTime() * 60.0) % 360.0
            SetEntityHeading(weaponEntity, h)
        end
    end)
end

local function ensureCrate()
    if vehicleEntity == 0 or not DoesEntityExist(vehicleEntity) then return end
    if crateEntity and DoesEntityExist(crateEntity) then return end
    local crateHash = tryLoadModel(Config.CrateModel or 'prop_box_wood03a')
    if not crateHash then return end
    crateEntity = CreateObject(crateHash, 0.0, 0.0, 0.0, false, false, false)
    SetEntityAsMissionEntity(crateEntity, true, true)
    SetEntityCollision(crateEntity, true, true)
    local off = Config.CrateOffset or vec3(-1.3, -2.0, 0.0)
    AttachEntityToEntity(
        crateEntity, vehicleEntity, -1,
        off.x + 0.0, off.y + 0.0, off.z + 0.0,
        0.0, 0.0, 0.0, false, false, false, false, 2, true
    )
    FreezeEntityPosition(crateEntity, true)
end

local function startBobbing(opts)
    if bobThreadActive or not (weaponEntity and DoesEntityExist(weaponEntity)) then return end
    bobThreadActive = true
    local baseZ = opts.baseZ or currentBaseZ
    local freqHz = opts.freq or 0.5
    local amp    = opts.amp  or 0.06
    local t0 = GetGameTimer()
    CreateThread(function()
        while bobThreadActive and weaponEntity and DoesEntityExist(weaponEntity) do
            local elapsed = (GetGameTimer() - t0) / 1000.0
            local bob = math.sin(elapsed * 2.0 * math.pi * freqHz) * amp
            AttachEntityToEntity(weaponEntity, crateEntity, -1, 0.0, 0.0, baseZ + bob, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
            Wait(0)
        end
    end)
end

local function forceOpenRearDoors(veh)
    if veh == 0 or not DoesEntityExist(veh) then return end
    for _, idx in ipairs(rearDoorIndices) do
        SetVehicleDoorOpen(veh, idx, false, false)
    end
end

local function lockVehicleForAll(veh)
    if veh == 0 or not DoesEntityExist(veh) then return end
    SetVehicleDoorsLocked(veh, 2)
    SetVehicleDoorsLockedForAllPlayers(veh, true)
end

local function ensureRearDoorsOpenThread()
    if doorsThreadActive or vehicleEntity == 0 or not DoesEntityExist(vehicleEntity) then return end
    doorsThreadActive = true
    CreateThread(function()
        while doorsThreadActive and vehicleEntity and DoesEntityExist(vehicleEntity) do
            for _, idx in ipairs(rearDoorIndices) do
                local ang = GetVehicleDoorAngleRatio(vehicleEntity, idx)
                if ang < 0.6 then
                    SetVehicleDoorOpen(vehicleEntity, idx, false, false)
                end
            end
            SetVehicleDoorsLocked(vehicleEntity, 2)
            SetVehicleDoorsLockedForAllPlayers(vehicleEntity, true)
            Wait(500)
        end
    end)
end

local function camCfg()
    local C = Config and Config.Cam or {}
    return {
        enabled        = (C.enabled ~= false),
        startFrom      = (C.startFrom or 'player'),
        startOffset    = C.startOffset    or vec3(0.0, -1.6, 0.9),
        startOffsetVan = C.startOffsetVan or vec3(-2.2, -3.0, 1.0),
        endOffset      = C.endOffset      or vec3(-0.45, -2.0, 1.15),
        focusZ         = C.focusZ         or 0.40,
        fov            = C.fov            or 50.0,
        interpIn       = C.interpIn       or 400,
        interpOut      = C.interpOut      or 350,
    }
end

local function destroyCam(soft)
    if not camActive then return end
    local C = camCfg()
    local dur = soft and (C.interpOut or 350) or 0
    RenderScriptCams(false, true, dur, true, true, true)
    if camHandle then
        DestroyCam(camHandle, false)
        camHandle = nil
    end
    camActive = false
    camTargetUpdater = nil
end

local function makeCamAtEntityOffset(baseEnt, off, focusEntOrPos)
    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    local pos = GetOffsetFromEntityInWorldCoords(baseEnt, off.x, off.y, off.z)
    SetCamCoord(cam, pos.x, pos.y, pos.z)
    SetCamFov(cam, (camCfg().fov or 50.0) + 0.0)
    SetCamRot(cam, 0.0, 0.0, GetEntityHeading(baseEnt), 2)
    if type(focusEntOrPos) == 'vector3' then
        PointCamAtCoord(cam, focusEntOrPos.x, focusEntOrPos.y, focusEntOrPos.z)
    elseif focusEntOrPos and DoesEntityExist(focusEntOrPos) then
        PointCamAtEntity(cam, focusEntOrPos, 0.0, 0.0, 0.0, true)
    end
    return cam
end

local function startOpenCam()
    local C = camCfg()
    if not C.enabled then return end
    if not vehicleEntity or vehicleEntity == 0 or not DoesEntityExist(vehicleEntity) then return end
    ensureCrate()
    if not crateEntity or not DoesEntityExist(crateEntity) then return end
    local focusPos = GetOffsetFromEntityInWorldCoords(crateEntity, 0.0, 0.0, C.focusZ or 0.40)
    local baseEntStart
    if (C.startFrom or 'player') == 'player' then
        baseEntStart = PlayerPedId()
    else
        baseEntStart = vehicleEntity
    end
    local startOff = (C.startFrom == 'van') and (C.startOffsetVan or vec3(-2.2,-3.0,1.0)) or (C.startOffset or vec3(0.0,-1.6,0.9))
    local endOff   = C.endOffset or vec3(-0.45,-2.0,1.15)
    local camFrom = makeCamAtEntityOffset(baseEntStart, startOff, focusPos)
    local camTo   = makeCamAtEntityOffset(vehicleEntity,   endOff,   focusPos)
    RenderScriptCams(true, false, 0, true, true)
    SetCamActive(camFrom, true)
    SetCamActiveWithInterp(camTo, camFrom, C.interpIn or 400, true, true)
    camHandle = camTo
    camActive = true
    camTargetUpdater = true
    CreateThread(function()
        local killAfter = GetGameTimer() + (C.interpIn or 400) + 60
        while camTargetUpdater and camActive and camHandle do
            PointCamAtCoord(camHandle, focusPos.x, focusPos.y, focusPos.z)
            Wait(0)
            if GetGameTimer() > killAfter and camFrom then
                DestroyCam(camFrom, false)
                camFrom = nil
            end
        end
        if camFrom then DestroyCam(camFrom, false) end
    end)
end

local function retargetCamToWeapon()
    if not camActive or not camHandle then return end
    if weaponEntity and DoesEntityExist(weaponEntity) then
        PointCamAtEntity(camHandle, weaponEntity, 0.0, 0.0, 0.0, true)
    end
end

local function clearWeapon()
    bobThreadActive  = false
    spinThreadActive = false
    if weaponEntity and DoesEntityExist(weaponEntity) then
        ResetEntityAlpha(weaponEntity)
        DeleteEntity(weaponEntity)
    end
    weaponEntity = nil
end

local function setPreviewWeaponFromItem(item)
    clearWeapon()
    if not item or not item.model or item.model == '' then
        return
    end
    ensureCrate()
    if not (crateEntity and DoesEntityExist(crateEntity)) then return end
    local wHash = tryLoadModel(item.model)
    if not wHash then return end
    weaponEntity = CreateObject(wHash, 0.0, 0.0, 0.0, false, false, false)
    SetEntityAsMissionEntity(weaponEntity, true, true)
    SetEntityCollision(weaponEntity, false, false)
    local z = item.z or {}
    local baseZ  = tonumber(z.base)  or 0.38
    local depth  = tonumber(z.depth) or 0.18
    local amp    = tonumber(z.amp)   or 0.06
    local freq   = tonumber(z.freq)  or 0.50
    currentBaseZ = baseZ
    local startZ = baseZ - depth
    local riseDurMs = 500
    local startTime = GetGameTimer()
    SetEntityAlpha(weaponEntity, 0, false)
    AttachEntityToEntity(weaponEntity, crateEntity, -1, 0.0, 0.0, startZ, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
    FreezeEntityPosition(weaponEntity, true)
    retargetCamToWeapon()
    CreateThread(function()
        while weaponEntity and DoesEntityExist(weaponEntity) do
            local now = GetGameTimer()
            local t = (now - startTime) / riseDurMs
            if t >= 1.0 then
                AttachEntityToEntity(weaponEntity, crateEntity, -1, 0.0, 0.0, baseZ, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                SetEntityAlpha(weaponEntity, 255, false)
                spinWeapon()
                startBobbing({ baseZ = baseZ, freq = freq, amp = amp })
                break
            end
            local tt = smoothstep01(t)
            local zt = startZ + (baseZ - startZ) * tt
            local alpha = math.floor(255 * tt)
            AttachEntityToEntity(weaponEntity, crateEntity, -1, 0.0, 0.0, zt, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
            SetEntityAlpha(weaponEntity, alpha, false)
            Wait(0)
        end
    end)
end

local function AttachPedBackFacing(ped, veh)
    if not (DoesEntityExist(ped) and DoesEntityExist(veh)) then return end
    if IsPedInVehicle(ped, veh, false) then
        TaskLeaveVehicle(ped, veh, 256)
        local t = GetGameTimer() + 3000
        while GetGameTimer() < t and IsPedInVehicle(ped, veh, false) do
            Wait(50)
        end
    end
    local cfg   = Config.PedBackAttach or {}
    local off   = cfg.offset or vec3(0.0, -2.0, 0.55)
    local rot   = cfg.rot or vec3(0.0, 0.0, 180.0)
    local bone  = -1
    if cfg.boneName then
        local idx = GetEntityBoneIndexByName(veh, cfg.boneName)
        if idx ~= -1 then bone = idx end
    end
    ClearPedTasksImmediately(ped)
    SetEntityAsMissionEntity(ped, true, true)
    SetPedCanRagdoll(ped, false)
    SetEntityCollision(ped, true, true)
    FreezeEntityPosition(ped, false)
    AttachEntityToEntity(ped, veh, bone, off.x, off.y, off.z, rot.x, rot.y, rot.z, false, false, false, false, 2, true)
    local a = Config.PedSitAnim or { dict = "amb@prop_human_seat_chair@male@generic@idle_a", name = "idle_a", flag = 49 }
    if loadAnimDict(a.dict) then
        TaskPlayAnim(ped, a.dict, a.name, 8.0, -8.0, -1, a.flag or 49, 0.0, false, false, false)
    end
    local min, _ = GetModelDimensions(GetEntityModel(veh))
    local rearWorld = GetOffsetFromEntityInWorldCoords(veh, 0.0, min.y - 0.5, 0.6)
    TaskLookAtCoord(ped, rearWorld.x, rearWorld.y, rearWorld.z, -1, 0, 2)
end

local function openBlackMarket()
    if isUiOpen then return end
    hideText()
    SendNUIMessage({
        action = 'open',
        items = (cachedData and cachedData.items) or {},
        currency = (cachedData and cachedData.currency) or Config.CurrencyItem
    })
    SetNuiFocus(true, true)
    isUiOpen = true
    startOpenCam()
end

RegisterNetEvent(TARGET_EVENT)
AddEventHandler(TARGET_EVENT, function()
    openBlackMarket()
end)

local function registerOxTarget(entity, bones, distance, label, icon)
    local ox = exports and exports.ox_target
    if not ox then
        return false, nil, 'ox_target exports unavailable'
    end
    if not (entity and DoesEntityExist(entity)) then
        return false, nil, 'ox_target entity missing'
    end

    local options = {{
        name = TARGET_OPTION,
        icon = icon,
        label = label,
        distance = distance,
        onSelect = function()
            openBlackMarket()
        end,
        bones = bones
    }}

    if ox.addLocalEntity then
        local ok, result = pcall(function()
            return ox:addLocalEntity(entity, options)
        end)
        if ok then
            return true, { resource = 'ox_target', entity = entity, id = result, method = 'local' }
        else
            return false, nil, result
        end
    end

    if ox.addEntity then
        local ok, result = pcall(function()
            return ox:addEntity(entity, options)
        end)
        if ok then
            return true, { resource = 'ox_target', entity = entity, id = result, method = 'entity' }
        else
            return false, nil, result
        end
    end

    return false, nil, 'no compatible ox_target export (expected addLocalEntity or addEntity)'
end

local function registerQbTarget(entity, bones, distance, label, icon)
    if not exports or not exports['qb-target'] then
        return false, nil, 'qb-target exports unavailable'
    end
    if not (entity and DoesEntityExist(entity)) then
        return false, nil, 'qb-target entity missing'
    end
    local ok, err = pcall(function()
        exports['qb-target']:AddTargetEntity(entity, {
            options = {{
                icon = icon,
                label = label,
                event = TARGET_EVENT,
                type = 'client',
                bones = bones
            }},
            bones = bones,
            distance = distance
        })
    end)
    if ok then
        return true, { resource = 'qb-target', entity = entity, method = 'entity' }, nil
    end
    return false, nil, err
end

local function buildInteraction(data)
    clearInteraction()
    local coords = data and data.coords or nil
    local ped = data and data.ped or pedEntity
    local vehicle = data and data.vehicle or vehicleEntity

    local mode, resource = resolveInteractionMode()
    currentInteractionMode = mode

    if mode == 'target' then
        local entity = nil
        if vehicle and DoesEntityExist(vehicle) then
            entity = vehicle
        elseif ped and DoesEntityExist(ped) then
            entity = ped
        end

        if entity then
            local distance = Config.InteractDistance or 2.5
            local label = getTargetLabel()
            local icon = getTargetIcon()
            local bones = getTargetBones()

            local success, info, errMsg
            if resource == 'ox_target' then
                success, info, errMsg = registerOxTarget(entity, bones, distance, label, icon)
            elseif resource == 'qb-target' then
                success, info, errMsg = registerQbTarget(entity, bones, distance, label, icon)
            end

            if success and info then
                targetInteraction = info
                warnedTargetFallback = false
                return
            end

            if not warnedTargetFallback then
                warnedTargetFallback = true
            end
        end

        mode = 'textui'
        currentInteractionMode = mode
    end

    if mode ~= 'textui' then return end
    if not coords then return end
    if not lib or not lib.points then return end

    interactionPoint = lib.points.new({
        coords = coords,
        distance = Config.InteractDistance or 2.5,
        onEnter = function()
            if isUiOpen then return end
            showText(('Press [E] to access the %s'):format(locale))
        end,
        onExit = function() hideText() end,
        nearby = function(point)
            if point.distance > (Config.InteractDistance or 2.5) then return end
            if isUiOpen then return end
            if IsControlJustPressed(0, 38) then
                openBlackMarket()
            end
        end
    })
end

local function cleanupScene()
    clearInteraction()
    destroyCam(true)
    doorsThreadActive = false
    bobThreadActive  = false
    spinThreadActive = false
    deleteIfExists(weaponEntity); weaponEntity = nil
    deleteIfExists(crateEntity);  crateEntity  = nil
    deleteIfExists(pedEntity);    pedEntity    = nil
    deleteIfExists(vehicleEntity);vehicleEntity= nil
    hideText()
end

local function spawnEntities(data)
    cleanupScene()
    if type(data) ~= 'table' or not data.coords then return end
    cachedData = data
    local coords = vec3(data.coords.x + 0.0, data.coords.y + 0.0, data.coords.z + 0.0)
    local heading = (data.heading or 0.0) + 0.0
    local vanHash = tryLoadModel(Config.VanModel or 'speedo')
    local pedHash = tryLoadModel(Config.PedModel or 's_m_m_armoured_01')
    if not vanHash or not pedHash then return end
    vehicleEntity = CreateVehicle(vanHash, coords.x, coords.y, coords.z, heading, false, false)
    if vehicleEntity ~= 0 then
        SetEntityAsMissionEntity(vehicleEntity, true, true)
        SetVehicleOnGroundProperly(vehicleEntity)
        lockVehicleForAll(vehicleEntity)
        forceOpenRearDoors(vehicleEntity)
        ensureRearDoorsOpenThread()
        SetVehicleNumberPlateText(vehicleEntity, 'BLACKMK')
        SetEntityInvincible(vehicleEntity, true)
        SetVehicleEngineOn(vehicleEntity, false, false, true)
    end
    local pedSpawn = (vehicleEntity ~= 0) and GetOffsetFromEntityInWorldCoords(vehicleEntity, -1.2, 0.5, 0.0) or coords
    pedEntity = CreatePed(4, pedHash, pedSpawn.x, pedSpawn.y, pedSpawn.z, heading + 90.0, false, true)
    if pedEntity ~= 0 then
        SetEntityAsMissionEntity(pedEntity, true, true)
        SetBlockingOfNonTemporaryEvents(pedEntity, true)
        SetEntityInvincible(pedEntity, true)
        if vehicleEntity ~= 0 then
            AttachPedBackFacing(pedEntity, vehicleEntity)
        else
            FreezeEntityPosition(pedEntity, true)
        end
    end
    SetModelAsNoLongerNeeded(vanHash)
    SetModelAsNoLongerNeeded(pedHash)
    if vehicleEntity ~= 0 then
        ensureCrate()
    end
    buildInteraction({ coords = pedSpawn, ped = pedEntity, vehicle = vehicleEntity })
end

Ev.on('d,-blackmarket:syncLocation', function(data)
    spawnEntities(data)
end)

Ev.on('d,-blackmarket:notify', function(title, message, notifyType)
    notifyType = notifyType or 'inform'
    if lib and lib.notify then
        lib.notify({
            id = ('d-bl-%s'):format(math.random(1000, 9999)),
            title = title,
            description = message,
            type = notifyType
        })
    elseif SD and SD.ShowNotification then
        local payload = message and (title .. '\n' .. message) or title
        SD.ShowNotification(payload, notifyType)
    else
        SetNotificationTextEntry('STRING')
        AddTextComponentSubstringPlayerName(message or title)
        DrawNotification(false, true)
    end
end)

Ev.on('d,-blackmarket:purchaseSuccess', function()
    SendNUIMessage({ action = 'purchaseSuccess' })
end)

local function closeInterface()
    if not isUiOpen then return end
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'close' })
    isUiOpen = false
    destroyCam(true)
    bobThreadActive  = false
    spinThreadActive = false
    deleteIfExists(weaponEntity); weaponEntity = nil
end

RegisterNUICallback('close', function(_, cb)
    closeInterface()
    if currentInteractionMode == 'textui' and interactionPoint and not textVisible then
        showText(('Press [E] to access the %s'):format(locale))
    end
    cb({ status = true })
end)

RegisterNUICallback('hover', function(data, cb)
    local model, name = nil, nil
    if data and type(data) == 'table' then
        model = data.model or data.previewModel or data.prop or nil
        name  = data.name
    end
    if not name and not model then
        bobThreadActive  = false
        spinThreadActive = false
        deleteIfExists(weaponEntity); weaponEntity = nil
        cb({ status = true })
        return
    end
    local item = nil
    if name then item = findItemByName(name) end
    if (not item) and model and cachedData and type(cachedData.items) == 'table' then
        for _, it in ipairs(cachedData.items) do
            if it and it.model == model then item = it; break end
        end
    end
    if not item and model then
        item = { name = name or model, model = model }
    end
    setPreviewWeaponFromItem(item)
    cb({ status = true })
end)

RegisterNUICallback('purchase', function(data, cb)
    if not data or type(data.items) ~= 'table' then
        cb({ status = false }); return
    end
    Ev.emitServer('d,-blackmarket:purchase', { items = data.items })
    cb({ status = true })
end)

CreateThread(function()
    Wait(1000)
    Ev.emitServer('d,-blackmarket:requestLocation')
end)

AddEventHandler('onResourceStart', function(res)
    if res ~= GetCurrentResourceName() then return end
    Ev.emitServer('d,-blackmarket:requestLocation')
end)

AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() then return end
    cleanupScene()
    closeInterface()
end)

-- RegisterCommand('blackmarket', function()
--     Ev.emitServer('d,-blackmarket:requestLocation')
-- end, false)



local isMoving = false


local function unlockForNPC(veh)
    if veh == 0 or not DoesEntityExist(veh) then return end
    SetVehicleDoorsLockedForAllPlayers(veh, true) 
    SetVehicleDoorsLocked(veh, 1)               
end

local function relockForPlayers(veh)
    if veh == 0 or not DoesEntityExist(veh) then return end
    SetVehicleDoorsLocked(veh, 2)
    SetVehicleDoorsLockedForAllPlayers(veh, true)
end

local function openDriverDoor(veh)
    if veh == 0 or not DoesEntityExist(veh) then return end
end



local function closeRearDoors(veh)
    if veh == 0 or not DoesEntityExist(veh) then return end
    for _, idx in ipairs(rearDoorIndices) do
        SetVehicleDoorShut(veh, idx, false)
    end
end

local function ensurePedInDriver(ped, veh, timeoutMs)
    timeoutMs = timeoutMs or 8000
    if IsPedInVehicle(ped, veh, false) and GetPedInVehicleSeat(veh, -1) == ped then return true end
    ClearPedTasksImmediately(ped)
    DetachEntity(ped, true, false)
    TaskEnterVehicle(ped, veh, -1, -1, 2.0, 1, 0)
    local t = GetGameTimer() + timeoutMs
    while GetGameTimer() < t do
        if IsPedInVehicle(ped, veh, false) and GetPedInVehicleSeat(veh, -1) == ped then
            return true
        end
        Wait(100)
    end
    return false
end

local function stopVehicleAt(veh, dest, heading)
    SetDriveTaskCruiseSpeed(veh, 0.0)
    TaskVehicleTempAction(GetPedInVehicleSeat(veh, -1), veh, 27, 1500)
    Wait(500)
    SetEntityCoords(veh, dest.x, dest.y, dest.z, false, false, false, true)
    if heading then SetEntityHeading(veh, heading + 0.0) end
    SetVehicleForwardSpeed(veh, 0.0)
    SetVehicleEngineOn(veh, false, true, true)
end

local function startRelocation(payload)
    if isUiOpen then
        SetNuiFocus(false, false)
        SendNUIMessage({ action = 'close' })
        isUiOpen = false
    end
    clearInteraction()
    hideText()

    isMoving = true
    doorsThreadActive = false
    bobThreadActive  = false
    spinThreadActive = false
    if weaponEntity then deleteIfExists(weaponEntity); weaponEntity = nil end
    if crateEntity  then deleteIfExists(crateEntity);  crateEntity  = nil end

    local to = payload and payload.to or nil
    if not to then
        Ev.emitServer('d,-blackmarket:requestLocation')
        isMoving = false
        return
    end

    if not (vehicleEntity and DoesEntityExist(vehicleEntity)) or not (pedEntity and DoesEntityExist(pedEntity)) then
        spawnEntities({
            coords   = to.coords,
            heading  = to.heading,
            items    = payload.items,
            currency = payload.currency,
            previewModel = payload.previewModel
        })
        isMoving = false
        return
    end

closeRearDoors(vehicleEntity)
SetVehicleEngineOn(vehicleEntity, true, true, true)

unlockForNPC(vehicleEntity)
-- openDriverDoor(vehicleEntity)

local ok = ensurePedInDriver(pedEntity, vehicleEntity, 9000)
    if not ok then
        stopVehicleAt(vehicleEntity, to.coords, to.heading)
    else
        local speed = 22.0
        local style = 786603 
        TaskVehicleDriveToCoordLongrange(pedEntity, vehicleEntity, to.coords.x + 0.0, to.coords.y + 0.0, to.coords.z + 0.0, speed, style, 12.0)

        local maxTime = GetGameTimer() + 120000 
        while DoesEntityExist(vehicleEntity) do
            local vpos = GetEntityCoords(vehicleEntity)
            local dist = #(vpos - vec3(to.coords.x, to.coords.y, to.coords.z))
            if dist <= 14.0 then break end
            if GetGameTimer() > maxTime then break end
            closeRearDoors(vehicleEntity)
            SetVehicleDoorsLocked(vehicleEntity, 2)
            SetVehicleDoorsLockedForAllPlayers(vehicleEntity, true)
            Wait(300)
        end

        stopVehicleAt(vehicleEntity, to.coords, to.heading)
    end

    TaskLeaveVehicle(pedEntity, vehicleEntity, 256)
    local t = GetGameTimer() + 5000
    while GetGameTimer() < t and IsPedInVehicle(pedEntity, vehicleEntity, false) do
        Wait(50)
    end

    forceOpenRearDoors(vehicleEntity)
    lockVehicleForAll(vehicleEntity)
    ensureRearDoorsOpenThread()

    cachedData = {
        coords   = to.coords,
        heading  = to.heading,
        items    = payload.items,
        currency = payload.currency,
        previewModel = payload.previewModel
    }

    AttachPedBackFacing(pedEntity, vehicleEntity)
    ensureCrate()
    local pedSpawn = GetOffsetFromEntityInWorldCoords(vehicleEntity, -1.2, 0.5, 0.0)
    buildInteraction({ coords = pedSpawn, ped = pedEntity, vehicle = vehicleEntity })

    isMoving = false
end

Ev.on('d,-blackmarket:relocate', function(payload)
    startRelocation(payload)
end)
