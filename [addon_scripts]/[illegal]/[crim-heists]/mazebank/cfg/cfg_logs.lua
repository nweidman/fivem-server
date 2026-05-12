cfg.log = {
	active = true,
	logs = {
		["start"] = {
			webhook = "",
			message = "# %s\n # The robbery just got started\n **[Date] : %s**\n **[Time] : %s**\n\n **PLAYER DATA**\n\n **[Player Name] : %s**\n **[License] : %s**\n **[Discord] : <@%s>**\n **[IP] : %s**",
			avatar = "https://imgur.com/zEuWqC4.png",
			color = 16768534,
		},
		["giveitem"] = {
			webhook = "",
			message = "# %s\n # Item received %s x%s\n **[Date] : %s**\n **[Time] : %s**\n\n **PLAYER DATA**\n\n **[Player Name] : %s**\n **[License] : %s**\n **[Discord] : <@%s>**\n **[IP] : %s**",
			avatar = "https://imgur.com/zEuWqC4.png",
			color = 16768534,
		},
		["removeitem"] = {
			webhook = "",
			message = "# %s\n # Item removed %s x%s\n **[Date] : %s**\n **[Time] : %s**\n\n **PLAYER DATA**\n\n **[Player Name] : %s**\n **[License] : %s**\n **[Discord] : <@%s>**\n **[IP] : %s**",
			avatar = "https://imgur.com/zEuWqC4.png",
			color = 16768534,
		},
	},
}