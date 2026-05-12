fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'cofig.lua',
    'client.lua'
}

server_scripts {
    'config.lua',
    'server.lua'
}

dependencies {
    'ox_lib',
    'ox_inventory'
}
