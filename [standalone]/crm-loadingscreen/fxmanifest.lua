fx_version 'cerulean'
game 'gta5'
author 'CoreM © 2025'
description 'crm-loadingscreen'
version '2.0.0'
lua54 'yes'

shared_scripts {
    "@crm-core/crm-main/crm-init.lua",
    'crm-config/crm-config.lua',
}

ui_page 'crm-web/crm-interface.html'

client_scripts {
    'crm-modules/crm-client/crm-data.lua',
    'crm-modules/crm-client/crm-main.lua',
}

server_scripts {
    'crm-modules/crm-server/crm-main.lua',
}

escrow_ignore {
    'crm-config/*.lua',
}

loadscreen 'crm-web/crm-build.html'
loadscreen_manual_shutdown "yes"
loadscreen_cursor 'yes'

files { 
    'crm-web/crm-interface.html',
    'crm-web/crm-build.html',
    'crm-web/crm-scripts/*.js',
    'crm-web/crm-styles/*.css',
    'crm-web/crm-files/**',
    'crm-modules/crm-templates/**',
}

dependencies {
    'crm-core',
}
dependency '/assetpacks'