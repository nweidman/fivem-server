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
        return ESX.GetPlayerFromId(source)
    end

    function Framework:getName(player)
        if player then
            if player.getName then
                return player.getName()
            else
                return player.character.firstname .. ' ' .. player.character.lastname
            end
        end

        return nil
    end

    function Framework:getJob(player)
        if not player then
            return "NO_PLAYER"
        end

        local job = player.getJob()
        if not job then
            return "NO_JOB"
        end

        return job.label .. ' - ' ..job.grade_label
    end

    function Framework:getJobRankLabel(player)
        if player then
            return player.getJob().grade_label
        end

        return nil
    end

    function Framework:getMoney(player)
        if player then
            if player.getMoney then
                return player.getMoney()
            else
                return player.getAccount('money').money
            end
        end

        return nil 
    end

    function Framework:getBank(player)
        if player then
            return player.getAccount('bank').money
        end

        return nil 
    end

    function Framework:getPlayers()
        if ESX.GetExtendedPlayers then
            return ESX.GetExtendedPlayers()
        else
            return ESX.GetPlayers()
        end
    end

    function Framework:isAdmin(source, player)
        local isAdmin = player.getGroup() == "superadmin" or player.getGroup() == "admin"

        if not isAdmin then
            return IsPlayerAceAllowed(source, "command.bablopausemenu_admin") == 1
        end
    
        return isAdmin
    end
end)