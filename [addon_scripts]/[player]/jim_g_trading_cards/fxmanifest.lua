fx_version 'cerulean'
game 'gta5'

author 'Jim G'
description 'Holographic Trading Card System'
version '1.1.5'

shared_scripts { 'configs_settings/config.lua', 'configs_settings/configcards.lua', 'configs_settings/configshop.lua', 'configs_settings/configbooster.lua', 'configs_settings/configcollector.lua' }

client_scripts { 'client/main.lua' }

server_scripts { 'server/webhooks.lua', 'server/main.lua' }

ui_page 'ui/h/index.html'

files {	'locales/*.*', }

files { 'ui/h/index.html', 'ui/c/*.css', 'ui/j/*.js', 'ui/h/*.html', 'ui/i/*.webp', 'ui/i/*.png', 'ui/i/*.jpg', 'ui/i/*.jpeg', 'ui/inv_images/*.webp', 'ui/inv_images/*.png', 'ui/inv_images/*.jpg', 'ui/inv_images/*.jpeg', 'ui/s/*.mp3' }

escrow_ignore {	'configs_settings/config.lua', 'server/webhooks.lua', 'configs_settings/configcards.lua', 'configs_settings/configshop.lua', 'configs_settings/configbooster.lua', 'configs_settings/configcollector.lua' }

dependencies {	'/onesync',	'community_bridge', 'jim_g_trading_cards_props', }

dependency '/assetpacks'