
-- FXVersion Version
fx_version 'cerulean'
game 'gta5'

author 'Buster'
description 'Simple script to use bzzz Photography light props'
version '1.0.0'

shared_script {
    '@ox_lib/init.lua',
    '@Renewed-Lib/init.lua',
    'config.lua'
}

server_script {
    'server/server.lua'
}

client_script {
    'client/client.lua'
}

dependencies {
    'Renewed-Lib',
    'ox_lib',
    'ox_inventory'
}