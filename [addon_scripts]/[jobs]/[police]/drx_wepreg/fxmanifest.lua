
fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'LSC - Kentain'
description 'Allow you to manually add weapon to Database for DRX MDT - QBCore Version'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    '@ox_lib/init.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

client_scripts {
    'client/*.lua'
}

