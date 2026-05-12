
local math_min, math_max, math_floor = math.min, math.max, math.floor

-- returns all tuning of a vehicle
function GetVehicleTuning(vehicle)
	-- main colors
	local primaryColor, secondaryColor = GetVehicleColours(vehicle)
	local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)

	-- custom colors
	local customPrimaryColor, customSecondaryColor
	if (GetIsVehiclePrimaryColourCustom(vehicle)) then
		local r, g, b = GetVehicleCustomPrimaryColour(vehicle)
		customPrimaryColor = { r, g, b }
	end
	if (GetIsVehicleSecondaryColourCustom(vehicle)) then
		local r, g, b = GetVehicleCustomSecondaryColour(vehicle)
		customSecondaryColor = { r, g, b }
	end

	-- tire smoke color
	r, g, b = GetVehicleTyreSmokeColor(vehicle)
	local tireSmokeColor = { r, g, b }

	-- neon lights color
	local r, g, b = GetVehicleNeonLightsColour(vehicle)
	local neonLightsColor = { r, g, b }
	local enabledNeonLights = {
		IsVehicleNeonLightEnabled(vehicle, 0),
		IsVehicleNeonLightEnabled(vehicle, 1),
		IsVehicleNeonLightEnabled(vehicle, 2),
		IsVehicleNeonLightEnabled(vehicle, 3),
	}

	return {
		-- 1
		GetVehicleNumberPlateText(vehicle),

		-- 2
		GetVehicleMods(vehicle),

		-- 3
		primaryColor,
		-- 4
		secondaryColor,
		-- 5
		pearlescentColor,
		-- 6
		wheelColor,
		-- 7
		customPrimaryColor,
		-- 8
		customSecondaryColor,
		-- 9
		GetVehicleInteriorColor(vehicle),
		-- 10
		GetVehicleDashboardColor(vehicle),
		-- 11
		tireSmokeColor,

		-- 12
		GetVehicleXenonLightsColour(vehicle),
		-- 13
		neonLightsColor,
		-- 14
		enabledNeonLights,

		-- 15
		GetVehicleExtras(vehicle),

		-- 16
		GetVehicleWheelType(vehicle),
		-- 17
		GetVehicleModVariation(vehicle, 23),
		-- 18
		GetVehicleModVariation(vehicle, 24),
		-- 19
		not GetVehicleTyresCanBurst(vehicle),
		-- 20
		(GetGameBuildNumber() >= 2372) and GetDriftTyresEnabled(vehicle),

		-- 21
		GetVehicleNumberPlateTextIndex(vehicle),

		-- 22
		GetVehicleWindowTint(vehicle),

		-- 23
		GetVehicleLivery(vehicle),

		-- 24
		GetVehicleRoofLivery(vehicle)
	}
end

-- apply all vehicle tuning
function SetVehicleTuning(vehicle, tuning)
	SetVehicleModKit(vehicle, 0)

	-- 16 wheelType
	SetVehicleWheelType(vehicle, tuning[16])

	-- 2 mods
	SetVehicleMods(vehicle, tuning[2], tuning[17], tuning[18])

	-- 3-4 primary/secondaryColor
	SetVehicleColours(vehicle, tuning[3], tuning[4])
	-- 5-6 pearlescent/wheelColor
	SetVehicleExtraColours(vehicle, tuning[5], tuning[6])
	-- 7 customPrimaryColor
	if (tuning[7]) then
		SetVehicleCustomPrimaryColour(vehicle, tuning[7][1], tuning[7][2], tuning[7][3])
	end
	-- 8 customSecondaryColor
	if (tuning[8]) then
		SetVehicleCustomSecondaryColour(vehicle, tuning[8][1], tuning[8][2], tuning[8][3])
	end
	-- 9 interiorColor
	SetVehicleInteriorColor(vehicle, tuning[9])
	-- 10 dashboardColor
	SetVehicleDashboardColor(vehicle, tuning[10])
	-- 11 tireSmokeColor
	SetVehicleTyreSmokeColor(vehicle, tuning[11][1], tuning[11][2], tuning[11][3])

	-- 12 xenonLightsColor
	SetVehicleXenonLightsColour(vehicle, tuning[12])
	-- 13 neonLightsColor
	SetVehicleNeonLightsColour(vehicle, tuning[13][1], tuning[13][2], tuning[13][3])
	-- 14 enabledNeonLights
	for i = 0, 3, 1 do
		SetVehicleNeonLightEnabled(vehicle, i, tuning[14][i + 1])
	end

	-- 15 extras
	SetVehicleExtras(vehicle, tuning[15])

	-- 19 bulletproofTires
	SetVehicleTyresCanBurst(vehicle, not tuning[19])
	-- 20 driftTires
	if (GetGameBuildNumber() >= 2372) then
		SetDriftTyresEnabled(vehicle, tuning[20])
	end

	-- 1 numberPlateText
	SetVehicleNumberPlateText(vehicle, tuning[1])
	-- 21 numberPlateTextIndex
	SetVehicleNumberPlateTextIndex(vehicle, tuning[21])
	-- 22 windowTint
	SetVehicleWindowTint(vehicle, tuning[22])
	-- 23 livery
	SetVehicleLivery(vehicle, tuning[23])
	-- 24 roofLivery
	SetVehicleRoofLivery(vehicle, tuning[24])
end

-- returns the status values of a vehicle
function GetVehicleStatus(vehicle)
	return {
		-- 1 entity health
		math_max(math_min(GetEntityHealth(vehicle), 1000), 0),
		-- 2 body health
		math_floor(math_max(math_min(GetVehicleBodyHealth(vehicle), 1000.0), 0.0) * 10.0) / 10.0,
		-- 3 engine health
		math_floor(math_max(math_min(GetVehicleEngineHealth(vehicle), 1000.0), -4000.0) * 10.0) / 10.0,
		-- 4 petrol tank health
		math_floor(math_max(math_min(GetVehiclePetrolTankHealth(vehicle), 1000.0), -1000.0) * 10.0) / 10.0,

		-- 5 dirt level
		math_floor(GetVehicleDirtLevel(vehicle) * 10.0) / 10.0,
		-- 6 fuel level
		math_floor(GetFuelLevel(vehicle) * 10.0) / 10.0,

		-- 7 lock status
		GetVehicleDoorLockStatus(vehicle),

		-- 8 tire states
		GetVehicleTireStates(vehicle),
		-- 9 door states
		GetVehicleDoorStates(vehicle),
		-- 10 window states
		GetVehicleWindowStates(vehicle),
	}
end
-- apply all vehicle status values
function SetVehicleStatus(vehicle, status)
	-- 1 entity health
	SetEntityHealth(vehicle, math_floor(status[1]))
	-- 2 body health
	SetVehicleBodyHealth(vehicle, status[2] * 1.0)
	-- 3 engine health
	SetVehicleEngineHealth(vehicle, status[3] * 1.0)
	-- 4 petrol tank health
	SetVehiclePetrolTankHealth(vehicle, status[4] * 1.0)

	-- 5 dirt level
	SetVehicleDirtLevel(vehicle, status[5] * 1.0)
	-- 6 fuel level - set to 0.0 when tank completely dead
	if (status[4] < -999.0) then
		SetFuelLevel(vehicle, 0.0)
	else
		SetFuelLevel(vehicle, status[6] * 1.0)
	end

	-- 7 lock status
	SetVehicleDoorsLocked(vehicle, status[7])

	-- 8 tire states
	SetVehicleTireStates(vehicle, status[8])
	-- 9 door states
	SetVehicleDoorStates(vehicle, status[9])
	-- 10 window states
	SetVehicleWindowStates(vehicle, status[10])

	-- explosion check
	if (status[3] < -3999.0 or status[4] < -999.0) then
		StopEntityFire(vehicle)
		SetEntityRenderScorched(vehicle, true)
		for i = 0, 5 do
			SetVehicleTyreBurst(vehicle, i, true, 1000.0)
		end
	end
end

-- get additional values
local function GetConvertibleRoofIsOpen(vehicle)
	if (not IsVehicleAConvertible(vehicle)) then return false end

	local state = GetConvertibleRoofState(vehicle)
	return state == 1 or state == 2 or state == 6
end
local function GetLandingGearIsUp(vehicle)
	if (not DoesVehicleHaveLandingGear(vehicle)) then return false end
	
	local state = GetLandingGearState(vehicle)
	return state == 1 or state == 4
end
local function GetVtolMode(vehicle, model)
	if (not IsThisModelAPlane(model)) then return false end

	return GetVehicleFlightNozzlePosition(vehicle)
end
local function GetStubWingsAreDeployed(vehicle, model)
	if (model ~= `akula` and model ~= `annihilator`) then return false end

	return AreHeliStubWingsDeployed(vehicle)
end
local function GetBoatAnchorState(vehicle, model)
	if (not IsThisModelABoat(model)) then return false end

	return IsBoatAnchored(vehicle)
end

function GetVehicleExtraValues(vehicle)
	local model = GetEntityModel(vehicle)

	return {
		roofState		= GetConvertibleRoofIsOpen(vehicle) or nil,
		landingGearUp	= GetLandingGearIsUp(vehicle) or nil,
		vtolMode		= GetVtolMode(vehicle, model) or nil,
		stubWings		= GetStubWingsAreDeployed(vehicle, model) or nil,
		boatAnchor		= GetBoatAnchorState(vehicle, model) or nil
	}
end
-- set additional values
function SetVehicleExtraValues(vehicle, values)
	if (SaveExtraValues.roofState and values.roofState) then
		LowerConvertibleRoof(vehicle, true)
	end

	if (SaveExtraValues.landingGearUp and values.landingGearUp) then
		ControlLandingGear(vehicle, 3)
	end

	if (SaveExtraValues.vtolMode and values.vtolMode) then
		SetVehicleFlightNozzlePositionImmediate(vehicle, values.vtolMode)
	end

	if (SaveExtraValues.stubWings and values.stubWings) then
		SetDeployHeliStubWings(vehicle, true, false)
	end

	if (SaveExtraValues.boatAnchor and values.boatAnchor) then
		SetBoatRemainsAnchoredWhilePlayerIsDriver(vehicle, true)
		SetBoatAnchor(vehicle, true)
	end
end


-- returns all non-stock vehicle mods
function GetVehicleMods(vehicle)
	local mods = {}

	for i = 0, 49, 1 do
		-- TODO check for 17, 19, 21 -- toggle or normal mods? -- currently not possible
		if (i == 18 or i == 20 or i == 22) then
			if (IsToggleModOn(vehicle, i)) then
				mods[#mods + 1] = { 
					-- 1 index
					i, 
					-- 2 isToggledOn
					true 
				}
			end
		else
			local modIndex = GetVehicleMod(vehicle, i)
			if (modIndex ~= -1) then
				mods[#mods + 1] = { 
					-- 1 index
					i, 
					-- 2 modIndex
					modIndex 
				}
			end
		end
	end

	return mods
end
-- apply all vehicle mods
function SetVehicleMods(vehicle, mods, customFrontWheels, customRearWheels)
	for i = 1, #mods do
		local id = mods[i][1]

		-- TODO check for 17, 19, 21 -- toggle or normal mods? -- currently not possible
		if (id == 18 or id == 20 or id == 22) then
			ToggleVehicleMod(vehicle, id, mods[i][2])
		else
			SetVehicleMod(vehicle, id, mods[i][2], (id == 24) and customRearWheels or customFrontWheels)
		end
	end
end

-- returns all vehicle extras
function GetVehicleExtras(vehicle)
	local extras = {}

	for i = 0, 20 do
		if (DoesExtraExist(vehicle, i)) then
			if (IsVehicleExtraTurnedOn(vehicle, i)) then
				extras[#extras + 1] = { 
					-- 1 index
					i, 
					-- 2 isToggledOn
					0 
				}
			else
				extras[#extras + 1] = { 
					-- 1 index
					i, 
					-- 2 isToggledOn
					1 
				}
			end
		end
	end

	return extras
end
-- apply all vehicle extras
function SetVehicleExtras(vehicle, extras)
	for i = 1, #extras do
		SetVehicleExtra(vehicle, extras[i][1], extras[i][2])
	end
end

-- returns all tire states
local WheelState = {
	Deflated	= 0,
	Burst		= 1,
	BrokenOff	= 2,

	Functional	= 255
}
function GetVehicleTireStates(vehicle)
	local burstTires = {}

	for i = 0, 5 do
		if (IsVehicleWheelBrokenOff(vehicle, i)) then
			burstTires[#burstTires + 1] = { 
				-- 1 index
				i, 
				-- 2 state
				WheelState.BrokenOff
			}
		elseif (IsVehicleTyreBurst(vehicle, i, true)) then
			burstTires[#burstTires + 1] = { 
				-- 1 index
				i, 
				-- 2 isBurst
				WheelState.Burst
			}
		elseif (IsVehicleTyreBurst(vehicle, i, false)) then
			burstTires[#burstTires + 1] = { 
				-- 1 index
				i, 
				-- 2 isBurst
				WheelState.Deflated
			}
		end
	end

	return burstTires
end
-- apply all tire states
function SetVehicleTireStates(vehicle, tireStates)
	for i = 1, #tireStates do
		if (type(tireStates[i][2]) == "bool") then
			SetVehicleTyreBurst(vehicle, tireStates[i][1], tireStates[i][2], 1000.0)
		else
			if (tireStates[i][2] == WheelState.Deflated) then
				SetVehicleTyreBurst(vehicle, tireStates[i][1], false, 1000.0)
			elseif (tireStates[i][2] == WheelState.Burst) then
				SetVehicleTyreBurst(vehicle, tireStates[i][1], true, 1000.0)
			elseif (tireStates[i][2] == WheelState.BrokenOff) then
				BreakOffVehicleWheel(vehicle, tireStates[i][1], false, true, true, false)
			end
		end
	end
end

-- returns all door states
function GetVehicleDoorStates(vehicle)
	local doorStates = {}

	for i = 0, 7 do
		if (GetIsDoorValid(vehicle, i)) then
			doorStates[#doorStates + 1] = {
				-- 1 index
				i,
				-- 2 missing
				IsVehicleDoorDamaged(vehicle, i),
				-- 3 angle (unused, causes problems)
				--GetVehicleDoorAngleRatio(vehicle, i)
			}
		end
	end

	return doorStates
end
-- apply all door states
function SetVehicleDoorStates(vehicle, doorStates)
	for i = 1, #doorStates do
		if (doorStates[i][2]) then
			SetVehicleDoorBroken(vehicle, doorStates[i][1], true)
		--elseif (doorStates[i][3] > 0.0) then
		--	SetVehicleDoorControl(vehicle, doorStates[i][1], 1000, doorStates[i][3])
		end
	end
end

-- returns all window states
function GetVehicleWindowStates(vehicle)
	if (AreAllVehicleWindowsIntact(vehicle)) then
		return {}
	end

	local windowStates = {}

	for i = 0, 13 do
		if (not IsVehicleWindowIntact(vehicle, i)) then
			windowStates[#windowStates + 1] = i
		end
	end

	return windowStates
end
-- apply all window states
function SetVehicleWindowStates(vehicle, windowStates)
	for i = 1, #windowStates do
		SmashVehicleWindow(vehicle, windowStates[i])
	end
end



-- returns true if vehicle is blacklisted and should not be saved
function IsVehicleBlacklisted(vehicle)
	-- treat vehicles that already have an id (e.g. through use of export UpdateVehicle) as not blacklisted
	if (Entity(vehicle).state.ap_id) then
		return false
	end

	-- check class
	local class = GetVehicleClass(vehicle)
	for i = 1, #classesBlacklist do
		if (class == classesBlacklist[i]) then
			return true
		end
	end

	-- check model
	local modelHash = GetEntityModel(vehicle)
	for i = 1, #vehiclesBlacklist do
		if (modelHash == vehiclesBlacklist[i]) then
			return true
		end
	end

	-- check plate
	local plate = GetVehicleNumberPlateText(vehicle)
	for i = 1, #platesBlacklist do
		if (plate:find(platesBlacklist[i]:upper())) then
			return true
		end
	end

	return false
end
