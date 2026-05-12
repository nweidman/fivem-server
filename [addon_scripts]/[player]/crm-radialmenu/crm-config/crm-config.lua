crm_config = {}
crm_config.crm_debug = false

crm_config.crm_style = "crm-radialmenu-2" -- "crm-radialmenu-1" or "crm-radialmenu-2" or "crm-radialmenu-3" or "crm-radialmenu-4"
crm_config.crm_toggle = {
    crm_key = "F1",
    crm_cmd = "radialmenu",
    crm_desc = "Toggle radial menu",
    crm_key_hold = true,
    crm_while_walking = false,
}

crm_config.crm_favorite = {
    crm_enable = true,
    crm_title = "Favorite Actions",
    crm_add = '<i class="fa-regular fa-star"></i> '..'Add to favorites',
    crm_rmv = '<i class="fa-solid fa-star"></i> '..'Remove from favorites',
    crm_max = 6,
}

crm_config.crm_trunk_classes = {
    [0] = { crm_enable = true, crm_x = 0.0, crm_y = -1.5, crm_z = 0.0 },   -- Coupes
    [1] = { crm_enable = true, crm_x = 0.0, crm_y = -2.0, crm_z = 0.0 },   -- Sedans
    [2] = { crm_enable = true, crm_x = 0.0, crm_y = -1.0, crm_z = 0.25 },  -- SUVs
    [3] = { crm_enable = true, crm_x = 0.0, crm_y = -1.5, crm_z = 0.0 },   -- Coupes
    [4] = { crm_enable = true, crm_x = 0.0, crm_y = -2.0, crm_z = 0.0 },   -- Muscle
    [5] = { crm_enable = true, crm_x = 0.0, crm_y = -2.0, crm_z = 0.0 },   -- Sports Classics
    [6] = { crm_enable = true, crm_x = 0.0, crm_y = -2.0, crm_z = 0.0 },   -- Sports
    [7] = { crm_enable = true, crm_x = 0.0, crm_y = -2.0, crm_z = 0.0 },   -- Super
    [8] = { crm_enable = false, crm_x = 0.0, crm_y = -1.0, crm_z = 0.25 }, -- Motorcycles
    [9] = { crm_enable = true, crm_x = 0.0, crm_y = -1.0, crm_z = 0.25 },  -- Off-road
    [10] = { crm_enable = true, crm_x = 0.0, crm_y = -1.0, crm_z = 0.25 }, -- Industrial
    [11] = { crm_enable = true, crm_x = 0.0, crm_y = -1.0, crm_z = 0.25 }, -- Utility
    [12] = { crm_enable = true, crm_x = 0.0, crm_y = -1.0, crm_z = 0.25 }, -- Vans
    [13] = { crm_enable = true, crm_x = 0.0, crm_y = -1.0, crm_z = 0.25 }, -- Cycles
    [14] = { crm_enable = true, crm_x = 0.0, crm_y = -1.0, crm_z = 0.25 }, -- Boats
    [15] = { crm_enable = true, crm_x = 0.0, crm_y = -1.0, crm_z = 0.25 }, -- Helicopters
    [16] = { crm_enable = true, crm_x = 0.0, crm_y = -1.0, crm_z = 0.25 }, -- Planes
    [17] = { crm_enable = true, crm_x = 0.0, crm_y = -1.0, crm_z = 0.25 }, -- Service
    [18] = { crm_enable = true, crm_x = 0.0, crm_y = -1.0, crm_z = 0.25 }, -- Emergency
    [19] = { crm_enable = true, crm_x = 0.0, crm_y = -1.0, crm_z = 0.25 }, -- Military
    [20] = { crm_enable = true, crm_x = 0.0, crm_y = -1.0, crm_z = 0.25 }, -- Commercial
    [21] = { crm_enable = true, crm_x = 0.0, crm_y = -1.0, crm_z = 0.25 }  -- Trains
}

crm_config.crm_trunk_blacklist = { -- set to true to blacklist vehicle by model.
    [`ardent`] = true,
}

crm_config.crm_clothing_settings = {
    ['crm-mask'] = {
        crm_type = "crm-comp",
        crm_id = 1,
        crm_default = {crm_male = 0, crm_female = 0},
        crm_emote = {
            crm_on = {crm_dict = 'mp_masks@standard_car@ds@', crm_anim = 'put_on_mask', crm_move = 51, crm_duration = 800},
            crm_off = {crm_dict = 'mp_masks@standard_car@ds@', crm_anim = 'put_on_mask', crm_move = 51, crm_duration = 800}
        },
    },
    ['crm-vest'] = {
        crm_type = "crm-comp",
        crm_id = 9,
        crm_default = {crm_male = 0, crm_female = 0},
        crm_emote = {
            crm_on = {crm_dict = 'clothingtie', crm_anim = 'try_tie_negative_a', crm_move = 51, crm_duration = 1200},
            crm_off = {crm_dict = 'clothingtie', crm_anim = 'try_tie_negative_a', crm_move = 51, crm_duration = 1200}
        },
    },
    ['crm-bag'] = {
        crm_type = "crm-comp",
        crm_id = 5,
        crm_default = {crm_male = 0, crm_female = 0},
        crm_emote = {
            crm_on = {crm_dict = 'clothingtie', crm_anim = 'try_tie_negative_a', crm_move = 51, crm_duration = 1200},
            crm_off = {crm_dict = 'anim@heists@ornate_bank@grab_cash', crm_anim = 'intro', crm_move = 51, crm_duration = 1600}
        },
    },
    ['crm-neck'] = {
        crm_type = "crm-comp",
        crm_id = 7,
        crm_default = {crm_male = 0, crm_female = 0},
        crm_emote = {
            crm_on = {crm_dict = 'clothingtie', crm_anim = 'try_tie_positive_a', crm_move = 51, crm_duration = 2100},
            crm_off = {crm_dict = 'clothingtie', crm_anim = 'try_tie_positive_a', crm_move = 51, crm_duration = 2100}
        },
    },
    ['crm-shirt'] = {
        crm_type = "crm-comp",
        crm_id = 11,
        crm_default = {crm_male = 15, crm_female = 15},
        crm_emote = {
            crm_on = {crm_dict = 'clothingtie', crm_anim = 'try_tie_negative_a', crm_move = 51, crm_duration = 1200},
            crm_off = {crm_dict = 'clothingtie', crm_anim = 'try_tie_negative_a', crm_move = 51, crm_duration = 1200}
        },
        crm_extra = {
            {crm_id = 8, crm_style = 15, crm_nid = "crm-under"}, -- undershirt
            {crm_id = 3, crm_style = 15, crm_nid = "crm-hands"}, -- hands
            {crm_id = 10, crm_style = 0, crm_nid = "crm-decals"}, -- decals
        },
    },
    ['crm-pants'] = {
        crm_type = "crm-comp",
        crm_id = 4,
        crm_default = {crm_male = 61, crm_female = 15},
        crm_emote = {
            crm_on = {crm_dict = 're@construction', crm_anim = 'out_of_breath', crm_move = 51, crm_duration = 1300},
            crm_off = {crm_dict = 're@construction', crm_anim = 'out_of_breath', crm_move = 51, crm_duration = 1300}
        },
    },
    ['crm-shoes'] = {
        crm_type = "crm-comp",
        crm_id = 6,
        crm_default = {crm_male = 34, crm_female = 35},
        crm_emote = {
            crm_on = {crm_dict = 'random@domestic', crm_anim = 'pickup_low', crm_move = 0, crm_duration = 1200},
            crm_off = {crm_dict = 'random@domestic', crm_anim = 'pickup_low', crm_move = 0, crm_duration = 1200}
        },
    },
    -- crm-props
    ['crm-hat'] = {
        crm_type = "crm-prop", 
        crm_id = 0,
        crm_emote = {
            crm_on = {crm_dict = 'mp_masks@standard_car@ds@', crm_anim = 'put_on_mask', crm_move = 51, crm_duration = 600},
            crm_off = {crm_dict = 'missheist_agency2ahelmet', crm_anim = 'take_off_helmet_stand', crm_move = 51, crm_duration = 1200}
        }
    },
    ['crm-glasses'] = {
        crm_type = "crm-prop", 
        crm_id = 1,
        crm_emote = {
            crm_on = {crm_dict = 'clothingspecs', crm_anim = 'take_off', crm_move = 51, crm_duration = 1400},
            crm_off = {crm_dict = 'clothingspecs', crm_anim = 'take_off', crm_move = 51, crm_duration = 1400}
        }
    },
    ['crm-ear'] = {
        crm_type = "crm-prop", 
        crm_id = 2,
        crm_emote = {
            crm_on = {crm_dict = 'mp_cp_stolen_tut', crm_anim = 'b_think', crm_move = 51, crm_duration = 900},
            crm_off = {crm_dict = 'mp_cp_stolen_tut', crm_anim = 'b_think', crm_move = 51, crm_duration = 900}
        }
    },
    ['crm-watch'] = {
        crm_type = "crm-prop", 
        crm_id = 6,
        crm_emote = {
            crm_on = {crm_dict = 'nmt_3_rcm-10', crm_anim = 'cs_nigel_dual-10', crm_move = 51, crm_duration = 1200},
            crm_off = {crm_dict = 'nmt_3_rcm-10', crm_anim = 'cs_nigel_dual-10', crm_move = 51, crm_duration = 1200}
        }
    },
    ['crm-bracelet'] = {
        crm_type = "crm-prop", 
        crm_id = 7,
        crm_emote = {
            crm_on = {crm_dict = 'nmt_3_rcm-10', crm_anim = 'cs_nigel_dual-10', crm_move = 51, crm_duration = 1200},
            crm_off = {crm_dict = 'nmt_3_rcm-10', crm_anim = 'cs_nigel_dual-10', crm_move = 51, crm_duration = 1200}
        }
    },
}