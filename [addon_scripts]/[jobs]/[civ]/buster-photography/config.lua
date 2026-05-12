Config = {}

Config.Debug = false

-- Time in minutes to wait before automatically deleting a prop after it is placed. (To help with performace)
Config.DeleteCheckInterval = 30 -- seconds
Config.DeleteDistance = 50.0    -- meters
Config.DeleteAfterMinutes = 10   -- minutes

--  PHOTO BOX props
--     bzzz_photobox_1
--     bzzz_photobox_2
--     bzzz_photobox_3
--     bzzz_photobox_4
--     bzzz_photobox_5
--     bzzz_photobox_6
--     bzzz_photobox_7
--     bzzz_photobox_8
--     bzzz_photobox_9
--     bzzz_photobox_10


--  LIGHTS and LAMPS props
--     bzzz_dream_of_lights_blue
--     bzzz_dream_of_lights_green
--     bzzz_dream_of_lights_orange
--     bzzz_dream_of_lights_pink
--     bzzz_dream_of_lights_purple
--     bzzz_dream_of_lights_red
--     bzzz_dream_of_lights_white
--     bzzz_dream_of_lights_yellow
--     bzzz_world_of_lamps_blue
--     bzzz_world_of_lamps_green
--     bzzz_world_of_lamps_orange
--     bzzz_world_of_lamps_pink
--     bzzz_world_of_lamps_purple
--     bzzz_world_of_lamps_red
--     bzzz_world_of_lamps_white
--     bzzz_world_of_lamps_yellow

Config.Items = { --What item spawncode is associated with what prop
    ['bzzz_dream_of_lights_blue'] = 'blue_light',
    ['bzzz_dream_of_lights_green'] = 'green_light',
    ['bzzz_dream_of_lights_orange'] = 'orange_light',
    ['bzzz_dream_of_lights_pink'] = 'pink_light',
    ['bzzz_dream_of_lights_purple'] = 'purple_light',
    ['bzzz_dream_of_lights_red'] = 'red_light',
    ['bzzz_dream_of_lights_white'] = 'white_light',
    ['bzzz_dream_of_lights_yellow'] = 'yellow_light',
    ['bzzz_world_of_lamps_blue'] = 'blue_lamp',
    ['bzzz_world_of_lamps_green'] = 'green_lamp',
    ['bzzz_world_of_lamps_orange'] = 'orange_lamp',
    ['bzzz_world_of_lamps_pink'] = 'pink_lamp',
    ['bzzz_world_of_lamps_purple'] = 'purple_lamp',
    ['bzzz_world_of_lamps_red'] = 'red_lamp',
    ['bzzz_world_of_lamps_white'] = 'white_lamp',
    ['bzzz_world_of_lamps_yellow'] = 'yellow_lamp',
    ['bzzz_photobox_1'] = 'photobox_1',
    ['bzzz_photobox_2'] = 'photobox_2',
    ['bzzz_photobox_3'] = 'photobox_3',
    ['bzzz_photobox_4'] = 'photobox_4',
    ['bzzz_photobox_5'] = 'photobox_5',
    ['bzzz_photobox_6'] = 'photobox_6',
    ['bzzz_photobox_7'] = 'photobox_7',
    ['bzzz_photobox_8'] = 'photobox_8',
    ['bzzz_photobox_9'] = 'photobox_9',
    ['bzzz_photobox_10'] = 'photobox_10',    
}

Config.JobRestriction = {
    Enabled = true,     -- Job Restriction: true means only certain jobs can tow vehicles
    AllowedJobs = {
        photo = true,
    },
}

Config.Keybinds = {
    IncreasePreviewOffsetX = 175, -- Arrow Right
    DecreasePreviewOffsetX = 174, -- Arrow Left
    IncreasePreviewOffsetY = 172, -- Arrow Up
    DecreasePreviewOffsetY = 173, -- Arrow Down
    IncreasePreviewOffsetZ = 83,  -- +
    DecreasePreviewOffsetZ = 84,  -- -
    RotateLeft = 44,              -- Q
    RotateRight = 38,             -- E
    confirm = 191,                -- ENTER
    cancel = 177,                 -- BACKSPACE
} --reference https://docs.fivem.net/docs/game-references/controls/ for the list of keybind codes

Config.KeybindHelpMessage = "~w~[Arrows]~s~ Move\n~w~[+/-]~s~ Up/Down\n~w~[Q/E]~s~ Rotate\n~g~[Enter]~s~ Place\n~r~[BKSP]~s~ Cancel"

return Config