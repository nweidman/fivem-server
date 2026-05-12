local statsInited = false

local CATEGORY_TITLE = 'Reports'
local STATS_CONFIG = {
    rcore_report_created = {
        title = 'Reports created',
        serverTitle = 'Total reports created',
        unit = nil,
        achievements = {
            {title = 'Should it work like this?', description = 'Problems are meant to be solved. Submit your first report.', icon = 'bug', goal = 1},
            {title = 'A few more problems mean a few more reports', description = 'Submit more than 10 reports.', icon = 'bug', goal = 11},
            {title = 'Problem solver', description = 'No matter how many problems I encounter, I am happy to solve them all. Even 20.', icon = 'bug', goal = 20},
        },
    },
    rcore_report_screenshot = {
        title = 'Screenshots uploaded',
        serverTitle = 'Total screenshots uploaded',
        unit = nil,
        achievements = {
            {title = 'Occasional photographer', description = 'Send your first screenshot.', icon = 'camera', goal = 1},
            {title = 'Documentalist', description = 'Sometimes it\'s nice to have a screenshot of your experiences with problems. Send 10 screenshots.', icon = 'camera', goal = 10},
            {title = 'I report, I take screenshots.', description = 'You will document every problem you encounter. Send 20 screenshots.', icon = 'camera', goal = 20},
        },
    },
}

-- DO NOT EDIT BELOW THIS LINE
local function registerStatConfig(key)
    local serverKey = string.format('total_%s', key)
    local title = STATS_CONFIG[key].title
    local serverTitle = STATS_CONFIG[key].serverTitle
    local achievements = STATS_CONFIG[key].achievements
    local unit = STATS_CONFIG[key].unit

    TriggerEvent('rcore_stats:api:ensureStatType', key, title, "player", unit, 'rcore_report', true, nil, function()
        TriggerEvent('rcore_stats:api:ensureStatType', serverKey, serverTitle, "server", unit, 'rcore_report', true, key, function()
            for index, achievement in pairs(achievements) do
                local achievementKey = string.format('%s-%s', key, index)
                TriggerEvent('rcore_stats:api:ensureAchievement', achievementKey, achievement.title, achievement.description, achievement.icon, key, achievement.goal)
            end
        end)
    end)
end

local function setupStats() 
    if not statsInited then
        statsInited = true

        TriggerEvent('rcore_stats:api:ensureCategory', 'rcore_report', CATEGORY_TITLE, function()
            registerStatConfig('rcore_report_created')
            registerStatConfig('rcore_report_screenshot')
        end)
    end
end

if Config.RCORE_STATS then
    AddEventHandler('rcore_stats:api:ready', setupStats)

    CreateThread(function()
        if GetResourceState("rcore_stats") == "started" or GetResourceState("rcore_stats") == "starting" then
            while not statsInited do
                TriggerEvent('rcore_stats:api:isReady', function(isReady)
                    if isReady then
                        setupStats()
                    end
                end)
                Wait(1000)
            end
        end
    end)
end