Shared = Shared or {}

Shared.Locale = "en"

-- If true, a radio list will be displayed on the players screen when they are in a radio channel
Shared.ShowPlayerList = true

-- If true, then anonymous mode will be disabled
Shared.DisableAnonymous = false

-- The command name for changing radio channels, if you remove this line then the command will be removed
Shared.ChangeRadioChannelCommand = "changeradio"

-- ONLY FOR MUMBLE-VOIP, has to be the same as the talking key for the animation to work
Shared.RadioKey = 137

-- If set to true, players will be disconnected from their radio channel upon dying
Shared.DisconnectOnDeath = true

-- If set to true, the radio will be navigated via your arrow keys instead of your mouse.
-- This only changes the default value for your server, it can also be manually changed via the players ingame radio settings
Shared.NavigateWithArrowKeys = false

-- If this is set to true, an panic button will be enabled.
Shared.EnablePanicButton = true

-- How long of a cooldown the panic button should have, in seconds
Shared.PanicButtonCooldown = 60 * 5

Shared.RemoveWeaponOnOpenRadio = false            -- if true, players will not be able to use weapons while open radio
Shared.RemoveWeaponOnTalkingOnRadio = false
Shared.DisableShootingWhileTalkingOnRadio = true -- if true, players will not be able to shoot while talking on radio

-- Command for updating callsign, if you dont want it, set it to nil, or remove the line
Shared.CallsignCommand = nil

-- Requires either high_3dsounds or sounity
Shared.PanicButtonSound = {
	Name = "https://www.myinstants.com/media/sounds/discord-notification.mp3", -- A link to the sound
	Enabled = true,                                                         -- Whether the sound should be played or not
	Duration = 5,                                                          -- How long the sound will play
}

-- If set to true, this will enable pma-voice's radio filter
-- Aka the `voice_enableRadioSubmix` & `voice_enableSubmix` convar
Shared.RadioFilter = true

-- How many messages to fetch when looking at messages ingame
-- If set to -1, all messages will be fetched
Shared.MessageLimit = 50

-- If set to true, the radio will disconnect upon the player going into water.
Shared.DisconnectInWater = false
Shared.MinimumWaterDepth = -1 -- -1 would mean no minimum depth

-- Limit for how many recent channels to save
Shared.RecentLimit = 10

-- If set to true, an option for call signs will be added to the radio.
Shared.AllowCallSigns = true

-- If this is set to true, players will be removed from job channels if they go off duty (for qbcore/qbox)
Shared.RemoveOnOffDuty = false

-- If enabled, the current channel name will be displayed instead of "Radio members" in the members overlay
Shared.DisplayRadioName = false

-- Dont change this unless told by support to change it :)
Shared.Debug = false
