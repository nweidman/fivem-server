
fx_version "cerulean"

game "gta5"

author 'Project X'

description 'House Robbery V2 by Project X'

version '2.1.0'

shared_scripts{
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    "config/config.lua",
    "config/props-carry.lua",
    "config/house-presets.lua",
    "config/houses.lua",
    "config/tiers.lua",
    "config/contracts.lua",
    'locales/*.lua',
    'presets/*.lua',
}

client_scripts{
    '@mka-lasers/client/client.lua',
    'opensource/client/*.lua',
    'encrypted/client/*.lua',
}

server_scripts{
    'config/logs.lua',
    'opensource/server/*.lua',
    'encrypted/server/*.lua',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

lua54 "yes"

escrow_ignore {
    'config/*.lua',
    'locales/*.lua',
    'opensource/client/*.lua',
    'opensource/server/*.lua',
    'presets/*.lua',
}

dependency '/assetpacks'
dependency '/assetpacks'