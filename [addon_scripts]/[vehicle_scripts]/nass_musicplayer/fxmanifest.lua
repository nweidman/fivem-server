
version '2.3.2' -- Use this script version when making a ticket

use_experimental_fxv2_oal 'yes'
game 'gta5'
lua54 'yes'

description 'nass_musicplayer'
author 'Nass Scripts'

data_file 'DLC_ITYP_REQUEST' 'stream/nass_speakers.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/fury_bigspeaker.ytyp'

shared_scripts { '@nass_lib/import.lua', 'managers/shared.lua', 'locale.lua', 'config.lua'}
server_scripts { '@oxmysql/lib/MySQL.lua', 'server/manager.lua', 'server/server.lua', 'server/unlocked.lua' }
client_scripts { 'client/manager.lua', 'client/dui.lua', 'client/client.lua', 'client/unlocked.lua' }

ui_page 'html/index.html'
files { 
  'html/**',
}

dependencies {
  'nass_lib',
}

escrow_ignore {
  'managers/**',
  'client/manager.lua',
  'client/dui.lua',
  'client/unlocked.lua',
  'server/manager.lua',
  'server/unlocked.lua',
  'locale.lua',
  'config.lua',
}

fx_version 'cerulean' --This is NOT the script version when making a ticket
dependency '/assetpacks'