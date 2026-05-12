Framework = Framework or {};

while not eventName do
    Citizen.Wait(100)
end

CreateThread(function()
    if Config.Framework ~= 'qbcore' then
        return
    end

    function Framework:getCore()
        return exports['qb-core']:GetCoreObject();
    end

    local QBCore = Framework:getCore();

    function Framework:isCharacterLoaded()
        return true
    end

    function Framework:Notify(message)
        QBCore.Functions.Notify(message)
    end

    function Framework:isPlayerDead()
        local isDead, playerData = false, QBCore.Functions.GetPlayerData()

        if not playerData.metadata['isdead'] and not playerData.metadata['inlaststand'] and not playerData.metadata['ishandcuffed'] and not IsPauseMenuActive() then
            isDead = true
        end

        return isDead
    end

    function Framework:canOpen()
        -- Add your own logic here to determine if the player can open the menu

        if IsPauseMenuActive() then
            return false
        end

        return true
    end

    function Framework:onOpen()
        -- Add your own logic here to handle when the menu is opened
    end

    function Framework:onClose()
        -- Add your own logic here to handle when the menu is closed
    end

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        Citizen.Wait(1000)

        TriggerEvent(eventName .. 'client:characterLoaded')
    end)
end)