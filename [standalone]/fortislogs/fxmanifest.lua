
fx_version "cerulean"
games { "gta5" }

author "Finn Paes"
description "Custom logging solution, alternative to FortisLogs"
version "1.0.0"


client_scripts {
    "lua/client.lua"
}

server_scripts {
    "config.lua",
    "lua/server.lua"
}

exports {
    "addLog"
}

server_exports {
    "addLog"
}