
fx_version 'cerulean'
game 'gta5'
name 'BDX-Scooter'
description 'Scooter - Customizable scooters for urban mobility and street tricks'
author 'Bodhix'
version '1.3.0'
lua54 'yes'

shared_scripts {
    'config.lua',
}
client_scripts {
    'client/*.lua',
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

data_file "DLC_ITYP_REQUEST" 'stream/scooterx.ytyp'

escrow_ignore {
    'config.lua',
    'Whitelist.lua',
}

dependencies {
  'BDX-Sport-Hub'
}



dependency '/assetpacks'