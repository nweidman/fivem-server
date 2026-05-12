Config = {}

Config.PrintDebugMsgs = false

Config.Settings = {
    InventoryExport = exports.ox_inventory, -- Your OX inventory export here.
    
    AllowMultipleBags = false, -- If you want to allow players to have multiple of the same bag in their inventory set this to true. [Not Recommended] [I can't provide much support for this.]

    ExportItemList = false, -- If you want to (Auto Generate) export items.lua data to inv-data.txt set this to true. (Command = ExportAceData) [Only works in server console]
    GenerateShopData = false, -- Auto Generate info for 'ox_inventory\data\shops.lua' to 'ace_advanced_multipacks\shop-data.txt'

WhiteListedPeds = {
        Male = {
            'mp_m_freemode_01',
            'ig_cornwood',
            'pw_roscoe',
            'pw_andreas',
            'pw_hao',
            'pw_jiwon',
            'sl_fatcop_01',
            'ft-aushep',
            'ft-bloodhound',
            'pw_hendry',
            'ma_mizo',
            'ft-groe',
            'ft-pterrier',
            'max',
            'ft-pandags',
            'pw_george',
            'pw_carter80',
            'pw_andreas80',
            'tstudio_alvarg_eltuerto',
            's_m_m_gaffer_01',
            'a_m_y_methhead_01',
            'misscandy',
            'roy_ruckus',
            'John_Woody',
            'skeleton',
            'ig_max',

            -- Animals
            'k9dog',
            'a_c_husky',
            'a_c_aussiepup',
            'racoon_new',
            'bugk9',
            'bughusky',
            'ft-dobermanv2',
            'bugdoberman',
            'ft_dshepherd',
            'ft-amakita',
            'a_c_dalmatian',
            'a_c_shepherd',
            'golden_r',
        },

        Female = {
            'mp_f_freemode_01',
            'ig_cornwood',
            'pw_roscoe',
            'pw_andreas',
            'pw_hao',
            'pw_jiwon',
            'sl_fatcop_01',
            'ft-aushep',
            'ft-bloodhound',
            'pw_hendry',
            'ma_mizo',
            'ft-groe',
            'ft-pterrier',
            'max',
            'ft-pandags',
            'pw_george',
            'pw_carter80',
            'pw_andreas80',
            'tstudio_alvarg_eltuerto',
            's_m_m_gaffer_01',
            'a_m_y_methhead_01',
            'misscandy',
            'roy_ruckus',
            'John_Woody',
            'skeleton',
            'ig_max',

            -- Animals
            'k9dog',
            'a_c_husky',
            'a_c_aussiepup',
            'racoon_new',
            'bugk9',
            'bughusky',
            'ft-dobermanv2',
            'bugdoberman',
            'ft_dshepherd',
            'ft-amakita',
            'a_c_dalmatian',
            'a_c_shepherd',
        }
    }
}

Config.MultiPacks = {
    ['backpack'] = {
        label = 'Backpack', -- The name of the backpack.
        slots = 5, -- The number of slots the backpack has.
        weight = 17500, -- The weight of the backpack. [Grams] 1000g = 1Kg
        MaleComponent = { componentid = 5, drawable = 163, texture = 2 }, -- The Male component data for the backpack. 
        FemaleComponent = { componentid = 5, drawable = 158, texture = 2 }, -- The Female component data for the backpack. 
        disallowedItems = { GetList.largeWeapons }
    },

    ['backpack2'] = {
        label = 'Backpack', -- The name of the backpack.
        slots = 5, -- The number of slots the backpack has.
        weight = 17500, -- The weight of the backpack. [Grams] 1000g = 1Kg
        MaleComponent = { componentid = 5, drawable = 163, texture = 0 }, -- The Male component data for the backpack. 
        FemaleComponent = { componentid = 5, drawable = 158, texture = 0 }, -- The Female component data for the backpack. 
        disallowedItems = { GetList.largeWeapons }
    },

    ['backpack3'] = {
        label = 'Backpack', -- The name of the backpack.
        slots = 5, -- The number of slots the backpack has.
        weight = 17500, -- The weight of the backpack. [Grams] 1000g = 1Kg
        MaleComponent = { componentid = 5, drawable = 163, texture = 3 }, -- The Male component data for the backpack. 
        FemaleComponent = { componentid = 5, drawable = 158, texture = 3 }, -- The Female component data for the backpack. 
        disallowedItems = { GetList.largeWeapons }
    },

    ['backpack4'] = {
        label = 'Backpack', -- The name of the backpack.
        slots = 5, -- The number of slots the backpack has.
        weight = 17500, -- The weight of the backpack. [Grams] 1000g = 1Kg
        MaleComponent = { componentid = 5, drawable = 163, texture = 5 }, -- The Male component data for the backpack. 
        FemaleComponent = { componentid = 5, drawable = 158, texture = 5 }, -- The Female component data for the backpack. 
        disallowedItems = { GetList.largeWeapons }
    },

    ['backpack5'] = {
        label = 'Backpack', -- The name of the backpack.
        slots = 5, -- The number of slots the backpack has.
        weight = 17500, -- The weight of the backpack. [Grams] 1000g = 1Kg
        MaleComponent = { componentid = 5, drawable = 163, texture = 6 }, -- The Male component data for the backpack. 
        FemaleComponent = { componentid = 5, drawable = 158, texture = 6 }, -- The Female component data for the backpack. 
        disallowedItems = { GetList.largeWeapons }
    },

    ['backpack6'] = {
        label = 'Backpack', -- The name of the backpack.
        slots = 5, -- The number of slots the backpack has.
        weight = 17500, -- The weight of the backpack. [Grams] 1000g = 1Kg
        MaleComponent = { componentid = 5, drawable = 163, texture = 9 }, -- The Male component data for the backpack. 
        FemaleComponent = { componentid = 5, drawable = 158, texture = 9 }, -- The Female component data for the backpack. 
        disallowedItems = { GetList.largeWeapons }
    },

    ['backpack7'] = {
        label = 'Backpack', -- The name of the backpack.
        slots = 5, -- The number of slots the backpack has.
        weight = 17500, -- The weight of the backpack. [Grams] 1000g = 1Kg
        MaleComponent = { componentid = 5, drawable = 163, texture = 12 }, -- The Male component data for the backpack. 
        FemaleComponent = { componentid = 5, drawable = 158, texture = 12 }, -- The Female component data for the backpack. 
        disallowedItems = { GetList.largeWeapons }
    },

    ['backpack8'] = {
        label = 'Backpack', -- The name of the backpack.
        slots = 5, -- The number of slots the backpack has.
        weight = 17500, -- The weight of the backpack. [Grams] 1000g = 1Kg
        MaleComponent = { componentid = 5, drawable = 163, texture = 13 }, -- The Male component data for the backpack. 
        FemaleComponent = { componentid = 5, drawable = 158, texture = 13 }, -- The Female component data for the backpack. 
        disallowedItems = { GetList.largeWeapons }
    },

    ['backpack9'] = {
        label = 'Backpack', -- The name of the backpack.
        slots = 5, -- The number of slots the backpack has.
        weight = 17500, -- The weight of the backpack. [Grams] 1000g = 1Kg
        MaleComponent = { componentid = 5, drawable = 163, texture = 1 }, -- The Male component data for the backpack. 
        FemaleComponent = { componentid = 5, drawable = 158, texture = 1 }, -- The Female component data for the backpack. 
        disallowedItems = { GetList.largeWeapons }
    },

    ['backpack10'] = {
        label = 'Backpack', -- The name of the backpack.
        slots = 10, -- The number of slots the backpack has.
        weight = 20000, -- The weight of the backpack. [Grams] 1000g = 1Kg
        MaleComponent = { componentid = 5, drawable = 124, texture = 0 }, -- The Male component data for the backpack. 
        FemaleComponent = { componentid = 5, drawable = 174, texture = 0 }, -- The Female component data for the backpack. 
        disallowedItems = { GetList.largeWeapons }
    },

    -- ['duffelpack'] = {
    --     label = 'Duffle Pack',
    --     slots = 15,
    --     weight = 20000,
    --     MaleComponent = { componentid = 5, drawable = 45, texture = 0 },
    --     FemaleComponent = { componentid = 5, drawable = 45, texture = 0 }
    -- },

    -- ['fannypack'] = {
    --     label = 'Fanny Pack',
    --     slots = 4,
    --     weight = 5500,
    --     MaleComponent = { componentid = 5, drawable = 112, texture = 0 },
    --     FemaleComponent = { componentid = 5, drawable = 112, texture = 0 },
    --     disallowedItems = { GetList.largeWeapons, GetList.mediumWeapons, GetList.utilityWeapons }
    -- },

    -- ['beachbag'] = {
    --     label = 'Beach Bag',
    --     slots = 8,
    --     weight = 7500, 
    --     MaleComponent = { componentid = 5, drawable = 113, texture = 0 },
    --     FemaleComponent = { componentid = 5, drawable = 113, texture = 0 },
    --     disallowedItems = { GetList.largeWeapons, GetList.mediumWeapons }
    -- },

    -- ['gunpack1'] = {
    --     label = 'Weapon Carry Case Small',
    --     slots = 2,
    --     weight = 9000,
    --     MaleComponent = { componentid = 5, drawable = 114, texture = 0 },
    --     FemaleComponent = { componentid = 5, drawable = 114, texture = 0 },
    --     onlyAllowedItems = { GetList.smallWeapons },
    -- },

    -- ['gunpack2'] = {
    --     label = 'Weapon Carry Case Large',
    --     slots = 4,
    --     weight = 15000,
    --     MaleComponent = { componentid = 5, drawable = 115, texture = 0 },
    --     FemaleComponent = { componentid = 5, drawable = 115, texture = 0 },
    --     onlyAllowedItems = { GetList.AllWeapons },
    -- },

    -- ['hikingbag1'] = {
    --     label = 'Hiking Bag Small',
    --     slots = 10,
    --     weight = 9000,
    --     MaleComponent = { componentid = 5, drawable = 116, texture = 0 },
    --     FemaleComponent = { componentid = 5, drawable = 116, texture = 0 },
    --     disallowedItems = { GetList.largeWeapons }
    -- },

    -- ['hikingbag2'] = {
    --     label = 'Hiking Bag Large',
    --     slots = 20,
    --     weight = 30000,
    --     MaleComponent = { componentid = 5, drawable = 117, texture = 0 },
    --     FemaleComponent = { componentid = 5, drawable = 117, texture = 0 }
    -- },

    -- ['acemedicbag1'] = {
    --     label = 'Paramedic Bag HandHeld',
    --     slots = 10,
    --     weight = 15000,
    --     MaleComponent = { componentid = 5, drawable = 118, texture = 0 },
    --     FemaleComponent = { componentid = 5, drawable = 118, texture = 0 },
    --     disallowedItems = { GetList.AllWeapons }
    -- },

    -- ['briefcase1'] = {
    --     label = 'Metal Briefcase',
    --     slots = 5,
    --     weight = 12000,
    --     MaleComponent = { componentid = 5, drawable = 119, texture = 0 },
    --     FemaleComponent = { componentid = 5, drawable = 119, texture = 0 },
    --     disallowedItems = { GetList.largeWeapons }
    -- },
    -- ['briefcase2'] = {
    --     label = 'Leather Briefcase',
    --     slots = 8,
    --     weight = 8000,
    --     MaleComponent = { componentid = 5, drawable = 120, texture = 0 },
    --     FemaleComponent = { componentid = 5, drawable = 120, texture = 0 },
    --     disallowedItems = { GetList.largeWeapons }
    -- },
}

Config.NotificationsHolder = { -- No need to modify these.
    message1 = 'Couldn\'t complete action!',
    message2 = 'You can only have 1 bag in your inventory!',
    message3 = 'You can\'t stack this Bag within another item!',
    message4 = 'You can\'t buy more than 1 bag!',
    message5 = 'You cannot put this item in your bag!',
    message6 = 'You are not allowed to use backpacks!'
}