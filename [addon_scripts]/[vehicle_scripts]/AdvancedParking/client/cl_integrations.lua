
-- get vehicle fuel level
function GetFuelLevel(vehicle)
	if (GetResourceState("ps-fuel") == "started") then
		return exports["ps-fuel"]:GetFuel(vehicle)
	elseif (GetResourceState("ox_fuel") == "started") then
		return Entity(vehicle).state.fuel or GetVehicleFuelLevel(vehicle)
	elseif (GetResourceState("myFuel") == "started") then
		return exports["myFuel"]:GetFuel(vehicle)
	else
		return GetVehicleFuelLevel(vehicle)
	end
end

-- set vehicle fuel level
function SetFuelLevel(vehicle, fuelLevel)
	if (GetResourceState("ps-fuel") == "started") then
		exports["ps-fuel"]:SetFuel(vehicle, fuelLevel)
	elseif (GetResourceState("ox_fuel") == "started") then
		Entity(vehicle).state.fuel = fuelLevel
	elseif (GetResourceState("myFuel") == "started") then
		exports["myFuel"]:SetFuel(vehicle, fuelLevel)
	else
		SetVehicleFuelLevel(vehicle, fuelLevel)
	end
end

-- notification (used for the delete timer) -> lb-phone notification
function ShowNotification(text)
    local ok = pcall(function()
        exports["lb-phone"]:SendNotification({
            app     = "Messages",            -- or "Messages" if you prefer SMS-style
            title   = "City Services",    -- sender name
            content = tostring(text),
        })
    end)

    -- fallback if lb-phone fails
    if not ok then
        SetNotificationTextEntry('STRING')
        AddTextComponentSubstringPlayerName(tostring(text))
        DrawNotification(false, true)
    end
end
