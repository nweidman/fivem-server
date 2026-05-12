-- if you use fivemanage webhooks you will need to create a dataset with the name [ jim_g_trading_cards ] 
-- or change this to your dataset name.
-- also make sore you have set FIVEMANAGE_LOGS_API_KEY "your_logs_api_key" set in server.cfg
FivemanageWebhooks = false
FivemanageDataset = 'jim_g_trading_cards'

-- discord
DiscordWebhooks = false

DiscordHook = {
-- was set for testing i recomend using [ shop_buy_basket ] instead as this show each card individually
    shop_buy = { enabled = false, url = 'ADD_WEBHOOK_URL_HERE', color = 3066993 }, -- Shop buy webhook color
-------------------------------------------------------------------------------------------------------
    shop_buy_basket = { enabled = false, url = 'ADD_WEBHOOK_URL_HERE', color = 3066993 },
    shop_sell = { enabled = false, url = 'ADD_WEBHOOK_URL_HERE', color = 15158332 },
    pack_use = { enabled = false, url = 'ADD_WEBHOOK_URL_HERE', color = 3447003 },
    rewards = { enabled = false, url = 'ADD_WEBHOOK_URL_HERE', color = 5793266 },
    grading_use = { enabled = false, url = 'ADD_WEBHOOK_URL_HERE', color = 10181046 },
    grade_card = { enabled = false, url = 'ADD_WEBHOOK_URL_HERE', color = 10181046 },
    deck_add = { enabled = false, url = 'ADD_WEBHOOK_URL_HERE', color = 15844367 },
    deck_remove = { enabled = false, url = 'ADD_WEBHOOK_URL_HERE', color = 15158332 },
    binder_add = { enabled = false, url = 'ADD_WEBHOOK_URL_HERE', color = 15844367 },
    binder_remove = { enabled = false, url = 'ADD_WEBHOOK_URL_HERE', color = 15158332 },

-- only use this if you are taking inveotry images of the cards and debug is true otherwise leave as enabled = false
-- if no webhook is added it will save images locally in [ ui/inv_umages ] at size 200x200
    screenshot_image = { enabled = false, url = 'ADD_WEBHOOK_URL_HERE', color = 5793266 }
}
