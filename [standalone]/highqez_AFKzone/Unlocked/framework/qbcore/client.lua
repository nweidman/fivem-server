if Config.Framework ~= 'qbcore' then return end

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = PlayerData.job.name
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo.name
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
        if QBCore.Functions.GetPlayerData() ~= nil then
            PlayerData = QBCore.Functions.GetPlayerData()    
            PlayerJob = PlayerData.job.name
        end
	end
end)