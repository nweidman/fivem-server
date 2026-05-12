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

RegisterNetEvent('undergroundheist:client:showNotification')
AddEventHandler('undergroundheist:client:showNotification', function(str)
    ShowNotification(str)
end)

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

--This event send to all police players
RegisterNetEvent('undergroundheist:client:policeAlert')
AddEventHandler('undergroundheist:client:policeAlert', function(targetCoords)
    ShowNotification(Strings['police_alert'])
    local alpha = 250
    local undergroundBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, 50.0)

    SetBlipHighDetail(undergroundBlip, true)
    SetBlipColour(undergroundBlip, 1)
    SetBlipAlpha(undergroundBlip, alpha)
    SetBlipAsShortRange(undergroundBlip, true)

    while alpha ~= 0 do
        Citizen.Wait(500)
        alpha = alpha - 1
        SetBlipAlpha(undergroundBlip, alpha)

        if alpha == 0 then
            RemoveBlip(undergroundBlip)
            return
        end
    end
end)
