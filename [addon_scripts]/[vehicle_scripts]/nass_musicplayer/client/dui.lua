local Class = {}

setmetatable(Class, {
	__call = function(self)
		self.__call = getmetatable(self).__call
		self.__index = self
		return setmetatable({}, self)
	end
})

function Class:new()
	return self()
end

DuiBrowser = Class()

DuiBrowser.initQueue = {}
DuiBrowser.pool = {}


function DuiBrowser:waitForConnection()
	self.initDone = false

	DuiBrowser.initQueue[self.mediaPlayerHandle] = self

	local timeout = GetGameTimer() + 15000

	while not DuiBrowser.initQueue[self.mediaPlayerHandle].initDone and GetGameTimer() < timeout do
		self:sendMessage({type = "DuiBrowser:init", handle = self.mediaPlayerHandle})
		Citizen.Wait(100)
	end

	DuiBrowser.initQueue[self.mediaPlayerHandle] = nil

	if self.initDone then
		return true
	else
		print(("Failed to initialize DUI browser: Could not connect to %s within %d ms"):format(self.duiUrl, 15000))
		return false
	end
end


function DuiBrowser:new(mediaPlayerHandle, model, url)
	local self = Class.new(self)

	if DuiBrowser.initQueue[mediaPlayerHandle] then
		return DuiBrowser.initQueue[mediaPlayerHandle]
	end

	self.mediaPlayerHandle = mediaPlayerHandle
	self.model = model

	local thisResource = GetCurrentResourceName()

	if url:sub(1, 8) == "https://" then
		self.duiUrl ="https://cfx-nui-nass_musicplayer/html/index.html"
	else
		self.duiUrl = ("http://%s/%s/dui/"):format(GetCurrentServerEndpoint(), thisResource)
	end

	self.duiObject = CreateDui(self.duiUrl .. "?resourceName=" .. thisResource, 1280, 720)
	self.duiHandle = GetDuiHandle(self.duiObject)


	if self:waitForConnection() then
		DuiBrowser.pool[self.mediaPlayerHandle] = self

		return self
	else
		DuiBrowser.pool[self.mediaPlayerHandle] = nil
		DestroyDui(self.duiObject)
		return nil
	end
end


function DuiBrowser:getBrowserForHandle(handle)
	return DuiBrowser.pool[handle]
end

function DuiBrowser:sendMessage(data)
	SendDuiMessage(self.duiObject, json.encode(data))
end

function DuiBrowser:delete()
	DuiBrowser.pool[self.mediaPlayerHandle] = nil

	DestroyDui(self.duiObject)

end

RegisterNUICallback("DuiBrowser:initDone", function(data, cb)
	if DuiBrowser.initQueue[data.handle] then
		DuiBrowser.initQueue[data.handle].initDone = true
	end
	cb({})
end)
