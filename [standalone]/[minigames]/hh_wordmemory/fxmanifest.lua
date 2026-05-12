
fx_version 'cerulean'
game 'gta5'

author 'HSoulReaperH'
description 'Cable Untangle Minigame for FiveM'
version '1.0.0'

client_scripts {
    'c.lua'
}

ui_page 'ui.html'

files {
    'ui.html',
    'script.js',
    'style.css'
}

export 'startWordMemory'
export 'isWordMemoryActive' 
export 'closeWordMemory'

dependencies {
    '/onesync'
}