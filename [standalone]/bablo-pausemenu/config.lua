Config = {}

Config.Debug = false -- Enable debug mode

Config.Framework = 'auto' -- esx, qbcore or standalone
Config.Locale = 'en-US' -- add more locales in shared/locales
Config.Currency = '$' -- Currency symbol to be used in the menu

Config.CanOpenIfDead = true -- Can the menu be opened if the player is dead?
Config.ShowOnlinePlayers = false -- Show online players in the pause menu

Config.Announcements = {
    NotifyOnNew = true,            -- Notify all players when a new announcement is added
    MenuCommand = 'ab', -- Command to open the announcements menu
}

Config.QuickAccessKey = {
    MAP = 'P',     -- Key to open the map uses keymapping
    SETTINGS = '', -- Key to open the settings menu uses keymapping
}

--[[
Socials links for the pause menu. The value of each social will be copied to the players clipboard when clicked. Disable a button by setting the value to false.

    - discord: Discord link
    - x: Twitter link
    - instagram: Instagram link
    - tiktok: TikTok link
    - website: Website link
]] --
Config.Socials = {
    discord = '',
    tiktok = '',
    website = '',
}

Config.CustomButtons = {
    {
        label = "Quit",
        event = "quit",
        server = function(source)
            -- Server side code here

            DropPlayer(source, "You have quit the game.")
        end,
        client = function()
            -- Client side code here
            QuitGame()
        end,
    }
}
