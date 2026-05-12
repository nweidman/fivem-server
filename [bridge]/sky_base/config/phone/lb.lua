if Sky.Config.phone == "lb" then

    function Sky.Functions.ChangeNumber(src, newNumber) 
        Sky.DB.SetValue("phone_phones", "phone_number", newNumber, "owner_id", Sky.FW.GetIdentifier(src))
        TriggerClientEvent("sky_base:notification", src, "Phone", "Your phone number has been changed", "success")
    end

    function Sky.Functions.IsNumberUsed(phoneNumber)
        local result = Sky.Query('SELECT COUNT(*) as count FROM phone_phones WHERE phone_number = ?', { phoneNumber })
        if result[1] and result[1].count > 0 then
            return true
        else
            return false
        end
    end
end