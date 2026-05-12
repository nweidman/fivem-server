fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Storm'
description 'Storm Merryweather Robbery'
version '1.1.3'


shared_scripts {
    'shared/config.lua',
    '@ox_lib/init.lua',
}

client_scripts {
    'client/client.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
}

server_scripts {
    'server/server.lua',
}