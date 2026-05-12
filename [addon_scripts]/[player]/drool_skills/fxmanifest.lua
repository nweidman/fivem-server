
fx_version 'cerulean'
game 'gta5'

author 'Busterdrools'
description 'QBX Skills System'
version '1.0'

shared_scripts {
	'config.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client.lua'
}

server_scripts {
    'server.lua'
}

ui_page 'web/skills.html'

files {
    'web/*'
}

lua54 'yes'

dependency 'ox_lib'