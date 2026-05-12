
fx_version 'cerulean'
game 'gta5'

name "um-chat"
author "uyuyorum store"
version "3.3.0"
description "UM - Chat"

shared_scripts {
    '@ox_lib/init.lua',
    'tools/debug.lua'
}

ui_page 'web/build/index.html'

files {
    'locales/*.json',
    'web/build/**',
    'config/chat.lua',
    'config/nui.lua',
    'config/commands.lua',
    'tools/drawtext.lua',
}

client_scripts {
    'lua/commandChat/cl_main.lua',
    'lua/generalChat/cl_main.lua',
    'lua/commands/actions/actions_cl.lua',
    'lua/commands/typing/typing_cl.lua',

}

server_scripts {
    'config/permission.lua',
    'config/automessage.lua',

    'bridge/*.lua',
    'tools/logs.lua', -- more secure

    'lua/commands/modules/**',

    'lua/commandChat/sv_main.lua',
    'lua/generalChat/sv_main.lua',

    'lua/commands/actions/actions_sv.lua',
    'lua/commands/others/*.lua',
    'lua/commands/typing/typing_sv.lua',
}


escrow_ignore {
    'bridge/*.lua',
    'config/*.lua',
    'lua/commandChat/*.lua',
    'lua/commands/modules/**',
    'lua/commands/others/**',
    'tools/*.lua'
}

dependencies {
    '/server:17000',
    'ox_lib'
}

lua54 'yes'
nui_callback_strict_mode 'true'
use_experimental_fxv2_oal 'yes'

dependency '/assetpacks'