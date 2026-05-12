
fx_version 'cerulean'
game 'gta5'
author 'CoreM © 2025'
description 'crm-shopscreator'
version '1.0.3'
lua54 'yes'

shared_scripts {
    "@crm-core/crm-main/crm-init.lua",
    "@ox_lib/init.lua",
    "crm-config/crm-config.lua",
}

client_scripts {
    "crm-modules/crm-client/crm-main.lua",
    "crm-modules/crm-client/crm-shops.lua",
    "crm-open/crm-client/*.lua",
}

server_scripts {
    "crm-modules/crm-server/crm-main.lua",
    "crm-open/crm-server/*.lua",
}

escrow_ignore {
    'crm-config/*.lua',
    'crm-open/**/*.lua',
}

ui_page 'crm-web/crm-interface.html'

files { 
    'crm-locales/*.json',
    'crm-web/crm-interface.html',
    'crm-web/crm-scripts/*.js',
    'crm-web/crm-styles/*.css',
}

dependencies {
    'crm-core',
    'ox_lib'
}
dependency '/assetpacks'