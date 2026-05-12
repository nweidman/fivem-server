
local SPAWN_TIMEOUT <const> = 30000
local UPDATE_DISTANCE <const> = 200
local UPDATE_LIMIT_PER_FRAME <const> = 10

-- optimize Lua functions
local math_floor = math.floor
local table_concat = table.concat
local os_time, os_difftime, os_nanotime = os.time, os.difftime, os.nanotime
local json_encode, json_decode = json.encode, json.decode

-- optimize natives
local GetAllVehicles, GetGameTimer, DoesEntityExist, CreateVehicleServerSetter, DeleteEntity, NetworkGetEntityOwner, NetworkGetNetworkIdFromEntity, NetworkGetEntityFromNetworkId,
GetEntityRoutingBucket, SetEntityRoutingBucket, SetEntityOrphanMode, GetEntityCoords, GetEntityRotation, GetVehicleDoorLockStatus,
GetEntityType, GetVehicleType, GetVehicleNumberPlateText, IsEntityPositionFrozen, GetPlayerIdentifierByType, GetEntityFromStateBagName, GetInvokingResource =
GetAllVehicles, GetGameTimer, DoesEntityExist, CreateVehicleServerSetter, DeleteEntity, NetworkGetEntityOwner, NetworkGetNetworkIdFromEntity, NetworkGetEntityFromNetworkId,
GetEntityRoutingBucket, SetEntityRoutingBucket, SetEntityOrphanMode, GetEntityCoords, GetEntityRotation, GetVehicleDoorLockStatus,
GetEntityType, GetVehicleType, GetVehicleNumberPlateText, IsEntityPositionFrozen, GetPlayerIdentifierByType, GetEntityFromStateBagName, GetInvokingResource

-- list of all detected state bags on vehicle entities
local stateBagList = {}

local Ox = GetResourceState("ox_core") == "started" and exports["ox_core"] or nil



-- script start up
CreateThread(function()
	CreateAndReadFromStorage()

	if ((IS_SERVER_START and Cleanup.onServerStart) or (not IS_SERVER_START and Cleanup.onScriptRestart)) then
		CleanupProcess()
	end

	StartMainLoop()
end)

-- get all vehicles from the database
function CreateAndReadFromStorage()
	Storage.Create()

	local rows = Storage.GetAllVehicles()

	Log("Found %s saved vehicles in database.", #rows)

	local loadedVehicles = GetLoadedVehiclesWithId(GetAllVehicles())

	for i, row in ipairs(rows) do
		if (not row.tuning) then
			LogDebug("\"%s\" has no tuning defined, skipping.", row.id)
			goto skipEntry
		end
		if (not row.tuning[1] or row.tuning[1]:len() < 8) then
			LogDebug("\"%s\" has an invalid plate defined, skipping.", row.id)
			goto skipEntry
		end
		if (not row.extraValues) then
			LogDebug("\"%s\" (\"%s\") has no extraValues defined, skipping.", row.id, row.tuning[1])
			goto skipEntry
		end
		if (not row.model) then
			LogDebug("\"%s\" (\"%s\") has no model defined, skipping.", row.id, row.tuning[1])
			goto skipEntry
		end
		if (not row.type) then
			LogDebug("\"%s\" (\"%s\") has no type defined, skipping.", row.id, row.tuning[1])
			goto skipEntry
		end
		if (not row.status) then
			LogDebug("\"%s\" (\"%s\") has no status defined, skipping.", row.id, row.tuning[1])
			goto skipEntry
		end
		if (#(vector3(0,0,0) - row.position) < 1.0) then
			LogDebug("\"%s\" (\"%s\") detected at origin, skipping.", row.id, row.tuning[1])
			goto skipEntry
		end

		local vehicleData = {
			model			= row.model,
			type			= row.type,
			status			= row.status,
			tuning			= row.tuning,
			extraValues		= row.extraValues,
			stateBags		= row.stateBags,
			bucket			= row.bucket,
			position		= row.position,
			rotation		= row.rotation,
			attachedTo		= row.attachedTo,
			lastUpdate		= row.lastUpdate,
			initialPlayer	= row.initialPlayer,
			lastPlayer		= row.lastPlayer
		}

		if (loadedVehicles[row.id]) then
			-- if vehicle exists, add handle
			vehicleData.handle = loadedVehicles[row.id]
			vehicleData.networkId = NetworkGetNetworkIdFromEntity(loadedVehicles[row.id])

			LogDebug("Found \"%s\" (\"%s\") at %s", row.id, row.tuning[1], RoundVector3(GetEntityCoords(vehicleData.handle), 2))
		end

		-- add state bags to list
		for bagName, _ in pairs(vehicleData.stateBags) do
			if (not stateBagList[bagName]) then
				stateBagList[bagName] = true
			end
		end

		QT:Insert(row.id, vehicleData)

		::skipEntry::
	end
end

-- main loop for spawning and updating vehicles
function StartMainLoop()
	CreateThread(function()
		while (true) do
			local timer = GetGameTimer()

			local players = GetPlayers()
			if (#players > 0) then
				local playerData = GetPlayerData(players)
				local loadedVehicles = GetLoadedVehiclesWithId(GetAllVehicles())

				local numUpdates = 0
				QT:IterateLeaveNodes(function(entities, numEntities)
					for id, vehicleData in pairs(entities) do
						if (not IsAnyPlayerInRange(vehicleData.position, UPDATE_DISTANCE, playerData, vehicleData.bucket)) then
							goto skipUpdate
						end

						local exists = vehicleData.handle and DoesEntityExist(vehicleData.handle)

						if (not exists and not vehicleData.spawnTime) then
							if (loadedVehicles[id] and DoesEntityExist(loadedVehicles[id])) then
								vehicleData.handle = loadedVehicles[id]
								vehicleData.networkId = NetworkGetNetworkIdFromEntity(loadedVehicles[id])
							else
								Citizen.CreateThreadNow(function()
									SpawnVehicle(id, vehicleData)
								end)
							end
						elseif (exists and not vehicleData.spawnTime and not IsVehicleOccupied(vehicleData.handle, playerData) and NetworkGetEntityOwner(vehicleData.handle) ~= -1) then
							TryUpdateVehicle(id, vehicleData)
						end

						numUpdates += 1

						::skipUpdate::
					end

					if (numUpdates >= UPDATE_LIMIT_PER_FRAME) then
						numUpdates = 0
						Wait(0)
					end
				end)
			end

			::skipAllUpdates::

			Wait(5000 - (GetGameTimer() - timer))
		end
	end)
end



-- list of vehicles that fail to spawn and how often it happened
local failedSpawnList = {}
local function AddVehicleToFailedSpawns(id, plate)
	if (not failedSpawnList[id]) then
		failedSpawnList[id] = 1
	else
		failedSpawnList[id] += 1
	end

	if (failedSpawnList[id] >= 5) then
		failedSpawnList[id] = nil
		LogWarning("There seems to be an issue spawning vehicle \"%s\" (\"%s\")", id, plate)
	end
end

-- spawn a vehicle from its data
function SpawnVehicle(id, vehicleData)
	if (vehicleData.model == nil) then return end

	LogDebug("Creating \"%s\" (\"%s\") at %s", id, vehicleData.tuning[1], vehicleData.position)

	vehicleData.spawnTime = os_nanotime()

	local vehicle = nil
	if (Ox and vehicleData.extraValues.oxId) then
		vehicle = Ox:SpawnVehicle(vehicleData.extraValues.oxId, vehicleData.position, vehicleData.rotation.z)?.entity

		if (not vehicle) then
			LogDebug("OxVehicle %s does not exist anymore. Deleting from data.", vehicleData.extraValues.oxId)
			Storage.DeleteById(id)

			QT:Remove(id)

			return
		end
	else
		vehicle = CreateVehicleServerSetter(vehicleData.model, vehicleData.type, vehicleData.position.x, vehicleData.position.y, vehicleData.position.z, vehicleData.rotation.z)
	end

	if (not WaitUntilVehicleExists(vehicle, 5000)) then
		LogDebug("\"%s\" (\"%s\") didn't exist after spawning", id, vehicleData.tuning[1])

		vehicleData.spawnTime = nil

		AddVehicleToFailedSpawns(id, vehicleData.tuning[1])

		return
	end

	if (vehicleData.bucket ~= 0) then
		SetEntityRoutingBucket(vehicle, vehicleData.bucket)
	elseif (DEFAULT_BUCKET ~= 0) then
		SetEntityRoutingBucket(vehicle, DEFAULT_BUCKET)
	end

	LogDebug("Setting properties for \"%s\" (\"%s\")", id, vehicleData.tuning[1])

	-- apply state bags
	local state = Entity(vehicle).state

	state.ap_id		= id
	state.ap_data	= { vehicleData.tuning, vehicleData.status, vehicleData.extraValues, vehicleData.position, vehicleData.rotation, vehicleData.attachedTo }

	state.ap_spawned = false

	vehicleData.handle = vehicle
	vehicleData.networkId = NetworkGetNetworkIdFromEntity(vehicle)

	local plate = vehicleData.tuning[1]

	local endTime = GetGameTimer() + SPAWN_TIMEOUT
	while (GetGameTimer() < endTime) do
		Wait(0)

		local vehData = QT:Get(id)

		if (not vehData) then
			LogDebug("Data was deleted before \"%s\" (\"%s\") was fully created!", id, plate)
			break
		end

		if (not DoesEntityExist(vehicle)) then
			LogDebug("\"%s\" (\"%s\") was removed during creation process!", id, plate)
			break
		end

		if (GetVehicleNumberPlateText(vehicle) == plate and vehData.spawnTime) then
			for bagName, bagData in pairs(vehicleData.stateBags) do
				state:set(bagName, bagData, true)

				if (not stateBagList[bagName]) then
					stateBagList[bagName] = true
				end
			end

			LogDebug("Creation success for \"%s\" (\"%s\")! Took %.2fms", id, plate, (os_nanotime() - vehData.spawnTime) * 0.000001)

			vehData.spawnTime = nil
			Entity(vehicle).state.ap_data = nil

			TriggerEvent("AP:vehicleSpawned", vehData.handle)

			return
		end
	end

	LogDebug("Failed setting properties for \"%s\" (\"%s\")", id, plate)

	if (DoesEntityExist(vehicle)) then
		DeleteEntity(vehicle)
	end

	Wait(0)

	local vehData = QT:Get(id)
	if (vehData) then
		vehData.spawnTime = nil

		AddVehicleToFailedSpawns(id, vehData.tuning[1])

		vehData.handle = nil
		vehData.networkId = nil
	end
end



-- handle removal of entities if not from AP itself
AddEventHandler("entityRemoved", function(entity)
	if (GetEntityType(entity) ~= 2) then return end

	local position = GetEntityCoords(entity)
	local rotation = GetEntityRotation(entity)
	local plate	= GetVehicleNumberPlateText(entity)

	local id = Entity(entity)?.state?.ap_id
	if (not id) then return end

	local vehicleData = QT:Get(id)
	if (not vehicleData or vehicleData.spawnTime) then return end

	if (plate ~= vehicleData.tuning[1]) then
		LogDebug("Vehicle \"%s\" removed through entityRemoved: Plate mismatch (should \"%s\"; was \"%s\")", id, vehicleData.tuning[1], plate)
		return
	end

	vehicleData.position = position
	vehicleData.rotation = rotation

	vehicleData.handle = nil
	vehicleData.networkId = nil
	vehicleData.spawnTime = nil

	if (QT:DoesEntityNeedMoving(id, vehicleData.position)) then
		QT:Remove(id)
		QT:Insert(id, vehicleData)
	end

	LogDebug("Updating \"%s\" (\"%s\") (Reason: entityRemoved event) (pos %s)", id, vehicleData.tuning[1], vehicleData.position)

	Storage.UpdatePosition(id, vehicleData.position, vehicleData.rotation)
end)

-- check if update is necessary and update
function TryUpdateVehicle(id, vehicleData)
	local vehicle = vehicleData.handle

	if (Entity(vehicle)?.state?.ap_trailer) then return end

	if (GetVehicleNumberPlateText(vehicle) ~= vehicleData.tuning[1]) then
		LogDebug("Faulty data on \"%s\" (\"%s\"). Respawning with correct data.", id, vehicleData.tuning[1])

		DeleteEntity(vehicle)
		vehicleData.handle = nil
		vehicleData.networkId = nil
		return
	end

	if (forceUnfreezeVehicles and not vehicleData.isFrozen and IsEntityPositionFrozen(vehicle)) then
		FreezeEntityPosition(vehicle, false)
		LogDebug("Unfreezing \"%s\" (\"%s\")", id, vehicleData.tuning[1])
	end

	local status = vehicleData.status

	local reasons = { "Server side:" }

	-- position
	local newPos = GetEntityCoords(vehicle)
	if (not newPos) then
		LogDebug("No valid position for \"%s\" (\"%s\"). Skipping.", id, vehicleData.tuning[1])
		return
	end
	newPos = RoundVector3(newPos, 2)
	if (not vehicleData.extraValues.boatAnchor and #(vehicleData.position - newPos) > 1.0) then
		reasons[#reasons + 1] = ("        - Position from %s to %s"):format(vehicleData.position, newPos)

		vehicleData.position = newPos

		if (QT:DoesEntityNeedMoving(id, vehicleData.position)) then
			QT:Remove(id)
			QT:Insert(id, vehicleData)
		end
	end

	-- rotation
	local newRot = GetEntityRotation(vehicle)
	if (not newRot) then
		LogDebug("No valid rotation for \"%s\" (\"%s\"). Skipping.", id, vehicleData.tuning[1])
		return
	end
	newRot = RoundVector3(newRot, 2)
	if (GetRotationDifference(vehicleData.rotation, newRot) > 15.0) then
		reasons[#reasons + 1] = ("        - Rotation from %s to %s"):format(vehicleData.rotation, newRot)

		vehicleData.rotation = newRot
	end

	-- lock state
	local newLockStatus = GetVehicleDoorLockStatus(vehicle)
	if (newLockStatus ~= status[7] and not ((newLockStatus == 0 and status[7] == 1) or (newLockStatus == 1 and status[7] == 0))) then
		reasons[#reasons + 1] = ("        - Door lock state from %s to %s"):format(status[7], newLockStatus)

		status[7] = newLockStatus
	end

	if (#reasons > 1) then
		vehicleData.lastUpdate = os_time()

		LogDebug("Updating \"%s\" (\"%s\") (Reason: %s)", id, vehicleData.tuning[1], table_concat(reasons, "\n"))

		Storage.UpdatePositionAndStatus(id, vehicleData.position, vehicleData.rotation, vehicleData.status, vehicleData.lastUpdate)
	end
end

local function HandleClientSideUpdate(playerId, networkId, model, tuning, status, extraValues, reason)
	local src = source

	if (not networkId or type(networkId) ~= "number") then
		LogDebug("Tried to save vehicle with invalid \"networkId\"!")
		return
	end
	if (not model or type(model) ~= "number") then
		LogDebug("Tried to save vehicle with invalid \"model\"!")
		return
	end
	if (not tuning or type(tuning) ~= "table") then
		LogDebug("Tried to save vehicle with invalid \"tuning\" data!")
		return
	end
	if (not tuning[1] or type(tuning[1]) ~= "string" or tuning[1]:len() ~= 8) then
		LogDebug("Tried to save vehicle with invalid \"plate\"!")
		return
	end
	if (not status or type(status) ~= "table") then
		LogDebug("Tried to save vehicle with invalid \"status\" data!")
		return
	end
	if (not extraValues or type(extraValues) ~= "table") then
		LogDebug("Tried to save vehicle with invalid \"extraValues\" data!")
		return
	end

	local vehicle = NetworkGetEntityFromNetworkId(networkId)
	if (not DoesEntityExist(vehicle)) then
		LogDebug("Tried to save entity that does not exist on server side (yet)!")
		return
	end

	local id = Entity(vehicle).state.ap_id
	if (not id and saveOnlyOwnedVehicles and not reason:find("Resource")) then
		local isOwned = IsOwnedVehicle(tuning[1], vehicle)
		if (not DoesEntityExist(vehicle)) then
			LogDebug("Tried to save entity that does not exist on server side!")
			return
		end

		if (not isOwned) then
			LogDebug("Tried to save unowned vehicle!")
			return
		end
	end

	local bucket = GetEntityRoutingBucket(vehicle)
	if (not multiBucketSupport and bucket ~= DEFAULT_BUCKET) then
		LogDebug("Tried to save \"%s\" (\"%s\") from non-default routing bucket %s!", id, tuning[1], bucket)
		return
	end

	local vehicleData = nil
	if (id) then
		vehicleData = QT:Get(id)

		if (not vehicleData) then
			LogDebug("Got ap_id \"%s\" (\"%s\") but did not find vehicleData.", id, tuning[1])
			return
		end
	else
		id, newHandle, newNetworkId = GetMissingIdFromHandle(vehicle)
		if (id) then
			vehicleData = QT:Get(id)

			if (vehicleData) then
				LogDebug("ap_id missing on \"%s\" (\"%s\"). Reapplying...", id, tuning[1])

				Entity(vehicle).state.ap_id = id

				vehicleData.handle = newHandle
				vehicleData.networkId = newNetworkId
			else
				LogDebug("Found missing ap_id from \"%s\" (\"%s\") but did not find vehicleData.", id, tuning[1])
				return
			end
		end
	end

	if (vehicleData) then
		local updateTime = os_time()
		if (vehicleData.lastClientUpdate and (updateTime - vehicleData.lastClientUpdate <= 1)) then
			LogDebug("Tried saving \"%s\" (\"%s\") multiple times! (Reason: %s)", id, tuning[1], reason)
			return
		end

		local oxId = vehicleData.extraValues["oxId"]

		-- already exists
		vehicleData.status		= status
		vehicleData.tuning		= tuning
		vehicleData.extraValues	= extraValues
		vehicleData.stateBags	= GetVehicleStateBags(vehicle)
		vehicleData.bucket		= bucket
		vehicleData.position	= RoundVector3(GetEntityCoords(vehicle), 2)
		vehicleData.rotation	= RoundVector3(GetEntityRotation(vehicle), 2)
		vehicleData.lastUpdate	= updateTime
		vehicleData.lastPlayer	= GetPlayerIdentifierByType(src, "license")

		vehicleData.lastClientUpdate = updateTime

		if (oxId) then
			vehicleData.extraValues["oxId"] = oxId
		end

		if (QT:DoesEntityNeedMoving(id, vehicleData.position)) then
			QT:Remove(id)
			QT:Insert(id, vehicleData)
		end

		LogDebug("Updating \"%s\" (\"%s\", %s) (Reason: %s)", id, vehicleData.tuning[1], networkId, reason)

		Storage.UpdateVehicle(
			id,
			vehicleData.status, vehicleData.tuning, vehicleData.extraValues,
			vehicleData.stateBags,
			vehicleData.bucket,
			vehicleData.position, vehicleData.rotation,
			vehicleData.attachedTo,
			vehicleData.lastUpdate,
			vehicleData.lastPlayer
		)
	else
		-- does not exist
		if (preventDuplicateVehicles) then
			local oldId = GetVehicleIdentifierUsingPlate(tuning[1])
			if (oldId) then
				DeleteVehicleUsingIdentifier(oldId)
			end
		end

		-- enable persistence (for client spawned vehicles)
		SetEntityOrphanMode(vehicle, 2)

		id = GetNewVehicleIdentifier()

		Entity(vehicle).state.ap_id = id

		local playerIdentifier = GetPlayerIdentifierByType(src, "license")

		if (Ox) then
			extraValues["oxId"] = Ox:GetVehicle(vehicle).id
		end

		local vehicleData = {
			handle			= vehicle,
			model			= model,
			type			= GetVehicleType(vehicle),
			status			= status,
			tuning			= tuning,
			extraValues		= extraValues,
			stateBags		= GetVehicleStateBags(vehicle),
			bucket			= bucket,
			position		= RoundVector3(GetEntityCoords(vehicle), 2),
			rotation		= RoundVector3(GetEntityRotation(vehicle), 2),
			lastUpdate		= os_time(),
			initialPlayer	= playerIdentifier,
			lastPlayer		= playerIdentifier,
			spawning		= false
		}

		vehicleData.lastClientUpdate = vehicleData.lastUpdate

		QT:Insert(id, vehicleData)

		LogDebug("Inserting \"%s\" (\"%s\", %s) (Reason: %s)", id, vehicleData.tuning[1], networkId, reason)

		Storage.InsertVehicle(
			id,
			vehicleData.model,
			vehicleData.type,
			vehicleData.status, vehicleData.tuning, vehicleData.extraValues,
			vehicleData.stateBags,
			vehicleData.bucket,
			vehicleData.position, vehicleData.rotation,
			vehicleData.attachedTo,
			vehicleData.lastUpdate,
			vehicleData.initialPlayer, vehicleData.lastPlayer
		)
	end
end

-- triggered from client side to either update or insert a vehicle
RegisterNetEvent("AP:updateVehicle", function(networkId, model, tuning, status, extraValues, reason)
	HandleClientSideUpdate(src, networkId, model, tuning, status, extraValues, reason)
end)



-- delete vehicles that are still being spawned before actually stopping the resource
AddEventHandler("onResourceStop", function(name)
	if (name ~= GetCurrentResourceName()) then return end

	QT:IterateLeaveNodes(function(entities, numEntities)
		for id, vehicleData in pairs(entities) do
			if (vehicleData.spawnTime and DoesEntityExist(vehicleData.handle)) then
				LogDebug("Deleted \"%s\" (\"%s\") because it was still spawning", id, vehicleData.tuning[1])
				DeleteEntity(vehicleData.handle)
			end
		end
	end)
end)

local function DeleteVehicleUsingData(identifier, networkId, plate, keepInWorld, resourceName)
	if (identifier == nil and (networkId == nil or networkId == 0) and plate == nil) then
		LogWarning("Tried to delete vehicle without \"id\", \"netId\" and \"plate\"! (Resource: \"%s\")", resourceName)
		return false
	end

	if (identifier and DeleteVehicleUsingIdentifier(identifier, keepInWorld)) then
		LogDebug("Deleting vehicle (id \"%s\"; netId \"%s\"; plate \"%s\"; Resource: \"%s\")", identifier, networkId, plate, resourceName)
		return true
	end
	if (networkId and DeleteVehicleUsingNetworkId(networkId, keepInWorld)) then
		LogDebug("Deleting vehicle (netId \"%s\"; id \"%s\"; plate \"%s\"; Resource: \"%s\")", networkId, identifier, plate, resourceName)
		return true
	end
	if (plate and DeleteVehicleUsingPlate(plate, keepInWorld)) then
		LogDebug("Deleting vehicle (plate \"%s\"; id \"%s\"; netId \"%s\"; Resource: \"%s\")", plate, identifier, networkId, resourceName)
		return true
	end

	LogDebug("Deleting vehicle failed (id \"%s\", netId \"%s\", plate \"%s\"; Resource: \"%s\")", identifier, networkId, plate, resourceName)
	return false
end
exports("DeleteVehicleUsingData", function(identifier, networkId, plate, keepInWorld)
	return DeleteVehicleUsingData(identifier, networkId, plate, keepInWorld, GetInvokingResource())
end)

local function DeleteVehicle(vehicle, keepInWorld, resourceName)
	if (not DoesEntityExist(vehicle)) then
		LogWarning("Tried to delete vehicle that does not exist! (Entity \"%s\"; Resource: \"%s\")", vehicle, resourceName)
		return false
	end

	return DeleteVehicleUsingData(Entity(vehicle)?.state?.ap_id, NetworkGetNetworkIdFromEntity(vehicle), GetVehicleNumberPlateText(vehicle), keepInWorld, resourceName)
end
exports("DeleteVehicle", function(vehicle, keepInWorld)
	return DeleteVehicle(vehicle, keepInWorld, GetInvokingResource())
end)

-- delete vehicle from client side using identifier, network id or plate
RegisterNetEvent("AP:deleteVehicle", function(identifier, networkId, plate, keepInWorld, resourceName)
	DeleteVehicleUsingData(identifier, networkId, plate, keepInWorld, resourceName)
end)

-- delete vehicle using identifier
function DeleteVehicleUsingIdentifier(id, keepInWorld)
	local vehicleData = QT:Get(id)
	if (not vehicleData) then
		return false
	end

	if (not keepInWorld and vehicleData.handle and DoesEntityExist(vehicleData.handle)) then
		DeleteEntity(vehicleData.handle)
	end

	Storage.DeleteById(id)

	QT:Remove(id)

	return true
end

-- delete vehicle using network id
function DeleteVehicleUsingNetworkId(networkId, keepInWorld)
	local vehicle = NetworkGetEntityFromNetworkId(networkId)
	if (not DoesEntityExist(vehicle)) then
		return false
	end

	local id = Entity(vehicle)?.state?.ap_id
	if (id) then
		local vehicleData = QT:Get(id)
		if (vehicleData) then
			Storage.DeleteById(id)

			QT:Remove(id)
		else
			LogDebug("Got ap_id \"%s\" (\"%s\") but no vehicleData on DeleteVehicleUsingNetworkId.", id, GetVehicleNumberPlateText(vehicle))
		end
	end

	if (not keepInWorld) then
		DeleteEntity(vehicle)
	end

	return true
end

-- delete vehicle using plate
function DeleteVehicleUsingPlate(plate, keepInWorld)
	local success = QT:IterateLeaveNodes(function(entities, numEntities)
		for id, vehicleData in pairs(entities) do
			if (vehicleData.tuning[1] == plate or Trim(vehicleData.tuning[1]) == plate) then
				if (not keepInWorld and vehicleData.handle and DoesEntityExist(vehicleData.handle)) then
					DeleteEntity(vehicleData.handle)
				end

				Storage.DeleteById(id)

				QT:Remove(id)

				return true
			end
		end
	end)

	if (success) then
		return true
	end

	if (not keepInWorld) then
		local vehicle = TryGetLoadedVehicleFromPlate(plate, GetAllVehicles())
		if (vehicle and DoesEntityExist(vehicle)) then
			DeleteEntity(vehicle)

			return true
		end
	end

	return false
end

-- update a vehicles state bags in database
function UpdateVehicleStateBagsInDB(id, stateBags)
	assert(id ~= nil and type(id) == "string", "Parameter \"id\" must be a string!")

	local vehicleData = QT:Get(id)

	LogDebug("Updating state bags of \"%s\" (\"%s\") in database", id, vehicleData.tuning[1])

	Storage.UpdateStateBags(
		id,
		stateBags
	)
end

-- returns all state bags from a vehicle
function GetVehicleStateBags(vehicle, resourceName)
	if (not DoesEntityExist(vehicle)) then
		LogWarning("Tried to get state bags from non-existent vehicle! (Resource: %s)", resourceName)
		return {}
	end

	local vehicleStateBags = Entity(vehicle)?.state
	if (not vehicleStateBags) then
		return {}
	end

	local stateBags = {}

	for bagName, _ in pairs(stateBagList) do
		if (vehicleStateBags[bagName]) then
			stateBags[bagName] = vehicleStateBags[bagName]
		end
	end

	return stateBags
end
exports("GetStateBagsFromVehicle", function(vehicle)
	return GetVehicleStateBags(vehicle, GetInvokingResource())
end)

-- state bag change handler for detecting changes on a vehicle
AddStateBagChangeHandler(nil, nil, function(bagName, key, value, _unused, replicated)
	if (key:find("ap_")) then return end

	if (ignoreStateBags) then
		for i = 1, #ignoreStateBags do
			if (key:find(ignoreStateBags[i])) then return end
		end
	end

	local entity = GetEntityFromStateBagName(bagName)
	if (entity == 0 or GetEntityType(entity) ~= 2) then return end

	if (not stateBagList[key]) then
		stateBagList[key] = true
	end

	local id = Entity(entity).state.ap_id
	local vehicleData = QT:Get(id)
	if (not id or not vehicleData) then return end

	if (IsAnyPlayerInsideVehicle(entity, GetAllPlayerPeds())) then return end

	if (vehicleData.stateBags[key] == nil or not TableEquals(vehicleData.stateBags[key], value)) then
		-- new state bag OR update
		vehicleData.stateBags[key] = value

		if (preventStateBagAutoUpdate) then
			for i = 1, #preventStateBagAutoUpdate do
				if (key:find(preventStateBagAutoUpdate[i])) then return end
			end
		end

		UpdateVehicleStateBagsInDB(id, vehicleData.stateBags)

		LogDebug("    Reason: Updating state bag \"%s\" for \"%s\". Value: %s", key, id, value)
	end
end)

-- forces a vehicle to update to the database
local function ForceVehicleUpdateInDB(id, resourceName)
	local vehicleData = QT:Get(id)
	if (not vehicleData) then return end

	vehicleData.lastUpdate = os_time()

	LogDebug("Updating \"%s\" (\"%s\") (Resource: %s)", id, vehicleData.tuning[1], resourceName)

	Storage.UpdateVehicle(
		id,
		vehicleData.status, vehicleData.tuning, vehicleData.extraValues,
		vehicleData.stateBags,
		vehicleData.bucket,
		vehicleData.position, vehicleData.rotation,
		vehicleData.attachedTo,
		vehicleData.lastUpdate,
		vehicleData.lastPlayer
	)
end
exports("ForceVehicleUpdateInDB", function(id)
	ForceVehicleUpdateInDB(id, GetInvokingResource())
end)

-- DEPRECATED: ensures a state bag is saved on the vehicle
local function EnsureStateBag()
	LogWarning("Executing the \"EnsureStateBag\" export is no longer necessary. Remove it from \"" .. GetInvokingResource() .. "\"!")

	return false
end
exports("EnsureStateBag", EnsureStateBag)

-- returns a vehicle handle from a given state bag value
local function GetVehicleFromStateBagValue(key, value)
	local vehicle = QT:IterateLeaveNodes(function(entities, numEntities)
		for id, vehicleData in pairs(entities) do
			if (TableEquals(vehicleData.stateBags[key], value)) then
				return vehicleData.handle
			end
		end
	end)

	return vehicle
end
exports("GetVehicleFromStateBagValue", GetVehicleFromStateBagValue)

-- returns all saved state bags from a vehicle with plate X
local function GetStateBagsFromPlate(plate)
	local trimmedPlate = Trim(plate):upper()

	local vehicle = QT:IterateLeaveNodes(function(entities, numEntities)
		for id, vehicleData in pairs(entities) do
			if (Trim(vehicleData.tuning[1]) == trimmedPlate) then
				return vehicleData.handle
			end
		end
	end)
	if (vehicle) then
		return GetVehicleStateBags(vehicle)
	end

	local vehicles = GetAllVehicles()
	for i = 1, #vehicles do
		if (DoesEntityExist(vehicles[i]) and Trim(GetVehicleNumberPlateText(vehicles[i])) == trimmedPlate) then
			return GetVehicleStateBags(vehicles[i])
		end
	end

	return nil
end
exports("GetStateBagsFromPlate", GetStateBagsFromPlate)

-- returns all of AP's vehicle data of a specific Vehicle
local function GetVehicleData(vehicle)
	if (not DoesEntityExist(vehicle)) then return nil end

	local id = Entity(vehicle)?.state?.ap_id
	if (not id) then return nil end

	return QT:Get(id)
end
exports("GetVehicleData", GetVehicleData)

-- returns all of AP's saved vehicle data of a specific Vehicle
local function GetVehicleTuningFromData(vehicle)
	if (not DoesEntityExist(vehicle)) then return nil end

	local id = Entity(vehicle)?.state?.ap_id
	if (not id) then return nil end

	return QT:Get(id)?.tuning
end
exports("GetVehicleTuningFromData", GetVehicleTuningFromData)

-- getting a vehicle position using its plate
local function GetVehiclePosition(plate, resourceName)
	if (plate == nil or type(plate) ~= "string") then
		LogError("Parameter \"plate\" must be a string! (Export: \"GetVehiclePosition\"; Resource: \"%s\")", resourceName)
		return
	end

	LogDebug("Position request for \"%s\" (Resource: \"%s\")", plate, resourceName)

	plate = plate:upper()

	local position = QT:IterateLeaveNodes(function(entities, numEntities)
		for id, vehicleData in pairs(entities) do
			if (vehicleData.tuning and plate == Trim(vehicleData.tuning[1])) then
				return vehicleData.handle and DoesEntityExist(vehicleData.handle) and GetEntityCoords(vehicleData.handle) or vehicleData.position
			end
		end
	end)
	if (position) then
		return position
	end

	local vehicles = GetAllVehicles()
	for i = 1, #vehicles do
		if (DoesEntityExist(vehicles[i])) then
			local vehPlate = GetVehicleNumberPlateText(vehicles[i])
			if (plate == vehPlate or plate == Trim(vehPlate)) then
				return GetEntityCoords(vehicles[i])
			end
		end
	end

	return nil
end
exports("GetVehiclePosition", function(plate)
	return GetVehiclePosition(plate, GetInvokingResource())
end)

-- getting vehicle positions using more than one plate
local function GetVehiclePositions(plates, resourceName)
	if (plates == nil or type(plates) ~= "table") then
		LogError("Parameter \"plates\" must be a table! (Export: \"GetVehiclePositions\"; Resource: \"%s\")", resourceName)
		return {}
	end

	for i = 1, #plates do
		if (plates[i] == nil or type(plates[i]) ~= "string") then
			LogError("Parameter \"plate\" (at index %s) must be a string! (Export: \"GetVehiclePositions\"; Resource: \"%s\")", i, resourceName)
			return {}
		end

		plates[i] = plates[i]:upper()
	end

	LogDebug("Position request for \"%s\" (Resource: \"%s\")", table_concat(plates, "\", \""), resourceName)

	local platePositions = {}

	-- check all loaded vehicles first
	local vehicles = GetAllVehicles()
	for i = 1, #vehicles do
		if (DoesEntityExist(vehicles[i])) then
			local vehPlate = GetVehicleNumberPlateText(vehicles[i])
			local trimmedVehPlate = Trim(vehPlate)

			for j = 1, #plates do
				if (plates[j] == vehPlate or plates[j] == trimmedVehPlate) then
					platePositions[ plates[j] ] = GetEntityCoords(vehicles[i])

					break
				end
			end
		end
	end

	-- then search missing vehicles in APs saved vehicles
	for i = 1, #plates do
		if (platePositions[ plates[i] ] == nil) then
			local position = QT:IterateLeaveNodes(function(entities, numEntities)
				for id, vehicleData in pairs(entities) do
					if (vehicleData.tuning and (plates[i] == vehicleData.tuning[1] or plates[i] == Trim(vehicleData.tuning[1]))) then
						platePositions[ plates[i] ] = vehicleData.position
					end
				end
			end)
		end
	end

	return platePositions
end
exports("GetVehiclePositions", function(plates)
	return GetVehiclePositions(plates, GetInvokingResource())
end)

-- callbacks for client side getting of vehicle position(s)
local CB = exports["kimi_callbacks"]
CB:Register("AP:getVehiclePosition", function(source, plate, resourceName)
	return GetVehiclePosition(plate, resourceName)
end)
CB:Register("AP:getVehiclePositions", function(source, plates, resourceName)
	return GetVehiclePositions(plates, resourceName)
end)

-- command to delete ALL vehicles from the database table. Needs to be executed twice for security reason.
local deleteSavedVehicles = false
RegisterCommand("deleteSavedVehicles", function(source, args, raw)
	if (deleteSavedVehicles) then
		Storage.DeleteAllVehicles()

		QT = Quadtree()

		Log("Deleted all vehicles from the vehicle_parking table.")
	else
		Log("Are you sure that you want to delete all vehicles from the parking list?\nIf yes, execute the command a second time!")
	end

	deleteSavedVehicles = not deleteSavedVehicles
end, true)

-- command to delete ALL vehicles from the database table. Needs to be executed twice for security reason.
local deleteAndStore = false
RegisterCommand("deleteandstore", function(source, args, raw)
	if (deleteAndStore) then
		local ids = {}
		local playerPeds = GetAllPlayerPeds()

		QT:IterateLeaveNodes(function(entities, numEntities)
			for id, vehicleData in pairs(entities) do
				if (vehicleData.handle and DoesEntityExist(vehicleData.handle)) then
					if (IsAnyPlayerInsideVehicle(vehicleData.handle, playerPeds)) then
						goto skipVeh
					end

					DeleteEntity(vehicleData.handle)
				end

				StoreVehicle(vehicleData.tuning[1], vehicleData.handle)

				QT:Remove(id)

				ids[#ids + 1] = id

				::skipVeh::
			end
		end)

		Storage.DeleteByIds(ids)

		Log("Deleted all vehicles from the vehicle_parking table.")
	else
		Log("Are you sure that you want to delete all vehicles from the parking list and store them?\nIf yes, execute the command a second time!")
	end

	deleteAndStore = not deleteAndStore
end, true)

RegisterCommand("apdv", function(src, args, raw)
	local id = args[1]
	if (not id) then
		LogError("First argument needs to be a plate or identifier!")
		return
	end

	local success = false

	-- interpret first param as id or plate
	if (id:len() == 16) then
		success = DeleteVehicleUsingData(id, nil, nil, false, "Command \"apdv\"")

		if (success) then
			local vehicleData = QT:Get(id)
			if (vehicleData) then
				StoreVehicle(vehicleData.tuning[1], vehicleData.handle)
			end
		end
	else
		local plate = id:upper()
		success = DeleteVehicleUsingData(nil, nil, plate, false, "Command \"apdv\"")

		if (success and Cleanup.storeVehicles) then
			local handle = GetVehicleHandleFromPlate(plate, GetAllVehicles())
			StoreVehicle(plate, handle)
		end
	end

	if (success) then
		Log("Vehicle \"%s\" deleted through command \"apdv\".", id)
	else
		Log("Vehicle \"%s\" could not be deleted through command \"apdv\".", id)
	end
end, true)

RegisterCommand("apbring", function(playerId, args, raw)
	if (playerId == 0) then
		LogError("Command \"apbring\" can only be executed from client side!")
		return
	end

	local id = args[1]
	if (not id) then
		LogError("Command \"apbring\": First argument needs to be a plate or identifier!")
		return
	end

	-- check first arg if it is a plate
	if (id:len() == 8) then
		id = GetVehicleIdentifierUsingPlate(id)
	end

	if (not id) then
		LogError("Command \"apbring\": Vehicle could not be found!")
		return
	end

	local vehicleData = QT:Get(id)
	if (not vehicleData) then
		LogError("Command \"apbring\": Vehicle could not be found!")
		return
	end

	local ped = GetPlayerPed(playerId)
	if (not DoesEntityExist(ped)) then
		LogError("Command \"apbring\": Could not find ped to spawn vehicle at!")
		return
	end

	if (vehicleData.handle and DoesEntityExist(vehicleData.handle)) then
		DeleteEntity(vehicleData.handle)
		Wait(100)
	end

	vehicleData.handle = nil
	vehicleData.networkId = nil
	vehicleData.position = GetEntityCoords(ped) + vector3(2.0, 3.0, 0.0)
	vehicleData.rotation = vector3(0.0, 0.0, 0.0)

	if (QT:DoesEntityNeedMoving(id, vehicleData.position)) then
		QT:Remove(id)
		QT:Insert(id, vehicleData)
	end

	Log("Vehicle \"%s\" teleported through command \"apbring\".", id)
end, true)



local function UpdatePlate(networkId, newPlate, resourceName)
	if (networkId == nil) then
		LogError("\"networkId\" was nil while trying to update a plate! (Resource: %s)", resourceName)
		return
	end
	if (newPlate == nil or newPlate:len() > 8) then
		LogError("\"newPlate\" was nil or too long while trying to update a plate! (Resource: %s)", resourceName)
		return
	end

	-- format plate
	newPlate = Trim(newPlate:upper())

	-- change plate on vehicle
	local vehicle = NetworkGetEntityFromNetworkId(networkId)
	if (DoesEntityExist(vehicle)) then
		SetVehicleNumberPlateText(vehicle, newPlate)

		local found = false
		while (not found) do
			Wait(0)

			found = Trim(GetVehicleNumberPlateText(vehicle)) == newPlate
		end

		newPlate = GetVehicleNumberPlateText(vehicle)
	end

	-- search for plate
	local success = QT:IterateLeaveNodes(function(entities, numEntities)
		for id, vehicleData in pairs(entities) do
			if (vehicle == vehicleData.handle) then
				vehicleData.tuning[1] = newPlate

				LogDebug("Updating \"%s\" (\"%s\") (Resource: %s)", id, vehicleData.tuning[1], resourceName)

				Storage.UpdateTuning(id, vehicleData.tuning)

				return true
			end
		end
	end)
	if (not success) then
		LogDebug("No vehicle found to change plate to \"%s\" (Resource: %s)", newPlate, resourceName)
	end
end
exports("UpdatePlate", function(networkId, newPlate)
	return UpdatePlate(networkId, newPlate, GetInvokingResource())
end)

RegisterNetEvent("AP:updatePlate", function(networkId, newPlate, resourceName)
	UpdatePlate(networkId, newPlate, resourceName)
end)



RegisterNetEvent("AP:enteredTrailer", function(trailerNetId)
	local trailer = NetworkGetEntityFromNetworkId(trailerNetId)
	if (not DoesEntityExist(trailer)) then return end

	Entity(trailer).state:set("ap_trailer", true, true)
end)

RegisterNetEvent("AP:leftTrailer", function(trailerNetId)
	local trailer = NetworkGetEntityFromNetworkId(trailerNetId)
	if (not DoesEntityExist(trailer)) then return end

	Entity(trailer).state:set("ap_trailer", nil, true)
end)



-- export and event for force freezing vehicles
if (forceUnfreezeVehicles) then
	local function FreezeVehicle(vehicle, freeze)
		FreezeEntityPosition(vehicle, freeze)

		local id = Entity(vehicle)?.state?.ap_id
		if (not id) then return end

		local vehicleData = QT:Get(id)
		if (not vehicleData) then return end

		vehicleData.isFrozen = freeze
	end
	exports("FreezeVehicle", FreezeVehicle)

	RegisterNetEvent("AP:freezeVehicle", function(networkId, freeze)
		local vehicle = NetworkGetEntityFromNetworkId(networkId)
		if (not DoesEntityExist(vehicle)) then return end

		FreezeVehicle(vehicle, freeze)
	end)
end

AddEventHandler("onEntityBucketChange", function(entity, newBucket, oldBucket)
	if (GetEntityType(entity) ~= 2) then return end

	local id = Entity(entity).state.ap_id
	if (not id) then return end

	local vehicleData = QT:Get(id)
	if (not vehicleData) then return end

	if (vehicleData.bucket == newBucket) then return end

	vehicleData.bucket = newBucket

	LogDebug("Updating \"%s\" (\"%s\") (Reason: %s)", id, vehicleData.tuning[1], ("Routing bucket from %s to %s"):format(oldBucket, newBucket))

	Storage.UpdateBucket(id, newBucket)
end)

RegisterNetEvent("AP:onVehicleDamage", function(networkId, status)
	local vehicle = NetworkGetEntityFromNetworkId(networkId)
	if (not DoesEntityExist(vehicle)) then return end

	local id = Entity(vehicle)?.state?.ap_id
	if (not id) then return end

	local vehicleData = QT:Get(id)
	if (not vehicleData) then return end

	vehicleData.status = status

	LogDebug("Updating status for \"%s\" (\"%s\") (Reason: %s)", id, vehicleData.tuning[1], "Vehicle damage")

	Storage.UpdateStatus(id, status)
end)

RegisterNetEvent("AP:poolsizeWarning", function(vehicleCount)
	local playerId = source
	local bucket = GetPlayerRoutingBucket(playerId)
	local ped = GetPlayerPed(playerId)
	if (not DoesEntityExist(ped)) then return end

	local position = GetEntityCoords(ped)
	LogWarning("Near pool size limit in bucket %s at (%.1f, %.1f, %.1f) (%s/%s)", bucket, position.x, position.y, position.z, vehicleCount, GetNetVehiclePoolSize())
end)

RegisterNetEvent("AP:attachVehicles", function(networkId1, networkId2, boneIndex, position, rotation, p9, useSoftPinning, collision, isPed, rotationOrder, syncRot)
	local vehicle1 = NetworkGetEntityFromNetworkId(networkId1)
	if (not DoesEntityExist(vehicle1)) then return end

	local id1 = Entity(vehicle1)?.state?.ap_id
	if (not id1) then return end

	local vehicleData1 = QT:Get(id1)
	if (not vehicleData1) then return end

	local vehicle2 = NetworkGetEntityFromNetworkId(networkId2)
	if (not DoesEntityExist(vehicle2)) then return end

	local id2 = Entity(vehicle2)?.state?.ap_id
	if (not id2) then return end

	local vehicleData2 = QT:Get(id2)
	if (not vehicleData2) then return end

	LogDebug("Attach \"%s\" (\"%s\") to \"%s\" (\"%s\")", id1, vehicleData1.tuning[1], id2, vehicleData2.tuning[1])

	vehicleData1.attachedTo = {
		id2,
		boneIndex, position, rotation,
		p9, useSoftPinning, collision, isPed, rotationOrder, syncRot
	}

	Storage.UpdateAttachedTo(id1, vehicleData1.attachedTo)
end)

RegisterNetEvent("AP:detachVehicles", function(networkId)
	local vehicle = NetworkGetEntityFromNetworkId(networkId)
	if (not DoesEntityExist(vehicle)) then return end

	local id = Entity(vehicle)?.state?.ap_id
	if (not id) then return end

	local vehicleData = QT:Get(id)
	if (not vehicleData) then return end

	LogDebug("Detach \"%s\" (\"%s\")", id, vehicleData.tuning[1])

	vehicleData.attachedTo = nil

	Storage.UpdateAttachedTo(id, nil)
end)
