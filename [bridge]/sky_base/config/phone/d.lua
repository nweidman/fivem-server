if Sky.Config.phone == "d" then

    function Sky.Functions.ChangeNumber(src, newNumber) 
        TriggerClientEvent("d-phone:client:changenumber", src, newNumber)
    end

    function Sky.Functions.IsNumberUsed(phoneNumber)
        return false
    end
end