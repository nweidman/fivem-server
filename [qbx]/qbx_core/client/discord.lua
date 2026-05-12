local maxPlayers = GlobalState.MaxPlayers
local discord = require 'config.client'.discord

if not discord.enabled then return end

-- Initial static setup
SetDiscordAppId(discord.appId)
SetDiscordRichPresenceAsset(discord.largeIcon.icon)
SetDiscordRichPresenceAssetText(discord.largeIcon.text)
-- SetDiscordRichPresenceAssetSmall(discord.smallIcon.icon)
-- SetDiscordRichPresenceAssetSmallText(discord.smallIcon.text)
SetDiscordRichPresenceAction(0, discord.firstButton.text, discord.firstButton.link)
SetDiscordRichPresenceAction(1, discord.secondButton.text, discord.secondButton.link)

Citizen.CreateThread(function()
    while true do
        local playerId = GetPlayerServerId(PlayerId())
        local playerCount = GlobalState.PlayerCount or 0
        local displayName = GetPlayerName(PlayerId()) -- Default to Steam name

        -- Get Qbox Character Name
        local PlayerData = exports.qbx_core:GetPlayerData()

        if PlayerData and PlayerData.charinfo then
            displayName = PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname
        end
        
        -- LINE 1: Roleplay Name | ID: 12
        SetRichPresence(string.format("👤 %s | ID: %s", displayName, playerId))
        
        -- Updates hover text to show player count
        SetDiscordRichPresenceAssetText(string.format("🟣 Players: %s / %s", playerCount, maxPlayers))
        
        Citizen.Wait(30000) 
    end
end)