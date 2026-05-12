if Sky.Config.billing == "codem" then
    
    function Sky.Functions.SendBill(src, target, account, reason, amount)
        exports['codem-billing']:createBilling(src, target, amount, reason, account)
    end
end
