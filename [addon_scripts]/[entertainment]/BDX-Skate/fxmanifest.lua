
fx_version 'cerulean'
game 'gta5'

name 'BDX-Skate'
description 'Skateboard - Classic street skating with fully customizable boards'
author 'Bodhix'
version '4.0.1'

lua54 'yes'

shared_scripts {
  'config.lua',
}

client_scripts {
  'client/*.lua',
}

server_scripts {
  'server/*.lua',
}

files {
  'nui/sounds/*.MP3',
  'stream/Add-ons/*.ydr',
  'stream/Skateboards/sktboard.yft',
  'stream/Skateboards/**/*.yft',
  'stream/Skateboards/**/*.ytyp',
  'stream/Anims/**.ycd',
  'server/version.json',
  'data/*.meta',
}

ui_page 'https://bodh1x.github.io/bdx-sport-hub/'
nui_page 'https://bodh1x.github.io/bdx-sport-hub/'

data_file "DLC_ITYP_REQUEST" "stream/Skateboards/Modern/Decks/Decks.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Skateboards/Modern/Trucks/Trucks.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/Skateboards/Modern/Wheels/Wheels.ytyp"
data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'


escrow_ignore {
  'config.lua',
}

dependencies {
  'BDX-Sport-Hub'
}
dependency '/assetpacks'