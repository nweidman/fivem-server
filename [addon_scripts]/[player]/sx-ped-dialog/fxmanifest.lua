
fx_version 'cerulean'
game 'gta5'

author 'igneliio | Syntaxa Scripts'
version '1.0.3'

lua54 'yes'
use_experimental_fxv2_oal 'yes'

shared_scripts {
  'config.lua'
}

client_scripts {
  'client/*.lua',
  'configuration/**/*.lua',
}

server_scripts {
  'server.lua',
}

ui_page {
  -- 'http://localhost:5173',
  'web/index.html'
}

escrow_ignore {
  "configuration/dialogs/*.lua",
  "configuration/CFunctions.lua",
  "config.lua",
  "web/*"
}

files {
  'web/**',
}
dependency '/assetpacks'