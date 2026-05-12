
fx_version 'cerulean'
game 'gta5'

lua54 'yes'

shared_scripts {
    'config.lua'
}

server_scripts {
    'editable_webhook.lua',
	'server.lua'
}

client_scripts {
    'editable_functions.lua',
	'client.lua',
    'drilling.lua',
    'safecrack.lua',
}

escrow_ignore {
    '[items]',
    'server.lua',
    'config.lua',
    'editable_functions.lua',
    'editable_webhook.lua'
}
dependency '/assetpacks'