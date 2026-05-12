crm_config = {}
crm_config.crm_debug = false

-- crm-appearance - 

crm_config.crm_path = "./crm-files"
crm_config.crm_images = false -- true: to enable images in the menu.
crm_config.crm_currency = "$"
crm_config.crm_items = false -- true: to enable clothing as items, require modifications [crm-open -> crm-main : Function --> crm_on_save()]
crm_config.crm_wardrobe = true -- true: to enable wardrobe menu in the clothing stores.

-- crm-appearance -

crm_config.crm_migration = {
    crm_enable = false,
    crm_old_resource = 'illenium-appearance', -- 'illenium-appearance'
}

-- crm-appearance - 

crm_config.crm_payment = "crm_bank" -- "crm_cash" or "crm_bank"
crm_config.crm_prices = {
    ['crm-clothingstore'] = 500,
    ['crm-barbershop'] = 500,
    ['crm-plasticsurgery'] = 5000,
}

-- crm-appearance - 

crm_config.crm_details = {
    {crm_title = "Rotate Ped", crm_desc = "Use <strong>A</strong> / <strong>D</strong> keys to rotate the ped, or hold the ped with the mouse and move it in the desired direction (left or right)."},
    {crm_title = "Move Camera", crm_desc = "Use the <strong>Arrow Up</strong> / <strong>Arrow Down</strong> keys to move the camera up or down."},
    {crm_title = "Zoom Camera", crm_desc = "Use the <strong>+</strong> / <strong>-</strong> keys to zoom in or out."},
    {crm_title = "Fast Navigation", crm_desc = "Hold the <strong>left or right arrows</strong> on the UI for rapid navigation through options. For instance, you can quickly scroll through T-shirt styles from 0 to 200 by holding the arrow button instead of clicking repeatedly."},
}

-- crm-appearance - 

crm_config.crm_faces = 45

-- crm-appearance - 

crm_config.crm_commands = {
    crm_skin = {
        crm_cmd = "skin",
        crm_help = "Open skin menu for a player",
        crm_perms = "mod",
        crm_args = {
            {crm_name = "PlayerId", crm_help = "ID of player you want to give menu."}
        }
    },
    crm_reloadskin = {
        crm_cmd = "reloadskin",
        crm_help = "Reload your skin",
        crm_perms = "user",
    },
}

crm_config.crm_extras = { -- "crm-open/crm-extras.lua"
    crm_enable = true,
    crm_mask = 'mask',
    crm_hat = 'hat',
    crm_glasses = 'glasses',
    crm_ears = 'earrings',
    crm_watch = 'watch',
    crm_bracelet = 'bracelet',
}

crm_config.crm_keys = { -- https://www.toptal.com/developers/keycode
    crm_zoom_in  = 107,  -- Numpad +
    crm_zoom_out = 109,  -- Numpad -
    crm_move_up  = 38,   -- Arrow Up
    crm_move_down = 40,  -- Arrow Down
    crm_rotate_left = 65, -- A
    crm_rotate_right = 68 -- D
}

-- crm-appearance - 

crm_config.crm_peds = {
    crm_all = { -- Used from dropdown menu.
        {crm_model = 'mp_m_freemode_01'},
        {crm_model = 'mp_f_freemode_01'},
        {crm_model = 'ig_cornwood'},
        -- {crm_model = 'hm_justin'},
        {crm_model = 'pw_roscoe'},
        {crm_model = 'pw_andreas'},
        {crm_model = 'pw_hao'},
        {crm_model = 'pw_jiwon'},
        {crm_model = 'sl_fatcop_01'},
        {crm_model = 'ft-aushep'},
        {crm_model = 'ft-bloodhound'},
        {crm_model = 'pw_hendry'},
        {crm_model = 'ma_mizo'},
        {crm_model = 'ft-groe'},
        {crm_model = 'ft-pterrier'},
        {crm_model = 'max'},
        {crm_model = 'ft-pandags'},
        {crm_model = 'pw_george'},
        {crm_model = 'misscandy'},
        {crm_model = 'ft-amakita'},
        {crm_model = 'ft_dshepherd'},
        {crm_model = 'a_c_aussiepup'},
        {crm_model = 's_m_m_gaffer_01'},
        {crm_model = 'a_m_y_methhead_01'},
        {crm_model = 'k9dog'},
        {crm_model = 'a_c_husky'},
        {crm_model = 'racoon_new'},
        {crm_model = 'pw_carter80'},
        {crm_model = 'pw_andreas80'},
        {crm_model = 'tstudio_alvarg_eltuerto'},
        {crm_model = 'bugk9'},
        {crm_model = 'bughusky'},
        {crm_model = 'ft-dobermanv2'},
        {crm_model = 'bugdoberman'},
        {crm_model = 'a_c_dalmatian'},
        {crm_model = 'roy_ruckus'},
        {crm_model = 'John_Woody'},
        {crm_model = 'golden_r'},
    },
    crm_freemod = {
        {crm_model = 'mp_m_freemode_01'},
        {crm_model = 'mp_f_freemode_01'},
    },
    crm_male = {
        {crm_model = 'mp_m_freemode_01'},
    },
    crm_female = {
        {crm_model = 'mp_f_freemode_01'},
    },
}

-- crm-appearance - 

crm_config.crm_initial_appearance = {
    ['crm-male'] = {
        crm_model = 'mp_m_freemode_01',
        crm_inheritance = {
            crm_mother_face = 0,
            crm_mother_skin = 0,
            crm_mother_race = 0,
            crm_father_face = 0,
            crm_father_skin = 0,
            crm_father_race = 0,
            crm_mix_face = 0,
            crm_mix_skin = 0,
            crm_mix_race = 0,
        },
        crm_face = {
            crm_eye_color = 0,
            crm_no_width = 0,
            crm_no_height = 0,
            crm_no_size = 0,
            crm_no_bone_height = 0,
            crm_no_peak_height = 0,
            crm_no_bone_twist = 0,
            crm_ey_depth = 0,
            crm_ey_height = 0,
            crm_ch_bone_width = 0,
            crm_ch_bone_height = 0,
            crm_ch_width = 0,
            crm_em_eyes_opening = 0,
            crm_em_lip_thickness = 0,
            crm_ja_width = 0,
            crm_ja_size = 0,
            crm_ch_lowering = 0,
            crm_ch_length = 0,
            crm_ch_size = 0,
            crm_ch_hole_size = 0,
            crm_ne_thickness = 0,
        },
        crm_skin = {
            crm_blemishes = {crm_index = 0, crm_opacity = 0},
            crm_ageing = {crm_index = 0, crm_opacity = 0},
            crm_complexion = {crm_index = 0, crm_opacity = 0},
            crm_sun_damage = {crm_index = 0, crm_opacity = 0},
            crm_moles_freckles = {crm_index = 0, crm_opacity = 0},
            crm_body_blemishes = {crm_index = 0, crm_opacity = 0},
        },
        crm_hair = {
            crm_hair = {
                crm_index = 0,
                crm_texture = 0,
                crm_color = 0,
                crm_secondary_color = 0,
            },
            crm_facial_hair = {
                crm_index = 0,
                crm_opacity = 0,
                crm_color = 0,
            },
            crm_chest_hair = {
                crm_index = 0,
                crm_opacity = 0,
                crm_color = 0,
            },
            crm_eyebrows = {
                crm_index = 0,
                crm_opacity = 0,
                crm_color = 0,
            },
        },
        crm_makeup = {
            crm_makeup = {
                crm_index = 0,
                crm_opacity = 0,
                crm_color = 0,
                crm_secondary_color = 0,
            },
            crm_blush = {
                crm_index = 0,
                crm_opacity = 0,
                crm_color = 0,
                crm_secondary_color = 0,
            },
            crm_lipstick = {
                crm_index = 0,
                crm_opacity = 0,
                crm_color = 0,
                crm_secondary_color = 0,
            },
        },
        crm_clothing = {
            {crm_id = 1, crm_style = 0, crm_texture = 0},
            {crm_id = 3, crm_style = 15, crm_texture = 0},
            {crm_id = 4, crm_style = 18, crm_texture = 0},
            {crm_id = 5, crm_style = 0, crm_texture = 0},
            {crm_id = 6, crm_style = 34, crm_texture = 0},
            {crm_id = 7, crm_style = 0, crm_texture = 0},
            {crm_id = 8, crm_style = 15, crm_texture = 0},
            {crm_id = 9, crm_style = 0, crm_texture = 0},
            {crm_id = 10, crm_style = 0, crm_texture = 0},
            {crm_id = 11, crm_style = 15, crm_texture = 0},
        },
        crm_accessories = {
            {crm_id = 0, crm_style = -1, crm_texture = 0},
            {crm_id = 1, crm_style = -1, crm_texture = 0},
            {crm_id = 2, crm_style = -1, crm_texture = 0},
            {crm_id = 6, crm_style = -1, crm_texture = 0},
            {crm_id = 7, crm_style = -1, crm_texture = 0},
        },
    },
    ['crm-female'] = {
        crm_model = 'mp_f_freemode_01',
        crm_inheritance = {
            crm_mother_face = 45,
            crm_mother_skin = 21,
            crm_mother_race = 0,
            crm_father_face = 20,
            crm_father_skin = 15,
            crm_father_race = 0,
            crm_mix_face = 0,
            crm_mix_skin = 0,
            crm_mix_race = 0,
        },
        crm_face = {
            crm_eye_color = 0,
            crm_no_width = 0,
            crm_no_height = 0,
            crm_no_size = 0,
            crm_no_bone_height = 0,
            crm_no_peak_height = 0,
            crm_no_bone_twist = 0,
            crm_ey_depth = 0,
            crm_ey_height = 0,
            crm_ch_bone_width = 0,
            crm_ch_bone_height = 0,
            crm_ch_width = 0,
            crm_em_eyes_opening = 0,
            crm_em_lip_thickness = 0,
            crm_ja_width = 0,
            crm_ja_size = 0,
            crm_ch_lowering = 0,
            crm_ch_length = 0,
            crm_ch_size = 0,
            crm_ch_hole_size = 0,
            crm_ne_thickness = 0,
        },
        crm_skin = {
            crm_blemishes = {crm_index = 0, crm_opacity = 0},
            crm_ageing = {crm_index = 0, crm_opacity = 0},
            crm_complexion = {crm_index = 0, crm_opacity = 0},
            crm_sun_damage = {crm_index = 0, crm_opacity = 0},
            crm_moles_freckles = {crm_index = 0, crm_opacity = 0},
            crm_body_blemishes = {crm_index = 0, crm_opacity = 0},
        },
        crm_hair = {
            crm_hair = {
                crm_index = 0,
                crm_texture = 0,
                crm_color = 0,
                crm_secondary_color = 0,
            },
            crm_facial_hair = {
                crm_index = 0,
                crm_opacity = 0,
                crm_color = 0,
            },
            crm_chest_hair = {
                crm_index = 0,
                crm_opacity = 0,
                crm_color = 0,
            },
            crm_eyebrows = {
                crm_index = 0,
                crm_opacity = 0,
                crm_color = 0,
            },
        },
        crm_makeup = {
            crm_makeup = {
                crm_index = 0,
                crm_opacity = 0,
                crm_color = 0,
                crm_secondary_color = 0,
            },
            crm_blush = {
                crm_index = 0,
                crm_opacity = 0,
                crm_color = 0,
                crm_secondary_color = 0,
            },
            crm_lipstick = {
                crm_index = 0,
                crm_opacity = 0,
                crm_color = 0,
                crm_secondary_color = 0,
            },
        },
        crm_clothing = {
            {crm_id = 1, crm_style = 0, crm_texture = 0},
            {crm_id = 3, crm_style = 15, crm_texture = 0},
            {crm_id = 4, crm_style = 15, crm_texture = 0},
            {crm_id = 5, crm_style = 0, crm_texture = 0},
            {crm_id = 6, crm_style = 35, crm_texture = 0},
            {crm_id = 7, crm_style = 0, crm_texture = 0},
            {crm_id = 8, crm_style = 15, crm_texture = 0},
            {crm_id = 9, crm_style = 0, crm_texture = 0},
            {crm_id = 10, crm_style = 0, crm_texture = 0},
            {crm_id = 11, crm_style = 15, crm_texture = 0},
        },
        crm_accessories = {
            {crm_id = 0, crm_style = -1, crm_texture = 0},
            {crm_id = 1, crm_style = -1, crm_texture = 0},
            {crm_id = 2, crm_style = -1, crm_texture = 0},
            {crm_id = 6, crm_style = -1, crm_texture = 0},
            {crm_id = 7, crm_style = -1, crm_texture = 0},
        },
    },
}