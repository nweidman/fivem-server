function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, 50)
end

function ShowNotification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0, 1)
end

getClosestPlayers = function(coords, maxDistance)
    local players = GetActivePlayers()
    local ped = PlayerPedId()
    coords = coords and (type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords) or GetEntityCoords(ped)
    local maxDistance = maxDistance or 5
    local closePlayers = {}
    for _, player in pairs(players) do
        local target = GetPlayerPed(player)
        local targetCoords = GetEntityCoords(target)
        if maxDistance >= #(targetCoords - coords) then
            closePlayers[#closePlayers + 1] = player
        end
    end
    return closePlayers
end

getClosestPlayer = function(coords, maxDistance)
    local ped = PlayerPedId()
    coords = coords and (type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords) or GetEntityCoords(ped)
    local closestPlayers = getClosestPlayers(coords, maxDistance)
    local closestDistance, closestPlayer = false
    for i = 1, #closestPlayers, 1 do
        local p = closestPlayers[i]
        if p and p ~= PlayerId() then
            local target = GetPlayerPed(p)
            local targetCoords = GetEntityCoords(target)
            local distance = #(targetCoords - coords)
            if not closestDistance or closestDistance > distance then
                closestPlayer = p
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

function AddTimerBar(time, text, cb)
    RequestStreamedTextureDict("timerbars", true)
    while not HasStreamedTextureDictLoaded("timerbars") do
        Citizen.Wait(50)
    end
    timer = true
    percent = 1700
    width = 0.005
    w = width * (percent / 100)
    x = (0.95 - (width * (percent / 100)) / 2) - width / 2
    Citizen.CreateThread(function()
        while timer do
            percent = percent - (1700 / (time * 100))
            width = 0.005
            w = width * (percent / 100)
            x = (0.91 - (width * (percent / 100)) / 2) - width / 2
            DrawSprite('TimerBars', 'ALL_BLACK_bg', 0.95, 0.95, 0.15, 0.0305, 0.0, 255, 255, 255, 180)
            DrawRect(0.95, 0.95, 0.085, 0.0109, 100, 0, 0, 180)
            DrawRect(x + w , 0.95, w, 0.0109, 150, 0, 0, 255)
            SetTextColour(255, 255, 255, 180)
            SetTextFont(0)
            SetTextScale(0.3, 0.3)
            SetTextCentre(true)
            SetTextEntry('STRING')
            AddTextComponentString(text)
            DrawText(0.868, 0.938)
            if percent <= 0 then
                break
            end
            Wait(0)
        end
        SetStreamedTextureDictAsNoLongerNeeded("timerbars")
    end)
end

RegisterNetEvent('yachtheist:client:showNotification')
AddEventHandler('yachtheist:client:showNotification', function(str)
    ShowNotification(str)
end)

--This event send to all police players
RegisterNetEvent('yachtheist:client:policeAlert')
AddEventHandler('yachtheist:client:policeAlert', function(targetCoords)
    ShowNotification(Strings['police_alert'])
    local alpha = 250
    local yachtBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, 50.0)

    SetBlipHighDetail(yachtBlip, true)
    SetBlipColour(yachtBlip, 1)
    SetBlipAlpha(yachtBlip, alpha)
    SetBlipAsShortRange(yachtBlip, true)

    while alpha ~= 0 do
        Citizen.Wait(500)
        alpha = alpha - 1
        SetBlipAlpha(yachtBlip, alpha)

        if alpha == 0 then
            RemoveBlip(yachtBlip)
            return
        end
    end
end)
