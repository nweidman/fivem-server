local QBX = exports.qbx_core
local InPreview, isActive = false, false
local PlayerJob, PlayerGang = {}, {}

-- =========================
-- Helpers
-- =========================
local function refreshPlayerData()
    local pd = QBX:GetPlayerData()
    if pd then
        PlayerJob  = pd.job or {}
        PlayerGang = pd.gang or {}
    end
end

local function closeContext()
    if lib and lib.hideContext then lib.hideContext() end
end

local function requestModelSync(model)
    local hash = type(model) == 'string' and joaat(model) or model
    if not lib.requestModel(hash, 5000) then
        lib.notify({ title = 'Garage', description = 'Model failed to load', type = 'error' })
        return nil
    end
    return hash
end

local function deleteVeh(veh)
    if not veh or veh == 0 then return end
    if not NetworkHasControlOfEntity(veh) then
        NetworkRequestControlOfEntity(veh)
        local t = GetGameTimer() + 1000
        while not NetworkHasControlOfEntity(veh) and GetGameTimer() < t do Wait(0) end
    end
    SetEntityAsMissionEntity(veh, true, true)
    DeleteVehicle(veh)
end

local function spawnVehicleAt(model, spawn)
    local hash = requestModelSync(model)
    if not hash then return nil end

    local x = spawn.x or spawn[1]
    local y = spawn.y or spawn[2]
    local z = spawn.z or spawn[3]
    local w = spawn.w or spawn[4] or 0.0

    local veh = CreateVehicle(hash, x + 0.0, y + 0.0, z + 0.01, w, true, false)
    SetEntityAsMissionEntity(veh, true, true)
    SetVehicleOnGroundProperly(veh)
    SetVehicleDirtLevel(veh, 0.0)
    SetVehRadioStation(veh, 'OFF')
    SetVehicleUndriveable(veh, false)
    SetModelAsNoLongerNeeded(hash)
    return veh
end

-- =========================
-- Player data (compat events)
-- =========================
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', refreshPlayerData)
RegisterNetEvent('QBCore:Client:OnJobUpdate',  function(job)  PlayerJob  = job  or {} end)
RegisterNetEvent('QBCore:Client:OnGangUpdate', function(gang) PlayerGang = gang or {} end)
CreateThread(refreshPlayerData)

-- =========================
-- Menu building helpers
-- =========================
local function addVehicleOption(opts, targetEvent, entry, argsTbl, isServer)
    local line = {
        title       = entry.name,
        description = ('$%s'):format(entry.price),
        args        = argsTbl
    }
    if isServer then
        line.serverEvent = targetEvent
    else
        line.event = targetEvent
    end
    opts[#opts + 1] = line
end

local function buildAuthorized(authorized, myGrade, addFn)
    if not authorized or not next(authorized) then return {} end
    local opts = {}
    for model, v in pairs(authorized) do
        local show = false
        if v.grades == nil then
            show = true
        elseif type(v.grades) == 'number' or type(v.grades) == 'string' then
            show = tonumber(v.grades) == tonumber(myGrade)
        elseif type(v.grades) == 'table' then
            for i = 1, #v.grades do
                if tonumber(myGrade) == tonumber(v.grades[i]) then show = true break end
            end
        end

        if show then
            addFn(opts, model, v)
        end
    end
    return opts
end

-- =========================
-- Root menus
-- =========================
RegisterNetEvent('CL-PoliceGarage:Menu', function(garage)
    if not garage then return end
    lib.registerContext({
        id = 'cl_police_garage_root_' .. tostring(garage),
        title = 'Police Garage',
        options = {
            { title = 'Buy Vehicles',     description = 'View Vehicles', event = 'CL-PoliceGarage:Catalog',        args = garage },
            { title = 'Preview Vehicles', description = 'View Vehicles', event = 'CL-PoliceGarage:PreviewCarMenu', args = garage },
            { title = 'Close', icon = 'xmark' }
        }
    })
    lib.showContext('cl_police_garage_root_' .. tostring(garage))
end)

RegisterNetEvent('CL-MCGarage:Menu', function(garage)
    if not garage then return end
    lib.registerContext({
        id = 'cl_mc_garage_root_' .. tostring(garage),
        title = 'Motorcycle Garage',
        options = {
            { title = 'Buy Vehicles',     description = 'View Vehicles', event = 'CL-MCGarage:Catalog',        args = garage },
            { title = 'Preview Vehicles', description = 'View Vehicles', event = 'CL-MCGarage:PreviewCarMenu', args = garage },
            { title = 'Close', icon = 'xmark' }
        }
    })
    lib.showContext('cl_mc_garage_root_' .. tostring(garage))
end)

RegisterNetEvent('CL-EMSGarage:Menu', function(garage)
    if not garage then return end
    lib.registerContext({
        id = 'cl_ems_garage_root_' .. tostring(garage),
        title = 'EMS Garage',
        options = {
            { title = 'Buy Vehicles',     description = 'View Vehicles', event = 'CL-EMSGarage:Catalog',        args = garage },
            { title = 'Preview Vehicles', description = 'View Vehicles', event = 'CL-EMSGarage:PreviewCarMenu', args = garage },
            { title = 'Close', icon = 'xmark' }
        }
    })
    lib.showContext('cl_ems_garage_root_' .. tostring(garage))
end)

-- =========================
-- Catalogs (purchase)
-- =========================
RegisterNetEvent('CL-PoliceGarage:Catalog', function(garage)
    local authorized
    local job = PlayerJob

    if not job or not job.name or not job.grade or job.grade.level == nil then
        return
    end

    local grade = job.grade.level

    if job.name == 'police' then
        if grade >= 0 and grade <= 15 then
            authorized = Config.PoliceVehicles
        elseif grade == 16 then
            authorized = Config.Commissioner
        end

    elseif job.name == 'sheriff' then
        if grade >= 0 and grade <= 9 then
            authorized = Config.BSCO or Config.PoliceVehicles
        elseif grade >= 10 and grade <= 16 then
            authorized = Config.Commissioner
        end
    end

    if not authorized then return end

    local opts = buildAuthorized(authorized, grade, function(o, model, v)
        addVehicleOption(o, 'CL-PoliceGarage:TakeMoney', v, {
            price = v.price,
            vehiclename = v.name,
            vehicle = model,
            garage = garage
        }, true)
    end)

    lib.registerContext({
        id = 'cl_police_garage_catalog_' .. tostring(garage),
        title = 'Police Garage',
        options = (#opts > 0 and opts) or { { title = 'No vehicles available', readOnly = true } },
        menu = 'cl_police_garage_root_' .. tostring(garage)
    })

    lib.showContext('cl_police_garage_catalog_' .. tostring(garage))
end)

RegisterNetEvent('CL-EMSGarage:Catalog', function(garage)
    local job = PlayerJob
    if not job or not job.name or not job.grade or job.grade.level == nil then
        return
    end

    -- EMS only
    if job.name ~= 'ambulance' then return end

    local grade = job.grade.level
    local authorized

    if grade >= 0 and grade <= 7 then
        authorized = Config.AmbulanceVehicles
    end

    if not authorized then return end

    local opts = buildAuthorized(authorized, grade, function(o, model, v)
        addVehicleOption(o, 'CL-EMSGarage:TakeMoney', v, { -- ✅ EMS server event
            price = v.price,
            vehiclename = v.name,
            vehicle = model,
            garage = garage
        }, true)
    end)

    lib.registerContext({
        id = 'cl_ems_garage_catalog_' .. tostring(garage),
        title = 'EMS Garage',
        options = (#opts > 0 and opts) or { { title = 'No vehicles available', readOnly = true } },
        menu = 'cl_ems_garage_root_' .. tostring(garage)
    })

    lib.showContext('cl_ems_garage_catalog_' .. tostring(garage))
end)

RegisterNetEvent('CL-MCGarage:Catalog', function(garage)
    local authorized
    if PlayerGang?.name == 'bsmc' and PlayerGang.grade.level >= 0 then
        authorized = Config.BSMCVehicles
    -- elseif PlayerGang?.name == 'imc' and PlayerGang.grade.level >= 0 then ---ADD THIS IN FOR ANOTHER MC
    --     authorized = Config.IMCVehicles
    end
    if not authorized then return end

    local opts = buildAuthorized(authorized, PlayerGang.grade.level, function(o, model, v)
        addVehicleOption(o, 'CL-MCGarage:TakeMoney', v, {
            price = v.price, vehiclename = v.name, vehicle = model, garage = garage
        }, true)
    end)

    lib.registerContext({
        id = 'cl_mc_garage_catalog_' .. tostring(garage),
        title = 'Motorcycle Garage',
        options = (#opts > 0 and opts) or { { title = 'No vehicles available', readOnly = true } },
        menu = 'cl_mc_garage_root_' .. tostring(garage)
    })
    lib.showContext('cl_mc_garage_catalog_' .. tostring(garage))
end)

-- =========================
-- Preview menus
-- =========================
RegisterNetEvent('CL-PoliceGarage:PreviewCarMenu', function(garage)
    local authorized
    local jobName = PlayerJob?.name
    local grade = PlayerJob?.grade?.level or 0

    if jobName == 'police' and (grade >= 0 and grade <= 15) then
        authorized = Config.PoliceVehicles
    elseif jobName == 'sheriff' and (grade >= 0 and grade <= 9) then
        authorized = Config.BSCO or Config.PoliceVehicles
    elseif (jobName == 'police' and grade == 16) or (jobName == 'sheriff' and grade == 16) then
        authorized = Config.Commissioner
    end

    if not authorized then return end

    local opts = buildAuthorized(authorized, grade, function(o, model, v)
        o[#o + 1] = {
            title = v.name,
            description = ('Preview: %s'):format(v.name),
            event = 'CL-PoliceGarage:PreviewVehicle',
            args = { vehicle = model, garage = garage }
        }
    end)

    lib.registerContext({
        id = 'cl_police_garage_preview_' .. tostring(garage),
        title = 'Preview Menu',
        options = (#opts > 0 and opts) or { { title = 'No vehicles available', readOnly = true } },
        menu = 'cl_police_garage_root_' .. tostring(garage)
    })
    lib.showContext('cl_police_garage_preview_' .. tostring(garage))
end)

RegisterNetEvent('CL-EMSGarage:PreviewCarMenu', function(garage)
    local jobName = PlayerJob?.name
    local grade = PlayerJob?.grade?.level or 0
    local authorized

    if jobName == 'ambulance' and grade >= 0 and grade <= 7 then
        authorized = Config.AmbulanceVehicles
    end
    if not authorized then return end

    local opts = buildAuthorized(authorized, grade, function(o, model, v)
        o[#o + 1] = {
            title = v.name,
            description = ('Preview: %s'):format(v.name),
            event = 'CL-EMSGarage:PreviewVehicle', -- ✅ EMS preview event
            args = { vehicle = model, garage = garage }
        }
    end)

    lib.registerContext({
        id = 'cl_ems_garage_preview_' .. tostring(garage),
        title = 'EMS Preview Menu',
        options = (#opts > 0 and opts) or { { title = 'No vehicles available', readOnly = true } },
        menu = 'cl_ems_garage_root_' .. tostring(garage)
    })
    lib.showContext('cl_ems_garage_preview_' .. tostring(garage))
end)

RegisterNetEvent('CL-MCGarage:PreviewCarMenu', function(garage)
    local authorized
    if PlayerGang?.name == 'bsmc' and PlayerGang.grade.level >= 0 then
        authorized = Config.BSMCVehicles
    -- elseif PlayerGang?.name == 'imc' and PlayerGang.grade.level >= 0 then ---ADD IN FOR ANOTHER MC
    --     authorized = Config.IMCVehicles
    end
    if not authorized then return end

    local opts = buildAuthorized(authorized, PlayerGang.grade.level, function(o, model, v)
        o[#o + 1] = {
            title = v.name,
            description = ('Preview: %s'):format(v.name),
            event = 'CL-MCGarage:PreviewVehicle',
            args = { vehicle = model, garage = garage }
        }
    end)

    lib.registerContext({
        id = 'cl_mc_garage_preview_' .. tostring(garage),
        title = 'Preview Menu',
        options = (#opts > 0 and opts) or { { title = 'No vehicles available', readOnly = true } },
        menu = 'cl_mc_garage_root_' .. tostring(garage)
    })
    lib.showContext('cl_mc_garage_preview_' .. tostring(garage))
end)

-- =========================
-- Active status sync
-- =========================
RegisterNetEvent('CL-PoliceGarage:client:SetActive', function(status)
    isActive = status and true or false
end)

-- =========================
-- Spawn purchased vehicle
-- =========================
local function handleSpawnPurchased(garage, vehicle, plate, update)
    local g = Config.PoliceGarages and Config.PoliceGarages[garage]
    if not g or not g.spawn then return end

    local veh = spawnVehicleAt(vehicle, g.spawn)
    if not veh then return end

    closeContext()

    SetVehicleNumberPlateText(veh, plate or ('PREV' .. math.random(1000, 9999)))
    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    SetVehicleEngineOn(veh, true, true)

    local realPlate = GetVehicleNumberPlateText(veh)
    TriggerEvent('vehiclekeys:client:SetOwner', realPlate)

    if update then
        TriggerServerEvent('CL-PoliceGarage:UpdateVehicleProperties', realPlate, nil)
    end
end

RegisterNetEvent('CL-PoliceGarage:SpawnVehicle', handleSpawnPurchased)
RegisterNetEvent('CL-EMSGarage:SpawnVehicle', handleSpawnPurchased) -- ✅ EMS alias (server triggers EMS event)
RegisterNetEvent('CL-MCGarage:SpawnVehicle', handleSpawnPurchased)

-- =========================
-- Preview flow
-- =========================
local VehicleCam

local function startPreviewCam(veh, opts)
    if not DoesEntityExist(veh) then return end
    opts = opts or {}

    local side     = opts.side or 'left'
    local latMul   = opts.latMul or 1.8
    local frontMul = opts.frontMul or 1.3
    local fov      = opts.fov or 55.0

    local min, max = GetModelDimensions(GetEntityModel(veh))
    local length   = max.y - min.y
    local width    = max.x - min.x
    local height   = max.z - min.z

    local sideSign = (side == 'left') and -1 or 1
    local front    = math.max(length * frontMul, 4.0)
    local lateral  = math.max(width  * latMul, 1.2)
    local aimZ     = min.z + height * 0.50
    local camZ     = min.z + height * 0.55

    local camPos = GetOffsetFromEntityInWorldCoords(veh, lateral * sideSign, front, camZ)
    local lookAt = GetOffsetFromEntityInWorldCoords(veh, (width * 0.18) * sideSign, length * 0.18, aimZ)

    if not DoesCamExist(VehicleCam) then
        VehicleCam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
    end
    SetCamCoord(VehicleCam, camPos.x, camPos.y, camPos.z)
    SetCamFov(VehicleCam, fov)
    PointCamAtCoord(VehicleCam, lookAt.x, lookAt.y, lookAt.z)
    SetCamActive(VehicleCam, true)
    RenderScriptCams(true, true, 400, true, true)
end

local function stopPreviewCam()
    if VehicleCam then
        RenderScriptCams(false, false, 1, true, true)
        DestroyCam(VehicleCam, false)
        VehicleCam = nil
    end
end

local function doPreviewFlow(veh)
    InPreview = true
    closeContext()

    FreezeEntityPosition(veh, true)
    SetVehicleEngineOn(veh, false, false)
    SetVehicleUndriveable(veh, true)
    SetEntityVisible(PlayerPedId(), false, false)
    FreezeEntityPosition(PlayerPedId(), true)

    DoScreenFadeOut(200); Wait(300); DoScreenFadeIn(200)
    startPreviewCam(veh)
    lib.showTextUI('Backspace: Close Preview')

    while InPreview do
        if IsControlJustReleased(0, 177) then -- BACKSPACE
            InPreview = false
            PlaySoundFrontend(-1, 'NO', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        end
        Wait(0)
    end

    lib.hideTextUI()
    SetEntityVisible(PlayerPedId(), true, false)
    FreezeEntityPosition(PlayerPedId(), false)
    stopPreviewCam()
    DoScreenFadeOut(200); Wait(300); DoScreenFadeIn(200)
    deleteVeh(veh)
    TriggerServerEvent('CL-PoliceGarage:server:SetActive', false)
end

RegisterNetEvent('CL-PoliceGarage:PreviewVehicle', function(data)
    local ok = lib.callback.await('CL-PoliceGarage:CheckIfActive', false)
    if not ok then return end

    local g = Config.PoliceGarages and Config.PoliceGarages[data.garage]
    if not g or not g.spawn then return end

    local veh = spawnVehicleAt(data.vehicle, g.spawn)
    if not veh then return end
    SetVehicleNumberPlateText(veh, ('POL%04d'):format(math.random(0, 9999)))

    doPreviewFlow(veh)
end)

RegisterNetEvent('CL-EMSGarage:PreviewVehicle', function(data)
    local ok = lib.callback.await('CL-PoliceGarage:CheckIfActive', false)
    if not ok then return end

    -- ✅ EMS uses PoliceGarages config
    local g = Config.PoliceGarages and Config.PoliceGarages[data.garage]
    if not g or not g.spawn then return end

    local veh = spawnVehicleAt(data.vehicle, g.spawn)
    if not veh then return end

    SetVehicleNumberPlateText(veh, ('EMS%05d'):format(math.random(0, 99999)))

    doPreviewFlow(veh)
end)

RegisterNetEvent('CL-MCGarage:PreviewVehicle', function(data)
    local ok = lib.callback.await('CL-PoliceGarage:CheckIfActive', false)
    if not ok then return end

    local g = Config.PoliceGarages and Config.PoliceGarages[data.garage]
    if not g or not g.spawn then return end

    local veh = spawnVehicleAt(data.vehicle, g.spawn)
    if not veh then return end
    SetVehicleNumberPlateText(veh, ('PREV%03d'):format(math.random(0, 999)))

    doPreviewFlow(veh)
end)

-- =========================
-- World interaction (E prompt)
-- =========================
CreateThread(function()
    local showingKey = nil

    while true do
        local sleep = 1000
        refreshPlayerData()

        local ped = PlayerPedId()
        local pcoords = GetEntityCoords(ped)

        for garage, v in pairs(Config.PoliceGarages) do
            local dist = #(pcoords - v.garage)

            if dist <= 10.0 then
                sleep = 0

                DrawMarker(36, v.garage.x, v.garage.y, v.garage.z + 0.2,
                    0.0, 0.0, 0.0, 0.0, 0.0,
                    0.7, 0.7, 0.5, 0.5,
                    0, 0, 0, 255, true, false, false, true
                )

                local jobName  = PlayerJob?.name
                local gangName = PlayerGang?.name

                local canJob  = (v.job and jobName == v.job) or false
                local canGang = (v.gang and gangName == v.gang) or false

                if dist <= 2.0 and (canJob or canGang) then
                    local label, onPress

                    if canGang then
                        label = '[E] MC Garage'
                        onPress = function() TriggerEvent('CL-MCGarage:Menu', garage) end
                    else
                        if v.job == 'ambulance' then
                            label = '[E] EMS Garage'
                            onPress = function() TriggerEvent('CL-EMSGarage:Menu', garage) end
                        else
                            label = '[E] Police Garage'
                            onPress = function() TriggerEvent('CL-PoliceGarage:Menu', garage) end
                        end
                    end

                    local key = (label .. '|' .. tostring(garage))
                    if showingKey ~= key then
                        lib.hideTextUI()
                        lib.showTextUI(label)
                        showingKey = key
                    end

                    if IsControlJustReleased(0, 38) then
                        onPress()
                    end
                elseif showingKey then
                    lib.hideTextUI()
                    showingKey = nil
                end
            end
        end

        Wait(sleep)
    end
end)