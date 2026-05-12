

--
fx_version 'adamant'
game 'gta5'
description 'VNS Lucky Wheel - QB'
version '2.0.0'
lua54 'yes'


server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server.lua'
}

client_scripts {
	'config.lua',
	'client.lua',
}


escrow_ignore {
  '**/*',
  '*',
}
dependency '/assetpacks'
dependency '/assetpacks'