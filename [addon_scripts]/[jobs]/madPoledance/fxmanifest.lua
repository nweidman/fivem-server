
fx_version "cerulean"
game "gta5"

lua54 'yes'

author 'MadCore'
description 'madPoledance -madPoledance – Player & NPC Pole Dance System'
version '1.2.1'

escrow_ignore {
    'config.lua',
}

client_scripts {
    "client.lua",
}
server_scripts {
    "server.lua",
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
}

dependencies {
    'ox_lib',
}


dependency '/assetpacks'