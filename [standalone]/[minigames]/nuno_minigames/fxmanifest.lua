
fx_version "cerulean"
game "gta5"

author "Nuno Radio Man"

resource_name "[Minigame] Minigames"
resource_version "1.0.1"
resource_version_checker "minigames"

dependencies {
    "/server:7290",
}

lua54 "yes"

client_scripts{
    "cfg/cfg.lua",
    "cfg/cfg_bruteforce.lua",
    "cfg/cfg_circuitbreaker.lua",
    "cfg/cfg_datacrack.lua",
    "cfg/cfg_fingerprintclone.lua",
    "cfg/cfg_fingerprinthack.lua",
    "cfg/cfg_hackconnect.lua",
    "cfg/cfg_memoryhack.lua",
    "cfg/cfg_pcbhack.lua",
    "cfg/cfg_serverhack.lua",
    "cfg/cfg_tacticalinput.lua",
    "cfg/cfg_voltlab.lua",
    "cfg/cfg_wordguess.lua",

    "client/client_bruteforce.lua",
    "client/client_circuitbreaker.lua",
    "client/client_datacrack.lua",
    "client/client_fingerprintclone.lua",
    "client/client_fingerprinthack.lua",
    "client/client_hackconnect.lua",
    "client/client_memoryhack.lua",
    "client/client_pcbhack.lua",
    "client/client_serverhack.lua",
    "client/client_tacticalinput.lua",
    "client/client_voltlab.lua",
    "client/client_wordguess.lua",
}
server_scripts {
	"server/server.lua"
}

escrow_ignore {
	"cfg/cfg.lua",
    "cfg/cfg_bruteforce.lua",
    "cfg/cfg_circuitbreaker.lua",
    "cfg/cfg_datacrack.lua",
    "cfg/cfg_fingerprintclone.lua",
    "cfg/cfg_fingerprinthack.lua",
    "cfg/cfg_hackconnect.lua",
    "cfg/cfg_memoryhack.lua",
    "cfg/cfg_pcbhack.lua",
    "cfg/cfg_serverhack.lua",
    "cfg/cfg_tacticalinput.lua",
    "cfg/cfg_voltlab.lua",
    "cfg/cfg_wordguess.lua",
}
dependency '/assetpacks'