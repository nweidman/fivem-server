if Sky.Config.phone == "gks" then

    function Sky.Functions.ChangeNumber(src, newNumber) 
        exports["gksphone"]:NumberChange(src, newNumber)
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