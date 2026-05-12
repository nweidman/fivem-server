crm_locations = {
    crm_target = false,
    crm_debug = false,
    crm_radial = {
        crm_enable = false,
        crm_data = {
            crm_id = "crm-open-tattoos",
            crm_icon = "pen-nib",
            crm_title = "Open Tattoos",
            crm_close = true,
            crm_click = function()
                TriggerEvent('crm-tattoos:show-tattoos-menu')
            end,
            crm_type = "client", -- for qb-radialmenu.
            crm_event = 'crm-tattoos:show-tattoos-menu', -- for qb-radialmenu.
        },
    },
    crm_blip = {
        crm_show = true,
        crm_color = 0,
        crm_scale = 0.7,
        crm_sprite = 75,
    },
    crm_marker = { -- only works if you don't use a target system.
        crm_show = true,
        crm_size = vector3(1, 1, 2),
        crm_color = {crm_r = 166, crm_g = 113, crm_b = 254, crm_a = 255}
    },
    crm_textui = { -- only works if you don't use a target system.
        crm_key = 'E',
        crm_id = 38,
    },
    crm_bigzone = false,
    crm_locations = {
        {
            crm_blip = true,
            crm_name = 'Tattoo Shop',
            crm_icon = 'fa-solid fa-pen-nib',
            crm_coords = vector3(1323.14, -1652.16, 52.28),
            crm_size = vector3(7, 6, 2),
            crm_rotation = 40,
            crm_points = {
                vector4(1323.14, -1652.16, 52.28, 198.91),
                vector4(1320.89, -1653.67, 52.28, 315.04),
            },
        },
        {
            crm_blip = true,
            crm_name = 'Tattoo Shop',
            crm_icon = 'fa-solid fa-pen-nib',
            crm_coords = vector3(-1153.05, -1426.08, 4.95),
            crm_size = vector3(7, 6, 2),
            crm_rotation = 35,
            crm_points = {
                vector4(-1153.05, -1426.08, 4.95, 38.98),
                vector4(-1155.95, -1426.77, 4.95, 306.26),
            },
        },
        {
            crm_blip = true,
            crm_name = 'Tattoo Shop',
            crm_icon = 'fa-solid fa-pen-nib',
            crm_coords = vector3(322.2, 181.44, 103.59),
            crm_size = vector3(7, 6, 2),
            crm_rotation = 160,
            crm_points = {
                vector4(322.2, 181.44, 103.59, 163.63),
                vector4(324.22, 179.77, 103.59, 71.22),
            },
        },
        {
            crm_blip = true,
            crm_name = 'Tattoo Shop',
            crm_icon = 'fa-solid fa-pen-nib',
            crm_coords = vector3(-3171.07, 1075.41, 20.83),
            crm_size = vector3(7, 6, 2),
            crm_rotation = 250,
            crm_points = {
                vector4(-3171.07, 1075.41, 20.83, 249.23),
                vector4(-3168.79, 1077.08, 20.83, 153.44),
            },
        },
        {
            crm_blip = true,
            crm_name = 'Tattoo Shop',
            crm_icon = 'fa-solid fa-pen-nib',
            crm_coords = vector3(1863.4, 3748.65, 33.03),
            crm_size = vector3(7, 6, 2),
            crm_rotation = 290,
            crm_points = {
                vector4(1864.04, 3746.92, 33.03, 357.43),
                vector4(1865.01, 3749.0, 33.05, 118.63),
            },
        },
        {
            crm_blip = true,
            crm_name = 'Tattoo Shop',
            crm_icon = 'fa-solid fa-pen-nib',
            crm_coords = vector3(-292.92, 6199.13, 31.49),
            crm_size = vector3(7, 6, 2),
            crm_rotation = 40,
            crm_points = {
                vector4(-293.96, 6200.9, 31.49, 192.01),
                vector4(-294.46, 6198.64, 31.5, 311.09),
            },
        },
    },
}