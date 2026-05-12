Config = Config or {}

Config.Side = "right"

Config.Core = 'qb-core'

Config.MaxJobs = 3
Config.IgnoredJobs = {
	["unemployed"] = true,
}

-- Config.NonLimitJobs = {
-- 	["realestate"] = true,
-- }

Config.DenyDuty = {
}

Config.WhitelistJobs = {
	["police"] = true,
	["ambulance"] = true,
	["doj"] = true,
	["realestate"] = true,
}

-- Config.MechJobs = {
-- 	["lscustoms"] = true,
-- 	["bennys"] = true,
-- 	["eastside"] = true,
-- 	["paletotuner"] = true,
-- }

-- Config.FoodJobs = {
-- 	["catcafe"] = true,
-- 	["hornys"] = true,
-- 	["pizzapit"] = true,
-- 	["greasypb"] = true,
-- }

-- Config.WeedJobs = {
-- 	["whitewidow"] = true,
-- 	["highnote"] = true,
-- }

-- Config.DealershipJobs = {
-- 	["lux"] = true,
-- 	["pdm"] = true,
-- 	["offroad"] = true,
-- 	["moto"] = true,
-- }

Config.Descriptions = {
	["unemployed"] = "Between jobs and exploring opportunities.",
	["police"] = "Enforcing laws and protecting the community.",
	["ambulance"] = "Providing emergency medical care and saving lives.",
	["doj"] = "Delivering justice and ensuring fair legal processes.",
	["realestate"] = "Helping clients buy, sell, and manage residential and commercial properties.",
	["pdm"] = "Selling standard vehicles and assisting customers with purchases.",
	["lux"] = "Selling premium and luxury vehicles to high-end clients.",
	["badlands"] = "Selling off-road vehicles, motorcycles, and adventure rides.",
	["lscustoms"] = "Repairing, modifying, and upgrading vehicles.",
	["ccm"] = "Repairing, modifying, and upgrading vehicles.",
	["ss"] = "Repairing, modifying, and upgrading vehicles.",
	["esm"] = "Repairing, modifying, and upgrading vehicles.",
	["stance"] = "Repairing, modifying, and upgrading vehicles.",
	["highnote"] = "Selling cannabis products and running a legal dispensary.",
	["auction"] = "Hosting auctions and selling valuable goods.",
	["bahama"] = "Serving drinks and entertaining guests at the bar.",
	["photo"] = "Capturing photos and providing professional photography services.",
	["hobo"] = "Surviving through odd jobs and street hustles.",
	["dj"] = "Playing music at events and hyping up crowds.",
	["pitapan"] = "Preparing and serving fresh sandwiches and street foods.",
	["saltlabsmoothies"] = "Blending and serving fresh smoothies and healthy drinks.",
	["lilypad"] = "Providing specialty meals and handcrafted refreshments.",
	["moo"] = "Serving dairy treats, snacks, and specialty drinks.",
	["boathouse"] = "Serving fresh meals and drinks by the water.",
	["smoking"] = "Selling vape products, e-liquids, and accessories.",
}

Config.FontAwesomeIcons = {
	["unemployed"] = "fa-solid fa-user",
	["police"] = "fa-solid fa-shield-alt",
	["ambulance"] = "fa-solid fa-ambulance",
	["doj"] = "fa-solid fa-gavel",
	["realestate"] = "fa-solid fa-building",
	["pdm"] = "fa-solid fa-car",
	["lux"] = "fa-solid fa-gem",
	["badlands"] = "fa-solid fa-motorcycle",
	["lscustoms"] = "fa-solid fa-tools",
	["ccm"] = "fa-solid fa-tools",
	["ss"] = "fa-solid fa-tools",
	["esm"] = "fa-solid fa-tools",
	["stance"] = "fa-solid fa-tools",
	["highnote"] = "fa-solid fa-cannabis",
	["auction"] = "fa-solid fa-gavel",
	["bahama"] = "fa-solid fa-cocktail",
	["photo"] = "fa-solid fa-camera",
	["hobo"] = "fa-solid fa-walking",
	["dj"] = "fa-solid fa-music",
	["pitapan"] = "fa-solid fa-utensils",
	["saltlabsmoothies"] = "fa-solid fa-blender",
	["lilypad"] = "fa-solid fa-hamburger",
	["moo"] = "fa-solid fa-ice-cream",
	["boathouse"] = "fa-solid fa-utensils",
	["smoking"] = "fa-solid fa-smoke",
}
