Config = {}

Config.OnlyFrontSeats = true -- Enable/Disable megaphone usage only from front seats of the vehicle

Config.EnableKeybinds = true -- Enable/Disable keybinds for megaphone usage. If 

Config.MegaphoneEffect = 3 -- 1 = default, 2 = new (Most users includind me prefer default but feel free to test)
-- Set to any other value to enable custom settings
-- Check Config.SubmixSettings below

Config.VehicleMegaphoneBind = 'I' -- Bind for using megaphone in vehicle


Config.HandMegaphone = true -- Enable/Disable megaphone in hand (if true, consider a Framework option below)
Config.HandMegaphoneBind = 'I' -- Bind for holding megaphone in hand and speaking (can't be used in a vehicle)

-- just paste the name of model of the vehicle you want megaphone to be accessible from
Config.OnlyFromList = false  -- this will ensure, that the PA system will only work in cofigured and not in all emergency vehicles
Config.PoliceVehicles = {
    -- [`So2`] = true,
    -- [`So3`] = true,
    -- [`So4`] = true,
    -- [`So5`] = true
}

-- same as above, but for helicopters (of cource planes too, but why would somone install AP to plane?)
Config.Helis = {
    [`pdheli`] = true,
    [`polval`] = true,
    [`polmav_killer`] = true,
    [`2vd_supervolito`] = true,
}

--- don't forget to paste `setr voice_useNativeAudio true` into your server.cfg file
-- native audio distance seems to be larger then regular gta units
Config.MegaphoneProximity = 30.0
Config.HeliMegaphoneProximity = 60.0

Config.HandProximity = 35.0

-- You can enable to increase or decreathe the volume of voice while using AP system, but this will BYPASS 3d sound and distance calculation
Config.CustomVolume = true
Config.CustomVolumeFloat = 1.5 -- just play around with the value



-- For checks if player has megaphone in inventory (For hand megaphone item)
-- esx | qb-core | qbox | ox | standalone
-- For standalone you need to edit a function in inventory/client.lua 
Config.Framework = 'qbox' -- change to your framework name

Config.MegaphoneItemName = 'megaphone' -- name of the item 


-- Check out SetAudioSubmixEffectParamFloat native
Config.SubmixSettings = {
    freq_low = 289.0,
    freq_hi = 9000.0,
    fudge = 0.5,
    rm_mod_freq = 1.0,
    rm_mix = 0.16,
    o_freq_lo = 548.0,
    o_freq_hi = 8900.0
}