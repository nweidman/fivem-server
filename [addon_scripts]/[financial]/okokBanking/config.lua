Config, Locales = {}, {}

Config.Debug = {
    ["global"] = false,
    ["savings"] = false,
    ["loans"] = false,
    ["sql"] = false,
    ["money"] = false,
    ["atm"] = false,
    ["accounts"] = false,
    ["start"] = false,
    ["societies"] = false,
    ["transactions"] = false,
}

Config.Locale = 'en'                 -- en / pt / gr / fr / de

Config.Currency = 'USD'              -- auto-format any world currency (EUR, USD, GBP, etc.)
Config.UseCashAsItem = false

-- Notifications / UI
-- Config.okokNotify: true = use okokNotify | false = use native framework notification (QBCore.Functions.Notify)
Config.okokNotify = true
-- Config.okokTextUI: true = use okokTextUI | false = use native framework text UI (QBCore DrawText)
Config.okokTextUI = true

-- Input / Target
Config.Key = 38                      -- https://docs.fivem.net/docs/game-references/controls/#controls
Config.UseTargetOnAtm = true        -- use target system instead of TextUI on ATMs
Config.UseTargetOnBank = false       -- use target system instead of TextUI on Banks
Config.TargetSystem = 'ox-target'    -- qb-target | qtarget | ox-target
Config.TargetBankDistance = 2.5      -- target distance for banks
Config.DebugTargetZones = false      -- show target zone boxes for debugging

-- okokBilling integration (works with both frameworks)
Config.okokBilling = {
    enable = true,                  -- true = okokBilling | false = no bills system
    resource = "okokBilling",       -- only change if you renamed the resource (https://okok.tebex.io/package/5246435)
}

-- Society integration
-- For QBCore: okokBanking / qb-banking / qb-management
Config.SocietyResource = "qb-management"

-- IBAN / Account settings
Config.IBANPrefix = ""
Config.IBANNumbers = 6
Config.CustomIBANMaxChars = 10
Config.CustomIBANAllowLetters = false
Config.IBANChangeCost = 5000
Config.PINChangeCost = 1000
Config.PrintReceiptPrice = 500
Config.NewAccountCost = 5000          -- Cost to create a new account

-- Transactions only influence loading time, not UI responsiveness
-- New approach tested with 50k transactions, ~5 seconds to load bank, UI is instant
Config.MaxTransactionsPerPlayer = nil   -- nil = unlimited | 100 = 100 transactions 

Config.ShowBankBlips = true             -- show bank blips on the map

Config.ReceiptItem = "printerdocument"  -- item name for the receipt

-- =========================
-- TRANSFER CONTACTS SETTINGS
-- =========================

Config.MaxTransferContactsFavorites = 3

-- =========================
-- CUSTOM ACCOUNTS SETTINGS
-- =========================
Config.CustomAccounts = {
    Enabled = false,
    MaxAccountsPerPlayer = 2,   -- Maximum custom accounts a player can own
    CreationFee = 25000,          -- Cost to create a custom account
}

-- =========================
-- CARDS SETTINGS
-- =========================
-- EnableCards = true:  Multiple cards per account with physical inventory items
-- EnableCards = false: Max 1 ACTIVE card per account stored in database (no inventory items)
--                      Uses MaxTotalCreditCards for total cards (including blocked), allows new card if no active card exists

Config.EnableCards = false
Config.CreditCardPrice = 5000            -- cost to create a card
Config.CreditCardActivationFee = 2500    -- fee to activate the card
Config.CreditCardRenewalFee = 5000       -- fee to renew the card
Config.RenewCardTime = 7                -- time in days to renew the card
Config.MaxTotalCreditCards = 5         -- max total cards a player can have per account

-- Inventory resource (only used when Config.EnableCards = true)
-- For QBCore: qb-inventory | ox_inventory
Config.InventoryResource = "ox_inventory"   -- qb-inventory | ox_inventory
Config.MaxActiveCreditCards = 2             -- max active cards a player can have per account
Config.CreditCardItem = "bank_card"         -- item name for the card

Config.PlayerCanChangeDailyLimit = false     -- true = player can change daily limit (Only one card type will be available)
Config.MaxDailyLimit = 100000               -- max daily limit for the card
Config.DefaultCard = 2                      -- index of the default card (1 = Standard Card, 2 = Premium Card, 3 = Gold Card) | used if PlayerCanChangeDailyLimit is true

Config.CreditCards = {
    {
        label = "Standard Card",
        dailyLimit = 25000,
        price = 1000,
    },
    {
        label = "Platinum Card",
        dailyLimit = 100000,
        price = 5000,
    },
    {
        label = "Black Card",
        dailyLimit = 250000,
        price = 7500,
    },
    {
        label = "OS Card",
        dailyLimit = 1000000,
        price = 10000,
    },
}

Config.DailyLimitResetHour = 0    -- Reset hour (-23 to 23, negative = X hours before midnight)
Config.DailyLimitResetMinute = 0  -- Reset minute (0-59)

-- =========================
-- SAVINGS SETTINGS
-- =========================

Config.EnableSavings = false          -- master toggle (savings account)
Config.SavingsWeekEquivalent = 8     -- number of real days for 1 in-game week (e.g. 8 = 1 real week)
Config.SavingsEODHourUTC = 22        -- hour (0-23) for daily snapshot capture in UTC
Config.SavingsEODMinuteUTC = 00      -- minute (0-59) for daily snapshot capture in UTC
Config.SavingsPayoutStartDate = nil  -- "YYYY-MM-DD" to set payout start date, nil = auto (changing this resets all periods)

Config.SavingsInterestRate = 0.0001            -- weekly interest rate in percentage (e.g. 2.5 = 2.5%)
Config.MaxActiveGoals = 4                   -- Maximum active goals per player
Config.BusinessSavingsInterestRate = 3.0    -- Business savings interest rate (can be different from personal)
Config.BusinessMaxActiveGoals = 5           -- Maximum active goals per business account
Config.CustomSavingsInterestRate = 2.5      -- weekly interest rate for custom account savings
Config.CustomMaxActiveGoals = 5             -- Maximum active goals per custom account

Config.AccountsWithSavings = {
    ["personal"] = false,
    ["business"] = false,
    ["custom"] = false,
}

-- =========================
-- LOANS SETTINGS
-- =========================

Config.EnableLoans = false               -- master toggle for loans
Config.EnableCreditScore = false         -- master toggle for credit score system

Config.AccountsWithLoans = {
    ["personal"] = false,
    ["business"] = false,
    ["custom"] = false,
}

-- 1 real day = 1 game month (86,400 seconds)
Config.TimeScale = {
    gameMonthRealSeconds = 86400, -- change to speed up / slow down months
}

Config.LoanPlans = {
    starter   = { label = "Starter Loan",   maxAmount = 5000,   interestRate = 5.5, months = 12,  enabled = true },
    standard  = { label = "Standard Loan",  maxAmount = 10000,  interestRate = 6.0, months = 24,  enabled = true },
    premium   = { label = "Premium Loan",   maxAmount = 15000,  interestRate = 6.5, months = 36,  enabled = true },
    executive = { label = "Executive Loan", maxAmount = 20000,  interestRate = 7.0, months = 48,  enabled = true },

    -- Custom: per-term custom interest (choose at creation)
    custom    = {
        label = "Custom Loan",
        maxAmount = 500000,
        options = {
            { months = 12, interestRate = 8.5 },
            { months = 24, interestRate = 9.0 },
            { months = 36, interestRate = 10.0 },
            { months = 48, interestRate = 11.0 },
            { months = 60, interestRate = 12.0 },
        },
        enabled = false
    }
}

-- Credit score (affects interestRate in percentage points)
Config.CreditScore = {
    default = 500, min = 300, max = 850,
    bands = {
        { min = 800, label = "Excellent", modifier = -3.0 },
        { min = 700, label = "Very Good", modifier = -2.0 },
        { min = 600, label = "Good",      modifier = -1.0 },
        { min = 500, label = "Fair",      modifier =  0.0 },
        { min = 400, label = "Poor",      modifier =  1.5 },
        { min = 300, label = "Very Poor", modifier =  3.0 },
    },
    deltas = { onTime = 5, late = -10, defaulted = -60 } -- score change on events
}

-- Payments (times in real hours)
Config.Payments = {
    graceHours = 12,                     -- hours after due before marked "late"
    blockNewLoansWhenLate = true,       -- prevent new loans if any late payments

    penalty = {
        pct = 10.0,                     -- % added to installment due each interval
        scoreLoss = 5,                  -- credit score lost each interval
        mode = "compounding",           -- "flat" (once after grace) or "compounding" (repeat)
        intervalHours = 12,             -- every X hours after grace
        capPct = 100.0                  -- max % fee per installment
    },

    defaultHours = 72,                  -- after this many hours late → defaulted (major score hit)
}

Config.MaxActiveLoans = 1               -- Maximum active loans per player
Config.LoanSchedulerInterval = 1800     -- Interval in seconds for loan payment checks (1800 = 30 minutes, 60 = 1 minute)
Config.LoanMaxBankMultiplier = 3.0      -- Maximum loans can be X times the total bank balance (e.g., 2.0 = 2x the bank's total money)


-- =========================
-- WORLD / SOCIETIES / BLIPS
-- =========================
Config.Societies = {
    ["police"] = {},           -- Grades that have full access to the society bank account
    ["ambulance"] = {},
    ["doj"] = {},
}

Config.CreateSocietiesWithPrefix = false

Config.BankLocations = {
	{blip = 108, blipColor = 2, blipScale = 0.7, x = 150.266, y = -1040.203, z = 29.374, blipText = "Bank", BankDistance = 3, boxZone = {pos = vec3(147.5580, -1043.4695, 29.3680), size = vec3(2.85, 0.30, 1.30), rotation = 70, maxZ = 30.9}},
	{blip = 108, blipColor = 2, blipScale = 0.7, x = -1212.980, y = -330.841, z = 37.787, blipText = "Bank", BankDistance = 3, boxZone = {pos = vec3(-1212.1709, -334.1793, 37.7809), size = vec3(2.85, 0.40, 1.30), rotation = 117, maxZ = 39.25}},
	{blip = 108, blipColor = 2, blipScale = 0.7, x = -2962.582, y = 482.627, z = 15.703, blipText = "Bank", BankDistance = 3, boxZone = {pos = vec3(-2959.2910, 481.7591, 15.6979), size = vec3(2.85, 0.40, 1.30), rotation = 178, maxZ = 17.1}},
	{blip = 108, blipColor = 2, blipScale = 0.7, x = -112.202, y = 6469.295, z = 31.626, blipText = "Bank", BankDistance = 3, boxZone = {pos = vec3(-111.69, 6469.5, 31.83), size = vec3(4.2, 0.40, 1.25), rotation = 45, maxZ = 33.15}},
	{blip = 108, blipColor = 2, blipScale = 0.7, x = 314.187, y = -278.621, z = 54.170, blipText = "Bank", BankDistance = 3, boxZone = {pos = vec3(311.9547, -281.7854, 54.1647), size = vec3(2.85, 0.40, 1.30), rotation = 250, maxZ = 55.7}},
	{blip = 108, blipColor = 2, blipScale = 0.7, x = -351.534, y = -49.529, z = 49.042, blipText = "Bank", BankDistance = 3, boxZone = {pos = vec3(-353.1038, -52.6529, 49.0365), size = vec3(2.85, 0.30, 1.30), rotation = 250, maxZ = 50.5}},
	{blip = 108, blipColor = 3, blipScale = 0.7, x = 253.38, y = 220.79, z = 106.29, blipText = "Bank", BankDistance = 3, boxZone = {pos = vec3(252.8, 221.9, 106.20), size = vec3(3.6, 0.20, 1.70), rotation = 250, maxZ = 107.6}},
	{blip = 108, blipColor = 2, blipScale = 0.7, x = 1175.064, y = 2706.643, z = 38.094, blipText = "Bank", BankDistance = 3, boxZone = {pos = vec3(1176.2086, 2710.1167, 38.0879), size = vec3(2.85, 0.40, 1.30), rotation = 270, maxZ = 39.5}},
	{blip = 108, blipColor = 2, blipScale = 0.7, x = 1831.5057, y = 3851.9084, z = 35.8875, blipText = "Bank", BankDistance = 3, boxZone = {pos = vec3(1831.5057, 3851.9084, 35.8875), size = vec3(2.85, 0.40, 1.30), rotation = 270, maxZ = 39.5}},
}

Config.ATMDistance = 1.5
Config.ATM = {
    {model = -870868698},
    {model = -1126237515},
    {model = -1364697528},
    {model = 506770882}
}

-- =========================
-- DISCORD LOGS
-- =========================
Config.BotName = 'Banking'
Config.ServerName = ''
Config.IconURL = ''
Config.DateFormat = '%d/%m/%Y [%X]'

Config.Webhook = {
    -- Banking transactions
    ["deposit"] = { enabled = true, color = '3066993' },
    ["withdraw"] = { enabled = true, color = '15158332' },
    ["transfer"] = { enabled = true, color = '3447003' },
    
    -- Savings (deposit/withdraw/transfer to/from savings)
    ["savings_deposit"] = { enabled = true, color = '3066993' },
    ["savings_withdraw"] = { enabled = true, color = '15158332' },
    ["savings_transfer"] = { enabled = true, color = '3447003' },
    
    -- Loans
    ["loan_create"] = { enabled = true, color = '16776960' },
    
    -- Custom Accounts
    ["account_create"] = { enabled = true, color = '3066993' },
    ["account_delete"] = { enabled = true, color = '15158332' },
    
    -- Account User Management
    ["account_add_user"] = { enabled = true, color = '3066993' },
    ["account_remove_user"] = { enabled = true, color = '15158332' },
    ["account_change_permissions"] = { enabled = true, color = '16776960' },
}


-- =========================
-- LOCALES (DON'T TOUCH)
-- =========================
function _L(id)
    if Locales[Config.Locale] and Locales[Config.Locale][id] then
        return Locales[Config.Locale][id]
    else
        print("Locale '"..tostring(id).."' doesn't exist")
        return nil
    end
end
