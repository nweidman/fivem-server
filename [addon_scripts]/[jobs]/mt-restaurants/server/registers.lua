lib.locale()

lib.callback.register('mt-restaurants:server:makePlayersList', function(source)
	local onlineList = {}
    if Config.framework == 'qb' then
        for _, v in pairs(Config.core.Functions.GetQBPlayers()) do
            if v then
                onlineList[#onlineList+1] = { value = v.PlayerData.source, text = "["..v.PlayerData.source.."] - "..v.PlayerData.charinfo.firstname..' '..v.PlayerData.charinfo.lastname }
            end
        end
    elseif Config.framework == 'qbx' then
        for _, v in pairs(exports.qbx_core:GetQBPlayers()) do
            if v then
                onlineList[#onlineList+1] = { value = v.PlayerData.source, text = "Customer #"..v.PlayerData.source.."" }
            end
        end
    elseif Config.framework == 'esx' then
        for _, v in pairs(GetPlayers()) do
            local id = tonumber(v)
            local Player = Config.core.GetPlayerFromId(id)
            if Player then
                onlineList[#onlineList+1] = { value = id, text = "["..id.."] - "..Player.getName() }
            end
        end
    end
	return onlineList
end)

lib.callback.register('mt-restaurants:server:chargePlayer', function(source, player, price, type, job, id)
    local src = source
    price = tonumber(price)
    if not price or price <= 0 then return end

    if Config.framework == 'qb' then
        local biller = Config.core.Functions.GetPlayer(src)
        local billed = Config.core.Functions.GetPlayer(tonumber(player))
        if not biller or not billed then return end
        local balance = billed.Functions.GetMoney(type)
        if price and price > 0 then
            if balance >= price then
                lib.callback.await('mt-restaurants:client:registerConfirmPay', tonumber(player), price, src, type, job, id)
            else
                TriggerClientEvent('mt-restaurants:client:notify', src, locale('notify_error_register_player_no_money'), 'error')
                TriggerClientEvent('mt-restaurants:client:notify', tonumber(player), locale('notify_error_register_you_no_money'), 'error')
            end
        end
    elseif Config.framework == 'qbx' then
        local biller = exports.qbx_core:GetPlayer(src)
        local billed = exports.qbx_core:GetPlayer(tonumber(player))
        if not biller or not billed then return end
        local balance = billed.Functions.GetMoney(type)
        if price and price > 0 then
            if balance >= price then
                lib.callback.await('mt-restaurants:client:registerConfirmPay', tonumber(player), price, src, type, job, id)
            else
                TriggerClientEvent('mt-restaurants:client:notify', src, locale('notify_error_register_player_no_money'), 'error')
                TriggerClientEvent('mt-restaurants:client:notify', tonumber(player), locale('notify_error_register_you_no_money'), 'error')
            end
        end
    elseif Config.framework == 'esx' then
        local biller = Config.core.GetPlayerFromId(src)
        local billed = Config.core.GetPlayerFromId(tonumber(player))
        if not biller or not billed then return end
        local balance = billed.getAccount(type).money
        if price and price > 0 then
            if balance >= price then
                lib.callback.await('mt-restaurants:client:registerConfirmPay', tonumber(player), price, src, type, job, id)
            else
                TriggerClientEvent('mt-restaurants:client:notify', src, locale('notify_error_register_player_no_money'), 'error')
                TriggerClientEvent('mt-restaurants:client:notify', tonumber(player), locale('notify_error_register_you_no_money'), 'error')
            end
        end
    end

    return true
end)

lib.callback.register('mt-restaurants:server:confirmPayment', function(source, price, billerId, type, job, id)
    local src = source
    price = tonumber(price)
    if not price or price <= 0 then return end

    if Config.framework == 'qb' then
        local billed = Config.core.Functions.GetPlayer(src)
        local biller = Config.core.Functions.GetPlayer(tonumber(billerId))
        if not biller or not billed then return end
        billed.Functions.RemoveMoney(type, price, 'restaurants-payment')
        biller.Functions.AddMoney(type, tonumber(math.floor(price*Config.restaurants[job].registers[id].comission/100)), 'restaurants-payment-commission')
    elseif Config.framework == 'qbx' then
        local billed = exports.qbx_core:GetPlayer(src)
        local biller = exports.qbx_core:GetPlayer(tonumber(billerId))
        if not biller or not billed then return end
        billed.Functions.RemoveMoney(type, price, 'restaurants-payment')
        biller.Functions.AddMoney(type, tonumber(math.floor(price*Config.restaurants[job].registers[id].comission/100)), 'restaurants-payment-commission')
    elseif Config.framework == 'esx' then
        local billed = Config.core.GetPlayerFromId(src)
        local biller = Config.core.GetPlayerFromId(tonumber(billerId))
        if not biller or not billed then return end
        billed.removeAccountMoney(type, price)
        biller.addAccountMoney(type, tonumber(math.floor(price*Config.restaurants[job].registers[id].comission/100)))
    end

    -- print(job, tonumber(math.floor(price-(price*Config.restaurants[job].registers[id].comission/100))))
    addAccountMoney(job, tonumber(math.floor(price-(price*Config.restaurants[job].registers[id].comission/100))))
    TriggerClientEvent('mt-restaurants:client:notify', tonumber(billerId), locale('notify_success_register_player_paid', price), 'success')
    TriggerClientEvent('mt-restaurants:client:notify', src, locale('notify_success_register_you_paid', price), 'success')
    createLog(LogsConfig.registers, locale('logs_player_charged'), locale('logs_player_charged_desc', GetPlayerName(tonumber(billerId)), billerId, GetPlayerName(src), src, job, price))
    return true
end)