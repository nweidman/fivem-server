
games {
    "gta5"
}

version "1.0.5"

fx_version "cerulean"

nui_callback_strict_mode 'true'

lua54 "yes"

ui_page "src/web/dist/index.html"

files {
    "src/web/dist/index.html",
    "src/web/dist/**/*"
}

shared_scripts {
    '@ox_lib/init.lua',
    'locales/*.lua',
    "config.lua",
    'src/resource/shared/**/*.lua',
}

client_scripts {
    'src/resource/client/**/*.lua',
    'frameworks/qbox/client.lua',
    'frameworks/esx/client.lua',
    'frameworks/qbcore/client.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'src/resource/server/**/*.lua',
    'frameworks/qbox/server.lua',
    'frameworks/esx/server.lua',
    'frameworks/qbcore/server.lua'
}

dependencies {
    "ox_lib"
}

escrow_ignore {
    'config.lua',
    'frameworks/**/*.lua',
    'locales/*.lua',
    'src/resource/shared/funcs.lua',
    'client/frameworks/*.lua',
}

dependency '/assetpacks'