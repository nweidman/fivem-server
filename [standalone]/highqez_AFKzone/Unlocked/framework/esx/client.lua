if Config.Framework ~= 'esx' then return end

local ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerData = xPlayer
    PlayerJob = xPlayer.job.name
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
	PlayerJob = job.name
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
        if ESX.PlayerData ~= nil then
            PlayerData = ESX.PlayerData    
            PlayerJob = ESX.PlayerData.job.name
        end
	end
end)

AddEventHandler('esx_status:onTick', function(data)
	if currentzone == nil then
        for k, v in pairs(data) do
            if v.name == 'hunger' then
                hunger = v.val
            elseif v.name == 'thirst' then
                thirst = v.val
            end
        end
    end
end)