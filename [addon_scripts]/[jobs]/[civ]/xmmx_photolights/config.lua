return {
    Version         = true,                     -- enable version checks.

    Debug           = false,                    -- enable debug prints.
    DebugLines      = false,                    -- enable draw lines for spotlight.
    DebugEmitter    = false,                    -- spotlight emitter.

    UsePerms        = true,                     -- use perms? Configure permissions in bridge/server.lua.
    Command         = "lightprop",              -- command used to open lights menu.
    Keybind         = "F24",                     -- keybind used to open lights menu.

    IconColor       = "#2E54FF",            -- target icon color (if using ox_target).

    SaveProps       = true,                     -- save props to database?
    
    -- the default light setting when first opening.
    -- Will NOT override the default settings of the UI!
    Defaults = {                                
        type            = "spot",
        color           = "#FFFFFF",
        intensity       = 2.0,
        radius          = 13.0,
        falloff         = 10.0,
        coneInner       = 90,
        coneOuter       = 90,
        capsuleLength   = 3.0,
        castShadows     = true,
        dirRight        = 0.0, 
        dirForward      = 3.0,
        dirUp           = 0.0 
    },

    Models = {
        -- GTA Studio Light Prop Models:
        ["prop_studio_light_01"] = { 
            label = "Studio Light 1",  
            liteoffset = vec3(0.0, 0.0, -0.15), -- spot light specific
            propoffset = vec3(0.0, 0.0, 0.15),  -- prop placement offset.
            dir = vec3(0.0, -6.0, -0.2), 
        },
        ["prop_studio_light_02"] = { 
            label = "Studio Light 2",  
            liteoffset = vec3(0.0, 0.0, 0.25),
            propoffset = vec3(0.0, 0.0, 0.0),
            dir = vec3(0.0, -6.0, -0.2), 
        },
        ["prop_studio_light_03"] = { 
            label = "Studio Light 3",  
            liteoffset = vec3(0.0, 0.0, 0.0),
            propoffset = vec3(0.0, 0.0, 0.6), 
            dir = vec3(0.0, -6.0, -0.2), 
        },
        --[[ other light examples
        ["prop_worklight_01a"] = { 
            label = "Work Light 1",  
            liteoffset = vec3(0.0, 0.0, 0.0),
            propoffset = vec3(0.0, 0.0, 0.0), 
            dir = vec3(0.0, -6.0, -0.2), 
        },
        ["prop_worklight_03b"] = { 
            label = "Work Light 2",  
            liteoffset = vec3(0.0, 0.0, 0.0),
            propoffset = vec3(0.0, 0.0, 0.0), 
            dir = vec3(0.0, -6.0, -0.2), 
        },
        ["apa_mp_h_floorlamp_c"] = { 
            label = "Floor Lamp 1",  
            liteoffset = vec3(0.0, 0.0, 0.0),
            propoffset = vec3(0.0, 0.0, 0.0), 
            dir = vec3(0.0, -6.0, -0.2), 
        },
        ["apa_mp_h_floorlamp_a"] = { 
            label = "Floor Lamp 2",  
            liteoffset = vec3(0.0, 0.0, 0.0),
            propoffset = vec3(0.0, 0.0, 0.0), 
            dir = vec3(0.0, -6.0, -0.2), 
        },
        --]]
    },
    
    MaxHeight           = 2.5,                  -- min/max height allowed.
    Controls = {                                -- Do NOT Touch!!
        rotateLeft      = 14,                   -- Mouse Scroll Wheel Down
        rotateRight     = 15,                   -- Mouse Scroll Wheel Up

        rotatePitchUp   = 68,                   -- Right Mouse Button
        rotatePitchDown = 69,                   -- Left Mouse Button
        rotateRollLeft  = 174,                  -- Arrow Left
        rotateRollRight = 175,                  -- Arrow Right
    
        SnapGrnd        = 19,                   -- LEFT ALT
        heightUp        = 172,                  -- Arrow Up
        heightDown      = 173,                  -- Arrow Down
    
        cancel          = 202,                  -- BACKSPACE
        place           = 215,                  -- ENTER
    },
    
    Locales = {
        prop_saved      = "Light Prop Saved!",
        prop_deleted    = "Light Prop Removed Successfully!",
        prop_error      = "Error Deleting Prop from Database!",
        prop_failed     = "Failed to insert prop into database!",
        cant_place      = "Invalid placement position!",
        remove_prop     = "Remove Light",
        adjust_light    = "Adjust Light",
        unauthorized    = "Not Authorized!",
    },
}