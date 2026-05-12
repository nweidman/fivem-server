local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('getpedamount', function(source, cb)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local result = MySQL.Sync.fetchAll('SELECT * FROM players WHERE citizenid = ?', { Player.PlayerData.citizenid })
  cb(result[1].pedcount)
end)


RegisterServerEvent('deletecount', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local result = MySQL.Sync.fetchAll('SELECT * FROM players WHERE citizenid = ?', { Player.PlayerData.citizenid })

 totalcount = result[1].pedcount - 1
    MySQL.Async.execute('UPDATE players SET pedcount = ? WHERE citizenid = ?', {totalcount, Player.PlayerData.citizenid } )

end)

QBCore.Commands.Add('setped', '', { { name = 'id', help = 'Player ID' }, { name = 'pedamount', help = 'Number of the ped amount' }, }, true, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if Player  then
   MySQL.Async.execute('UPDATE players SET pedcount = ? WHERE citizenid = ?', {args[2] , Player.PlayerData.citizenid } )
    else
        TriggerClientEvent('QBCore:Notify', src, args[2].." ".."Not Online", 'error')
    end
end, 'god')


QBCore.Functions.CreateCallback('checkpedif', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local result = MySQL.Sync.fetchAll('SELECT * FROM players WHERE citizenid = ?', { Player.PlayerData.citizenid })
cb(result[1].pedname)

end)


QBCore.Functions.CreateCallback('checkifnew', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local playerPed = GetPlayerPed(src)
    local currentModel = GetEntityModel(playerPed)

    local result = MySQL.Sync.fetchAll('SELECT * FROM playerskins WHERE citizenid = ?', { Player.PlayerData.citizenid })

    local matchedSkin = nil
    for _, skin in ipairs(result) do
        if skin.active == 1 then
            if GetHashKey(skin.model) == currentModel then
                matchedSkin = true
            end
            break
        end
    end

    if matchedSkin then
        cb(matchedSkin)
    else
        cb(nil) -- or a default/fallback value if desired
    end

end)



RegisterServerEvent("changeped", function(pedname)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    MySQL.Async.execute('UPDATE players SET pedname = ? WHERE citizenid = ?', {pedname, Player.PlayerData.citizenid } )
    discordLog(Player.PlayerData.charinfo.firstname .." ".. Player.PlayerData.charinfo.lastname .." ".. 'Changed the Ped'.. " "..pedname )

end)



function discordLog(name, message)
    local data = {
        {
            ["color"] = '3553600',
            ["title"] = "**".. name .."**",
            ["description"] = message,
        }
    }
    PerformHttpRequest(Config.discord['webhook'], function(err, text, headers) end, 'POST', json.encode({username = Config.discord['name'], embeds = data, avatar_url = Config.discord['image']}), { ['Content-Type'] = 'application/json' })
end