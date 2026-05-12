
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Sky-Systems'
description 'Base resource for all Sky-Systems Scripts'
version '1.1'

escrow_ignore 'config/**'

shared_scripts {
    'config/config.lua',
    'config/locales/*.lua',
    'config/functions.lua',
    'source/shared/init.lua',
    'source/shared/modules/*.lua',
    'source/shared/main.lua',
    'source/shared/set_config.lua',
}
server_scripts {
    -- '@vrp/lib/utils.lua',
    '@mysql-async/lib/MySQL.lua',
    'config/framework/*.lua',
    'config/sv_config.lua',
    'config/sv_functions.lua',
    'config/garage/*.lua',
    'config/phone/*.lua',
    'config/billing/*.lua',
    'source/server/main.lua',
    'source/server/modules/*.lua'
}
client_scripts {
    -- '@vrp/client/Proxy.lua',
    -- '@vrp/client/Tunnel.lua',
    'source/client/main.lua',
    'source/client/modules/*.lua',
    'source/client/events.lua',
    'config/framework/*.lua',
}

files {
    'source/import.lua'
}

dependency '/assetpacks'