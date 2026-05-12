local placedProps = {}

-- Monitor and delete props after being unattended
local function MonitorProp(netId, item, citizenid)
    local lastNearbyTime = os.time()

    CreateThread(function()
        while true do
            Wait(Config.DeleteCheckInterval * 1000)

            local entity = NetworkGetEntityFromNetworkId(netId)
            if not entity or not DoesEntityExist(entity) then break end

            local propCoords = GetEntityCoords(entity)
            local players = GetPlayers()
            local isPlayerNearby = false

            for _, playerId in pairs(players) do
                local ped = GetPlayerPed(playerId)
                if #(GetEntityCoords(ped) - propCoords) < Config.DeleteDistance then
                    isPlayerNearby = true
                    lastNearbyTime = os.time()
                    if Config.Debug then
                        print("[Debug] Nearby player detected, not auto deleting.")
                    end
                    break
                end
            end

            if not isPlayerNearby then
                local elapsed = os.time() - lastNearbyTime
                if Config.Debug then
                    print("[Debug] No nearby players detected, auto deleting soon.")
                end
                if elapsed >= (Config.DeleteAfterMinutes * 60) then
                    -- Delete the prop
                    for i = #placedProps, 1, -1 do
                        if placedProps[i] == netId then
                            table.remove(placedProps, i)
                            DeleteEntity(entity)
                            break
                        end
                    end
                    if Config.Debug then
                        print(("[Debug] Auto-deleted prop NetID %s after %d minutes of no nearby players"):format(netId, Config.DeleteAfterMinutes))
                    end
                    local PlacingPlayer = exports.qbx_core:GetPlayerByCitizenId(citizenid)
                    if PlacingPlayer then
                        PlacingPlayer.Functions.AddItem(item, 1, false)
                        TriggerClientEvent('inventory:client:ItemBox', PlacingPlayer.PlayerData.source, item, "add")
                    end
                    break
                end
            end
        end
    end)
end

RegisterNetEvent('light:registerPlacedProp', function(netId, item)
    local src = source
    placedProps[#placedProps + 1] = netId
    if Config.Debug then
        print(("[Debug] Registered placed prop. NetID: %s, Item: %s, Source: %s"):format(netId, item, src))
    end

    local Player = exports.qbx_core:GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    if Player then
        Player.Functions.RemoveItem(item, 1, false, "pickup")
        TriggerClientEvent('inventory:client:ItemBox', src, item)
        if Config.Debug then
            print(("[Debug] Removed item %s from player %s"):format(item, src))
        end
    end

    -- Start monitoring for unattended deletion
    MonitorProp(netId, item, citizenid)
end)

RegisterNetEvent('light:pickup', function(netId)
    local src = source
    local entity = NetworkGetEntityFromNetworkId(netId)
    local item = ""
    if entity and DoesEntityExist(entity) then
        for propName, itemName in pairs(Config.Items) do
            if GetHashKey(propName) == GetEntityModel(entity) then
                item = itemName
                break
            end
        end
        DeleteEntity(entity)
        for i = #placedProps, 1, -1 do
            if placedProps[i] == netId then
                table.remove(placedProps, i)
                if Config.Debug then
                    print(("[Debug] Removed NetID %s from placedProps list"):format(netId))
                end
                break
            end
        end
        if Config.Debug then
            print(("[Debug] Deleted entity NetID: %s (item: %s)"):format(netId, item))
        end

        local Player = exports.qbx_core:GetPlayer(src)
        if Player then
            Player.Functions.AddItem(item, 1, false)
            TriggerClientEvent('inventory:client:ItemBox', src, item, "add")
            if Config.Debug then
                print(("[Debug] Gave player %s the item %s back after pickup"):format(src, item))
            end
        end
    elseif Config.Debug then
        print(("[Debug] Failed to find entity from NetID: %s"):format(netId))
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end

    if Config.Debug then
        print("[Debug] Resource stopping, cleaning up placed props...")
    end

    for _, netId in ipairs(placedProps) do
        local entity = NetworkGetEntityFromNetworkId(netId)
        if entity and DoesEntityExist(entity) then
            DeleteEntity(entity)
            if Config.Debug then
                print(("[Debug] Deleted entity on stop (NetID: %s)"):format(netId))
            end
        end
    end
    placedProps = {}
end)

for propName, itemName in pairs(Config.Items) do
    exports.qbx_core:CreateUseableItem(itemName, function(source)
        TriggerClientEvent('lights:placeLight', source, propName, itemName)
        if Config.Debug then
            print(("[Debug] Useable item triggered: %s (prop: %s)"):format(itemName, propName))
        end
    end)
end
