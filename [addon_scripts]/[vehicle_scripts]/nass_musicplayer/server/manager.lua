mediaPlayers = {}
local createdSpeakers = {}
local waitingForNext = {}

local webhookData = {
	url = "",
	enabled = false,
}

function logMusicPlayer(handle, options, source)

	if not webhookData.enabled then return end
	if webhookData.url == "" then return end
	
	local playerName = GetPlayerName(source) or "Unknown"
	
	local embeds = {
		{
			["title"] = "Music Player Log",
			["description"] = string.format("**Player:** %s (%s)\n**Handle:** %s\n**Song:** %s\n**URL:** %s", 
				playerName, 
				nass.getPlayerIdentifier(source), 
				handle, 
				options.title or "Unknown", 
				options.url or "N/A"
			),
			["color"] = 3447003,
			["thumbnail"] = {
				["url"] = options.thumbnail or ""
			},
			["footer"] = {
				["text"] = "nass_musicmanager | " .. os.date("%Y-%m-%d %H:%M:%S")
			}
		}
	}
	
	local payload = json.encode({
		username = "Music Manager",
		embeds = embeds
	})
	
	PerformHttpRequest(webhookData.url, function(err, text, headers) end, "POST", payload, {["Content-Type"] = "application/json"})
end

RegisterNetEvent("nass_musicmanager:updateSpeakerCoords")
AddEventHandler("nass_musicmanager:updateSpeakerCoords", function(handle, coords)
	TriggerClientEvent("nass_musicmanager:updateCreatedPlayers", -1, handle, coords)
end) 

function stringToSeconds(timeStr)
	local minutes, seconds = timeStr:match("^(%d%d):(%d%d)$")
	if minutes and seconds then
		return tonumber(minutes) * 60 + tonumber(seconds)
	end

	local hours, minutes, seconds = timeStr:match("^(%d%d):(%d%d):(%d%d)$")
	if hours and minutes and seconds then
		return tonumber(hours) * 3600 + tonumber(minutes) * 60 + tonumber(seconds)
	end


	local secondsOnly = timeStr:match("^0:(%d%d)$")
	if secondsOnly then
		return tonumber(secondsOnly)
	end

	return 0
end

function secondsToHHMMSS(seconds)
    if type(seconds) ~= "number" or seconds < 0 or seconds % 1 ~= 0 then
        error("Input must be a non-negative integer.")
    end

    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = seconds % 60

    local formattedMinutes = tostring(minutes)
    local formattedSeconds = string.format("%02d", secs)

    if hours == 0 then
        return formattedMinutes .. ":" .. formattedSeconds
    end

    return hours .. ":" .. formattedMinutes .. ":" .. formattedSeconds
end

function identifyMusicPlatform(link)
	if link == "" or link == nil then return "unknown" end
    local domain = link:match("^https?://([^/]+)")

    if not domain then
        return "unknown"
    end
    domain = domain:lower()

    if domain:find("spotify.com", 1, true) then
        return "spotify"
    elseif domain:find("youtube.com", 1, true) or domain:find("youtu.be", 1, true) then
        return "youtube"
	elseif domain:find("soundcloud.com", 1, true) then
		return "soundcloud"
	elseif domain:find("music.163.com", 1, true) then
		return "netease"
	elseif domain:find("discord.com", 1, true) or domain:find("discordapp.com", 1, true) then
		return "discord"
    else
        return "unknown"
    end
end

local function getSongData(videoLink, cb)
	if Config.blacklistedLinks[videoLink] then return end
	
	local function returnYouTubeSongData(songLink, callback)
		if songLink == "" or songLink == nil then
			if callback then
				callback(nil, nil, nil, nil, nil)
			end
			return
		end
		local videoId = songLink:match("v=([^&]+)")

		if not videoId then
			videoId = songLink:match("youtu%.be/([%w-_]+)")
		end

		if not videoId then
			videoId = songLink:match("shorts/([%w-_]+)")
		end

		songLink = "https://www.youtube.com/watch?v=" .. videoId

		--[[PerformHttpRequest("https://noembed.com/embed?url="..songLink, function(err, text, headers)
			if err == 200 then
				local data = json.decode(text)
				if callback then
					callback(data.thumbnail_url, data.author_name, data.title, songLink, nil--[[duration_seconds)
				end
			else
				if callback then
					callback(nil, nil, nil, nil, nil)
				end
			end
		end, 'GET', '')]]
		
		PerformHttpRequest("https://nassyoutubedata.najinass.workers.dev/?url="..songLink, function(err, text, headers)
			if err == 200 then
				local data = json.decode(text)
				if callback then
					callback(data.thumbnail, data.author, data.title, songLink, data.duration_seconds)
				end
			else
				if callback then
					callback(nil, nil, nil, nil, nil)
				end
			end
		end, 'GET', '')
	end

	local function returnNeteaseMusicSongData(songLink, callback)
		local videoId = songLink:match("id=(%d+)") or songLink
		
		local requestURL = ("https://api.cenguigui.cn/api/netease/music_v1.php?id=%s&type=json&level=jymaster"):format(videoId)
		
		PerformHttpRequest(requestURL, function(err, text, headers)
			if err == 200 then
				local data = json.decode(text)
				if data?.data then
					if callback then
						callback((data.data.pic:gsub("http://", "https://", 1)), data.data.artist, data.data.name, data.data.url, stringToSeconds(data.data.duration))
					end
				else
					if callback then
						callback(nil, nil, nil, nil, nil)
					end
				end
			else
				print("Failed to fetch video data: HTTP Error " .. err)
				if callback then
					callback(nil, nil, nil, nil, nil)
				end
			end
			
		end, 'GET', '')
	end

	local function convertSpotifyToYT(spotifyLink, callback, cb)
		if spotifyLink == "" or spotifyLink == nil then
			callback(nil, nil, nil, nil, nil)
			return
		end
		local spotifyId = spotifyLink:match("track/(.+)")
		--[[if not spotifyId then
			spotifyId = spotifyLink:match("playlist/(.+)")
		end
		if not spotifyId then
			spotifyId = spotifyLink:match("album/(.+)")
		end]]
		if not spotifyId then
			callback(nil, nil, nil, nil, nil)
			return
		end
		spotifyLink = "https://open.spotify.com/track/"..spotifyId
		if spotifyLink == "" or spotifyLink == nil then
			callback(nil, nil, nil, nil, nil)
			return
		end
		PerformHttpRequest("https://ytm2spotify.com/convert?url="..spotifyLink.."&to_service=youtube_ytm", function(errorCode, resultData, resultHeaders)
			if errorCode == 200 then
				local returnedData = json.decode(resultData)
				local topResult = returnedData.results[1]
				callback(topResult.url, cb)
			else
				print("Spotify link could not be converted")
			end
		end,"GET", "", {["Content-Type"] = "application/json"})
	end

	local function returnDiscordSongData(url, callback)
		local thumbnailUrl = "https://cdn.discordapp.com/embed/avatars/0.png"
		local fileName = url:match("^.+/([^?]+)") or url
		local authorName = fileName:match("^([^_]+)") or "Unknown"
		local rawTitle = fileName:match("^[^_]+_(.+)$") or fileName
		local titleName = rawTitle:gsub("%.wav$", ""):gsub("_+", " "):gsub("^%s+", ""):gsub("%s+$", "")
	
		PerformHttpRequest(url, function(statusCode, body, _headers)
			if (statusCode == 206 or statusCode == 200) and type(body) == "string" then
				local headerBytes = #body >= 44 and body:sub(1,44) or body

				local function littleEndianToInt(bytes)
					local b1,b2,b3,b4 = bytes:byte(1,4)
					return b1 + b2*256 + b3*65536 + b4*16777216
				end
	
				-- byteRate at bytes 29–32, dataSize at bytes 41–44
				local byteRate = littleEndianToInt(headerBytes:sub(29,32))
				local dataSize = littleEndianToInt(headerBytes:sub(41,44))
				if byteRate > 0 then
					local duration = math.floor(dataSize / byteRate)
					callback(thumbnailUrl, authorName, titleName, url, duration)
				end
			end
		end, "GET", "", {
			["Range"] = "bytes=0-43"
		})
	end

	if videoLink == "" then cb(nil, nil, nil, nil, nil) return end
	local platform = identifyMusicPlatform(videoLink)
	if platform == "spotify" then
		convertSpotifyToYT(videoLink, returnYouTubeSongData, cb)
	elseif platform == "youtube" then
		returnYouTubeSongData(videoLink, cb)
	elseif platform == "netease" then
		returnNeteaseMusicSongData(videoLink, cb)
	elseif platform == "discord" then
		returnDiscordSongData(videoLink, cb)
	else
		print("Issue with video link ", videoLink)
	end
end

RegisterNetEvent('entityRemoved')
AddEventHandler('entityRemoved', function(entity)
    if GetEntityType(entity) ~= 2 then return end

	local handle = NetworkGetNetworkIdFromEntity(entity)

	if mediaPlayers[handle] then
		exports.nass_musicplayer:stop(handle)
	end
end)

--[[
local function getPlaylistData(playlistUrl, callback)
    local function fetchYoutubePlaylist(playlistId, cb)
        local videos = {}
        local nextPageToken = ""

        local function fetchPage(pageToken)
            local url = ("https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&maxResults=50&playlistId=%s&key=%s&pageToken=%s")
                :format(playlistId, "AIzaSyBgM9GZ97omOoZc_r8zi2E9rgEd_CTOBHU", pageToken or "")

            PerformHttpRequest(url, function(statusCode, response, headers)
                if statusCode ~= 200 then
                    cb("404")
                    return
                end

                local data = json.decode(response)
                if not data or not data.items then
                    cb("404")
                    return
                end


				
                for _, item in ipairs(data.items) do
                    local videoId = item.snippet.resourceId.videoId
					print(json.encode(item,{indent=true}))
                    table.insert(videos, {
                        videoId = videoId,
						title = item.snippet.title,
						author = item.snippet.videoOwnerChannelTitle,
                        url = "https://www.youtube.com/watch?v=" .. videoId
                    })
                end

                -- If there is more data, fetch the next page
                if data.nextPageToken then
                    fetchPage(data.nextPageToken)
                else
					if #videos > 0 then 
                    	cb(videos)
					end
                end
            end, "GET", "", { ["Content-Type"] = "application/json" })
        end

        fetchPage(nextPageToken)
    end

    -- Extract the platform type
    local platform = identifyMusicPlatform(playlistUrl)

    if platform == "spotify" then
        --callback("Spotify playlist fetching not implemented.")
    elseif platform == "youtube" then
        -- Extract the playlist ID from the YouTube URL
        local playlistId = string.match(playlistUrl, "list=([%w_-]+)")
        fetchYoutubePlaylist(playlistId, callback)
    else
        --callback("Unsupported platform")
    end
end
]]


local function shuffleQueue(handle)
	if not mediaPlayers[handle] then
		return
	end

	local n = #mediaPlayers[handle].queue
	local indices = {}
    for i = 1, n do
        indices[i] = i
    end

    for i = n, 2, -1 do
        local j = math.random(i)
        indices[i], indices[j] = indices[j], indices[i]
    end
	
	local shuffledQueue = {}

	for i, index in ipairs(indices) do
		shuffledQueue[i] = mediaPlayers[handle].queue[index]
	end
	Wait(10)

	mediaPlayers[handle].queue = shuffledQueue

	TriggerLatentClientEvent("nass_musicmanager:syncQueue", -1, 100000000000, "shuffle", handle, indices)
end

local function addToQueue(handle, source, options)
	logMusicPlayer(handle, options, source)

	options.volume = nil
	options.diffRoomVolume = nil
	options.range = nil
	options.filter = nil
	local newQueuedSong = {
		source = source,
		name = GetPlayerName(source),
		options = options
	}
	
	table.insert(mediaPlayers[handle].queue, newQueuedSong)

	TriggerLatentClientEvent("nass_musicmanager:syncQueue", -1, 100000000000, "add", handle, newQueuedSong)

	if mediaPlayers[handle].isDjBooth and mediaPlayers[handle].url == "noSong" then
		exports.nass_musicplayer:playNextInQueue(handle)
	end
end

local function removeFromQueue(handle, index)
	table.remove(mediaPlayers[handle].queue, index)

	TriggerLatentClientEvent("nass_musicmanager:syncQueue", -1, 100000000000, "remove", handle, index)
end

local function moveInQueue(handle, fromIndex, toIndex)
	if not mediaPlayers[handle] or not mediaPlayers[handle].queue then
		return
	end
	
	local queue = mediaPlayers[handle].queue
	if fromIndex < 1 or fromIndex > #queue then
		return
	end
	
	local selectedIndex = table.remove(queue, fromIndex)
	table.insert(queue, toIndex, selectedIndex)
	TriggerLatentClientEvent("nass_musicmanager:syncQueue", -1, 100000000000, "move", handle, {toIndex, selectedIndex, fromIndex})
end

local function selectFromQueue(handle, index)
	if not mediaPlayers[handle] then
		return
	end
	moveInQueue(handle, index, 1)
	Wait(10)
	exports.nass_musicplayer:playNextInQueue(handle)
end

local function addMediaPlayer(handle, options)
	if mediaPlayers[handle] then
		return
	end

	if not options.title then
		options.title = options.url
	end

	options.volume = Clamp(options.volume, 0, 100, 100)
	options.startTime = ((os.time()) - (options.offset or 0))
	options.offset = 0
	options.paused = false

	if options.filter == nil then
		options.filter = false
	end

	options.diffRoomVolume = Clamp(options.diffRoomVolume, 0.0, 1.0, 0.25)

	options.range = Clamp(options.range, 0, 500, 30)

	if not options.queue then
		options.queue = {}
	end

	mediaPlayers[handle] = options

	TriggerClientEvent("nass_musicmanager:play", -1, handle)


	local sendingData = nass.deepCopy(mediaPlayers[handle])
	if sendingData ~= nil then
		sendingData.queue = {}
	end
	TriggerLatentClientEvent("nass_musicmanager:syncEntirePlayer", -1, 100000000000, handle, sendingData)
end

local function removeMediaPlayer(handle)
	mediaPlayers[handle] = nil

	TriggerLatentClientEvent("nass_musicmanager:syncEntirePlayer", -1, 100000000000, handle, nil)
end

local function addInactiveMediaPlayer(handle, options)
	if mediaPlayers[handle] then
		return
	end

	options.title = nil

	options.volume = Clamp(options.volume, 0, 100, 100)
	options.startTime = os.time() - (options.offset or 0)
	options.offset = 0
	options.paused = os.time()

	if options.filter == nil then
		options.filter = false
	end

	options.diffRoomVolume = Clamp(options.diffRoomVolume, 0.0, 1.0, 0.25)

	options.range = Clamp(options.range, 0, 3500, 30)

	if not options.queue then
		options.queue = {}
	end

	options.thumbnail = nil
	options.duration = nil
	options.author = nil
	options.url = "noSong"

	mediaPlayers[handle] = options

	TriggerClientEvent("nass_musicmanager:play", -1, handle)

	local sendingData = nass.deepCopy(mediaPlayers[handle])
	sendingData.queue = {}
	TriggerLatentClientEvent("nass_musicmanager:syncEntirePlayer", -1, 100000000000, handle, sendingData)
	
end

local function playNextInQueue(handle)
	if not mediaPlayers[handle] then
		return
	end
	local mediaPlayer = mediaPlayers[handle]

	if mediaPlayer.loop then
		exports.nass_musicplayer:resetPlaytime(handle)
		return
	end
	
	removeMediaPlayer(handle)

	
	Wait(10)
	if mediaPlayer.isDjBooth and #mediaPlayer.queue == 0 then
		addInactiveMediaPlayer(handle, mediaPlayer) 
	end
	
	while #mediaPlayer.queue > 0 do
		local next = table.remove(mediaPlayer.queue, 1)

		local client

		if GetPlayerName(next.source) == next.name then
			client = next.source
		else
			client = GetPlayers()[1]
		end
		if client then

			local options = {}

			for k, v in pairs(mediaPlayer) do
				options[k] = v
			end

			options.url = next.options.url
			options.title = next.options.title
			options.author = next.options.author
			options.thumbnail = next.options.thumbnail
			options.duration = next.options.duration
			options.offset = 0
			waitingForNext[handle] = options
			
			TriggerLatentClientEvent("nass_musicmanager:syncQueue", -1, 100000000000, "removeSaved", handle, 1)
			startPlayer(tonumber(client), handle, options)
			--TriggerClientEvent("nass_musicmanager:init", tonumber(client), handle, options)
			break
		end
	end
end

local function pauseMediaPlayer(handle)
	if not mediaPlayers[handle] then
		return
	end

	if mediaPlayers[handle].paused then
		mediaPlayers[handle].startTime = mediaPlayers[handle].startTime + (os.time() - mediaPlayers[handle].paused)
		mediaPlayers[handle].paused = false
	else
		mediaPlayers[handle].paused = os.time()
	end
	TriggerLatentClientEvent("nass_musicmanager:sync", -1, 100000000000, handle, {
		paused = mediaPlayers[handle].paused,
		startTime = mediaPlayers[handle].startTime,
	})
end

local function resolvePreset(url, title, filter, video)

	return {
		url = url,
		title = title,
		filter = filter,
		video = video
	}
end

local function startMediaPlayerByNetworkId(netId, options, source)
	if mediaPlayers[netId] then
		exports.nass_musicplayer:addToQueue(netId, source, options)
		return netId
	end

	local resolved = resolvePreset(options.url, options.title, options.filter, options.video)

	options.url = resolved.url
	options.title = resolved.title
	options.filter = resolved.filter
	options.video = resolved.video
	options.queue = nil
	options.coords = nil

	if createdSpeakers[netId] then
		for k, v in pairs(options) do
			if createdSpeakers[netId]?[k] then
				options[k] = createdSpeakers[netId][k]
			end
		end
		createdSpeakers[netId] = nil
	end
	addMediaPlayer(netId, options)

	logMusicPlayer(netId, options, source)

	return netId
end

local function startMediaPlayerByCoords(x, y, z, options)
	local coords = vector3(x, y, z)
	local handle = GetHandleFromCoords(coords)

	local resolved = resolvePreset(options.url, options.title, options.filter, options.video)

	if options.timestamp then
		options.offset = options.timestamp
	end
	options.url = resolved.url
	options.title = resolved.title
	options.filter = resolved.filter
	options.video = resolved.video
	options.queue = nil
	options.coords = coords
	options.isDjBooth = true

	if options.url ~= "" then
		addMediaPlayer(handle, options)
	else
		addInactiveMediaPlayer(handle, options)
	end

	return handle
end

local function resetPlaytime(handle)
	if not mediaPlayers[handle] then
		return
	end

	mediaPlayers[handle].offset = 0
	mediaPlayers[handle].startTime = os.time()

	TriggerLatentClientEvent("nass_musicmanager:sync", -1, 100000000000, handle, {
		offset = mediaPlayers[handle].offset,
		startTime = mediaPlayers[handle].startTime
	})
end

local function setMediaPlayerLoop(handle)
	if not mediaPlayers[handle] then
		return
	end

	mediaPlayers[handle].loop = not mediaPlayers[handle].loop
	TriggerLatentClientEvent("nass_musicmanager:sync", -1, 100000000000, handle, {
		loop = mediaPlayers[handle].loop,
	})
end

local function getMediaPlayerInfo(handle)
	return mediaPlayers[handle]
end

local function setVolume(handle, newVolume)
	if not mediaPlayers[handle] then
		return
	end

	mediaPlayers[handle].volume = Clamp(newVolume, 0, 100, 100)
	TriggerLatentClientEvent("nass_musicmanager:sync", -1, 100000000000, handle, {
		volume = mediaPlayers[handle].volume,
	})
end

local function seekToTime(handle, newTime)
	if not mediaPlayers[handle] then
		return
	end
	
	mediaPlayers[handle].startTime = mediaPlayers[handle].startTime  + (mediaPlayers[handle].offset - newTime)
	mediaPlayers[handle].offset = os.time() - mediaPlayers[handle].startTime

	TriggerLatentClientEvent("nass_musicmanager:sync", -1, 100000000000, handle, {
		startTime = mediaPlayers[handle].startTime,
		offset = mediaPlayers[handle].offset
	})
end

local function getAllMediaPlayers()
	return mediaPlayers
end

exports("moveInQueue", moveInQueue)
exports("selectFromQueue", selectFromQueue)
exports("getSongData", getSongData)
--exports("getPlaylistData", getPlaylistData)
exports("setVolume", setVolume)
exports("seekToTime", seekToTime)
exports("resetPlaytime", resetPlaytime)
exports("playNextInQueue", playNextInQueue)
exports("addToQueue", addToQueue)
exports("startByNetworkId", startMediaPlayerByNetworkId)
exports("startByCoords", startMediaPlayerByCoords)
exports("setMediaPlayerLoop", setMediaPlayerLoop)
exports("shuffleQueue", shuffleQueue)
exports("stop", removeMediaPlayer)
exports("pause", pauseMediaPlayer)
exports("getMediaPlayerInfo", getMediaPlayerInfo)
exports("getAllMediaPlayers", getAllMediaPlayers)
exports("GetHandleFromCoords", GetHandleFromCoords)

RegisterNetEvent("nass_musicmanager:syncSpeakers")
AddEventHandler("nass_musicmanager:syncSpeakers", function(options, bool)
	TriggerClientEvent("nass_musicmanager:syncSpeakers", -1, options, bool, source)
end)

RegisterNetEvent("nass_musicmanager:speakerCreated")
AddEventHandler("nass_musicmanager:speakerCreated", function(handle, options)
	createdSpeakers[handle] = options
end)

function startPlayer(source, handle, options)
	if not options.offset then
		options.offset = "0"
	end

	options.volume = Clamp(options.volume, 0, 100, 100)

	if options.filter == nil then
		options.filter = false
	end

	options.diffRoomVolume = Clamp(options.diffRoomVolume, 0.0, 1.0, 0.25)
	options.range = Clamp(options.range, 0, 500, 30)

	if not (options and options.url) then return end

	if options.coords then
		handle = GetHandleFromCoords(options.coords)
	end

	if mediaPlayers[handle] then
		addToQueue(handle, source, options)
	else
		initPlayer(handle, options.duration)
		--TriggerClientEvent("nass_musicmanager:start", source, handle, options)
	end
end


function initPlayer(handle, duration)
	if mediaPlayers[handle] then
		if mediaPlayers?[handle]?.duration == nil and duration then
			mediaPlayers[handle].duration = duration
			TriggerLatentClientEvent("nass_musicmanager:sync", -1, 100000000000, handle, {
				duration = mediaPlayers[handle].duration,
			})
		end
		return
	end
	local optionsTable = nass.deepCopy(waitingForNext[handle])
	if mediaPlayers?[handle]?.duration == nil and duration then
		optionsTable.duration = duration
	end
	addMediaPlayer(handle, optionsTable)
	waitingForNext[handle] = nil
end

RegisterNetEvent("nass_musicmanager:pause")
AddEventHandler("nass_musicmanager:pause", function(handle)
	if not mediaPlayers[handle] then
		return
	end

	if not mediaPlayers[handle].duration then
		return
	end


	pauseMediaPlayer(handle)
end)

RegisterNetEvent("nass_musicmanager:stop")
AddEventHandler("nass_musicmanager:stop", function(handle)
	if not mediaPlayers[handle] then
		return
	end

	removeMediaPlayer(handle)
end)

RegisterNetEvent("nass_musicmanager:syncAllPlayers")
AddEventHandler("nass_musicmanager:syncAllPlayers", function()
	TriggerLatentClientEvent("nass_musicmanager:syncAllPlayers", source, 100000000000, mediaPlayers)
end)

Citizen.CreateThread(function()
	while true do
		Wait(1000)
		for handle,info in pairs(mediaPlayers) do
			if not info.paused then
				info.offset = os.time() - info.startTime
				if info.duration and info.offset >= (info.duration-1) then
					if info.loop then
						resetPlaytime(handle)
					elseif #info.queue > 0 then
						playNextInQueue(handle)
					else
						
						if not info.isDjBooth then
							removeMediaPlayer(handle)
						else
							info.thumbnail = nil
							info.duration = nil
							info.title = nil
							info.author = nil
							info.volume = Clamp(info.volume, 0, 100, 100)
							info.startTime = os.time() - (info.offset or 0)
							info.offset = 0
							info.paused = os.time()
							info.queue = {}
							info.url = "noSong"
							TriggerLatentClientEvent("nass_musicmanager:syncEntirePlayer", -1, 100000000000, handle, mediaPlayers[handle])
						end
					end
				end
			end
		end
	end
end)