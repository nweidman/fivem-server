
-- localise frequently used Lua globals
local os_time, os_difftime, os_date, math_floor = os.time, os.difftime, os.date, math.floor

-- localise frequently used natives
local DoesEntityExist, GetPlayerRoutingBucket, GetEntityCoords, DeleteEntity, GetVehicleEngineHealth, GetEntityRoutingBucket = 
DoesEntityExist, GetPlayerRoutingBucket, GetEntityCoords, DeleteEntity, GetVehicleEngineHealth, GetEntityRoutingBucket

-- task system
local tasks = {}

local function GetTime()
	local time = os_time()

	return {
		day		= tonumber(os_date("%w", time)),
		hour	= tonumber(os_date("%H", time)),
		minute	= tonumber(os_date("%M", time))
	}
end

local taskRunning = false
local function StartTaskThread()
	if (taskRunning) then return end

	taskRunning = true

	local lastTime = GetTime()

	while (taskRunning) do
		Wait(1000)

		local time = GetTime()

		if (time.minute ~= lastTime.minute or time.hour ~= lastTime.hour or time.day ~= lastTime.day) then
			for i = 1, #tasks do
				if ((not tasks[i].day or tasks[i].day == time.day) and tasks[i].hour == time.hour and tasks[i].minute == time.minute) then
					tasks[i].Run()
				end
			end

			lastTime = time
		end
	end
end

local function AddTask(task, d, h, m)
	assert(task and type(task) == "function", "Parameter \"task\" must be a function!")
	assert(not d or type(d) == "number", "Parameter \"day\" must be a number!")
	assert(h and type(h) == "number", "Parameter \"hour\" must be a number!")
	assert(m and type(m) == "number", "Parameter \"minute\" must be a number!")

	tasks[#tasks + 1] = {
		day		= d and math_floor(d),
		hour	= math_floor(h),
		minute	= math_floor(m),
		Run		= task
	}

	if (not taskRunning) then
		CreateThread(StartTaskThread)
	end
end



-- get all players sorted by bucket
local function GetPositionsOfAllPlayersByBucket()
	local playerPositions = {}

	local players = GetPlayers()
	for i = 1, #players do
		local ped = GetPlayerPed(players[i])
		if (DoesEntityExist(ped)) then
			local bucket = GetPlayerRoutingBucket(players[i])
			if (not playerPositions[bucket]) then
				playerPositions[bucket] = {}
			end

			playerPositions[bucket][#playerPositions[bucket] + 1] = GetEntityCoords(ped)
		end
	end

	return playerPositions
end

-- get closest position and distance from list
local function GetClosestDistanceFromList(position, positionList)
	local closestDistance = 100000

	for i = 1, positionList and #positionList or 0 do
		local tempDist = #(position - positionList[i])
		if (tempDist < closestDistance) then
			closestDistance = tempDist
		end
	end

	return closestDistance
end

-- runs the whole cleanup process once
function CleanupProcess()
	local timeDiff = 0
	if (Cleanup.timeThreshold) then
		local currentTime = os_time()
		local threshold = math_floor(3600 * Cleanup.timeThreshold)
		timeDiff = os_difftime(currentTime, threshold)
	end

	local playerPositions = GetPositionsOfAllPlayersByBucket()

	local idsToDelete = {}

	QT:IterateLeaveNodes(function(entities, numEntities)
		for id, vehicleData in pairs(entities) do
			local position = DoesEntityExist(vehicleData.handle) and GetEntityCoords(vehicleData.handle) or vehicleData.position

			for i = 1, #Cleanup.ignoredZones do
				if (#(position - Cleanup.ignoredZones[i].position) < Cleanup.ignoredZones[i].radius) then
					goto cleanupDone -- continue
				end
			end

			for i = 1, #Cleanup.ignoredPlates do
				if (vehicleData.tuning[1]:find(Cleanup.ignoredPlates[i]:upper())) then
					goto cleanupDone -- continue
				end
			end

			for i = 1, #Cleanup.ignoredModels do
				if (vehicleData.model == Cleanup.ignoredModels[i]) then
					goto cleanupDone -- continue
				end
			end

			if (Cleanup.timeThreshold and vehicleData.lastUpdate < timeDiff) then
				idsToDelete[#idsToDelete + 1] = id
				TriggerEvent("AP:cleanup:deletingVehicle", vehicleData.handle, vehicleData.tuning[1], "time")
				goto cleanupDone -- continue
			end

			if (Cleanup.engineThreshold and vehicleData.status[3] <= Cleanup.engineThreshold) then
				idsToDelete[#idsToDelete + 1] = id
				TriggerEvent("AP:cleanup:deletingVehicle", vehicleData.handle, vehicleData.tuning[1], "engineHealth")
				goto cleanupDone -- continue
			end

			if (Cleanup.distanceThreshold) then
				local distance = GetClosestDistanceFromList(position, playerPositions[vehicleData.bucket])
				if (distance > Cleanup.distanceThreshold) then
					idsToDelete[#idsToDelete + 1] = id
					TriggerEvent("AP:cleanup:deletingVehicle", vehicleData.handle, vehicleData.tuning[1], "distance")
					goto cleanupDone -- continue
				end
			end

			for i = 1, #Cleanup.zones do
				if (#(position - Cleanup.zones[i].position) < Cleanup.zones[i].radius) then
					idsToDelete[#idsToDelete + 1] = id
					TriggerEvent("AP:cleanup:deletingVehicle", vehicleData.handle, vehicleData.tuning[1], "zone_" .. i)
					goto cleanupDone -- continue
				end
			end

			::cleanupDone::
		end
	end)

	for i = 1, #idsToDelete do
		local vehicleData = QT:Get(idsToDelete[i])

		if (vehicleData.handle and DoesEntityExist(vehicleData.handle)) then
			DeleteEntity(vehicleData.handle)

			LogDebug("Cleanup removed \"%s\" (\"%s\").", id, vehicleData.tuning[1])
		end

		if (Cleanup.storeVehicles) then
			StoreVehicle(vehicleData.tuning[1], vehicleData.handle)
		end

		QT:Remove(idsToDelete[i])
	end

	Storage.DeleteByIds(idsToDelete)

	local othersCount = 0
	if (Cleanup.allVehicles) then
		local vehicles = GetAllVehicles()
		for i = 1, #vehicles do
			if (not DoesEntityExist(vehicles[i])) then
				goto cleanupOthersDone -- continue
			end

			local position = GetEntityCoords(vehicles[i])

			for i = 1, #Cleanup.ignoredZones do
				if (#(position - Cleanup.ignoredZones[i].position) < Cleanup.ignoredZones[i].radius) then
					goto cleanupOthersDone -- continue
				end
			end

			if (#Cleanup.ignoredPlates > 0) then
				local plate = GetVehicleNumberPlateText(vehicles[i])
				for i = 1, #Cleanup.ignoredPlates do
					if (plate:find(Cleanup.ignoredPlates[i]:upper())) then
						goto cleanupOthersDone -- continue
					end
				end
			end

			if (#Cleanup.ignoredModels > 0) then
				local model = GetEntityModel(vehicles[i])
				for i = 1, #Cleanup.ignoredModels do
					if (model == Cleanup.ignoredModels[i]) then
						goto cleanupOthersDone -- continue
					end
				end
			end

			if (Cleanup.engineThreshold and GetVehicleEngineHealth(vehicles[i]) <= Cleanup.engineThreshold) then
				DeleteEntity(vehicles[i])
				othersCount += 1
				goto cleanupOthersDone -- continue
			end

			if (Cleanup.distanceThreshold) then
				local distance = GetClosestDistanceFromList(position, playerPositions[GetEntityRoutingBucket(vehicles[i])])
				if (distance > Cleanup.distanceThreshold) then
					DeleteEntity(vehicles[i])
					othersCount += 1
					goto cleanupOthersDone -- continue
				end
			end

			for i = 1, #Cleanup.zones do
				if (#(position - Cleanup.zones[i].position) < Cleanup.zones[i].radius) then
					DeleteEntity(vehicles[i])
					othersCount += 1
					goto cleanupOthersDone -- continue
				end
			end

			::cleanupOthersDone::
		end
	end

	TriggerClientEvent("AP:showNotification", -1, Cleanup.deleteNotification)

	Log("Cleanup complete. Removed %s saved vehicles. Removed %s other vehicles.", #idsToDelete, othersCount)
end

-- add timed clean up tasks
for i = 1, #Cleanup.times do
	local day = Cleanup.times[i].day
	local hour = Cleanup.times[i].hour
	local minute = Cleanup.times[i].minute
	AddTask(CleanupProcess, day, hour, minute)

	for j = 1, #Cleanup.notificationTimes do
		local d = day
		local h = hour
		local m = minute - Cleanup.notificationTimes[j]
		if (m < 0) then
			m += 60
			h -= 1
			if (h < 0) then
				h += 24
				if (d) then
					d -= 1
					if (d < 0) then
						d += 7
					end
				end
			end
		end

		AddTask(function()
			TriggerClientEvent("AP:showNotification", -1, Cleanup.timeLeftNotification:format(Cleanup.notificationTimes[j]))
		end, d, h, m)
	end
end

-- Prevent double-runs (optional but recommended)
local cleanupRunning = false

local function RunCleanupNow(src)
	if cleanupRunning then
		if src and src ~= 0 then
			TriggerClientEvent("AP:showNotification", src, "Cleanup is already running.")
		end
		return
	end

	cleanupRunning = true

	-- If CleanupProcess expects args, pass them here; otherwise call directly.
	local ok, err = pcall(function()
		CleanupProcess()
	end)

	cleanupRunning = false

	if not ok then
		print(("[Cleanup] Error running CleanupProcess: %s"):format(err))
		if src and src ~= 0 then
			TriggerClientEvent("AP:showNotification", src, "Cleanup failed. Check server console.")
		end
		return
	end

	if src and src ~= 0 then
		TriggerClientEvent("AP:showNotification", src, "Cleanup started.")
	end
end

-- Basic permission helper (adjust to your framework if you want)
local function HasCleanupPerms(src)
	-- Console always allowed
	if src == 0 then return true end

	-- Ace perms option (recommended)
	if IsPlayerAceAllowed(src, "command.cleanup") then
		return true
	end

	-- QBX/QBCore style fallback (if you use these groups)
	-- Comment out if you don’t want it
	local ok, player = pcall(function()
		return exports.qbx_core and exports.qbx_core:GetPlayer(src)
	end)

	if ok and player and player.PlayerData and player.PlayerData.group then
		local g = player.PlayerData.group
		return g == "admin" or g == "mod"
	end

	return false
end

-- /cleanupnow -> runs CleanupProcess immediately
RegisterCommand("cleanupnow", function(source)
	if not HasCleanupPerms(source) then
		TriggerClientEvent("AP:showNotification", source, "You don't have permission to use this.")
		return
	end

	RunCleanupNow(source)
end, false)

-- /cleanupping [minutes] -> broadcasts the same notification message (testing)
RegisterCommand("cleanupping", function(source, args)
	if not HasCleanupPerms(source) then
		TriggerClientEvent("AP:showNotification", source, "You don't have permission to use this.")
		return
	end

	local mins = tonumber(args[1]) or 5
	TriggerClientEvent("AP:showNotification", -1, Cleanup.timeLeftNotification:format(mins))
end, false)

-- If you want to use ACE permissions, add this to server.cfg:
-- add_ace group.admin command.cleanup allow
-- add_ace group.mod command.cleanup allow
