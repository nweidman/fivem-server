if Config.Framework ~= 'qbcore' then return end

local ResetStress = false

local QBCore = exports['qb-core']:GetCoreObject()

function GetSource(Player)
    return Player.PlayerData.source
end

function IsAdmin(Player, role)
    return QBCore.Functions.HasPermission(Player.PlayerData.source, role)
end

RegisterNetEvent('QBCore:Server:OnPlayerLoaded', function()
    local src = source
    Player = QBCore.Functions.GetPlayer(src)
end)

RegisterNetEvent('highqez_afk:server:UpdateFoodWater', function(data, value)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
	if data == 'thirst' then
		Player.Functions.SetMetaData('thirst', value)
		TriggerClientEvent('hud:client:UpdateNeeds', src, Player.PlayerData.metadata['hunger'], value)
	elseif data == 'hunger' then
		Player.Functions.SetMetaData('hunger', value)
		TriggerClientEvent('hud:client:UpdateNeeds', src, value, Player.PlayerData.metadata['thirst'])
	end
end)

RegisterNetEvent('highqez_afk:server:RelieveStress', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local newStress
    if not Player then return end
    if not ResetStress then
        if not Player.PlayerData.metadata['stress'] then
            Player.PlayerData.metadata['stress'] = 0
        end
        newStress = Player.PlayerData.metadata['stress'] - amount
        if newStress <= 0 then newStress = 0 end
    else
        newStress = 0
    end
    if newStress > 100 then
        newStress = 100
    end
    Player.Functions.SetMetaData('stress', newStress)
    TriggerClientEvent('hud:client:UpdateStress', src, newStress)
end)
