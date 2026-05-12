
fx_version 'cerulean'
game 'gta5'

name 'is-playerstyles'
author 'OS'
version '2.1.0'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua',
    'locale/*.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

escrow_ignore {
    'shared/config.lua',
    'locale/*.lua',
    'client/main.lua',
    'server/main.lua'
}

dependency '/assetpacks'
