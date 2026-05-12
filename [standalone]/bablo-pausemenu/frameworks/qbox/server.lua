Framework = Framework or {}

while not eventName do
    Citizen.Wait(100)
end

CreateThread(function()
    if Config.Framework ~= 'qbox' then
        return
    end

    function Framework:getCore()
        return exports['qb-core']:GetCoreObject();
    end

    local QBX = Framework:getCore()

    function Framework:getIdentifier(source)
        local identifiers = {}
        local playerIdents = GetPlayerIdentifiers(source)

        for i = 1, #playerIdents do
            local ident = playerIdents[i]
            local colonPosition = string.find(ident, ":") - 1
            local identifierType = string.sub(ident, 1, colonPosition)

            identifiers[identifierType] = ident
        end

        return identifiers["license"] or identifiers["steam"]
    end

    function Framework:fetchPlayer(source)
        return QBX.Functions.GetPlayer(source)
    end

    function Framework:getName(player)
        if player then
            return player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname
        end

        return nil
    end

    function Framework:getJob(player)
        if not player then
            return "NO_PLAYER"
        end

        local job = player.PlayerData.job
        if not job or not job.name then
            return "NO_JOB"
        end

        local jobLabel = job.label or job.name
        local gradeLabel = job.grade and job.grade.name or "Unknown"

        return jobLabel .. " - " .. gradeLabel
    end

    function Framework:getMoney(player)
        if player then
            return player.PlayerData.money.cash or 0
        end

        return nil
    end

    function Framework:getBank(player)
        if player then
            return player.PlayerData.money.bank or 0
        end

        return nil
    end

    function Framework:getPlayers()
        local players = QBX.Functions.GetQBPlayers()

        for _, player in pairs(players) do
            player.source = player.PlayerData.source
        end

        return players
    end

    function Framework:isAdmin(source)
        return QBX.Functions.HasPermission(source, "admin") or IsPlayerAceAllowed(source, "command.bablopausemenu_admin") == 1
    end
end)
