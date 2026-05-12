Config.DiscordWebhooks = {
    DiscordWebhook = "",
}

RegisterNetEvent('drool_mysterybox:server:sendWebhook', function(type, color, name, message, footer)
    local embed = {
        {
            ["color"] = color,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = footer,
            },
        }
    }
    PerformHttpRequest(Config.DiscordWebhooks.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end)
