
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

version '1.0'

client_script 'client.lua'

shared_scripts {
  '@ox_lib/init.lua',
  'config.lua',
}

server_script 'server.lua'
