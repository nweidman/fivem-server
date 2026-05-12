
fx_version 'bodacious'
game 'gta5'

name "BetterFight Evolved"
description "A better fighting system for FiveM."
author "Cisoko"
version "2.1.0"
lua54 'yes'
escrowed 'yes'

client_scripts {
    'utils.lua',
    'client/mainLoop.lua',
    'client/events.lua',
    'client/recoil.lua',
    'client/components.lua',
    'client/crosshair.lua',
    'client/jumpSpamPrevention.lua',
    'client/weaponDamage.lua',
    'client/rollPrevention.lua',
    'client/meleeOneShotPrevention.lua',
    'client/framework.lua',
    'client/removeWhipping.lua',
    'client/viewCamForcer.lua',
    'client/removeHeadshots.lua',
    'client/triggerbot.lua',
}

server_scripts {
    'configs/master_config.lua',
    'configs/security_config.lua',
    'configs/discordLogs_config.lua',
    'configs/weapons_config/pistols_config.lua',
    'configs/weapons_config/smgs_config.lua',
    'configs/weapons_config/shotguns_config.lua',
    'configs/weapons_config/snipers_config.lua',
    'configs/weapons_config/rifles_config.lua',
    'configs/weapons_config/heavy_config.lua',
    'configs/weapons_config/melee_config.lua',
    'server/versionCheck.lua',
    'server/events.lua',
    'server/meleeOneShotPrevention.lua',
    'server/framework.lua',
    'server/discord.lua',
}

shared_script {
    'shared/security_encrypted.lua',
    'shared/exports.lua',
}

ui_page "client/html/index.html"

files {
    'client/html/index.html',
    'client/html/css/style.css',
    'client/html/js/script.js'
}

escrow_ignore  {
    'configs/master_config.lua',
    'configs/security_config.lua',
    'configs/discordLogs_config.lua',
    'configs/weapons_config/pistols_config.lua',
    'configs/weapons_config/smgs_config.lua',
    'configs/weapons_config/shotguns_config.lua',
    'configs/weapons_config/snipers_config.lua',
    'configs/weapons_config/rifles_config.lua',
    'configs/weapons_config/heavy_config.lua',
    'configs/weapons_config/melee_config.lua',
    'configs/weapons_config/machineguns_config.lua',
    'server/framework.lua',
    'client/framework.lua',
    'shared/exports.lua',
}
dependency '/assetpacks'