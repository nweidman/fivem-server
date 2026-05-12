--
--[[ Framework specific functions ]]--
--

local framework = shConfig.framework
local ESX, QBCore
local isOpen = false
local tabletObj = nil
local tabletDict = "amb@code_human_in_bus_passenger_idles@female@tablet@base"
local tabletAnim = "base"
local tabletProp = `prop_cs_tablet`
local tabletBone = 60309
local tabletOffset = vector3(0.03, 0.002, -0.0)
local tabletRot = vector3(10.0, 160.0, 0.0)

local function doAnimation()
    if not isOpen then return end
    -- Animation
    RequestAnimDict(tabletDict)
    while not HasAnimDictLoaded(tabletDict) do Citizen.Wait(100) end
    -- Model
    RequestModel(tabletProp)
    while not HasModelLoaded(tabletProp) do Citizen.Wait(100) end

    local plyPed = PlayerPedId()
    tabletObj = CreateObject(tabletProp, 0.0, 0.0, 0.0, true, true, false)
    local tabletBoneIndex = GetPedBoneIndex(plyPed, tabletBone)

    AttachEntityToEntity(tabletObj, plyPed, tabletBoneIndex, tabletOffset.x, tabletOffset.y, tabletOffset.z, tabletRot.x, tabletRot.y, tabletRot.z, true, false, false, false, 2, true)
    SetModelAsNoLongerNeeded(tabletProp)

    CreateThread(function()
        while isOpen do
            Wait(0)
            if not IsEntityPlayingAnim(plyPed, tabletDict, tabletAnim, 3) then
                TaskPlayAnim(plyPed, tabletDict, tabletAnim, 3.0, 3.0, -1, 49, 0, 0, 0, 0)
            end
        end


        ClearPedSecondaryTask(plyPed)
        Citizen.Wait(250)
        DetachEntity(tabletObj, true, false)
        DeleteEntity(tabletObj)
    end)
end

CreateThread(function()
    if framework == 'ESX' then
        ESX = exports["es_extended"]:getSharedObject()

        RegisterNetEvent('esx:playerLoaded')
        AddEventHandler('esx:playerLoaded', function (xPlayer)
            ESX.PlayerData = xPlayer
        end)

        RegisterNetEvent('esx:setJob')
        AddEventHandler('esx:setJob', function (job)
            ESX.PlayerData.job = job
        end)
    elseif framework == 'QB' then
        QBCore = exports['qb-core']:GetCoreObject()
    end
end)

-- Use this variable if you want to set the player as police with an event from another resource.
local isPolice = false

function isPlayerPolice()
    local playerData = exports.qbx_core:GetPlayerData()
    if not playerData or not playerData.job then
        return false
    end

    local job = playerData.job
    return job.name == "police" and job.onduty
end

--[[ Boosting tablet opening ]]--


-- Tablet opening through a command
if clConfig.commandsEnabled then
    RegisterCommand("boosting", function()
        openTablet()
    end)
end

-- Tablet opening through an event
RegisterNetEvent("rahe-boosting:client:openTablet")
AddEventHandler("rahe-boosting:client:openTablet", function(data)
    isOpen = true
    doAnimation()
    if data and data.useThinFrame then
        SendNUIMessage({ action = 'useThinBackgroundFrame' })
    end

    openTablet()
end)


--
--[[ Using hacking device ]]--
--

-- Hacking device using through a command
if clConfig.commandsEnabled then
    RegisterCommand("usehackingdevice", function()
        useHackingDevice()
    end)
end

-- Hacking device using through an event
RegisterNetEvent("rahe-boosting:client:hackingDeviceUsed")
AddEventHandler("rahe-boosting:client:hackingDeviceUsed", function()
    TriggerEvent('qb-vehiclekeys:client:setLastPickedVehicle', QBCore.Functions.GetClosestVehicle())
    useHackingDevice()
end)


--
--[[ Using GPS hacking device ]]--
--

-- GPS hacking device using function. This calls an internal encrypted function which starts the use.
if clConfig.commandsEnabled then
    RegisterCommand("usegpshackingdevice", function()
        useGpsHackingDevice()
    end)
end

-- GPS hacking device using through an event
RegisterNetEvent("rahe-boosting:client:gpsHackingDeviceUsed")
AddEventHandler("rahe-boosting:client:gpsHackingDeviceUsed", function()
    useGpsHackingDevice()
end)


--
--[[ General]]--
--

RegisterNetEvent('rahe-boosting:client:notify')
AddEventHandler('rahe-boosting:client:notify',function(message, type)
    notifyPlayer(message, type)
end)

function notifyPlayer(message, type)
    lib.notify({
        title = message,
        description = message,
        type = type
    })
end

-- You can do some logic here when the tablet is closed. For example, if you started an animation when opening, you can end the animation here.
RegisterNetEvent('rahe-boosting:client:tabletClosed', function()
    isOpen = false
end)

-- The event which can be used to give vehicle keys to the player after completing the hack of a special boost (A / S class).
AddEventHandler('rahe-boosting:client:giveKeys', function(vehicleId, licensePlate)
    exports['Renewed-Vehiclekeys']:addKey(licensePlate)
    -- TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', licensePlate)
end)

-- The event which will be triggered when a player hacks the engine of an important boost. This marks the start of a high priority boost.
-- This event can be used to send a notification to police dispatch to alert the police.
AddEventHandler('rahe-boosting:client:importantBoostStarted', function(location, vehicleId, vehicleClass)
    
    local data = exports['cd_dispatch']:GetPlayerInfo()
    TriggerServerEvent('cd_dispatch:AddNotification', {
        job_table = {'police', 'sheriff'}, 
        coords = data.coords,
        title = 'Vehicle boost in progress',
        message = 'A '..data.sex..' is boosting a vehicle at '..data.street, 
        flash = 0,
        unique_id = data.unique_id,
        sound = 1,
        blip = {
            sprite = 523, 
            scale = 1.5, 
            colour = 5,
            flashes = false, 
            text = 'Vehicle boost',
            time = 5,
            radius = 0,
        }
    })
end)

-- The event which will be triggered when the players fails a GPS hack.
-- This event can be used to raise player's stress level.
AddEventHandler('rahe-boosting:client:failedGpsHack', function()

end)

-- The event which will be triggered when the players successfully completes one GPS hack.
-- This event by default is used to send a notification, but can also be used to set a circle in a bottom UI circle.
RegisterNetEvent('rahe-boosting:client:successfulGpsHack')
AddEventHandler('rahe-boosting:client:successfulGpsHack', function(hacksCompleted, hacksRequired, gainedDelay)
    notifyPlayer(translations.NOTIFICATION_GAME_HACK_SUCCESSFUL:format(gainedDelay, hacksCompleted, hacksRequired), G_NOTIFICATION_TYPE_SUCCESS)
end)