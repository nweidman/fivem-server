
local AP_RESOURCE_NAME <const> = "AdvancedParking"

if (GetCurrentResourceName() == AP_RESOURCE_NAME) then return end

local AP <const> = exports[AP_RESOURCE_NAME]

-- replaces AttachEntityToEntity native
local original_AttachEntityToEntity <const> = AttachEntityToEntity
AttachEntityToEntity = function(...)
	original_AttachEntityToEntity(...)

	if (GetResourceState(AP_RESOURCE_NAME) ~= "started") then return end

	local vehicle1, vehicle2, boneIndex = select(1, ...)

	if (not DoesEntityExist(vehicle1) or not DoesEntityExist(vehicle2)) then return end
	if (not NetworkGetEntityIsNetworked(vehicle1) or not NetworkGetEntityIsNetworked(vehicle2)) then return end
	if (NetworkGetEntityOwner(vehicle1) ~= PlayerId()) then return end
	if (GetEntityType(vehicle1) ~= 2 or GetEntityType(vehicle2) ~= 2) then return end

	local posX, posY, posZ = select(4, ...)
	if (type(posX) == "vector3") then
		local rotX, rotY, rotZ = select(5, ...)
		if (type(rotX) == "vector3") then
			AP:AttachVehicles(vehicle1, vehicle2, boneIndex, posX, rotX, select(6, ...))
		else
			AP:AttachVehicles(vehicle1, vehicle2, boneIndex, posX, vector3(rotX, rotY, rotZ), select(8, ...))
		end
	else
		local rotX, rotY, rotZ = select(7, ...)
		if (type(rotX) == "vector3") then
			AP:AttachVehicles(vehicle1, vehicle2, boneIndex, vector3(posX, posY, posZ), rotX, select(8, ...))
		else
			AP:AttachVehicles(vehicle1, vehicle2, boneIndex, vector3(posX, posY, posZ), vector3(rotX, rotY, rotZ), select(10, ...))
		end
	end
end

-- replaces DetachEntity native
local original_DetachEntity <const> = DetachEntity
DetachEntity = function(vehicle, dynamic, collision)
	original_DetachEntity(vehicle, dynamic, collision)

	if (GetResourceState(AP_RESOURCE_NAME) ~= "started") then return end

	if (not DoesEntityExist(vehicle)) then return end
	if (not NetworkGetEntityIsNetworked(vehicle)) then return end
	if (NetworkGetEntityOwner(vehicle) ~= PlayerId()) then return end
	if (GetEntityType(vehicle) ~= 2) then return end

	AP:DetachVehicles(vehicle)
end
