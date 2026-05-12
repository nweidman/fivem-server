local config = require 'config.shared'
IsEscorted = false
local dutyBlips = {}

-- local function CreateDutyBlips(playerId, playerLabel, playerJob, playerLocation)
--     local ped = GetPlayerPed(playerId)
--     local blip = GetBlipFromEntity(ped)
--     if not DoesBlipExist(blip) then
--         if NetworkIsPlayerActive(playerId) then
--             blip = AddBlipForEntity(ped)
--         else
--             blip = AddBlipForCoord(playerLocation.x, playerLocation.y, playerLocation.z)
--         end
--         SetBlipSprite(blip, 1)
--         ShowHeadingIndicatorOnBlip(blip, true)
--         SetBlipRotation(blip, math.ceil(playerLocation.w))
--         SetBlipScale(blip, 1.0)
--         if playerJob == 'police' then
--             SetBlipColour(blip, 38)
--         else
--             SetBlipColour(blip, 5)
--         end
--         SetBlipAsShortRange(blip, true)
--         BeginTextCommandSetBlipName('STRING')
--         AddTextComponentString(playerLabel)
--         EndTextCommandSetBlipName(blip)
--         dutyBlips[#dutyBlips + 1] = blip
--     end

--     if GetBlipFromEntity(cache.ped) == blip then
--         RemoveBlip(blip)
--     end
-- end

local function removeBlips()
    for i = 1, #dutyBlips do
        RemoveBlip(dutyBlips[i])
    end
    dutyBlips = {}
end

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('police:server:SetHandcuffStatus', false)
    TriggerServerEvent('police:server:UpdateCurrentCops')
    TriggerServerEvent('police:server:RegisterLocker')

    local trackerClothingData = {}

    if QBX.PlayerData.metadata.tracker then
        trackerClothingData.outfitData = { accessory = { item = 13, texture = 0 } }
    else
        trackerClothingData.outfitData = { accessory = { item = -1, texture = 0 } }
    end

    TriggerEvent('qb-clothing:client:loadOutfit', trackerClothingData)

    local job = QBX.PlayerData.job
    if not job or job.type ~= 'leo' and job.type ~= 'ems' then
        removeBlips()
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    TriggerServerEvent('police:server:SetHandcuffStatus', false)
    TriggerServerEvent('police:server:UpdateCurrentCops')
    IsEscorted = false
    ClearPedTasks(cache.ped)
    DetachEntity(cache.ped, true, false)
    removeBlips()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    if job.type ~= 'leo' and job.type ~= 'ems' then
        removeBlips()
    end
end)

RegisterNetEvent('police:client:sendBillingMail', function(amount)
    SetTimeout(math.random(2500, 4000), function()
        local charinfo = QBX.PlayerData.charinfo
        local gender = locale(charinfo.gender == 1 and 'info.mrs' or 'info.mr')
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = locale('email.sender'),
            subject = locale('email.subject'),
            message = locale('email.message', gender, charinfo.lastname, amount),
            button = {}
        })
    end)
end)

-- RegisterNetEvent('police:client:UpdateBlips', function(players)
--     local job = QBX.PlayerData.job
--     if job and (job.type == 'leo' or job.type == 'ems') and job.onduty then
--         removeBlips()
--         if players then
--             for i = 1, #players do
--                 local id = GetPlayerFromServerId(players[i].source)
--                 CreateDutyBlips(id, players[i].label, players[i].job, players[i].location)
--             end
--         end
--     end
-- end)

RegisterNetEvent('police:client:policeAlert', function(coords, text, camId)
    local title = 'Silent Panic'
    local desc  = text or 'Check GPS'

    exports.qbx_core:Notify(title, 'inform', 8000, desc)

    PlaySound(-1, 'Lose_1st', 'GTAO_FM_Events_Soundset', false, 0, true)

    if coords and coords.x then
        local x, y, z = coords.x + 0.0, coords.y + 0.0, coords.z + 0.0
        local transG = 250
        local blip  = AddBlipForCoord(x, y, z)
        local blip2 = AddBlipForCoord(x, y, z)
        local blipText = (locale and locale('info.blip_text', title)) or title

        SetBlipSprite(blip, 60)
        SetBlipSprite(blip2, 161)
        SetBlipColour(blip, 1)
        SetBlipColour(blip2, 1)
        SetBlipDisplay(blip, 4)
        SetBlipDisplay(blip2, 8)
        SetBlipAlpha(blip, transG)
        SetBlipAlpha(blip2, transG)
        SetBlipScale(blip, 0.8)
        SetBlipScale(blip2, 2.0)
        SetBlipAsShortRange(blip, false)
        SetBlipAsShortRange(blip2, false)
        PulseBlip(blip2)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(blipText)
        EndTextCommandSetBlipName(blip)

        while transG > 0 do
            Wait(720)
            transG = transG - 1
            SetBlipAlpha(blip, transG)
            SetBlipAlpha(blip2, transG)
            if transG == 0 then
                if DoesBlipExist(blip) then RemoveBlip(blip) end
                if DoesBlipExist(blip2) then RemoveBlip(blip2) end
                return
            end
        end
    end
end)

RegisterNetEvent('police:client:SendPoliceEmergencyAlert', function()
    TriggerServerEvent('police:server:policeAlert', 'Silent Panic')
    TriggerServerEvent('hospital:server:ambulanceAlert', 'Silent Panic')
end)

CreateThread(function()
    for i = 1, #config.locations.stations do
        local station = config.locations.stations[i]
        local blip = AddBlipForCoord(station.coords.x, station.coords.y, station.coords.z)
        SetBlipSprite(blip, 60)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 29)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(station.label)
        EndTextCommandSetBlipName(blip)
    end

    -- DOJ BLIP

    local coords = vec3(-1618.99, 198.78, 60.39)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 60)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 16)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString('Courthouse')
    EndTextCommandSetBlipName(blip)
end)
