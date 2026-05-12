local animDict = "anim@scripted@player@mission@tunf_train_ig1_container_p1@male@"
local selectedDrop = vector4(0, 0, 0, 0)
local testobj = ''
local crate = ''
local WaitingForSpawn = false
local lockZoneId = 0
local activeLootZones = {}
local MODEL_LOAD_TIMEOUT = 10000
local RegisteredDoors = {}
local entityEnumerator = {
    __gc = function(enum)
        if enum.handle then
            EndFindPed(enum.handle)
            enum.handle = nil
        end
    end
}


local function spawnObject(model, coords)
    local propHash = type(model) == 'string' and joaat(model) or model
    if not loadModel(propHash) then
        return nil
    end

    RequestCollisionAtCoord(coords.x, coords.y, coords.z)
    local object = CreateObjectNoOffset(propHash, coords.x, coords.y, coords.z, true, true, false)
    local timeout = GetGameTimer() + 5000

    while object == 0 or not DoesEntityExist(object) do
        Wait(10)
        if GetGameTimer() > timeout then
            SetModelAsNoLongerNeeded(propHash)
            return nil
        end
    end

    SetEntityAsMissionEntity(object, true, true)
    SetEntityHeading(object, coords.w)
    FreezeEntityPosition(object, true)
    SetEntityCollision(object, true, true)
    NetworkRegisterEntityAsNetworked(object)

    local netId = NetworkGetNetworkIdFromEntity(object)
    if netId and netId > 0 then
        SetNetworkIdExistsOnAllMachines(netId, true)
        SetNetworkIdCanMigrate(netId, true)
    end

    SetModelAsNoLongerNeeded(propHash)
    return object
end

local function LinearInterpolate(startValue, endValue, fraction)
    return startValue + (endValue - startValue) * fraction
end

local function spawnContainer(selectedCoords)
    local animDict = "anim@scripted@player@mission@tunf_train_ig1_container_p1@male@"

    local coords = selectedCoords
    loadAnimDict(animDict)

    local container = spawnObject("tr_prop_tr_container_01a", vector4(coords.x, coords.y, coords.z - 1, coords.w - 180))
    if not container then return nil end

    local containerCoords = GetEntityCoords(container)
    local containerRot = GetEntityRotation(container)

    local lockCoords = GetAnimInitialOffsetPosition(animDict, "action_lock", containerCoords, containerRot, 0.0, 0)
    local lock = spawnObject("tr_prop_tr_lock_01a", vector4(lockCoords.x, lockCoords.y, lockCoords.z, coords.w - 180))

    local crateCoords = GetObjectOffsetFromCoords(coords.x, coords.y, coords.z, coords.w, 0.0, -0.6, -0.8)
    local crate = spawnObject("tr_prop_tr_crates_sam_01a", vector4(crateCoords.x, crateCoords.y, crateCoords.z, coords.w + 90))

    local collision = spawnObject("tr_prop_tr_cont_coll_01a", vector4(containerCoords.x, containerCoords.y, containerCoords.z, coords.w - 180))

    if not lock or not crate or not collision then
        if DoesEntityExist(container) then DeleteObject(container) end
        if lock and DoesEntityExist(lock) then DeleteObject(lock) end
        if crate and DoesEntityExist(crate) then DeleteObject(crate) end
        if collision and DoesEntityExist(collision) then DeleteObject(collision) end
        return nil
    end

    SetEntityCoordsNoOffset(lock, lockCoords.x, lockCoords.y, lockCoords.z, false, false, false)
    SetEntityCoordsNoOffset(collision, containerCoords.x, containerCoords.y, containerCoords.z, false, false, false)
    SetEntityCollision(collision, false, false)

    local props = {
        container = container,
        lock = lock,
        collision = collision,
        crate = crate
    }

    return props
end

local function PanCameraToContainerSide(containerCoords)
    local cameraHeightOffset = 2.80 -- Height of the camera from the container
    local lateralOffsetDistance = -2.90 -- Distance to the side of the container

    local radianAngle = math.rad(GetEntityHeading(PlayerPedId()))
    local sideOffsetX = math.cos(radianAngle + math.pi / 2) * lateralOffsetDistance
    local sideOffsetY = math.sin(radianAngle + math.pi / 2) * lateralOffsetDistance

    local cameraCoords = vector3(containerCoords.x + sideOffsetX, containerCoords.y + sideOffsetY,
        containerCoords.z + cameraHeightOffset)

    local camera = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(camera, cameraCoords.x, cameraCoords.y, cameraCoords.z)
    PointCamAtCoord(camera, containerCoords.x, containerCoords.y, containerCoords.z)
    SetCamActive(camera, true)
    RenderScriptCams(true, true, 3500, true, true)
    CreateThread(function()
        Wait(8000) -- Initial delay

        local playerForwardX, playerForwardY = GetEntityForwardX(PlayerPedId()), GetEntityForwardY(PlayerPedId())
        local backwardOffsetDistance = 2.0 -- How far back to move the camera
        local targetX = cameraCoords.x - (playerForwardX * backwardOffsetDistance)
        local targetY = cameraCoords.y - (playerForwardY * backwardOffsetDistance)
        local steps = 100 -- Number of steps for the transition
        local duration = 2000 -- Duration of the movement in milliseconds
        local stepDuration = duration / steps

        for step = 1, steps do
            local newX = LinearInterpolate(cameraCoords.x, targetX, step / steps)
            local newY = LinearInterpolate(cameraCoords.y, targetY, step / steps)
            SetCamCoord(camera, newX, newY, cameraCoords.z)
            Wait(stepDuration)
        end
    end)

    return camera
end

local function doContainerAnim(index, containerNetId, lockNetId, collisionNetId)
    local container = NetworkGetEntityFromNetworkId(containerNetId)
    local lock = NetworkGetEntityFromNetworkId(lockNetId)
    local collision = NetworkGetEntityFromNetworkId(collisionNetId)

    NetworkRequestControlOfEntity(container)
    NetworkRequestControlOfEntity(lock)
    local timer = GetGameTimer()
    while not NetworkHasControlOfEntity(container) or not NetworkHasControlOfEntity(lock) do
        Wait(0)
        if GetGameTimer() - timer > 5000 then
            break
        end
    end

    loadAnimDict(animDict)
    loadPtfx("scr_tn_tr")
    loadAudio("dlc_tuner/dlc_tuner_generic")

    local grinderHash = GetHashKey("tr_prop_tr_grinder_01a")
    local bagHash = GetHashKey("hei_p_m_bag_var22_arm_s")
    loadModel(grinderHash)
    loadModel(bagHash)

    local ped = PlayerPedId()
    local containerCoords = GetEntityCoords(container)
    local containerRot = GetEntityRotation(container)
    local playerCoords = GetEntityCoords(ped)
    local grinder = CreateObject(grinderHash, playerCoords, true, true, false)
    local bag = CreateObject(bagHash, playerCoords, true, true, false)
    SetEntityCollision(bag, false, false)

    FreezeEntityPosition(ped, true)

    local containerScene = NetworkCreateSynchronisedScene(containerCoords, containerRot, 2, true, false, 1.0, 0.0, 1.0)
    NetworkAddPedToSynchronisedScene(ped, containerScene, animDict, "action", 10.0, 10.0, 0, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(lock, containerScene, animDict, "action_lock", 2.0, -4.0, 134149)
    NetworkAddEntityToSynchronisedScene(grinder, containerScene, animDict, "action_angle_grinder", 2.0, -4.0, 134149)
    NetworkAddEntityToSynchronisedScene(bag, containerScene, animDict, "action_bag", 2.0, -4.0, 134149)
    NetworkStartSynchronisedScene(containerScene)

    local camera = PanCameraToContainerSide(containerCoords)

    PlayEntityAnim(container, "action_container", animDict, 8.0, false, true, false, 0, 0)

    CreateThread(function()
        while NetworkGetLocalSceneFromNetworkId(containerScene) == -1 do
            Wait(0)
        end
        local localScene = NetworkGetLocalSceneFromNetworkId(containerScene)
        local ptfx

        while IsSynchronizedSceneRunning(localScene) do
            if HasAnimEventFired(ped, -1953940906) then
                UseParticleFxAsset("scr_tn_tr")
                ptfx = StartNetworkedParticleFxLoopedOnEntity("scr_tn_tr_angle_grinder_sparks", grinder, 0.0, 0.25, 0.0,
                    0.0, 0.0, 0.0, 1.0, false, false, false, 1065353216, 1065353216, 1065353216, 1)
            elseif HasAnimEventFired(ped, -258875766) then
                StopParticleFxLooped(ptfx, false)
            end
            Wait(0)
        end
    end)

    Wait(GetAnimDuration(animDict, "action_container") * 1000)

    RenderScriptCams(0, 1, 1000, true, true)
    DestroyCam(camera, false)

    FreezeEntityPosition(ped, false)
    NetworkStopSynchronisedScene(containerScene)

    DeleteObject(grinder)
    DeleteObject(lock)
    DeleteObject(bag)
    ClearPedTasks(ped)

    -- local container = NetworkGetEntityFromNetworkId(containerNetId)
    -- local collision = NetworkGetEntityFromNetworkId(collisionNetId)
    -- SetEntityCollision(collision, true, true)
    -- SetEntityCompletelyDisableCollision(container, false, false)

    TriggerServerEvent("storm-merryweather:openContainerCl", index)

    DisposeSynchronizedScene(containerScene)
    RemoveNamedPtfxAsset("scr_tn_tr")
    ReleaseNamedScriptAudioBank("dlc_tuner/dlc_tuner_generic")
    RemoveAnimDict(animDict)
end

local function AlertCops()
    if copsCalled then return end
    copsCalled = true

    if GetResourceState('cd_dispatch') == 'started' then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = { 'police' },
            coords = vector3(484.2267, -3090.8108, 15.4669),
            title = 'Merryweather Robbery',
            message = 'A ' .. data.sex .. ' robbing Merryweather at ' .. data.street,
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 429,
                scale = 1.2,
                colour = 1,
                flashes = false,
                text = 'Merryweather Robbery',
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

local function RunMinigame(step)
    if Config.TestingMode then
        return true
    end

    local minigames = {
        FirstPower = {
            game = "knobTurning",
            options = {
                time = 10000,
                text = "Set The Fuse"
            }
        },
        SecondPower = {
            game = "knobTurning",
            options = {
                time = 10000,
                text = "Set The Fuse"
            }
        },
        ThirdPower = {
            game = "knobTurning",
            options = {
                time = 10000,
                text = "Set The Fuse"
            }
        },
        HackLaptop = {
            game = "rythmClick",
            options = {
                text = "Hacking The Laptop",
                targetCount = 14,
                interval = 400,
            }
        },
        MainComputer = {
            game = "arrowClicker",
            options = {
                gameCount = 3,
                arrowCount = 6,
                time = 4000,
                text = "Decrypt The Data"
            }
        },
        FinalComputer2FA = {
            game = "lettersFall",
            options = {
                time = 15000,
                text = "Complete 2FA",
                speed = 0.2,
                difficulty = 4
            }
        }
    }

    local data = minigames[step]
    if not data then
        return false
    end
    if exports["prp-minigames"]:IsPlaying() then
        exports["prp-minigames"]:Stop()
        Wait(100)
    end

    local ped = PlayerPedId()

    FreezeEntityPosition(ped, true)

    local success =
        exports["prp-minigames"]:Start(
        data.game,
        data.options,
        {
            cursor = true,
            animation = {
                dict = "anim@heists@prison_heiststation@cop_reactions",
                name = "cop_b_idle",
                flag = 49
            },
            onTick = function()
                DisableAllControlActions(0)
                EnableControlAction(0, 1, true) -- LookLeftRight
                EnableControlAction(0, 2, true) -- LookUpDown
            end
        }
    )

    FreezeEntityPosition(ped, false)
    ClearPedTasks(ped)

    return success == true

end

local function makeDoorHash(doorKey, coords)
    return GetHashKey(('%s:%.3f:%.3f:%.3f'):format(
        doorKey,
        coords.x,
        coords.y,
        coords.z
    ))
end

local function ensureDoorRegistered(doorKey, doorData)
    if not doorData or not doorData.coords or not doorData.model then
        return nil
    end

    local coords = doorData.coords
    local model = doorData.model

    if RegisteredDoors[doorKey] then
        return RegisteredDoors[doorKey]
    end

    local existingDoor = DoorSystemFindExistingDoor(coords.x, coords.y, coords.z, model)
    if existingDoor and existingDoor ~= 0 then
        RegisteredDoors[doorKey] = existingDoor
        return existingDoor
    end

    local doorHash = makeDoorHash(doorKey, coords)

    AddDoorToSystem(
        doorHash,
        model,
        coords.x,
        coords.y,
        coords.z,
        false,
        false,
        false
    )

    local timeout = GetGameTimer() + 5000
    while not DoorSystemGetIsPhysicsLoaded(doorHash) do
        if GetGameTimer() > timeout then
            break
        end
        Wait(0)
    end

    RegisteredDoors[doorKey] = doorHash
    return doorHash
end

RegisterNetEvent('storm-merryweather:client:setDoorLocked', function(doorKey, doorData, locked)
    local doorHash = ensureDoorRegistered(doorKey, doorData)
    if not doorHash then return end

    local timeout = GetGameTimer() + 5000
    while not DoorSystemGetIsPhysicsLoaded(doorHash) do
        if GetGameTimer() > timeout then
            break
        end
        Wait(0)
    end

    DoorSystemSetOpenRatio(doorHash, 0.0, true, true)
    DoorSystemSetDoorState(doorHash, locked and 1 or 0, true, true)
end)

local function requestDoorSync()
    TriggerServerEvent('storm-merryweather:server:requestDoorSync')
end

AddEventHandler('onClientResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    CreateThread(function()
        Wait(2000)
        requestDoorSync()
    end)
end)

function loadAnimDict(dict)
    if HasAnimDictLoaded(dict) then
        return
    end
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end

function loadModel(model)
    if not IsModelValid(model) then
        return false
    end

    if HasModelLoaded(model) then
        return true
    end

    RequestModel(model)
    local timeout = GetGameTimer() + MODEL_LOAD_TIMEOUT

    while not HasModelLoaded(model) do
        Wait(10)
        if GetGameTimer() > timeout then
            return false
        end
    end

    return true
end

function loadPtfx(dict)
    if HasNamedPtfxAssetLoaded(dict) then
        return
    end
    RequestNamedPtfxAsset(dict)
    while not HasNamedPtfxAssetLoaded(dict) do
        Wait(10)
    end
end

function loadAudio(audioBank)
    if RequestScriptAudioBank(audioBank, false, -1) then
        return
    end
    while not RequestScriptAudioBank(audioBank, false, -1) do
        Wait(10)
    end
end

function GetClosestPedInRange(coords, range)
    local closestPed
    local closestDistance = range
    for ped in EnumeratePeds() do
        local pedCoords = GetEntityCoords(ped)
        local distance = #(coords - pedCoords)
        if distance < closestDistance and ped ~= PlayerPedId() and not IsPedAPlayer(ped) then
            closestPed = ped
            closestDistance = distance
        end
    end
    return closestPed
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateEntities(initFunc, nextFunc, endFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
            endFunc(iter)
            return
        end
        local enum = {
            handle = iter,
            id = id
        }
        setmetatable(enum, entityEnumerator)
        local next = true
        repeat
            coroutine.yield(enum.id)
            next, enum.id = nextFunc(enum.handle)
        until not next
        endFunc(enum.handle)
    end)
end

Citizen.CreateThread(function()

    exports.ox_target:addBoxZone({
        coords = vector3(
            Config.Coords.firstPower.x,
            Config.Coords.firstPower.y,
            Config.Coords.firstPower.z
        ),
        size = vec3(2, 2, 2),
        rotation = Config.Coords.firstPower.w,
        options = {{
            name = 'storm-merryweather:blowOutDoorPower',
            icon = 'fas fa-bomb',
            label = 'Blow The Power',
            canInteract = function(entity, distance, coords, name, bone)
                return distance <= 2.5
            end,
            onSelect = function(entity, distance, coords, name, bone)
                TriggerServerEvent('storm-merryweather:startPower', 'firstPower')
            end
        }}
    })

    exports.ox_target:addBoxZone({
        coords = vector3(
            Config.Coords.secondPower.x,
            Config.Coords.secondPower.y,
            Config.Coords.secondPower.z
        ),
        size = vec3(2, 2, 2),
        rotation = Config.Coords.secondPower.w,
        options = {{
            name = 'storm-merryweather:blowOutDoorPower',
            icon = 'fas fa-bomb',
            label = 'Blow The Power',
            canInteract = function(entity, distance, coords, name, bone)
                return distance <= 2.5
            end,
            onSelect = function(entity, distance, coords, name, bone)
                TriggerServerEvent('storm-merryweather:startPower', 'secondPower')
            end
        }}
    })

    exports.ox_target:addBoxZone({
        coords = vector3(Config.Coords.firstSwipe.x, Config.Coords.firstSwipe.y,
            Config.Coords.firstSwipe.z + 0.9),
        size = vec3(2, 2, 2),
        rotation = Config.Coords.firstSwipe.w,
        options = {{
            name = 'storm-merryweather:swipeDoor',
            icon = 'fas fa-door-open',
            label = 'Swipe Door',
            canInteract = function(entity, distance, coords, name, bone)
                return distance <= 1.5
            end,
            onSelect = function(entity, distance, coords, name, bone)
                TriggerServerEvent('storm-merryweather:firstSwipe')
            end
        }}
    })

    exports.ox_target:addBoxZone({
        coords = vector3(Config.Coords.firstLaptop.x, Config.Coords.firstLaptop.y,
            Config.Coords.firstLaptop.z),
        size = vec3(2, 2, 2),
        rotation = Config.Coords.firstLaptop.w,
        options = {{
            name = 'storm-merryweather:hackLaptop',
            icon = 'fas fa-laptop',
            label = 'Hack Laptop',
            canInteract = function(entity, distance, coords, name, bone)
                return distance <= 1.5
            end,
            onSelect = function(entity, distance, coords, name, bone)
                TriggerServerEvent('storm-merryweather:startFirstLaptop')
            end
        }}
    })

    exports.ox_target:addBoxZone({
        coords = vector3(Config.Coords.printer.x, Config.Coords.printer.y,
            Config.Coords.printer.z),
        size = vec3(2, 2, 2),
        rotation = Config.Coords.printer.w,
        options = {{
            name = 'storm-merryweather:examinePrinter',
            icon = 'fas fa-print',
            label = 'Examine Printer',
            canInteract = function(entity, distance, coords, name, bone)
                return distance <= 1.5
            end,
            onSelect = function(entity, distance, coords, name, bone)
                TriggerServerEvent('storm-merryweather:examinePrinter')
            end
        }}
    })

    exports.ox_target:addBoxZone({
        coords = vector3(Config.Coords.thirdPower.x, Config.Coords.thirdPower.y,
            Config.Coords.thirdPower.z),
        size = vec3(2, 2, 2),
        rotation = Config.Coords.thirdPower.w,
        options = {{
            name = 'storm-merryweather:blowOutDoorPower',
            icon = 'fas fa-bomb',
            label = 'Blow The Power',
            canInteract = function(entity, distance, coords, name, bone)
                return distance <= 1.5
            end,
            onSelect = function(entity, distance, coords, name, bone)
                TriggerServerEvent('storm-merryweather:thirdPower')
            end
        }}
    })

    exports.ox_target:addBoxZone({
        coords = vector3(Config.Coords.firstComputer.x, Config.Coords.firstComputer.y,
            Config.Coords.firstComputer.z),
        size = vec3(2, 2, 2),
        rotation = Config.Coords.firstComputer.w,
        options = {{
            name = '',
            icon = 'fas fa-users',
            label = 'Decrypt Data',
            canInteract = function(entity, distance, coords, name, bone)
                return distance <= 1.5
            end,
            onSelect = function(entity, distance, coords, name, bone)
                TriggerServerEvent('storm-merryweather:mainComputers', 'firstComputer')
            end
        }}
    })

    exports.ox_target:addBoxZone({
        coords = vector3(Config.Coords.secondComputer.x, Config.Coords.secondComputer.y,
            Config.Coords.secondComputer.z),
        size = vec3(2, 2, 2),
        rotation = Config.Coords.secondComputer.w,
        options = {{
            name = 'storm-merryweather:spawnMainPeds',
            icon = 'fas fa-users',
            label = 'Decrypt Data',
            canInteract = function(entity, distance, coords, name, bone)
                return distance <= 1.5
            end,
            onSelect = function(entity, distance, coords, name, bone)
                TriggerServerEvent('storm-merryweather:mainComputers', 'secondComputer')
            end
        }}
    })

    exports.ox_target:addBoxZone({
        coords = vec3(
            Config.Coords.employeeSwipe.x,
            Config.Coords.employeeSwipe.y,
            Config.Coords.employeeSwipe.z
        ),
        size = vec3(1.2, 1.2, 1.8),
        rotation = Config.Coords.employeeSwipe.w,
        debug = false,
        drawSprite = true,
        options = {{
            name = 'storm-merryweather:employeeSwipe',
            icon = 'fas fa-id-card',
            label = 'Swipe Card',
            distance = 1.5,
            canInteract = function(entity, distance, coords, name, bone)
                return distance <= 1.5
            end,
            onSelect = function(data)
                TriggerServerEvent('storm-merryweather:employeeSwipe')
            end
        }}
    })

    exports.ox_target:addBoxZone({
        coords = vector3(Config.Coords.finalComputer.x, Config.Coords.finalComputer.y,
            Config.Coords.finalComputer.z),
        size = vec3(2, 2, 2),
        rotation = Config.Coords.finalComputer.w,
        options = {{
            name = 'storm-merryweather:spawnMainPeds',
            icon = 'fas fa-users',
            label = 'Get Shipment Data',
            canInteract = function(entity, distance, coords, name, bone)
                return distance <= 1.5
            end,
            onSelect = function(entity, distance, coords, name, bone)
                TriggerServerEvent('storm-merryweather:finalComputer')
            end
        }}
    })

    exports.ox_target:addModel({
        GetHashKey('s_m_m_marine_01'),
        GetHashKey('s_m_y_marine_01'),
        GetHashKey('s_m_y_marine_03')
        }, {
        name = 'storm-merryweather:robTarget',
        icon = 'fa-solid fa-magnifying-glass-dollar',
        label = 'Search Guard',
        distance = 1.5,
        onSelect = function(data)
            local ped = data.entity
            if not DoesEntityExist(ped) then return end

            local model = GetEntityModel(ped)

            local isDead = IsPedDeadOrDying(ped, true)
            local isSurrendered =
                IsEntityPlayingAnim(ped, "amb@code_human_cower_stand@male@base", "base", 3) or
                IsEntityPlayingAnim(ped, "amb@code_human_cower@male@base", "base", 3) or
                IsEntityPlayingAnim(ped, "random@arrests@busted", "idle_a", 3) or
                IsEntityPlayingAnim(ped, "mp_arresting", "idle", 3) or
                IsEntityPlayingAnim(ped, "random@mugging3", "handsup_standing_base", 3) or
                IsEntityPlayingAnim(ped, "missfbi5ig_22", "hands_up_anxious_scientist", 3) or
                IsEntityPlayingAnim(ped, "missfbi5ig_22", "hands_up_loop_scientist", 3) or
                IsEntityPlayingAnim(ped, "missminuteman_1ig_2", "handsup_base", 3)

            if (not isDead and not isSurrendered) or IsPedFleeing(ped) then
                lib.notify({
                    description = 'You cannot search this guard right now.',
                    type = 'error'
                })
                return
            end

            Citizen.CreateThread(function()
                RequestAnimDict("anim@gangops@facility@servers@bodysearch@")
                while not HasAnimDictLoaded("anim@gangops@facility@servers@bodysearch@") do
                    Citizen.Wait(4)
                end
                TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@", "player_search", 8.0, -8, -1, 16, 0, false, false, false)
            end)

            local success = lib.progressCircle({
                duration = 5000,
                position = 'bottom',
                label = 'Searching Guard',
                useWhileDead = false,
                disable = {
                    move = true,
                    car = true,
                    combat = true,
                    mouse = false,
                },
                anim = {
                    dict = 'anim@gangops@facility@servers@bodysearch@',
                    clip = 'player_search',
                }
            })

            ClearPedTasksImmediately(PlayerPedId())

            if not success then return end
            if not DoesEntityExist(ped) then
                lib.notify({
                    description = 'Are You Seeing Ghosts?',
                    type = 'error'
                }) return
            end

            if model == GetHashKey('s_m_m_marine_01') then
                TriggerServerEvent('storm-merryweather:searchPed')
            else
                TriggerServerEvent('storm-merryweather:robPed')
            end

            NetworkRequestControlOfEntity(ped)
            local timeout = 0
            while not NetworkHasControlOfEntity(ped) and timeout < 50 do
                Wait(0)
                NetworkRequestControlOfEntity(ped)
                timeout = timeout + 1
            end

            SetEntityAsMissionEntity(ped, true, true)
            DeletePed(ped)

            if DoesEntityExist(ped) then
                DeleteEntity(ped)
            end
        end
    })

    exports.ox_inventory:displayMetadata({
        name = 'Name'
    })

end)

RegisterNetEvent('storm-merryweather:dispatchAlert', function()
    AlertCops()
end)

RegisterNetEvent('storm-merryweather:blowPowerMinigame', function(power)
    local coords = vector4(0, 0, 0, 0)

    if power == 'firstPower' then
        coords = Config.Coords.firstPower
    else
        coords = Config.Coords.secondPower
    end

    local step = power == 'firstPower' and "FirstPower" or "SecondPower"
    local ped = PlayerPedId()

    local success = RunMinigame(step)
    if not success then
        lib.notify({
            description = 'You Failed To Place The C4',
            type = 'error',
        })
        return
    end

    SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, false)
    SetEntityHeading(ped, coords.w)
    FreezeEntityPosition(ped, true)

    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") do
        Wait(4)
    end

    RequestModel(GetHashKey("hei_p_m_bag_var22_arm_s"))
    while not HasModelLoaded(GetHashKey("hei_p_m_bag_var22_arm_s")) do
        Wait(4)
    end

    RequestModel(GetHashKey("prop_bomb_01_s"))
    while not HasModelLoaded(GetHashKey("prop_bomb_01_s")) do
        Wait(4)
    end

    local pos = GetEntityCoords(ped)
    local rotation = GetEntityRotation(ped)

    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), pos.x, pos.y, pos.z, true, true, false)
    SetEntityCollision(bag, false, true)

    local scene = NetworkCreateSynchronisedScene(
        coords.x, coords.y, coords.z - 0.8,
        rotation.x, rotation.y, rotation.z,
        2, 0, 0, 1065353216, 0, 1.3
    )

    NetworkAddPedToSynchronisedScene(
        ped, scene,
        "anim@heists@ornate_bank@thermal_charge", "thermal_charge",
        1.5, -4.0, 1, 16, 1148846080, 0
    )

    NetworkAddEntityToSynchronisedScene(
        bag, scene,
        "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge",
        4.0, -8.0, 1
    )

    NetworkStartSynchronisedScene(scene)

    Wait(1500)

    pos = GetEntityCoords(ped)
    local bomb = CreateObject(GetHashKey("prop_bomb_01_s"), pos.x, pos.y, pos.z + 0.2, true, true, false)
    SetEntityCollision(bomb, false, true)

    AttachEntityToEntity(
        bomb, ped, GetPedBoneIndex(ped, 28422),
        0.0, 0.0, 0.0,
        90.0, 180.0, 45.0,
        true, true, false, true, 1, true
    )

    local done = lib.progressCircle({
        duration = 3500,
        label = 'Placing C4',
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true
        }
    })

    if not done then
        NetworkStopSynchronisedScene(scene)

        if DoesEntityExist(bag) then
            DeleteObject(bag)
        end

        if DoesEntityExist(bomb) then
            DetachEntity(bomb, true, true)
            DeleteEntity(bomb)
        end

        ClearPedTasks(ped)
        FreezeEntityPosition(ped, false)

        lib.notify({
            description = 'You canceled placing the C4',
            type = 'error',
        })
        return
    end

    if DoesEntityExist(bag) then
        DeleteObject(bag)
    end

    DetachEntity(bomb, true, true)
    FreezeEntityPosition(bomb, true)
    SetEntityCollision(bomb, false, true)

    NetworkStopSynchronisedScene(scene)
    ClearPedTasksImmediately(ped)
    FreezeEntityPosition(ped, false)

    Wait(3500)

    if DoesEntityExist(bomb) then
        DeleteEntity(bomb)
    end

    AddExplosion(coords.x, coords.y, coords.z, 2, 1.0, true, false, 1.0)
    TriggerServerEvent('storm-merryweather:successfulPower', power)
end)

RegisterNetEvent('storm-merryweather:callInTheBackup', function()
    local drivingStyle = 262719
    local playerPed = PlayerPedId()
    local playerGroup = GetPedRelationshipGroupHash(playerPed)

    AddRelationshipGroup('MERRYWEATHER_BACKUP')
    local backupGroup = GetHashKey('MERRYWEATHER_BACKUP')

    SetRelationshipBetweenGroups(0, backupGroup, backupGroup)
    SetRelationshipBetweenGroups(5, backupGroup, playerGroup)
    SetRelationshipBetweenGroups(5, playerGroup, backupGroup)

    local spawnedPeds = {}

    RequestModel(joaat('mesa3'))
    while not HasModelLoaded(joaat('mesa3')) do
        Wait(100)
    end

    for _, car in pairs(Config.Backup.cars) do
        Wait(7000)

        RequestModel(joaat(car.pedModel))
        while not HasModelLoaded(joaat(car.pedModel)) do
            Wait(100)
        end

        local vehicle = CreateVehicle(joaat('mesa3'), car.coords.x, car.coords.y, car.coords.z, car.coords.w, true, false)
        SetVehicleOnGroundProperly(vehicle)
        SetVehicleNumberPlateText(vehicle, ('MERRY%03d'):format(math.random(0, 999)))
        SetVehicleColours(vehicle, 12, 12)
        SetVehicleEngineOn(vehicle, true, true, false)
        SetVehicleDoorsLocked(vehicle, 2)

        for seat = -1, 2 do
            local ped = CreatePedInsideVehicle(vehicle, 4, joaat(car.pedModel), seat, true, false)
            Wait(100)

            spawnedPeds[#spawnedPeds + 1] = ped

            SetPedRelationshipGroupDefaultHash(ped, backupGroup)
            SetPedRelationshipGroupHash(ped, backupGroup)
            SetRelationshipBetweenGroups(0, backupGroup, backupGroup)
            SetCanAttackFriendly(ped, false, true)

            SetPedCombatAttributes(ped, 0, true)
            SetPedCombatAttributes(ped, 5, true)
            SetPedFleeAttributes(ped, 0, false)
            SetPedAccuracy(ped, 25)
            SetPedDropsWeaponsWhenDead(ped, false)

            GiveWeaponToPed(ped, joaat(car.weapon), 2000, false, true)

            if seat == -1 then
                TaskVehicleDriveToCoordLongrange(
                    ped,
                    vehicle,
                    Config.Backup.destination.x,
                    Config.Backup.destination.y,
                    Config.Backup.destination.z,
                    15.0,
                    447,
                    drivingStyle
                )
            else
                TaskCombatPed(ped, playerPed, 0, 16)
            end
        end

        SetModelAsNoLongerNeeded(joaat(car.pedModel))

        CreateThread(function()
            local reachedDestination = false

            while DoesEntityExist(vehicle) and not reachedDestination do
                Wait(1000)

                local vehiclePos = GetEntityCoords(vehicle)
                local distanceToDestination = #(vehiclePos - Config.Backup.destination)

                if distanceToDestination <= 25.0 then
                    reachedDestination = true

                    for seat = -1, 2 do
                        local ped = GetPedInVehicleSeat(vehicle, seat)
                        if ped ~= 0 then
                            TaskLeaveVehicle(ped, vehicle, 256)

                            if not IsEntityDead(PlayerPedId()) then
                                Wait(500)
                                TaskCombatPed(ped, PlayerPedId(), 0, 16)
                            end
                        end
                    end
                end
            end
        end)
    end

    SetModelAsNoLongerNeeded(joaat('mesa3'))

    CreateThread(function()
        while true do
            Wait(1000)

            local currentPlayerPed = PlayerPedId()
            if IsEntityDead(currentPlayerPed) then
                for i = 1, #spawnedPeds do
                    local ped = spawnedPeds[i]
                    if DoesEntityExist(ped) and not IsEntityDead(ped) then
                        ClearPedTasks(ped)
                        ClearPedSecondaryTask(ped)
                        TaskWanderStandard(ped, 10.0, 10)
                    end
                end
                break
            end
        end
    end)
end)

RegisterNetEvent('storm-merryweather:firstSwipe', function()
    local ped = PlayerPedId()

    RequestAnimDict('mp_fbi_heist')
    while not HasAnimDictLoaded('mp_fbi_heist') do
        Wait(100)
    end

    RequestModel(joaat('vw_prop_vw_key_card_01a'))
    while not HasModelLoaded(joaat('vw_prop_vw_key_card_01a')) do
        Wait(100)
    end

    local card = CreateObject(joaat('vw_prop_vw_key_card_01a'), 0.0, 0.0, 0.0, true, true, true)

    AttachEntityToEntity(
        card,
        ped,
        GetPedBoneIndex(ped, 57005),
        0.16, 0.05, -0.01,
        0.0, 0.0, 0.0,
        true, true, false, true, 1, true
    )

    TaskPlayAnim(ped, 'mp_fbi_heist', 'card_swipe', 8.0, -8.0, -1, 16, 0, false, false, false)

    local done = lib.progressCircle({
        duration = 3000,
        label = 'Swiping Card',
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = false,
            mouse = false,
            combat = true
        }
    })

    StopAnimTask(ped, 'mp_fbi_heist', 'card_swipe', 1.0)

    if DoesEntityExist(card) then
        DetachEntity(card, true, true)
        DeleteEntity(card)
    end

    SetModelAsNoLongerNeeded(joaat('vw_prop_vw_key_card_01a'))

    if not done then
        return
    end

    TriggerServerEvent('storm-merryweather:successfulSwipe', 'firstSwipe')
end)

RegisterNetEvent('storm-merryweather:hackLaptop', function()
    ExecuteCommand('e type')

    local success = RunMinigame("HackLaptop")

    if not success then
        ExecuteCommand('e c')
        lib.notify({
            description = 'You failed to hack the laptop',
            type = 'error'
        })
        return
    end

    exports['xsound']:PlayUrlPos(
        'merryweather',
        'https://www.youtube.com/watch?v=ZQTvcZH76Fk',
        1.0,
        vector3(563.73, -3120.45, 17.93),
        false
    )

    local done = lib.progressCircle({
        duration = 2500,
        label = 'Printing Employee Information',
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true
        }
    })

    ExecuteCommand('e c')

    if not done then
        return
    end

    TriggerServerEvent('storm-merryweather:successfulFirstLaptop')
end)

RegisterNetEvent('storm-merryweather:showPrinterClue', function(data)
    if not data then return end

    local info = table.concat({
        ('**Employee Name:** %s'):format(tostring(data.employee or 'Unknown')),
        '',
        ('**PIN:** %s'):format(tostring(data.pin or 'Unknown'))
        }, '\n')

    lib.alertDialog({
        header = 'Employee Credentials',
        content = info,
        centered = true,
        cancel = false
    })
end)

RegisterNetEvent('storm-merryweather:thirdPower', function()
    local ped = PlayerPedId()
    local coords = Config.Coords.thirdPower

    local success = RunMinigame("ThirdPower")
    if not success then
        lib.notify({
            description = 'You failed to place the charge',
            type = 'error'
        })
        return
    end

    SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, false)
    SetEntityHeading(ped, coords.w)
    FreezeEntityPosition(ped, true)

    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") do
        Wait(4)
    end

    RequestModel(GetHashKey("hei_p_m_bag_var22_arm_s"))
    while not HasModelLoaded(GetHashKey("hei_p_m_bag_var22_arm_s")) do
        Wait(4)
    end

    RequestModel(GetHashKey("prop_bomb_01_s"))
    while not HasModelLoaded(GetHashKey("prop_bomb_01_s")) do
        Wait(4)
    end

    local pos = GetEntityCoords(ped)
    local rotation = GetEntityRotation(ped)

    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), pos.x, pos.y, pos.z, true, true, false)
    SetEntityCollision(bag, false, true)

    local scene = NetworkCreateSynchronisedScene(
        coords.x, coords.y, coords.z - 0.8,
        rotation.x, rotation.y, rotation.z,
        2, 0, 0, 1065353216, 0, 1.3
    )

    NetworkAddPedToSynchronisedScene(
        ped, scene,
        "anim@heists@ornate_bank@thermal_charge", "thermal_charge",
        1.5, -4.0, 1, 16, 1148846080, 0
    )

    NetworkAddEntityToSynchronisedScene(
        bag, scene,
        "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge",
        4.0, -8.0, 1
    )

    NetworkStartSynchronisedScene(scene)

    Wait(1500)

    pos = GetEntityCoords(ped)
    local bomb = CreateObject(GetHashKey("prop_bomb_01_s"), pos.x, pos.y, pos.z + 0.2, true, true, false)
    SetEntityCollision(bomb, false, true)

    AttachEntityToEntity(
        bomb, ped, GetPedBoneIndex(ped, 28422),
        0.0, 0.0, 0.0,
        90.0, 180.0, 45.0,
        true, true, false, true, 1, true
    )

    local done = lib.progressCircle({
        duration = 3500,
        label = 'Placing C4',
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true
        }
    })

    if not done then
        NetworkStopSynchronisedScene(scene)

        if DoesEntityExist(bag) then
            DeleteObject(bag)
        end

        if DoesEntityExist(bomb) then
            DetachEntity(bomb, true, true)
            DeleteEntity(bomb)
        end

        ClearPedTasks(ped)
        FreezeEntityPosition(ped, false)

        lib.notify({
            description = 'You canceled placing the C4',
            type = 'error',
        })
        return
    end

    if DoesEntityExist(bag) then
        DeleteObject(bag)
    end

    DetachEntity(bomb, true, true)
    FreezeEntityPosition(bomb, true)
    SetEntityCollision(bomb, false, true)

    NetworkStopSynchronisedScene(scene)
    ClearPedTasksImmediately(ped)
    FreezeEntityPosition(ped, false)

    Wait(3500)

    if DoesEntityExist(bomb) then
        DeleteEntity(bomb)
    end

    AddExplosion(coords.x, coords.y, coords.z, 2, 1.0, true, false, 1.0)

    TriggerServerEvent('storm-merryweather:unlockMainDoor')
end)

RegisterNetEvent('storm-merryweather:spawnMainPeds', function()
    local playerPed = PlayerPedId()
    local playerGroup = GetPedRelationshipGroupHash(playerPed)

    AddRelationshipGroup("MERRYWEATHER_MAIN")
    local mainGroup = GetHashKey("MERRYWEATHER_MAIN")

    SetRelationshipBetweenGroups(0, mainGroup, mainGroup)
    SetRelationshipBetweenGroups(5, mainGroup, playerGroup)
    SetRelationshipBetweenGroups(5, playerGroup, mainGroup)

    for k, v in pairs(Config.Peds) do
        local model = joaat(v.ped)
        RequestModel(model)

        while not HasModelLoaded(model) do
            Wait(0)
        end

        local ped = CreatePed(4, model, v.coords.x, v.coords.y, v.coords.z, v.coords.w, true, true)

        SetEntityHeading(ped, v.coords.w)
        GiveWeaponToPed(ped, joaat(v.weapon), 2000, false, true)
        SetCurrentPedWeapon(ped, joaat(v.weapon), true)

        SetPedRelationshipGroupDefaultHash(ped, mainGroup)
        SetPedRelationshipGroupHash(ped, mainGroup)
        SetCanAttackFriendly(ped, false, true)

        SetPedCanRagdoll(ped, true)
        SetPedArmour(ped, 100)
        SetPedDropsWeaponsWhenDead(ped, false)
        SetPedAccuracy(ped, 35)
        SetPedCombatAttributes(ped, 0, true)
        SetPedCombatAttributes(ped, 5, true)
        SetPedFleeAttributes(ped, 0, false)

        TaskCombatPed(ped, playerPed, 0, 16)

        NetworkRegisterEntityAsNetworked(ped)
        SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(ped), true)

        SetModelAsNoLongerNeeded(model)
    end
end)

RegisterNetEvent('storm-merryweather:mainComputers', function(computer)
    ExecuteCommand('e type')

    local success = RunMinigame("MainComputer")

    if not success then
        ExecuteCommand('e c')
        lib.notify({
            description = 'You failed the authentication',
            type = 'error'
        })
        return
    end

    local done = lib.progressCircle({
        duration = 5000,
        label = 'Decrypting Data',
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true
        }
    })

    ExecuteCommand('e c')

    if not done then
        return
    end

    TriggerServerEvent('storm-merryweather:successfulComputer', computer)
end)

RegisterNetEvent('storm-merryweather:showEmployeeMenu', function(names)
    local menuItems = {}

    for _, name in ipairs(names) do
        table.insert(menuItems, {
            title = name,
            description = 'Swipe ID card for ' .. name,
            onSelect = function()
                local input = lib.inputDialog('Merryweather Security', {
                    {
                        type = 'number',
                        label = 'Employee Pin',
                        required = true
                    }
                })

                if not input or not input[1] then return end

                TriggerServerEvent('storm-merryweather:submitEmployeeAuth', name, tostring(input[1]))
            end
        })
    end

    lib.registerContext({
        id = 'merryweathermenu',
        title = 'Merryweather Employees',
        options = menuItems
    })

    lib.showContext('merryweathermenu')
end)

RegisterNetEvent('storm-merryweather:showEmployee2FA', function(data)
    if not data then return end

    local content = table.concat({
        ('**2FA Code:** %s'):format(tostring(data.code or 'Unknown'))
    }, '\n')

    lib.alertDialog({
        header = 'Employee Credentials',
        content = content,
        centered = true,
        cancel = false
    })
end)

RegisterNetEvent('storm-merryweather:finalComputer', function()
    ExecuteCommand('e type')

    local input = lib.inputDialog('Merryweather Security', {
        {
            type = 'number',
            label = '2FA Code',
            required = true
        }
    })

    if not input or not input[1] then
        ExecuteCommand('e c')
        return
    end

    TriggerServerEvent('storm-merryweather:submitFinalComputerCode', input[1])
    ExecuteCommand('e c')
end)

RegisterNetEvent('storm-merryweather:startFinalComputer2FA', function()
    ExecuteCommand('e type')

    lib.notify({
        description = 'Initiating data transfer',
        type = 'inform'
    })

    Wait(2500)

    local success = RunMinigame("FinalComputer2FA")

    ExecuteCommand('e c')

    if success then
        TriggerServerEvent('storm-merryweather:finishedHeist')
    else
        TriggerServerEvent('storm-merryweather:failedFinalComputer')
        lib.notify({
            description = 'You failed to transfer data',
            type = 'error'
        })
    end
end)

RegisterNetEvent('storm-merryweather:removeUsb', function()
    TriggerServerEvent('storm-merryweather:consumeManifest')
end)

RegisterNetEvent('storm-merryweather:startManifestDrop', function()
    local randomDrops = math.random(1, #Config.Drops)
    local selectedDrop = Config.Drops[randomDrops]

    SetNewWaypoint(selectedDrop.coords.x, selectedDrop.coords.y)

    local waitingForSpawn = true
    while waitingForSpawn do
        Wait(100)

        local distance = #(GetEntityCoords(PlayerPedId()) - vec3(
            selectedDrop.coords.x,
            selectedDrop.coords.y,
            selectedDrop.coords.z
        ))

        if distance <= 50.0 then
            waitingForSpawn = false
            break
        end
    end

    local props = spawnContainer(selectedDrop.coords)
    if not props then
        lib.notify({
            description = 'Container props failed to spawn.',
            type = 'error',
            position = 'center-right'
        })
        return
    end

    local netIds = {}

    for k, v in pairs(props) do
        local timeout = GetGameTimer() + 5000
        local netId = NetworkGetNetworkIdFromEntity(v)

        while (not netId or netId == 0) and GetGameTimer() <= timeout do
            Wait(10)
            NetworkRegisterEntityAsNetworked(v)
            netId = NetworkGetNetworkIdFromEntity(v)
        end

        if not netId or netId == 0 then
            lib.notify({
                description = 'Container props failed to network correctly.',
                type = 'error',
                position = 'center-right'
            })
            return
        end

        SetNetworkIdExistsOnAllMachines(netId, true)
        SetNetworkIdCanMigrate(netId, true)
        netIds[k] = netId
    end

    TriggerServerEvent('storm-merryweather:spawnProps', netIds)
end)

RegisterNetEvent('storm-merryweather:addLockTarget', function(index, coords)
    lockZoneId = exports.ox_target:addBoxZone({
        coords = vector3(coords.x, coords.y, coords.z),
        size = vec3(3, 3, 3),
        rotation = coords.w,
        options = {{
            name = 'merryweatherlock',
            icon = 'fas fa-bomb',
            label = 'Open Crate',
            canInteract = function(entity, distance, coords, name, bone)
                return distance <= 1.5
            end,
            onSelect = function(entity, distance, coords, name, bone)
                TriggerServerEvent('storm-merryweather:attemptOpenContainer', index)
            end
        }}
    })
end)

RegisterNetEvent('storm-merryweather:attemptOpenContainer', function(index, propIds)
    doContainerAnim(index, propIds.container, propIds.lock, propIds.collision)
end)

RegisterNetEvent('storm-merryweather:openContainerCl',
    function(index, containerNetId, collisionNetId, crateNetId, removeLockTarget)
        local container = NetworkGetEntityFromNetworkId(containerNetId)
        local collision = NetworkGetEntityFromNetworkId(collisionNetId)
        local crate = NetworkGetEntityFromNetworkId(crateNetId)

        if collision and collision ~= 0 and DoesEntityExist(collision) then
            SetEntityCollision(collision, true, true)
        end

        if container and container ~= 0 and DoesEntityExist(container) then
            SetEntityCompletelyDisableCollision(container, false, false)
        end

        if removeLockTarget and lockZoneId and lockZoneId ~= 0 then
            exports.ox_target:removeZone(lockZoneId)
            lockZoneId = 0
        end

        local crateCoords
        if crate and crate ~= 0 and DoesEntityExist(crate) then
            local coords = GetEntityCoords(crate)
            local heading = GetEntityHeading(crate)
            crateCoords = vector4(coords.x, coords.y, coords.z, heading)
        else
            return
        end

        if activeLootZones[index] then
            exports.ox_target:removeZone(activeLootZones[index])
            activeLootZones[index] = nil
        end

        local lootZoneId = 0
        lootZoneId = exports.ox_target:addBoxZone({
            coords = vector3(crateCoords.x, crateCoords.y, crateCoords.z),
            size = vec3(3, 3, 3),
            rotation = crateCoords.w,
            options = {{
                name = 'merryweatherlootcrate',
                icon = 'fas fa-box',
                label = 'Grab Loot',
                canInteract = function(entity, distance, coords, name, bone)
                    return distance <= 1.5
                end,
                onSelect = function(entity, distance, coords, name, bone)
                    ExecuteCommand('e mechanic')

                    local done = lib.progressCircle({
                        duration = 7500,
                        label = 'Searching Crate',
                        position = 'bottom',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            move = true,
                            car = true,
                            combat = true
                        }
                    })
                
                    ExecuteCommand('e c')
                
                    if not done then
                        return
                    end
                
                    TriggerServerEvent('storm-merryweather:lootCrate', index)
                end
            }}
        })

        activeLootZones[index] = lootZoneId
end)
