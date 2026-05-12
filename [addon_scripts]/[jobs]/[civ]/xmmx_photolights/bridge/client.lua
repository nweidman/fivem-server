Bridge = {}

local Framework = nil
local TargetSystem = nil

if GetResourceState('qb-core') == "started" then
    Framework = 'qb-core'
    QBCore = exports['qb-core']:GetCoreObject()
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()         
        -- IMPROVED: Add delay to ensure server has finished loading props
        Citizen.Wait(8000)  -- Increased delay to 8 seconds
        TriggerEvent("xmmx_photolights:client:Init")
    end)
elseif GetResourceState('qbx_core') == "started" then
    Framework = 'qbx_core'
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()         
        Citizen.Wait(8000)  -- Increased delay to 8 seconds
        TriggerEvent("xmmx_photolights:client:Init")
    end)
elseif GetResourceState('es_extended') == "started" then 
    Framework = 'es_extended'
    ESX = exports.es_extended:getSharedObject()
    RegisterNetEvent('esx:onPlayerSpawn', function(xPlayer)        
        Citizen.Wait(8000)  -- Increased delay to 8 seconds
        TriggerEvent("xmmx_photolights:client:Init")
    end)
end

-- IMPROVED: Also trigger init after resource start with retry logic
AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    CreateThread(function()
        Wait(3000)  -- Initial delay
        
        -- Retry initialization up to 5 times if server isn't ready
        local retries = 0
        local maxRetries = 5
        
        while retries < maxRetries do
            local propsReady = lib.callback.await("xmmx_photolights:server:ArePropsReady", false)
            if propsReady then
                TriggerEvent("xmmx_photolights:client:Init")
                break
            else
                retries = retries + 1
                Wait(2000)  -- Wait 2 seconds before retry
            end
        end
        
        if retries >= maxRetries then
            print("^3[XMMX-WARN]^0 Failed to initialize after max retries, server props may not be ready")
        end
    end)
end)

if GetResourceState('ox_target') == "started" then 
    TargetSystem = 'ox_target'
elseif GetResourceState('qb-target') == "started" then 
    TargetSystem = 'qb-target'
elseif GetResourceState('qtarget') == "started" then
    TargetSystem = 'qtarget'
end

---Adds an interactive target zone to an entity using the active target system
---@param entity number The entity to attach the target options to
---@param options table[] A list of target interaction options
Bridge.AddTargetEntity = function(entity, options)
    if not entity or not DoesEntityExist(entity) or not options then return end
    if not TargetSystem then return end

    if TargetSystem == "ox_target" then
        exports.ox_target:addLocalEntity(entity, options)

    elseif TargetSystem == "qb-target" or TargetSystem == "qtarget" then
        local parsedOptions = {}
        for _, option in ipairs(options) do
            if option.groups then
                option.job = next(option.groups)
                option.groups = nil
            end
            if option.onSelect and not option.action then
                option.action = option.onSelect
                option.onSelect = nil
            end
            table.insert(parsedOptions, option)
        end

        exports[TargetSystem]:AddTargetEntity(entity, {
            options = parsedOptions,
            distance = options[1] and options[1].distance or 2.0
        })
    end
end

Bridge.RemoveTargetEntity = function(entity)
    if not entity then return end

    local system = TargetSystem
    if not system then return end

    if system == "ox_target" then
        exports.ox_target:removeLocalEntity(entity)
    elseif system == "qtarget" then
        exports[system]:RemoveTargetEntity(entity)
    elseif system == "qb-target" then
        exports[system]:RemoveTargetEntity(entity)
    end
end

---Displays a notification to the player
---@param _message string The message to show
---@param _type string Notification type: "error", "success", or "primary"
---@param _time number|nil Optional. Duration in ms to show the notification (default: 5000)
Bridge.Notification = function(_message, _type, _time)
    if Framework == "qb-core" then
        QBCore.Functions.Notify(_message, _type, _time or 5000)
    elseif Framework == "qbx_core" then
        if _type == "primary" then
            exports.qbx_core:Notify(_message, "inform", _time or 5000)
        else
            exports.qbx_core:Notify(_message, _type, _time or 5000)
        end
    elseif Framework == "es_extended" then
        if _type == "primary" then 
            ESX.ShowNotification(_message, 'info', _time or 5000)
        else
            ESX.ShowNotification(_message, _type, _time or 5000)
        end 
    end
end

---Requests and loads a model from the game files
---@param model string|number The model name or hash
---@return number|string|nil The model if successful, otherwise nil
Bridge.RequestModel = function(model)
    if not IsModelInCdimage(model) then print("[XMMX-DEBUG] Invalid model requested!") return nil end

    RequestModel(model)
    local timeout = GetGameTimer() + 5000
    while not HasModelLoaded(model) do
        Wait(50)
        if GetGameTimer() > timeout then print(("^1[XMMX-DEBUG]^0 Model load timeout for: %s"):format(model))
            return nil
        end
    end
    return model
end

RegisterNetEvent('xmmx_photolights:client:UsePhotoLight', function(...)
    ExecuteCommand('lightprop')
end)
