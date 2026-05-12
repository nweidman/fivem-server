Config = {}

-- REWARDS

Config.Rewards = {
    CodeUser = 50000, -- Rewards for Person who uses the Code
    CodeOwner = 25000, -- Rewards for Influencer whose code has been used.
}

Config.WaitTime = 30 -- Minutes to Wait before Rewards are Credited

-- CODE LENGTH -- Code will be these many Characters from the END of Steam HEX 
-- Example : If 7 then CODES made will be LAST 7 CHARACTERS OF LICENSE

Config.CodeLength = 7

-- REASON SYSTEM : For Tracking where are people coming from.

Config.ReasonSystem = true -- TRUE if you want to use it. (Logs REASONS in SQL Table named Reasons)

-- DISCORD LOGS
Config.DiscordWebhook = ""