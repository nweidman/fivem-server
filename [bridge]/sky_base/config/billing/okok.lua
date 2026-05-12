if Sky.Config.billing == "okok" then
    
    function Sky.Functions.SendBill(src, target, account, reason, amount)
        local sourceName = Sky.FW.GetName(src)
        local sourceIdentifier = Sky.FW.GetIdentifier(src)
        local societyName = account:gsub("society_", "")
        TriggerEvent("okokBilling:CreateCustomInvoice", target, amount, reason, sourceName, account, societyName, sourceIdentifier or societyName)
    end
end