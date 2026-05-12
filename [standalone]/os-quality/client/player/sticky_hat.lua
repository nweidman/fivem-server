local cachedPed = nil

local function UpdatePedProps()
    local currentPed = PlayerPedId()
    if DoesEntityExist(currentPed) and currentPed ~= cachedPed then
        cachedPed = currentPed
        SetPedCanLosePropsOnDamage(cachedPed, false, 0)
    end
end

local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    UpdatePedProps()
end)

RegisterNetEvent('QBCore:Client:OnPlayerSpawn', function()
    UpdatePedProps()
end)

Citizen.CreateThread(function()
    while true do
        UpdatePedProps()
        Citizen.Wait(5000)
    end
end)
