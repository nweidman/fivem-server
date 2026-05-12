
version '2.2.0'
author 'Code-Forge'
description 'Advanced Lottery System V2'

fx_version 'cerulean'
game 'gta5' 
lua54 'yes'

shared_scripts { 'shared/*' }

client_scripts { 'client/*' }

server_scripts { 'server/*' }

ui_page 'html/index.html'

files { 'html/*', 'html/js/*', 'html/css/*', 'html/assets/images/*', 'html/assets/sounds/*', 'html/assets/svgs/*' }

escrow_ignore {
    'shared/config.lua',
    'server/config_server.lua',
}
dependency '/assetpacks'