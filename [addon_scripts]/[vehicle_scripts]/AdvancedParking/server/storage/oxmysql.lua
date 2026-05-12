if (GetResourceState("oxmysql") == "missing") then return end

local json_encode, json_decode, table_concat, string_rep = json.encode, json.decode, table.concat, string.rep
local oxmysql = exports["oxmysql"]

local function DoesColumnExist(colName)
	return oxmysql:scalar_async([[
		SELECT COUNT(*) FROM `INFORMATION_SCHEMA`.`COLUMNS`
			WHERE `TABLE_SCHEMA` = DATABASE() AND `TABLE_NAME` = ? AND `COLUMN_NAME` = ?;
	]], { "vehicle_parking", colName }) > 0
end

Trim = Trim or function(str)
	if not str then return str end
	return (tostring(str):gsub("^%s*(.-)%s*$", "%1"))
end

local function NormalizePlate(plate)
	if not plate then return nil end
	plate = tostring(plate):upper()
	plate = plate:gsub("%s+", "")
	return plate
end

Storage = {}

Storage.Create = function()
	oxmysql:update_async([[
		CREATE TABLE IF NOT EXISTS `vehicle_parking` (
			`id` varchar(16) NOT NULL,
			`model` int(11) NOT NULL,
			`type` varchar(16) NOT NULL,
			`status` text NOT NULL,
			`tuning` text NOT NULL,
			`extraValues` text NOT NULL DEFAULT '[]',
			`stateBags` longtext NOT NULL DEFAULT '[]',
			`bucket` int(11) NOT NULL DEFAULT '0',
			`posX` float NOT NULL,
			`posY` float NOT NULL,
			`posZ` float NOT NULL,
			`rotX` float NOT NULL,
			`rotY` float NOT NULL,
			`rotZ` float NOT NULL,
			`attachedTo` text,
			`lastUpdate` int(11) NOT NULL DEFAULT '0',
			`initialPlayer` varchar(50),
			`lastPlayer` varchar(50),
			PRIMARY KEY (`id`)
		);
	]])

	if (not DoesColumnExist("bucket")) then
		oxmysql:update_async([[
			ALTER TABLE `vehicle_parking`
				ADD COLUMN `bucket` INT(11) NOT NULL DEFAULT 0 AFTER `stateBags`;
		]])
	end
	if (not DoesColumnExist("initialPlayer")) then
		oxmysql:update_async([[
			ALTER TABLE `vehicle_parking`
				ADD COLUMN `initialPlayer` varchar(50) AFTER `lastUpdate`;
		]])
	end
	if (not DoesColumnExist("lastPlayer")) then
		oxmysql:update_async([[
			ALTER TABLE `vehicle_parking`
				ADD COLUMN `lastPlayer` varchar(50) AFTER `initialPlayer`;
		]])
	end
	if (not DoesColumnExist("extraValues")) then
		oxmysql:update_async([[
			ALTER TABLE `vehicle_parking`
				ADD COLUMN `extraValues` TEXT NOT NULL DEFAULT '[]' AFTER `tuning`;
		]])
	end
	oxmysql:update_async([[
		ALTER TABLE `vehicle_parking`
			MODIFY COLUMN `stateBags` longtext NOT NULL DEFAULT '[]';
	]])
	if (not DoesColumnExist("attachedTo")) then
		oxmysql:update_async([[
			ALTER TABLE `vehicle_parking`
				ADD COLUMN `attachedTo` TEXT AFTER `rotZ`;
		]])
	end
end

Storage.GetAllVehicles = function()
	local rows = oxmysql:query_async([[
		SELECT `id`, `model`, `type`, `status`, `tuning`, `extraValues`, `stateBags`, `bucket`, `posX`, `posY`, `posZ`, `rotX`, `rotY`, `rotZ`, `attachedTo`, `lastUpdate`, `initialPlayer`, `lastPlayer`
			FROM `vehicle_parking`;
	]])

	for i, row in ipairs(rows) do
		row.status = json_decode(row.status)
		row.tuning = json_decode(row.tuning)
		row.extraValues = json_decode(row.extraValues)
		row.stateBags = ChangeTablesToVector(json_decode(row.stateBags))
		row.position = vector3(row.posX, row.posY, row.posZ)
		row.rotation = vector3(row.rotX, row.rotY, row.rotZ)
		row.attachedTo = row.attachedTo and json_decode(row.attachedTo) or nil
	end

	return rows
end

Storage.DeleteById = function(id)
	oxmysql:update([[
		DELETE FROM `vehicle_parking`
			WHERE `id` = ?;
	]], { id })
end

Storage.DeleteByIds = function(ids)
	oxmysql:update(([[
		DELETE FROM `vehicle_parking`
			WHERE `id` IN (%s);
	]]):format(string_rep("?, ", #ids - 1) .. "?"), ids)
end

Storage.DeleteAllVehicles = function()
	oxmysql:update("DELETE FROM `vehicle_parking`;")
end

Storage.InsertVehicle = function(id, model, vehType, status, tuning, extraValues, stateBags, bucket, position, rotation, attachedTo, lastUpdate, initialPlayer, lastPlayer)
	oxmysql:insert([[
		INSERT INTO `vehicle_parking` (`id`, `model`, `type`, `status`, `tuning`, `extraValues`, `stateBags`, `bucket`, `posX`, `posY`, `posZ`, `rotX`, `rotY`, `rotZ`, `attachedTo`, `lastUpdate`, `initialPlayer`, `lastPlayer`)
			VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
	]], {
		id,
		model, vehType,
		json_encode(status), json_encode(tuning), json_encode(extraValues),
		json_encode(stateBags),
		bucket,
		position.x, position.y, position.z, rotation.x, rotation.y, rotation.z,
		attachedTo and json_encode(attachedTo) or nil,
		lastUpdate,
		initialPlayer, lastPlayer
	})
end

Storage.UpdateVehicle = function(id, status, tuning, extraValues, stateBags, bucket, position, rotation, attachedTo, lastUpdate, lastPlayer)
	oxmysql:update([[
		UPDATE `vehicle_parking`
			SET `status` = ?, `tuning` = ?, `extraValues` = ?,
				`stateBags` = ?,
				`bucket` = ?,
				`posX` = ?, `posY` = ?, `posZ` = ?,
				`rotX` = ?, `rotY` = ?, `rotZ` = ?,
				`attachedTo` = ?,
				`lastUpdate` = ?,
				`lastPlayer` = ?
			WHERE `id` = ?;
	]], {
		json_encode(status), json_encode(tuning), json_encode(extraValues),
		json_encode(stateBags),
		bucket,
		position.x, position.y, position.z, rotation.x, rotation.y, rotation.z,
		attachedTo and json_encode(attachedTo) or nil,
		lastUpdate,
		lastPlayer,
		id
	})
end

Storage.UpdateBucket = function(id, bucket)
	oxmysql:update([[
		UPDATE `vehicle_parking`
			SET `bucket` = ?
			WHERE `id` = ?;
	]], {
		bucket,
		id
	})
end

Storage.UpdateTuning = function(id, tuning)
	oxmysql:update([[
		UPDATE `vehicle_parking`
			SET `tuning` = ?
			WHERE `id` = ?;
	]], {
		json_encode(tuning),
		id
	})
end

Storage.UpdateStatus = function(id, status)
	oxmysql:update([[
		UPDATE `vehicle_parking`
			SET `status` = ?
			WHERE `id` = ?;
	]], {
		json_encode(status),
		id
	})
end

Storage.UpdatePosition = function(id, position, rotation)
	oxmysql:update([[
		UPDATE `vehicle_parking`
			SET `posX` = ?, `posY` = ?, `posZ` = ?,
				`rotX` = ?, `rotY` = ?, `rotZ` = ?
			WHERE `id` = ?;
	]], {
		position.x, position.y, position.z,
		rotation.x, rotation.y, rotation.z,
		id
	})
end

Storage.UpdatePositionAndStatus = function(id, position, rotation, status, lastUpdate)
	oxmysql:update([[
		UPDATE `vehicle_parking`
			SET `posX` = ?, `posY` = ?, `posZ` = ?,
				`rotX` = ?, `rotY` = ?, `rotZ` = ?,
				`status` = ?,
				`lastUpdate` = ?
			WHERE `id` = ?;
	]], {
		position.x, position.y, position.z,
		rotation.x, rotation.y, rotation.z,
		json_encode(status),
		lastUpdate,
		id
	})
end

Storage.UpdateStateBags = function(id, stateBags)
	oxmysql:update([[
		UPDATE `vehicle_parking`
			SET `stateBags` = ?
			WHERE `id` = ?;
	]], {
		json_encode(stateBags),
		id
	})
end

Storage.UpdateAttachedTo = function(id, attachedTo)
	oxmysql:update([[
		UPDATE `vehicle_parking`
			SET `attachedTo` = ?
			WHERE `id` = ?;
	]], {
		attachedTo and json_encode(attachedTo) or nil,
		id
	})
end

local tableName, storedCol = nil, nil

local function GetOwnedVehiclesTableName()
	if tableName ~= nil then return tableName end
	tableName = (GetResourceState("es_extended") ~= "missing") and "owned_vehicles" or "player_vehicles"
	return tableName
end

local function GetStoredColumnName()
	if storedCol ~= nil then return storedCol end

	if (GetResourceState("es_extended") ~= "missing") then
		storedCol = "stored"
	else
		storedCol = "in_garage"
	end

	return storedCol
end

Storage.IsVehicleOwned = function(plate)
	local tbl = GetOwnedVehiclesTableName()
	plate = NormalizePlate(plate)
	if not plate then return false end

	local found = oxmysql:scalar_async(([[
		SELECT 1
		FROM `%s`
		WHERE REPLACE(UPPER(`plate`), ' ', '') = ?
		LIMIT 1;
	]]):format(tbl), { plate })

	return found ~= nil
end

Storage.StoreVehicleInGarage = function(plate, garageName)
	local tbl = GetOwnedVehiclesTableName()
	local stored = GetStoredColumnName()

	plate = NormalizePlate(plate)
	if not plate then return 0 end

	garageName = garageName or "Legion Square"

	return oxmysql:update_async(([[
		UPDATE `%s`
		SET `%s` = 1,
			`in_garage` = 1,
			`garage_id` = ?,
			`state` = 1
		WHERE REPLACE(UPPER(`plate`), ' ', '') = ?;
	]]):format(tbl, stored), {
		garageName,
		plate
	})
end
