
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'CDev Development Team'
description 'Interactive Pet Script'
version "3.5.3"

ui_page 'html/index.html'

files {
    'html/**',
}

client_scripts {
    -- Dependencies
    '@cdev_lib/shared/external.lua',
    '@cdev_lib/shared/keys.lua',
    '@cdev_lib/shared/menu.lua',

    -- Public scripts
    'public/config/config.lua',
    'public/client/api.lua',
    'data/languages/*.lua',
    'public/config/anims.lua',
    'public/config/items.lua',
    'public/config/asset_to_pets.lua',
    'public/config/shop.lua',
    'public/config/pets.lua',

    -- Escrowed scripts
    'client/utils.lua',
    'client/main.lua',
    'client/pet.lua',
    'client/ui.lua',
    'client/shop.lua',
    'client/veterinary.lua',
    'client/petmanager.lua',
    'client/pettransfer.lua',
    'client/playershop/creator.lua',
    'client/playershop/shop.lua',
    'client/playershop/ui.lua',
    'shared/misc.lua',
}

server_scripts {
    -- Dependencies
    '@cdev_lib/shared/external.lua',

    -- Public scripts
    'public/config/anims.lua',
    'public/config/config.lua',
    'public/config/items.lua',
    'public/config/asset_to_pets.lua',
    'public/config/shop.lua',
    'public/config/pets.lua',
    'public/server/api.lua',

    -- Escrowed scripts
    'shared/misc.lua',
    'server/inventory.lua',
    'server/pet.lua',
    'server/main.lua',
    'server/playershop.lua',
    'data/languages/*.lua',
}

escrow_ignore {
    'public/config/config.lua',
    'public/config/items.lua',
    'public/config/asset_to_pets.lua',
    'public/config/shop.lua',
    'public/config/pets.lua',
    'public/config/anims.lua',

    'public/client/api.lua',
    'public/server/api.lua',
    'data/languages/*.lua',
}
dependencies {
    '/server:4752',
    'cdev_lib',
}

dependency '/assetpacks'