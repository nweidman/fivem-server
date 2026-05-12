--[[
BY RX Scripts © rxscripts.xyz
--]]

Config.HuntingZones = {
    ['Zone A'] = {
        maxAnimals = 35,
        spawnInterval = 1,
        zone = {
            type = 'sphere',
            coords = vector3(-878.1794, 4799.4321, 300.6859),
            radius = 225,
            debug = false,
        },
        animals = {
            'Pig',
            'Cow',
            'Boar',
            'Deer',
            'Coyote',
            'Lion',
        },
        route = {
            enabled = true,
            coords = { x = -878.1794, y = 4799.4321},
        },
        blip = {
            enabled = true,
            sprite = 141,
            color = 31,
            display = 2,
            scale = 0.7,
            shortrange = true,
            label = 'Hunting - Zone A',
        },
        radiusBlip = {
            enabled = true,
            radius = 225.0,
            color = 25,
            alpha = 80,
            shortrange = true,
        },

    },
    ['Zone B'] = {
        maxAnimals = 35,
        spawnInterval = 1,
        zone = {
            type = 'sphere',
            coords = vector3(2416.5049, -1811.2988, 69.5935),
            radius = 225,
            debug = false,
        },
        animals = {
            'Pig',
            'Pig',
            'Cow',
            'Boar',
            'Deer',
            'Coyote',
        },
        route = {
            enabled = true,
            coords = { x = 2416.5049, y = -1811.2988},
        },
        blip = {
            enabled = true,
            sprite = 141,
            color = 31,
            display = 2,
            scale = 0.7,
            shortrange = true,
            label = 'Hunting - Zone B',
        },
        radiusBlip = {
            enabled = true,
            radius = 225.0,
            color = 25,
            alpha = 80,
            shortrange = true,
        },
    }
}