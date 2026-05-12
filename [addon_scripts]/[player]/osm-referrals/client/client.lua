exports['qb-core']:GetCoreObject()
local loginTime = 0
local sessionSeconds = 0

RegisterNetEvent('osm-referrals:Client:MainTrigger')
AddEventHandler('osm-referrals:Client:MainTrigger', function(code)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "openreferral",
        code = code,
    })  
end)

RegisterNUICallback('sumbit', function(data, cb)
    TriggerServerEvent('osm-referrals:PostSubmit', data)
    SetNuiFocus(false, false)
    cb(200)
end)

RegisterNUICallback('exit', function(data, cb)
    SetNuiFocus(false, false)
    cb(200)
end)

RegisterNetEvent('osm-referrals:StartWaiting')
AddEventHandler('osm-referrals:StartWaiting', function(res)
    if res.timeplayed then
        exports.qbx_core:Notify('You need to play '..Config.WaitTime-res.timeplayed..' more minutes to receive your referrals reward!', 'info')
        Citizen.Wait(1000 * 60 * (Config.WaitTime-res.timeplayed))
    else
        Citizen.Wait(1000 * 60 * Config.WaitTime)
    end
    TriggerServerEvent('osm-referrals:Server:RewardsPayout', res)
end)

RegisterNetEvent('osm-referrals:client:GetLeaderboardMenu')
AddEventHandler('osm-referrals:client:GetLeaderboardMenu', function()
    TriggerServerEvent('osm-referrals:Server:GetLeaderboardMenu')
end)

RegisterNetEvent('osm-referrals:client:ReturnToMainMenu')
AddEventHandler('osm-referrals:client:ReturnToMainMenu', function()
    TriggerServerEvent('osm-referrals:Server:ReturnToMainMenu')
end)

RegisterNetEvent('osm-referrals:client:ClaimPendingRew')
AddEventHandler('osm-referrals:client:ClaimPendingRew', function(data)
    TriggerServerEvent('osm-referrals:Server:ClaimPendingRew', data)
end)

RegisterNetEvent('osm-referrals:openRefMenu', function(menu)
    exports['qb-menu']:openMenu(menu)
end)


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('osm-referrals:Server:CheckCode')
end)

