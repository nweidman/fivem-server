

fx_version "cerulean"

description "Illegal Doctor"
author ""
version '1.0.0'

lua54 'yes'

games {
  "gta5",
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_script "client/**/*"
server_script "server/**/*"