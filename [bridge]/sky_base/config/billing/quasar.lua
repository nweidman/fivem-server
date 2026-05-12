if Sky.Config.billing == "quasar" then
    function Sky.Functions.SendBill(src, target, account, reason, amount)
        local societyName = account:gsub("society_", "")
        if src == 0 then
            exports['qs-billing']:CreateBill(src, target, societyName, amount, reason)
        else
            exports['qs-billing']:CreateBillByJob(societyName, target, amount, reason)
        end
    end
end
