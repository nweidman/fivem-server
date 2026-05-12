personalMediaPlayers = {}
local mediaPlayers, baseVolume, createdTargets, streamMode, savedQueue = {}, 50, {}, false, {}


AddEventHandler('nass_lib:playerLoaded', function()
	TriggerServerEvent("nass_musicmanager:syncAllPlayers")
end)

if Config.streamerMode.enabled then
	RegisterCommand(Config.streamerMode.command, function()
		streamMode = not streamMode
		baseVolume = streamMode and 0 or 50
	end)
end

if Config.volumeControl.enabled then
	RegisterCommand(Config.volumeControl.command, function(source, args, rawCommand)
		local volume = args[1] ~= nil and tonumber(args[1]) or 50
		if volume then
			baseVolume = Clamp(volume, 0, 100, 100)
		end
	end)
	TriggerEvent('chat:addSuggestion', '/' .. Config.volumeControl.command, 'Set your personal volume level', {
		{ name = "volume", help = "Volume level (0-100)" }
	})
end


local function doesEntityExist(entity)
	if type(entity) ~= "number" or entity < 0 or entity > 999999999 then
		return false
	else
		return DoesEntityExist(entity)
	end
end

local function findHandle(entity)
	if NetworkDoesNetworkIdExist(entity) then
		local netId = NetworkGetNetworkIdFromEntity(entity)

		if mediaPlayers[netId] then
			return netId
		end
	end

	local handle = GetHandleFromCoords(GetEntityCoords(entity))

	if mediaPlayers[handle] then
		return handle
	end

	return nil
end

local function getEntityLabel(handle, entity)
	local entityType = GetEntityType(entity)
	local model = GetEntityModel(entity)

	if entityType == 2 then
		if model then
			local displayName = GetDisplayNameFromVehicleModel(model)
			local labelText = GetLabelText(displayName)

			if labelText == "NULL" then
				return displayName
			else
				return labelText
			end
		else
			return "Veh " .. tostring(handle)
		end
	elseif entityType == 3 then
		return "Obj " .. tostring(handle)
	elseif handle then
		return tostring(handle)
	else
		return false
	end
end

local function getCoordsLabel(handle, coords)
	if handle then
		return tostring(handle)
	else
		return false
	end
end

local function startMediaPlayer(handle, options)
	if not options.offset then
		options.offset = "0"
	end

	options.volume = Clamp(options.volume, 0, 100, 100)

	if options.filter == nil then
		options.filter = false
	end

	options.diffRoomVolume = Clamp(options.diffRoomVolume, 0.0, 1.0, 0.25)
	options.range = Clamp(options.range, 0, 500, 30)

	if NetworkDoesNetworkIdExist(handle) then
		local entity = NetworkGetEntityFromNetworkId(handle)

		options.model = GetEntityModel(entity) or `p_phonograph01x`


		if not options.label then
			options.label = getEntityLabel(handle, entity)
		end

		if options.isVehicle == nil then
			options.isVehicle = IsEntityAVehicle(entity)
		end
	elseif doesEntityExist(handle) then
		if not options.coords then
			options.coords = GetEntityCoords(handle)
		end

		options.model = GetEntityModel(handle) or `p_phonograph01x`


		if not options.label then
			options.label = getEntityLabel(handle, handle)
		end

		if options.isVehicle == nil then
			options.isVehicle = IsEntityAVehicle(handle)
		end

		handle = false
	elseif options.coords then
		if not options.label then
			options.label = getCoordsLabel(handle, options.coords)
		end

		handle = false
	end
	
	TriggerLatentServerEvent("nass_musicmanager:start", 100000000000, handle, options)
end

local function pauseMediaPlayer(handle)
	TriggerServerEvent("nass_musicmanager:pause", handle)
end

local function stopMediaPlayer(handle)
	TriggerServerEvent("nass_musicmanager:stop", handle)
end

local function getListenerAndViewerInfo()
	local cam = GetRenderingCam()
	local ped = PlayerPedId()

	local listenerCoords, viewerCoords, viewerFov

	if cam == -1 then
		if IsPedDeadOrDying(ped) then
			listenerCoords = GetGameplayCamCoord()
			viewerCoords = listenerCoords
		else
			listenerCoords = GetEntityCoords(ped)
			viewerCoords = GetGameplayCamCoord()
		end

		viewerFov = GetGameplayCamFov()
	else
		listenerCoords = GetCamCoord(cam)
		viewerCoords = listenerCoords
		viewerFov = GetCamFov(cam)
	end

	return ped, listenerCoords, viewerCoords, viewerFov
end

local function isInSameRoom(entity1, entity2)
	local interior1 = GetInteriorFromEntity(entity1)
	local interior2 = GetInteriorFromEntity(entity2)

	if interior1 ~= interior2 then
		return false
	end

	local roomHash1 = GetRoomKeyFromEntity(entity1)
	local roomHash2 = GetRoomKeyFromEntity(entity2)

	if roomHash1 ~= roomHash2 then
		return false
	end

	return true
end

local function deleteTargets(coordsHandle)
	if Config.target then
		if createdTargets[coordsHandle] then
			nass.target.removeTarget(createdTargets[coordsHandle])
		end
	end
end

local function createTargets(options, canPickup)
	if Config.target then
		while not NetworkDoesNetworkIdExist(options.netEnt) do Wait(50) end
		local targetOptions = {
			{
				label = Config.locale["open_player"],
				event = "nass_musicplayer:openMusicPlayer",
				handle = options.netEnt,
				coordsHandle = options.coordsHandle,
				speaker = true,
			},
		}
		if canPickup then
			table.insert(targetOptions, {
				label = Config.locale["pickup_speaker"],
				event = "nass_musicplayer:pickupSpeaker",
				entity = options.netEnt,
				speakerType = options.speakerType,
				isItem = options.isItem,
				coordsHandle = options.coordsHandle,
				anim = options.anim,
			})
			if options.moveable then
				table.insert(targetOptions, {
					label = Config.locale["move_speaker"],
					event = "nass_musicplayer:moveSpeaker",
					entity = options.netEnt,
					speakerType = options.speakerType,
					isItem = options.isItem,
					coordsHandle = options.coordsHandle,
					anim = options.anim,
				})
			end
		end
		local created = nass.target.localEntity(NetToObj(options.netEnt), targetOptions)
		createdTargets[options.coordsHandle] = created
	end
end

RegisterNetEvent("nass_musicmanager:syncSpeakers")
AddEventHandler("nass_musicmanager:syncSpeakers", function(options, bool, placer)
	if bool then
		createTargets(options, GetPlayerServerId(PlayerId()) == placer)
	else
		deleteTargets(options)
	end
end)

local function createMediaPlayerEntity(options, networked)
	local model = options.model or `prop_boombox_01`
	
	if type(model) == "string" then
		model = GetHashKey(model)
	end

	if not IsModelInCdimage(model) then
		print("Invalid model: " .. tostring(model))
		return
	end

	RequestModel(model)

	while not HasModelLoaded(model) do
		Wait(0)
	end

	local entity = CreateObjectNoOffset(model, options.position.x, options.position.y, options.position.z, networked, networked, false)
	SetModelAsNoLongerNeeded(model)

	if options.rotation then
		SetEntityRotation(entity, options.rotation, 2)
	end

	if options.heading then
		SetEntityHeading(entity, options.heading)
	end
	
	if options.frozen then
		FreezeEntityPosition(entity, true)
	end

	PlaceObjectOnGroundProperly(entity)

	if Config.onlyPlacerControls then
		options.coordsHandle = GetHandleFromCoords(GetEntityCoords(entity))
		options.netEnt = ObjToNet(entity)
		createTargets(options, true)
	else
		options.coordsHandle = GetHandleFromCoords(GetEntityCoords(entity))
		options.netEnt = ObjToNet(entity)
		TriggerServerEvent("nass_musicmanager:syncSpeakers", options, true)
	end
	
	return entity
end

local function createDefaultMediaPlayer(mediaPlayer)
	mediaPlayer.handle = createMediaPlayerEntity(mediaPlayer, false)
end

local function getEntityModelAndRenderTarget(handle)
	local entity

	if NetworkDoesNetworkIdExist(handle) then
		entity = NetworkGetEntityFromNetworkId(handle)
	else
		return
	end

	local model = GetEntityModel(entity)

	if not model then
		return
	end

	
	return entity, model
end

local function sendMediaMessage(handle, coords, data)
	local duiBrowser = DuiBrowser:getBrowserForHandle(handle)
	
	if not duiBrowser then
		local entity, model, renderTarget = getEntityModelAndRenderTarget(coords or handle)

		local mediaPos

		if entity then
			mediaPos = GetEntityCoords(entity)
		elseif mediaPlayers[handle] then
			mediaPos = mediaPlayers[handle].coords
			model = mediaPlayers[handle].model or `p_phonograph01x`
			renderTarget = mediaPlayers[handle].renderTarget
		elseif data.options and data.options.coords then
			mediaPos = data.options.coords
		end

		if mediaPos then
			local ped, listenPos, viewerPos, viewerFov = getListenerAndViewerInfo()

			if #(viewerPos - mediaPos) < (data.range or 500) then
				if data?.options?.url and data?.options?.url ~= "noSong" then
					duiBrowser = DuiBrowser:new(handle, model, data?.options?.url)
				end
			end
		end
	end

	if duiBrowser then

		duiBrowser:sendMessage(data)
	end
end

local function createMediaPlayer(options)
	local entity = createMediaPlayerEntity(options, true)

	personalMediaPlayers[entity] = true
	createdMusicPlayers[entity] = options

	return entity
end

local function deleteMediaPlayer(entity, coordsHandle)
	personalMediaPlayers[entity] = nil
	createdMusicPlayers[entity] = nil

	stopMediaPlayer(findHandle(entity))
	DeleteEntity(entity)
	

	if Config.onlyPlacerControls then
		deleteTargets(coordsHandle)
	else
		TriggerServerEvent("nass_musicmanager:syncSpeakers", coordsHandle, false)
	end
end

function getMediaPlayers()
    return mediaPlayers
end

exports("GetHandleFromCoords", GetHandleFromCoords)
exports("getMediaPlayers", getMediaPlayers)
exports("startMediaPlayer", startMediaPlayer)
exports("createMediaPlayer", createMediaPlayer)
exports("deleteMediaPlayer", deleteMediaPlayer)

RegisterNetEvent("nass_musicmanager:syncAllPlayers")
AddEventHandler("nass_musicmanager:syncAllPlayers", function(players)
	mediaPlayers = players
end)

RegisterNetEvent("nass_musicmanager:syncEntirePlayer")
AddEventHandler("nass_musicmanager:syncEntirePlayer", function(player, newData)
	if newData == nil then
		savedQueue[player] = mediaPlayers[player]?.queue
		TriggerEvent("nass_musicmanager:stop", player)
	else
		if savedQueue[player] ~= nil then
			newData.queue = savedQueue[player]
			savedQueue[player] = nil
		end
	end
	mediaPlayers[player] = newData
end)

RegisterNetEvent("nass_musicmanager:sync")
AddEventHandler("nass_musicmanager:sync", function(player, newData)
	if newData ~= nil then
		for k, v in pairs(newData) do
			if mediaPlayers?[player] ~= nil then
				mediaPlayers[player][k] = v
			end
		end
	end
end)

RegisterNetEvent("nass_musicmanager:syncQueue")
AddEventHandler("nass_musicmanager:syncQueue", function(action, handle, newData)
	if newData ~= nil and (mediaPlayers?[handle] ~= nil or savedQueue[handle] ~= nil) then
		if mediaPlayers[handle]?.queue == nil then
			mediaPlayers[handle]?.queue = {}
		end
		if action == "add" then
			table.insert(mediaPlayers[handle].queue, newData)
		elseif action == "remove" then
			table.remove(mediaPlayers[handle].queue, newData)
		elseif action == "removeSaved" then
			table.remove(savedQueue[handle], newData)
		elseif action == "move" then
			local selectedIndex = table.remove(mediaPlayers[handle].queue, newData[3])
			table.insert(mediaPlayers[handle].queue, newData[1], newData[2])
		elseif action == "shuffle" then
			local shuffledQueue = {}

			for i, index in ipairs(newData) do
				shuffledQueue[i] = mediaPlayers[handle].queue[index]
			end
			Wait(100)

			mediaPlayers[handle].queue = shuffledQueue

			SendNUIMessage({
				event = "updatePlayer",
				currentTimeStamp = mediaPlayers?[handle]?.offset or 0,
                maxTimeStamp = mediaPlayers?[handle]?.duration or 0,
				queue = mediaPlayers?[handle]?.queue or {},
			})
		end
	end
end)

RegisterNetEvent("nass_musicmanager:play")
AddEventHandler("nass_musicmanager:play", function(handle)
	sendMediaMessage(handle, nil, {
		type = "play",
		handle = handle
	})
end)

RegisterNetEvent("nass_musicmanager:stop")
AddEventHandler("nass_musicmanager:stop", function(handle)
	local duiBrowser = DuiBrowser:getBrowserForHandle(handle)

	if duiBrowser then
		duiBrowser:delete()
	else
		SendNUIMessage({
			type = "stop",
			handle = handle
		})
	end
end)

AddEventHandler("onResourceStop", function(resource)
	if GetCurrentResourceName() ~= resource then return end

	for entity, _ in pairs(personalMediaPlayers) do
		DeleteEntity(entity)
	end

	if uiIsOpen then
		SetNuiFocus(false, false)
	end
end)

Citizen.CreateThread(function()
	local oldData = {}
	while true do
		local ped, listenPos, viewerPos, viewerFov = getListenerAndViewerInfo()
		local sleep = 2000

		for handle, info in pairs(mediaPlayers) do
			
			local entity
			if NetworkDoesNetworkIdExist(handle) then
				entity = NetworkGetEntityFromNetworkId(handle)
			end

			local data
			local entityExists = doesEntityExist(entity)
			local mediaPos
			local isDoorOpen = false

			if entityExists then
				mediaPos = GetEntityCoords(entity)
			elseif info.coords then
				mediaPos = info.coords
			end

			if mediaPos then
				local distance = #(listenPos - mediaPos)

				local sameRoom

				if entityExists then
					
					if IsEntityAVehicle(entity) then
						sameRoom = IsPedInVehicle(ped, entity, false)
						for i = 0, GetNumberOfVehicleDoors(entity) do
							if GetVehicleDoorAngleRatio(entity, i) > 0.2 then
								isDoorOpen = true
								break
							end
						end
					else
						sameRoom = isInSameRoom(ped, entity)
					end
				else
					sameRoom = false
				end

				if Config.outsidePlayback and Config.soundFilter then
					if sameRoom then
						info.filter = false
					else
						info.filter = true
					end
				end

				
				local mulitplier = 1.0
				if isDoorOpen or info.isDjBooth then
					info.filter = false
					mulitplier = Config.doorOpenMultiplier
				end
				
				
				data = {
					type = "update",
					handle = handle,
					options = info,
					volume = math.floor(info.volume * (baseVolume*mulitplier / 100)),
					distance = distance,
					sameRoom = sameRoom,
				}

				

				if distance < info.range then
					sleep = 250
				end
			else
				data = {
					type = "update",
					handle = handle,
					options = info,
					volume = 0,
					distance = -1,
					sameRoom = false,
				}
			end

			if (oldData[handle] == nil or compareOldDataAndNewData(data, oldData[handle])) then
				sendMediaMessage(handle, info.coords, data)
			end

			oldData[handle] = nass.deepCopy(data)
		end


		Wait(sleep)
	end
end)

function compareOldDataAndNewData(data, oldData)
	if data.options.url ~= oldData.options.url then return true end
	if data.options.paused ~= oldData.options.paused then return true end
	if data.options.startTime ~= oldData.options.startTime then return true end
	if data.options.volume ~= oldData.options.volume then return true end
	if data.options.offset ~= oldData.options.offset then return true end
	if data.options.filter ~= oldData.options.filter then return true end
	if data.volume ~= oldData.volume then return true end
	if data.distance ~= oldData.distance then return true end
	if data.sameRoom ~= oldData.sameRoom then return true end
	return false
end

Citizen.CreateThread(function()
	while true do
		local myPos = GetEntityCoords(PlayerPedId())

		for handle, info in pairs(mediaPlayers) do
			if not info.paused then
				info.offset = info.offset + 1
			end

			if Config.disableVehicleRadio then
				local entity

				if NetworkDoesNetworkIdExist(handle) then
					entity = NetworkGetEntityFromNetworkId(handle)
				end

				if doesEntityExist(entity) and IsEntityAVehicle(entity) then
					SetVehRadioStation(entity, "OFF")
				end
			end
		end

		Wait(1000)
	end
end)

