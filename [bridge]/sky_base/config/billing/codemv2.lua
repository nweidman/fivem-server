if Sky.Config.billing == "codemv2" then
    function Sky.Functions.SendBill(src, target, account, reason, amount)
        exports['codem-billingv2']:CreateBillingJob(src, target, amount, reason, account)
    end
end
