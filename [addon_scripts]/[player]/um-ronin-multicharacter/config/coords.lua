---@class Coords
---@field label string
---@field coords vector4
---@field mode? number
---@field emote? { animName?: string, scenario?: string }
---@field group? table<string> list of jobs or gangs that can use this coord
---@field camCoords? vector4 only for mode=3:
---@field fov? number only for mode=3:
---@field blurOptions? { near?: number, far?: number } only for mode =3:
---@field focusOffset? vector3 only for mode =3:
---@return table<string, Coords>

--[[
    https://docs.uyuyorumstore.com/scripts/um-ronin-multi/how-to/coords 
]]
return {
    -- Mode 1 um mode examples (default mode)
    {
        label = 'os',
        coords = vec4(-3110.9985, 485.2572, 2.4905, 238.3884),
    },
    {
        label = 'os2',
        coords = vec4(1488.5864, 3951.6680, 31.8189, 322.6514),
    },
    {
        label = 'main default coords',
        coords = vec4(-2081.84, 2606.33, 3.08, 117.31),
    },

    {
        label = 'main mode 1 coords 2',
        coords = vec4(-1595.47, 2101.84, 66.61, 241.39),
    },

    {
        label = 'main mode 1 coords 3',
        coords = vec4(-3259.45, 967.45, 8.83, 187.65),
    },

    {
        label = 'main mode 1 coords 4',
        coords = vec4(-1718.85, 368.22, 89.73, 70.68),
    },

    {
        label = 'main mode 1 coords 5',
        coords = vec4(-852.73, -226.99, 61.02, 354.04),
    },

    -- Mode 2 xyz mode examples
    {
        label = 'drinking 1',
        coords = vec4(343.14, -73.08, 154.83, 326.88),
        mode = 2,
    },

    {
        label = 'drinking 2',
        coords = vec4(368.14, -1636.53, 93.77, 312.08),
        mode = 2,
    },

    {
        label = 'drinking 3',
        coords = vec4(3439.25, 5442.83, 12.7, 221.3),
        mode = 2,
    },

    {
        label = 'drinking on the stab city bridge',
        coords = vec4(136.28, 3357.62, 49.89, 330.34),
        mode = 2,
    },

    {
        label = 'drinking in mirror park',
        coords = vec4(1079.36, -570.11, 56.78, 257.69),
        mode = 2,
    },

    {
        label = 'drinking on the roof',
        coords = vec4(-980.1, 662.18, 165.66, 185.35),
        mode = 2,
    },

    -- Mode 3 free cam mode examples 
    {
        label = 'test free cam mode',
        coords = vec4(913.5066, 52.5556, 111.6612, 188.3137),    -- Ped spawn coords
        camCoords = vec4(913.0547, 48.7844, 111.8611, 357.7893), -- Camera coords
        fov = 80,                                           -- Camera FOV (optional)
        focusOffset = vec3(0.5, 0, 0.5),                    -- Focus offset (optional)
        emote = {
            -- scenario = 'PROP_HUMAN_SEAT_CHAIR',
            animName = 'idle4',
        },
        blurOptions = {
            near = 0.5,
            far = 5.0,
        },
        mode = 3,
    },

    {
        label = 'os paleto',
        coords = vec4(-147.9106, 6333.4648, 31.6240, 40.7097),    -- Ped spawn coords
        camCoords = vec4(-150.0283, 6337.3350, 31.5814, 215.5432), -- Camera coords
        fov = 50,                                           -- Camera FOV (optional)
        focusOffset = vec3(0.5, 0, 0.5),                    -- Focus offset (optional)
        emote = {
            -- scenario = 'PROP_HUMAN_SEAT_CHAIR',
            animName = 'idle4',
        },
        blurOptions = {
            near = 0.5,
            far = 5.0,
        },
        mode = 3,
    },

    {
        label = 'os school',
        coords = vec4(-1755.6368, 185.7928, 64.4387, 215.6124),    -- Ped spawn coords
        camCoords = vec4(-1753.4116, 181.9765, 64.3712, 27.9836), -- Camera coords
        fov = 50,                                           -- Camera FOV (optional)
        focusOffset = vec3(0.5, 0, 0.5),                    -- Focus offset (optional)
        emote = {
            -- scenario = 'PROP_HUMAN_SEAT_CHAIR',
            animName = 'idle4',
        },
        blurOptions = {
            near = 0.5,
            far = 5.0,
        },
        mode = 3,
    },

    {
        label = '',
        coords = vec4(724.0108, 956.6025, 262.5765, 170.4697),    -- Ped spawn coords
        camCoords = vec4(723.0479, 953.4240, 262.9655, 345.2727), -- Camera coords
        fov = 70,                                           -- Camera FOV (optional)
        focusOffset = vec3(0.5, 0, 0.5),                    -- Focus offset (optional)
        emote = {
            scenario = 'WORLD_HUMAN_DRUG_DEALER_HARD',
            -- animName = 'wine3',
        },
        blurOptions = {
            near = 0.5,
            far = 5.0,
        },
        mode = 3,
    },

    {
        label = ' faze up',
        coords = vec4(354.8854, 119.3569, 103.1056, 158.1712),    -- Ped spawn coords
        camCoords = vec4(353.0286, 114.2451, 102.9768, 337.1367), -- Camera coords
        fov = 40,                                           -- Camera FOV (optional)
        focusOffset = vec3(0.5, 0, 0.5),                    -- Focus offset (optional)
        emote = {
            -- scenario = 'PROP_HUMAN_SEAT_ARMCHAIR',
            animName = 'idle4',
        },
        blurOptions = {
            near = 0.5,
            far = 40.0,
        },
        mode = 3,
    },

    {
        label = ' office',
        coords = vec4(-80.3892, -799.9656, 243.4007, 190.2103),    -- Ped spawn coords
        camCoords = vec4(-81.3219, -802.4971, 244.2902, 338.5990), -- Camera coords
        fov = 40,                                           -- Camera FOV (optional)
        focusOffset = vec3(0.5, 0, 0.5),                    -- Focus offset (optional)
        emote = {
            -- scenario = 'PROP_HUMAN_SEAT_DECKCHAIR_DRINK',
            animName = 'idle4',
        },
        blurOptions = {
            near = 0.5,
            far = 40.0,
        },
        mode = 3,
    },

    -- Job based coords examples
    -- {
    --     label = 'police station',
    --     coords = vec4(455.0764, -994.9835, 30.7074, 142.7991),
    --     group = { 'police', 'mrpd' },
    --     emote = {
    --         scenario = 'CODE_HUMAN_POLICE_INVESTIGATE',
    --     },
    -- },

    -- {
    --     label = 'hospital',
    --     coords = vec4(352.82, -589.3, 43.31, 235.57),
    --     group = { 'ambulance', 'ems' },
    --     emote = {
    --         animName = 'idle4',
    --     },
    -- },
}
