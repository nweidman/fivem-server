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

RegisterNetEvent('shoprobbery:client:showNotification')
AddEventHandler('shoprobbery:client:showNotification', function(str)
    if not clientStart then
        ShowNotification(str)
    end
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
RegisterNetEvent('shoprobbery:client:policeAlert')
AddEventHandler('shoprobbery:client:policeAlert', function(targetCoords)
    ShowNotification(Strings['police_alert'])
    local alpha = 250
    local shopBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, 50.0)

    SetBlipHighDetail(shopBlip, true)
    SetBlipColour(shopBlip, 1)
    SetBlipAlpha(shopBlip, alpha)
    SetBlipAsShortRange(shopBlip, true)

    while alpha ~= 0 do
        Citizen.Wait(500)
        alpha = alpha - 1
        SetBlipAlpha(shopBlip, alpha)

        if alpha == 0 then
            RemoveBlip(shopBlip)
            return
        end
    end
end)