
fx_version 'cerulean'
game 'gta5'

name "um-tutorial"
description "Tutorial Script for FiveM"
author "uyuyorum store"
version "2.0.0"

lua54 'yes'
use_experimental_fxv2_oal 'yes'
nui_callback_strict_mode 'true'

files {
	'config.lua',
	'web/build/**'
}

ui_page 'web/build/index.html'

shared_scripts {
	'@ox_lib/init.lua',
	'utils/*.lua',
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'bridge/*.lua',
	'server/*.lua'
}

escrow_ignore {
	'config.lua',
	'bridge/*.lua',
	'server/*.lua',
	'utils/*.lua'
}

dependency '/assetpacks'