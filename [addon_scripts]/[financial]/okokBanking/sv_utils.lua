QBCore = exports['qb-core']:GetCoreObject()

Webhook = ''

function CanWithdrawMoney(xPlayer, amount, bankMoney)
    -- Add your own logic here
    return true
end

function CanDepositMoney(xPlayer, amount, bankMoney)
    -- Add your own logic here
    return true
end

function CanTransferMoney(xPlayer, amount, bankMoney)
    -- Add your own logic here
    return true
end

function GetWalletMoney(xPlayer)
    if not xPlayer then return 0 end
    
    if Config.UseCashAsItem then
        local itemCash = xPlayer.Functions.GetItemByName("cash")
        if itemCash then
            return itemCash.amount
        end
        return 0
    else
        return xPlayer.PlayerData.money.cash
    end
end

function GetBankMoney(xPlayer)
    if not xPlayer then return 0 end
    
    return xPlayer.PlayerData.money.bank
end

function AddMoneyPlayer(xPlayer, amount, account)
    if not xPlayer then return end
    
    if xPlayer.Functions ~= nil then
        if Config.UseCashAsItem and account == 'cash' then
            xPlayer.Functions.AddItem("cash", amount)
        else
            xPlayer.Functions.AddMoney(account, amount)
        end
    else
        if account == 'bank' or (account == 'cash' and not Config.UseCashAsItem) then
            MySQL.update.await('UPDATE players SET money = JSON_SET(money, ?, JSON_EXTRACT(money, ?) + ?) WHERE citizenid = ?', 
                {'$.' .. account, '$.' .. account, amount, xPlayer})
        end
    end
end

function RemoveMoneyPlayer(xPlayer, amount, account)
    if not xPlayer then return end
    
    
    if Config.UseCashAsItem and account == 'cash' then
        local itemCash = xPlayer.Functions.GetItemByName("cash")
        if itemCash and itemCash.amount >= amount then
            xPlayer.Functions.RemoveItem("cash", amount)
        end
    else
        xPlayer.Functions.RemoveMoney(account, amount)
    end
end

function AddMoneyToSociety(society, amount)
    society = string.gsub(society, "^society_", "")
    if Config.SocietyResource == "okokBanking" then
        MySQL.update.await('UPDATE okokbanking_societies SET value = value + @value WHERE society = @society OR society = @society2', {
            ['@value'] = amount,
            ['@society'] = society,
            ['@society2'] = society,
        })
    elseif Framework == 'qbcore' then
        exports[Config.SocietyResource]:AddMoney(society, amount)
    end
end

function RemoveMoneyFromSociety(society, amount)
    society = string.gsub(society, "^society_", "")
    if Config.SocietyResource == "okokBanking" then
        MySQL.update.await('UPDATE okokbanking_societies SET value = value - @value WHERE society = @society OR society = @society2', {
            ['@value'] = amount,
            ['@society'] = 'society_' .. string.gsub(society, "^society_", ""),
            ['@society2'] = string.gsub(society, "^society_", ""),
        })
    elseif Framework == 'qbcore' then
        exports[Config.SocietyResource]:RemoveMoney(society, amount)
    end
end

function GetSocietyBalance(society)
    if Config.SocietyResource == "okokBanking" then
        local societyInfo = MySQL.single.await('SELECT value FROM okokbanking_societies WHERE society = ?',
            { society })
        return tonumber((societyInfo and societyInfo.value) or 0)
    elseif Framework == 'qbcore' then
        return exports[Config.SocietyResource]:GetAccountBalance(society)
    end
end

function AddItem(source, item, amount, info, receiptInfo)
    if Config.EnableCards and Config.InventoryResource == 'ox_inventory' then
        local success, response = exports.ox_inventory:AddItem(source, item, amount, receiptInfo, 1)
 
        if not success then
            return print(response)
        end
    else
        exports[Config.InventoryResource]:AddItem(source, item, amount, info, receiptInfo)
    end
end

function CanAddItem(source, item, amount)
    if Config.EnableCards and Config.InventoryResource == 'ox_inventory' then
        return exports.ox_inventory:CanCarryItem(source, item, amount)
    else
        return exports[Config.InventoryResource]:CanAddItem(source, item, amount)
    end
end

function HasItem(xPlayer, item)
    if not xPlayer then return false end
    
    if Config.EnableCards and Config.InventoryResource == 'ox_inventory' then
        return true
    else
        local itemData = xPlayer.Functions.GetItemByName(item)
        return itemData ~= nil and itemData.amount > 0
    end
end

function GetItemsByName(source, itemName)
    if Config.EnableCards and Config.InventoryResource == 'ox_inventory' then
        local items = {}
        local inventory = exports.ox_inventory:GetInventory(source)
        if inventory and inventory.items then
            for slot, item in pairs(inventory.items) do
                if item and item.name == itemName then
                    table.insert(items, {
                        name = item.name,
                        count = item.count or 0,
                        info = item.metadata or item.info or {}
                    })
                end
            end
        else
            local itemData = exports.ox_inventory:GetItem(source, itemName)
            if itemData and itemData.count and itemData.count > 0 then
                table.insert(items, {
                    name = itemName,
                    count = itemData.count,
                    info = itemData.metadata or itemData.info or {}
                })
            end
        end
        
        return items
    elseif Config.EnableCards then
        return exports[Config.InventoryResource]:GetItemsByName(source, Config.CreditCardItem)
    end
end

if Config.EnableCards and Config.InventoryResource == 'ox_inventory' then
    AddEventHandler('ox_inventory:usedItem', function(playerId, name, slotId, metadata)
        if Config.EnableCards and Config.InventoryResource == 'ox_inventory' then
            if name == Config.ReceiptItem then
                local itemInfo = metadata or {}
                if not itemInfo["Reference"] and itemInfo["Sender IBAN"] then
                    TriggerClientEvent('okokBanking:ShowTransactionReceipt', playerId, itemInfo)
                elseif itemInfo["Reference"] then
                    local refId = itemInfo["Reference"]
                    local invoice = MySQL.single.await(
                        'SELECT id, ref_id, invoice_value, fees_amount, sent_date, limit_pay_date, paid_date, status, receiver_name, author_name, item, notes FROM okokbilling WHERE ref_id = ?',
                        { refId })
                    if invoice then
                        invoice.invoice_value = invoice.invoice_value + invoice.fees_amount
                        TriggerClientEvent('okokBanking:ShowReceipt', playerId, invoice)
                    end
                end
            end
        end
    end)
else
    function CreateReceiptUseableItem()
        QBCore.Functions.CreateUseableItem(Config.ReceiptItem, function(source, item)
            local xPlayer = GetPlayer(source)
            local itemInfo = item.info
            if not itemInfo["Reference"] and itemInfo["Sender IBAN"] then
                TriggerClientEvent('okokBanking:ShowTransactionReceipt', source, itemInfo)
            else
                local refId = itemInfo["Reference"]
                local invoice = MySQL.single.await(
                    'SELECT id, ref_id, invoice_value, fees_amount, sent_date, limit_pay_date, paid_date, status, receiver_name, author_name, item, notes FROM okokbilling WHERE ref_id = ?',
                    { refId })
                if invoice then
                    invoice.invoice_value = invoice.invoice_value + invoice.fees_amount
                    TriggerClientEvent('okokBanking:ShowReceipt', source, invoice)
                end
            end
        end)
    end
    
    CreateThread(function()
        Wait(100)
        CreateReceiptUseableItem()
    end)
end

local COLS = table.concat({ "id", "ref_id", "author_name", "society_name", "item", "invoice_value", "status", "notes",
    "sent_date", "limit_pay_date", "paid_date", "receiver_identifier", "society", "receiver_name", "fees_amount" }, ",")

local SQL_PERSONAL = ("SELECT %s FROM okokbilling WHERE receiver_identifier = ?"):format(COLS)
local SQL_SOCIETY_ANY = ("SELECT %s FROM okokbilling WHERE society = ?"):format(COLS)

lib.callback.register('okokBanking:GetPlayerBills', function(source, includeSociety)
    if not isBillingStarted then return end
    local xPlayer = GetPlayer(source)
    if not xPlayer then
        return {}, {}
    end

    local cid = xPlayer.PlayerData.citizenid
    local job = xPlayer.PlayerData.job and xPlayer.PlayerData.job.name or nil

    local bills = MySQL.query.await(SQL_PERSONAL, { cid }) or {}

    for _, bill in pairs(bills) do
        bill.fees_amount = bill.fees_amount or 0
        bill.invoice_value = bill.invoice_value or 0
        bill.invoice_value = bill.invoice_value + bill.fees_amount
    end

    if includeSociety and job then
        local base = job:gsub("^society_", "")
        local societyBills = MySQL.query.await(SQL_SOCIETY_ANY, { base }) or {}
        for _, bill in pairs(societyBills) do
            bill.fees_amount = bill.fees_amount or 0
            bill.invoice_value = bill.invoice_value or 0
            bill.invoice_value = bill.invoice_value + bill.fees_amount
        end
        return bills, societyBills
    end

    return bills, {}
end)

lib.callback.register('okokBanking:PaySingleBill', function(source, refId)
    if not isBillingStarted then return end
    local xPlayer = GetPlayer(source)
    if not xPlayer then
        return false, "bill_payment_failed"
    end

    local identifier = xPlayer.PlayerData.citizenid

    local bill = MySQL.single.await(
        'SELECT id, ref_id, invoice_value, fees_amount, society, society_name, author_identifier, author_name, item FROM okokbilling WHERE receiver_identifier = ? AND ref_id = ? AND status = "unpaid"',
        { identifier, refId })

    if not bill then
        return false, "bill_payment_failed"
    end

    local invoiceValue = tonumber(bill.invoice_value) or 0
    local feesAmount = tonumber(bill.fees_amount) or 0
    local totalAmount = invoiceValue + feesAmount

    local bankMoney = GetBankMoney(xPlayer)
    if bankMoney < totalAmount then
        return false, "bill_payment_failed"
    end

    RemoveMoneyPlayer(xPlayer, totalAmount, 'bank')

    local hasSociety = bill.society and bill.society ~= "" and string.gsub(bill.society, "%s+", "") ~= ""

    MySQL.update.await(
        'UPDATE okokbilling SET status = "paid", paid_date = CURRENT_TIMESTAMP() WHERE ref_id = ?', { bill.ref_id })

    if hasSociety then
        AddMoneyToSociety(string.gsub(bill.society, "^society_", ""), totalAmount)
    else
        if bill.author_identifier then
            local xAuthor = GetPlayerByCitizenId(bill.author_identifier)
            if xAuthor then
                AddMoneyPlayer(xAuthor, totalAmount, 'bank')
            else
                local authorMoney = MySQL.scalar.await('SELECT money FROM players WHERE citizenid = ?',
                    { bill.author_identifier })
                if authorMoney then
                    local money = json.decode(authorMoney)
                    money.bank = (money.bank or 0) + totalAmount
                    MySQL.update.await('UPDATE players SET money = ? WHERE citizenid = ?',
                        { json.encode(money), bill.author_identifier })
                end
            end
        end
    end

    local playerName = (xPlayer.PlayerData.charinfo.firstname or "") ..
        " " .. (xPlayer.PlayerData.charinfo.lastname or "")
    AddTransaction(identifier, {
        sender_identifier = identifier,
        sender_name = playerName,
        receiver_identifier = hasSociety and (bill.society or "") or (bill.author_identifier or ""),
        receiver_name = hasSociety and (bill.society_name or "") or (bill.author_name or ""),
        value = totalAmount,
        type = "bill_payment",
        reason = _L('tx_reason_paid_bill') .. ' ' .. (bill.item or ""),
        date = os.date('%Y/%m/%d - %H:%M:%S')
    })

    local updatedBankMoney = bankMoney - totalAmount
    local transactions = GetPlayerTransactions(identifier)

    local updatedBill = MySQL.single.await(
        'SELECT ref_id, status, paid_date FROM okokbilling WHERE ref_id = ?', { bill.ref_id })

    return true, "bill_paid_success", updatedBankMoney, transactions, updatedBill
end)

lib.callback.register('okokBanking:PayAllBills', function(source)
    if not isBillingStarted then return end
    local xPlayer = GetPlayer(source)
    if not xPlayer then
        return false, "player_not_found"
    end

    local identifier = xPlayer.PlayerData.citizenid

    local unpaidBills = MySQL.query.await(
        'SELECT id, ref_id, invoice_value, fees_amount, society, society_name, author_identifier, author_name, item FROM okokbilling WHERE receiver_identifier = ? AND status = "unpaid"',
        { identifier })

    if not unpaidBills or #unpaidBills == 0 then
        return false, "no_unpaid_bills_found"
    end

    local totalPrice = 0
    for _, bill in ipairs(unpaidBills) do
        local invoiceValue = tonumber(bill.invoice_value) or 0
        local feesAmount = tonumber(bill.fees_amount) or 0
        totalPrice = totalPrice + invoiceValue + feesAmount
    end

    local bankMoney = GetBankMoney(xPlayer)
    if bankMoney < totalPrice then
        return false, "insufficient_funds"
    end

    RemoveMoneyPlayer(xPlayer, totalPrice, 'bank')

    local successCount = 0
    local failedBills = {}

    for _, bill in ipairs(unpaidBills) do
        local invoiceValue = tonumber(bill.invoice_value) or 0
        local feesAmount = tonumber(bill.fees_amount) or 0
        local totalAmount = invoiceValue + feesAmount

        local hasSociety = bill.society and bill.society ~= "" and string.gsub(bill.society, "%s+", "") ~= ""

        local paySuccess = false

        do
            MySQL.update.await(
                'UPDATE okokbilling SET status = "paid", paid_date = CURRENT_TIMESTAMP() WHERE ref_id = ?',
                { bill.ref_id })

            if hasSociety then
                AddMoneyToSociety(string.gsub(bill.society, "^society_", ""), invoiceValue)
            else
                if bill.author_identifier then
                    local xAuthor = GetPlayerByCitizenId(bill.author_identifier)
                    if xAuthor then
                        AddMoneyPlayer(xAuthor, invoiceValue, 'bank')
                    else
                        local authorMoney = MySQL.scalar.await('SELECT money FROM players WHERE citizenid = ?',
                            { bill.author_identifier })
                        if authorMoney then
                            local money = json.decode(authorMoney)
                            money.bank = (money.bank or 0) + invoiceValue
                            MySQL.update.await('UPDATE players SET money = ? WHERE citizenid = ?',
                                { json.encode(money), bill.author_identifier })
                        end
                    end
                end
            end

            local playerName = (xPlayer.PlayerData.charinfo.firstname or "") ..
                " " .. (xPlayer.PlayerData.charinfo.lastname or "")
            AddTransaction(identifier, {
                sender_identifier = identifier,
                sender_name = playerName,
                receiver_identifier = hasSociety and (bill.society or "") or (bill.author_identifier or ""),
                receiver_name = hasSociety and (bill.society_name or "") or (bill.author_name or ""),
                value = totalAmount,
                type = "bill_payment",
                reason = _L('tx_reason_paid_bill') .. ' ' .. (bill.item or ""),
                date = os.date('%Y/%m/%d - %H:%M:%S')
            })

            paySuccess = true
        end

        if paySuccess then
            successCount = successCount + 1
        else
            table.insert(failedBills, bill.ref_id or bill.id)
        end
    end

    local updatedBankMoney = bankMoney - totalPrice
    local transactions = GetPlayerTransactions(identifier)

    if successCount > 0 then
        local message = string.format("Successfully paid %d bill(s)", successCount)
        if #failedBills > 0 then
            message = message .. string.format(" (%d failed)", #failedBills)
        end
        return true, "success_paid_all_bills", updatedBankMoney, transactions
    else
        return false, "error_paid_all_bills", updatedBankMoney, transactions
    end
end)

function GetPlayerIdentifiersForWebhook(source)
    local identifiers = {
        source = tostring(source) or "Unknown",
        license = GetPlayerIdentifierByType(source, 'license') or "Unknown",
        discord = GetPlayerIdentifierByType(source, 'discord') or "Not linked"
    }

    return identifiers
end

local function FormatCurrency(amount)
    local formatted = tostring(amount)
    local left, num, right = string.match(formatted, '^([^%d]*%d)(%d*)(.-)$')
    return (left or "") .. ((num or ""):reverse():gsub('(%d%d%d)', '%1,'):reverse()) .. (right or "") .. " " .. (Config.Currency or "EUR")
end

function SendBankingWebhook(webhookType, data, source)
    if Webhook == '' or Webhook == nil then return end
    
    local webhookConfig = Config.Webhook[webhookType]
    if not webhookConfig or not webhookConfig.enabled then return end
    
    local playerInfo = GetPlayerIdentifiersForWebhook(source)
    
    local titles = {
        ["deposit"] = _L('webhook_title_deposit'),
        ["withdraw"] = _L('webhook_title_withdraw'),
        ["transfer"] = _L('webhook_title_transfer'),
        ["savings_deposit"] = _L('webhook_title_savings_deposit'),
        ["savings_withdraw"] = _L('webhook_title_savings_withdraw'),
        ["savings_transfer"] = _L('webhook_title_savings_transfer'),
        ["loan_create"] = _L('webhook_title_loan_create'),
        ["account_create"] = _L('webhook_title_account_create'),
        ["account_delete"] = _L('webhook_title_account_delete'),
        ["account_add_user"] = _L('webhook_title_account_add_user'),
        ["account_remove_user"] = _L('webhook_title_account_remove_user'),
        ["account_change_permissions"] = _L('webhook_title_account_change_permissions'),
    }
    
    local title = titles[webhookType] or _L('webhook_title_default')
    local color = tonumber(webhookConfig.color) or 3447003
    local fields = {}
    
    if webhookType == "deposit" or webhookType == "withdraw" or webhookType == "transfer" then
        if data.sender_name then
            table.insert(fields, {
                name = _L('webhook_field_from'),
                value = tostring(data.sender_name) .. (data.sender_identifier and ("\n`" .. tostring(data.sender_identifier) .. "`") or ""),
                inline = true
            })
        end
        if data.receiver_name then
            table.insert(fields, {
                name = _L('webhook_field_to'),
                value = tostring(data.receiver_name) .. (data.receiver_identifier and ("\n`" .. tostring(data.receiver_identifier) .. "`") or ""),
                inline = true
            })
        end
        if data.value then
            table.insert(fields, {
                name = _L('webhook_field_amount'),
                value = FormatCurrency(data.value),
                inline = true
            })
        end
        if data.reason and data.reason ~= "" then
            table.insert(fields, {
                name = _L('webhook_field_reason'),
                value = tostring(data.reason),
                inline = false
            })
        end
        
    elseif webhookType == "savings_transfer" then
        if data.sender_name then
            table.insert(fields, {
                name = _L('webhook_field_from'),
                value = tostring(data.sender_name) .. (data.sender_identifier and ("\n`" .. tostring(data.sender_identifier) .. "`") or ""),
                inline = true
            })
        end
        if data.receiver_name then
            table.insert(fields, {
                name = _L('webhook_field_to'),
                value = tostring(data.receiver_name) .. (data.receiver_identifier and data.receiver_identifier ~= "multiple" and ("\n`" .. tostring(data.receiver_identifier) .. "`") or ""),
                inline = true
            })
        end
        if data.value then
            table.insert(fields, {
                name = _L('webhook_field_amount'),
                value = FormatCurrency(data.value),
                inline = true
            })
        end
        if data.account_type then
            table.insert(fields, {
                name = _L('webhook_field_reason'),
                value = string.format(_L('webhook_reason_savings_transfer'), tostring(data.account_type)),
                inline = false
            })
        end
        
    elseif webhookType == "savings_deposit" or webhookType == "savings_withdraw" then
        if data.account_type then
            table.insert(fields, {
                name = _L('webhook_field_account'),
                value = tostring(data.account_type),
                inline = true
            })
        end
        if data.value then
            table.insert(fields, {
                name = _L('webhook_field_amount'),
                value = FormatCurrency(data.value),
                inline = true
            })
        end
        if data.goal_name then
            table.insert(fields, {
                name = _L('webhook_field_goal'),
                value = tostring(data.goal_name),
                inline = true
            })
        end
        
    elseif webhookType == "loan_create" then
        if data.plan then
            table.insert(fields, {
                name = _L('webhook_field_loan_plan'),
                value = tostring(data.plan),
                inline = true
            })
        end
        if data.amount then
            table.insert(fields, {
                name = _L('webhook_field_amount'),
                value = FormatCurrency(data.amount),
                inline = true
            })
        end
        if data.interest then
            table.insert(fields, {
                name = _L('webhook_field_interest_rate'),
                value = tostring(data.interest) .. "%",
                inline = true
            })
        end
        if data.months then
            table.insert(fields, {
                name = _L('webhook_field_duration'),
                value = string.format(_L('webhook_duration_months'), tostring(data.months)),
                inline = true
            })
        end
        if data.player_name then
            table.insert(fields, {
                name = _L('webhook_field_borrower'),
                value = tostring(data.player_name),
                inline = true
            })
        end
        
    elseif webhookType == "account_create" then
        if data.account_name then
            table.insert(fields, {
                name = _L('webhook_field_account_name'),
                value = tostring(data.account_name),
                inline = true
            })
        end
        if data.iban then
            table.insert(fields, {
                name = _L('webhook_field_iban'),
                value = "`" .. tostring(data.iban) .. "`",
                inline = true
            })
        end
        if data.owner then
            table.insert(fields, {
                name = _L('webhook_field_owner'),
                value = tostring(data.owner),
                inline = true
            })
        end
        
    elseif webhookType == "account_delete" then
        if data.account_name then
            table.insert(fields, {
                name = _L('webhook_field_account_name'),
                value = tostring(data.account_name),
                inline = true
            })
        end
        if data.iban then
            table.insert(fields, {
                name = _L('webhook_field_iban'),
                value = "`" .. tostring(data.iban) .. "`",
                inline = true
            })
        end
        if data.owner then
            table.insert(fields, {
                name = _L('webhook_field_owner'),
                value = tostring(data.owner),
                inline = true
            })
        end
        if data.balance then
            table.insert(fields, {
                name = _L('webhook_field_final_balance'),
                value = FormatCurrency(data.balance),
                inline = true
            })
        end
        
    elseif webhookType == "account_add_user" then
        if data.account_name then
            table.insert(fields, {
                name = _L('webhook_field_account'),
                value = tostring(data.account_name),
                inline = true
            })
        end
        if data.added_user then
            table.insert(fields, {
                name = _L('webhook_field_added_user'),
                value = tostring(data.added_user),
                inline = true
            })
        end
        if data.owner then
            table.insert(fields, {
                name = _L('webhook_field_account_owner'),
                value = tostring(data.owner),
                inline = true
            })
        end
        
    elseif webhookType == "account_remove_user" then
        if data.account_name then
            table.insert(fields, {
                name = _L('webhook_field_account'),
                value = tostring(data.account_name),
                inline = true
            })
        end
        if data.removed_user then
            table.insert(fields, {
                name = _L('webhook_field_removed_user'),
                value = tostring(data.removed_user),
                inline = true
            })
        end
        if data.owner then
            table.insert(fields, {
                name = _L('webhook_field_account_owner'),
                value = tostring(data.owner),
                inline = true
            })
        end
        
    elseif webhookType == "account_change_permissions" then
        if data.account_name then
            table.insert(fields, {
                name = _L('webhook_field_account'),
                value = tostring(data.account_name),
                inline = true
            })
        end
        if data.user then
            table.insert(fields, {
                name = _L('webhook_field_user'),
                value = tostring(data.user),
                inline = true
            })
        end
        if data.permissions then
            table.insert(fields, {
                name = _L('webhook_field_new_permissions'),
                value = tostring(data.permissions),
                inline = false
            })
        end
    end
    
    table.insert(fields, {
        name = _L('webhook_field_player_source'),
        value = tostring(playerInfo.source),
        inline = true
    })
    table.insert(fields, {
        name = _L('webhook_field_license'),
        value = "`" .. tostring(playerInfo.license) .. "`",
        inline = true
    })
    table.insert(fields, {
        name = _L('webhook_field_discord'),
        value = playerInfo.discord ~= "Not linked" and ("<@" .. string.gsub(playerInfo.discord, "discord:", "") .. ">") or _L('webhook_discord_not_linked'),
        inline = true
    })
    
    local embed = {
        {
            ["title"] = title,
            ["color"] = color,
            ["fields"] = fields,
            ["author"] = {
                ["name"] = Config.ServerName .. " - " .. _L('webhook_author_suffix'),
                ["icon_url"] = Config.IconURL ~= '' and Config.IconURL or nil
            },
            ["footer"] = {
                ["text"] = os.date(Config.DateFormat)
            }
        }
    }
    
    PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({
        username = Config.BotName,
        embeds = embed
    }), { ['Content-Type'] = 'application/json' })
end
