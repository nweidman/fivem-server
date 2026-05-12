WEBHOOK_URL = ''

function logToDiscord(formattedScoreboard)

    if WEBHOOK_URL and WEBHOOK_URL ~= '' then
        local time = os.date('%Y/%m/%d %H:%M:%S')
        local embed = {
            {
                ["fields"] = {

                },
                ["color"] = 16767002,
                ["title"] = "**RCore Golf Logs**",
                ["description"] = "",
                ["footer"] = {
                    ["text"] = time
                },
                ["thumbnail"] = {
                    ["url"] = "",
                },
            }
        }

        for holeNo, scoreboardData in pairs(formattedScoreboard) do
            local holeName = "Hole " .. tostring(holeNo) .. " (Par " .. tostring(scoreboardData.par) .. ")"
            local holeString = {}
            for playerSrc, playerShots in pairs(scoreboardData.players) do
                table.insert(holeString, (GetCharacterName(playerSrc) or "TEST")..": " .. tostring(playerShots))
            end

            table.insert(embed[1].fields, 
            {
                ["name"] = holeName,
                ["value"] = table.concat(holeString, ", "),
            })
        end

        PerformHttpRequest(WEBHOOK_URL, function(err, text, headers) end, 'POST', json.encode({username = "RCore Golf", embeds = embed}), { ['Content-Type'] = 'application/json' })
    end
end