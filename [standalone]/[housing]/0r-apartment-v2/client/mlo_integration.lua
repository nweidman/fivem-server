-- Mlo

MloDoors = {}

local function isAuthorized(roomId)
    local result = lib.callback.await(_e("Server:Mlo:isAuthorized"), false, roomId)
    return result
end

local function setDoorLock(roomId, newState)
    Client.Functions.OpenDoorAnim()
    local notify = newState and locale("game.door_locked") or locale("game.door_unlocked")
    Client.Functions.SendNotify(notify, "success")
    lib.callback.await(_e("Server:Mlo:UpdateDoorState"), false, roomId)
end

local function UnauthorizedMloEntry(roomId)
    local item = Config.UnauthorizedEntryIntoRooms.item
    Client.Functions.TriggerServerCallback("0r-apartment:Server:PlayerHasItem", function(hasItem)
        if not hasItem then
            return Client.Functions.SendNotify(locale("game.donot_have_enough_items", item), "error")
        end
        TriggerServerEvent("0r-apartment:Server:UnauthorizedEntry", -1, roomId)
        local roomId = roomId
        Utils.Functions.LockPickGame(function(state)
            if state == nil then
                return Client.Functions.SendNotify(locale("game.error", "Lock pick..."), "error")
            end
            TriggerServerEvent("0r-apartment:Server:PlayerRemoveItem", item, 1)
            if state then
                setDoorLock(roomId, false)
            end
        end)
    end, item)
end

local function saveDoorObject(roomId)
    local room = Config.MloRooms[roomId] or {}
    if room?.door then
        if room.door?.object and DoesEntityExist(room.door.object) then
            return room.door.object
        else
            room.door.object = GetClosestObjectOfType(
                room.door.coords,
                1.0,
                room.door.model,
                false,
                false,
                false)
            return room.door.object
        end
    end
    return nil
end

local function Create_RoomZones()
    local zones = Config.MloRooms
    for key, zone in pairs(zones) do
        local points = zone.poly
        if points then
            local zone = lib.zones.poly({
                points = points,
                debug = false,
                onEnter = function()
                    Client.Player.inApartment = -1
                    if not Client.Player.inRoom then
                        TriggerServerEvent(_e("Server:GetIntoMloRoom"), zone.room_id)
                    end
                end,
                onExit = function()
                    Client.Player.inApartment = nil
                    if Client.Player.inRoom then
                        TriggerServerEvent(_e("Server:LeaveMloRoom"), zone.room_id)
                    end
                end
            })
            table.insert(polyMloRooms, zone)
        end
    end
end

local function CreateMLOShells()
    for k, v in pairs(Config.Apartments) do
        if v.MLOShell and v.MLOShell.enabled then
            local points = v.MLOShell.lobby.poly
            local zone = lib.zones.poly({
                points = points,
                thickness = 50,
                debug = false,
                onEnter = function()
                    CreateThread(function()
                        local xPlayerIdentity = Client.Functions.GetPlayerIdentifier()
                        Client.Player.inApartment = k

                        local isDrawTextUIOpen = false
                        local roomIdNear = nil
                        local xPlayerIdentity = Client.Functions.GetPlayerIdentifier()
                        local function showUI(message)
                            if isDrawTextUIOpen then return end
                            isDrawTextUIOpen = true
                            Utils.Functions.showUI(message)
                        end

                        local function checkRoomStatus(roomId)
                            for _, value in pairs(Client.Player.rooms) do
                                if value.room_id == roomId and value.apartment_id == Client.Player.inApartment then
                                    return true
                                end
                            end
                            for _, value in pairs(Client.SoldRooms) do
                                if value.room_id == roomId and value.apartment_id == Client.Player.inApartment then
                                    if value.owner == xPlayerIdentity then
                                        return true
                                    end
                                    for _, permission in pairs(value.permissions) do
                                        if permission.user == xPlayerIdentity then
                                            return true
                                        end
                                    end
                                end
                            end
                            return false
                        end

                        local function isNearAnyRoomDoor(playerCoords)
                            for _, value in pairs(v.MLOShell.doors) do
                                if #(playerCoords - vec3(value.coords.door)) < 1.0 then
                                    roomIdNear = value.room_id
                                    return true
                                end
                            end
                            return false
                        end

                        while Client.Player.inApartment and not Client.Player.inRoom do
                            local sleep = 500
                            local playerCoords = GetEntityCoords(cache.ped)

                            for _, value in pairs(Client.SoldRooms) do
                                local coords = v.MLOShell.doors[value.room_id].coords.door
                                local roomHeight = coords.z
                                local playerHeight = playerCoords.z
                                local heightDifference = math.abs(roomHeight - playerHeight)
                                local dist = #(playerCoords - vec3(coords))
                                if heightDifference <= 1.0 and dist < 10.0 and dist > 1.0 then
                                    if value.apartment_id == Client.Player.inApartment then
                                        if value.owner == xPlayerIdentity then
                                            sleep = 1
                                            Utils.Functions.DrawMarker(coords, 2)
                                        else
                                            for _, permission in pairs(value.permissions or {}) do
                                                if permission.user == xPlayerIdentity then
                                                    sleep = 1
                                                    Utils.Functions.DrawMarker(coords, 2)
                                                end
                                            end
                                        end
                                    end
                                end
                            end

                            if isNearAnyRoomDoor(playerCoords) then
                                if checkRoomStatus(roomIdNear) then
                                    sleep = 1
                                    showUI("[E] " .. locale("game.get_in_the_room", roomIdNear))
                                    if IsControlJustPressed(0, 38) then
                                        Client.Functions.GetIntoApartmentRoom(Client.Player.inApartment, roomIdNear)
                                        break
                                    end
                                else
                                    if Config.UnauthorizedEntryIntoRooms.active then
                                        sleep = 1
                                        showUI("[H] " .. locale("game.force_door", roomIdNear))
                                        if IsControlJustPressed(0, 74) then -- force [H]
                                            Client.Functions.UnauthorizedEntry(Client.Player.inApartment, roomIdNear)
                                            Wait(1500)
                                        end
                                    end
                                end
                            elseif #(playerCoords - vec3(Config.InteriorHotelCorridor.coords.mainDoor)) < 1.25 then
                                sleep = 1
                                showUI("[E] " .. locale("game.leave_apartment"))
                                if IsControlJustPressed(0, 38) then
                                    Client.Functions.LeaveApartmentCorridor(Client.Player.inApartment)
                                    break
                                end
                            elseif isDrawTextUIOpen then
                                isDrawTextUIOpen = false
                                Utils.Functions.HideTextUI()
                            end
                            Wait(sleep)
                        end

                        if isDrawTextUIOpen then
                            Utils.Functions.HideTextUI()
                        end
                    end)
                end,
                onExit = function()
                    Wait(500)
                    if not Client.Player.inRoom then
                        Client.Player.inApartment = nil
                    end
                end
            })
        end
    end
end

local function LoadDoors()
    local result = lib.callback.await(_e("Server:Mlo:GetDoors"))
    MloDoors = result
    return MloDoors
end

RegisterNetEvent(_e("Client:Mlo:UpdateDoorState"), function(roomId, newState)
    MloDoors[roomId] = newState
    local doorObject = saveDoorObject(roomId)
    local door = Config.MloRooms[roomId].door
    if doorObject and DoesEntityExist(doorObject) then
        FreezeEntityPosition(doorObject, newState)
        if newState then
            SetEntityRotation(doorObject, 0.0, 0.0, door.yaw, 2, true)
        end
    end
end)

RegisterNetEvent(_e("Client:OnPlayerIntoMloRoom"), function(inRoom, unauthorized)
    Client.Player.inRoom = inRoom
    Client.Functions.SendReactMessage("ui:setInMlo", true)
    Client.Functions.SendReactMessage("ui:setInRoom", inRoom)
    Client.Functions.SendReactMessage("ui:setRouter", "in-room")
    Client.Functions.DeleteObjects()
    Client.Functions.SpawnRoomFurnitures(unauthorized)
    Client.Functions.CreateRoomModifyTargets()
end)

RegisterNetEvent(_e("Client:OnPlayerLeaveMloRoom"), function(apartmentId, roomId)
    Client.Player.inRoom = nil
    Client.Functions.SendReactMessage("ui:setInMlo", false)
    Client.Functions.SendReactMessage("ui:setInRoom", nil)
    Client.Functions.SendReactMessage("ui:setRouter", "catalog")
    Client.Functions.DeleteRoomModifyTargets()
    CreateThread(function()
        local door = Config.MloRooms[roomId].door
        local try = 0
        while true do
            local object = GetClosestObjectOfType(
                door.coords,
                1.0,
                door.model,
                false,
                false,
                false)
            if DoesEntityExist(object) then
                if GetEntityRotation(object).z - door.yaw <= 0.5 then
                    if not Client.Player.inRoom then
                        Client.Functions.DeleteObjects()
                    end
                    break
                end
            end
            if try >= 20 then
                if not Client.Player.inRoom then
                    Client.Functions.DeleteObjects()
                end
                break
            end
            try += 1
            Wait(500)
        end
    end)
end)

function StartMloIntegration()
    LoadDoors()
    Create_RoomZones()
    CreateMLOShells()
end

CreateThread(function()
    local rooms = Config.MloRooms
    local ui_message = ""
    local isDrawTextUIOpen = false
    local playerAuthorized = false
    local currentRoomId = nil
    local isNearDoor = false

    local function showUI(message)
        if isDrawTextUIOpen then return end
        isDrawTextUIOpen = true
        Utils.Functions.showUI(message)
    end

    local function hideUI()
        Utils.Functions.HideTextUI()
        isDrawTextUIOpen = false
    end

    while true do
        Wait(5)
        local playerCoords = GetEntityCoords(cache.ped)
        if not isNearDoor then
            for _, room in pairs(rooms) do
                local door = room.door
                local doorDistance = #(playerCoords - door.coords)
                local zDistance = math.abs(playerCoords.z - door.coords.z)
                if zDistance <= 1.5 and doorDistance < 15 then
                    local doorObject = saveDoorObject(room.room_id)
                    local isLocked = MloDoors[room.room_id]
                    if isLocked == nil then
                        isLocked = true
                    end
                    if IsEntityPositionFrozen(doorObject) ~= isLocked then
                        FreezeEntityPosition(doorObject, isLocked)
                    end
                    if isLocked and GetEntityRotation(doorObject).z ~= door.yaw then
                        SetEntityRotation(doorObject, 0.0, 0.0, door.yaw, 2, true)
                    end
                    if doorDistance < 1.5 then
                        isNearDoor = true
                        playerAuthorized = isAuthorized(room.room_id)
                        currentRoomId = room.room_id
                        break
                    end
                end
            end
        else
            local door = rooms[currentRoomId].door
            local doorDistance = #(playerCoords - door.coords)
            if doorDistance > 1.5 then
                isNearDoor = false
                currentRoomId = nil
                if isDrawTextUIOpen then
                    hideUI()
                end
                Wait(500)
            else
                local isLocked = MloDoors[currentRoomId]
                if isLocked == nil then
                    isLocked = true
                end
                if playerAuthorized then
                    if isLocked then
                        ui_message = "[E] " .. locale("game.unlock_door")
                    else
                        ui_message = "[E] " .. locale("game.lock_door")
                    end
                    showUI(ui_message)
                    if IsControlJustPressed(0, 38) then -- [E]
                        setDoorLock(currentRoomId, not isLocked)
                        hideUI()
                        Wait(500)
                    end
                else
                    if Config.UnauthorizedEntryIntoRooms.active and isLocked then
                        showUI("[H] " .. locale("game.force_door", currentRoomId))
                        if IsControlJustPressed(0, 74) then -- force [H]
                            UnauthorizedMloEntry(currentRoomId)
                            Wait(1000)
                        end
                    end
                end
            end
        end
        if not isNearDoor then
            Wait(1000)
        end
    end
end)

CreateThread(function()
    local reception = Config.InteriorMloApart.lobby.reception
    local isDrawTextUIOpen = false
    local function showUI(message)
        Utils.Functions.showUI(message)
    end

    while true do
        local sleep = 500
        if Client.Player.inApartment == -1 then
            local playerCoords = GetEntityCoords(cache.ped)
            local distance = #(playerCoords - reception)
            if distance < 10.0 then
                local heightDifference = math.abs(reception.z - playerCoords.z)
                if heightDifference <= 1.0 then
                    sleep = 5
                    if distance > 1.0 then
                        sleep = 1
                        Utils.Functions.DrawMarker(reception, 2)
                        if isDrawTextUIOpen then
                            Utils.Functions.HideTextUI()
                            isDrawTextUIOpen = false
                        end
                    else
                        local message = "[E] " .. locale("game.openUI")
                        if not isDrawTextUIOpen then
                            showUI(message)
                            isDrawTextUIOpen = true
                        end
                        if IsControlJustPressed(0, 38) then -- [E]
                            isDrawTextUIOpen = false
                            Utils.Functions.HideTextUI()
                            Client.Player.inApartment = -1
                            Client.Functions.OpenTablet(-1)
                            Wait(500)
                        end
                    end
                end
            end
        else
        
        end
        Wait(sleep)
    end
end)


for k, v in pairs(Config.Apartments) do
    if v.MLOShell and v.MLOShell.enabled then
        CreateThread(function()
            local reception = v.MLOShell.lobby.reception
            local isDrawTextUIOpen = false
            local function showUI(message)
                Utils.Functions.showUI(message)
            end

            while true do
                local sleep = 500
                local playerCoords = GetEntityCoords(cache.ped)
                local distance = #(playerCoords - reception)
                if distance < 10.0 then
                    local heightDifference = math.abs(reception.z - playerCoords.z)
                    if heightDifference <= 1.0 then
                        sleep = 5
                        if distance > 1.0 then
                            sleep = 1
                            Utils.Functions.DrawMarker(reception, 2)
                            if isDrawTextUIOpen then
                                Utils.Functions.HideTextUI()
                                isDrawTextUIOpen = false
                            end
                        else
                            local message = "[E] " .. locale("game.openUI")
                            if not isDrawTextUIOpen then
                                showUI(message)
                                isDrawTextUIOpen = true
                            end
                            if IsControlJustPressed(0, 38) then -- [E]
                                isDrawTextUIOpen = false
                                Utils.Functions.HideTextUI()
                                Client.Player.inApartment = k
                                Client.Functions.OpenTablet(k)
                                Wait(500)
                            end
                        end
                    end
                end
                Wait(sleep)
            end
        end)
    end
end
