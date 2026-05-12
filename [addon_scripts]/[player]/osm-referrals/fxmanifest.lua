
fx_version 'cerulean'
game 'gta5'

name 'osm-referrals'
description 'Referrals Script for QBCore Framework'
version '1.0.2'

author 'OSMIUM | discord.io/osmiumfx | https://osmfx.tebex.io | Special Credits - DoremonHN'

ui_page 'html/index.html'

files {
  'html/index.html',
  'html/img/*.png',
  'html/script.js',
  'html/style.css',
}

shared_scripts {
	"config.lua"
}

client_script {
  "client/client.lua"
}
server_script {
  "server/server.lua",
  "@oxmysql/lib/MySQL.lua"
}

