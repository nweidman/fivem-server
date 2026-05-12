if Sky.Config.phone == "yseries" then

    function Sky.Functions.ChangeNumber(src, newNumber) 
        local phoneImei = exports.yseries:GetPhoneImeiBySourceId(src)
        exports.yseries:ChangePhoneNumber(phoneImei, newNumber)
    end

    function Sky.Functions.IsNumberUsed(phoneNumber)
        return false
    end
end