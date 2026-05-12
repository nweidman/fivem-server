
local AP_RESOURCE_NAME <const> = "AdvancedParking"

if (GetCurrentResourceName() == AP_RESOURCE_NAME) then return end

local IS_CLIENT <const> = not IsDuplicityVersion()
local AP <const> = exports[AP_RESOURCE_NAME]

-- replaces FreezeEntityPosition native on client and server side
local original_FreezeEntityPosition <const> = FreezeEntityPosition
FreezeEntityPosition = function(entity, freeze)
	if (not DoesEntityExist(entity)) then return end

	if (GetEntityType(entity) ~= 2 or (IS_CLIENT and not NetworkGetEntityIsNetworked(entity)) or GetResourceState(AP_RESOURCE_NAME) ~= "started" or not AP.FreezeVehicle) then
		original_FreezeEntityPosition(entity, freeze)
		return
	end

	AP:FreezeVehicle(entity, freeze)
end
