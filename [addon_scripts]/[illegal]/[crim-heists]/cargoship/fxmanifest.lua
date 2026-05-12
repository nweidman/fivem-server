
fx_version "cerulean"
game "gta5"

author "Nuno Radio Man"

resource_name "[Robbery] [GTA V] Cargoship"
resource_version "1.3.5"
resource_version_checker "core_rob_cargoship_default"

dependencies {
	"/onesync",
	"/server:7290",
	"/gameBuild:2372",
	"core_rob_essentials",
	--"minigames",
}

lua54 "yes"

client_scripts {
	"cfg/cfg.lua",
	"cfg/cfg_robbery.lua",
	"client/dependency.lua",
	"client/functions.lua",
	"client/client.lua",
}
server_scripts {
	-- "@vrp/lib/utils.lua",

	"cfg/cfg.lua",
	"cfg/cfg_logs.lua",
	"cfg/cfg_robbery.lua",
	"server/dependency.lua",
	"server/functions.lua",
	"server/server.lua",
}

escrow_ignore {
	"cfg/cfg.lua",
	"cfg/cfg_logs.lua",
	"cfg/cfg_robbery.lua",
	"client/functions.lua",
	"server/functions.lua",
}
dependency '/assetpacks'