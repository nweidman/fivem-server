if Sky.Config.billing == "jacksam" then
    function Sky.Functions.SendBill(src, target, account, reason, amount)
        local senderIdentifier = Sky.FW.GetIdentifier(src)
        local targetIdentifier = Sky.FW.GetIdentifier(target)
        local societyName = account:gsub("society_", "")
        exports["billing_ui"]:createBill(senderIdentifier or societyName, targetIdentifier, reason, amount, account, "society")
    end
end
