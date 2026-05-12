function sendCustomDiscordMessage(webhook,name,message,imageUrl)
    local footer = "rcore_reports | rcore.cz"
    local color = SConfig.DiscordColors.Grey
    local embed = {
        ["title"] = name,
        ["description"] = message,
        ["type"] = "rich",
        ["color"] = color,
        ["footer"] = {
            ["text"] = footer,
        },
    }

    if imageUrl then
        embed["image"] = {
            ["url"] = imageUrl
        }
    end

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = name, embeds = {embed} }), { ['Content-Type'] = 'application/json' })
end

local function findDiscordIdentifier(source)
    local discordId
    for _, id in ipairs(GetPlayerIdentifiers(source)) do
        if string.match(id, "discord:") then
            discordId = string.gsub(id, "discord:", "")
        end
    end
    return discordId
end

local function getNiceName(playerId)
    local discordLicense = findDiscordIdentifier(playerId)
    if discordLicense then
        return string.format('%s <@%s>', getPlayerName(playerId), discordLicense)
    end

    return nil
end

function getQuickReportWebhook(title)
    return SConfig.QuickReportsCustomWebhooks[title]
end

function sendDiscordLogWithImageUrl(webhook, text, report)
    Citizen.CreateThread(function()
        local i = 0
        while i < 100 do
            local index, message = report.chatRoom.getFirstImageMessage()
            if message then
                sendCustomDiscordMessage(
                    webhook, 'RCORE_REPORT', text, message.imageUrl
                )
                break
            else
                Citizen.Wait(1000)
            end
        end
    end)
end

function parsePlayersInArea(players)
    local message = '**Players in area**\n'
    if not players or #players == 0 then
        return message .. 'No players in area\n'
    end

    for i, player in ipairs(players) do
        message = message .. string.format('%s <@%s> (%s)\n', player.name, player.discordId, player.identifier)
    end

    return message
end

-- DISCORD LOGS IMPLEMENTATION
function sendDiscordReportLog(report, playerId, isQuickReport)
    local quickReportWebhook = nil

    if isQuickReport then
        quickReportWebhook = getQuickReportWebhook(report.title)
    end
    local hasWebhook = SConfig.DiscordReportsLogWebhook ~= nil and SConfig.DiscordReportsLogWebhook ~= 'WEBHOOK'
    if not hasWebhook and quickReportWebhook == nil then
        return
    end

    local webhook = SConfig.DiscordReportsLogWebhook
    if quickReportWebhook then
        webhook = quickReportWebhook
    end

    local message = string.format("**ID**: %s\n", report.id)
    message = message .. string.format("**Title**: %s\n", report.title)
    message = message .. string.format("**Author**: %s\n", getNiceName(playerId) or report.author.name)
    message = message .. parsePlayersInArea(report.players_in_area)

    if Config.SendScreenshotWhenNewReportCreated then
        sendDiscordLogWithImageUrl(webhook, message, report)
    else
        sendCustomDiscordMessage(
            webhook, 'RCORE_REPORT', message
        )
    end
end

function sendDiscordReportLogWithFirstMessage(report, playerId, text, isQuickReport)
    local quickReportWebhook = nil

    if isQuickReport then
        quickReportWebhook = getQuickReportWebhook(report.title)
    end
    local hasWebhook = SConfig.DiscordReportsLogWebhook ~= nil and SConfig.DiscordReportsLogWebhook ~= 'WEBHOOK'
    if not hasWebhook and quickReportWebhook == nil then
        return
    end

    local webhook = SConfig.DiscordReportsLogWebhook
    if quickReportWebhook then
        webhook = quickReportWebhook
    end

    local message = string.format("**ID**: %s\n", report.id)
    message = message .. string.format("**Title**: %s\n", report.title)
    message = message .. string.format("**Author**\n%s\n\n", getNiceName(playerId) or report.author.name)
    message = message .. string.format("**Message**\n%s\n", text)
    message = message .. parsePlayersInArea(report.players_in_area)

    if Config.SendScreenshotWhenNewReportCreated then
        sendDiscordLogWithImageUrl(webhook, message, report)
    else
        sendCustomDiscordMessage(
            webhook, 'RCORE_REPORT', message
        )
    end
end

function generateReportTranscript(report)
    local path = string.format('transcripts/%s_%s_report-transcript.html', report.id, getCurrentDateTimeWithoutSpaces())
    SaveResourceFile(
        GetCurrentResourceName(),
        path,
        getTranscriptHtml(report)
    )
    
    sendDiscordFile('/'..path, string.format('**REPORT_TRANSCRIPT**\n%s (ID %s)', report.title, report.id), SConfig.DiscordReportsTranscriptWebhook)

    if Config.DeleteTranscriptFileAfterSendingToDiscord then
        Wait(1000)
        os.remove(GetResourcePath(GetCurrentResourceName()) .. '/' .. path)
    end
end