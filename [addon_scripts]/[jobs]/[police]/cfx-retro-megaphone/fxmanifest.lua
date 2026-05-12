fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'AP System for emergency (and not only) vehicles'
author 'hearondale'
version '2.0.2'

shared_scripts  {
    'config.lua'
}
client_scripts {
    'api/*.lua',
    'client/*.lua',
    'inventory/client.lua',
}
server_scripts {
    'server/*.lua',
}

escrow_ignore {
    'config.lua',
    'inventory/client.lua',
    'api/onUseMegaphone.lua'
}


dependency '/assetpacks'