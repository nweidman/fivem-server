Config = Config or {}

local whitelist = {
     models = {
          -- if a vehicle model exist in models script will skip class check!
          -- 'fiat600',
          'bll1rb',
          'bll2rb',
          'bll3rb',
          'bll4rb',
          'bll5rb',
          'bll6rb',
          'bll7rb',
          'bpunrumporb',
          'll3bb',
          'll4bb',
          'll5bb',
          'll6bb',
          'll7bb',
          'bcat',
          'apoliceu9',
          'apoliceu15',
          'apoliceub',
          'apoliceu7',
          'apoliceu6',
          'spvdjv', -- Cam 1of1
          'rrkurumaxzm', -- Slappy 1of1
          'rrseminalhawkxz', -- Weaver 1of1
          'umcs21bb', -- Weaver 1of1
          'nm_beast', -- Kiara 1of1
     },
     classes = {
          -- https://docs.fivem.net/natives/?_0x29439776AAA00A62
          18 -- emergency
     },
     jobs = { 'police', 'sheriff' },
     key_cutting_citizenid = {
          'IFD87837'
     }
}

Config.gunrack = {
     keybind = '9',
     install_duration = 3, --sec
     opening_duration = 3, --sec
     while_open_animation = true, -- while inventory screen is on
     slots = 5,
     size = 100000,
     whitelist = whitelist,
     disable_job_check = false, -- make sure it's fakse if your not using keys or everybody can unlock gunracks
     -- optional make sure you did optional part of installation
     use_keys_to_unlock_gunrack = false,
     cutting_duration = 3,
     stash_prefix = 'Gunrack_'
}
