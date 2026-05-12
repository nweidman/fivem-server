crm_config = {}
crm_config.crm_debug = false

crm_config.crm_tattoos = {}

crm_config.crm_price = 750

crm_config.crm_zones = {
    {crm_id = "crm-hair", crm_label = "Hair", crm_icon="crm-icon crm-hair"},
    {crm_id = "crm-head", crm_label = "Head", crm_icon="crm-icon crm-head"},
    {crm_id = "crm-torso", crm_label = "Torso", crm_icon="crm-icon crm-torso"},
    {crm_id = "crm-right-arm", crm_label = "Right Arm", crm_icon="crm-icon crm-arm-r"},
    {crm_id = "crm-left-arm", crm_label = "Left Arm", crm_icon="crm-icon crm-arm-l"},
    {crm_id = "crm-right-leg", crm_label = "Right Leg", crm_icon="crm-icon crm-leg-r"},
    {crm_id = "crm-left-leg", crm_label = "Left Leg", crm_icon="crm-icon crm-leg-l"},
}

crm_config.crm_categories = {
    {crm_id = "crm-owned", crm_label = "Owned Tattoos", crm_icon="fa-solid fa-star"},
    {crm_id = "crm-skull", crm_label = "Skull Tattoos", crm_icon="fa-solid fa-skull"},
    {crm_id = "crm-animals", crm_label = "Animals", crm_icon="fa-solid fa-paw"},
    -- {crm_id = "crm-police", crm_label = "Only Police", crm_icon="fa-solid fa-crown", crm_job="police"},
    -- {crm_id = "crm-gang", crm_label = "Only Gang", crm_icon="fa-solid fa-crown", crm_gang="vagos"},
}

crm_config.crm_clothes = { 
    ['crm-male'] = {
        crm_clothing = {
            {crm_id = 1, crm_style = 0, crm_texture = 0},
            {crm_id = 3, crm_style = 15, crm_texture = 0},
            {crm_id = 4, crm_style = 61, crm_texture = 0},
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