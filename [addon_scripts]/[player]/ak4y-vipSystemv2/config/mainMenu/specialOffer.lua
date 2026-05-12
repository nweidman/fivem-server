AK4Y.specialOffer = {
    id = 1,
	label = "STARTER PACK",
	itemName = "special_offer", -- dont change
	description = "The Starter Pack is perfect for new players! It includes essential items and a vehicle to help you get started.",
	itemType = "bundle", -- dont change
	pageValue = "specialOffer", -- dont CHANGE
	giveItems = { 
		{ label = "Campy", itemName = "204sCampy", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/204sCampy.png"},                   
        { label = "Project X17", itemName = "weapon_projectxpistolum", itemCount = 1, itemType = "weapon", itemImg = "./itemImages/weapon_projectxpistolum.png"},
        { label = "Pistol Case", itemName = "pistol_case", itemCount = 14, itemType = "item", itemImg = "./itemImages/pistol_case.png"},
		{ label = "Radio", itemName = "radio", itemCount = 1, itemType = "item", itemImg = "./itemImages/radio.png"},
		{ label = "Outfit Bag", itemName = "kq_outfitbag", itemCount = 1, itemType = "item", itemImg = "./itemImages/kq_outfitbag.png"},
		{ label = "Skateboard", itemName = "skateboard", itemCount = 1, itemType = "item", itemImg = "./itemImages/skateboard.png"},
		{ label = "Individual First Aid Kit", itemName = "ifaks", itemCount = 10, itemType = "item", itemImg = "./itemImages/ifaks.png"},
		{ label = "Hunting Rifle", itemName = "weapon_huntingrifle", itemCount = 1, itemType = "item", itemImg = "./itemImages/weapon_huntingrifle.png"},
		{ label = "Hunting Ammo", itemName = "hunting_ammo", itemCount = 30, itemType = "item", itemImg = "./itemImages/hunting_ammo.png"},
		{ label = "Metal Detector", itemName = "blue_metaldetector", itemCount = 1, itemType = "item", itemImg = "./itemImages/blue_metaldetector.png"},
		{ label = "Shovel", itemName = "md_shovel", itemCount = 1, itemType = "item", itemImg = "./itemImages/md_shovel.png"},
        -- { label = "Money ($10.000)", itemName = "money", itemCount = 10000, itemType = "money", itemImg = "./itemImages/dirtymoney.png"},
    },
	price = 3000, -- price without discount
	discount = {
		state = true, -- true or false
		newPrice = 2000, -- price with discount
	},
}