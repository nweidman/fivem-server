
-- returns if any player is inside a given vehicle
function IsAnyPlayerInsideVehicle(vehicle, playerPeds)
	for i = 1, #playerPeds do
		local veh = GetVehiclePedIsIn(playerPeds[i], false)

		if (DoesEntityExist(veh) and veh == vehicle) then
			return true
		end
	end

	return false
end

-- returns if any player is inside a given vehicle
function IsVehicleOccupied(vehicle, playerData)
	for _, data in pairs(playerData) do
		if (vehicle == data.vehicle) then
			return true
		end
	end

	return false
end

-- return the id and distance of the closest player
function GetClosestPlayer(position, maxRadius, players, playerPedsWithHandles, bucket)
	local closestDistance	= maxRadius or 1000.0
	local closestPlayer		= nil

	for i = 1, #players do
		if (GetPlayerRoutingBucket(players[i]) == bucket) then
			local distance = #(position - GetEntityCoords(playerPedsWithHandles[ players[i] ]))
			if (distance < closestDistance) then
				closestDistance	= distance
				closestPlayer	= players[i]
			end
		end
	end

	return closestPlayer, closestDistance
end

function IsAnyPlayerInRange(position, radius, playerData, bucket)
	for id, data in pairs(playerData) do
		if (GetPlayerBucket(id) == bucket and #(position - data.position) < radius) then
			return true
		end
	end

	return false
end

function GetPlayerData(players)
	local playerData = {}

	for i = 1, #players do
		local ped = GetPlayerPed(players[i])
		if (DoesEntityExist(ped)) then
			local vehicle = GetVehiclePedIsIn(ped, false)

			playerData[ players[i] ] = {
				ped = ped,
				position = GetEntityCoords(ped),
				vehicle = DoesEntityExist(vehicle) and vehicle
			}
		end
	end

	return playerData
end

-- return all player peds associated to their player handles
function GetAllPlayerPedsWithHandles(players)
	local peds = {}

	for i = 1, #players do
		local ped = GetPlayerPed(players[i])
		peds[players[i]] = DoesEntityExist(ped) and ped or nil
	end

	return peds
end

-- returns all currently loaded player peds
function GetAllPlayerPeds(players)
	local playerPeds = {}

	local players = players or GetPlayers()
	for i = 1, #players do
		local ped = GetPlayerPed(players[i])
		if (DoesEntityExist(ped)) then
			playerPeds[#playerPeds + 1] = ped
		end
	end

	return playerPeds
end

-- returns a list of all vehicles that are loaded and are registered within AP already
function GetLoadedVehiclesWithId(vehicles)
	local list = {}

	for i = 1, #vehicles do
		if (DoesEntityExist(vehicles[i])) then
			local id = Entity(vehicles[i])?.state?.ap_id
			if (id) then
				list[id] = vehicles[i]
			end
		end
	end

	return list
end

-- returns the server side vehicle handle given a plate
function GetVehicleHandleFromPlate(plate, vehicles)
	local trimmedPlate = Trim(plate)

	for i = 1, #vehicles do
		if (DoesEntityExist(vehicles[i])) then
			local vehiclePlate = GetVehicleNumberPlateText(vehicles[i])
			if (vehiclePlate == plate or vehiclePlate == trimmedPlate) then
				return vehicles[i]
			end
		end
	end

	return nil
end
