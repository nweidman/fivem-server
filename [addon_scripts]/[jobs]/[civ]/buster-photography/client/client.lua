local isPlacing = false
local previewObject = nil
local placementCoords = nil
local heading = 0.0
local offset = vector3(0.0, 0.0, 0.0)

-- Draw 3D text at world coords
local function Draw3DText(coords, text)
    local _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())

    if _x and _y then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

-- Show help text in top left
local function DisplayHelpText()
    local msg = Config.KeybindHelpMessage
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

local function LoadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
    if Config.Debug then
        print("[Debug] Model loaded:", model)
    end
end

local function DeletePreview()
    if previewObject and DoesEntityExist(previewObject) then
        DeleteEntity(previewObject)
        if Config.Debug then
            print("[Debug] Deleted preview object")
        end
        previewObject = nil
    end
end

local function PlaceLight(prop, item)
    if isPlacing then return end

    local hasItem = exports.ox_inventory:Search(1, item)
    if Config.Debug then
        print("[Debug] Checking for item:", item, "Has item:", hasItem)
    end
    if not hasItem then
        exports.qbx_core:Notify("You don’t have the required item.", "error")
        return
    end

    -- Job restriction check
    if Config.JobRestriction.Enabled then
        local playerData = exports.qbx_core:GetPlayerData()
        if Config.Debug then
            print("[Debug] Checking job:", playerData.job.name)
        end
        if not Config.JobRestriction.AllowedJobs[playerData.job.name] then
            exports.qbx_core:Notify("You are not allowed to place this.", "error")
            return
        end
    end

    isPlacing = true
    local model = GetHashKey(prop)
    LoadModel(model)

    if Config.Debug then
        print(("[Debug] Started placing object '%s' with item '%s'"):format(prop, item))
    end

    -- 👇 Uses Renewed-Lib to get placement position + heading
    local newCoords, newHeading = Renewed.placeObject(model, 10, true)
    if not newCoords then
        isPlacing = false
        exports.qbx_core:Notify("Placement cancelled", "error")
        return
    end

    -- 👇 Actually spawn the object at chosen location
    local placedEntity = CreateObject(model, newCoords.x, newCoords.y, newCoords.z, true, true, true)
    SetEntityHeading(placedEntity, newHeading)
    PlaceObjectOnGroundProperly(placedEntity)
    FreezeEntityPosition(placedEntity, true)

    -- 👇 Make it networked
    local netId = NetworkGetNetworkIdFromEntity(placedEntity)
    SetNetworkIdExistsOnAllMachines(netId, true)
    SetNetworkIdCanMigrate(netId, true)

    -- 👇 Notify server for persistence or logging
    TriggerServerEvent("light:registerPlacedProp", netId, item)

    if Config.Debug then
        print(("[Debug] Prop placed successfully with NetID: %s"):format(netId))
    end

    -- 👇 Add target interactions
    exports.ox_target:addLocalEntity(placedEntity, {
        {
            icon = "fas fa-box",
            label = "Pick Up",
            groups = "photo", -- replaces job = "photo"
            onSelect = function(data)
                local entity = data.entity
                local id = NetworkGetNetworkIdFromEntity(entity)
                TriggerServerEvent("light:pickup", id)
                exports.ox_target:removeLocalEntity(entity)
                if Config.Debug then
                    print("[Debug] Light picked up via target interaction.")
                end
            end
        }
    })

    isPlacing = false
end

RegisterNetEvent('lights:placeLight', function(prop, item)
    if Config.Debug then
        print(("[Debug] Received event to place light. Prop: %s, Item: %s"):format(prop, item))
    end
    PlaceLight(prop, item)
end)

local zone = exports.ox_target:addBoxZone({
    coords = vec3(-2685.47, -152.99, 11.32),
    size = vec3(1.0, 4.0, 2.62), -- length, width, height (maxZ - minZ)
    rotation = 222.92,
    debug = false,
    options = {
        {
            name = 'change_clothes_zone',
            label = 'Change Clothes',
            icon = 'fas fa-tshirt',
            distance = 2.0,
            onSelect = function()
                TriggerEvent('crm-appearance:show-outfits')
            end
        }
    }
})

-- cleanup on stop
AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        exports.ox_target:removeZone(zone)
    end
end)


