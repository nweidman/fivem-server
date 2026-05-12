function getIdentifier(source)
    for index, identifier in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(identifier, 1, string.len(Config.LicenseType)) == Config.LicenseType then
            if Config.LicenseWithoutPrefix then
                return string.gsub(identifier, 'license:', '')
            end
            return identifier
        end
    end
end

function getDiscordId(source)
    for index, identifier in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(identifier, 1, string.len('discord:')) == 'discord:' then
            return string.gsub(identifier, "discord:", "")
        end
    end
end

function getSteamId(source)
    for index, identifier in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(identifier, 1, string.len('steam:')) == 'steam:' then
            return string.gsub(identifier, "steam:", "")
        end
    end
end

function getFivemLicense(source)
    for index, identifier in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(identifier, 1, string.len('license:')) == 'license:' then
            return string.gsub(identifier, "license:", "")
        end
    end
end

function getPlayerName(playerId)
    local playerName = GetPlayerName(playerId)
    
    if playerName == nil or playerName == '' then
        return 'Unknown Player'
    end

    if string.lower(playerName) == 'null' or string.lower(playerName) == 'nil' then
        return 'Unknown Player with null name'
    end

    return playerName
end