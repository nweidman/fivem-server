if Sky.Config.phone == "qb" then

    function Sky.Functions.ChangeNumber(src, newNumber) 
        local xPlayer = QBCore.Functions.GetPlayer(src)
        local charInfo = xPlayer.PlayerData.charinfo
		charInfo.phone = newNumber
		xPlayer.Functions.SetPlayerData("charinfo", charInfo)
		xPlayer.Functions.Save()
		xPlayer.Functions.UpdatePlayerData(false)
		TriggerClientEvent('QBCore:Player:UpdatePlayerData', src)
    end

    function Sky.Functions.IsNumberUsed(phoneNumber)
        local pattern = '%"phone%":"%' .. phoneNumber .. '%"%'
        local result = Sky.Query('SELECT citizenid FROM players WHERE charinfo LIKE ?', {pattern})
        if result[1] then
            return true
        else
            return false
        end
    end
end