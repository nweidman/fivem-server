return {
    timeout = 10000,
    maxSpikes = 5,
    policePlatePrefix = 'POL',
    objects = {
        cone = {model = `prop_roadcone02a`, freeze = false},
        barrier = {model = `prop_barrier_work06a`, freeze = true},
        roadsign = {model = `prop_snow_sign_road_06g`, freeze = true},
        tent = {model = `prop_gazebo_03`, freeze = true},
        light = {model = `prop_worklight_03b`, freeze = true},
        chair = {model = `prop_chair_08`, freeze = true},
        chairs = {model = `prop_chair_pile_01`, freeze = true},
        tabe = {model = `prop_table_03`, freeze = true},
        monitor = {model = `des_tvsmash_root`, freeze = true},
    },

    locations = {
        duty = {
            --vector3(617.86, 6.64, 83.64), --VPD Reception Area
            vector3(452.71, -994.83, 30.71), --MRPD Hall Printer
            vector3(1813.75, 3670.89, 34.40), --Sandy Station
            vector3(386.96, -1624.22, 29.75), -- Davis Station
        },
        vehicle = {
            --vec4(452.0, -996.0, 26.0, 175.0),
            --vec4(447.0, -997.0, 26.0, 178.0),
            --vec4(463.0, -1019.0, 28.0, 87.0),
            --vec4(463.0, -1015.0, 28.0, 87.0),
        },
        stash = { -- Not currently used, use ox_inventory stashes
            --vector3(606.18, 7.50, 87.80), --VPD Armory
            vector3(467.28, -1004.8, 30.71), --MRPD Lockers
            vector3(1822.68, 3683.12, 34.40), --Sandy
            vector3(376.12, -1610.73, 30.2), -- Davis
        },
        impound = {
           -- vec3(436.68, -1007.42, 27.32),
           -- vec3(-436.14, 5982.63, 31.34)
        },
        helicopter = {
            --vec4(449.168, -981.325, 43.691, 87.234),
            --vec4(-475.43, 5988.353, 31.716, 31.34),
        },
        armory = { -- Not currently used, use ox_inventory shops
            -- vec3(462.23, -981.12, 30.68),
        },
        trash = {
            --vector3(618.27, 10.69, 83.64), -- VPD Reception Shredder
            vector3(447.73, -1009.69, 30.71), -- MRPD Storage
            vector3(1825.13, 3676.20, 34.40), -- Sandy
            vector3(381.92, -1624.95, 29.75), -- Davis
        },
        fingerprint = {
            --vector3(612.23, 0.83, 75.04), -- VPD process
            vector3(455.31, -980.39, 27.51), -- MRPD Mugshot
            vector3(1826.13, 3676.46, 30.69), -- Sandy process
            --vector3(622.04, 7.63, 83.62), -- VPD Lobby
            vector3(444.93, -990.32, 30.71), -- MRPD Lobby
            vector3(1825.87, 3671.25, 34.40), -- sandy front
            vector3(380.27, -1622.76, 24.70), -- Davis Mugshot
            vector3(389.79, -1608.08, 29.75), -- Davis Lobby
            vector3(-1579.98, 192.88, 58.85), -- Courthouse Lobby
        },
        evidence = { -- Not currently used, use ox_inventory evidence system
            -- vector3(604.61, 6.18, 75.04),  -- VPD Evidence Room Basement
            -- vector3(374.28, -1596.59, 25.36), -- Davis Basement
            -- vector3(1821.08, 3683.61, 30.69), -- Sandy basement
        },
        stations = {
            --{label = "Vinewood Police Station", coords = vector4(591.61, -5.12, 73.92, 160.00)},
            {label = "Mission Row Police Station", coords = vector4(440.76, -990.44, 30.71, 268.29)},
            {label = "Sandy Sheriffs Station", coords = vector4(1821.88, 3671.11, 34.40, 201.92)},
            {label = "Davis Sheriffs Station", coords = vector4(380.51, -1615.46, 30.16, 320.00)},
        },
        dna = {
            --vector3(609.78, 3.50, 75.04),   -- VPD processing room PC
            vector3(467.74, -1000.16, 34.24), -- MRPD processing PC
            vector3(1826.13, 3676.46, 30.69), -- Sandy processing PC
            vector3(389.79, -1608.08, 29.75), -- Davis lobby PC
        },
    },

    radars = {
        -- /!\ The maxspeed(s) need to be in an increasing order /!\
        -- If you don't want to fine people just do that: 'config.speedFines = false'
        -- fine if you're maxspeed or less over the speedlimit
        -- (i.e if you're at 41 mph and the radar's limit is 35 you're 6mph over so a 25$ fine)
        speedFines = {
            {fine = 25, maxSpeed = 10 },
            {fine = 50, maxSpeed = 30},
            {fine = 250, maxSpeed = 80},
            {fine = 500, maxSpeed = 180},
        }
    }
}
