
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'CS'
description 'Combat Log Ghost'
version '1.1.0'

shared_scripts {
  '@ox_lib/init.lua',
  'config.lua',
}

client_scripts { 'client.lua' }
server_scripts { 'server.lua' }

dependencies {
  'qbx_core',
  'ox_lib',
  'ox_target',
}
