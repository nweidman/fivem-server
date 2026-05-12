QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}

function SendNotification(localKey)
    local localeData = _L(localKey)
    if not localeData then return end
    
    if Config.okokNotify then
        exports['okokNotify']:Alert(localeData.title, localeData.text, localeData.time, localeData.type)
    else
        QBCore.Functions.Notify(localeData.text, localeData.type or localeData.color, localeData.time)
    end
end

function ShowTextUI(show, localKey)
    if show then
        if Config.okokTextUI then
            exports['okokTextUI']:Open(_L(localKey).text, _L(localKey).color, _L(localKey).position, false)
        else
            exports['qb-core']:DrawText(_L(localKey).text, _L(localKey).position)
        end
    else
        if Config.okokTextUI then
            exports['okokTextUI']:Close()
        else
            exports['qb-core']:HideText()
        end
    end
end

function IsDead()
    local playerData = QBCore.Functions.GetPlayerData()
    if playerData and playerData.metadata and playerData.metadata.isdead then
        return playerData.metadata.isdead
    end
    return IsEntityDead(PlayerPedId())
end

function GenerateIBAN()
    math.randomseed(GetGameTimer())
    local stringFormat = "%0" .. Config.IBANNumbers .. "d"
    local number = math.random(0, 10 ^ Config.IBANNumbers - 1)
    number = string.format(stringFormat, number)
    local iban = Config.IBANPrefix .. number:upper()
    local isIBanUsed = true
    local hasChecked = false

    while true do
        Wait(10)
        if isIBanUsed and not hasChecked then
            isIBanUsed = false
            lib.callback.await("okokBanking:IsIBanUsed", function(isUsed)
                if isUsed ~= nil then
                    isIBanUsed = true
                    number = math.random(0, 10 ^ Config.IBANNumbers - 1)
                    number = string.format("%03d", number)
                    iban = Config.IBANPrefix .. number:upper()
                elseif isUsed == nil then
                    hasChecked = true
                    isIBanUsed = false
                end
            end, iban)
        elseif not isIBanUsed and hasChecked then
            break
        end
    end
    TriggerServerEvent('okokBanking:SetIBAN', iban:upper())
end

RegisterNetEvent('QBCore:Client:OnMoneyChange', function(moneytype, amount, type, reason)
    if moneytype == 'bank' and isBankOpened then
        local pData = GetPlayerData()
        if pData and pData.money and pData.money.bank then

            if reason == "paycheck" and pData.citizenid then
                local playerName = (pData.charinfo.firstname or "") .. " " .. (pData.charinfo.lastname or "")
                local transactionData = {
                    sender_identifier = "bank",
                    sender_name = Locales[Config.Locale]['tx_paycheck'] or "Paycheck",
                    receiver_identifier = pData.citizenid,
                    receiver_name = playerName,
                    value = amount,
                    type = "transfer",
                    reason = Locales[Config.Locale]['tx_reason_paycheck'] or "Paycheck"
                }

                TriggerServerEvent('okokBanking:CreateTransaction', pData.citizenid, transactionData)

                Wait(100)
                local transactions = lib.callback.await("okokBanking:GetTransactions", false)

                SendNUIMessage({
                    action = "updatePlayerMoney",
                    bankBalance = pData.money.bank,
                    accountType = 'personal',
                    transactions = transactions
                })
            else
                SendNUIMessage({
                    action = "updatePlayerMoney",
                    bankBalance = pData.money.bank,
                    accountType = 'personal'
                })
            end
        end
    end
end)