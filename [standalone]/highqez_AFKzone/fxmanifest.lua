
--
fx_version 'adamant'
game 'gta5'
lua54 'yes'

name 		'highqez_AFKzone'
author 		'HighQez'
version     '1.0.7'
description 'Advanced zone script with safezone and AFK zone highly customizable'


ui_page 'html/ui.html'

files {
	'html/afkzone.png',
	'html/safezone.png',
	'html/script.js',
	'html/style.css',
	'html/ui.html'
}

shared_scripts {
    'Unlocked/config.lua',
    'Unlocked/strings.lua'
}

server_scripts {
    'Unlocked/sv_function.lua',
    'Locked/server.lua',
    'Locked/version.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/ComboZone.lua',
    'Unlocked/cl_function.lua',
    'Locked/client.lua',
}

dependencies {
    'PolyZone'
}

escrow_ignore {
    'Unlocked/config.lua',
    'Unlocked/strings.lua',
    'Unlocked/cl_function.lua',
    'Unlocked/sv_function.lua'
}
 
dependency '/assetpacks'