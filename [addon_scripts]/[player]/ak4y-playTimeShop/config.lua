-- ak4y dev.

-- IF YOU HAVE ANY PROBLEM OR DO YOU NEED HELP PLS COME TO MY DISCORD SERVER AND CREATE A TICKET
-- IF YOU DONT HAVE ANY PROBLEM YET AGAIN COME TO MY DISCORD :)
-- https://discord.gg/kWwM3Bx

AK4Y = {}

AK4Y.Framework = "qb" -- qb / oldqb | qb = export system | oldqb = triggerevent system
AK4Y.Mysql = "oxmysql" -- Check fxmanifest.lua when you change it! | ghmattimysql / oxmysql / mysql-async
AK4Y.OpenCommand = ""
AK4Y.DefaultGarage = "Legion Square" -- purchased vehicles will be sent to this garage
AK4Y.RewardCoin = 25
AK4Y.NeededPlayTime = 60 -- Minutes

AK4Y.Language = {
    title1 = "",
    title2 = "Playtime",
    coin = "COIN",
    nextReward = "FOR THE NEXT COIN REWARD",
    exit = "EXIT",
    reward = "REWARD :",
    title3 = "TOP",
    title4 = "PLAYERS",
    title5 = "PLAYTIME",
    title6 = "SHOP",
    cancel = "CANCEL",
    buy = "BUY",
    accept = "ACCEPT",
    realCurrency = "$",
    nextPage = "NEXT PAGE",
    previousPage = "PREVIOUS PAGE",
    succesfully = "SUCCESSFULLY",
    purchased = "PURCHASED",
    invalidCode = "INVALID CODE!",
    thxForPurch = "Thanks for purchasing!",
    top = "TOP",
    youDntHvEngMoney = "YOU DONT HAVE ENOUGH MONEY!",
    text6 = "6",
}

AK4Y.Categories = {
    { category = "items", icon = "fa-solid fa-cookie-bite", items = {} }, -- do not touch items section..
    { category = "weapons", icon = "fa-solid fa-gun", items = {} }, -- do not touch items section..
    { category = "vehicles", icon = "fa-solid fa-car", items = {} }, -- do not touch items section..
}

-- itemType : vehicle, weapon, item, money
AK4Y.Items = {
    { id = 1, itemName = "weapon_pistol", label = "PISTOL", price = 50, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_pistol.png" },
    { id = 2, itemName = "pistol_ammo", label = "PISTOL AMMO", price = 50, count = 100, itemType = "weapon", category = "weapons", image = "./images/pistol_ammo.png" },
    { id = 3, itemName = "suppressor", label = "SUPPRESSOR", price = 300, count = 1, itemType = "weapon", category = "weapons", image = "./images/pistol_suppressor.png" },
    { id = 4, itemName = "weapon_poolnoodle", label = "POOL NOODLE", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_poolnoodle.png" },
    { id = 5, itemName = "weapon_blowup_hammer", label = "BLOWUP HAMMER", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_blowup_hammer.png" },
    { id = 6, itemName = "weapon_katana4", label = "KATANA", price = 450, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_katana4.png" },
    { id = 7, itemName = "weapon_sledgehammer", label = "SLEDGEHAMMER", price = 450, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_sledgehammer.png" },
    { id = 8, itemName = "weapon_karambit", label = "KARAMBIT", price = 450, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_karambit.png" },
    { id = 9, itemName = "weapon_glow_bat", label = "GLOW BAT", price = 450, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_glow_bat.png" },
    { id = 30, itemName = "WEAPON_TARANTULA", label = "PAINTBALL GUN", price = 300, count = 1, itemType = "weapon", category = "weapons", image = "./images/WEAPON_TARANTULA.png" },
    { id = 31, itemName = "paint_ammo", label = "PAINTBALLS", price = 150, count = 400, itemType = "weapon", category = "weapons", image = "./images/paint_ammo.png" },
    { id = 32, itemName = "WEAPON_WATERGUN", label = "WATERGUN", price = 500, count = 1, itemType = "weapon", category = "weapons", image = "./images/WEAPON_WATERGUN.png" },
    { id = 33, itemName = "weapon_valaxe", label = "Heart Axe", price = 300, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_valaxe.png" },
    { id = 34, itemName = "weapon_valclever", label = "Heart Cleaver", price = 300, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_valclever.png" },
    { id = 35, itemName = "weapon_valknife", label = "Heart Knife", price = 300, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_valknife.png" },
    { id = 36, itemName = "weapon_valspikedbat", label = "Spiked Bat", price = 300, count = 1, itemType = "weapon", category = "weapons", image = "./images/weapon_valspikedbat.png" },

    { id = 10, itemName = "granddaddypurple_joint", label = "GRAND DADDY PURP JOINT", price = 25, count = 10, itemType = "item", category = "items", image = "./images/ww_granddaddypurple_joint.png" },
    { id = 11, itemName = "dbjuice", label = "DUMB BITCH JUICE", price = 25, count = 10, itemType = "item", category = "items", image = "./images/dbsoda.png" },
    { id = 12, itemName = "naughtynachos", label = "NAUGHTY NACHOS", price = 25, count = 10, itemType = "item", category = "items", image = "./images/bento.png" },
    { id = 13, itemName = "radio", label = "RADIO", price = 25, count = 1, itemType = "item", category = "items", image = "./images/radio.png" },
    { id = 14, itemName = "kq_outfitbag", label = "OUTFIT BAG", price = 75, count = 5, itemType = "item", category = "items", image = "./images/kq_outfitbag.png" },
    { id = 15, itemName = "ifaks", label = "IFAKS", price = 100, count = 20, itemType = "item", category = "items", image = "./images/ifaks.png" },
    { id = 16, itemName = "money", label = "MONEY", price = 200, count = 25000, itemType = "money", category = "items", image = "./images/money.png" },
    { id = 17, itemName = "armor", label = "ARMOR", price = 250, count = 10, itemType = "item", category = "items", image = "./images/armor.png" },
    { id = 18, itemName = "heavyarmor", label = "HEAVY ARMOR", price = 350, count = 10, itemType = "item", category = "items", image = "./images/heavyarmor.png" },
    { id = 19, itemName = "mysterybag", label = "MYSTERY BAG", price = 400, count = 1, itemType = "item", category = "items", image = "./images/mysterybag.png", repeatable = true },
    { id = 20, itemName = "goldbar", label = "GOLD BARS", price = 450, count = 15, itemType = "item", category = "items", image = "./images/goldbar.png", maxPurchases = 2 },
    { id = 21, itemName = "money", label = "MONEY", price = 500, count = 50000, itemType = "money", category = "items", image = "./images/money.png" },

    { id = 22, itemName = "komoda", label = "KOMODA", price = 300, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/komoda.png", maxPurchases = 2 },
    { id = 23, itemName = "204sBarHopper", label = "BAR HOPPER", price = 500, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/204sBarHopper.png" },
    { id = 24, itemName = "blrmns", label = "BALLER X", price = 5000, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/blrmns.png" },
    { id = 25, itemName = "204sXenonShart4", label = "SCART 4", price = 4000, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/204sXenonShart4.png" },
    { id = 26, itemName = "204sf92", label = "G3", price = 5000, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/204sF92.png" },
    { id = 27, itemName = "204s24Buffalo", label = "BUFFALO X", price = 6500, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/204s24Buffalo.png" },
    { id = 28, itemName = "festruck", label = "PARTY TRUCK", price = 12000, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/festruck.png" },
    { id = 29, itemName = "rrcontfloater", label = "Baron Boat", price = 5000, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/rrcontfloater.png" },
    { id = 37, itemName = "Killer190E", label = "X3", price = 5000, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/Killer190E.png" },
    { id = 38, itemName = "speedmini", label = "Two Point OH", price = 5000, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/speedmini.png" },
    { id = 39, itemName = "gcscoot", label = "eBike", price = 2000, count = 1, itemType = "vehicle", category = "vehicles", image = "./images/gcscoot.png" },
}

AK4Y.CoinList = {
    { coinCount = 300, realPrice = 30, link = "https://www.yourTebexLink.com/crediAmountPage.html", image = "./images/coin.png" },
    { coinCount = 100, realPrice = 50, link = "https://www.yourTebexLink.com/crediAmountPage.html", image = "./images/coin.png" },
    { coinCount = 700, realPrice = 70, link = "https://www.yourTebexLink.com/crediAmountPage.html", image = "./images/coin.png" },
    { coinCount = 900, realPrice = 90, link = "https://www.yourTebexLink.com/crediAmountPage.html", image = "./images/coin.png" },
    { coinCount = 1200, realPrice = 120, link = "https://www.yourTebexLink.com/crediAmountPage.html", image = "./images/coin.png" },
    { coinCount = 1500, realPrice = 150, link = "https://www.yourTebexLink.com/crediAmountPage.html", image = "./images/coin.png" },
}