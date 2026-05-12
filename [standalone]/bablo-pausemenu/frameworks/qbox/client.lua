Framework = Framework or {}

while not eventName do
    Citizen.Wait(100)
end

CreateThread(function()
    if Config.Framework ~= 'qbox' then
        return
    end

    function Framework:getCore()
        return exports['qb-core']:GetCoreObject()
    end

    local QBX = Framework:getCore()

    function Framework:isCharacterLoaded()
        -- If you want to be stricter you can hook QBCore:Client:OnPlayerLoaded,
        -- but the pause menu script usually just needs true here.
        return true
    end

    function Framework:Notify(message)
        QBX.Functions.Notify(message)
    end

    -- TRUE when player is dead / in laststand / handcuffed
    function Framework:isPlayerDead()
        local playerData = exports.qbx_core:GetPlayerData()
        if not playerData or not playerData.metadata then
            -- safe default: treat as alive so we don't perma-lock the menu
            return false
        end

        local meta = playerData.metadata

        -- Qbox/QBCore style metadata keys
        local isDead       = meta.isdead or meta["isdead"]
        local inLastStand  = meta.inlaststand or meta["inlaststand"]
        local isHandcuffed = meta.ishandcuffed or meta["ishandcuffed"]

        return (isDead or inLastStand or isHandcuffed)
    end

    -- Can the custom pause menu open right now?
    function Framework:canOpen()
        -- Block when dead / laststand / cuffed
        if self:isPlayerDead() then
            return false
        end

        -- Optional: also block if Rockstar pause menu is already open
        if IsPauseMenuActive() then
            return false
        end

        return true
    end

    function Framework:onOpen()
        -- Add your own logic here to handle when the menu is opened
        -- e.g. isMenuOpen = true
    end

    function Framework:onClose()
        -- Add your own logic here to handle when the menu is closed
        -- e.g. isMenuOpen = false
    end

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        Citizen.Wait(1000)
        TriggerEvent(eventName .. 'client:characterLoaded')
    end)
end)
