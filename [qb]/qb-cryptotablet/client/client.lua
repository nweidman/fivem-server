local QBCore = exports['qb-core']:GetCoreObject()

local tabletObj = nil
local tabletDict = "amb@code_human_in_bus_passenger_idles@female@tablet@base"
local tabletAnim = "base"
local tabletProp = `prop_cs_tablet`
local tabletBone = 60309
local tabletOffset = vector3(0.03, 0.002, -0.0)
local tabletRot = vector3(10.0, 160.0, 0.0)
local Crypto = {
    Worth = {
        ["qbit"] = 1000
    },
}

local function doAnimation()
    if not isOpen then return end
    -- Animation
    RequestAnimDict(tabletDict)
    while not HasAnimDictLoaded(tabletDict) do Citizen.Wait(100) end
    -- Model
    RequestModel(tabletProp)
    while not HasModelLoaded(tabletProp) do Citizen.Wait(100) end

    local plyPed = PlayerPedId()
    tabletObj = CreateObject(tabletProp, 0.0, 0.0, 0.0, true, true, false)
    local tabletBoneIndex = GetPedBoneIndex(plyPed, tabletBone)

    AttachEntityToEntity(tabletObj, plyPed, tabletBoneIndex, tabletOffset.x, tabletOffset.y, tabletOffset.z, tabletRot.x, tabletRot.y, tabletRot.z, true, false, false, false, 2, true)
    SetModelAsNoLongerNeeded(tabletProp)

    CreateThread(function()
        while isOpen do
            Wait(0)
            if not IsEntityPlayingAnim(plyPed, tabletDict, tabletAnim, 3) then
                TaskPlayAnim(plyPed, tabletDict, tabletAnim, 3.0, 3.0, -1, 49, 0, 0, 0, 0)
            end
        end


        ClearPedSecondaryTask(plyPed)
        Citizen.Wait(250)
        DetachEntity(tabletObj, true, false)
        DeleteEntity(tabletObj)
    end)
end

RegisterNetEvent('qb-crypto:client:openTablet', function()
    SendNUIMessage({
        action = 'setVisible',
        data = true
    })
    SetNuiFocus(true, true)
    isOpen = true
    doAnimation()
end)

-- RegisterCommand('test', function()
--     TriggerEvent('qb-crypto:client:openTablet')
-- end, false)


TriggerServerEvent('qb-crypto:server:FetchWorth')

RegisterNetEvent('qb-crypto:client:UpdateCryptoWorth', function(crypto, amount, history)
	Crypto.Worth[crypto] = amount
end)

RegisterNUICallback('getData', function(_, cb)
    print(Crypto.Worth["qbit"])
    
    cb({
        cryptoPrice = Crypto.Worth["qbit"]
    })
end)


RegisterNUICallback('hideUI', function(_, cb)
    cb({})
    SetNuiFocus(false, false)
    isOpen = false
end)

RegisterNUICallback('BuyCrypto', function(amount)
    local amt = tonumber(amount)

    if amt > 0 then
        QBCore.Functions.TriggerCallback('qb-crypto:server:BuyCrypto', function(bought)
            if not bought then
                QBCore.Functions.Notify("You don't have enough money to buy crypto!", "error")
            end
        end, {Coins = amt})
    else
        QBCore.Functions.Notify("Good luck exploting!", "error", 5000)
    end
end)

RegisterNUICallback('SellCrypto', function(amount)
    local amt = tonumber(amount)

    if amt > 0 then
        QBCore.Functions.TriggerCallback('qb-crypto:server:SellCrypto', function(sold)
            if not sold then
                QBCore.Functions.Notify("You don't have enough crypto to sell!", "error")
            end
        end, {Coins = amt})
    else
        QBCore.Functions.Notify("Good luck exploting!", "error", 5000)
    end
end)

RegisterNUICallback('TransferCrypto', function(data)
    QBCore.Functions.TriggerCallback('qb-crypto:server:TransferCrypto', function(cb)
        if cb == "notvalid" then
            QBCore.Functions.Notify("The wallet is not valid!", "error")
        elseif cb == "notenough" then
            QBCore.Functions.Notify("You don't have enough crypto to transfer!", "error")
        end
    end, data)
end)