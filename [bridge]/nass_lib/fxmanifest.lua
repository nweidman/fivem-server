
fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
game 'gta5'
lua54 'yes'

description 'Nass lib'
author 'Nass#1411'
version '1.3.2'

shared_scripts { 'config.lua', 'utils/shared.lua', }

client_scripts {    
  '@ox_lib/init.lua', 
  'utils/**/client.lua',
  'frameworks/**/client.lua',
  'inventories/**/client.lua',
  'targets/*.lua',
  'overrides/**/client.lua',
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'utils/**/server.lua',
  'frameworks/**/server.lua',
  'inventories/**/server.lua',
  'overrides/**/server.lua',
}

escrow_ignore {
  'config.lua',
  'frameworks/**',
  'targets/**',
  'utils/**',
  'inventories/**',
  'overrides/**',
}

files {
  'import.lua',
}

dependencies {
	'ox_lib',
}
dependency '/assetpacks'