if Sky.Config.billing == "esx" then
    
    function Sky.Functions.SendBill(src, target, account, reason, amount)
        local xPlayer = ESX.GetPlayerFromId(src)
        local societyName = account:gsub("society_", "")
        local senderIdentifier = xPlayer and xPlayer.identifier or societyName
        exports['esx_billing']:BillPlayer(target, senderIdentifier, account, reason, amount)
    end
end