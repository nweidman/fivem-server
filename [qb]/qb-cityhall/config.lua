Config = Config or {}

Config.UseTarget = true--GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.JobCenter = {
    model = `a_m_y_business_02`,
    coords = vector4(-261.52, -964.51, 30.22, 168.76),
    jobs = {
        [1] = {
            label = 'Post Man Job',
            coords = vec3(-232.0616, -915.2525, 32.3108)
        },
        [2] = {
            label = 'Builder Job',
            coords = vec3(926.7890, -1560.2476, 30.7419)
        },
        [3] = {
            label = 'Garbage Job',
            coords = vec3(-321.3975, -1546.1237, 31.0199)
        },
        [4] = {
            label = 'Oil Rig Job',
            coords = vec3(1395.5553, -3278.1121, 6.2324)
        },
        [5] = {
            label = 'Delivery Job',
            coords = vec3(78.6603, 111.7501, 81.1712)
        },
        [6] = {
            label = 'Window Cleaning Job',
            coords = vec3(-1244.1080, -1240.6687, 11.0277)
        },
        [7] = {
            label = 'Trucking',
            coords = vec3(-68.19, 6254.12, 31.09)
        },
        [8] = {
            label = 'Hunting',
            coords = vec3(-1511.07, 1514.3, 115.29)
        },
        -- [9] = {
        --     label = 'Gruppe Sechs Job',
        --     coords = vec3(-195.1055, -835.1962, 30.7313)
        -- }
    }
}

Config.Tutorial = {
    model = `a_m_y_business_03`,
    coords = vec4(-260.44, -965.15, 30.22, 139.31),
}

Config.Cityhalls = {
    { -- Cityhall 1
        coords = vec3(-265.0, -963.6, 31.2),
        showBlip = true,
        blipData = {
            sprite = 487,
            display = 4,
            scale = 0.95,
            colour = 0,
            title = "City Services"
        },
        licenses = {
            ["id_card"] = {
                label = "ID Card",
                cost = 250,
            },
            ["driver_license"] = {
                label = "Driver License",
                cost = 500,
                metadata = "driver"
            },
            ["weaponlicense"] = {
                label = "Weapon License",
                cost = 1000,
                metadata = "weapon"
            },
            -- ["waterslicense"] = {
            --     label = "Waters License",
            --     cost = 500,
            --     metadata = "waters"
            -- },
            ["fishinglicense"] = {
                label = "Fishing License",
                cost = 500,
                metadata = "fishing"
            },
            ["huntinglicense"] = {
                label = "Hunting License",
                cost = 500,
                metadata = "hunting"
            },
        }
    },
}

Config.Peds = {
    -- Cityhall Ped
    {
        model = 'a_m_y_business_02',
        coords = vec4(-262.79, -964.18, 30.22, 181.71),
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        cityhall = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 3.0,
            width = 3.0,
            debugPoly = false
        }
    },
}
