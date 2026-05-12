Config = {}
Config.locale = Locales["en"] -- en | es | fr | de | it | pt | ru| zh
Config.target = true

Config.outsidePlayback = true --Should music be heard outside the car?
Config.soundFilter = true --Add a filter to the music player if the players are in a different room (Works with cars)
Config.miniPlayer = true --Should a miniplayer come up for players in a car playing music
Config.miniPlayerLocation = "topLeft" -- pick between "topLeft" | "topRight" | "bottomLeft" | "bottomRight" | "topMiddle"
Config.command = "music"
Config.keybind = "Z" --Default button to open the music player in a car
Config.onlyDriver = false -- Only the driver can open music player
Config.doorOpenMultiplier = 1.5 --How many times louder should the volume get when a vehicle door is open 1.0 will disable this
Config.disableVehicleRadio = true --Disables ingame gta radio while the musicplayer is playing music.

Config.permissions = { --If you want to add ace permissions, you can do so here. This would be for selling to players or restricting access to only some people.
    defaultPlayer = {
		enabled = false,
		ace = {
			"nass_musicplayer.defaultPlayer"
		}
	},
    speaker = {
		enabled = false,
		ace = {
			"nass_musicplayer.speaker"
		}
	},
	vehiclePlayer = {
		enabled = false,
		ace = {
			"nass_musicplayer.vehiclePlayer"
		}
	},
}

Config.streamerMode = { --This allows players to toggle off the sound from the script so that they arent hit with DMCA while streaming
	enabled = true,
	command = "streamermode",
}

Config.volumeControl = { --Allows players to control their own volume, they can do /volume (0-100) to set their volume level
	enabled = true,
	command = "volume",
}

Config.defaultPlayers = {
	{
		position = vec3(433.4092, -980.6387, 30.7098),
		url = '',
		volume = 100, --100 is the max volume
		timestamp = 0,
		diffRoomVolume = 0.25,--Don't touch if you do not know
		loop = false,
		range = 45,
		job = {--Just put your job name here to lock the player to a specific job.
			["police"] = 3,
		}, 
	},
	{
		position = vec3(200.0661, -932.3380, 30.6839),
		url = '',
		volume = 100, --100 is the max volume
		timestamp = 0,
		diffRoomVolume = 0.25,--Don't touch if you do not know
		loop = false,
		range = 70,
		--job = {}, --Just put your job name here to lock the player to a specific job.
	},
}

Config.install = {
	enabled = false, --Require an item to be installed onto the vehicle to access the music player
	name = "car_radio", --Install item name
	job = {--Just put your job name here to lock the install to a specific job. Remove everything if you would want anyone to install the radio.
		["mechanic"] = 2,
	},
	anim = {
		enabled = true,
		dict = "veh@std@ds@base",
		anim = "hotwire",
	},
}

Config.item = {
	enabled = false, --Require an item on the the player to access the music player
	name = "car_radio",
	usableItem = true,
}

Config.onlyPlacerControls = false -- Only the person who places the speaker can control it
Config.speakers = {
	["smallspeaker"] = {
		model = `dtsm_speaker_3_purple`,
		command = false, --Access speaker via command
		usableItem = true, --Access speaker via item QBCore/ESX Only
		volume = 100, --Default speaker volume
		diffRoomVolume = 0.25,--Don't touch if you do not know
		range = 15, --Range of the speaker
		posOffset = vec3(0.0,0.0,0.0), --Add an offset to the position of the spawned model
		rotOffset = -90, --Add an offset to the rotation of the spawned model
		anim = {
			enabled = true,
			dict = "pickup_object",
			anim = "pickup_low",
		},
		moveable = true,
	},
	["mediumspeaker"] = {
		model = `dtsm_speaker_1_purple`,
		command = false, --Access speaker via command
		usableItem = true, --Access speaker via item QBCore/ESX Only
		volume = 100, --Default speaker volume
		diffRoomVolume = 0.25,--Don't touch if you do not know
		range = 50, --Range of the speaker
		posOffset = vec3(0.0,0.0,0.0), --Add an offset to the position of the spawned model
		rotOffset = -90, --Add an offset to the rotation of the spawned model
		anim = {
			enabled = true,
			dict = "pickup_object",
			anim = "pickup_low",
		},
		moveable = true,
	},
	["largespeaker"] = {
		model = `fury_bigspeaker`,
		command = false, --Access speaker via command
		usableItem = true, --Access speaker via item QBCore/ESX Only
		volume = 100, --Default speaker volume
		diffRoomVolume = 0.25,--Don't touch if you do not know
		range = 100, --Range of the speaker
		posOffset = vec3(0.0,0.0,0.0), --Add an offset to the position of the spawned model
		rotOffset = 180, --Add an offset to the rotation of the spawned model
		anim = {
			enabled = true,
			dict = "pickup_object",
			anim = "pickup_low",
		},
		moveable = true,
	},
}

--Allowed Vehicle Classes
Config.allowedClasses = {
	[0] =  true, --Compacts  
	[1] =  true, --Sedans  
	[2] =  true, --SUVs  
	[3] =  true, --Coupes  
	[4] =  true, --Muscle  
	[5] =  true, --Sports Classics  
	[6] =  true, --Sports  
	[7] =  true, --Super  
	[8] =  true, --Motorcycles  
	[9] =  true, --Off-road  
	[10] = true, --Industrial  
	[11] = true, --Utility  
	[12] = true, --Vans  
	[13] = true, --Cycles  
	[14] = true, --Boats  
	[15] = true, --Helicopters  
	[16] = true, --Planes  
	[17] = true, --Service  
	[18] = true, --Emergency  
	[19] = true, --Military  
	[20] = true, --Commercial  
	[21] = true, --Trains  
	[22] = true, --Open Wheel
}

Config.specifyVehiclesType = "none" -- "none" | "blacklist" | "whitelist"
Config.specifyVehicles = {
	--[`vehicle_name`] = true,
	--[`zentorno`] = true,
}


Config.defaultSettings = {
    volume = 100,
    diffRoomVolume = 0.25,
    range = 10,
}

if not Config.outsidePlayback then
	Config.defaultSettings = {
		volume = Config.defaultSettings.volume,
		filter = Config.defaultSettings.filter,
		diffRoomVolume = 0,
		range = 2,
	}
end

--Blacklist any links you don't want on your server.
Config.blacklistedLinks = {
	["https://www.youtube.com/watch?v=cueFbUWBwwg"] = true,

}