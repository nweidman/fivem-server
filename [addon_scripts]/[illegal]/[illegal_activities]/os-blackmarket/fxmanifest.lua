
fx_version 'cerulean'

name 'os-blackmarket'
author 'synthor'
version '1.0.0'

game 'gta5'
lua54 'yes'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/app.js'
}

shared_scripts {
    '@ox_lib/init.lua',
    '@sd_lib/init.lua',
    'config/config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

dependency 'ox_lib'
dependency 'sd_lib'

lua54 'yes'
escrow_ignore { '**/**' }

dependency '/assetpacks'