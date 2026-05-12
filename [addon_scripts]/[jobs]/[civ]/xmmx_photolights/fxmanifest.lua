
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'XMMX DEVELOPMENT'
description 'Photography Lights Script'
version '1.3'

shared_scripts { 
	'@ox_lib/init.lua', 
	'@lation_ui/init.lua',
	'config.lua' 
}

client_scripts {
	'bridge/client.lua',
	'client/**/*' 
}

server_scripts { 
	'@oxmysql/lib/MySQL.lua',
	'bridge/server.lua',
	'server/webhook.lua',
	'server/main.lua'  
}

ui_page 'web/index.html'
files { 'web/index.html', 'web/**/*' }

escrow_ignore { 'bridge/**/*', 'server/webhook.lua', 'config.lua', 'README.md' }
dependency '/assetpacks'