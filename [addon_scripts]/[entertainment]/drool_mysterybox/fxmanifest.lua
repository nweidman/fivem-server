
fx_version 'cerulean'
game 'gta5'

author 'Busterdrools'
description 'QBX MysteryBox Script'
version '1.0'

shared_scripts {
	'config.lua',
    '@ox_lib/init.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

ui_page 'web/index.html'

files {
    'web/*',
}

lua54 'yes'

dependency 'ox_lib'

dependency '/assetpacks'