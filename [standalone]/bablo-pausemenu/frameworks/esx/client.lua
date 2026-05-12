Framework = Framework or {};

while not eventName do
    Citizen.Wait(100)
end

CreateThread(function()
    if Config.Framework ~= 'esx' then
        return
    end

    function Framework:getCore()
        return exports['es_extended']:getSharedObject();
    end

    local ESX = Framework:getCore();

    function Framework:isCharacterLoaded()
        return ESX.IsPlayerLoaded()
    end

    function Framework:Notify(message)
        ESX.ShowNotification(message)
    end

    function Framework:isPlayerDead()
        local isDead = false

        if GetEntityHealth(cache.ped) >= 1 then
            isDead = true
        end

        return isDead
    end

    function Framework:canOpen()
        -- Add your own logic here to determine if the player can open the menu

        return true
    end

    function Framework:onOpen()
        -- Add your own logic here to handle when the menu is opened
    end

    function Framework:onClose()
        -- Add your own logic here to handle when the menu is closed
    end

    RegisterNetEvent('esx:playerLoaded', function()
        Citizen.Wait(1000)

        TriggerEvent(eventName .. 'client:characterLoaded')
    end)
end)