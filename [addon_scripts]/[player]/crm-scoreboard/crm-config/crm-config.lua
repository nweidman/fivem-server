crm_config = {}
crm_config.crm_debug = false

crm_config.crm_position = 'crm-left' -- 'crm-left' or 'crm-right'
crm_config.crm_key = 'f10'
crm_config.crm_cmd = 'crimboard'
crm_config.crm_help = 'Open Crimboard'

crm_config.crm_info = {
    crm_title = '',
    crm_sub = 'Roleplay',
}

crm_config.crm_name_type = 'crm-hidden' -- 'crm-character-name' or 'crm-hidden' or 'crm-game-name'
crm_config.crm_name_hidden = 'Unknown Player'
crm_config.crm_role_default = 'Player'
crm_config.crm_role_color_default = '#FFFFFF'

crm_config.crm_enable = {
    ['crm-players'] = false,
    ['crm-jobs'] = true,
    ['crm-heists'] = true,
    ['crm-cop'] = false,
}

crm_config.crm_pages = { -- Note: If you disable a page, make sure to disable the components in crm_config.crm_enable so it doesn't run in background.
    {crm_enable = false, crm_title = 'Players', crm_icon = 'fa-users', crm_id = "crm-players"},
    {crm_enable = true, crm_title = 'Jobs / Heists', crm_icon = 'fa-briefcase', crm_id = "crm-others"},
    {crm_enable = false, crm_title = '/checkleo', crm_icon = 'fa-handcuffs', crm_id = "crm-cop"},
}

crm_config.crm_jobs = {
    {crm_id = 2, crm_jobs = {'taxi'}, crm_title = 'Police /checkleo', crm_icon = 'fa-handcuffs'},
    -- {crm_id = 1, crm_types = {'leo'}, crm_title = 'Police Department. - LEO', crm_icon = 'fa-handcuffs'}, -- you can use [crm_types] for jobs type (only for qbcore)
    {crm_id = 1, crm_jobs = {'ambulance'}, crm_title = 'Emergency Medical Services', crm_icon = 'fa-star-of-life'},
    -- {crm_id = 3, crm_jobs = {'taxi'}, crm_title = 'Public Transport.', crm_icon = 'fa-taxi'},
    -- {crm_id = 4, crm_jobs = {'realestate'}, crm_title = 'Real Estate.', crm_icon = 'fa-building'},
    -- {crm_id = 5, crm_jobs = {'mechanic'}, crm_title = 'Mechanic.', crm_icon = 'fa-gear'},
    -- {crm_id = 6, crm_jobs = {'news'}, crm_title = 'Weazel News .', crm_icon = 'fa-newspaper'},
    -- {crm_id = 7, crm_jobs = {'gov'}, crm_title = 'City of Los Santos.', crm_icon = 'fa-gavel'},
}

crm_config.crm_heists = {
    {
        crm_id = 1,
        crm_title = 'Rob Police (5 Cops Min)', 
        crm_icon = 'fa-handcuffs', 
        crm_requires = {
            {crm_job='police', crm_count=5}, -- you can use [crm_type] for jobs type (only for qbcore)
        }
    },
    {
        crm_id = 2,
        crm_title = '8 Police or More', 
        crm_icon = 'fa-handcuffs', 
        crm_requires = {
            {crm_job='police', crm_count=8}, -- you can use [crm_type] for jobs type (only for qbcore)
        }
    },
    {
        crm_id = 3,
        crm_title = 'Fort Zancudo Heist', 
        crm_icon = 'fa-fort-awesome', 
        crm_requires = {
            {crm_job='police', crm_count=0},
        }
    },
    {
        crm_id = 4,
        crm_title = 'AirCraft Carrier Heist', 
        crm_icon = 'fa-jet-fighter-up', 
        crm_requires = {
            {crm_job='police', crm_count=0},
        }
    },
    {
        crm_id = 5,
        crm_title = 'Cargo Ship Heist', 
        crm_icon = 'fa-ship', 
        crm_requires = {
            {crm_job='police', crm_count=0},
        }
    },
    {
        crm_id = 6,
        crm_title = 'Air Drops', 
        crm_icon = 'fa-fire-flame-curved', 
        crm_requires = {
            {crm_job='police', crm_count=0},
        }
    },
    {
        crm_id = 7,
        crm_title = 'House Robbery - (2 Max Crims)', 
        crm_icon = 'fa-house', 
        crm_requires = {
            {crm_job='police', crm_count=0},
        }
    },
    {
        crm_id = 8,
        crm_title = 'Mailbox, Meter, and Parcel Robberies - (2 Max Crims)', 
        crm_icon = 'fa-box-open', 
        crm_requires = {
            {crm_job='police', crm_count=0},
        }
    },
    {
        crm_id = 9,
        crm_title = 'Store Robbery - (2 Max Crims)', 
        crm_icon = 'fa-shop', 
        crm_requires = {
            {crm_job='police', crm_count=2},
        }
    },
    {
        crm_id = 10,
        crm_title = 'Bank Truck - (2 Max Crims)', 
        crm_icon = 'fa-truck-front', 
        crm_requires = {
            {crm_job='police', crm_count=2},
        }
    },
    {
        crm_id = 11,
        crm_title = 'ATM Robberies - (2 Max Crims)', 
        crm_icon = 'fa-money-bills', 
        crm_requires = {
            {crm_job='police', crm_count=2},
        }
    },
    {
        crm_id = 12,
        crm_title = 'Boosting - (4 Max Crims)', 
        crm_icon = 'fa-car', 
        crm_requires = {
            {crm_job='police', crm_count=0},
        }
    },
    {
        crm_id = 13,
        crm_title = 'Fleeca Bank - (4 Max Crims)', 
        crm_icon = 'fa-building-columns', 
        crm_requires = {
            {crm_job='police', crm_count=4},
        }
    },
    {
        crm_id = 14,
        crm_title = 'Maze Bank - (4 Max Crims)', 
        crm_icon = 'fa-building-columns', 
        crm_requires = {
            {crm_job='police', crm_count=4},
        }
    },
    {
        crm_id = 15,
        crm_title = 'Cash Exchange - (4 Max Crims)', 
        crm_icon = 'fa-building-columns', 
        crm_requires = {
            {crm_job='police', crm_count=4},
        }
    },
    {
        crm_id = 16,
        crm_title = 'Yacht Heist - (4 Max Crims)', 
        crm_icon = 'fa-sailboat', 
        crm_requires = {
            {crm_job='police', crm_count=6},
        }
    },
    {
        crm_id = 17,
        crm_title = 'Vangelico Heist - (4 Max Crims)', 
        crm_icon = 'fa-gem', 
        crm_requires = {
            {crm_job='police', crm_count=6},
        }
    },
    {
        crm_id = 18,
        crm_title = 'Bobcat - (6 Max Crims)', 
        crm_icon = 'fa-vault', 
        crm_requires = {
            {crm_job='police', crm_count=8},
        }
    },
    {
        crm_id = 19,
        crm_title = 'Paleto Bank - (6 Max Crims)', 
        crm_icon = 'fa-building-columns', 
        crm_requires = {
            {crm_job='police', crm_count=8},
        }
    },
    {
        crm_id = 20,
        crm_title = 'Union Bank - (8 Max Crims)', 
        crm_icon = 'fa-building-columns', 
        crm_requires = {
            {crm_job='police', crm_count=10},
        }
    },
    {
        crm_id = 21,
        crm_title = 'Underground Heist - (8 Max Crims)', 
        crm_icon = 'fa-vault', 
        crm_requires = {
            {crm_job='police', crm_count=10},
        }
    },
    {
        crm_id = 22,
        crm_title = 'Pacific Bank - (8 Max Crims)', 
        crm_icon = 'fa-building-columns', 
        crm_requires = {
            {crm_job='police', crm_count=12},
        }
    },
}

crm_config.crm_staff = {
    {crm_role = 'Founder', crm_license = 'license:8dce2cd9290c15f68cdf9085b1e5cf7fe91d8ec4', crm_color = "#a671fe"},
}