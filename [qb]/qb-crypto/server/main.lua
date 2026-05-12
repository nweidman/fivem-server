-- Variables
local coin = Crypto.Coin
local QBCore = exports['qb-core']:GetCoreObject()
local bannedCharacters = {'%','$',';'}

MySQL.ready(function()
    local function ClearDailyLimit()
        local result = MySQL.Sync.fetchAll("SELECT citizenid, TIMESTAMPDIFF(DAY, last_cryptosale, current_timestamp()) AS time FROM players")
        local queries = {}
        local defaultQuery = 'UPDATE players SET last_cryptosold = 0 WHERE citizenid = :citizenid'
    
        if result then
            for index, player in pairs(result) do
                if player.time >= 1 then
                    queries[#queries+1] = {
                        query = defaultQuery,
                        values = {
                            ['citizenid'] = player.citizenid
                        }
                    }
                end
            end
        end
    
        if #queries > 0 then
            MySQL.transaction(queries)
        end

        Citizen.SetTimeout(Crypto.LimitCheck*60000, function()
            ClearDailyLimit()
        end)
    end

    ClearDailyLimit()
end)

-- Function
local function RefreshCrypto()
    local result = MySQL.query.await('SELECT * FROM crypto WHERE crypto = ?', { coin })
    if result ~= nil and result[1] ~= nil then
        Crypto.Worth[coin] = result[1].worth
        if result[1].history ~= nil then
            Crypto.History[coin] = json.decode(result[1].history)
            TriggerClientEvent('qb-crypto:client:UpdateCryptoWorth', -1, coin, result[1].worth, json.decode(result[1].history))
        else
            TriggerClientEvent('qb-crypto:client:UpdateCryptoWorth', -1, coin, result[1].worth, nil)
        end
    end
end

local function ErrorHandle(error)
    for k, v in pairs(Ticker.Error_handle) do
        if string.match(error, k) then
            return v
        end
    end
    return false
end

local function GetTickerPrice() -- Touch = no help
    local ticker_promise = promise.new()
    PerformHttpRequest("https://min-api.cryptocompare.com/data/price?fsym=" .. Ticker.coin .. "&tsyms=" .. Ticker.currency .. '&api_key=' .. Ticker.Api_key, function(Error, Result, _)
        local result_obj = json.decode(Result)
        if not result_obj['Response'] then
            local this_resolve = {error =  Error, response_data = result_obj[string.upper(Ticker.currency)]}
            ticker_promise:resolve(this_resolve) --- Could resolve Error aswell for more accurate Error messages? Solved in else
        else
            local this_resolve = {error =  result_obj['Message']}
            ticker_promise:resolve(this_resolve)
        end
    end, 'GET')
    Citizen.Await(ticker_promise)
    if type(ticker_promise.value.error) ~= 'number' then
        local get_user_friendly_error = ErrorHandle(ticker_promise.value.error)
        if get_user_friendly_error then
            return get_user_friendly_error
        else
            return '\27[31m Unexpected error \27[0m' --- Raised an error which we did not expect, script should be capable of sticking with last recorded price and shutting down the sync logic
        end
    else
        return ticker_promise.value.response_data
    end
end

local function HandlePriceChance()
    local currentValue = Crypto.Worth[coin]
    local prevValue = Crypto.Worth[coin]
    local trend = math.random(0,100)
    local event = math.random(0,100)
    local chance = event - Crypto.ChanceOfCrashOrLuck

    if event > chance then
        if trend <= Crypto.ChanceOfDown then
            currentValue = currentValue - math.random(Crypto.CasualDown[1], Crypto.CasualDown[2])
        elseif trend >= Crypto.ChanceOfUp then
            currentValue = currentValue + math.random(Crypto.CasualUp[1], Crypto.CasualUp[2])
        end
    else
        if math.random(0, 1) == 1 then
            currentValue = currentValue + math.random(Crypto.Luck[1], Crypto.Luck[2])
        else
            currentValue = currentValue - math.random(Crypto.Crash[1], Crypto.Crash[2])
        end
    end

    if currentValue <= Crypto.Lower then
        currentValue = Crypto.Lower
    elseif currentValue >= Crypto.Upper then
        currentValue = Crypto.Upper
    end

    if Crypto.History[coin][4] then
        -- Shift array index 1 to 3
        for k=3,1,-1 do
            Crypto.History[coin][k] = Crypto.History[coin][k+1]
        end
        -- Assign array index 4 to the latest result
        Crypto.History[coin][4] = {PreviousWorth = prevValue, NewWorth = currentValue}
    else
        Crypto.History[coin][#Crypto.History[coin] + 1] = {PreviousWorth = prevValue, NewWorth = currentValue}
    end

    Crypto.Worth[coin] = currentValue

    local history = json.encode(Crypto.History[coin])
    local props = {
        ['worth'] = currentValue,
        ['history'] = history,
        ['crypto'] = coin
    }
    MySQL.update(
        'UPDATE crypto set worth = :worth, history = :history where crypto = :crypto',
        props,
        function(affectedRows)
            if affectedRows < 1 then
                print("Crypto not found, inserting new record for " .. coin)
                MySQL.insert('INSERT INTO crypto (crypto, worth, history) VALUES (:crypto, :worth, :history)', props)
            end
            RefreshCrypto()
        end
    )
end

local function GetCryptoLimitSale(cid)
    local limit = 0
    local result = MySQL.query.await('SELECT last_cryptosold, TIMESTAMPDIFF(DAY, last_cryptosale, current_timestamp()) AS time FROM players WHERE citizenid = ?', {cid})

    if result then
        return result[1].last_cryptosold, result[1].time
    end
end

-- Commands

QBCore.Commands.Add("setcryptoworth", "Set crypto value", {{name="crypto", help="Name of the crypto currency"}, {name="Value", help="New value of the crypto currency"}}, false, function(source, args)
    local src = source
    local crypto = tostring(args[1])

    if crypto ~= nil then
        if Crypto.Worth[crypto] ~= nil then
            local NewWorth = math.ceil(tonumber(args[2]))

            if NewWorth ~= nil then
                local PercentageChange = math.ceil(((NewWorth - Crypto.Worth[crypto]) / Crypto.Worth[crypto]) * 100)
                local ChangeLabel = "+"

                if PercentageChange < 0 then
                    ChangeLabel = "-"
                    PercentageChange = (PercentageChange * -1)
                end

                if Crypto.Worth[crypto] == 0 then
                    PercentageChange = 0
                    ChangeLabel = ""
                end

                Crypto.History[crypto][#Crypto.History[crypto]+1] = {
                    PreviousWorth = Crypto.Worth[crypto],
                    NewWorth = NewWorth
                }

                TriggerClientEvent('QBCore:Notify', src, "You have changed the value of "..Crypto.Labels[crypto].." from: $"..Crypto.Worth[crypto].." to: $"..NewWorth.." ("..ChangeLabel.." "..PercentageChange.."%)")
                Crypto.Worth[crypto] = NewWorth
                TriggerClientEvent('qb-crypto:client:UpdateCryptoWorth', -1, crypto, NewWorth)
                MySQL.insert('INSERT INTO crypto (worth, history) VALUES (:worth, :history) ON DUPLICATE KEY UPDATE worth = :worth, history = :history', {
                    ['worth'] = NewWorth,
                    ['history'] = json.encode(Crypto.History[crypto]),
                })
            else
                TriggerClientEvent('QBCore:Notify', src, Lang:t('text.you_have_not_given_a_new_value', {crypto = Crypto.Worth[crypto]}))
            end
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('text.this_crypto_does_not_exist'))
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('text.you_have_not_provided_crypto_available_qbit'))
    end
end, "admin")

QBCore.Commands.Add("checkcryptoworth", "", {}, false, function(source)
    local src = source
    TriggerClientEvent('QBCore:Notify', src, Lang:t('text.the_qbit_has_a_value_of', {crypto = Crypto.Worth["qbit"]}))
end)

QBCore.Commands.Add("crypto", "", {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local MyPocket = math.ceil(Player.PlayerData.money.crypto * Crypto.Worth["qbit"])

    TriggerClientEvent('QBCore:Notify', src, Lang:t('text.you_have_with_a_value_of',{playerPlayerDataMoneyCrypto = Player.PlayerData.money.crypto,mypocket = MyPocket}))
end)

-- Events

RegisterServerEvent('qb-crypto:server:FetchWorth', function()
    for name,_ in pairs(Crypto.Worth) do
        local result = MySQL.query.await('SELECT * FROM crypto WHERE crypto = ?', { name })
        if result[1] ~= nil then
            Crypto.Worth[name] = result[1].worth
            if result[1].history ~= nil then
                Crypto.History[name] = json.decode(result[1].history)
                TriggerClientEvent('qb-crypto:client:UpdateCryptoWorth', -1, name, result[1].worth, json.decode(result[1].history))
            else
                TriggerClientEvent('qb-crypto:client:UpdateCryptoWorth', -1, name, result[1].worth, nil)
            end
        end
    end
end)

RegisterServerEvent('qb-crypto:server:ExchangeFail', function(boolean)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("cryptostick")

    local Item = boolean and "cryptoharddrive" or "cryptostick"

    local removedSuccess = exports.ox_inventory:RemoveItem(src, Item, 1)
    if removedSuccess then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.cryptostick_malfunctioned'), 'error')
    end
end)

RegisterServerEvent('qb-crypto:server:Rebooting', function(state, percentage)
    Crypto.Exchange.RebootInfo.state = state
    Crypto.Exchange.RebootInfo.percentage = percentage
end)

RegisterServerEvent('qb-crypto:server:GetRebootState', function()
    local src = source
    TriggerClientEvent('qb-crypto:client:GetRebootState', src, Crypto.Exchange.RebootInfo)
end)

RegisterServerEvent('qb-crypto:server:SyncReboot', function()
    TriggerClientEvent('qb-crypto:client:SyncReboot', -1)
end)

RegisterServerEvent('qb-crypto:server:ExchangeSuccess', function(LuckChance, Harddrive)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Item = Harddrive and "cryptoharddrive" or "cryptostick"
    
    if exports.ox_inventory:GetItemCount(src, Item) > 0 then
        local LuckyNumber = math.random(1, 10)
        local DeelNumber = 1000000
        local Amount = (math.random(5111111, 9999999) / DeelNumber)
        if LuckChance == LuckyNumber then
            Amount = (math.random(10111111, 17999999) / DeelNumber)
        end

        if Harddrive then
            Amount = Amount * 8
        end

        local removeSuccess = exports.ox_inventory:RemoveItem(src, Item, 1)
        -- print(removeSuccess)
        if removeSuccess then
            exports['drool_skills']:addXP(src, 1)
            Player.Functions.AddMoney('crypto', Amount, 'cryptostick decrypted')
            TriggerClientEvent('QBCore:Notify', src, Lang:t('success.you_have_exchanged_your_cryptostick_for',{amount = Amount}), "success", 3500)
            TriggerClientEvent('qb-phone:client:AddTransaction', src, Player, {},  Lang:t('credit.there_are_amount_credited',{amount = Amount}), "Credit")
        end
    end
end)

-- Callbacks

QBCore.Functions.CreateCallback('qb-crypto:server:HasSticky', function(source, cb)
    if exports.ox_inventory:GetItemCount(source, "cryptostick") > 0 then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-crypto:server:GetCryptoData', function(source, cb, name)
    local Player = QBCore.Functions.GetPlayer(source)
    local CryptoData = {
        History = Crypto.History[name],
        Worth = Crypto.Worth[name],
        Portfolio = Player.PlayerData.money.crypto,
        WalletId = Player.PlayerData.metadata["walletid"],
    }

    cb(CryptoData)
end)

QBCore.Functions.CreateCallback('qb-crypto:server:BuyCrypto', function(source, cb, data)
    local Player = QBCore.Functions.GetPlayer(source)
    local total_price = math.floor(tonumber(data.Coins) * tonumber(Crypto.Worth["qbit"]))
    local time = tonumber(os.date("%H"))
    if Player.PlayerData.money.bank >= total_price then
        --if time >= Crypto.MarketTime[1] and time <= Crypto.MarketTime[2] then
            local sold, time = GetCryptoLimitSale(Player.PlayerData.citizenid)

            if sold <= Crypto.BuySellLimitPerDay then
                if (tonumber(data.Coins) + sold) <= Crypto.BuySellLimitPerDay then
                    local CryptoData = {
                        History = Crypto.History["qbit"],
                        Worth = Crypto.Worth["qbit"],
                        Portfolio = Player.PlayerData.money.crypto + tonumber(data.Coins),
                        WalletId = Player.PlayerData.metadata["walletid"],
                    }

                    Player.Functions.RemoveMoney('bank', total_price, 'purchased crypto with crypto tablet')
                    TriggerClientEvent('qb-phone:client:AddTransaction', source, Player, data,  Lang:t('credit.you_have_qbit_purchased',{dataCoins = tonumber(data.Coins)}), "Credit")
                    Player.Functions.AddMoney('crypto', tonumber(data.Coins), 'purchased with crypto tablet')

                    MySQL.update('UPDATE players SET last_cryptosold = last_cryptosold + :amount, last_cryptosale = CURRENT_TIMESTAMP() WHERE citizenid = :citizenid', {
                        ['amount'] = tonumber(data.Coins),
                        ['citizenid'] = Player.PlayerData.citizenid
                    })
                else
                    TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, "You are trying to buy more than your limit for today!", "error")
                    cb(false)
                end
            else
                TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, "You've reached your limit for today!", "error")
                cb(false)
            end
        --else
        --    TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, "Crypto", "The market is closed!", "fas fa-chart-pie", "#FA5845")
        --    cb(false)
        --end
    else
        TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, "You don't have enough money..", "error")
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-crypto:server:SellCrypto', function(source, cb, data)
    local Player = QBCore.Functions.GetPlayer(source)
    local time = tonumber(os.date("%H"))

    if Player.PlayerData.money.crypto >= tonumber(data.Coins) then
        --if time >= Crypto.MarketTime[1] and time <= Crypto.MarketTime[2] then
            --local sold, time = GetCryptoLimitSale(Player.PlayerData.citizenid)

            --if sold <= Crypto.BuySellLimitPerDay then
                --if (tonumber(data.Coins) + sold) <= Crypto.BuySellLimitPerDay then 
                    local CryptoData = {
                        History = Crypto.History["qbit"],
                        Worth = Crypto.Worth["qbit"],
                        Portfolio = Player.PlayerData.money.crypto - tonumber(data.Coins),
                        WalletId = Player.PlayerData.metadata["walletid"],
                    }

                    Player.Functions.RemoveMoney('crypto', tonumber(data.Coins), 'sold crypto with crypto tablet')
                    local amount = math.floor(tonumber(data.Coins) * tonumber(Crypto.Worth["qbit"]))
                    TriggerClientEvent('qb-phone:client:AddTransaction', source, Player, data, Lang:t('depreciation.you_have_sold',{dataCoins = tonumber(data.Coins)}), "Depreciation")
                    Player.Functions.AddMoney('bank', amount, 'sold crypto with crypto tablet')

                    MySQL.update('UPDATE players SET last_cryptosold = last_cryptosold + :amount, last_cryptosale = CURRENT_TIMESTAMP() WHERE citizenid = :citizenid', {
                        ['amount'] = tonumber(data.Coins),
                        ['citizenid'] = Player.PlayerData.citizenid
                    })

                    cb(CryptoData)
                --else
                --    TriggerClientEvent('qb-phone:client:SendPhoneNotification', Player.PlayerData.source, "Crypto", "You are trying to sell more than your limit for today!", "fas fa-chart-pie", "#FA5845")
                --    cb(false)
                --end
            --else
            --    TriggerClientEvent('qb-phone:client:SendPhoneNotification', Player.PlayerData.source, "Crypto", "You've reached your limit for today!", "fas fa-chart-pie", "#FA5845")
            --    cb(false)
            --end
        --else
        --    TriggerClientEvent('qb-phone:client:SendPhoneNotification', Player.PlayerData.source, "Crypto", "The market is closed!", "fas fa-chart-pie", "#FA5845")
        --    cb(false)
        --end
    else
        TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, "You don't have enough Qbits..", "error")
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-crypto:server:TransferCrypto', function(source, cb, data)
    local newCoin = tostring(data.Coins)
    for _, v in pairs(bannedCharacters) do
        newCoin = string.gsub(newCoin, '%' .. v, '')
    end
    data.WalletId = tonumber(data.WalletId)
    data.Coins = tonumber(newCoin)
    local Player = QBCore.Functions.GetPlayer(source)
    local Target = QBCore.Functions.GetPlayer(data.WalletId)
    if Player.PlayerData.money.crypto >= tonumber(data.Coins) then
        if Target then
            Player.Functions.RemoveMoney('crypto', tonumber(data.Coins), 'transfered crypto to player')
            Target.Functions.AddMoney('crypto', tonumber(data.Coins), 'transfered crypto to player')

            TriggerClientEvent('QBCore:Notify', source, "You have "..tonumber(data.Coins).." Qbit('s) transferred!", "success")
            TriggerClientEvent('QBCore:Notify', Target.PlayerData.source, "There are "..tonumber(data.Coins).." Qbit('s) credited!", "primary")
        else
            cb("notvalid")
        end
    else
        cb("notenough")
    end
end)

-- Threads

CreateThread(function()
    while true do
        Wait(Crypto.RefreshTimer*60000)
        HandlePriceChance()
    end
end)

-- You touch = you break
if Ticker.Enabled then
    Citizen.CreateThread(function()
        local Interval = Ticker.tick_time * 60000
        if Ticker.tick_time < 2 then
            Interval = 120000
        end
        while(true) do
            local get_coin_price = GetTickerPrice()
            if type(get_coin_price) == 'number' then
                Crypto.Worth["qbit"] = get_coin_price
            else
                print('\27[31m' .. get_coin_price .. '\27[0m')
                Ticker.Enabled = false
                break
            end
            Citizen.Wait(Interval)
        end
    end)
end

QBCore.Functions.CreateUseableItem("cryptotablet", function(source, item)
    TriggerClientEvent('qb-crypto:client:openTablet', source)
end)