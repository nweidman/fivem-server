fx_version 'cerulean'
game 'gta5'

lua54 'yes'

shared_scripts {
    'config.lua'
}

server_scripts {
    'editable_server.lua',
	'server.lua'
}

client_scripts {
    'editable_functions.lua',
	'client.lua',
}

escrow_ignore {
    '[items]',
    'config.lua',
    'editable_functions.lua',
    'editable_server.lua',
    'server.lua'
}
dependency '/assetpacks'