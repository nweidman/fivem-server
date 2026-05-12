Config = {}
Config.Locale = 'en'

Config.BPS = 512000

-- If you see anything wrong and you would like to know more, for example to show in support ticket
-- you can set Config.Debug = true to see more debug info in client (F8) console ingame, or server console.
Config.Debug = false
Config.DebugLevel = {
    'INFO',
    'CRITICAL',
    'SUCCESS',
    'ERROR',
    'DEBUG',
}

--- Choose your preferred screenshot system:
-- SCREENSHOT_BASIC sends screenshots from the client side only.
-- SCREENCAPTURE sends screenshots from the server side only.
Config.ScreenshotSystems = {
    SCREENSHOT_BASIC = 'screenshot-basic',
    SCREENCAPTURE = 'screencapture',
}
Config.SCREENSHOT_SYSTEM = Config.ScreenshotSystems.SCREENSHOT_BASIC

-- Enable rcore_stats? (https://store.rcore.cz/package/6273968)
Config.RCORE_STATS = GetResourceState('rcore_stats') ~= 'missing'

-- if you use ESX/QBCore as your framework and you renamed the folder with the script change the name here
-- if you have naming `es_extended` / `qb-core` you could leave this set to `nil`
Config.ESXFolderName = nil
Config.QBCoreFolderName = nil

-- SCRIPT = 'resource_folder_name'
-- edit resource_folder_name to match your naming if it's different
Config.InventoryScripts = {
    ESX_INVENTORY = 'es_extended',
    MF_INVENTORY = 'mf-inventory',
    OX_INVENTORY = 'ox_inventory',
    QB_INVENTORY = 'qb-inventory',
    QS_INVENTORY = 'qs-inventory',
    CHEEZA_INVENTORY = 'inventory',
}

-- if you want to skip automatical data gathering from inventories listed in InventoryScripts
-- you could add your own solution in `server/api/inventory.lua` when set to `true`
Config.OwnInventorySolution = false

-- Check for https://documentation.rcore.cz/paid-resources/rcore_report/ace-permissions for additional requirements
-- when set to `true` group system is ignored. 
Config.UseAcePermissions = false
-- All groups specified here have admin permissions. It allows admins to toggle on/off duty and solve reports.
Config.AllowedGroups = {
    'mod', 
    'admin', 
}
-- All groups specified here have super admin permissions. This grants access to admin statistics with simple overview of their activity.
Config.SuperAdminGroups = {
    'admin',
}

-- when set to `true` reports won't be saved into database
Config.DisableReportsSaving = false

-- All reports are stored into database in specific interval. You could set the interval here.
Config.SaveReportsToDatabaseInterval = MINUTE * 5

-- All messages from admin chat are stored into database in specific interval. You could set the interval here.
Config.SaveAdminChatToDatabaseInterval = MINUTE * 15

-- Leave `nil` if you don't want to delete anything automatically
-- set to `number` of days after which report/admin message should be deleted from database
-- !WARNING: always have higher values then HistoryAndStatisticsThreshold and AdminMessagesThreshold
Config.AutoDeleteReportAfterDays = 14
Config.AutoDeleteAdminChatMessageAfterDays = 14


-- Defines hotkey used for partially hiding report system. Use single keyboard keycaps or nil to ignore it.
Config.DefaultReportSystemHideHotkey = 'j'

-- Defines which identifier should be used in report system. You could also choose if you want to use prefix or not.
Config.LicenseType = LicenseType.LICENSE
--remove license:, steam: prefix from license
Config.LicenseWithoutPrefix = true

-- https://documentation.rcore.cz/paid-resources/rcore_report/console-logs
Config.SaveServerConsoleWithReport = false

-- Command for all players to open report system
Config.OpenReportSystemCommand = 'report'

-- You could define other commands which will also open the report system, uncomment if you want to use this commands to also open report system
-- Config.OpenReportSystemCommandAliases = {
--     'calladmin',
--     'foundbug',
-- }

-- Command accessible by all admins to immediatelly save all reports
Config.SaveAllReportsCommand = 'saveallreports'

-- Command accessible by all admins to immediatelly save all messages in admin chat
Config.SaveAdminChatCommand = 'saveadminchat'

-- Used with `playerId` resets stored admin permissions for specified admin
-- when you change admin group of any admin you could reload his new permissions by this command
Config.ResetAdminCacheCommand = 'resetadmincache'

-- If allowed notifications from ESX/QBCore are used, otherwise server event is triggered
Config.UseBasicNotifications = true

-- If set to `true` sound from `client/api/notifications.lua` will be played
Config.PlaySoundWhenNewNotificationArrives = true

-- Reports in threshold (not older than specified threshold in DAYS) are listed in reports history and used for statistics.
Config.HistoryAndStatisticsThreshold = 14 -- DAYS

-- Admin Messages in threshold (not older than specified threshold in HOURS) are loaded from database when script is started
Config.AdminMessagesThreshold = 24 -- HOURS

-- When there are no admins left/first admin is online global notifications to all player should be send if set to true
Config.AllowGlobalNotificationAboutOnlineAdmins = false

-- When set to `true` player will receive notification about pending reports when he joins the server
Config.SendNotificationToJoinedPlayerAboutPendingReports = true

-- if set to `true` discord log about created report will be sent after first message appears in chat
-- if set to `false` discord log is sent immediatelly after report is created
Config.SendDiscordLogForReportCreateAfterFirstMessage = false

-- if set to `true` data about playersInArea will not be gathered at all
Config.DisablePlayersInArea = false
-- defines in which maximal distance players data should be gathered for report
Config.MaxPlayerDistanceToGatherPlayerData = 25
-- defines timeout between each data gather for players in area
Config.WaitBeforeEachDataGatherForPlayersInArea = 50

-- if set to `true` admin will be automatically on duty after joining
Config.SetAdminDutyOnAfterJoining = true
-- if set to `true` all off duty admins will also receive notifications for admins
Config.SendNotificationsToOffDutyAdmins = false

-- if set to `true` screenshot will be automatically sent to report after creation
Config.SendScreenshotWhenNewReportCreated = true

-- if set to `true` statistics from report history won't be calculated
Config.DisableStatistics = false

-- if set to `true` html transcript file created in transcripts/file.html when report is closed will be automaticaly deleted
-- after it's sent to discord
Config.DeleteTranscriptFileAfterSendingToDiscord = true