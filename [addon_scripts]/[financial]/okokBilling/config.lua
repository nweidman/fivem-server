Config, Locales = {}, {}

Config.Debug = false -- This help find the source of a problem 

Config.OnlyUnpaidCityInvoices = false

Config.OnlyUnpaidSocietyInvoices = false

Config.EventPrefix = 'okokBilling'

Config.Locale = 'en'

Config.DatabaseTable = 'okokbilling'

Config.ReferencePrefix = 'OK'

Config.OpenMenuKey = 168 -- Default 168 (F7)

Config.OpenMenuCommand = 'invoices' -- Command to open the menu

Config.UseOKOKNotify = true -- If set to true it will use okokNotify, if set to false it will use the QB notify

Config.UseOKOKBankingTransactions = false -- If set to true it will register the bills to okokBanking transactions

Config.InvoiceDistance = 5

Config.AllowPlayersInvoice = false -- if players can create Player to Player invoices

Config.okokRequests = false -- Player to Player invoices only, to avoid abuse

Config.AuthorReceivesAPercentage = true -- When sending a society invoice

Config.AuthorPercentage = 50 -- Percentage that the invoice author receives

Config.VATPercentage = 0

Config.SocietyReceivesLessWithVAT = false

Config.QBManagement = true -- If set to true it will use the qb-management resource, if set to false it will use the okokBanking database tables

Config.UseQBBanking = false -- Useful for latest QBCore versions

Config.SocietyHasSocietyPrefix = false -- *Do not touch this if the resource is working correctly* If set to true it'll search for `society_police` (example) when paying a society invoice

Config.AutoDeletePaidInvoices = true -- true: Deletes paid invoices (to reduce lag) | false: Doesn't delete paid invoices.

Config.DeletePaidInvoicesEvery = 30 -- How often it should delete the paid invoices (in minutes)

Config.AuthorReceiveNotification = true -- If set to true it will send a notification to the author when the invoice is paid

-- Autopay

Config.UseAutoPay = true

Config.AllowMoneyToGoNegative = true -- If set to true it will allow the player to go negative

Config.DefaultLimitDate = 3 -- Days for limit pay date

Config.CheckForUnpaidInvoicesEvery = 30 -- minutes

Config.FeeAfterEachDay = true

Config.FeeAfterEachDayPercentage = 5

-- Autopay

Config.JobsWithCityInvoices = { -- Which jobs have City Invoices (They will be allowed to delete any invoice) | Admins will have access by default
	'court'
}

Config.CityInvoicesAccessRanks = { -- Which jobs have City Invoices (They will be allowed to delete any invoice)
	'' -- All of them have access
}

Config.AllowedSocieties = { -- Which societies can access the Society Invoices
	'police',
	'ambulance',
	'doj',
}

Config.InspectCitizenSocieties = { -- Which societies can access the Society Invoices
	'police',
	'doj',
	'sheriff'
}

Config.SocietyAccessRanks = { -- Which ranks of the society have access to Society Invoices and City Invoices
	'Chief Justice',
	'Attorney General',
	'Medical Chief',
	'Dep. Medical Chief',
	'Commissioner',
	'Sheriff',
	'Chief',
	'Undersheriff',
	'Assistant Chief',
	'Chief Deputy',
	'Commander',
}

Config.BillsList = {
	['police'] = {
		{'Weapons License', 10000}, -- If set without a price it'll let the players create a custom invoice (custom price)
		{'Custom'}, -- If set without a price it'll let the players create a custom invoice (custom price)
	},
	-- ['sheriff'] = {
	-- 	{'Weapons License', 10000}, -- If set without a price it'll let the players create a custom invoice (custom price)
	-- 	{'Custom'}, -- If set without a price it'll let the players create a custom invoice (custom price)
	-- },
	['ambulance'] = {
		{'Ambulance Ride', 3000},
		{'Angel 1 Ride', 3250},
		{'Walk In Treatment', 2500},
		{'Minor Injury', 1500},
		{'PD & EMS', 1250},	
	},
	['doj'] = {
		{'Weapons License', 10000},
		{'Custom'}, -- If set without a price it'll let the players create a custom invoice (custom price)
	},
}

Config.AdminGroups = {
	'god',
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to sv_utils.lua, line 3

Config.BotName = 'ServerName' -- Write the desired bot name

Config.ServerName = 'ServerName' -- Write your server's name

Config.IconURL = '' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.CreatePersonalInvoiceWebhookColor = '65535'

Config.CreateJobInvoiceWebhookColor = '16776960'

Config.CancelInvoiceWebhookColor = '16711680'

Config.PayInvoiceWebhookColor = '65280'

-------------------------- LOCALES (DON'T TOUCH)

function _L(id) 
	if Locales[Config.Locale][id] then 
		return Locales[Config.Locale][id] 
	else 
		print('Locale '..id..' doesn\'t exist') 
	end 
end