if Sky.Config.phone == "esx" then

    function Sky.Functions.ChangeNumber(src, newNumber) 
        Sky.DB.SetValue("users", "phone_number", newNumber, "identifier", Sky.FW.GetIdentifier(src))
        TriggerClientEvent("sky_base:notification", src, "Phone", "Your phone number has been changed. Please relog.", "warn", 10000)
    end

    function Sky.Functions.IsNumberUsed(phoneNumber)
        local result = Sky.Query('SELECT * FROM users WHERE phone_number = ?', { phoneNumber })
        if result[1] then
            return true
        else
            return false
        end
    end
end