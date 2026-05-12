ESX = nil
QBCore = nil

isPolice = false
closestStinger = 0

RegisterNetEvent("loaf_spikestrips:setPolice")
AddEventHandler("loaf_spikestrips:setPolice", function()
    isPolice = true
end)

CreateThread(function()
    while not NetworkIsSessionStarted() do
        Wait(500)
    end

    if Config.Framework == "esx" then
        while not ESX do
            Wait(500)
            TriggerEvent("esx:getSharedObject", function(esx)
                ESX = esx
            end)
        end
    
        while not ESX.GetPlayerData() or not ESX.GetPlayerData().job or not ESX.GetPlayerData().job.name do
            Wait(500)
        end
    elseif Config.Framework == "qb" then
        while not QBCore do
            Wait(500)
            QBCore = exports["qb-core"]:GetCoreObject()
        end

        while not QBCore.Functions.GetPlayerData() or not QBCore.Functions.GetPlayerData().job or not QBCore.Functions.GetPlayerData().job.name do
            Wait(500)
        end
    end

    if Config.RequireJobPlace then
        if Config.Framework == "esx" or Config.Framework == "qb" then
            local eventName = Config.Framework == "esx" and "esx:setJob" or "QBCore:Client:OnJobUpdate"
            RegisterNetEvent(eventName)
            AddEventHandler(eventName, function(jobData)
                local jobName = jobData.name
                isPolice = false
                for _, job in pairs(Config.FrameworkFeatures.PoliceJobs) do
                    if job == jobName then
                        isPolice = true
                        break
                    end
                end
            end)

            local jobName = Config.Framework == "esx" and ESX.GetPlayerData().job.name or QBCore.Functions.GetPlayerData().job.name
            for _, job in pairs(Config.FrameworkFeatures.PoliceJobs) do
                if job == jobName then
                    isPolice = true
                    break
                end
            end
        else
            TriggerServerEvent("loaf_spikestrips:checkPolice")
        end
    else
        isPolice = true
    end

    if Config.Debugging then
        CreateThread(function()
            while true do
                Wait(500)
                while DoesEntityExist(closestStinger) do
                    Wait(0)
                    local min, max = GetModelDimensions(GetEntityModel(closestStinger))
                    local size = max - min
                    local w, l, h = size.x, size.y, size.z

                    local offset1 = GetOffsetFromEntityInWorldCoords(closestStinger, 0.0, l/2, h*-1)
                    local offset2 = GetOffsetFromEntityInWorldCoords(closestStinger, 0.0, l/2 * -1, h)

                    local onScreen, x, y = GetScreenCoordFromWorldCoord(table.unpack(offset1))
                    DrawRect(x, y, 0.005, 0.005 * 16/9, 255, 255, 255, 255)
                    onScreen, x, y = GetScreenCoordFromWorldCoord(table.unpack(offset2))
                    DrawRect(x, y, 0.005, 0.005 * 16/9, 255, 255, 255, 255)
                end
            end
        end)
    end

    -- thread to find the closest stinger / spikestrip
    CreateThread(function()
        while true do
            local driving = DoesEntityExist(GetVehiclePedIsUsing(PlayerPedId()))
            Wait((driving and 50) or 1000)
            local coords = GetEntityCoords((driving and GetVehiclePedIsUsing(PlayerPedId())) or PlayerPedId())

            local stinger = GetClosestObjectOfType(coords, 10.0, GetHashKey("p_ld_stinger_s"), false, false, false)
            if DoesEntityExist(stinger) then
                closestStinger = stinger
                closestStingerDistance = #(coords - GetEntityCoords(stinger))
            end

            if not DoesEntityExist(closestStinger) or #(coords - GetEntityCoords(closestStinger)) > 10.0 then
                closestStinger = 0
            end
        end
    end)

    
--- remove UI
    -- This loop allows you to remove stingers.
    -- CreateThread(function()
    --     while true do
    --         Wait(500)
    --         if (isPolice or not Config.RequireJobRemove) and IsPedOnFoot(PlayerPedId()) then
    --             while (isPolice or not Config.RequireJobRemove) and DoesEntityExist(closestStinger) and closestStingerDistance <= 4.0 and IsPedOnFoot(PlayerPedId()) do
    --                 Wait(0)
    --                 HelpText(Strings["remove_stinger"], true)
    --                 if IsControlJustReleased(0, 51) then
    --                     RemoveStinger()
    --                 end
    --             end
    --         end
    --     end
    -- end)

    -- This while loop manages bursting tyres.
    CreateThread(function()
        while true do
            Wait(1500)
            while DoesEntityExist(GetVehiclePedIsUsing(PlayerPedId())) do
                Wait(50)
                local vehicle = GetVehiclePedIsUsing(PlayerPedId())
                while DoesEntityExist(closestStinger) and closestStingerDistance <= 5.0 do
                    Wait(5)
                    if IsEntityTouchingEntity(vehicle, closestStinger) then
                        for boneName, wheelId in pairs(wheels) do
                            if not IsVehicleTyreBurst(vehicle, wheelId, false) then
                                if TouchingStinger(GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, boneName)), closestStinger) then
                                    SetVehicleTyreBurst(vehicle, wheelId, 1, 1148846080)
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end)


-- remove spikes failsafe
local SPIKE_MODEL = `p_ld_stinger_s`

local function deleteEntityGuaranteed(ent)
    if not ent or ent == 0 or not DoesEntityExist(ent) then return false end

    -- Make sure it's networked/migratable
    if not NetworkGetEntityIsNetworked(ent) then
        NetworkRegisterEntityAsNetworked(ent)
    end

    local netId = NetworkGetNetworkIdFromEntity(ent)
    if netId and netId ~= 0 then
        SetNetworkIdCanMigrate(netId, true)
    end

    -- Request control
    NetworkRequestControlOfEntity(ent)
    local timeout = GetGameTimer() + 2000
    while not NetworkHasControlOfEntity(ent) and GetGameTimer() < timeout do
        Wait(0)
        NetworkRequestControlOfEntity(ent)
    end

    -- Delete
    SetEntityAsMissionEntity(ent, true, true)
    DeleteEntity(ent)

    -- Confirm
    return not DoesEntityExist(ent)
end

local function findPairedSpike(spikeEnt)
    local base = GetEntityCoords(spikeEnt)
    local radius = 8.0
    local pair = nil

    local handle, obj = FindFirstObject()
    local ok = true

    while ok do
        if obj and obj ~= 0 and DoesEntityExist(obj) then
            if obj ~= spikeEnt and GetEntityModel(obj) == SPIKE_MODEL then
                if #(GetEntityCoords(obj) - base) < radius then
                    pair = obj
                    break
                end
            end
        end
        ok, obj = FindNextObject(handle)
    end

    EndFindObject(handle)
    return pair
end

