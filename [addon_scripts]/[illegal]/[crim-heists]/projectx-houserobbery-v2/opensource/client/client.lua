local zones = {}

if Config.Framework == "qb-core" or Config.Framework == "qbox" then
    local QBCore = exports["qb-core"]:GetCoreObject()

    function Notification(notification, notificationType, duration)
        if Config.Notification == "ox" then
            lib.notify({
                description = notification,
                type = notificationType,
                position = 'center-right',
            })
        else
            TriggerEvent('QBCore:Notify', notification, notificationType, duration)
        end
    end

    function HasItem(item)
        if Config.Inventory == "ox" then
            return exports.ox_inventory:GetItemCount(item) > 0
        elseif Config.Inventory == "origen" then
            return exports.origen_inventory:HasItem(item)
        elseif Config.Inventory == "tgiann" then
            return exports["tgiann-inventory"]:HasItem(item, 1)
        else
            return QBCore.Functions.HasItem(item)
        end
    end

    function Progressbar(name, label, duration, success, fail, icon)
        if Config.Progressbar == "ox" then
            if lib.progressCircle({
                duration = duration,
                position = 'bottom',
                useWhileDead = false,
                label = label,
                canCancel = false,
                disable = {car = true},
                anim = {},
                prop = {},
            }) then success() end
        else
            QBCore.Functions.Progressbar(name, label, duration, false, false, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true
            }, {}, {}, {}, success, fail, icon)
        end
    end

    RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
        if Inside then
            TriggerServerEvent('projectx-houserobbery:server:LogoutCleanup', Inside)
            LeavingHouse(Inside, true)
        end
        TriggerServerEvent('projectx-houserobbery:server:DetachProp')
    end)

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() ReloadPlayer() end)
elseif Config.Framework == "esx" then
    function Notification(notification, notificationType, duration)
        if Config.Notification == "ox" then
            lib.notify({
                description = notification,
                type = notificationType,
                position = 'center-right',
            })
        else
            TriggerEvent('esx:showNotification', notification, notificationType, duration)
        end
    end

    function HasItem(item)
        local p = promise.new()
        local result = lib.callback.await('projectx-houserobbery:server:hasitem', false, item)
        p:resolve(result)
        return Citizen.Await(p)
    end

    RegisterNetEvent('projectx-houserobbery:client:PdNotify', function(coords)
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 364)
        SetBlipScale(blip, 1.0)
        SetBlipColour(blip, 59)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("House Robbery")
        EndTextCommandSetBlipName(blip)
        SetTimeout(120000, function()
            RemoveBlip(blip)
        end)
    end)

    function Progressbar(name, label, duration, success, fail, icon)
        if lib.progressCircle({
            duration = duration,
            position = 'bottom',
            useWhileDead = false,
            label = label,
            canCancel = false,
            disable = {car = true},
            anim = {},
            prop = {},
        }) then success() end
    end

    RegisterNetEvent('esx:onPlayerLogout', function()
        if Inside then
            TriggerServerEvent('projectx-houserobbery:server:LogoutCleanup', Inside)
            LeavingHouse(Inside, true)
        end
        TriggerServerEvent('projectx-houserobbery:server:DetachProp')
    end)

    RegisterNetEvent('esx:playerLoaded', function() ReloadPlayer() end)
end

function EnableWeather()
    if Config.Weather == "cd" then
        TriggerEvent('cd_easytime:PauseSync', false)
    elseif Config.Weather == "av" then
        TriggerEvent('av_weather:freeze', false)
    elseif Config.Weather == "qb" or Config.Weather == "renewed" then
        TriggerEvent('qb-weathersync:client:EnableSync')
    end
end

function DisableWeather()
    if Config.Weather == "cd" then
        TriggerEvent('cd_easytime:PauseSync', true)
    elseif Config.Weather == "av" then
        TriggerEvent('av_weather:freeze', true)
    elseif Config.Weather == "qb" or Config.Weather == "renewed" then
        TriggerEvent('qb-weathersync:client:DisableSync')
    end
end

function CreateCircleZones(name, coords, size, event, icon, label, distance, param, param2, param3, param4, param5, param6)
    if Config.Interaction ~= "interact" then
        if Config.Interaction == "ox_target" then
            exports.ox_target:addSphereZone({
                name = name,
                coords = coords,
                radius = size,
                debug = Config.debug,
                drawSprite = true,
                options =
                {{
                    icon = icon,
                    label = label,
                    distance = distance,
                    onSelect = event,
                }}
            })
        else
            exports[Config.Interaction]:AddCircleZone(name, coords, size, {name = name, debugPoly = Config.debug, useZ=true},
                {
                options = {
                    {
                        name = name,
                        type = "client",
                        action = event,
                        icon = icon,
                        label = label,
                        coords = coords,
                    }
                },
                distance = distance
            })
        end
    else
        exports.interact:AddInteraction({
            coords = coords,
            distance = 3.0,
            interactDst = distance,
            id = name,
            name = name,
            options = {
                {
                    label = label,
                    action = function()
                        TriggerEvent(event, param, param2, param3, param4)
                    end,
                },
            }
        })
    end
end

function CreateGlobalVehicle(name, event, icon, label, distance, param, param2, param3, param4)
    if not Config.CarryProps["TrunkTargetOnly"] then
        if Config.Interaction ~= "interact" then
            if Config.Interaction == "ox_target" then
                exports.ox_target:addGlobalVehicle({
                    {
                        icon = icon,
                        label = label,
                        distance = distance,
                        onSelect = event,
                    }
                })
            else
                exports[Config.Interaction]:AddGlobalVehicle({
                    options = {
                        {
                            type = "client",
                            action = event,
                            icon = icon,
                            label = label,
                        }
                    },
                    distance = distance
                })
            end
        else
            exports.interact:AddGlobalVehicleInteraction({
                distance = 3.0,
                interactDst = distance,
                id = name,
                name = name,
                options = {
                    {
                        label = label,
                        action = function()
                            TriggerEvent(event, param, param2, param3, param4)
                        end,
                    },
                }
            })
        end
    else
        if Config.Interaction ~= "interact" then
            if Config.Interaction == "ox_target" then
                exports.ox_target:addGlobalVehicle({
                    {
                        name = name,
                        icon = icon,
                        label = label,
                        distance = distance,
                        offset = vec3(0.5, 0, 0.5),
                        canInteract = function (entity)
                            return GetIsDoorValid(entity, 5) and not IsVehicleDoorDamaged(entity, 5) and not cache.vehicle
                        end,
                        onSelect = event,
                    }
                })
            else
                exports[Config.Interaction]:AddTargetBone("boot", {
                    options = {
                        {
                            name = name,
                            type = "client",
                            action = event,
                            icon = icon,
                            label = label,
                            canInteract = function (entity)
                                return GetIsDoorValid(entity, 5) and not IsVehicleDoorDamaged(entity, 5) and not cache.vehicle
                            end,
                        }
                    },
                    distance = distance
                })
            end
        else
            exports.interact:AddGlobalVehicleInteraction({
                distance = 3.0,
                interactDst = distance,
                id = name,
                name = name,
                options = {
                    {
                        label = label,
                        name = name,
                        offset = vec3(0.5, 0, 0.5),
                        canInteract = function (entity)
                            return GetIsDoorValid(entity, 5) and not IsVehicleDoorDamaged(entity, 5) and not cache.vehicle
                        end,
                        action = function()
                            TriggerEvent(event, param, param2, param3, param4)
                        end,
                    },
                }
            })
        end
    end
end

PhoneBoxes = {
    "sf_prop_sf_phonebox_01b_s",
    "prop_phonebox_01c",
    "prop_phonebox_01a",
    "prop_phonebox_01b",
    "p_phonebox_01b_s"
}

function SetupPayPhones()
    if Config.Interaction == "interact" then
        for _, v in pairs(PhoneBoxes) do
            exports.interact:AddModelInteraction({
                model  = v,
                id = v,
                distance = 3.0,
                offset = vec3(0.0, 0.0, 1.0),
                interactDst = 3.0,
                options = {
                    {
                        label = Config.ApproachOptions["Approaches"]["payphone"]["PropOptions"].Label,
                        icon = Config.ApproachOptions["Approaches"]["payphone"]["PropOptions"].Icon,
                        action = function()
                            TriggerEvent('projectx-houserobbery:client:payphone')
                        end,
                    },
                },
            })
        end
        Wait(100)
    else
        local models = {}
        for _, v in pairs(PhoneBoxes) do
            models[#models + 1] = joaat(v)
        end
        if Config.Interaction == "ox_target" then
            exports.ox_target:addModel(models, {
                {
                    label = Config.ApproachOptions["Approaches"]["payphone"]["PropOptions"].Label,
                    icon = Config.ApproachOptions["Approaches"]["payphone"]["PropOptions"].Icon,
                    event = 'projectx-houserobbery:client:payphone',
                },
            })
        elseif Config.Interaction == "qb-target" then
            for _, v in pairs(PhoneBoxes) do
                exports[Config.Interaction]:AddTargetModel(v, {
                    options = {
                        {
                            label = Config.ApproachOptions["Approaches"]["payphone"]["PropOptions"].Label,
                            icon = Config.ApproachOptions["Approaches"]["payphone"]["PropOptions"].Icon,
                            event = 'projectx-houserobbery:client:payphone',
                        },
                    },
                    distance = 0.7,
                })
                Wait(100)
            end
        end
    end
end

function GlobalVehicleDestroy(name)
    if Config.Interaction == "interact" then return exports.interact:RemoveGlobalVehicleInteraction(name) end
    if Config.Interaction == "ox_target" then exports.ox_target:removeGlobalVehicle(name) else exports[Config.Interaction]:RemoveGlobalVehicle(name) end
end

function CircleZoneDestroy(name)
    if Config.Interaction == "interact" then return exports.interact:RemoveInteraction(name) end
    if Config.Interaction == "ox_target" then exports.ox_target:removeZone(name) else exports[Config.Interaction]:RemoveZone(name) end
end

function DrawTextUi(bool, text)
    if Config.Drawtext == "OX" then
        if bool then lib.showTextUI(text) else lib.hideTextUI() end
    elseif Config.Drawtext == "QB" then
        if bool then exports['qb-core']:DrawText(text) else exports['qb-core']:HideText() end
    elseif Config.Drawtext == "OLDQB" then
        if bool then exports['qb-drawtext']:DrawText(text) else exports['qb-drawtext']:HideText() end
    end
end

function DrawtextZones(name, coords, size, rotation, onEnter, onExit)
    zones[#zones + 1] = lib.zones.box({
        name = name,
        coords = coords,
        size = size,
        rotation = rotation,
        debug = Config.debug,
        onEnter = onEnter,
        onExit = onExit,
    })
end

function DrawtextZoneDestroy(name)
    for k, v in pairs(zones) do
        if v.name == name then
            zones[k]:remove()
            zones[k] = nil
        end
    end
end

function PolyZoneDestroy(name)
    TenantZones[name]:remove()
    TenantZones[name] = nil
end

function Evidence(chance)
    if math.random(1, 100) > chance then return end
    TriggerServerEvent('evidence:server:CreateFingerDrop', pos)
end

function Stress(chance)
    TriggerServerEvent('hud:server:GainStress', chance)
end

function ShowDialog(data)
    local buttons = {
        {
            id = 'confirm',
            label = data.confirmLabel,
            close = true,
            onSelect = function()
                if data.onConfirm then
                    data.onConfirm()
                end
            end
        },
    }
    if data.cancelLabel then
        buttons[#buttons + 1] = {
            id = 'cancel',
            label = data.cancelLabel,
            close = true,
            onSelect = function()
                if data.onCancel then
                    data.onCancel()
                end
            end
        }
    end
    return exports.bl_dialog:showDialog({
        ped = data.ped,
        dialog = {
            {
                id = data.id or 'dialog_1',
                job = data.job,
                name = data.name,
                text = data.text,
                textspeed = data.textspeed or 10,
                buttons = buttons
            }
        }
    })
end

function AlertDialog(data)
    return lib.alertDialog({
        header = data.header,
        content = data.text,
        centered = true,
        cancel = true,
        size = data.size or 'm',
        labels = {
            confirm = data.confirmLabel,
            cancel = data.cancelLabel,
        }
    })
end

function InputDialog(data)
    local input = lib.inputDialog(data.title, data.inputs)

    if not input then return nil end
    return input
end

------ Minigames ------
function LockpickMinigame(Tier)
    local p = promise.new()
    local success = exports['bd-minigames']:Lockpick('House Lockpicking', 4, 20)
    p:resolve(success)
    return Citizen.Await(p)
end

function SearchingSpotsMinigame()
    local p = promise:new()
    if not MinigameCheck("bl_ui") then p:resolve(false) return Citizen.Await(p) end
    local success = exports["bl_ui"]:RapidLines(3, 50, 5)
    p:resolve(success)
    return Citizen.Await(p)
end

function PropsMinigame()
    local p = promise:new()
    if not MinigameCheck("bl_ui") then p:resolve(false) return Citizen.Await(p) end
    local success = exports["bl_ui"]:CircleProgress(3, 75)
    p:resolve(success)
    return Citizen.Await(p)
end

function PaintingsMinigame()
    local p = promise:new()
    if not MinigameCheck("bl_ui") then p:resolve(false) return Citizen.Await(p) end
    local success = exports["bl_ui"]:PathFind(1,  { numberOfNodes = 10, duration = 7500, })
    p:resolve(success)
    return Citizen.Await(p)
end

function SafeMinigame()
   local p = promise.new()
    local success = exports['bd-minigames']:Lockpick('House Lockpicking', 4, 20)
    p:resolve(success)
    return Citizen.Await(p)
end

function HighValueItemsMinigame()
    local p = promise:new()
    if not MinigameCheck("bl_ui") then p:resolve(false) return Citizen.Await(p) end
    local success = exports["bl_ui"]:NumberSlide(4, 50, 4)
    p:resolve(success)
    return Citizen.Await(p)
end

function CashMinigame()
    local p = promise:new()
    if not MinigameCheck("bl_ui") then p:resolve(false) return Citizen.Await(p) end
    local success = exports["bl_ui"]:KeySpam(2, 50)
    p:resolve(success)
    return Citizen.Await(p)
end

function ScoutingMinigame(ScoutType)
    local p = promise:new()
    if not MinigameCheck("bl_ui") then p:resolve(false) return Citizen.Await(p) end
    if ScoutType == "ScoutingForTime" then
        local success = exports["bl_ui"]:CircleSum(3, {length = 4, duration = 15000})
        p:resolve(success)
    elseif ScoutType == "ScoutingForTenantCount" then
        local success = exports["bl_ui"]:WaveMatch(1, {duration = 30000})
        p:resolve(success)
    end
    return Citizen.Await(p)
end

function ScoutingTabletMinigame()
    local p = promise.new()
    if not MinigameCheck("bl_ui") then p:resolve(false) return Citizen.Await(p) end
    local success = exports["bl_ui"]:MineSweeper(3, {grid = 7, duration = 10000, target = 10, previewDuration = 2000})
    p:resolve(success)
    return Citizen.Await(p)
end

function HackingMinigame()
    local p = promise:new()
    if not MinigameCheck("bl_ui") then p:resolve(false) return Citizen.Await(p) end
    local success = exports["bl_ui"]:WordWiz(1, {length = 4, duration = 40000})
    p:resolve(success)
    return Citizen.Await(p)
end

function ValetMinigame()
    return true
end

function MaidMinigame()
    return true
end

function GangsterMinigame()
    return true
end

function LocksmithMinigame()
    return true
end

function AlarmMinigame()
    local p = promise:new()
    if not MinigameCheck("bl_ui") then p:resolve(false) return Citizen.Await(p) end
    local success = exports["bl_ui"]:PrintLock(1, {grid = 5, duration = 15000, target = 5 })
    p:resolve(success)
    return Citizen.Await(p)
end

function LasersMinigame()
    local p = promise.new()
    if not MinigameCheck("bl_ui") then p:resolve(false) return Citizen.Await(p) end
    local success = exports["bl_ui"]:Untangle(1, {numberOfNodes = 10, duration = 15000})
    p:resolve(success)
    return Citizen.Await(p)
end

function ContractMinigame(ContractType)
    local p = promise:new()
    if not MinigameCheck("bl_ui") then p:resolve(false) return Citizen.Await(p) end
    if ContractType == "Break Objects" then
        local success = exports["bl_ui"]:KeySpam(2, 50)
        p:resolve(success)
    elseif ContractType == "Steal Objects" then
        local success = exports["bl_ui"]:CircleProgress(3, 75)
        p:resolve(success)
    elseif ContractType == "Littering" then
        local success = exports["bl_ui"]:RapidLines(3, 50, 5)
        p:resolve(success)
    end
    return Citizen.Await(p)
end

-- Functions triggered before the approach starts
function DoorInitiation()
    return true
end

function PayphoneInitiation()
    return true
end

function HackingInitiation()
    return true
end

function MaidInitiation()
    return true
end

function ValetInitiation()
    return true
end

function LocksmithInitiation()
    return true
end

function GangsterInitiation()
    return true
end

function OnCameraOpen()
    -- Disable controls & actions here, example: disable inventory when camera is open
    LocalPlayer.state.invBusy = true
end

function OnCameraClose()
    -- Enable controls & actions here, example: enable inventory when camera is closed
    LocalPlayer.state.invBusy = false
end

function IsCrouched()
    return GetPedMovementClipset(PlayerPedId()) == "move_ped_crouched"
end

------ Ped related functions and events ------
Peds = {}
function CreatePeds(Data, Approach)
    RequestModel(Data.PedModel)
    while not HasModelLoaded(Data.PedModel) do Wait(0) end
    Peds[Approach] = CreatePed(0, Data.PedModel, Data.Options.Coords.x, Data.Options.Coords.y, Data.Options.Coords.z - 1.0, Data.Options.Coords.w, false, false)
    SetEntityInvincible(Peds[Approach], true)
    FreezeEntityPosition(Peds[Approach], true)
    SetBlockingOfNonTemporaryEvents(Peds[Approach], true)
    SetPedCanBeTargetted(Peds[Approach], false)
    if Data.Options.Scenario then
        TaskStartScenarioInPlace(Peds[Approach], Data.Options.Scenario, 0, true)
    else
        loadAnimDict(Data.Options.Animation.Dict)
        TaskPlayAnim(Peds[Approach], Data.Options.Animation.Dict, Data.Options.Animation.Anim, 8.0, -8.0, -1, 9, 1, false, false, false)
    end
end

function CreateContractorPeds(Data)
    RequestModel(Data.PedModel)
    while not HasModelLoaded(Data.PedModel) do Wait(0) end
    Peds["contractor"] = CreatePed(0, Data.PedModel, Data.Coords.x, Data.Coords.y, Data.Coords.z - 1.0, Data.Coords.w, false, false)
    SetEntityInvincible(Peds["contractor"], true)
    FreezeEntityPosition(Peds["contractor"], true)
    SetBlockingOfNonTemporaryEvents(Peds["contractor"], true)
    if Data.Scenario then
        TaskStartScenarioInPlace(Peds["contractor"], Data.Scenario, 0, true)
    else
        loadAnimDict(Data.Animation.Dict)
        TaskPlayAnim(Peds["contractor"], Data.Animation.Dict, Data.Animation.Anim, 8.0, -8.0, -1, 9, 1, false, false, false)
    end
end

----- Adding blip for non-group systems
local blips = {}

RegisterNetEvent('projectx-houserobbery:client:AddBlipForPlayer', function(HouseType, house)
    blips[house] = AddBlipForCoord(Config.Houses[HouseType][house].DoorCoords.x, Config.Houses[HouseType][house].DoorCoords.y, Config.Houses[HouseType][house].DoorCoords.z)
    SetBlipSprite(blips[house], 161)
    SetBlipScale(blips[house], 1.0)
    SetBlipColour(blips[house], 59)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Target House")
    EndTextCommandSetBlipName(blips[house])
end)

RegisterNetEvent('projectx-houserobbery:client:RemoveBlipForPlayer', function(house)
    RemoveBlip(blips[house])
    blips[house] = nil
end)

----- Client Side EXP Events (Only use this if Config.ServerSideEvents is false and your skill system has client sided functions)
RegisterNetEvent("projectx-houserobbery:client:AddExperience", function(skill, exp)
    -- add exp function here and insert exp as a parameter
end)

lib.callback.register("projectx-houserobbery:client:CheckExpLevel", function(skill)
    -- if GetResourceState("storm-skills") ~= "started" then
    --     print("[HouseRobbery] storm-skills not started")
    --     return 0
    -- end

    -- local level = exports["storm-skills"]:getSkillLevel(skill)

    -- if not level then
    --     level = 0
    -- end

    -- return level
end)

-- Command events

RegisterNetEvent('projectx-houserobbery:client:GetOffset', function(args)
    if GetInvokingResource() then return end

    local str = table.concat(args, " ")
    local nums = {}

    for n in str:gmatch("[-]?%d+%.?%d*") do nums[#nums + 1] = tonumber(n) end

    local pos
    if #nums >= 3 then pos = vector3(nums[1], nums[2], nums[3]) else pos = GetEntityCoords(PlayerPedId()) end

    for _, v in pairs(Config.Houses["Shells"]) do
        local door = vector3(v.DoorCoords.x, v.DoorCoords.y, v.DoorCoords.z)

        if #(vector3(pos.x, pos.y, pos.z - MinZOffset) - door) <= 50.0 then
            local HouseCoords = vector3(door.x, door.y, door.z + MinZOffset)

            local xdist = string.format("%.2f", pos.x - HouseCoords.x)
            local ydist = string.format("%.2f", pos.y - HouseCoords.y)
            local zdist = string.format("%.2f", pos.z - HouseCoords.z)

            lib.setClipboard(xdist .. ", " .. ydist .. ", " .. zdist)
            Notification(Loc[Config.Lan].info["copied"], 'success', Config.NotificationDuration)
            return
        end
    end
end)

function Dispatch(house)
    lib.callback('projectx-houserobbery:server:Dispatch', false, function(client, jobs, coords)
        if client and jobs and coords then
            if Config.Dispatch.Resource == "cd" then
                local data = exports['cd_dispatch']:GetPlayerInfo()
                TriggerServerEvent('cd_dispatch:AddNotification', {
                    job_table = {'police'},
                    coords = data.coords,
                    title = '10-15 - House Robbery',
                    message = 'A '..data.sex..' robbing a house at '..data.street,
                    flash = 0,
                    unique_id = data.unique_id,
                    sound = 1,
                    blip = {
                        sprite = 431,
                        scale = 1.2,
                        colour = 3,
                        flashes = false,
                        text = '911 - House Robbery',
                        time = 5,
                        radius = 0,
                    }
                })
            elseif Config.Dispatch.Resource == "ps" then
                exports["ps-dispatch"]:CustomAlert({
                    coords = coords,
                    message = Config.Dispatch.Title,
                    dispatchCode = Config.Dispatch.Code,
                    description = Config.Dispatch.Message,
                    radius = 0,
                    sprite = Config.Dispatch.Blip.Sprite,
                    color = Config.Dispatch.Blip.Color,
                    scale = Config.Dispatch.Blip.Scale,
                    length = 3,
                })
            elseif Config.Dispatch.Resource == "outlaw" then
                local data = {displayCode = Config.Dispatch.Code, description = Config.Dispatch.Message, isImportant = 0, recipientList = PoliceJobs, length = '10000', infoM = 'fa-info-circle', info = Config.Dispatch.Title}
                local dispatchData = {dispatchData = data, caller = 'Unknown', coords = coords}
                TriggerEvent('wf-alerts:svNotify', dispatchData)
            elseif Config.Dispatch.Resource == "codem" then
                local Data = {
                    type = 'Robbery',
                    header = Config.Dispatch.Title,
                    text = Config.Dispatch.Message,
                    code = Config.Dispatch.Code,
                }
                exports['codem-dispatch']:CustomDispatch(Data)
            elseif Config.Dispatch.Resource == "five-dispatch" then
                TriggerServerEvent('dispatch:server:senddispatch', {
                    road = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z)),
                    label = Config.Dispatch.Title,
                    code = Config.Dispatch.Code,
                    priority = 1,
                    coords = coords,
                    jobs = jobs
                })
            elseif Config.Dispatch.Resource == "qf-mdt" then
                TriggerEvent('qf-mdt/addDispatchAlert', coords, Config.Dispatch.Title, Config.Dispatch.Message, Config.Dispatch.Code, 'rgb(167, 23, 23)', 0)
            elseif Config.Dispatch.Resource == "aty" then
                TriggerEvent("aty_dispatch:SendDispatch", Config.Dispatch.Title..' - '..Config.Dispatch.Message, Config.Dispatch.Code, Config.Dispatch.Blip.Sprite, PoliceJobs)
            elseif Config.Dispatch.Resource == "zat-mdt" then
                local data = {
                    coords = coords,
                    icon = 'fas fa-bullhorn',
                    title = Config.Dispatch.Title,
                    message = Config.Dispatch.Message,
                    priority = 2
                }
                exports['zat-mdt']:Alert(data)
            elseif Config.Dispatch.Resource == "opto" then
                TriggerServerEvent('Opto_dispatch:Server:SendAlert', jobs[1], Config.Dispatch.Title, Config.Dispatch.message, coords, false, GetPlayerServerId(PlayerId()))
            elseif Config.Dispatch.Resource == "kartik" then
                local dispatchData = {
                    title = Config.Dispatch.Title,
                    message = Config.Dispatch.Message,
                    code = Config.Dispatch.Code,
                    location = street,
                    type = "Alert",
                    sound = "dispatch",
                    x = coords.x,
                    y = coords.y,
                    z = coords.z,
                    jobs = Config.PoliceJobs,
                    blip = {
                        radius = 0,
                        sprite = Config.Dispatch.Blip.Sprite,
                        color = Config.Dispatch.Blip.Color,
                        scale = Config.Dispatch.Blip.Scale,
                        length = Config.Dispatch.Time / 60,
                    }
                }
                TriggerServerEvent('kartik-mdt:server:sendDispatchNotification', dispatchData)
            elseif Config.Dispatch.Resource == "brutal" then
                TriggerServerEvent('brutal_policejob:server:citizencall', 'create', Config.Dispatch.Title..' - '..Config.Dispatch.Message, {coords.x, coords.y, coords.z}, GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z)))
            elseif Config.Dispatch.Resource == "customcl" then
                -- Add your custom client dispatch event here
            end
        end
    end, house)
end

lib.callback.register('projectx-houserobbery:client:GetStreetAndZone', function(coords)
    local Zone = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
    local Street = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
    return Street, Zone
end)