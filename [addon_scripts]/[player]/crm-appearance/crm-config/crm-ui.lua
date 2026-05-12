local crm_ui = {
    crm_types = {},
}

crm_ui.crm_types['crm-charcreator'] = {
    crm_title = crm_l('crm_menus.crm_charcreator'),
    crm_sub = crm_l('crm_menus.crm_charcreator_s'),
    crm_icon = "fa-solid fa-bars-staggered",
    crm_blacklist = "crm-charcreator",
    crm_navs = {
        ['crm-peds'] = {crm_enable = true}, 
        ['crm-inheritance'] = {crm_enable = true, crm_freemod = true}, 
        ['crm-face'] = {crm_enable = true, crm_freemod = true}, 
        ['crm-skin'] = {crm_enable = true, crm_freemod = true}, 
        ['crm-hair'] = {crm_enable = true}, 
        ['crm-makeup'] = {crm_enable = true}, 
        ['crm-clothing'] = {crm_enable = true}, 
        ['crm-accessories'] = {crm_enable = true}, 
    },
}

crm_ui.crm_types['crm-clothingstore'] = {
    crm_title = crm_l('crm_menus.crm_clothingstore'),
    crm_sub = crm_l('crm_menus.crm_clothingstore_s'),
    crm_icon = "fa-solid fa-shirt",
    crm_blacklist = "crm-charcreator",
    crm_navs = {
        ['crm-clothing'] = {crm_enable = true}, 
        ['crm-accessories'] = {crm_enable = true}, 
    },
}

crm_ui.crm_types['crm-barbershop'] = {
    crm_title = crm_l('crm_menus.crm_barbershop'),
    crm_sub = crm_l('crm_menus.crm_barbershop_s'),
    crm_icon = "fa-solid fa-scissors",
    crm_blacklist = "crm-charcreator",
    crm_navs = {
        ['crm-hair'] = {crm_enable = true}, 
        ['crm-makeup'] = {crm_enable = true}, 
    },
}

crm_ui.crm_types['crm-plasticsurgery'] = {
    crm_title = crm_l('crm_menus.crm_plasticsurgery'),
    crm_sub = crm_l('crm_menus.crm_plasticsurgery_s'),
    crm_icon = "fa-solid fa-syringe",
    crm_blacklist = "crm-charcreator",
    crm_navs = {
        ['crm-peds'] = {crm_enable = true}, 
        ['crm-inheritance'] = {crm_enable = true, crm_freemod = true}, 
        ['crm-face'] = {crm_enable = true, crm_freemod = true}, 
        ['crm-skin'] = {crm_enable = true, crm_freemod = true}, 
        ['crm-hair'] = {crm_enable = true}, 
        ['crm-makeup'] = {crm_enable = true}, 
        ['crm-clothing'] = {crm_enable = false}, 
        ['crm-accessories'] = {crm_enable = false}, 
    },
}

crm_ui.crm_layout = {
    {crm_id = "crm-peds", crm_icon = "fa-solid fa-person", crm_label = crm_l('crm_appearance.crm_peds.crm_nav'), crm_ui = {
        {crm_id = "crm-all", crm_separate = true, crm_label = crm_l('crm_appearance.crm_peds.crm_all'), crm_class = "crm-drop", crm_placeholder = crm_l('crm_appearance.crm_peds.crm_all_s')},
        {crm_id = "crm-freemode", crm_expand = true, crm_label = crm_l('crm_appearance.crm_peds.crm_freemod'), crm_class = "crm-selects", crm_size = "crm-selects-xl"},
        {crm_id = "crm-male", crm_expand = true, crm_label = crm_l('crm_appearance.crm_peds.crm_male'), crm_class = "crm-selects", crm_size = "crm-selects-xl"},
        {crm_id = "crm-female", crm_expand = true, crm_label = crm_l('crm_appearance.crm_peds.crm_female'), crm_class = "crm-selects", crm_size = "crm-selects-xl"},
    }},
    {crm_id = "crm-inheritance", crm_icon = "fa-solid fa-crown", crm_label = crm_l('crm_appearance.crm_inheritance.crm_nav'), crm_ui = {
        {crm_label = crm_l('crm_appearance.crm_inheritance.crm_mother_face'), crm_childs = {
            {crm_id = "crm-mother-f", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-mother-f", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
        }},
        {crm_label = crm_l('crm_appearance.crm_inheritance.crm_mother_skin'), crm_childs = {
            {crm_id = "crm-mother-s", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-mother-s", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
        }},
        {crm_label = crm_l('crm_appearance.crm_inheritance.crm_mother_race'), crm_childs = {
            {crm_id = "crm-mother-r", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-mother-r", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
        }},
        {crm_label = crm_l('crm_appearance.crm_inheritance.crm_father_face'), crm_childs = {
            {crm_id = "crm-father-f", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-father-f", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
        }},
        {crm_label = crm_l('crm_appearance.crm_inheritance.crm_father_skin'), crm_childs = {
            {crm_id = "crm-father-s", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-father-s", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
        }},
        {crm_label = crm_l('crm_appearance.crm_inheritance.crm_father_race'), crm_childs = {
            {crm_id = "crm-father-r", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-father-r", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
        }},
        {crm_label = crm_l('crm_appearance.crm_inheritance.crm_mix'), crm_childs = {
            {crm_class = "crm-sliders", crm_childs = {
                {crm_id = "crm-mix-f", crm_label = crm_l('crm_appearance.crm_inheritance.crm_mix_face')},
                {crm_id = "crm-mix-s", crm_label = crm_l('crm_appearance.crm_inheritance.crm_mix_skin')},
            }},
            {crm_id = "crm-mix-r", crm_label = crm_l('crm_appearance.crm_inheritance.crm_mix_race'), crm_class = "crm-sliders"},
        }},
    }},
    {crm_id = "crm-face", crm_icon = "fa-solid fa-skull", crm_label = crm_l('crm_appearance.crm_face.crm_nav'), crm_ui = {
        {crm_id = "crm-eye-color", crm_label = crm_l('crm_appearance.crm_face.crm_eye_color'), crm_class = "crm-switchs"},
        {crm_label = crm_l('crm_appearance.crm_face.crm_nose'), crm_childs = {
            {crm_class = "crm-sliders", crm_childs = {
                {crm_id = "crm-no-width", crm_label = crm_l('crm_appearance.crm_face.crm_width')},
                {crm_id = "crm-no-height", crm_label = crm_l('crm_appearance.crm_face.crm_height')},
            }},
            {crm_class = "crm-sliders", crm_childs = {
                {crm_id = "crm-no-size", crm_label = crm_l('crm_appearance.crm_face.crm_size')},
                {crm_id = "crm-no-bone-height", crm_label = crm_l('crm_appearance.crm_face.crm_bone_height')},
            }},
            {crm_class = "crm-sliders", crm_childs = {
                {crm_id = "crm-no-peak-height", crm_label = crm_l('crm_appearance.crm_face.crm_peak_height')},
                {crm_id = "crm-no-bone-twist", crm_label = crm_l('crm_appearance.crm_face.crm_bone_twist')},
            }},
        }},
        {crm_label = crm_l('crm_appearance.crm_face.crm_eyebrows'), crm_childs = {
            {crm_class = "crm-sliders", crm_childs = {
                {crm_id = "crm-ey-depth", crm_label = crm_l('crm_appearance.crm_face.crm_depth')},
                {crm_id = "crm-ey-height", crm_label = crm_l('crm_appearance.crm_face.crm_height')},
            }},
        }},
        {crm_label = crm_l('crm_appearance.crm_face.crm_cheeks'), crm_childs = {
            {crm_class = "crm-sliders", crm_childs = {
                {crm_id = "crm-ch-bone-width", crm_label = crm_l('crm_appearance.crm_face.crm_bone_width')},
                {crm_id = "crm-ch-bone-height", crm_label = crm_l('crm_appearance.crm_face.crm_bone_height')},
            }},
            {crm_class = "crm-sliders", crm_childs = {
                {crm_id = "crm-ch-width", crm_label = crm_l('crm_appearance.crm_face.crm_width')},
            }},
        }},
        {crm_label = crm_l('crm_appearance.crm_face.crm_eyesandmouth'), crm_childs = {
            {crm_class = "crm-sliders", crm_childs = {
                {crm_id = "crm-em-eyes-opening", crm_label = crm_l('crm_appearance.crm_face.crm_eyes_opening')},
                {crm_id = "crm-em-lip-thickness", crm_label = crm_l('crm_appearance.crm_face.crm_lip_thickness')},
            }},
        }},
        {crm_label = crm_l('crm_appearance.crm_face.crm_jaw'), crm_childs = {
            {crm_class = "crm-sliders", crm_childs = {
                {crm_id = "crm-ja-width", crm_label = crm_l('crm_appearance.crm_face.crm_width')},
                {crm_id = "crm-ja-size", crm_label = crm_l('crm_appearance.crm_face.crm_size')},
            }},
        }},
        {crm_label = crm_l('crm_appearance.crm_face.crm_chin'), crm_childs = {
            {crm_class = "crm-sliders", crm_childs = {
                {crm_id = "crm-ch-lowering", crm_label = crm_l('crm_appearance.crm_face.crm_lowering')},
                {crm_id = "crm-ch-length", crm_label = crm_l('crm_appearance.crm_face.crm_length')},
            }},
            {crm_class = "crm-sliders", crm_childs = {
                {crm_id = "crm-ch-size", crm_label = crm_l('crm_appearance.crm_face.crm_size')},
                {crm_id = "crm-ch-hole-size", crm_label = crm_l('crm_appearance.crm_face.crm_hole_size')},
            }},
        }},
        {crm_label = crm_l('crm_appearance.crm_face.crm_neck'), crm_childs = {
            {crm_id = "crm-ne-thickness", crm_class = "crm-sliders", crm_label = crm_l('crm_appearance.crm_face.crm_thickness')},
        }},
    }},
    {crm_id = "crm-skin", crm_icon = "fa-solid fa-grip", crm_label = crm_l('crm_appearance.crm_skin.crm_nav'), crm_ui = {
        {crm_label = crm_l('crm_appearance.crm_skin.crm_blemishes'), crm_childs = {
            {crm_id = "crm-blemishes", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-blemishes", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
            {crm_id = "crm-blemishes-o", crm_label = crm_l('crm_appearance.crm_opacity'), crm_class = "crm-sliders"},
        }},
        {crm_label = crm_l('crm_appearance.crm_skin.crm_ageing'), crm_childs = {
            {crm_id = "crm-ageing", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-ageing", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
            {crm_id = "crm-ageing-o", crm_label = crm_l('crm_appearance.crm_opacity'), crm_class = "crm-sliders"},
        }},
        {crm_label = crm_l('crm_appearance.crm_skin.crm_complexion'), crm_childs = {
            {crm_id = "crm-complexion", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-complexion", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
            {crm_id = "crm-complexion-o", crm_label = crm_l('crm_appearance.crm_opacity'), crm_class = "crm-sliders"},
        }},
        {crm_label = crm_l('crm_appearance.crm_skin.crm_sundamage'), crm_childs = {
            {crm_id = "crm-sundamage", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-sundamage", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
            {crm_id = "crm-sundamage-o", crm_label = crm_l('crm_appearance.crm_opacity'), crm_class = "crm-sliders"},
        }},
        {crm_label = crm_l('crm_appearance.crm_skin.crm_mandf'), crm_childs = {
            {crm_id = "crm-mandf", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-mandf", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
            {crm_id = "crm-mandf-o", crm_label = crm_l('crm_appearance.crm_opacity'), crm_class = "crm-sliders"},
        }},
        {crm_label = crm_l('crm_appearance.crm_skin.crm_bodyblemishes'), crm_childs = {
            {crm_id = "crm-bodyblemishes", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-bodyblemishes", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
            {crm_id = "crm-bodyblemishes-o", crm_label = crm_l('crm_appearance.crm_opacity'), crm_class = "crm-sliders"},
        }},
    }},
    {crm_id = "crm-hair", crm_icon = "fa-solid fa-xmark", crm_label = crm_l('crm_appearance.crm_hair.crm_nav'), crm_ui = {
        {crm_label = crm_l('crm_appearance.crm_hair.crm_hair'), crm_childs = {
            {crm_id = "crm-hair", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-hair", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
            {crm_id = "crm-hair-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_class = "crm-switchs", crm_type = "crm-texture"},
            {crm_id = "crm-hair-c", crm_label = crm_l('crm_appearance.crm_color'), crm_class = "crm-colors"},
            {crm_id = "crm-hair-sc", crm_label = crm_l('crm_appearance.crm_secondary'), crm_class = "crm-colors"},
        }},
        {crm_label = crm_l('crm_appearance.crm_hair.crm_facial'), crm_childs = {
            {crm_id = "crm-facial", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-facial", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
            {crm_id = "crm-facial-o", crm_label = crm_l('crm_appearance.crm_opacity'), crm_class = "crm-sliders"},
            {crm_id = "crm-facial-c", crm_label = crm_l('crm_appearance.crm_color'), crm_class = "crm-colors"},
            {crm_id = "crm-facial-sc", crm_label = crm_l('crm_appearance.crm_secondary'), crm_class = "crm-colors"},
        }},
        {crm_label = crm_l('crm_appearance.crm_hair.crm_chest'), crm_childs = {
            {crm_id = "crm-chest", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-chest", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
            {crm_id = "crm-chest-o", crm_label = crm_l('crm_appearance.crm_opacity'), crm_class = "crm-sliders"},
            {crm_id = "crm-chest-c", crm_label = crm_l('crm_appearance.crm_color'), crm_class = "crm-colors"},
            {crm_id = "crm-chest-sc", crm_label = crm_l('crm_appearance.crm_secondary'), crm_class = "crm-colors"},
        }},
        {crm_label = crm_l('crm_appearance.crm_hair.crm_eyebrows'), crm_childs = {
            {crm_id = "crm-eyebrows", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-eyebrows", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
            {crm_id = "crm-eyebrows-o", crm_label = crm_l('crm_appearance.crm_opacity'), crm_class = "crm-sliders"},
            {crm_id = "crm-eyebrows-c", crm_label = crm_l('crm_appearance.crm_color'), crm_class = "crm-colors"},
            {crm_id = "crm-eyebrows-sc", crm_label = crm_l('crm_appearance.crm_secondary'), crm_class = "crm-colors"},
        }},
    }},
    {crm_id = "crm-makeup", crm_icon = "fa-solid fa-palette", crm_label = crm_l('crm_appearance.crm_makeup.crm_nav'), crm_ui = {
        {crm_label = crm_l('crm_appearance.crm_makeup.crm_makeup'), crm_childs = {
            {crm_id = "crm-makeup", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-makeup", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
            {crm_id = "crm-makeup-o", crm_label = crm_l('crm_appearance.crm_opacity'), crm_class = "crm-sliders"},
            {crm_id = "crm-makeup-c", crm_label = crm_l('crm_appearance.crm_color'), crm_class = "crm-colors"},
            {crm_id = "crm-makeup-sc", crm_label = crm_l('crm_appearance.crm_secondary'), crm_class = "crm-colors"},
        }},
        {crm_label = crm_l('crm_appearance.crm_makeup.crm_blush'), crm_childs = {
            {crm_id = "crm-blush", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-blush", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
            {crm_id = "crm-blush-o", crm_label = crm_l('crm_appearance.crm_opacity'), crm_class = "crm-sliders"},
            {crm_id = "crm-blush-c", crm_label = crm_l('crm_appearance.crm_color'), crm_class = "crm-colors"},
            {crm_id = "crm-blush-sc", crm_label = crm_l('crm_appearance.crm_secondary'), crm_class = "crm-colors"},
        }},
        {crm_label = crm_l('crm_appearance.crm_makeup.crm_lipstick'), crm_childs = {
            {crm_id = "crm-lipstick", crm_class = "crm-selects", crm_enable = crm_config.crm_images},
            {crm_id = "crm-lipstick", crm_label = crm_l('crm_appearance.crm_style'), crm_class = "crm-switchs"},
            {crm_id = "crm-lipstick-o", crm_label = crm_l('crm_appearance.crm_opacity'), crm_class = "crm-sliders"},
            {crm_id = "crm-lipstick-c", crm_label = crm_l('crm_appearance.crm_color'), crm_class = "crm-colors"},
            {crm_id = "crm-lipstick-sc", crm_label = crm_l('crm_appearance.crm_secondary'), crm_class = "crm-colors"},
        }},
    }},
    {crm_id = "crm-clothing", crm_icon = "fa-solid fa-shirt", crm_label = crm_l('crm_appearance.crm_clothing.crm_nav'), crm_ui = {
        {crm_id = "crm-clothing-8", crm_expand = true, crm_label = crm_l('crm_appearance.crm_clothing.crm_8'), crm_class = "crm-selects", crm_enable = crm_config.crm_images},
        {crm_separate = true, crm_class = "crm-switchs", crm_childs = {
            {crm_id = "crm-clothing-8", crm_label = crm_l('crm_appearance.crm_style')},
            {crm_id = "crm-clothing-8-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_type = "crm-texture"},
        }},
        {crm_id = "crm-clothing-11", crm_expand = true, crm_label = crm_l('crm_appearance.crm_clothing.crm_11'), crm_class = "crm-selects", crm_enable = crm_config.crm_images},
        {crm_separate = true, crm_class = "crm-switchs", crm_childs = {
            {crm_id = "crm-clothing-11", crm_label = crm_l('crm_appearance.crm_style')},
            {crm_id = "crm-clothing-11-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_type = "crm-texture"},
        }},
        {crm_id = "crm-clothing-3", crm_expand = true, crm_label = crm_l('crm_appearance.crm_clothing.crm_3'), crm_class = "crm-selects", crm_enable = crm_config.crm_images},
        {crm_separate = true, crm_class = "crm-switchs", crm_childs = {
            {crm_id = "crm-clothing-3", crm_label = crm_l('crm_appearance.crm_style')},
            {crm_id = "crm-clothing-3-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_type = "crm-texture"},
        }},
        {crm_id = "crm-clothing-4", crm_expand = true, crm_label = crm_l('crm_appearance.crm_clothing.crm_4'), crm_class = "crm-selects", crm_enable = crm_config.crm_images},
        {crm_separate = true, crm_class = "crm-switchs", crm_childs = {
            {crm_id = "crm-clothing-4", crm_label = crm_l('crm_appearance.crm_style')},
            {crm_id = "crm-clothing-4-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_type = "crm-texture"},
        }},
        {crm_id = "crm-clothing-6", crm_expand = true, crm_label = crm_l('crm_appearance.crm_clothing.crm_6'), crm_class = "crm-selects", crm_enable = crm_config.crm_images},
        {crm_separate = true, crm_class = "crm-switchs", crm_childs = {
            {crm_id = "crm-clothing-6", crm_label = crm_l('crm_appearance.crm_style')},
            {crm_id = "crm-clothing-6-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_type = "crm-texture"},
        }},
        {crm_id = "crm-clothing-1", crm_expand = true, crm_label = crm_l('crm_appearance.crm_clothing.crm_1'), crm_class = "crm-selects", crm_enable = crm_config.crm_images},
        {crm_separate = true, crm_class = "crm-switchs", crm_childs = {
            {crm_id = "crm-clothing-1", crm_label = crm_l('crm_appearance.crm_style')},
            {crm_id = "crm-clothing-1-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_type = "crm-texture"},
        }},
        {crm_id = "crm-clothing-7", crm_expand = true, crm_label = crm_l('crm_appearance.crm_clothing.crm_7'), crm_class = "crm-selects", crm_enable = crm_config.crm_images},
        {crm_separate = true, crm_class = "crm-switchs", crm_childs = {
            {crm_id = "crm-clothing-7", crm_label = crm_l('crm_appearance.crm_style')},
            {crm_id = "crm-clothing-7-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_type = "crm-texture"},
        }},
        {crm_id = "crm-clothing-10", crm_expand = true, crm_label = crm_l('crm_appearance.crm_clothing.crm_10'), crm_class = "crm-selects", crm_enable = crm_config.crm_images},
        {crm_separate = true, crm_class = "crm-switchs", crm_childs = {
            {crm_id = "crm-clothing-10", crm_label = crm_l('crm_appearance.crm_style')},
            {crm_id = "crm-clothing-10-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_type = "crm-texture"},
        }},
        {crm_id = "crm-clothing-5", crm_expand = true, crm_label = crm_l('crm_appearance.crm_clothing.crm_5'), crm_class = "crm-selects", crm_enable = crm_config.crm_images},
        {crm_separate = true, crm_class = "crm-switchs", crm_childs = {
            {crm_id = "crm-clothing-5", crm_label = crm_l('crm_appearance.crm_style')},
            {crm_id = "crm-clothing-5-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_type = "crm-texture"},
        }},
        {crm_id = "crm-clothing-9", crm_expand = true, crm_label = crm_l('crm_appearance.crm_clothing.crm_9'), crm_class = "crm-selects", crm_enable = crm_config.crm_images},
        {crm_separate = true, crm_class = "crm-switchs", crm_childs = {
            {crm_id = "crm-clothing-9", crm_label = crm_l('crm_appearance.crm_style')},
            {crm_id = "crm-clothing-9-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_type = "crm-texture"},
        }},
        {crm_id = "crm-clothing-0", crm_expand = true, crm_label = crm_l('crm_appearance.crm_clothing.crm_0'), crm_class = "crm-selects", crm_enable = crm_config.crm_images},
        {crm_separate = true, crm_class = "crm-switchs", crm_childs = {
            {crm_id = "crm-clothing-0", crm_label = crm_l('crm_appearance.crm_style')},
            {crm_id = "crm-clothing-0-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_type = "crm-texture"},
        }},
    }},
    {crm_id = "crm-accessories", crm_icon = "fa-solid fa-ring", crm_label = crm_l('crm_appearance.crm_accs.crm_nav'), crm_ui = {
        {crm_id = "crm-accessories-0", crm_expand = true, crm_label = crm_l('crm_appearance.crm_accs.crm_0'), crm_class = "crm-selects", crm_enable = crm_config.crm_images},
        {crm_separate = true, crm_class = "crm-switchs", crm_childs = {
            {crm_id = "crm-accessories-0", crm_label = crm_l('crm_appearance.crm_style')},
            {crm_id = "crm-accessories-0-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_type = "crm-texture"},
        }},
        {crm_id = "crm-accessories-1", crm_expand = true, crm_label = crm_l('crm_appearance.crm_accs.crm_1'), crm_class = "crm-selects", crm_enable = crm_config.crm_images},
        {crm_separate = true, crm_class = "crm-switchs", crm_childs = {
            {crm_id = "crm-accessories-1", crm_label = crm_l('crm_appearance.crm_style')},
            {crm_id = "crm-accessories-1-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_type = "crm-texture"},
        }},
        {crm_id = "crm-accessories-2", crm_expand = true, crm_label = crm_l('crm_appearance.crm_accs.crm_2'), crm_class = "crm-selects", crm_enable = crm_config.crm_images},
        {crm_separate = true, crm_class = "crm-switchs", crm_childs = {
            {crm_id = "crm-accessories-2", crm_label = crm_l('crm_appearance.crm_style')},
            {crm_id = "crm-accessories-2-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_type = "crm-texture"},
        }},
        {crm_id = "crm-accessories-6", crm_expand = true, crm_label = crm_l('crm_appearance.crm_accs.crm_6'), crm_class = "crm-selects", crm_enable = crm_config.crm_images},
        {crm_separate = true, crm_class = "crm-switchs", crm_childs = {
            {crm_id = "crm-accessories-6", crm_label = crm_l('crm_appearance.crm_style')},
            {crm_id = "crm-accessories-6-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_type = "crm-texture"},
        }},
        {crm_id = "crm-accessories-7", crm_expand = true, crm_label = crm_l('crm_appearance.crm_accs.crm_7'), crm_class = "crm-selects", crm_enable = crm_config.crm_images},
        {crm_separate = true, crm_class = "crm-switchs", crm_childs = {
            {crm_id = "crm-accessories-7", crm_label = crm_l('crm_appearance.crm_style')},
            {crm_id = "crm-accessories-7-t", crm_label = crm_l('crm_appearance.crm_texture'), crm_type = "crm-texture"},
        }},
    }},
}

-- crm-appearance - 

function crm_get_ui()
    return crm_ui
end