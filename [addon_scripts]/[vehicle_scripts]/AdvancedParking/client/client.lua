
local SPAWN_TIMEOUT <const> = 30000

-- script status on startup
local enabled = true

-- update vehicle on server side
local function UpdateVehicle(vehicle, reason)
	local tuning = GetVehicleTuning(vehicle)
	LogDebug("Updating \"%s\" (%s)", tuning[1], reason)

	TriggerServerEvent(
		"AP:updateVehicle", 
		NetworkGetNetworkIdFromEntity(vehicle), 
		GetEntityModel(vehicle), 
		tuning, 
		GetVehicleStatus(vehicle), 
		GetVehicleExtraValues(vehicle),
		reason
	)

	TriggerEvent("AP:updateVehicle", vehicle, reason)
end
exports("UpdateVehicle", function(vehicle)
	if (not DoesEntityExist(vehicle) or not NetworkGetEntityIsNetworked(vehicle)) then return end

	UpdateVehicle(vehicle, "Resource \"" .. GetInvokingResource() .. "\"")
end)

-- when a player entered a vehicle
local function EnteredVehicle(vehicle)
	if (not DoesEntityExist(vehicle) or not NetworkGetEntityIsNetworked(vehicle) or IsVehicleBlacklisted(vehicle)) then return end

	if (GetVehicleTypeRaw(vehicle) == 2) then
		TriggerServerEvent("AP:enteredTrailer", NetworkGetNetworkIdFromEntity(vehicle))
	end

	UpdateVehicle(vehicle, "Player enter")
end

-- when a player left a vehicle
local function LeftVehicle(vehicle)
	if (not DoesEntityExist(vehicle) or not NetworkGetEntityIsNetworked(vehicle) or IsVehicleBlacklisted(vehicle)) then return end

	if (GetVehicleTypeRaw(vehicle) == 2) then
		TriggerServerEvent("AP:leftTrailer", NetworkGetNetworkIdFromEntity(vehicle))
	end

	UpdateVehicle(vehicle, "Player exit")
end

-- localising loop natives
local IsPedInAnyVehicle, GetVehiclePedIsIn, GetVehicleTrailerVehicle = IsPedInAnyVehicle, GetVehiclePedIsIn, GetVehicleTrailerVehicle

local isInVehicle = false
AddEventHandler("gameEventTriggered", function(eventName, eventData)
	if (not enabled or isInVehicle or eventName ~= "CEventNetworkPlayerEnteredVehicle" or eventData[1] ~= PlayerId()) then return end

	-- entered vehicle
	isInVehicle = true

	local playerPed = PlayerPedId()
	local vehicle = eventData[2]
	local trailer = nil

	EnteredVehicle(vehicle)

	while (IsPedInAnyVehicle(playerPed)) do
		-- check for instant vehicle switch
		local newVehicle = GetVehiclePedIsIn(playerPed)
		if (vehicle ~= newVehicle) then
			LeftVehicle(vehicle)
			EnteredVehicle(newVehicle)

			vehicle = newVehicle
		end

		-- check for trailer
		local hasTrailer, newTrailer = GetVehicleTrailerVehicle(vehicle)
		if (hasTrailer) then
			if (trailer ~= newTrailer) then
				LeftVehicle(trailer)
				EnteredVehicle(newTrailer)
			end

			trailer = newTrailer
		elseif (trailer) then
			LeftVehicle(trailer)

			trailer = nil
		end

		Wait(0)
	end

	-- left vehicle
	LeftVehicle(vehicle)
	if (trailer) then
		LeftVehicle(trailer)
	end

	isInVehicle = false
end)

-- setting tuning
AddStateBagChangeHandler("ap_data", nil, function(bagName, key, value, _unused, replicated)
	if (bagName:find("entity") == nil or value == nil) then return end

	local startTime = GetGameTimer()

	local networkIdString = bagName:gsub("entity:", "")
	local networkId = tonumber(networkIdString)
	if (not WaitUntilEntityWithNetworkIdExists(networkId, 5000)) then return end

	local vehicle = NetworkGetEntityFromNetworkId(networkId)

	CreateThread(function()
		local endTime = GetGameTimer() + 3000
		while (DoesEntityExist(vehicle) and not HasCollisionLoadedAroundEntity(vehicle) and GetGameTimer() < endTime) do
			RequestCollisionAtCoord(value[4].x, value[4].y, value[4].z)

			Wait(0)
		end

		if (not DoesEntityExist(vehicle)) then return end

		SetEntityCoordsNoOffset(vehicle, value[4].x, value[4].y, value[4].z, false, false, true)
		SetEntityRotation(vehicle, value[5].x, value[5].y, value[5].z)
	end)

	if (not WaitUntilPlayerEqualsEntityOwner(vehicle, SPAWN_TIMEOUT)) then return end

	if (Cleanup.submergedVehicles and IsEntityInWater(vehicle) and GetEntitySubmergedLevel(vehicle) >= 0.5) then
		local vehicleType = GetVehicleTypeRaw(vehicle)
		if (vehicleType ~= 5 and vehicleType ~= 15) then
			LogDebug("\"%s\" is submerged and will be deleted.", value[1][1])

			DeleteSubmergedVehicle(vehicle)

			return
		end
	end

	LogDebug("Setting properties for \"%s\"", value[1][1])

	SetVehicleTuning(vehicle, value[1])
	SetVehicleStatus(vehicle, value[2])
	SetVehicleExtraValues(vehicle, value[3])

	-- handle attaching vehicle
	if (value[6]) then
		CreateThread(function()
			local otherVehicle = TryGetVehicleFromId(value[6][1], SPAWN_TIMEOUT - (GetGameTimer() - startTime))
			if (not otherVehicle) then
				LogDebug("Could not find vehicle \"%s\" to attach to", value[6][1])
			else
				LogDebug("Attaching \"%s\" to \"%s\"", value[1][1], GetVehicleNumberPlateText(otherVehicle))
			end

			AttachEntityToEntity(vehicle, otherVehicle, value[6][2], value[6][3].x, value[6][3].y, value[6][3].z, value[6][4].x, value[6][4].y, value[6][4].z, value[6][5], value[6][6], value[6][7], value[6][8], value[6][9], value[6][10])
		end)
	end

	TriggerEvent("AP:vehicleSpawned", vehicle)

	local vehicleCount = GetNetworkedVehicleCount()
	if (vehicleCount > GetNetVehiclePoolSize() - poolSizeWarningThreshold) then
		TriggerServerEvent("AP:poolsizeWarning", vehicleCount)
	end
end)



-- notification for delete timer
RegisterNetEvent("AP:showNotification", function(text)
	ShowNotification(text)
end)

-- enables/disables the client sending enter/left events
local function Enable(enable)
	assert(enable ~= nil and type(enable) == "boolean", "Parameter \"enable\" must be a bool!")

	enabled = enable
end
exports("Enable", Enable)

-- export for force freezing vehicles
if (forceUnfreezeVehicles) then
	local function FreezeVehicle(vehicle, freeze)
		TriggerServerEvent("AP:freezeVehicle", NetworkGetNetworkIdFromEntity(vehicle), freeze)
	end
	exports("FreezeVehicle", FreezeVehicle)
end



local damageUpdates = {}
AddEventHandler("gameEventTriggered", function (name, args)
	if (name ~= "CEventNetworkEntityDamage") then return end

	local vehicle = args[1]
	if (not DoesEntityExist(vehicle) or not IsEntityAVehicle(vehicle)) then return end
	if (not NetworkGetEntityIsNetworked(vehicle)) then return end
	if (IsPedInVehicle(PlayerPedId(), vehicle, true)) then return end

	local id = Entity(vehicle).state.ap_id
	if (not id) then return end

	local plate = GetVehicleNumberPlateText(vehicle)

	LogDebug("Damage detected on \"%s\" (%s)", plate, id)

	if (damageUpdates[vehicle]) then
		damageUpdates[vehicle] = GetGameTimer() + 5000
		return
	end

	damageUpdates[vehicle] = GetGameTimer() + 5000

	while (damageUpdates[vehicle] > GetGameTimer()) do
		Wait(0)
	end

	damageUpdates[vehicle] = nil

	if (not DoesEntityExist(vehicle) or NetworkGetEntityOwner(vehicle) ~= PlayerId()) then return end

	LogDebug("Sending damage update to server for \"%s\" (%s)", plate, id)

	TriggerServerEvent("AP:onVehicleDamage", NetworkGetNetworkIdFromEntity(vehicle), GetVehicleStatus(vehicle))
end)


local colors = {
	{ 255, 0, 0 },
	{ 255, 255, 0 },
	{ 128, 255, 0 },
	{ 0, 128, 128 },
	{ 0, 255, 255 },
	{ 0, 0, 255 },
	{ 255, 0, 255 },
	{ 255, 128, 0 },
	{ 128, 128, 0 }
}

RegisterNetEvent("QT:debugData", function(list)
	local endTime = GetGameTimer() + 1020

	local resX, resY = GetActualScreenResolution()
	local aspectRatio = (resX * 1.0) / (resY * 1.0)
	local invertedAspectRatio = (resY * 1.0) / (resX * 1.0)

	local mapRatio = 12000.0 / 12500.0

	local px = 1.0/1080.0

	while (GetGameTimer() < endTime) do
		local playerPos = GetEntityCoords(PlayerPedId())
		playerPos = vector2(
			((playerPos.x + 5500.0) / 12000.0) / aspectRatio,
			1.0 - ((playerPos.y + 4000.0) / 12500.0)
		)
		DrawRect(playerPos.x, playerPos.y, 5.0/1920.0, 5.0/1080.0, 255, 0, 0, 255)

		colorIndex = 1

		for i = 1, #list do
			local b = list[i][1]
			b = vector4(
				(b.x + 5500.0) / 12000.0,
				1.0 - ((b.y + 4000.0) / 12500.0),
				(b.z) / 12000.0,
				(b.w) / 12500.0
			)

			local color = colors[colorIndex]
			colorIndex += 1
			if (colorIndex > #colors) then
				colorIndex = 1
			end

			local c1 = vector2((b.x) / aspectRatio, b.y) + vector2(px, -px)
			local c2 = vector2((b.x + b.z) / aspectRatio, b.y) + vector2(-px, -px)
			local c3 = vector2((b.x + b.z) / aspectRatio, b.y - b.w) + vector2(-px, px)
			local c4 = vector2((b.x) / aspectRatio, b.y - b.w) + vector2(px, px)
			local m = vector2((b.x + 0.5 * b.z) / aspectRatio, b.y - 0.5 * b.w)

			DrawLine_2d(
				c1.x, c1.y,
				c2.x, c2.y,
				1.0/1920.0,
				color[1], color[2], color[3], 255
			)
			DrawLine_2d(
				c2.x, c2.y,
				c3.x, c3.y,
				1.0/1920.0,
				color[1], color[2], color[3], 255
			)
			DrawLine_2d(
				c3.x, c3.y,
				c4.x, c4.y,
				1.0/1920.0,
				color[1], color[2], color[3], 255
			)
			DrawLine_2d(
				c4.x, c4.y,
				c1.x, c1.y,
				1.0/1920.0,
				color[1], color[2], color[3], 255
			)

			local positions = list[i][2]

			local numEntities = tostring(#positions)
			SetTextScale(0, 0.3)
			SetTextJustification(0)
			SetTextColour(color[1], color[2], color[3], 120)
			SetTextDropshadow(3, 0, 0, 0, 150)
			BeginTextCommandDisplayText("CELL_EMAIL_BCON")
			AddTextComponentSubstringPlayerName(numEntities)
			EndTextCommandDisplayText(m.x, m.y - GetRenderedCharacterHeight(0.3, 0) * 0.7)

			for j = 1, #positions do
				local pos = vector2(
					((positions[j].x + 5500.0) / 12000.0) / aspectRatio,
					1.0 - ((positions[j].y + 4000.0) / 12500.0)
				)
				if (#(playerPos - pos) < 0.2) then
					DrawRect(
						pos.x, pos.y,
						5.0/1920.0, 5.0/1080.0,
						color[1], color[2], color[3], 255
					)
				end
			end
		end

		Wait(0)
	end
end)
