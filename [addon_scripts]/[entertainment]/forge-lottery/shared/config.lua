Config = { }
Config.SecurityKeys = {}

--  _____ _____ _   _ ______ _____ _____ _   _______  ___ _____ _____ _____ _   _
-- /  __ \  _  | \ | ||  ___|_   _|  __ \ | | | ___ \/ _ \_   _|_   _|  _  | \ | |
-- | /  \/ | | |  \| || |_    | | | |  \/ | | | |_/ / /_\ \| |   | | | | | |  \| |
-- | |   | | | | . ` ||  _|   | | | | __| | | |    /|  _  || |   | | | | | . ` |
-- | \__/\ \_/ / |\  || |    _| |_| |_\ \ |_| | |\ \| | | || |  _| |_\ \_/ / |\  |
--  \____/\___/\_| \_/\_|    \___/ \____/\___/\_| \_\_| |_/\_/  \___/ \___/\_| \_/


-- Framework Configuration
Config.Debug = false  -- Enable or disable debug mode
Config.Framework = 'qbcore'  -- Choose between 'esx' or 'qbcore'
Config.SQLWrapper = 'oxmysql'  -- Choose the MySQL wrapper

-- Target System Configuration
Config.UseTarget = true  -- Enable or disable target system
Config.TargetSystem = 'ox_target'  -- Choose target system

-- Daily Gift Configuration
Config.DailyGift = {
    GiftType = 'diamond' -- Type of daily prize of scrath & win roll ('diamond' or 'numbers')
}

Config.SocietyPayments = { -- The money spent on the lottery will go to the society
    Enabled = false,
    Destinations = { -- 0.1 = 10% and 1.0 = 100%
        ['casino'] = 0.7, -- 70% of the money will go to the casino
        ['lotto'] = 0.3 -- 30% of the money will go to the lottery
    } -- You cand add more destinations
}

Config.SocietyWithdraws = { -- The prize money comes from one society or more than one
    Enabled = false, -- Enable or disable society withdraws
    ScratchAndWinEnabled = false, -- You can enable or disable it. If you disable it, the prize money for this minigame will be auto-generated and won't come from any society.
    WheelEnabled = false, -- You can enable or disable it. If you disable it, the prize money for this minigame will be auto-generated and won't come from any society.
    WeeklyEnabled = false, -- You can enable or disable it. If you disable it, the prize money for this minigame will be auto-generated and won't come from any society.
    Sources = { -- 0.1 = 10% and 1.0 = 100%
        ['casino'] = 0.7, -- 70% of the prize money will come from the casino
        ['lotto'] = 0.3 -- 30% of the prize money will come from the lottery
    }
}

Config.SocietyMethod = "QB" -- ESX, QB, or FORGE (you can purchase the FORGE BOSS MENU at https://codeforge.tebex.io/)

-- Weekly Lottery Configuration
Config.WeeklyLottery = {
    DrawTime = 168, -- Every x hour it will draw
    PrizeType = 'money', -- Type of prize: 'mixed', 'money', or 'items'
    PrizeAmount = { min = 100000, max = 300000 }, -- Randomized prize amount
    PrizeCurrency = 'bank', -- Currency type for the prize: 'money', 'money', or 'bank'
    Items = { -- Items that can be won
        { Name = 'gold', Quantity = { 2, 4 }, Chance = 40 }, -- 40% chance to win gold
        { Name = 'iron', Quantity = { 5, 15 }, Chance = 100 } -- 100% chance to win iron
    },
    Tickets = { -- Lottery Ticket Prices and Chances
        Bronze = {
            Price = 10000,
            Currency = 'bank', -- Currency for the ticket: 'money', 'cash', 'bank' or other...
            ChanceToWin = 10 -- Chance to win. 100% win every time
        },
        Silver = {
            Price = 25000,
            Currency = 'bank',
            ChanceToWin = 30 -- Chance to win. 100% win every time
        },
        Gold = {
            Price = 50000,
            Currency = 'bank',
            ChanceToWin = 60 -- Chance to win. 100% win every time
        }
    },
}

-- Scratch and Win Configuration
Config.ScratchAndWin = {
    SpamCheck = false, -- Enable / disable spam check
    SpamDuration = 20, -- Max time to open the menu before it counts as spam 
    SpamCount = 5, -- Number of allowed scratch card purchases before cooldown
    Cooldown = 20, -- Cooldown duration in seconds after spam limit is reached
    DiamondParty = {
        Price = 8000,
        Currency = 'bank', -- Currency for the ticket: 'money', 'cash', 'bank' or other...
        PrizeAmount = { min = 10000, max = 20000 },
        ChanceToWin = 10, -- Chance to win. 100% win every time
        PrizeType = 'money', -- Type of prize: 'mixed', 'money', or 'items'
        PrizeCurrency = 'bank', -- Currency type for the prize
        Items = { -- Items that can be won
            { Name = 'gold', Quantity = { 2, 4 }, Chance = 40 }, -- 40% chance to win gold
            { Name = 'silver', Quantity = { 1, 3 }, Chance = 30 }, -- 30% chance to win silver
            { Name = 'diamond', Quantity = { 1, 2 }, Chance = 20 } -- 20% chance to win diamond
        }
    },
    KingOfNumbers = {
        Price = 8000,
        Currency = 'bank',
        PrizeType = 'money',
        PrizeCurrency = 'bank',
        Prizes = { -- Prizes based on the number of matching numbers
            [0] = { -- 0 matching numbers
                Chance = 60, -- Chance to get 0 matching numbers. 100% win every time
                Items = { { Name = 'gold', Quantity = { 2, 4 }, Chance = 40 } }, -- Chance to win gold
                PrizeAmount = { min = 2500, max = 5000 } -- Money quantity
            },
            [1] = { -- 1 matching number
                Chance = 30, -- Chance to get 1 matching number. 100% win every time
                Items = { { Name = 'gold', Quantity = { 2, 4 }, Chance = 40 } }, -- Chance to win gold
                PrizeAmount = { min = 7000, max = 10000 } -- Money quantity
            },
            [2] = { -- 2 matching numbers
                Chance = 7, -- Chance to get 2 matching numbers. 100% win every time
                Items = { { Name = 'silver', Quantity = { 1, 3 }, Chance = 30 } }, -- Chance to win silver
                PrizeAmount = { min = 10000, max = 20000 } -- Money quantity
            },
            [3] = { -- 3 matching numbers
                Chance = 3, -- Chance to get 3 matching numbers. 100% win every time
                Items = { { Name = 'diamond', Quantity = { 1, 2 }, Chance = 20 } }, -- Chance to win diamond
                PrizeAmount = { min = 25000, max = 30000 } -- Money quantity
            }
        }
    }
}

-- Fortune Wheel Configuration
Config.FortuneWheel = {
    SpamCheck = true, -- Enable / disable spam check
    SpamDuration = 3, -- Max time to open the menu before it counts as spam
    SpamCount = 2, -- Number of allowed menu toggles before cooldown
    Cooldown = 10, -- Cooldown duration in seconds after spam limit is reached
    TicketPrice = 5000,
    Currency = 'bank', -- Currency for the ticket: 'money', 'cash', 'bank' or other...
    Prizes = {
        [1] = { -- Winning number
            PrizeType = 'money', -- Type of prize: 'mixed', 'money', or 'items'
            PrizeCurrency = 'bank', -- Currency type for the prize
            PrizeAmount = { min = 1000, max = 5000 }, -- Randomized prize amount
            Items = { 
                { Name = 'gold', Quantity = { 2, 4 }, Chance = 40 }, -- Chance to win gold
                { Name = 'silver', Quantity = { 1, 3 }, Chance = 30 }, -- Chance to win silver
                { Name = 'diamond', Quantity = { 1, 2 }, Chance = 20 } -- Chance to win diamond
            }
        },
        [2] = {
            PrizeType = 'money',
            PrizeCurrency = 'bank',
            PrizeAmount = { min = 5000, max = 9000 },
            Items = { { Name = 'gold', Quantity = { 2, 4 }, Chance = 40 } }
        },
        [3] = {
            PrizeType = 'money',
            PrizeCurrency = 'bank',
            PrizeAmount = { min = 1000, max = 5000 },
            Items = { { Name = 'gold', Quantity = { 2, 4 }, Chance = 40 } }
        },
        [4] = {
            PrizeType = 'money',
            PrizeCurrency = 'bank',
            PrizeAmount = { min = 250, max = 500 },
            Items = { { Name = 'gold', Quantity = { 2, 4 }, Chance = 40 } }
        },
        [5] = {
            PrizeType = 'money',
            PrizeCurrency = 'bank',
            PrizeAmount = { min = 250, max = 500 },
            Items = { { Name = 'gold', Quantity = { 2, 4 }, Chance = 40 } }
        },
        [6] = {
            PrizeType = 'money',
            PrizeCurrency = 'bank',
            PrizeAmount = { min = 250, max = 500 },
            Items = { { Name = 'gold', Quantity = { 2, 4 }, Chance = 40 } }
        },
        [7] = {
            PrizeType = 'money',
            PrizeCurrency = 'bank',
            PrizeAmount = { min = 1000, max = 5000 },
            Items = { { Name = 'gold', Quantity = { 2, 4 }, Chance = 40 } }
        },
        [8] = {
            PrizeType = 'money',
            PrizeCurrency = 'bank',
            PrizeAmount = { min = 6000, max = 7000 },
            Items = { { Name = 'gold', Quantity = { 2, 4 }, Chance = 40 } }
        },
        [9] = {
            PrizeType = 'money',
            PrizeCurrency = 'bank',
            PrizeAmount = { min = 3000, max = 4500 },
            Items = { { Name = 'gold', Quantity = { 2, 4 }, Chance = 40 } }
        },
        [10] = {
            PrizeType = 'money',
            PrizeCurrency = 'bank',
            PrizeAmount = { min = 5000, max = 9000 },
            Items = { { Name = 'gold', Quantity = { 2, 4 }, Chance = 40 } }
        }
    }
}

-- Interface Configuration
Config.UI = {
    primaryColor = '#a671fe',
    red = '#ffffff',
    borderColor = '#d7d7d7',
    translation = {
        lotterytitle = 'LOTTERY',
        lotterydesc = 'Because winning has no !',
        home = 'HOME',
        weeklylottery = 'WEEKLY LOTTERY',
        scratchadnwin = 'SCRATCH & WIN',
        fortunewheel = 'FORTUNE WHEEL',
        lotterytitle2 = 'Lottery and Gaming Company - <span> LOTTO</span>',
        winbig = 'WIN BIG',
        winbigdesc = 'Earn <span>money</span> legally, take a chance on fate, and savor the thrill of <span>pure adrenaline</span>!',
        playres = 'Play responsibly. Enjoy the excitement, but know your limits.',
        leaderboard = 'LEADERBOARD',
        freeticket = 'A FREE <span>SCRATCH & WIN</span> TICKET!',
        unlock = 'To Unlock',
        weeklylottery2 = 'WEEKLY LOTTERY',
        bronzeticket = '<strong>Bronze</strong> Ticket',
        bronzeticketdesc = 'You have chosen the <span>Bronze Ticket</span>. Buy it and get a chance to win: <span>LOW</span>.',
        bronzeticketprice = 'Price: <strong>'..Config.WeeklyLottery.Tickets.Bronze.Price..'$</strong>',
        buybronze = 'Buy',
        silverticket = '<strong>Silver</strong> Ticket',
        silverticketdesc = 'You have chosen the <span>Silver Ticket</span>. Buy it and get a chance to win: <span>MEDIUM</span>.',
        silverticketprice = 'Price: <strong>'..Config.WeeklyLottery.Tickets.Silver.Price..'$</strong>',
        buysilver = 'Buy',
        goldticket = '<strong>Gold</strong> Ticket',
        goldticketdesc = 'You have chosen the <span>Gold Ticket</span>. Buy it and get a chance to win: <span>HIGH</span>.',
        goldticketprice = 'Price: <strong>'..Config.WeeklyLottery.Tickets.Gold.Price..'$</strong>',
        buygold = 'Buy',
        ticketlimit = 'You can only buy 1 ticket per week to combat gambling addiction.',
        winningticket = 'Winning Ticket',
        lastwinnertitle = 'The latest <span>Weekly Lottery</span> winner is:',
        checkprize = 'Claim Prize',
        knownextwin = 'TIME TO KNOW THE <br /> <span>NEXT WINNER</span>:',
        scratchandwin2 = 'SCRATCH & WIN',
        scratchandwindesc = 'Buy a <span>Scratch & Win ticket</span> and get great prizes instantly. Click on one of the types:',
        diamondparty = '<span>Diamond Party:</span> Get 4 matching diamond symbols',
        diamondpartyprice = 'Price: <strong>'..Config.ScratchAndWin.DiamondParty.Price..'$</strong>',
        numberparty = '<span>Number Party:</span> Match the given numbers',
        numberpartyprice = 'Price: <strong>'..Config.ScratchAndWin.KingOfNumbers.Price..'$</strong>',
        scratchandwinb = 'The prize is given automatically and in money. All you have to do is scratch!',
        fortunewheel2 = 'Fortune Wheel',
        fortunewheeldesc = 'Yes! The first <span>Fortune Wheel</span> that isn\'t round! There\'s always a prize!',
        fortunewheelprice = 'Price: <strong>'..Config.FortuneWheel.TicketPrice..'$</strong>',
        fortunewheelb = 'Each number is linked to a money reward.',
        scratcheach = 'Scratch each rectangle with the cursor to reveal the symbol underneath.',
        incircles = 'In the circles, you need to find the winning numbers.'
    }
}

-- Locations for Lottery Purchase
Config.Locations = {
    { 
        Position = vector3(299.736267, -574.325256, 43.248291), -- Coordinates for the ticket station, in case you do not use target
        MarkerSettings = {
            Enabled = false, -- Show marker
            Type = 2, -- Marker type
            ColorR = 222, -- Red component
            ColorG = 186, -- Green component
            ColorB = 77, -- Blue component
            Alpha = 255 -- Transparency
        },
        BlipSettings = {
            Enabled = false, -- Show blip on the map
            Id = 369, -- Blip ID
            Color = 17, -- Blip color
            Scale = 0.7, -- Blip scale
            Display = 2, -- Blip display type
            Name = 'Lottery' -- Blip name
        }
    }
}

-- Functions for Drawing Markers and Texts
Config.Functions = {

    -- Function to draw text on the screen
    DrawText = function(text)
        AddTextEntry('ALERT_MESSAGE', text)
        BeginTextCommandDisplayHelp('ALERT_MESSAGE')
        EndTextCommandDisplayHelp(0, false, false, -1)
    end,

    -- Function to show a notification based on the framework being used (ESX or QBCore)
    Notify = function(text)
        if Config.Framework == 'esx' then
            ESX.ShowNotification(text)
        elseif Config.Framework == 'qbcore' then
            QBCore.Functions.Notify(text)
        end
    end,

    -- Function to add money to a society account based on the method being used (FORGE, QB, or ESX)
    AddSocietyMoney = function(society, amount, title, reason)
        if Config.SocietyMethod == "FORGE" then
            exports["neon-boss"]:AddSocietyMoney(society, "LOTTERY", amount, reason)
        elseif Config.SocietyMethod == "QB" then
            exports["qb-banking"]:AddMoney(society, amount, reason)
        elseif Config.SocietyMethod == "ESX" then
            TriggerEvent("esx_addonaccount:getSharedAccount", "society_"..society, function(account)
                if account then account.addMoney(amount) end
            end)
        end
    end,

    -- Function to remove money(clamped) from a society account based on the method being used (FORGE, QB, or ESX)
    RemoveSocietyMoney = function(society, amount, title, reason)
        if Config.SocietyMethod == "FORGE" then
            local balance = exports["neon-boss"]:GetSocietyData(society).balance
            if balance - amount < 0 then amount = balance end
            exports["neon-boss"]:RemoveSocietyMoney(society, "LOTTERY", amount, "You have paid a lottery prize")
        elseif Config.SocietyMethod == "QB" then
            local balance = exports['qb-banking']:GetAccountBalance(society)
            if balance - amount < 0 then amount = balance end
            exports["qb-banking"]:RemoveMoney(society, amount, "You have paid a lottery prize")
        elseif Config.SocietyMethod == "ESX" then
            TriggerEvent("esx_addonaccount:getSharedAccount", "society_"..society, function(account)
                local balance = account.money
                if balance - amount < 0 then amount = balance end
                if account then account.removeMoney(amount) end
            end)
        end
    end

}

-- Target Items Configuration
Config.TargetItems = {
    -38797076, -- Lottery sign
    -1816283392 -- Lottery stand
}

-- Function to Add Target Models
Config.TargetFunctions = {

    AddBuyLotteryTarget = function()
        if Config.TargetSystem == 'qb-target' then
            exports['qb-target']:AddTargetModel(Config.TargetItems, {
                options = {
                    {
                        icon = 'fas fa-hands',
                        label = 'Buy Lottery',
                        action = function(entity)
                            TriggerEvent('forge-lottery:open')
                        end
                    }
                },
                distance = 2.5
            })
        elseif Config.TargetSystem == 'ox_target' then
            exports['ox_target']:addModel(Config.TargetItems, {
                {
                    name = 'buylottery',
                    icon = 'fas fa-hands',
                    label = 'Buy Lottery',
                    onSelect = function(data)
                        TriggerEvent('forge-lottery:open')
                    end
                }
            })
        end
    end

}

Config.Translation = {
    openmenutext = 'Press ~INPUT_CONTEXT~ to open the lottery menu',
    logstitle = 'New Lottery Win',
    logsusername = 'Lottery',
    diamondsbuy = '%s has purchased a diamond party scratch card',
    numbersbuy = '%s has purchased a king of numbers scratch card',
    wheelbuy = '%s has purchased a fortune wheel ticket',
    diamondwin = '%s won %s from a diamond party scratch card',
    numberswin = '%s won %s from a king of numbers scratch card',
    wheelwin = '%s won %s from the fortune wheel',
    weeklybuy = '%s has purchased a %s weekly lottery ticket',
    weeklywin = '%s won the weekly lottery prize',
    noparticipants = 'This week there were not enough participants in the Weekly Lottery, so there were no prizes for anyone.'
}

-- The translations for the notifications and some other things.
Config.Notifications = {
    nomoney = 'You don\'t have enough money to buy this.',
    purchaseSuccess = 'You have successfully purchased a lottery ticket.',
    loseNotification = 'You did not win any prize this time. Best luck next time!',
    winNotification = 'Congratulations! You have won a prize of %s.',
    dailyGiftClaimed = 'You have claimed your daily gift.',
    spamWarning = 'You are performing actions too quickly. Please slow down.',
    cooldownActive = 'You are on cooldown. Please wait %s seconds before trying again.',
    noTickets = 'You don\'t have any lottery tickets to check.',
    ticketBought = 'You have bought a %s lottery ticket',
    prizeClaimed = 'You have claimed your prize of %s. Congratulations!',
    noPrize = 'You did not win any prize this time. Bad luck!',
    fortuneWheelWin = 'Congratulations! You have won a prize of %s! in fortune wheel',
    ticketLimitReached = 'You have reached the maximum number of tickets you can buy.',
    noWinner = 'The winner for this week has not been announced yet.'
}