crm_config = {}
crm_config.crm_debug = false
crm_config.crm_logs = false

crm_config.crm_settings = {
    crm_target = false, -- enable/disable target.
    crm_debug = false, -- zones debug.
    crm_marker = { -- only works if you don't use a target system.
        crm_show = true,
        crm_size = vector3(4, 4, 2),
        crm_color = {crm_r = 255, crm_g = 176, crm_b = 96, crm_a = 255}
    },
    crm_textui = { -- only works if you don't use a target system.
        crm_key = 'E',
        crm_id = 38,
        crm_icon = "fa-solid fa-store",
    },
}

crm_config.crm_blip = {
    crm_scale = 0.6,
}

crm_config.crm_currency = "$"
crm_config.crm_path = 'https://44417-cdn.fivemsvr.com/img'

crm_config.crm_dashboard = { -- Require ace permissions
    crm_cmd = "manage_shops",
    crm_help = "Open shops dashboard.",
    crm_perms = "group.admin",
}

crm_config.crm_society = { -- crm-open/crm-server/crm-main.lua : crm_give_society()
    crm_enable = false,
    crm_resource = "crm-null", -- "crm-banking" or "esx_society"
}

crm_config.crm_third_pay = { -- crm-open/crm-server/crm-main.lua : crm_pay_custom()
    crm_enable = false,
    crm_icon = "fa-solid fa-sack-dollar",
    crm_label = "Custom Method",
}