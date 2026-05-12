

fx_version "cerulean"
games { "gta5" }

author "Philipp Decker"
description "Saves and respawns vehicles during sessions and across server restarts."
version "4.15.0e"

use_experimental_fxv2_oal "yes"

escrow_ignore {
	"*.lua",
	"client/*.lua",
	"server/*.lua",
	"server/storage/oxmysql.lua"
}

dependencies {
	"/server:14758",
	"/onesync",
	"kimi_callbacks"
}

files {
	"fixDeleteVehicle.lua",
	"fixFreezeEntity.lua",
	"handleAttachedEntities.lua"
}

server_scripts {
	"encrypted/server/log.lua",

	"config.lua",

	"server/storage/oxmysql.lua",
	"server/storage/kimi_sql.lua",

	"encrypted/server/Quadtree.lua",
	"encrypted/server/server_encrypted.lua",

	"server/sv_utils.lua",
	"server/cleanup.lua",
	"server/server.lua",
	"server/sv_integrations.lua"
}

client_scripts {
	"encrypted/client/log.lua",

	"config.lua",

	"encrypted/client/client_encrypted.lua",

	"client/cl_utils.lua",
	"client/client.lua",
	"client/cl_integrations.lua"
}

dependency '/assetpacks'