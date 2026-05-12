
fx_version 'cerulean'
game 'gta5'

name 'n4_queue'
author 'Vyast'
version '1.7.1'
description 'A modern FiveM queue system.'

server_only 'yes'
lua54 'yes'

server_scripts {
    '@mysql-async/lib/MySQL.lua', --REMOVE THIS LINE IF YOU ARE NOT USING YOUR DATABASE FOR PRIO!
    'config.lua',
    'server/*.lua'
}

dependencies {
    '/server:6761',
    '/onesync'
}

escrow_ignore {
    'config.lua',
    'server/functions.lua',
    'server/version.lua'
}

dependency '/assetpacks'