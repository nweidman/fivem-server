
fx_version 'cerulean'
game 'gta5'
name 'BDX-Rollers'
description 'Street skating with customizable retro and modern roller skates'
author 'Bodhix'
version '1.2.0'
lua54 'yes'

shared_scripts {
    'config.lua',
}
client_scripts {
    'client/Rollers.lua',           
    'client/store-preview.lua',      
}
server_scripts {
    'server/*.lua',
    'Whitelist.lua'
}
files {
    'data/*.meta',
    'nui/sounds/*.MP3',               
    'stream/anims/*.ycd',
    'server/version.json',
    'stream/models/*.yft',
}

ui_page 'https://bodh1x.github.io/bdx-sport-hub/'
nui_page 'https://bodh1x.github.io/bdx-sport-hub/'

data_file 'HANDLING_FILE' 'data/handling.meta'

escrow_ignore {
    'config.lua',
    'Whitelist.lua',
    'client/Rollers-Store.lua',
    'server/Rollers-Store-sv.lua',
}

dependencies {
  'BDX-Sport-Hub'
}


dependency '/assetpacks'