local locales = Locales[Sky.Config.locale] or Locales["en"]

canOpen = true

Citizen.CreateThread(function()
    local npc = {}
    local marker = {}
    if Config.Npc.useNpc then 
        npc = { pedHash = Config.Npc.modelOrHash, heading = Config.Npc.heading }
    end
    if Config.Marker.useMarker then
        marker = Config.Marker.marker
    end
        
    for id, location in pairs(Config.Locations) do
        blip = {} 
        if location.showBlip then
            blip = location.blip
        end

        Sky.CreateInteractionPoint(
            location.coords, 
            locales.HelpNotificationText, 
            "sky_crashgame:interaction",
            id,
            marker,
            npc,
            blip
        )
    end
end)

AddEventHandler("sky_crashgame:interaction", function(id) 
    if not canOpen then return end
    canOpen = false
    
    if not Sky.Cooldown(3000) then return end

    money = Sky.Cb.Trigger("sky_crashgame:server:GetPlayerMoney")
    location = Config.Locations[id]
    fullLocales = locales
    fullLocales["Title"] = location.title
    fullLocales["Description"] = location.description
    
    local playersInGame = Sky.Cb.Trigger("sky_crashgame:playerJoined")
    SendNUIMessage({
        type = "open",
        locales = fullLocales,
        balance = money,
        players = playersInGame,
        maxBet = Config.Game.maximumBet
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback('close', function(data, cb)
    TriggerServerEvent("sky_crashgame:playerLeft")
    SetNuiFocus(false, false)
    canOpen = true

    cb(true)
end)

RegisterNUICallback('placeBet', function(data, cb)
    if not Sky.Cooldown(3000) then cb(false) return end
    success = Sky.Cb.Trigger("sky_crashgame:placeBet", data.bet)
    cb(success)
end)

RegisterNUICallback('cashOut', function(data, cb)
    if not Sky.Cooldown(3000) then return end
    data = Sky.Cb.Trigger("sky_crashgame:cashOut")
    cb(data)
end)

RegisterNetEvent("sky_crashgame:sync", function(timeElapsed)
    SendNUIMessage({type = "sync", time = timeElapsed})
end)

RegisterNetEvent("sky_crashgame:gameCrashed", function(crashMultiplier)
    SendNUIMessage({type = "crash", multiplier = crashMultiplier})
end)

RegisterNetEvent("sky_crashgame:gameStarted", function()
    SendNUIMessage({type = "start"})
end)

RegisterNetEvent("sky_crashgame:updatePlayers", function(playersInGame)
    SendNUIMessage({type = "updatePlayers", players = playersInGame})
end)
