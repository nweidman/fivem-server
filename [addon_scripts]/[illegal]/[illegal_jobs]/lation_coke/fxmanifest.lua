
fx_version 'cerulean'
lua54 'yes'
game 'gta5'
name 'lation_coke'
author 'Lation'
version '1.1.0'
description 'An advanced coke resource for FiveM table module'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'bridge/server.lua',
    'config/server.lua',
    'server/*.lua',

    -- coke table module
    'os_table/server/main.lua',
}

client_scripts {
    'bridge/client.lua',
    'config/client.lua',
    'client/*.lua',

    -- coke table module
    'os_table/client/main.lua',
}

shared_scripts {
    '@ox_lib/init.lua',
    'config/shared.lua',
    'config/icons.lua',

    -- coke table module
    'os_table/shared/locale.lua',
    'os_table/shared/config.lua',
}

files {
    'stream/*.ytyp',
    'stream/*.ydr',
    'locales/*.json',
    'labs/*.png',
    'labs/*.jpg',
    'labs/*.jpeg',
}

data_file 'DLC_ITYP_REQUEST' 'stream/*.ytyp'

dependencies {
    'oxmysql',
    'ox_lib',

    -- coke table module deps
    'ox_inventory',
    'ox_target',
    'qbx_core'
}

ox_libs {
    'locale',
    'math'
}

escrow_ignore {
    'config/*.lua',
    'locales/*.json',
    'client/functions.lua',
    'server/functions.lua',
    'bridge/*.lua',

    -- allow editing module config/locales if needed
    'os_table/shared/config.lua',
    'os_table/locales/*.json',
    'os_table/client/main.lua',
    'os_table/server/main.lua'
}

dependency '/assetpacks'
