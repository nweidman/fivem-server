
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'AceStudios - AceCrypto'
description 'Advanced MultiPack Inventory System [Made for Ox Inventory]'
version '1.4.1'

client_scripts {
    'client/c-multipacks.lua'
}

server_scripts {
  'server/loader.lua',
  'server/s-itemdata-handler.lua',
  'server/s-shopdata-handler.lua',
  'server/s-multipacks.lua',
  'server/server.lua',
}

shared_scripts {
  '@ox_lib/init.lua',
  'weapons_list.lua',
  'config.lua',
  'LockedConfig.lua'
}

files {
    'stream/*.ydr',
    'stream/*.ytp',
    'meta/mp_m_freemode_01_ace_advanced_multipacks.meta',
    'meta/mp_f_freemode_01_ace_advanced_multipacks.meta'
}

data_file 'SHOP_PED_APPAREL_META_FILE' 'meta/mp_m_freemode_01_ace_advanced_multipacks.meta'
data_file 'SHOP_PED_APPAREL_META_FILE' 'meta/mp_f_freemode_01_ace_advanced_multipacks.meta'

escrow_ignore {
  'weapons_list.lua',
  'config.lua',
  'inv-data.txt',
  'shop-data.txt',
  'README.md'
}

dependency '/assetpacks'