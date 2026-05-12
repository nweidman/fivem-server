if Sky.Config.phone == "okok" then

    function Sky.Functions.ChangeNumber(src, newNumber) 
        Sky.DB.SetValue("okokphone_phones", "phone_number", newNumber, "owner", Sky.FW.GetIdentifier(src))
        TriggerClientEvent("sky_base:notification", src, "Phone", "Your phone number has been changed. Please relog.", "warn", 10000)
    end

    function Sky.Functions.IsNumberUsed(phoneNumber)
        local result = Sky.Query('SELECT COUNT(*) as count FROM okokphone_phones WHERE phone_number = ?', { phoneNumber })
        if result[1] and result[1].count > 0 then
            return true
        else
            return false
        end
    end
end