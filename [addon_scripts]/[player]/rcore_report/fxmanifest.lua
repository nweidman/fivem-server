
fx_version 'bodacious' 
games { 'gta5' }

author 'Isigar <info@rcore.cz>'
description 'rcore_reports'
version '1.3.25'

ui_page 'client/ui/index.html'

lua54 'yes'

dependencies {
    '/server:4752',
    'oxmysql'
}

files {
    'client/ui/*.js',
    'client/ui/*.html',
    'client/ui/*.css',
    'client/ui/*.png',
    'client/ui/*.jpg',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    -- '@mysql-async/lib/MySQL.lua',
    'permissions.lua',
    'sconfig.lua',

    'server/init/init.lua',
    'server/lib/deployFile/*.lua',
    'server/lib/ace.lua',
    'server/lib/sharedObject.lua',
    'server/api/date.lua',
    'server/api/inventory.lua',
    'server/api/identifiers.lua',
    'server/api/notifications.lua',
    'server/api/permissions.lua',
    'server/api/rcoreStats.lua',
    'server/api/reportInteractions.lua',
    'server/api/reports.lua',
    'server/api/sql.lua',
    'server/api/txAdminHandle.lua',
    'server/lib/consoleLog.lua',
    'server/lib/customPlayerData.lua',
    'server/lib/databaseAutoClear.lua',
    'server/lib/inventory.lua',
    'server/lib/statistics.lua',
    'server/service/admins.lua',
    'server/service/permissions.lua',
    'server/model/chatMessage.lua',
    'server/model/logger.lua',

    'server/api/discord.lua',
    'server/model/chatRoom.lua',
    'server/model/player.lua',
    'server/service/players.lua',
    'server/model/adminChatRoom.lua',
    'server/model/report.lua',
    'server/lib/adminDuty.lua',
    'server/lib/screenshots.lua',
    'server/service/adminChat.lua',
    'server/service/messages.lua',
    'server/service/reports.lua',
    'server/service/tags.lua',
    'server/lib/player.lua',
    'server/lib/playerSpawn.lua',
    'server/api/player.lua',
    'server/api/commands.lua',
    'server/lib/events.lua',
    
    'server/main.lua',
}

client_scripts {
    'client/init/*.lua',
    'client/api/*.lua',
    'client/util/*.lua',
    'client/lib/*.lua',
    'client/*.lua',
}

shared_scripts {
    'shared/const/*.lua',
    'shared/const.lua',
    'config.lua',
    'shared/*.lua',
    'locales/*.lua',
}

escrow_ignore {
    'client/api/*.lua',
    'server/api/**/*.lua',
    'client/util/**/*.lua',
    'config.lua',
    'sconfig.lua',
    'permissions.lua',
    'locales/**/*.lua',
    'shared/**/*.lua',
    'assets/**/*.lua',
}

dependency '/assetpacks'