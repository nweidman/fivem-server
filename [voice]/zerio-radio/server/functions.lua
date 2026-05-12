local panicButtonCooldown = {}

if Shared.Framework == "qbcore" then
	Framework = exports["qb-core"]:GetCoreObject()
elseif Shared.Framework == "esx" then
	if not pcall(function()
			Framework = exports["es_extended"]:getSharedObject()
		end) then
		TriggerEvent("esx:getSharedObject", function(obj) Framework = obj end)
	end
end

Functions = {
	CreateUseableItem = function(name, handler)
		if Shared.Framework == "esx" then
			Framework.RegisterUsableItem(name, handler)
		elseif Shared.Framework == "qbcore" then
			Framework.Functions.CreateUseableItem(name, handler)
		end
	end,

	SelectSQL = function(query, params)
		if GetResourceState("oxmysql") == "started" then
			local retVal = exports.oxmysql:query_async(query, params)

			return retVal
		end

		local resp = promise.new()
		if GetResourceState("ghmattimysql") == "started" and GetResourceState("oxmysql") ~= "started" then
			exports.ghmattimysql:execute(query, params, function(retVal)
				resp:resolve(retVal)
			end)
		elseif GetResourceState("mysql-async") == "started" and GetResourceState("oxmysql") ~= "started" then
			exports["mysql-async"]:mysql_fetch_all(query, params, function(retVal)
				resp:resolve(retVal)
			end)
		else
			resp:resolve(nil)
		end

		Citizen.Await(resp)

		return resp.value
	end,

	SelectSQLScalar = function(query, params, rowName)
		if GetResourceState("oxmysql") == "started" then
			local resp = exports.oxmysql:scalar_async(query, params)

			if resp ~= nil then
				return {
					{
						[rowName] = resp
					}
				}
			else
				return {}
			end
		end

		return Functions.SelectSQL(query, params)
	end,

	SelectSQLSingle = function(query, params)
		if GetResourceState("oxmysql") == "started" then
			local resp = exports.oxmysql:single_async(query, params)

			local retVal = {}
			if resp ~= nil then
				retVal[1] = resp
			end

			return retVal
		end

		return Functions.SelectSQL(query, params)
	end,

	UpdateSQL = function(query, params)
		if GetResourceState("oxmysql") == "started" then
			local resp = exports.oxmysql:update_async(query, params)

			return resp
		end

		local resp = promise.new()
		if GetResourceState("ghmattimysql") == "started" and GetResourceState("oxmysql") ~= "started" then
			exports.ghmattimysql:execute(query, params, function(retVal)
				resp:resolve(retVal)
			end)
		elseif GetResourceState("mysql-async") == "started" and GetResourceState("oxmysql") ~= "started" then
			exports["mysql-async"]:mysql_execute(query, params, function(retVal)
				resp:resolve(retVal)
			end)
		else
			resp:resolve(nil)
		end

		Citizen.Await(resp)

		return resp.value
	end,

	IsPlayerOnline = function(identifier)
		return OnlinePlayers[identifier] ~= nil
	end,

	InsertSQL = function(query, params)
		if GetResourceState("oxmysql") == "started" then
			local id = exports.oxmysql:insert_async(query, params)

			return {
				insertId = id
			}
		end

		local resp = promise.new()
		if GetResourceState("ghmattimysql") == "started" and GetResourceState("oxmysql") ~= "started" then
			exports.ghmattimysql:execute(query, params, function(retVal)
				if type(retVal) == "number" then
					resp:resolve({
						insertId = retVal
					})
				elseif type(retVal) == "table" then
					resp:resolve(retVal)
				else
					resp:resolve(nil)
				end
			end)
		elseif GetResourceState("mysql-async") == "started" and GetResourceState("oxmysql") ~= "started" then
			exports["mysql-async"]:mysql_insert(query, params, function(insertId)
				resp:resolve({
					insertId = insertId,
				})
			end)
		else
			resp:resolve(nil)
		end

		Citizen.Await(resp)

		return resp.value
	end,

	GetSettings = function(identifier)
		local settings = Functions.GetRawSettings(identifier)

		if settings ~= nil then
			settings.useMouse = settings.useMouse == 1 and true or false
			settings.allowDrag = settings.allowDrag == 1 and true or false
			if Shared.DisableAnonymous == true then
				settings.anonymous = false
			else
				settings.anonymous = settings.anonymous == 1 and true or false
			end
			settings.streamerMode = settings.streamerMode == 1 and true or false
			settings.theme = settings.theme == 1 and true or false
			settings.memberList = settings.memberList == 1 and true or false
			settings.identifier = identifier
		end

		return settings
	end,

	GetRawSettings = function(identifier)
		if identifier ~= nil and type(identifier) == "string" then
			if CachedSettings[identifier] ~= nil then
				return CopyTable(CachedSettings[identifier])
			else
				local result =
					Functions.SelectSQLSingle("select * from zerio_radio_settings where identifier = @identifier", {
						["@identifier"] = identifier,
					})

				if result ~= nil and result[1] ~= nil then
					CachedSettings[identifier] = result[1]
					return CopyTable(result[1])
				else
					return CopyTable(Functions.CreateSettings(identifier))
				end
			end
		else
			return nil
		end
	end,

	CreateSettings = function(identifier)
		if identifier ~= nil and type(identifier) == "string" then
			local insertResp =
				Functions.InsertSQL("insert into zerio_radio_settings (identifier) values (@identifier)", {
					["@identifier"] = identifier,
				})

			if insertResp and type(insertResp) == "table" and insertResp.insertId then
				local resp = Functions.SelectSQLSingle("select * from zerio_radio_settings where id = @id", {
					["@id"] = insertResp.insertId,
				})

				if resp ~= nil and resp[1] ~= nil then
					CachedSettings[identifier] = resp[1]
					return resp[1]
				end
			end
		end

		return nil
	end,

	GetPlayerName = function(Player)
		local name = promise.new()
		if Shared.Framework == "qbcore" then
			name:resolve(Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname)
		elseif Shared.Framework == "esx" then
			if Player.getName ~= nil then
				name:resolve(Player.getName())
			else
				local result = Functions.SelectSQLSingle(
					"SELECT firstname, lastname FROM `users` WHERE `identifier` = @identifier", {
						["@identifier"] = Player.identifier,
					})

				if result and result[1] then
					name:resolve(result[1].firstname .. " " .. result[1].lastname)
				else
					name:resolve("???")
				end
			end
		elseif Shared.Framework == "standalone" then
			name:resolve(GetPlayerName(Player.source))
		else
			name:resolve("???")
		end

		Citizen.Await(name)

		return name.value
	end,

	GetPlayerJob = function(Player)
		local jobInfo = promise.new()

		if type(Player) == "string" then
			if Shared.Framework == "esx" then
				local result =
					Functions.SelectSQLSingle("SELECT `job`, `job_grade` FROM `users` WHERE `identifier` = @identifier",
						{
							["@identifier"] = Player,
						})

				if result and result[1] then
					jobInfo:resolve({
						result[1].job,
						result[1].job_grade,
					})
				else
					jobInfo:resolve({ "", "" })
				end
			elseif Shared.Framework == "qbcore" then
				local result = Functions.SelectSQLScalar("SELECT `job` FROM `players` WHERE `citizenid` = @citizenid", {
					["@citizenid"] = Player,
				}, "job")

				if result and result[1] then
					local jobData = json.decode(result[1].job)

					jobInfo:resolve({
						jobData.name,
						jobData.grade.level,
					})
				else
					jobInfo:resolve({ "", "" })
				end
			end
		else
			if Shared.Framework == "esx" then
				jobInfo:resolve({
					Player.job.name,
					Player.job.grade,
				})
			elseif Shared.Framework == "qbcore" then
				jobInfo:resolve({
					Player.PlayerData.job.name,
					Player.PlayerData.job.grade.level,
				})
			end
		end

		Citizen.Await(jobInfo)

		return table.unpack(jobInfo.value)
	end,

	GetPlayerGang = function(Player)
		if Shared.Framework == "qbcore" then
			local gangInfo = promise.new()

			if type(Player) == "string" then
				local result = Functions.SelectSQLScalar("SELECT `gang` FROM `players` WHERE `citizenid` = @citizenid", {
					["@citizenid"] = Player,
				}, "gang")

				if result and result[1] then
					local gangData = json.decode(result[1].gang)

					gangInfo:resolve({
						gangData.name,
						gangData.grade.level,
					})
				else
					gangInfo:resolve({ "", "" })
				end
			else
				gangInfo:resolve({
					Player.PlayerData.gang.name,
					Player.PlayerData.gang.grade.level,
				})
			end

			Citizen.Await(gangInfo)

			return table.unpack(gangInfo.value)
		else
			return { "", "" }
		end
	end,

	GetPlayer = function(source)
		if Shared.Framework == "qbcore" then
			return Framework.Functions.GetPlayer(source)
		elseif Shared.Framework == "esx" then
			return Framework.GetPlayerFromId(source)
		else
			return {
				source = source,
			}
		end
	end,

	GetPlayerSource = function(Player)
		if Shared.Framework == "qbcore" then
			return Player.PlayerData.source
		elseif Shared.Framework == "esx" then
			return Player.source
		elseif Shared.Framework == "standalone" then
			return Player.source
		else
			return nil
		end
	end,

	GetPlayerFromIdentifier = function(identifier)
		if Shared.Framework == "qbcore" then
			return Framework.Functions.GetPlayerByCitizenId(identifier)
		elseif Shared.Framework == "esx" then
			return Framework.GetPlayerFromIdentifier(identifier)
		else
			return {
				source = source,
			}
		end
	end,

	---@return string | nil
	GetPlayerIdentifier = function(Player)
		if Shared.Framework == "qbcore" then
			return Player.PlayerData.citizenid
		elseif Shared.Framework == "esx" then
			return Player.identifier
		elseif Shared.Framework == "standalone" then
			local identifiers = GetPlayerIdentifiers(Player.source)
			for i = 1, #identifiers do
				if string.find(identifiers[i], "license:") then
					return identifiers[i]
				end
			end
		else
			return nil
		end
	end,

	GetPlayerFrequency = function(source)
		if source then
			if GetResourceState("pma-voice") == "started" then
				local plr = Player(source)
				if plr then
					return plr.state.radioChannel
				end
			elseif GetResourceState("mumble-voip") == "started" then
				local freq = exports["mumble-voip"]:GetPlayerRadioChannel(source)

				if freq then
					return freq
				end
			end
		end

		return 0
	end,

	RegisterItems = function()
		if Shared.OpenType.Value == "item" then
			Functions.CreateUseableItem(Shared.OpenType.Item, function(source)
				TriggerClientEvent("zerio-radio:client:open", source)
			end)
		end

		if Shared.Scanner.OpenType == "item" then
			Functions.CreateUseableItem(Shared.Scanner.Item, function(source)
				TriggerClientEvent("zerio-radio:client:openscanner", source)
			end)
		end
	end,

	Notify = function(source, msg, type)
		if Shared.Framework == "qbcore" then
			TriggerClientEvent("QBCore:Notify", source, msg, type)
		elseif Shared.Framework == "esx" then
			TriggerClientEvent("esx:showNotification", source, msg, type)
		elseif Shared.Framework == "standalone" then
			TriggerClientEvent("zerio-radio:client:showNotification", source, msg, type)
		end
	end,
}

if GetResourceState("sounity") ~= "missing" then
	RegisterNetEvent("zerio-radio:server:playSounitySound", function()
		local src = source

		if not panicButtonCooldown[src] or os.time() - panicButtonCooldown[src] > Shared.PanicButtonCooldown then
			local ped = GetPlayerPed(src)

			if ped then
				panicButtonCooldown[src] = os.time()
				local sound = exports.sounity:CreateSound(
					Shared.PanicButtonSound.Name,
					json.encode({
						loop = true,
					})
				)

				exports.sounity:AttachSound(sound, NetworkGetNetworkIdFromEntity(ped))
				exports.sounity:StartSound(sound)

				CreateThread(function()
					Wait(Shared.PanicButtonSound.Duration * 1000)
					exports.sounity:StopSound(sound)
				end)
			end
		end
	end)
elseif GetResourceState("pmms") ~= "missing" then
	RegisterNetEvent("zerio-radio:server:playPmmsSound", function()
		local src = source

		if not panicButtonCooldown[src] or os.time() - panicButtonCooldown[src] > Shared.PanicButtonCooldown then
			local ped = GetPlayerPed(src)

			if ped and ped > 0 then
				panicButtonCooldown[src] = os.time()
				exports.pmms:startByNetworkId(NetworkGetNetworkIdFromEntity(ped), {
					url = Shared.PanicButtonSound.Name,
					duration = Shared.PanicButtonSound.Duration,
					range = 5
				})
			end
		end
	end)
elseif GetResourceState("lb-tablet") ~= "missing" then
	RegisterNetEvent("zerio-radio:server:sendLbTabletMessage", function()
		local src = source

		if not panicButtonCooldown[src] or os.time() - panicButtonCooldown[src] > Shared.PanicButtonCooldown then
			local ped = GetPlayerPed(src)

			if ped and ped > 0 then
				panicButtonCooldown[src] = os.time()
				exports["lb-tablet"]:AddDispatch({
					priority = "medium",
					code = "10-33",
					title = "Panic Button Pressed",
					location = { coords = GetEntityCoords(ped) },
					time = 60,
					job = "police",
				})
			end
		end
	end)
end

CreateThread(function()
	while Framework == nil do
		if Shared.Framework == "standalone" then
			return
		end
		Wait(500)
	end

	Functions.RegisterItems()
end)
