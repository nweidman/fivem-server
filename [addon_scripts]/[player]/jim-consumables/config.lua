-- print("^2Jim^7-^2Consumables ^7v^41^7.^45 ^7- ^2Consumables Script by ^1Jimathy^7")

-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.gg/xKgQZ6wZvS

Config = {
	Debug = false,
	Core = "qb-core",

	Inv = "ox", -- set to "ox" if using ox_inventory
	Notify = "ox",  -- set to "ox" if using ox_lib

	UseProgbar = true,
	ProgressBar = "ox", -- set to "ox" if using ox_lib

	Consumables = {
		-- Default QB food and drink item override

		--Effects can be applied here, like stamina on coffee for example
		-- ["vodka"] = { 			emote = "vodkab", 		canRun = false, 	time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "alcohol", stats = { effect = "stress", time = 5000, amount = 2, thirst = math.random(10,20), canOD = true }},
		-- ["beer"] = { 			emote = "beer", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10,20), canOD = true }},
		-- ["whiskey"] = { 		emote = "whiskey",  	canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "alcohol", stats = { thirst = math.random(10,20), canOD = true }},

		-- ["sandwich"] = { 		emote = "sandwich", 	canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10,20), }},
		-- ["twerks_candy"] = { 	emote = "egobar", 		canRun = true, 		time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10,20), }},
		-- ["snikkel_candy"] = { 	emote = "egobar", 		canRun = true, 		time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10,20), }},
		-- ["tosti"] = { 			emote = "sandwich", 	canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "food", stats = { hunger = math.random(10,20), }},

		-- ["coffee"] = { 			emote = "coffee", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { effect = "stamina", time = 10000, thirst = math.random(10,20), }},
		-- ["water_bottle"] = { 	emote = "drink", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10,20), }},
		-- ["kurkakola"] = { 		emote = "ecola", 		canRun = false, 	time = math.random(5000, 6000), stress = math.random(2, 4), heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(10,20), }},

		--[[----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		-- Items that effect status changes, like bleeding can cause problems as they are all handled in their own scripts
		-- Testing these but they may be best left handled by default scripts
		["ifaks"] = { 			emote = "oxy", 		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 10, armor = 0, type = "drug", stats = { effect = "heal", amount = 6, widepupils = false, canOD = false } },
		["bandage"] = { 		emote = "oxy", 		time = math.random(5000, 6000), stress = 0, heal = 10, armor = 0, type = "drug", stats = { effect = "heal", amount = 3, widepupils = false, canOD = false } }, },
		]]

		--Testing effects & armor with small functionality to drugs - This may be another one left to default scripts
		-- ["joint"] = { 			emote = "smoke3",	time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 10, type = "drug", stats = { screen = "weed", effect = "armor", widepupils = false, canOD = false } },

		-- ["cokebaggy"] = { 		emote = "coke",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 0, type = "drug", stats = { screen = "focus", effect = "stamina", widepupils = false, canOD = true } },
		--["crackbaggy"] = { 		emote = "coke",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 0, type = "drug", stats = { effect = "heal", widepupils = false, canOD = true } },
		-- ["xtcbaggy"] = { 		emote = "oxy",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 10, type = "drug", stats = { effect = "strength", widepupils = true, canOD = true } },
		-- ["oxy"] = { 			emote = "oxy",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 0, type = "drug", stats = { effect = "heal", widepupils = false, canOD = false } },
		-- ["meth"] = { 			emote = "coke",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 10, type = "drug", stats = { effect = "stamina", widepupils = false, canOD = true } },
		----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

		----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		--BAHAMA MAMAS
		["islandsplash"] = { emote = "bahahamama", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},
		["exoticescape"] = { emote = "longisland", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},
		["creamingbananas"] = { emote = "xmasicecream", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["srirachatails"] = { emote = "shrimp", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["naughtynachos"] = { emote = "nachos", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["hawtwings"] = { emote = "kebab", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		
		-- KEBAB KING
		["baklava"] = { emote = "tresleche", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["kebabwrap"] = { emote = "kebabwrap", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["pizzamargherita"] = { emote = "pizza", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["falafel"] = { emote = "falafel", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["shishkebab"] = { emote = "kebab", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["mintlemonade"] = { emote = "lemonade", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},
		["pomegranatejuice"] = { emote = "bloodymary", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},
		["yogurtdrink"] = { emote = "coconutdrink", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},
		
		-- POND
		["cheeseburger"] = { emote = "burger", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["bbqribs"] = { emote = "kebab", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["pondfries"] = { emote = "fries", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["dinonuggets"] = { emote = "fries", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["applepie"] = { emote = "applepie", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["dbjuice"] = { emote = "dbsoda", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},
		["sweettea"] = { emote = "tea", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},
		["rootbeerfloat"] = { emote = "bigbeer", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},

		-- Moo Moo Cafe
		["buttercroissant"] = { emote = "croissant", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["mooberrymuffin"] = { emote = "muffin", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["avocadotoast"] = { emote = "toast", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["cowbagel"] = { emote = "bagel", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["chocolatemookie"] = { emote = "cookie", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["moochalatte"] = { emote = "coffee", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},
		["cowhotchocolate"] = { emote = "coffee", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},
		["cappuccino"] = { emote = "coffee", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},

		--Boat House
		["grilledsalmon"] = { emote = "fishplate", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["seafoodgumbo"] = { emote = "foodbowl", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["lobsterroll"] = { emote = "lobsterplate", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["fishandchips"] = { emote = "fishandchips", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["seafoodboil"] = { emote = "foodbowl", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["citrusicedtea"] = { emote = "longisland", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},
		["seabreeze"] = { emote = "screwdriver", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},
		["cucumbermintcooler"] = { emote = "moscowmule", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},

		-- Salt Lab Smoothies
		["yogurtparfait"] = { emote = "tadpole_pudding_nilla", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["chiaseedpudding"] = { emote = "tadpole_pudding_choc", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["acaibowl"] = { emote = "tadpole_pudding_nilla", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(40, 50)}},
		["matchasmoothie"] = { emote = "pondshake_matcha", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},
		["berryblast"] = { emote = "tadpole_tea_blue", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},
		["proteinshake"] = { emote = "proteinshake", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},
		["greenenergizer"] = { emote = "lilypad_spritz", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},
		["bananafusion"] = { emote = "pondshake_berry", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(40, 50)}},

		-- 24/7s
		["hotdog"] = { emote = "hotdog", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 25)}},
		["hoagie"] = { emote = "sub", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 25)}},
		["pocketz"] = { emote = "bananabread", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(20, 25)}},
		["chocolatebar"] = { emote = "egobar", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(15, 20)}},
		["gummyworms"] = { emote = "candy", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "food", stats = { hunger = math.random(15, 20)}},
		["juicebox"] = { emote = "water", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20, 25)}},
		["greentea"] = { emote = "coffee", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(20, 25)}},
		["popsoda"] = { emote = "ecola", canRun = false, time = math.random(5000, 6000), stress = 0, heal = 0, armor = 0, type = "drink", stats = { thirst = math.random(15, 20)}},
	},
	Emotes = {
		["torpedo"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Torpedo", AnimationOptions = 
			{ Prop = "prop_food_bs_burger2", PropBone = 18905, PropPlacement = {0.10, -0.07, 0.091, 15.0, 135.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["coffee"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee", AnimationOptions =
			{ Prop = 'p_amb_coffeecup_01', PropBone = 28422, PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
				EmoteLoop = true, EmoteMoving = true }},
		["water"] = {"mp_player_intdrink", "loop_bottle", "Water", AnimationOptions =
			{ Prop = 'vw_prop_casino_water_bottle_01a', PropBone = 60309, PropPlacement = {0.0080,0.0,-0.0500,0.0,0.0,-40.0000},
				EmoteLoop = true, EmoteMoving = true }},
		["tea"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Tea", AnimationOptions =
			{ Prop = 'bzzz_food_xmas_mug_b', PropBone = 28422, PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
				EmoteLoop = true, EmoteMoving = true }},
		["burger"] = { "mp_player_inteat@burger", "mp_player_int_eat_burger", "Burger",	AnimationOptions =
			{ Prop = 'prop_cs_burger_01', PropBone = 18905, PropPlacement = {0.13,0.05,0.02,-50.0,16.0,60.0},
				EmoteMoving = true }},
		["beer"] = {"amb@world_human_drinking@beer@male@idle_a", "idle_c", "Beer", AnimationOptions =
			{ Prop = 'prop_amb_beer_bottle', PropBone = 28422, PropPlacement = {0.0,0.0,0.06,0.0,15.0,0.0},
				EmoteLoop = true, EmoteMoving = true }},
		["egobar"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger","Ego Bar", AnimationOptions =
			{ Prop = 'prop_choc_ego', PropBone = 60309, PropPlacement ={0.0,0.0,0.0,0.0,0.0,0.0},
				EmoteMoving = true }},
		["sandwich"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Sandwich", AnimationOptions =
			{ Prop = 'prop_sandwich_01', PropBone = 18905, PropPlacement = {0.13,0.05,0.02,-50.0,16.0,60.0},
				EmoteMoving = true }},
		["smoke3"] = { "amb@world_human_aa_smoke@male@idle_a", "idle_b", "Smoke 3", AnimationOptions =
			{ Prop = 'prop_cs_ciggy_01', PropBone = 28422, PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
				EmoteLoop = true, EmoteMoving = true }},
		["whiskey"] = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Whiskey", AnimationOptions =
			{ Prop = 'prop_drink_whisky', PropBone = 28422, PropPlacement = {0.01,-0.01,-0.06,0.0,0.0,0.0},
				EmoteLoop = true, EmoteMoving = true } },
		["ecola"] = {"mp_player_intdrink", "loop_bottle", "E-cola", AnimationOptions =
			{ Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
				EmoteMoving = true, EmoteLoop = true, }},
		["fries"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Fries", AnimationOptions = 
			{ Prop = "prop_food_bs_chips", PropBone = 18905, PropPlacement = {0.09, -0.06, 0.05, 300.0, 150.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["cbfries"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "CBFries", AnimationOptions =
   			 {    Prop = "prop_food_cb_chips", PropBone = 18905, PropPlacement = {0.09, -0.06, 0.05, 300.0, 150.0},
         EmoteMoving = true, EmoteLoop = true, }},
		["icecream"] = {"mp_player_inteat@burger",	"mp_player_int_eat_burger",	"Ice Cream", AnimationOptions = 
			{ Prop = 'bzzz_icecream_lemon', PropBone = 18905, PropPlacement = {0.14, 0.03, 0.01, 85.0, 70.0, -203.0},
				EmoteMoving = true, EmoteLoop = true,}},
		["milkshake"] = {"smo@milkshake_idle", "milkshake_idle_clip", "Milkshake", AnimationOptions = 
			{ Prop = 'brum_cherryshake_chocolate', PropBone = 28422, PropPlacement = {0.0850, 0.0670, -0.0350, -115.0862, -165.7841, 24.1318},
				EmoteLoop = true, EmoteMoving = true}},
		["dbsoda"] = {"smo@milkshake_idle", "milkshake_idle_clip", "Dumb Bitch Juice", AnimationOptions = 
			{ Prop = 'dumbbitchjuice', PropBone = 28422, PropPlacement = {0.0100, -0.0800, -0.0600, -71.5400, 74.5200, -2.4000},
				EmoteLoop = true, EmoteMoving = true}},		
		["kebab"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Kebab", AnimationOptions = 
			{ Prop = "bzzz_skewerpack_pork-bbq_a", PropBone = 60309, PropPlacement = {0.0, 0.0, 0.0, -10.0, -90.0, 0.0}, 
				EmoteMoving = true, EmoteLoop = true, }},		
		["xmasicecream"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "Xmas Ice Cream", AnimationOptions = 
			{ Prop = "pata_christmasfood7", PropBone = 60309, PropPlacement = {-0.0460, 0.0000, -0.0300,  0.0,  0.0, -50.0}, SecondProp = 'h4_prop_h4_coke_spoon_01', SecondPropBone = 28422, SecondPropPlacement = {0.0,0.0,0.0,0.0,20.0,0.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["shrimp"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "Shrimp plate", AnimationOptions = 
			{ Prop = "bzzz_restaurant_food_j", PropBone = 60309, PropPlacement = {0.0030, 0.0000, -0.0300,  0.0,  0.0, -50.0}, SecondProp = 'bzzz_restaurant_material_shrimp_a', SecondPropBone = 28422, SecondPropPlacement = {0.0,0.02,0.0,0.0,20.0,0.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["nachos"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "Nachos", AnimationOptions = 
			{ Prop = "bzzz_food_nachos_a", PropBone = 60309, PropPlacement = {-0.04, 0.07, -0.01,  0.00, 0.00, 0.00},
				EmoteMoving = true, EmoteLoop = true, }},
		["tresleche"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Tres Leche", AnimationOptions = 
			{ Prop = "bzzz_sugary_treslechescake_a", PropBone = 60309, PropPlacement = {-0.02, 0.0, -0.01, 20.0, -32.0, 82.0},
				EmoteMoving = true, EmoteLoop = true, }},
		["kebabwrap"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Kebab Wrap", AnimationOptions = 
			{ Prop = "bzzz_food_kebab_a", PropBone = 60309, PropPlacement = {-0.02, 0.02, -0.02,-80.00, -30.00, 50.00},
				EmoteMoving = true, EmoteLoop = true, }},				
		["croissant"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Croissant", AnimationOptions = 
			{ Prop = "bzzz_food_bakery_croissant_a", PropBone = 60309, PropPlacement = {0.03, 0.01, -0.05,54.0, 0.0, 0.0},
				EmoteMoving = true, EmoteLoop = true, }},	
		["muffin"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Muffin", AnimationOptions = 
			{ Prop = "bzzz_food_bakery_muffin_a", PropBone = 60309, PropPlacement = {0.04, -0.01, -0.03,-12.0, -84.0, 0.0},
				EmoteMoving = true, EmoteLoop = true, }},	
		["toast"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Avocado Pond Toast", AnimationOptions = 
			{ Prop = "pond_toast", PropBone = 60309, PropPlacement = {0.02,0.005,-0.03,55.0000,-50.0000,55.0000},
				EmoteMoving = true, EmoteLoop = true, }},	
		["bagel"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Bagel", AnimationOptions = 
			{ Prop = "bzzz_food_bakery_bagel_a", PropBone = 60309, PropPlacement = {-0.01, -0.02, -0.04,46.0, 0.0, 0.0},
				EmoteMoving = true, EmoteLoop = true, }},	
		["fishplate"] = {'bzzz@restaurant@eat', 'bzzz_restaurant_eat', "Grilled fish", AnimationOptions = 
			{ Prop = "bzzz_restaurant_food_d", PropBone = 60309, PropPlacement = {0.08, -0.04, 0.07,-30.0, 10.0, 0.0}, SecondProp = 'bzzz_restaurant_fork_d', SecondPropBone = 28422, SecondPropPlacement = {0.07, 0.05, -0.03,-100.0, 24.0, -86.0},
				EmoteMoving = true, EmoteLoop = true, }},
		["lobsterplate"] = {'bzzz@restaurant@eat', 'bzzz_restaurant_eat', "Grilled fish", AnimationOptions = 
			{ Prop = "bzzz_restaurant_food_g", PropBone = 60309, PropPlacement = {0.08, -0.04, 0.07,-30.0, 10.0, 0.0}, SecondProp = 'bzzz_restaurant_fork_d', SecondPropBone = 28422, SecondPropPlacement = {0.07, 0.05, -0.03,-100.0, 24.0, -86.0},
				EmoteMoving = true, EmoteLoop = true, }},
		["fishandchips"] = {'bzzz@restaurant@eat', 'bzzz_restaurant_eat', "Grilled fish", AnimationOptions = 
			{ Prop = "bzzz_restaurant_food_a", PropBone = 60309, PropPlacement = {0.08, -0.04, 0.07,-30.0, 10.0, 0.0}, SecondProp = 'bzzz_restaurant_fork_a', SecondPropBone = 28422, SecondPropPlacement = {0.07, 0.05, -0.03,-100.0, 24.0, -86.0},
				EmoteMoving = true, EmoteLoop = true, }},
		["falafel"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "Truffles plate", AnimationOptions = 
			{ Prop = "bzzz_sugary_truffles_b", PropBone = 60309, PropPlacement = {0.0030, 0.0000, -0.0300,  0.0,  0.0, -50.0}, SecondProp = 'bzzz_sugary_truffles_a', SecondPropBone = 28422, SecondPropPlacement = {0.0,0.02,0.0,0.0,20.0,0.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["lemonade"] = {"mp_player_intdrink", "loop_bottle", "Tom Collins", AnimationOptions = 
			{ Prop = "bzzz_drink_tomcollins_a", PropBone = 18905, PropPlacement = {0.09, -0.08, 0.05, -83.0, 190.0, 18.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["bloodymary"] = {"mp_player_intdrink", "loop_bottle", "Bloody Mary", AnimationOptions = 
			{ Prop = "bzzz_drink_bloodymary_a", PropBone = 18905, PropPlacement = {0.09, -0.08, 0.05, -83.0, 190.0, 18.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["coconutdrink"] = {"mp_player_intdrink", "loop_bottle", "Coconut Drink", AnimationOptions = 
			{ Prop = "bzzz_drink_coconut_a", PropBone = 18905, PropPlacement = {0.1, 0.04, 0.11, -13.0, 140.0, 0.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["bigbeer"] = {"mp_player_intdrink", "loop_bottle", "Big Beer", AnimationOptions = 
			{ Prop = "bzzz_drink_beer_a", PropBone = 18905, PropPlacement = {0.1, -0.05, 0.06, -83.0, 190.0, 18.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["cookie"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Cookie", AnimationOptions = 
			{ Prop = "bzzz_sugary_cookie_a", PropBone = 60309, PropPlacement = {-0.01, -0.01, 0.0, 25.0, 2.0, -8.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["applepie"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Applie Pie Slice", AnimationOptions = 
			{ Prop = "bzzz_sugary_applepie_b", PropBone = 60309, PropPlacement = {-0.03, 0.01, 0.0, -30.0, 0.0, 160.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["screwdriver"] = {"mp_player_intdrink", "loop_bottle", "Screwdriver", AnimationOptions = 
			{ Prop = "bzzz_drink_screwdriver_a", PropBone = 18905, PropPlacement = {0.09, -0.08, 0.05, -83.0, 190.0, 18.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["rumcoke"] = {"mp_player_intdrink", "loop_bottle", "Rum Coke", AnimationOptions = 
			{ Prop = "bzzz_drink_rumcoke_a", PropBone = 18905, PropPlacement = {0.09, -0.08, 0.05, -83.0, 190.0, 18.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["bahahamama"] = {"mp_player_intdrink", "loop_bottle", "Bahama Mama", AnimationOptions = 
			{ Prop = "bzzz_drink_bahamamama_a", PropBone = 18905, PropPlacement = {0.06, -0.05, 0.05, 79.0, 35.0, 145.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["longisland"] = {"mp_player_intdrink", "loop_bottle", "Long Island", AnimationOptions = 
			{ Prop = "bzzz_drink_longislandicedtea_a", PropBone = 18905, PropPlacement = {0.06, -0.05, 0.05, 79.0, 35.0, 145.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["moscowmule"] = {"mp_player_intdrink", "loop_bottle", "Moscow Mule", AnimationOptions = 
			{ Prop = "bzzz_drink_moscowmule_a", PropBone = 18905, PropPlacement = {0.1, -0.02, 0.05, -70.0, 140.0, 0.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["maitai"] = {"mp_player_intdrink", "loop_bottle", "Mai Tai", AnimationOptions = 
			{ Prop = "bzzz_drink_maitai_a", PropBone = 18905, PropPlacement = {0.09, 0.0, 0.06, -75.0, 40.0, -50.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["oldfashioned"] = {"mp_player_intdrink", "loop_bottle", "Old Fashioned", AnimationOptions = 
			{ Prop = "bzzz_drink_oldfashioned_a", PropBone = 18905, PropPlacement = {0.09, 0.0, 0.06, -75.0, 40.0, -50.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["hotdog"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Hotdog with mustard", AnimationOptions = 
			{ Prop = "bzzz_food_hotdog_a", PropBone = 18905, PropPlacement = {0.14, 0.06, 0.03, 20.0, -210.0, 0.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["sub"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Sub Sandwich", AnimationOptions = 
			{ Prop = "bzzz_food_bakery_baguette_c", PropBone = 18905, PropPlacement = {0.1, -0.01, 0.05, -265.0, -140.0, -61.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["candy"] = {"mp_player_inteat@pnq", "loop", "Rainbow candies", AnimationOptions = 
			{ Prop = "bzzz_sugary_candy_a", PropBone = 60309, PropPlacement = {-0.05, 0.02, 0.0, 0.0, 0.0, -90.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["bananabread"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Slice banana bread", AnimationOptions = 
			{ Prop = "bzzz_food_bakery_bananabread_b", PropBone = 18905, PropPlacement = {0.15, 0.06, 0.02, 152.0, -33.0, 10.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["tadpole_pudding_choc"] = {
        "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
        "base_idle",
        "Chocolate Tadpole Pudding",
        AnimationOptions = {
            Prop = "tadpole_pudding_choc",
            PropBone = 60309,
            PropPlacement = {
                -0.06,          -- xPos       
                -0.01,       -- yPos  
                -0.02,       -- zPos  
                0.0,          -- xRot  
                0.0,          -- yRot  
                0.0           -- zRot
            },
            SecondProp = 'frog_spoon',
            SecondPropBone = 28422,
            SecondPropPlacement = {
                0.0,          -- xPos      
                0.0,          -- yPos     
                0.0,          -- zPos        
                0.0,          -- xRot        
                0.0,          -- yRot        
                180.0         -- zRot  
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
	["tadpole_pudding_nilla"] = {
        "anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1",
        "base_idle",
        "Vanilla Tadpole Pudding",
        AnimationOptions = {
            Prop = "tadpole_pudding_nilla",
            PropBone = 60309,
            PropPlacement = {
                -0.06,          -- xPos       
                -0.01,       -- yPos  
                -0.02,       -- zPos  
                0.0,          -- xRot  
                0.0,          -- yRot  
                0.0           -- zRot
            },
            SecondProp = 'frog_spoon',
            SecondPropBone = 28422,
            SecondPropPlacement = {
                0.0,          -- xPos      
                0.0,          -- yPos     
                0.0,          -- zPos        
                0.0,          -- xRot        
                0.0,          -- yRot        
                180.0         -- zRot  
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
	["pondshake_berry"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Strawberry Pondshake",
        AnimationOptions = {
            Prop = 'pondshake_berry',
            PropBone = 28422,
            PropPlacement = {
                0.0170,   -- xPos
                -0.070,   -- yPos
                -0.0700,    -- zPos
                -88.0263,   -- xRot
                -25.0367,   -- yRot
                -27.3898   -- zRot
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
	["lilypad_spritz"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Sparkling Cucumber Spritz",
        AnimationOptions = {
            Prop = 'lilypad_spritz',
            PropBone = 28422,
            PropPlacement = {
                0.016,   -- xPos
                -0.045,   -- yPos
                -0.050,    -- zPos
                -88.0263,   -- xRot
                -22.0,   -- yRot
                -40.0   -- zRot
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
	["pondshake_matcha"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Matcha Pondshake",
        AnimationOptions = {
            Prop = 'pondshake_matcha',
            PropBone = 28422,
            PropPlacement = {
                0.0170,   -- xPos
                -0.070,   -- yPos
                -0.0700,    -- zPos
                -88.0263,   -- xRot
                -25.0367,   -- yRot
                -27.3898   -- zRot
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
	["proteinshake"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Matcha Pondshake",
        AnimationOptions = {
            Prop = 'pondshake_chocolate',
            PropBone = 28422,
            PropPlacement = {
                0.0170,   -- xPos
                -0.070,   -- yPos
                -0.0700,    -- zPos
                -88.0263,   -- xRot
                -25.0367,   -- yRot
                -27.3898   -- zRot
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
	["tadpole_tea_blue"] = {
        "smo@milkshake_idle",
        "milkshake_idle_clip",
        "Tadpole Blueberry Boba Tea",
        AnimationOptions = {
            Prop = 'tadpole_tea_blue',
            PropBone = 28422,
            PropPlacement = {
                0.0170,   -- xPos
                -0.070,   -- yPos
                -0.0700,    -- zPos
                -88.0263,   -- xRot
                -25.0367,   -- yRot
                -27.3898   -- zRot
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },



		-- UWU CAFE
		-- ["uwu1"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_sml_drink', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		-- ["uwu2"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_lrg_drink', PropBone = 28422, PropPlacement = {0.03, 0.0, -0.08, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		-- ["uwu3"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_cup_straw', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		-- ["uwu4"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_mug', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		-- ["uwu5"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions = { Prop = 'uwu_pastry', PropBone = 18905, PropPlacement = {0.16, 0.06, -0.03, -50.0, 16.0, 60.0}, EmoteMoving = true, }},
		-- ["uwu6"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions = { Prop = 'uwu_cookie', PropBone = 18905, PropPlacement = {0.16, 0.08, -0.01, -225.0, 20.0, 60.0}, EmoteMoving = true, }},
		-- ["uwu7"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions = { Prop = 'uwu_sushi', PropBone = 18905, PropPlacement = {0.18, 0.03, 0.02, -50.0, 16.0, 60.0}, EmoteMoving = true, }},
		-- ["uwu8"] = {"amb@world_human_seat_wall_eating@male@both_hands@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_eggroll', PropBone = 60309, PropPlacement = {0.10, 0.03, 0.08, -95.0, 60.0, 0.0}, EmoteMoving = true, }},
		-- ["uwu9"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "", AnimationOptions = { Prop = "uwu_salad_bowl", PropBone = 60309, PropPlacement = {0.0, 0.0300, 0.0100, 0.0, 0.0, 0.0}, SecondProp = 'uwu_salad_spoon', SecondPropBone = 28422, SecondPropPlacement = {0.0, 0.0 ,0.0, 0.0, 0.0, 0.0}, EmoteLoop = true, EmoteMoving = true, }},
		-- ["uwu10"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions = { Prop = 'uwu_sandy', PropBone = 18905, PropPlacement = {0.16, 0.08, 0.05, -225.0, 20.0, 60.0}, EmoteMoving = true, }},
		-- ["uwu11"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_cupcake', PropBone = 28422, PropPlacement = {0.0, 0.0, -0.03, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		-- ["uwu12"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'uwu_btea', PropBone = 28422, PropPlacement = {0.02, 0.0, -0.05, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		-- ["uwu13"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions = { Prop = 'uwu_gdasik', PropBone = 18905, PropPlacement = {0.16, 0.08, 0.02, -225.0, 20.0, 60.0}, EmoteMoving = true, }},
		-- ["flute"] = { "anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Flute", AnimationOptions = { Prop = 'prop_champ_flute', PropBone = 18905, PropPlacement = {0.10,-0.03,0.03,-100.0,0.0,-10.0}, EmoteMoving = true, EmoteLoop = true}},
		
		--PIZZA
		["redwine"] = {"mp_player_intdrink", "loop_bottle", "Red Wine Bottle", AnimationOptions = { Prop = "prop_wine_rose", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["whitewine"] = {"mp_player_intdrink", "loop_bottle", "White Wine Bottle", AnimationOptions = { Prop = "prop_wine_white", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["pizza"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions = { Prop = 'knjgh_pizzaslice4', PropBone = 18905, PropPlacement = {0.18, 0.03, 0.02, -50.0, 16.0, 60.0}, EmoteMoving = true, }},
		["pineapple"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Pizza", AnimationOptions = { Prop = "prop_pineapple", PropBone = 18905, PropPlacement = {0.10, 0.038, 0.03, 15.0, 50.0}, EmoteMoving = true, EmoteLoop = true, }},
		["foodbowl"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "Food Bowl", AnimationOptions = 
			{ Prop = "prop_cs_bowl_01", PropBone = 60309, PropPlacement = {-0.0460, 0.0000, -0.0300,  0.0,  0.0, -50.0}, SecondProp = 'h4_prop_h4_coke_spoon_01', SecondPropBone = 28422, SecondPropPlacement = {0.0,0.0,0.0,0.0,20.0,0.0}, 
				EmoteMoving = true, EmoteLoop = true, }},
		["drink"] = {"mp_player_intdrink", "loop_bottle", "Drink", AnimationOptions = { Prop = "ng_proc_sodabot_01a", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		
		-- HORNYS
		["atomdrink"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'ng_proc_sodacup_01c', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		["atomhotdog"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'prop_food_bs_burger2', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		["atomfries"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = { Prop = 'prop_food_chips', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, EmoteLoop = true, EmoteMoving = true, }},
		["breadslice"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Bread Slice", AnimationOptions = { Prop = 'v_res_fa_bread03', PropBone = 18905, PropPlacement = {0.16, 0.08, -0.01, -225.0, -10.0, 0.0}, EmoteLoop = true, EmoteMoving = true, }},
		["sprunk"] = {"mp_player_intdrink", "loop_bottle", "sprunk", AnimationOptions = { Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["taco"] = {"mp_player_intdrink", "loop_bottle", "Taco", AnimationOptions = { Prop = "prop_taco_01", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
	
		-- PARADISE
		["icream"] = {" mp_player_intdrink", "loop_bottle", "Irish Cream Bottle", AnimationOptions = { Prop = "prop_bottle_brandy", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},	EmoteMoving = true, EmoteLoop = true }},
		["crisps"] = { "amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Chrisps", AnimationOptions = { Prop = 'v_ret_ml_chips2', PropBone = 28422, PropPlacement = {0.01, -0.05, -0.1, 0.0, 0.0, 90.0}, EmoteLoop = true, EmoteMoving = true, }},
		["beer1"] = { "mp_player_intdrink", "loop_bottle", "Dusche", AnimationOptions = { Prop = "prop_beerdusche", PropBone = 18905, PropPlacement = {0.04, -0.14, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["beer2"] = { "mp_player_intdrink", "loop_bottle", "Logger", AnimationOptions = { Prop = "prop_beer_logopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["beer3"] = { "mp_player_intdrink", "loop_bottle", "AM Beer", AnimationOptions = { Prop = "prop_beer_amopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["beer4"] = { "mp_player_intdrink", "loop_bottle", "Pisswasser1", AnimationOptions = { Prop = "prop_beer_pissh", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["beer5"] = { "mp_player_intdrink", "loop_bottle", "Pisswasser2", AnimationOptions = { Prop = "prop_amb_beer_bottle", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["beer6"] = { "mp_player_intdrink", "loop_bottle", "Pisswasser3", AnimationOptions = { Prop = "prop_cs_beer_bot_02", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, EmoteMoving = true, EmoteLoop = true, }},
		["wine"] = { "anim@heists@humane_labs@finale@keycards",	"ped_a_enter_loop",	"Wine",	AnimationOptions = { Prop = 'prop_drink_redwine', PropBone = 18905, PropPlacement = { 0.10, -0.03, 0.03, -100.0, 0.0, -10.0	}, EmoteMoving = true, EmoteLoop = true	} },
	},
}
