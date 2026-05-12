-- Variables
local QBCore = exports['qb-core']:GetCoreObject()
local requiredItemsShowed = false
local requiredItems = {[1] = {name = QBCore.Shared.Items["cryptostick"]["name"], image = QBCore.Shared.Items["cryptostick"]["image"]}}
local lastUse = 0

local PlayerData
local CryptoLevel

-- Tablet anim
local tabletDict = "amb@code_human_in_bus_passenger_idles@female@tablet@base"
local tabletAnim = "base"

-- Functions

local function DrawText3Ds(coords, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(coords.x, coords.y, coords.z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local function ExchangeSuccess(boolean)
    TriggerServerEvent('qb-crypto:server:ExchangeSuccess', math.random(10, 50), boolean)
end

local function ExchangeFail(boolean)
    TriggerServerEvent('qb-crypto:server:ExchangeFail', boolean)
    TriggerServerEvent('qb-crypto:server:SyncReboot')
end

local function SystemCrashCooldown()
    CreateThread(function()
        while Crypto.Exchange.RebootInfo.state do
            if (Crypto.Exchange.RebootInfo.percentage + 1) <= 100 then
                Crypto.Exchange.RebootInfo.percentage = Crypto.Exchange.RebootInfo.percentage + 1
                TriggerServerEvent('qb-crypto:server:Rebooting', true, Crypto.Exchange.RebootInfo.percentage)
            else
                Crypto.Exchange.RebootInfo.percentage = 0
                Crypto.Exchange.RebootInfo.state = false
                TriggerServerEvent('qb-crypto:server:Rebooting', false, 0)
            end
            Wait(1200)
        end
    end)
end

local function HackingSuccess(success)
    if success then
        TriggerEvent('mhacking:hide')
        ExchangeSuccess(false)
    else
        TriggerEvent('mhacking:hide')
        ExchangeFail(false)
    end
end


AddEventHandler('qb-crypto:client:StartHack', function(args)
    PlayerData = exports.qbx_core:GetPlayerData()
    CryptoLevel = PlayerData.metadata.skills.levels.crypto.tier
    local cooldown = 30000
    if CryptoLevel == 1 then cooldown = 25000 end
    if CryptoLevel == 2 then cooldown = 20000 end
    if CryptoLevel == 3 then cooldown = 15000 end
    if CryptoLevel >= 4 then cooldown = 10000 end -- Level 4 + 5 get cooldown benefit
    if args == "cryptostick" then
        if (GetGameTimer() - lastUse) >= cooldown then
            lastUse = GetGameTimer()
            if CryptoLevel == 5 then
                HackingSuccess(true)
                return
            end
            TriggerEvent("mhacking:show")
            TriggerEvent("mhacking:start", 3, 35, HackingSuccess)
        else
            QBCore.Functions.Notify('You have to wait a little while before you can hack again!', 'error')
        end

    elseif args == "cryptoharddrive" then
        if (GetGameTimer() - lastUse) >= cooldown*1 then
            lastUse = GetGameTimer()

            exports['ps-ui']:VarHack(function(success)
                if success then
                    ExchangeSuccess(true)
                else
                    ExchangeFail(true)
                end
            end, 5, 8) -- Number of Blocks, Time (seconds)
        else
            QBCore.Functions.Notify('You have to wait a little while before you can hack again!', 'error')
        end
    end
end)

local function openExchangeMenu()
    local exchangeOptions = {}

    if exports.ox_inventory:Search('count', 'cryptostick') > 0 then
        exchangeOptions[#exchangeOptions + 1] = {
            title = 'Crypto Stick Exchange',
            icon = 'fa-brands fa-usb',
            iconColor = 'limegreen',
            event = 'qb-crypto:client:StartHack',
            args = 'cryptostick'
        }
    end

    if exports.ox_inventory:Search('count', 'cryptoharddrive') > 0 then
        exchangeOptions[#exchangeOptions + 1] = {
            title = 'Crypto Hard Drive Exchange',
            icon = 'fa-solid fa-hard-drive',
            iconColor = 'red',
            event = 'qb-crypto:client:StartHack',
            args = 'cryptoharddrive'
        }
    end

    lib.registerContext({
        id = 'crypto_exchange_menu',
        title = 'Crypto Exchange Menu',
        options = exchangeOptions
    })

    lib.showContext('crypto_exchange_menu')
end

CreateThread(function()
    while true do
        local sleep = 5000
        if LocalPlayer.state.isLoggedIn then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local dist = #(pos - Crypto.Exchange.coords)
            if dist < 15 then
                sleep = 5
                if dist < 1.5 then
                    if not Crypto.Exchange.RebootInfo.state then
                        DrawText3Ds(Crypto.Exchange.coords, Lang:t('text.enter_usb'))
                        if not requiredItemsShowed then
                            requiredItemsShowed = true
                            TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                        end

                        if IsControlJustPressed(0, 38) then
                            openExchangeMenu()
                        end
                    else
                        DrawText3Ds(Crypto.Exchange.coords, Lang:t('text.system_is_rebooting', {rebootInfoPercentage = Crypto.Exchange.RebootInfo.percentage}) )
                    end
                else
                    if requiredItemsShowed then
                        requiredItemsShowed = false
                        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

-- Events

RegisterNetEvent('qb-crypto:client:SyncReboot', function()
    Crypto.Exchange.RebootInfo.state = true
    SystemCrashCooldown()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('qb-crypto:server:FetchWorth')
    TriggerServerEvent('qb-crypto:server:GetRebootState')
end)

RegisterNetEvent('qb-crypto:client:UpdateCryptoWorth', function(crypto, amount, history)
    Crypto.Worth[crypto] = amount
    if history ~= nil then
        Crypto.History[crypto] = history
    end
end)

RegisterNetEvent('qb-crypto:client:GetRebootState', function(RebootInfo)
    if RebootInfo.state then
        Crypto.Exchange.RebootInfo.state = RebootInfo.state
        Crypto.Exchange.RebootInfo.percentage = RebootInfo.percentage
        SystemCrashCooldown()
    end
end)