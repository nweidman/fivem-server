Config = {
	Guild_ID = '', -- Set to the ID of your guild (or your Primary guild if using Multiguild)
	Multiguild = false, -- Set to true if you want to use multiple guilds
	Guilds = {
		["name"] = "guild_id", -- Replace this with a name, like "main"
	},
	Bot_Token = '',
	RoleList = {
	-- ['LabRat'] = ,
	},
	CacheDiscordRoles = true, -- true to cache player roles, false to make a new Discord Request every time
	CacheDiscordRolesTime = 60, -- if CacheDiscordRoles is true, how long to cache roles before clearing (in seconds)
}

Config.Splash = {
	Header_IMG = '',
	Enabled = false,
	Script_Name = 'Welcome to RP!',
	Wait = 12, -- How many seconds should splash page be shown for? (Max is 12)
	Heading1 = "A realistic RP server with so much to discover.",
	Heading2 = "Join our Discord and consider supporting our city!",
	Discord_Link = '',
	Website_Link = '',
}