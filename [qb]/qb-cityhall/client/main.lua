local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local isLoggedIn = LocalPlayer.state.isLoggedIn
local playerPed = PlayerPedId()
local playerCoords = GetEntityCoords(playerPed)
local closestCityhall = nil
local inCityhallPage = false
local inRangeCityhall = false
local pedsSpawned = false
local jobpedSpawned = false
local tutorialSpawned = false
local table_clone = table.clone
local blips = {}

-- Functions

local function getClosestHall()
    local distance = #(playerCoords - Config.Cityhalls[1].coords)
    local closest = 1
    for i = 1, #Config.Cityhalls do
        local hall = Config.Cityhalls[i]
        local dist = #(playerCoords - hall.coords)
        if dist < distance then
            distance = dist
            closest = i
        end
    end
    return closest
end

local function setCityhallPageState(bool, message)
    if message then
        local action = bool and "open" or "close"
        SendNUIMessage({
            action = action
        })
    end
    SetNuiFocus(bool, bool)
    inCityhallPage = bool
    if not Config.UseTarget or bool then return end
    inRangeCityhall = false
end

local function createBlip(options)
    if not options.coords or type(options.coords) ~= 'table' and type(options.coords) ~= 'vector3' then return error(('createBlip() expected coords in a vector3 or table but received %s'):format(options.coords)) end
    local blip = AddBlipForCoord(options.coords.x, options.coords.y, options.coords.z)
    SetBlipSprite(blip, options.sprite or 1)
    SetBlipDisplay(blip, options.display or 4)
    SetBlipScale(blip, options.scale or 1.0)
    SetBlipColour(blip, options.colour or 1)
    SetBlipAsShortRange(blip, options.shortRange or false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(options.title or 'No Title Given')
    EndTextCommandSetBlipName(blip)
    return blip
end

local function deleteBlips()
    if not next(blips) then return end
    for i = 1, #blips do
        local blip = blips[i]
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end
    blips = {}
end

local function initBlips()
    for i = 1, #Config.Cityhalls do
        local hall = Config.Cityhalls[i]
        if hall.showBlip then
            blips[#blips+1] = createBlip({
                coords = hall.coords,
                sprite = hall.blipData.sprite,
                display = hall.blipData.display,
                scale = hall.blipData.scale,
                colour = hall.blipData.colour,
                shortRange = true,
                title = hall.blipData.title
            })
        end
    end
end

local function spawnPeds()
    if not Config.Peds or not next(Config.Peds) or pedsSpawned then return end
    for i = 1, #Config.Peds do
        local current = Config.Peds[i]
        current.model = type(current.model) == 'string' and joaat(current.model) or current.model
        RequestModel(current.model)
        while not HasModelLoaded(current.model) do
            Wait(0)
        end
        local ped = CreatePed(0, current.model, current.coords.x, current.coords.y, current.coords.z, current.coords.w, false, false)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        TaskStartScenarioInPlace(ped, current.scenario, true, true)
        current.pedHandle = ped
        if Config.UseTarget then
            local opts = nil
            if current.cityhall then
                opts = {
                    label = 'Purchase IDs',
                    icon = 'fa-solid fa-city',
                    action = function()
                        inRangeCityhall = true
                        openCityHall()
                        --setCityhallPageState(true, true)
                    end
                }
            end
            if opts then
                exports['qb-target']:AddTargetEntity(ped, {
                    options = {opts},
                    distance = 2.0
                })
            end
        else
            local options = current.zoneOptions
            if options then
                local zone = BoxZone:Create(current.coords.xyz, options.length, options.width, {
                    name = "zone_cityhall_"..ped,
                    heading = current.coords.w,
                    debugPoly = false
                })
                zone:onPlayerInOut(function(inside)
                    if isLoggedIn and closestCityhall then
                        if inside then
                            if current.cityhall then
                                inRangeCityhall = true
                                exports['qb-core']:DrawText('[E] Open Cityhall')
                            end
                        else
                            exports['qb-core']:HideText()
                            if current.cityhall then
                                inRangeCityhall = false
                            end
                        end
                    end
                end)
            end
        end
    end
    pedsSpawned = true
end

local function deletePeds()
    if not Config.Peds or not next(Config.Peds) or not pedsSpawned then return end
    for i = 1, #Config.Peds do
        local current = Config.Peds[i]
        if current.pedHandle then
            DeletePed(current.pedHandle)
        end
    end

    exports['qb-target']:RemoveZone("JobCenterPed")
end

-- Events

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    isLoggedIn = true
    spawnPeds()
    SpawnTutorialPed()
    -- SpawnJobCenterPed()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
    isLoggedIn = false
    deletePeds()
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

RegisterNetEvent('qb-cityhall:client:getIds', function()
    TriggerServerEvent('qb-cityhall:server:getIDs')
end)

RegisterNetEvent('qb-cityhall:client:sendDriverEmail', function(charinfo)
    SetTimeout(math.random(2500, 4000), function()
        local gender = Lang:t('email.mr')
        if PlayerData.charinfo.gender == 1 then
            gender = Lang:t('email.mrs')
        end
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Lang:t('email.sender'),
            subject = Lang:t('email.subject'),
            message =  Lang:t('email.message', {gender = gender, lastname = charinfo.lastname, firstname = charinfo.firstname, phone = charinfo.phone}),
            button = {}
        })
    end)
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    deleteBlips()
    deletePeds()
end)

-- NUI Callbacks

RegisterNUICallback('close', function(_, cb)
    setCityhallPageState(false, false)
    if not Config.UseTarget and inRangeCityhall then exports['qb-core']:DrawText('[E] Open Cityhall') end -- Reopen interaction when you're still inside the zone
    cb('ok')
end)

RegisterNUICallback('requestId', function(id, cb)
    local license = Config.Cityhalls[closestCityhall].licenses[id.type]
    if inRangeCityhall and license and id.cost == license.cost then
        local mugshotURL = exports["MugShotBase64"]:GetMugShotBase64(PlayerPedId(), false)
        TriggerServerEvent('qb-cityhall:server:requestId', id.type, closestCityhall, mugshotURL)
        QBCore.Functions.Notify(('You have received your %s for $%s'):format(license.label, id.cost), 'success', 3500)
    else
        QBCore.Functions.Notify(Lang:t('error.not_in_range'), 'error')
    end
    cb('ok')
end)

RegisterNUICallback('requestLicenses', function(_, cb)
    local licensesMeta = PlayerData.metadata["licences"]
    local availableLicenses = table_clone(Config.Cityhalls[closestCityhall].licenses)
    for license, data in pairs(availableLicenses) do
        if data.metadata and not licensesMeta[data.metadata] then
            availableLicenses[license] = nil
        end
    end
    cb(availableLicenses)
end)

RegisterNUICallback('applyJob', function(job, cb)
    if inRangeCityhall then
        TriggerServerEvent('qb-cityhall:server:ApplyJob', job, Config.Cityhalls[closestCityhall].coords)
    else
        QBCore.Functions.Notify(Lang:t('error.not_in_range'), 'error')
    end
    cb('ok')
end)

-- Threads

CreateThread(function()
    while true do
        if isLoggedIn then
            playerPed = PlayerPedId()
            playerCoords = GetEntityCoords(playerPed)
            closestCityhall = getClosestHall()
        end
        Wait(1000)
    end
end)

CreateThread(function()
    initBlips()
    spawnPeds()
    SpawnTutorialPed()
    -- SpawnJobCenterPed()
    QBCore.Functions.TriggerCallback('qb-cityhall:server:receiveJobs', function(result)
        SendNUIMessage({
            action = 'setJobs',
            jobs = result
        })
    end)
    if not Config.UseTarget then
        while true do
            local sleep = 1000
            if isLoggedIn and closestCityhall then
                if inRangeCityhall then
                    if not inCityhallPage then
                        sleep = 0
                        if IsControlJustPressed(0, 38) then
                            --setCityhallPageState(true, true)
                            exports['qb-core']:KeyPressed()
                            Wait(500)
                            exports['qb-core']:HideText()
                            sleep = 1000
                        end
                    end
                end
            end
            Wait(sleep)
        end
    end
end)

AddEventHandler('qb-cityhall:client:SetWayPoint', function(data)
    local coords = data.coords
    SetNewWaypoint(coords.x, coords.y)

    QBCore.Functions.Notify("Job destination set!", "success", 5000)
end)

AddEventHandler('qb-cityhall:client:OpenJobCenter', function()
    local menu = {
        {
            header = '💼 Job Center',
            isMenuHeader = true
        }
    }
    for _, v in pairs(Config.JobCenter.jobs) do
        menu[#menu+1] = {
            header = v.label,
            params = {
                event = 'qb-cityhall:client:SetWayPoint',
                args = {
                    coords = v.coords
                }
            }
        }
    end

    exports['qb-menu']:openMenu(menu)
end)

function SpawnJobCenterPed()
    if jobpedSpawned then return end
    
    local model = Config.JobCenter.model
    local coords = Config.JobCenter.coords
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
    local ped = CreatePed(0, model, coords.x, coords.y, coords.z, coords.w, false, false)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_CLIPBOARD', true, true)

    exports['qb-target']:AddEntityZone("JobCenterPed", ped, {
        name = "JobCenterPed",
        heading = GetEntityHeading(ped),
        debugPoly = false,
    }, {
        options = {
            {
                label = 'Open Job Center',
                icon = 'fa-solid fa-user-tie',
                event = 'qb-cityhall:client:OpenJobCenter'
            },
        },
        distance = 2.0
    })

    jobpedSpawned = true
end

function SpawnTutorialPed()
    if tutorialSpawned then return end
    
    local model = Config.Tutorial.model
    local coords = Config.Tutorial.coords
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
    local ped = CreatePed(0, model, coords.x, coords.y, coords.z, coords.w, false, false)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    -- TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_CLIPBOARD', true, true)

    exports.ox_target:addLocalEntity(ped, {
    {
            name = 'JobCenterPed',
            icon = 'fa-solid fa-user-tie',
            label = 'Start Tutorial',
            onSelect = function(data)
                TriggerEvent('um-tutorial:client:openTutorial')
            end,
            distance = 2.0
        }
    })


    tutorialSpawned = true
end


AddEventHandler('qb-cityhall:client:RequestId', function(id)
    local license = Config.Cityhalls[closestCityhall].licenses[id.type]
    if inRangeCityhall and license and id.cost == license.cost then
        local mugshotURL = exports["MugShotBase64"]:GetMugShotBase64(PlayerPedId(), false)
        TriggerServerEvent('qb-cityhall:server:requestId', id.type, closestCityhall, mugshotURL)
        --QBCore.Functions.Notify(('You have received your %s for $%s'):format(license.label, id.cost), 'success', 3500)
    else
        QBCore.Functions.Notify(Lang:t('error.not_in_range'), 'error')
    end
end)

function openCityHall()
    if not PlayerData then return end

    local licensesMeta = PlayerData.metadata["licences"]
    local availableLicenses = table_clone(Config.Cityhalls[closestCityhall].licenses)
    for license, data in pairs(availableLicenses) do
        if data.metadata and not licensesMeta[data.metadata] then
            availableLicenses[license] = nil
        end
    end

    local menu = {
        {
            header = '🪪 License Menu',
            isMenuHeader = true
        }
    }
    for type, v in pairs(availableLicenses) do
        menu[#menu+1] = {
            header = v.label,
            params = {
                event = 'qb-cityhall:client:RequestId',
                args = {
                    type = type,
                    cost = v.cost
                }
            }
        }
    end

    exports['qb-menu']:openMenu(menu)
end