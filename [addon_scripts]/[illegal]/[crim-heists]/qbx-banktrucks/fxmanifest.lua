
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'OS'
version '1.0.0'

shared_script {
    '@ox_lib/init.lua',
    'shared/sh_config.lua'
}

client_scripts {
    'client/cl_main.lua'
}

server_scripts {
    'server/sv_main.lua'
}
