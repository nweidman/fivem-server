
fx_version 'cerulean'
game 'gta5'

description 'ps-fuel'

version '2.0.0'

author 'github.com/Project-Sloth'

client_scripts {
    '@PolyZone/client.lua',
	'client/client.lua',
	'client/utils.lua'
}

server_scripts {
	'server/server.lua'
}

shared_scripts {
	'@ox_lib/init.lua',
	'@qbx_core/shared/locale.lua',
	'locales/en.lua',
	'locales/*.lua',
	'shared/config.lua',
}

exports {
	'GetFuel',
	'SetFuel',
}

lua54 'yes'
