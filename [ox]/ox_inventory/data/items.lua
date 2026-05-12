return {

    ---MT Restaurant Ingredients -- 
    ["restaurant_box"] = {
        label = "Restaurant box",
        weight = 1000,
        stack = true,
        close = true,
        client = {
            export = 'mt-restaurants.useBoxItem'
        }
    },
    ["restaurant_menu"] = {
        label = "Restaurant menu",
        weight = 100,
        stack = true,
        close = true,
        client = {
            export = 'mt-restaurants.openMenu'
        }
    },
    ['meat'] = {
        label = 'Meat',
        weight = 10,
        stack = true,
        close = true,
        description = 'It could be anything really',
    },
    ['fish'] = {
        label = 'Fish',
        weight = 10,
        stack = true,
        close = true,
        description = 'Fresh catch of the day',
    },
    ['lobster'] = {
        label = 'Lobster',
        weight = 10,
        stack = true,
        close = true,
        description = 'A taste of the high life',
    },
    ['bread'] = {
        label = 'Bread',
        weight = 10,
        stack = true,
        close = true,
        description = 'What all sandwiches need',
    },
    ['lettuce'] = {
        label = 'Lettuce',
        weight = 10,
        stack = true,
        close = true,
        description = 'A little green to make you feel healthy',
    },
    ['potato'] = {
        label = 'Potato',
        weight = 10,
        stack = true,
        close = true,
        description = 'What can\'t you do with a potato',
    },
    ['onion'] = {
        label = 'Onion',
        weight = 10,
        stack = true,
        close = true,
        description = 'Enough to make a grown man cry',
    },
    ['tealeaf'] = {
        label = 'Tea Leaf',
        weight = 10,
        stack = true,
        close = true,
        description = 'I wonder what this makes',
    },
    ['mixedgreens'] = {
        label = 'Mixed Greens',
        weight = 10,
        stack = true,
        close = true,
        description = 'An assortment of vegetables',
    },
    ['mixedfruits'] = {
        label = 'Mixed Fruits',
        weight = 10,
        stack = true,
        close = true,
        description = 'An assortment of fruits',
    },
    ['lemon'] = {
        label = 'Lemon',
        weight = 10,
        stack = true,
        close = true,
        description = 'Need a bit of sweetener?',
    },
    ['cucumber'] = {
        label = 'Cucumber',
        weight = 10,
        stack = true,
        close = true,
        description = 'Don\'t get any ideas...',
    },
    ['pomegranate'] = {
        label = 'Pomegranate',
        weight = 10,
        stack = true,
        close = true,
        description = 'A fruit that might be made up',
    },
    ['cheese'] = {
        label = 'Cheese',
        weight = 10,
        stack = true,
        close = true,
        description = 'Stinky',
    },
    ['milk'] = {
        label = 'Milk',
        weight = 10,
        stack = true,
        close = true,
        description = 'Gang Gang',
    },
    ['water'] = {
        label = 'Water',
        weight = 10,
        stack = true,
        close = true,
        description = 'Could be wet could not be',
    },
    ['sugar'] = {
        label = 'Sugar',
        weight = 10,
        stack = true,
        close = true,
        description = 'Welcome to America!',
    },
    ['flour'] = {
        label = 'Flour',
        weight = 10,
        stack = true,
        close = true,
        description = 'Not to be confused with other white powders',
    },
    ['cocoa'] = {
        label = 'Cocoa',
        weight = 10,
        stack = true,
        close = true,
        description = 'I\'m in love with the cocoa',
    },
    ['proteinpowder'] = {
        label = 'Protein Powder',
        weight = 10,
        stack = true,
        close = true,
        description = 'Inhale before gym',
    },
    ['chips'] = {
        label = 'Chips',
        weight = 10,
        stack = true,
        close = true,
        description = 'They\'re basically mini tortillas',
    },
    ['rum'] = {
        label = 'Rum',
        weight = 10,
        stack = true,
        close = true,
        description = 'It\'s a pirates life for me',
    },
    ['vodka'] = {
        label = 'Vodka',
        weight = 10,
        stack = true,
        close = true,
        description = 'It\'s a pirates life for me',
    },
    ['gin'] = {
        label = 'Gin',
        weight = 10,
        stack = true,
        close = true,
        description = 'Not to be confused with the League of Legends character',
    },
    ['cakepopstick'] = {
        label = 'Cake Pop Stick',
        weight = 10,
        stack = true,
        close = true,
        description = '',
    },
    -- Restaurant Foods --

        -- BAHAMA MAMAS

    ["drunkensailor"] = {
        label = "Drunken Sailor",
        weight = 100,
        stack = true,
        close = true,
        description = "A vodka cocktail",
        client = {},
        server = {
            export = 'rcore_drunk.vodka',
        },
    },
    ["islandsplash"] = {
        label = "Island Splash",
        weight = 100,
        stack = true,
        close = true,
        description = "A non-alcoholic paradise",
    },
    ["pantydropper"] = {
        label = "Panty Dropper",
        weight = 100,
        stack = true,
        close = true,
        description = "A gin cocktail",
        server = {
            export = 'rcore_drunk.vodka',
        }
    },
    ["tequillasunrise"] = {
        label = "Tequila Sunrise",
        weight = 100,
        stack = true,
        close = true,
        description = "A rum cocktail",
        server = {
            export = 'rcore_drunk.vodka',
        }
    },
    ["mintymischief"] = {
        label = "Minty Mischief",
        weight = 100,
        stack = true,
        close = true,
        description = "A rum cocktail",
        server = {
            export = 'rcore_drunk.vodka',
        }
    },
    ["paradisepunch"] = {
        label = "Paradise Punch",
        weight = 100,
        stack = true,
        close = true,
        description = "a rum cocktail",
        server = {
            export = 'rcore_drunk.vodka',
        }
    },
    ["exoticescape"] = {
        label = "Exotic Escape",
        weight = 100,
        stack = true,
        close = true,
        description = "A non-alcholic fruity drink",
    },
    ["creamingbananas"] = {
        label = "Creaming Bananas",
        weight = 100,
        stack = true,
        close = true,
        description = "",

    },
    ["srirachatails"] = {
        label = "Sriracha Tails",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["naughtynachos"] = {
        label = "Naughty Nachos",
        weight = 100,
        stack = true,
        close = true,
        description = "This is na cho cheese",
    },
    ["hawtwings"] = {
        label = "Hawt Wings",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },

     -- Kebab King
    ["baklava"] = {
        label = "Baklava",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["kebabwrap"] = {
        label = "Doner Kebab Wrap",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["pizzamargherita"] = {
        label = "Pizza Margherita",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["falafel"] = {
        label = "Falafel",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["shishkebab"] = {
        label = "Shish Kebab",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["mintlemonade"] = {
        label = "Mint Lemonade",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["pomegranatejuice"] = {
        label = "Pomegranate Juice",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["yogurtdrink"] = {
        label = "Ayran Yogurt Drink",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },

    -- The Hungry Pond
    ["cheeseburger"] = {
        label = "Classic Cheeseburger",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["bbqribs"] = {
        label = "BBQ Ribs",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["pondfries"] = {
        label = "Loaded Pond Fries",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["dinonuggets"] = {
        label = "Dino Nuggets Basket",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["applepie"] = {
        label = "Apple Pie",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["dbjuice"] = {
        label = "Dumb Bitch Juice",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["sweettea"] = {
        label = "Iced Sweet Tea",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["rootbeerfloat"] = {
        label = "Rootbeer Float",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },

    -- Moo Moo Cafe
    ["buttercroissant"] = {
        label = "Butter Croissant",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["mooberrymuffin"] = {
        label = "Mooberry Muffin",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["avocadotoast"] = {
        label = "Avocado Toast",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["cowbagel"] = {
        label = "Creamy Cow Bagel",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["chocolatemookie"] = {
        label = "Chocolate Chip Mookie",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["moochalatte"] = {
        label = "Moocha Latte",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["cowhotchocolate"] = {
        label = "Holy Cow Hot Cocoa",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["cappuccino"] = {
        label = "Cappuccino",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },

    -- Boat House
    ["grilledsalmon"] = {
        label = "Harbor Grilled Salmon",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["seafoodgumbo"] = {
        label = "Seafood Gumbo",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["lobsterroll"] = {
        label = "Lobster Roll",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["fishandchips"] = {
        label = "Captain\'s Fish and Chips",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["seafoodboil"] = {
        label = "Seafood Boil Plate",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["citrusicedtea"] = {
        label = "Berry Citrus Iced Tea",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["seabreeze"] = {
        label = "Tropical Sea Breeze",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["cucumbermintcooler"] = {
        label = "Cucumber Mint Cooler",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },

    -- Salt Lab Smoothie Bar
    ["bananafusion"] = {
        label = "Strawberry Banana Fusion",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["greenenergizer"] = {
        label = "Green Energizer",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["proteinshake"] = {
        label = "Power Protein Shake",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["berryblast"] = {
        label = "Berry Blast Smoothie",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["matchasmoothie"] = {
        label = "Iced Matcha Smoothie",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["acaibowl"] = {
        label = "Acai Bowl",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["chiaseedpudding"] = {
        label = "Chia Seed Pudding",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["yogurtparfait"] = {
        label = "Yogurt Parfait",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    
    -- 24/7 Foods/Drinks
    ["hotdog"] = {
        label = "Hotdog",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["hoagie"] = {
        label = "Hoagie",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["pocketz"] = {
        label = "Pocketz",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["chocolatebar"] = {
        label = "Chocolate Bar",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["gummyworms"] = {
        label = "Gummy Worms",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["juicebox"] = {
        label = "Juice Box",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["greentea"] = {
        label = "Green Tea",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },
    ["popsoda"] = {
        label = "Pop",
        weight = 100,
        stack = true,
        close = true,
        description = "",
    },

    -- IDENTIFICATION
    ["weaponlicense"] = {
        label = "Weapon License",
        weight = 1000,
        stack = false,
        close = false,
        description = "Permit to show you can legally own a firearm.",
        client = {
            image = "weapon_license.png",
        }
    },

    ["fishinglicense"] = {
        label = "Fishing License",
        weight = 1000,
        stack = false,
        close = false,
        description = "Permit to show you can fish in approved fishing areas.",
        client = {
            image = "fishinglicense.png",
        }
    },

    ["huntinglicense"] = {
        label = "Hunting License",
        weight = 1000,
        stack = false,
        close = false,
        description = "Permit to show you can fish in approved fishing areas.",
        client = {
            image = "huntinglicense.png",
        }
    },
    
    ["id_card"] = {
        label = "ID Card",
        weight = 1000,
        stack = false,
        close = false,
        description = "A card containing all your information to identify yourself",
        client = {
            image = "id_card.png",
        }
    },
    
    ["driver_license"] = {
        label = "Drivers License",
        weight = 1000,
        stack = false,
        close = false,
        description = "Permit to show you can drive a vehicle",
        client = {
            image = "driver_license.png",
        }
    },

    -- DISPENSARY
    ["rawhoney"] = {
        label = "Raw Honey",
        weight = 10,
        stack = true,
    },
    ["gelatine"] = {
        label = "Gelatine",
        weight = 10,
        stack = true,
    },
    ["gummy_granddaddypurple"] = {
        label = "Grand Daddy Purp Gummy",
        weight = 100,
        stack = true,
        close = true,
        allowArmed = true,
        description = "Grand Daddy of Gummies",
        client = {
            image = "ww_grapegummies.png",
        }
    },
    ["jackherrer_joint"] = {
        label = "Jack Herrer Joint",
        weight = 100,
        stack = true,
        close = false,
        allowArmed = true,
        description = "Jack Herrer Joint",
        client = {
            image = "ww_jackherrer_joint.png",
        }
    },

    ["rollingpapers"] = {
        label = "Rolling Papers",
        weight = 10,
        stack = true,
        close = true,
        description = "Paper made specifically for encasing and smoking tobacco or cannabis.",
        client = {
            image = "rollingpapers.png",
        }
    },

    ["afghankush_crop"] = {
        label = "Afghan Kush Crop",
        weight = 10,
        stack = true,
        close = false,
        description = "Afghan Kush Crop",
        client = {
            image = "ww_afghankush_crop.png",
        }
    },

    ["jackherrer_crop"] = {
        label = "Jack Herrer Crop",
        weight = 10,
        stack = true,
        close = false,
        description = "Jack Herrer Crop",
        client = {
            image = "ww_jackherrer_crop.png",
        }
    },
    
    ["gummymould"] = {
        label = "Gummy Mould",
        weight = 1000,
        stack = true,
        close = true,
        allowArmed = true,
        description = "A BPA free mould, shaped like a bear!",
        client = {
            image = "gummybearmould.png",
        }
    },

    ["weddingcake_bud"] = {
        label = "Wedding Cake Bud",
        weight = 10,
        stack = true,
        close = false,
        description = "Wedding Cake Bud",
        client = {
            image = "ww_weddingcake_bud.png",
        }
    },

    ["granddaddypurple_bud"] = {
        label = "Grand Daddy Purple Bud",
        weight = 10,
        stack = true,
        close = false,
        description = "Grand Daddy Purple Bud",
        client = {
            image = "ww_granddaddypurple_bud.png",
        }
    },
    
    ["gummy_jackherrer"] = {
        label = "Herrer Belts",
        weight = 100,
        stack = true,
        close = true,
        allowArmed = true,
        description = "Sour Belts with a Twist",
        client = {
            image = "ww_rainbowbelts.png",
        }
    },
    
    ["gummy_sourdiesel"] = {
        label = "Sour Diesel Gummy",
        weight = 100,
        stack = true,
        close = true,
        allowArmed = true,
        description = "A Sour Diesel Gummy",
        client = {
            image = "ww_blueberrygummies.png",
        }
    },
    
    ["afghankush_bud"] = {
        label = "Afghan Kush Bud",
        weight = 10,
        stack = true,
        close = false,
        description = "Afghan Kush Bud",
        client = {
            image = "ww_afghankush_bud.png",
        }
    },
    
    ["gummy_afghankush"] = {
        label = "Afghan Kush Gummy",
        weight = 100,
        stack = true,
        close = true,
        allowArmed = true,
        description = "An Afghan Kush Gummy - Not Safe for Kids!",
        client = {
            image = "ww_greenapplegummies.png",
        }
    },
    
    ["sourdiesel_crop"] = {
        label = "Sour Diesel Crop",
        weight = 10,
        stack = true,
        close = false,
        description = "Sour Diesel Crop",
        client = {
            image = "ww_sourdiesel_crop.png",
        }
    },
    
    ["granddaddypurple_crop"] = {
        label = "Grand Daddy Purple Crop",
        weight = 10,
        stack = true,
        close = false,
        description = "Grand Daddy Purple Crop",
        client = {
            image = "ww_granddaddypurple_crop.png",
        }
    },
    
    ["sourdiesel_joint"] = {
        label = "Sour Diesel Joint",
        weight = 100,
        stack = true,
        close = false,
        allowArmed = true,
        description = "Sour Diesel Joint",
        client = {
            image = "ww_sourdiesel_joint.png",
        }
    },
    
    ["granddaddypurple_joint"] = {
        label = "Grand Daddy Purple Joint",
        weight = 100,
        stack = true,
        close = false,
        allowArmed = true,
        description = "Grand Daddy Purple Joint",
        client = {
            image = "ww_granddaddypurple_joint.png",
        }
    },
    
    ["drug_shears"] = {
        label = "Trimming Shears",
        weight = 1000,
        stack = true,
        close = true,
        description = "A set of high quality trimming shears.",
        client = {
            image = "drug_shears.png",
        }
    },
    
    ["gummy_weddingcake"] = {
        label = "Wedding Cake Gummy",
        weight = 100,
        stack = true,
        close = true,
        allowArmed = true,
        description = "A Wedding Cake Gummy",
        client = {
            image = "ww_rasberrygummies.png",
        }
    },
    
    ["weddingcake_joint"] = {
        label = "Wedding Cake Joint",
        weight = 100,
        stack = true,
        close = false,
        allowArmed = true,
        description = "Wedding Cake Joint",
        client = {
            image = "ww_weddingcake_joint.png",
        }
    },
    
    ["sourdiesel_bud"] = {
        label = "Sour Diesel Bud",
        weight = 10,
        stack = true,
        close = false,
        description = "Sour Diesel Bud",
        client = {
            image = "ww_sourdiesel_bud.png",
        }
    },
    
    ["jackherrer_bud"] = {
        label = "Jack Herrer Bud",
        weight = 10,
        stack = true,
        close = false,
        description = "Jack Herrer Bud",
        client = {
            image = "ww_jackherrer_bud.png",
        }
    },
    
    ["grinder"] = {
        label = "Grinder",
        weight = 1000,
        stack = false,
        close = true,
        client = {
            image = "grinder.png",
        }
    },
    
    ["afghankush_joint"] = {
        label = "Afghan Kush Joint",
        weight = 100,
        stack = true,
        close = false,
        allowArmed = true,
        description = "Afghan Kush Joint",
        client = {
            image = "ww_afghankush_joint.png",
        }
    },
    
    ["weddingcake_crop"] = {
        label = "Wedding Cake Crop",
        weight = 10,
        stack = true,
        close = false,
        description = "Wedding Cake Crop",
        client = {
            image = "ww_weddingcake_crop.png",
        }
    },
    
    ["drug_grinder"] = {
        label = "Tobacco Grinder",
        weight = 1000,
        stack = true,
        close = true,
        description = "A tobacco grinder or something more..",
        client = {
            image = "drug_grinder.png",
        }
    },
    
    ["vape_casing"] = {
        label = "Vape Casing",
        weight = 10,
        stack = true,
        close = false,
        description = "",
    },
    ["vape_battery"] = {
        label = "Vape Battery",
        weight = 10,
        stack = true,
        close = false,
        description = "",
    },
    ["vape_coil"] = {
        label = "Vape Coil",
        weight = 10,
        stack = true,
        close = false,
        description = "",
    },
    ["weedcakepop"] = {
        label = "Mile High Cake Pop",
        weight = 100,
        stack = true,
        close = false,
        allowArmed = true,
        description = "",
    },
    ["cosmicbrownie"] = {
        label = "Cosmic Brownie",
        weight = 100,
        stack = true,
        close = false,
        allowArmed = true,
        description = "",
    },
    ["tripsitters"] = {
        label = "Trip Sitters Vape Flavor",
        weight = 100,
        stack = true,
        close = false,
        allowArmed = true,
        description = "",
    },
    ["blueberrydream"] = {
        label = "Blue Dream Vape Flavor",
        weight = 100,
        stack = true,
        close = false,
        allowArmed = true,
        description = "",
    },
    ["sweettits"] = {
        label = "Sweet Tits Vape Flavor",
        weight = 100,
        stack = true,
        close = false,
        allowArmed = true,
        description = "",
    },
    ["candybomb"] = {
        label = "Candy Bomb Vape Flavor",
        weight = 100,
        stack = true,
        close = false,
        allowArmed = true,
        description = "",
    },
    ["skintback"] = {
        label = "Skintback Vape Flavor",
        weight = 100,
        stack = true,
        close = false,
        allowArmed = true,
        description = "",
    },
    ["redvape"] = {
        label = "Red Vape",
        weight = 1000,
        stack = true,
        close = false,
        description = "",
    },
    ["orangevape"] = {
        label = "Orange Vape",
        weight = 1000,
        stack = true,
        close = false,
        description = "",
    },
    ["yellowvape"] = {
        label = "Yellow Vape",
        weight = 1000,
        stack = true,
        close = false,
        description = "",
    },
    ["greenvape"] = {
        label = "Green Vape",
        weight = 1000,
        stack = true,
        close = false,
        description = "",
    },
    ["bluevape"] = {
        label = "Blue Vape",
        weight = 1000,
        stack = true,
        close = false,
        description = "",
    },
    ["purplevape"] = {
        label = "Purple Vape",
        weight = 1000,
        stack = true,
        close = false,
        description = "",
    },
    ["pinkvape"] = {
        label = "Pink Vape",
        weight = 1000,
        stack = true,
        close = false,
        description = "",
    },
    ["tealvape"] = {
        label = "Teal Vape",
        weight = 1000,
        stack = true,
        close = false,
        description = "",
    },
    ["blackvape"] = {
        label = "Black Vape",
        weight = 1000,
        stack = true,
        close = false,
        description = "",
    },
    ["nicotine"] = {
        label = "Nicotine",
        weight = 10,
        stack = true,
        close = false,
        description = "",
    },
    ["glycerine"] = {
        label = "Glycerine ",
        weight = 10,
        stack = true,
        close = false,
        description = "",
    },
    ["tripsittersdrop"] = {
        label = "Trip Sitters Drop",
        weight = 10,
        stack = true,
        close = false,
        description = "",
    },
    ["blueberrydreamdrop"] = {
        label = "Blue Dream Drop",
        weight = 10,
        stack = true,
        close = false,
        description = "",
    },
    ["sweettitsdrop"] = {
        label = "Sweet Tits Drop",
        weight = 10,
        stack = true,
        close = false,
        description = "",
    },
    ["candybombdrop"] = {
        label = "Candy Bomb Drop",
        weight = 10,
        stack = true,
        close = false,
        description = "",
    },
    ["skintbackdrop"] = {
        label = "Skintback Drop",
        weight = 10,
        stack = true,
        close = false,
        description = "",
    },
    -- HEISTS/CRIME --

    ["gpshackingdevice"] = {
        label = "GPS hacking device",
        weight = 1000,
        stack = true,
        close = true,
        description = "If you wish to disable vehicle GPS systems.",
    },

    ["hackingdevice"] = {
        label = "Vehicle Hacking Device",
        weight = 1000,
        stack = true,
        close = true,
        description = "Good for breaking in to boosted cars.",
    },

    ["pliers"] = {
        label = "Pliers",
        weight = 1000,
        stack = true,
        close = false,
        description = "Snip Snip",
    },

    ["cutter"] = {
        label = "Cutter",
        weight = 1000,
        stack = true,
        close = true,
    },

    ['circuitboard'] = {
        label = "Circuit Board",
        weight = 1000,
        stack = true,
        close = false,
        description = "It's a board and it does indeed have circuits",
    },

    ['wires'] = {
        label = "Wires",
        weight = 1000,
        stack = true,
        close = false,
        description = "Wires? What is this 1980?",
    },

    ['maliciouscode'] = {
        label = "Malicious Code",
        weight = 1000,
        stack = true,
        close = false,
        description = "Uploading this would disrupt any system",
    },

    ['maliciousflashdrive'] = {
        label = "Malicious Flash Drive",
        weight = 1000,
        stack = true,
        close = false,
        description = "I wouldn't plug this into your pc.",
    },

    ['dynamite'] = {
        label = "Dynamite",
        weight = 1000,
        stack = true,
        close = false,
        description = "Nothing like some good ol' fashion dynamite amirite?",
    },

    ['c4'] = {
        label = "C4",
        weight = 1000,
        stack = true,
        close = false,
        description = "Top of the line explosive material",
    },

    ['toolkit'] = {
        label = "Criminal Tool Kit",
        weight = 1000,
        stack = true,
        close = false,
        description = "Your breaking and entering essentials",
    },

    ['signaljammer'] = {
        label = "Signal Jammer",
        weight = 1000,
        stack = true,
        close = false,
        description = "Your breaking and entering essentials",
    },

    ['passcodeinjector'] = {
        label = "Passcode Injector",
        weight = 1000,
        stack = true,
        close = false,
        description = "Advanced hacking tool for bypassing keypads",
    },

-- Hiest Credentials
    ['ugc'] = {
        label = "Underground Bunker Credentials",
        weight = 1000,
        stack = true,
        close = false,
        description = "Might be useful in a nuclear disaster",
    },

    ['uhc'] = {
        label = "Union Bank Credentials",
        weight = 1000,
        stack = true,
        close = false,
        description = "You could return it to the bank?",
    },

    ['yhc'] = {
        label = "Yacht Heist Credentials",
        weight = 1000,
        stack = true,
        close = false,
        description = "Looking for a luxury getaway?",
    },

    ['cyc'] = {
        label = "Container Yard Credentials",
        weight = 1000,
        stack = false,
        close = false,
        description = "Looks official enough to fool a employee from a distance."
    },
    
-- USBs
    ['whiteusb'] = {
        label = "White USB",
        weight = 1000,
        stack = true,
        close = false,
        description = "It's a USB, but white",
    },

    ['yellowusb'] = {
        label = "Yellow USB",
        weight = 1000,
        stack = true,
        close = false,
        description = "It's a USB, but yellow",
    },

    ['purpleusb'] = {
        label = "Purple USB",
        weight = 1000,
        stack = true,
        close = false,
        description = "It's a USB, but purple",
    },

    ['blackusb'] = {
        label = "Black USB",
        weight = 1000,
        stack = true,
        close = false,
        description = "It's a USB, but black",
    },

    ["redusb"] = {
		label = "Red USB", 
		weight = 1000, 
		stack = true, 
		close = false, 
		description = "It's a USB, but red",
	},

    ["greenusb"] = {
		label = "Green USB", 
		weight = 1000, 
		stack = true, 
		close = false, 
		description = "It's a USB, but green",
	},

-- Key Cards
    ['yellowkeycard'] = {
        label = "Yellow Keycard",
        weight = 1000,
        stack = true,
        close = false,
        description = "It's a keycard, but yellow",
    },

    ['purplekeycard'] = {
        label = "Purple Keycard",
        weight = 1000,
        stack = true,
        close = false,
        description = "It's a keycard, but purple",
    },

    ['blackkeycard'] = {
        label = "Black Keycard",
        weight = 1000,
        stack = true,
        close = false,
        description = "It's a keycard, but black",
    },

    ['whitekeycard'] = {
        label = "White Keycard",
        weight = 1000,
        stack = true,
        close = false,
        description = "It's a keycard, but white",
    },

    ['redkeycard'] = {
        label = "Red Keycard",
        weight = 1000,
        stack = true,
        close = false,
        description = "It's a keycard, but red",
    },

    ['greenkeycard'] = {
        label = "Green Keycard",
        weight = 1000,
        stack = true,
        close = false,
        description = "It's a keycard, but green",
    },


    -- Bank Trucks
    ['hackdevice'] = {
        label = 'Hack Device',
        weight = 1000,
        stack = true,
        close = true,
        consume = 0,
        description = 'A device for bypassing security',
        client = {
            event = 'rm_banktruck:client:itemUsed',
        },
    },
    ['gasgrenade'] = {
        label = 'Gas Grenade',
        weight = 1000,
        stack = true,
        close = true,
        consume = 0,
        description = 'Lethal gas that can eliminate guards',
        client = {
            event = 'rm_banktruck:client:itemUsed',
        },
    },
    ['explosive'] = {
        label = 'Explosive',
        weight = 1000,
        stack = true,
        close = true,
        consume = 0,
        description = 'Compact explosive, not quite strong enough for a vault door.',
        client = {
            event = 'rm_banktruck:client:itemUsed',
        },
    },

    -- Bobcat
    ["bobcatkeycard"] = {
        label = "Bobcat Keycard",
        weight = 1000,
        stack = true,
        close = false,
        description = "A security card for Bobcat",
    },

    -- Vangelico
    ["vangelicosafekey"] = {
        label = "Vangelico Safe Key",
        weight = 1000,
        stack = true,
        close = false,
        description = "The key to the Vangelico Jewelery Store Safe",
    },

    ["x_fingerprintbag"] = {
        label = "Vangelico Safe Fingerprint",
        weight = 50,
        stack = true,
        close = false,
        description = "A fingerprint taken from the Vangelico Jewelery Safe",
    },

    -- Cash Exchange

    ['cashexchangekey'] = {
        label = "Cash Exchange Vault Key",
        weight = 1000,
        stack = true,
        close = false,
        description = "All you gotta do now is get to the vault...",
    },

    ['cashexchangebadge'] = {
        label = "Cash Exchange Badge",
        weight = 1000,
        stack = true,
        close = false,
        description = "Could be useful for getting through a door with a keypad",
    },

    -- Maze Bank
    ['mazecard'] = {
        label = "Maze Bank Card",
        weight = 1000,
        stack = true,
        close = false,
        description = "A Maze Bank Key Card",
    },

    -- Fleeca Bank
    ['fleecacard'] = {
        label = "Fleeca Bank Card",
        weight = 1000,
        stack = true,
        close = false,
        description = "A Fleeca Bank Key Card",
    },

    ['employeepictures'] = {
        label = "Fleeca Bank Employee Data",
        weight = 1000,
        stack = true,
        close = false,
        description = "Information on all the employees working for Fleeca Bank",
    },

    -- Paleto Bank
    ["paletocard"] = {
        label = "Paleto Bank Card",
        weight = 1000,
        stack = false,
        close = false,
        description = "A security card for Paleto Bank",
    },

    ["paleto_key"] = {
        label = "Paleto Bank Key",
        weight = 1000,
        stack = false,
        close = false,
        description = "Paleto Bank Key",
        client = {
            image = "paleto_key.png",
        }
    },

    -- Sandy Bank
    ["sandycard"] = {
        label = "Sandy Bank Card",
        weight = 1000,
        stack = true,
        close = false,
        description = "A security card for Sandy bank",
    },

    -- Merryweather 
    ["merryweathershippingmanifest"] = {
        label = "Merryweather Shipping Manifest",
        weight = 1000,
        stack = false,
        close = true,
        degrade = 10,
        decay = true,
        description = "CLASSIFIED: Location Of A Merryweather Shipping Container.",
        client = { 
            event = 'storm-merryweather:removeUsb',
        }
    },

    ["merryweathercard"] = {
        label = "Merryweather Card",
        weight = 1000,
        stack = true,
        close = false,
        description = "This must've fallen off a security guard",
    },

    -- ATM ROBBERIES
    ['nylonrope'] = {
        label = 'Nylon Rope',
        description = 'The strongest rope material..',
        weight = 500,
        close = true,
        stack = true,
        client = {
        image = "nylonrope.png",
        event = 'projectx-atmrobbery:client:UseRope',
    }
    },

    ['atmred'] = {
        label = 'Red ATM',
        description = 'A console of an automated teller.',
        weight = 350,
        close = true,
        stack = false,
        degrade = 120,
        decay = true,
        client = {
            image = "atmred.png",
            event = 'projectx-atmrobbery:client:UseAtm-Red',
        }
    },

    ['atmblue'] = {
        label = 'Blue ATM',
        description = 'A console of an automated teller.',
        weight = 350,
        close = true,
        stack = false,
        degrade = 120,
        decay = true,
        client = {
            image = "atmblue.png",
            event = 'projectx-atmrobbery:client:UseAtm-Blue',
        }
    },

    ['atmgreen'] = {
        label = 'Green ATM',
        description = 'A console of an automated teller.',
        weight = 350,
        close = true,
        stack = false,
        client = {
            image = "atmgreen.png",
            event = 'projectx-atmrobbery:client:UseAtm-Green',
        }
    },

    ['atmpanel'] = {
        label = 'ATM Panel',
        description = 'A back panel from an automated teller.',
        weight = 125,
        close = true,
        stack = false,
        client = {
            image = "atmpanel.png",
        }
    },

    ['atmcables'] = {
        label = 'ATM Cables',
        description = 'Cables from an automated teller.',
        weight = 125,
        close = true,
        stack = false,
        client = {
            image = "atmcables.png",
        }
    },

    ['atmmotherboard'] = {
        label = 'ATM Motherboard',
        description = 'A motherboard from an automated teller.',
        weight = 125,
        close = true,
        stack = false,
        client = {
            image = "atmmotherboard.png",
        }
    },

    ['blowtorch'] = {
        label = 'Blow Torch',
        description = 'Ooo hot...',
        weight = 125,
        close = true,
        stack = true,
        client = {
            image = "blowtorch.png",
        }
    },

    ["racingtablet"] = {
        label = "Racing tablet",
        weight = 1000,
        stack = false,
        close = true,
        description = "Seems like something to do with cars.",
        client = {
            image = "racingtablet.png",
        }
    },


    --MINING / PAWNSHOP --

    ["jewellerybag"] = {
        label = "Jewellery Bag",
        weight = 500,
        stack = true,
        close = true,
        description = "A jewellery bag, anything good inside?",
        client = {
            image = "jewellerybag.png",
        }
    },
     
    ["glass"] = {
        label = "Glass",
        weight = 250,
        stack = true,
        close = false,
        description = "It is very fragile, watch out",
        client = {
            image = "glass.png",
        }
    },

    ["uncut_sapphire"] = {
        label = "Uncut Sapphire",
        weight = 100,
        stack = true,
        close = false,
        description = "A rough Sapphire",
        client = {
            image = "uncut_sapphire.png",
        }
    },
    
    ["miningdrill"] = {
        label = "Mining Drill",
        weight = 10000,
        stack = true,
        close = false,
        description = "Drill used for mining",
        client = {
            image = "miningdrill.png",
        }
    },

    ["emerald_ring_silver"] = {
        label = "Emerald Ring Silver",
        weight = 200,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "emerald_ring_silver.png",
        }
    },

    ["uncut_emerald"] = {
        label = "Uncut Emerald",
        weight = 100,
        stack = true,
        close = false,
        description = "A rough Emerald",
        client = {
            image = "uncut_emerald.png",
        }
    },
         
    ["emerald_earring"] = {
        label = "Emerald Earrings",
        weight = 200,
        stack = true,
        close = false,
        description = "Emerald Earrings",
        client = {
            image = "emerald_earring.png",
        }
    },
        
    ["emerald_necklace"] = {
        label = "Emerald Necklace",
        weight = 200,
        stack = true,
        close = false,
        description = "Emerald Necklace",
        client = {
            image = "emerald_necklace.png",
        }
    },
    
    ["sapphire_ring"] = {
        label = "Sapphire Ring",
        weight = 200,
        stack = true,
        close = false,
        description = "Shiny Sapphire Ring",
        client = {
            image = "sapphire_ring.png",
        }
    },
    
    ["silverearring"] = {
        label = "Silver Earrings",
        weight = 200,
        stack = true,
        close = false,
        description = "Silver Earrings",
        client = {
            image = "silver_earring.png",
        }
    },
        
    ["drillbit"] = {
        label = "Drill Bit",
        weight = 250,
        stack = true,
        close = false,
        description = "Drill Bit",
        client = {
            image = "drillbit.png",
        }
    },
        
    ["ironore"] = {
        label = "Iron Ore",
        weight = 1000,
        stack = true,
        close = false,
        description = "Iron, a base ore.",
    },

    ["sulfurore"] = {
        label = "Sulfur Ore",
        weight = 1000,
        stack = true,
        close = false,
        description = "Sulfur Ore. It can be refined into sulfur.",
    },

    ["sulfur"] = {
        label = "Sulfur",
        weight = 700,
        stack = true,
        close = false,
        description = "Sulfur, a material commonly used in explosives.",
    },

    ["coal"] = {
        label = "Coal",
        weight = 700,
        stack = true,
        close = false,
        description = "It's kind of like salt",
    },

    ["goldearring"] = {
        label = "Gold Earrings",
        weight = 200,
        stack = true,
        close = false,
        description = "Gold Earrings",
        client = {
            image = "gold_earring.png",
        }
    },
    
    ["tenkgoldchain"] = {
        label = "10k Gold Chain",
        weight = 700,
        stack = true,
        close = true,
        description = "10 carat golden chain",
        client = {
            image = "10kgoldchain.png",
        }
    },
    
    ["goldbar"] = {
        label = "Gold Bar",
        weight = 500,
        stack = true,
        close = true,
        description = "Looks pretty expensive to me",
        client = {
            image = "goldbar.png",
        }
    },
    
    ["silverore"] = {
        label = "Silver Ore",
        weight = 1000,
        stack = true,
        close = false,
        description = "Silver Ore",
        client = {
            image = "silverore.png",
        }
    },
    
    ["emerald_earring_silver"] = {
        label = "Emerald Earrings Silver",
        weight = 200,
        stack = true,
        close = false,
        description = "Emerald Earrings",
        client = {
            image = "emerald_earring_silver.png",
        }
    },
    
    ["silveringot"] = {
        label = "Silver Ingot",
        weight = 1000,
        stack = true,
        close = false,
        description = "Silver Ingot",
        client = {
            image = "silveringot.png",
        }
    },
    
    ["sapphire_necklace_silver"] = {
        label = "Sapphire Necklace Silver",
        weight = 200,
        stack = true,
        close = false,
        description = "Sapphire Necklace",
        client = {
            image = "sapphire_necklace_silver.png",
        }
    },
    
    ["copper"] = {
        label = "Copper",
        weight = 250,
        stack = true,
        close = false,
        description = "Nice piece of metal that you can probably use for something",
        client = {
            image = "copper.png",
        }
    },
    
    ["uncut_ruby"] = {
        label = "Uncut Ruby",
        weight = 100,
        stack = true,
        close = false,
        description = "A rough Ruby",
        client = {
            image = "uncut_ruby.png",
        }
    },
    
    ["diamond_ring"] = {
        label = "Diamond Ring",
        weight = 200,
        stack = true,
        close = false,
        description = "Shiny Diamond Ring",
        client = {
            image = "diamond_ring.png",
        }
    },
    
    ["pickaxe"] = {
        label = "Pickaxe",
        weight = 1500,
        stack = false,
        close = false,
        description = "Pickaxe used for mining",
        client = {
            image = "pickaxe.png",
        }
    },
    
    ["diamond_necklace"] = {
        label = "Diamond Necklace",
        weight = 200,
        stack = true,
        close = false,
        description = "Diamond Necklace",
        client = {
            image = "diamond_necklace.png",
        }
    }, 
    
    ["ruby_earring_silver"] = {
        label = "Ruby Earrings Silver",
        weight = 200,
        stack = true,
        close = false,
        description = "Ruby Earrings",
        client = {
            image = "ruby_earring_silver.png",
        }
    },
    
    ["drill"] = {
        label = "Drill",
        weight = 20000,
        stack = true,
        close = false,
        description = "The real deal...",
        client = {
            image = "drill.png",
        }
    },  
    
    ["goldpan"] = {
        label = "Gold Panning Tray",
        weight = 1000,
        stack = true,
        close = false,
        description = "Gold Panning Tray",
        client = {
            image = "goldpan.png",
        }
    },
    
    ["diamond_ring_silver"] = {
        label = "Diamond Ring Silver",
        weight = 200,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "diamond_ring_silver.png",
        }
    },
    
    ["emerald"] = {
        label = "Emerald",
        weight = 100,
        stack = true,
        close = false,
        description = "A Emerald that shimmers",
        client = {
            image = "emerald.png",
        }
    },
    
    ["gold_ring"] = {
        label = "Gold Ring",
        weight = 200,
        stack = true,
        close = false,
        description = "Shiny Gold Ring",
        client = {
            image = "gold_ring.png",
        }
    },
    
    ["ruby_ring"] = {
        label = "Ruby Ring",
        weight = 200,
        stack = true,
        close = false,
        description = "Shiny Ruby Ring",
        client = {
            image = "ruby_ring.png",
        }
    },
       
    ["emerald_ring"] = {
        label = "Emerald Ring",
        weight = 200,
        stack = true,
        close = false,
        description = "Shiny Emerald Ring",
        client = {
            image = "emerald_ring.png",
        }
    },
    
    ["sapphire_ring_silver"] = {
        label = "Sapphire Ring Silver",
        weight = 200,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "sapphire_ring_silver.png",
        }
    },
    
    ["diamond_earring"] = {
        label = "Diamond Earrings",
        weight = 200,
        stack = true,
        close = false,
        description = "Diamond Earrings",
        client = {
            image = "diamond_earring.png",
        }
    },
    
    ["ruby_earring"] = {
        label = "Ruby Earrings",
        weight = 200,
        stack = true,
        close = false,
        description = "Ruby Earrings",
        client = {
            image = "ruby_earring.png",
        }
    },
    
    ["rolex"] = {
        label = "Golden Watch",
        weight = 200,
        stack = true,
        close = true,
        description = "A golden watch seems like the jackpot to me!",
        client = {
            image = "rolex.png",
        }
    },

    ["carbon"] = {
        label = "Carbon",
        weight = 1000,
        stack = true,
        close = false,
        description = "Carbon, a base ore.",
        client = {
            image = "carbon.png",
        }
    },
    
    ["copperore"] = {
        label = "Copper Ore",
        weight = 1000,
        stack = true,
        close = false,
        description = "Copper, a base ore.",
        client = {
            image = "copperore.png",
        }
    },
    
    ["goldore"] = {
        label = "Gold Ore",
        weight = 1000,
        stack = true,
        close = false,
        description = "Gold Ore",
        client = {
            image = "goldore.png",
        }
    },
    
    ["mininglaser"] = {
        label = "Mining Laser",
        weight = 15000,
        stack = true,
        close = false,
        description = "Laser used for mining",
        client = {
            image = "mininglaser.png",
        }
    },
    
    ["bottle"] = {
        label = "Empty Bottle",
        weight = 100,
        stack = true,
        close = false,
        description = "A glass bottle",
        client = {
            image = "bottle.png",
        }
    },

    ["can"] = {
        label = "Empty Can",
        weight = 100,
        stack = true,
        close = false,
        description = "A tin can",
        client = {
            image = "can.png",
        }
    },
    
    ["iron"] = {
        label = "Iron",
        weight = 250,
        stack = true,
        close = false,
        description = "Handy piece of metal that you can probably use for something",
        client = {
            image = "iron.png",
        }
    },
    
    ["plastic"] = {
        label = "Plastic",
        weight = 250,
        stack = true,
        close = false,
        description = "RECYCLE! - Greta Thunberg 2019",
        client = {
            image = "plastic.png",
        }
    },
    
    ["ruby_ring_silver"] = {
        label = "Ruby Ring Silver",
        weight = 200,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "ruby_ring_silver.png",
        }
    },
    
    ["aluminum"] = {
        label = "Aluminium",
        weight = 250,
        stack = true,
        close = false,
        description = "Nice piece of metal that you can probably use for something",
        client = {
            image = "aluminum.png",
        }
    },

    ["metalscrap"] = {
        label = "Metal Scrap",
        weight = 250,
        stack = true,
        close = false,
        description = "You can probably make something nice out of this",
        client = {
            image = "metalscrap.png",
        }
    },
      
    ["sapphire_earring"] = {
        label = "Sapphire Earrings",
        weight = 200,
        stack = true,
        close = false,
        description = "Sapphire Earrings",
        client = {
            image = "sapphire_earring.png",
        }
    },
    
    ["sapphire"] = {
        label = "Sapphire",
        weight = 100,
        stack = true,
        close = false,
        description = "A Sapphire that shimmers",
        client = {
            image = "sapphire.png",
        }
    },
    
    ["uncut_diamond"] = {
        label = "Uncut Diamond",
        weight = 100,
        stack = true,
        close = false,
        description = "A rough Diamond",
        client = {
            image = "uncut_diamond.png",
        }
    },
    
    ["diamond"] = {
        label = "Diamond",
        weight = 100,
        stack = true,
        close = false,
        description = "A Diamond that shimmers",
        client = {
            image = "diamond.png",
        }
    },
    
    ["emerald_necklace_silver"] = {
        label = "Emerald Necklace Silver",
        weight = 200,
        stack = true,
        close = false,
        description = "Emerald Necklace",
        client = {
            image = "emerald_necklace_silver.png",
        }
    },
    
    ["goldchain"] = {
        label = "Golden Chain",
        weight = 200,
        stack = true,
        close = false,
        description = "Shiny Golden Chain",
        client = {
            image = "goldchain.png",
        }
    },
    
    ["silverchain"] = {
        label = "Silver Chain",
        weight = 200,
        stack = true,
        close = false,
        description = "Silver Chain",
        client = {
            image = "silverchain.png",
        }
    },
    
    ["ruby_necklace_silver"] = {
        label = "Ruby Necklace Silver",
        weight = 200,
        stack = true,
        close = false,
        description = "Ruby Necklace",
        client = {
            image = "ruby_necklace_silver.png",
        }
    },

    ["silver_ring"] = {
        label = "Silver Ring",
        weight = 200,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "silver_ring.png",
        }
    },
    
    ["stone"] = {
        label = "Stone",
        weight = 1000,
        stack = true,
        close = false,
        description = "Stone woo",
        client = {
            image = "stone.png",
        }
    },
        
    ["sapphire_earring_silver"] = {
        label = "Sapphire Earrings Silver",
        weight = 200,
        stack = true,
        close = false,
        description = "Sapphire Earrings",
        client = {
            image = "sapphire_earring_silver.png",
        }
    },
    
    ["ruby_necklace"] = {
        label = "Ruby Necklace",
        weight = 200,
        stack = true,
        close = false,
        description = "Ruby Necklace",
        client = {
            image = "ruby_necklace.png",
        }
    },
    
    ["sapphire_necklace"] = {
        label = "Sapphire Necklace",
        weight = 200,
        stack = true,
        close = false,
        description = "Sapphire Necklace",
        client = {
            image = "sapphire_necklace.png",
        }
    },
    
    ["diamond_necklace_silver"] = {
        label = "Diamond Necklace Silver",
        weight = 200,
        stack = true,
        close = false,
        description = "Diamond Necklace",
        client = {
            image = "diamond_necklace_silver.png",
        }
    },
    
    ["diamond_earring_silver"] = {
        label = "Diamond Earrings Silver",
        weight = 200,
        stack = true,
        close = false,
        description = "Diamond Earrings",
        client = {
            image = "diamond_earring_silver.png",
        }
    },

    ["ruby"] = {
        label = "Ruby",
        weight = 100,
        stack = true,
        close = false,
        description = "A Ruby that shimmers",
        client = {
            image = "ruby.png",
        }
    },
    
    ["rubber"] = {
        label = "Rubber",
        weight = 250,
        stack = true,
        close = false,
        description = "Rubber, I believe you can make your own rubber ducky with it :D",
        client = {
            image = "rubber.png",
        }
    },
    
    ["steel"] = {
        label = "Steel",
        weight = 250,
        stack = true,
        close = false,
        description = "Nice piece of metal that you can probably use for something",
        client = {
            image = "steel.png",
        }
    },
    
    ["goldingot"] = {
        label = "Gold Ingot",
        weight = 1000,
        stack = true,
        close = false,
        description = "Gold Ingot",
        client = {
            image = "goldingot.png",
        }
    },

    -- ILLEGAL DRUGS --

    ['lean'] = {
        label = 'Lean',
        weight = 500,
        stack = true,
        close = true,
        description = 'Purple medicine mix.',
        client = {
        event = 'os-lean:client:useLean'
        }
    },
    
    ['sprunk'] = { 
        label = 'Sprunk',
        weight = 350,
        stack = true,
        close = true 
    },

    ['icecubes'] = { 
        label = 'Ice Cubes',
        weight = 150,
        stack = true,
        close = true 
    },

    ['jollydrops'] = { 
        label = 'Jolly Drops',
        weight = 250,
        stack = true,
        close = true 
    },

    ['syrup'] = { 
        label = 'Syrup',
        weight = 300,
        stack = true,
        close = true 
    },

    ["package"] = {
        label = "Suspicious Package",
        weight = 5000,
        stack = false,
        close = false,
        description = "A mysterious package.. Scary!",
        client = {
            image = "package.png",
        }
    },

    ["illegalpackage"] = {
        label = "Suspicious Package",
        weight = 5000,
        stack = false,
        close = false,
        description = "A mysterious package.. Scary!",
        client = {
            image = "package.png",
        }
    },

    
    ["bakingsoda"] = {
        label = "Baking Soda",
        weight = 100,
        stack = true,
        close = false,
        description = "Household Baking Soda!",
        client = {
            image = "bakingsoda.png",
        }
    },

    ["coca_leaf"] = {
        label = "Cocaine leaves",
        weight = 500,
        stack = true,
        close = false,
        description = "Cocaine leaves that must be processed !",
        client = {
            image = "coca_leaf.png",
        }
    },
    
    ["cocaine_packaged"] = {
        label = "cocaine_packaged",
        weight = 500,
        stack = true,
        close = true,
        description = "Packaged Cocaine",
        client = {
            image = "coke_brick.png",
        }
    },
    
    ["trimming_scissors"] = {
        label = "Trimming Scissors",
        weight = 1000,
        stack = true,
        close = false,
        description = "Very Sharp Trimming Scissors",
        client = {
            image = "trimming_scissors.png",
        }
    },

    ["sulfuric_acid"] = {
        label = "Sulfuric Acid",
        weight = 500,
        stack = true,
        close = false,
        description = "Chemicals, handle with care!",
        client = {
            image = "sulfuric_acid.png",
        }
    },
    
    ["finescale"] = {
        label = "Fine Scale",
        weight = 1000,
        stack = true,
        close = false,
        description = "Scale Used for Fine Powders and Materials.",
        client = {
            image = "finescale.png",
        }
    },
    
    ["cannabis_leaf"] = {
        label = "Trimmed Cannabis",
        weight = 300,
        stack = true,
        close = false,
        description = "Trimmed Cannabis. Could probably be dried.",
        client = {
            image = "clean_weed_bud.png",
        }
    },
    
    ["coke_small_brick"] = {
        label = "Coke Package",
        weight = 350,
        stack = true,
        close = true,
        description = "Small package of cocaine, mostly used for deals and takes a lot of space",
        client = {
            image = "coke_small_brick.png",
        }
    },
    
    ["hydrochloric_acid"] = {
        label = "Hydrochloric Acid",
        weight = 500,
        stack = true,
        close = true,
        description = "Chemicals, handle with care!",
        client = {
            image = "hydrochloric_acid.png",
        }
    },
    
    ["coke_brick"] = {
        label = "Coke Brick",
        weight = 1000,
        stack = false,
        close = true,
        description = "Heavy package of cocaine, mostly used for deals and takes a lot of space",
        client = {
            image = "coke_brick.png",
        }
    },
    
    ["weed_brick"] = {
        label = "Weed Brick",
        weight = 1000,
        stack = false,
        close = true,
        description = "Heavy package of weed, mostly used for deals and takes a lot of space",
        client = {
            image = "weed_brick.png",
        }
    },

    ["cannabis_dried"] = {
        label = "Dried Cannabis",
        weight = 300,
        stack = true,
        close = false,
        description = "Trimmed Cannabis. Could probably be dried.",
        client = {
            image = "weed_og-kush_cbd_crop.png",
        }
    },
    
    ["methtray"] = {
        label = "Meth Tray",
        weight = 200,
        stack = true,
        close = false,
        description = "make some meth",
        client = {
            image = "meth_tray.png",
        }
    },

    ["liquidmix"] = {
        label = "Liquid Chem Mix",
        weight = 300,
        stack = true,
        close = false,
        description = "Chemicals, handle with care!",
        client = {
            image = "liquidmix.png",
        }
    },    
        
    ["chemicalvapor"] = {
        label = "Chemical Vapors",
        weight = 300,
        stack = true,
        close = false,
        description = "High Pressure Chemical Vapors, Explosive!",
        client = {
            image = "chemicalvapor.png",
        }
    },
    
    ["bagofmeth"] = {
        label = "Bag of Meth",
        weight = 250,
        stack = true,
        close = true,
        description = "A Bag of Meth",
        client = {
            image = "meth_baggy.png",
        }
    },
    
    ["bagofcoke"] = {
        label = "Bag of Coke",
        weight = 250,
        stack = true,
        close = true,
        description = "A Bag of Coke",
    },
    
    ["bagofweed"] = {
        label = "Bag of Weed",
        weight = 100,
        stack = true,
        close = true,
        description = "A Bag of Weed",
        client = {
           image = "weedbaggy.png",
        }
    },

    ["purebagofmeth"] = {
        label = "Pure Bag of Meth",
        weight = 250,
        stack = true,
        close = true,
        description = "A Bag of Meth",
        client = {
            image = "purebagofmeth.png",
        }
    },
    
    ["purebagofcoke"] = {
        label = "Pure Bag of Coke",
        weight = 250,
        stack = true,
        close = true,
        description = "A Bag of Coke",
        client = {
            image = "purebagofcoke.png",
        }
    },
    
    ["purebagofweed"] = {
        label = "Pure Bag of Weed",
        weight = 100,
        stack = true,
        close = true,
        description = "A Bag of Weed",
        client = {
           image = "purebagofweed.png",
        }
    },
    
    ["cannabis_plant"] = {
        label = "Cannabis Plant",
        weight = 500,
        stack = true,
        close = false,
        description = "Cannabis Plant. Maybe try trimming it.",
        client = {
            image = "cannabis_plant.png",
        }
    },
    
    ["sodium_hydroxide"] = {
        label = "Sodium Hydroxide",
        weight = 500,
        stack = true,
        close = true,
        description = "Chemicals, handle with care!",
        client = {
            image = "sodium_hydroxide.png",
        }
    },
    
    ["coke"] = {
        label = "Cocaine",
        weight = 100,
        stack = true,
        close = false,
        description = "Processed cocaine",
        client = {
            image = "coke.png",
        }
    },

    -- Mystery Boxes

    ["mysterybag"] = {
        label = "Mystery Bag",
        weight = 1000,
        stack = true,
        close = true,
        description = "...",
    },

    ["weaponmysterybox"] = {
        label = "Weapon Mystery Box",
        weight = 1000,
        stack = true,
        close = true,
        description = "...",
        client = {
            image = "weaponmysterybox.png",
        }
    },

    ["partsmysterybox"] = {
        label = "Weapon Parts Mystery Box",
        weight = 1000,
        stack = true,
        close = true,
        description = "...",
        client = {
            image = "partsmysterybox.png",
        }
    },

    ["heistmysterybox"] = {
        label = "Heist Mystery Box",
        weight = 1000,
        stack = true,
        close = true,
        description = "...",
        client = {
            image = "heistmysterybox.png",
        }
    },

    ["xmasmysterybox"] = {
        label = "Christmas Mystery Box",
        weight = 1000,
        stack = true,
        close = true,
        description = "...",
        client = {
            image = "xmasmysterybox.png",
        }
    },
    
    -- PETS --
    
    ["keepcompanionhusky"] = {
        label = "Husky",
        weight = 10000,
        stack = false,
        close = true,
        description = "Husky is your royal companion!",
        client = {
            image = "A_C_Husky.png",
        }
    },

    ["firstaidforpet"] = {
        label = "First aid for pet",
        weight = 500,
        stack = true,
        close = true,
        description = "Revive your pet!",
        client = {
            image = "firstaidforpet.png",
        }
    },
        
    ["keepcompanionshepherd"] = {
        label = "Shepherd",
        weight = 10000,
        stack = false,
        close = true,
        description = "Shepherd is your royal companion!",
        client = {
            image = "A_C_shepherd.png",
        }
    },
    
    ["petwaterbottleportable"] = {
        label = "Portable water bottle",
        weight = 1000,
        stack = false,
        close = true,
        description = "Flask to store water for your pets",
        client = {
            image = "petwaterbottleportable.png",
        }
    },
      
    ["keepcompanionpug"] = {
        label = "Pug",
        weight = 10000,
        stack = false,
        close = true,
        description = "Pug is your royal companion!",
        client = {
            image = "A_C_Pug.png",
        }
    },
    
    ["keepcompanionhen"] = {
        label = "Hen",
        weight = 10000,
        stack = false,
        close = true,
        description = "Hen is your royal companion!",
        client = {
            image = "A_C_Hen.png",
        }
    },
    
    ["collarpet"] = {
        label = "Pet collar",
        weight = 500,
        stack = true,
        close = true,
        description = "Rename your pets!",
        client = {
            image = "collarpet.png",
        }
    },
    
    ["keepcompanioncat"] = {
        label = "Cat",
        weight = 10000,
        stack = false,
        close = true,
        description = "Cat is your royal companion!",
        client = {
            image = "A_C_Cat_01.png",
        }
    },
    
    ["keepcompanionrottweiler"] = {
        label = "Rottweiler",
        weight = 10000,
        stack = false,
        close = true,
        description = "Rottweiler is your royal companion!",
        client = {
            image = "A_Rottweiler.png",
        }
    },
    
    ["keepcompanionwesty"] = {
        label = "Westy",
        weight = 10000,
        stack = false,
        close = true,
        description = "Westy is your royal companion!",
        client = {
            image = "A_C_Westy.png",
        }
    },
    
    ["petfood"] = {
        label = "pet food",
        weight = 500,
        stack = true,
        close = true,
        description = "food for your companion!",
        client = {
            image = "petfood.png",
        }
    },
    
    ["keepcompanionrat"] = {
        label = "Rat",
        weight = 10000,
        stack = false,
        close = true,
        description = "Your royal companion!",
        client = {
            image = "A_C_Rat.png",
        }
    },
    
    ["keepcompanionretriever"] = {
        label = "Retriever",
        weight = 10000,
        stack = false,
        close = true,
        description = "Retriever is your royal companion!",
        client = {
            image = "A_C_Retriever.png",
        }
    },
    
    ["petgroomingkit"] = {
        label = "Pet Grooming Kit",
        weight = 1000,
        stack = false,
        close = true,
        description = "Pet Grooming Kit",
        client = {
            image = "petgroomingkit.png",
        }
    },
    
    ["keepcompanionpoodle"] = {
        label = "Poodle",
        weight = 10000,
        stack = false,
        close = true,
        description = "Poodle is your royal companion!",
        client = {
            image = "A_C_Poodle.png",
        }
    },
    
    ["keepcompanionrabbit"] = {
        label = "Rabbit",
        weight = 10000,
        stack = false,
        close = true,
        description = "Rabbit is your royal companion!",
        client = {
            image = "A_C_Rabbit_01.png",
        }
    },
    
    ["petnametag"] = {
        label = "Name tag",
        weight = 500,
        stack = true,
        close = true,
        description = "Rename your pet",
        client = {
            image = "petnametag.png",
        }
    },
    
    -- Mechanic --

    ['tunerchip'] = {
        label = 'Tuner Chip',
        weight = 250,
        stack = false,
        close = true,
        degrade = 20160,
        decay = true,
        description = 'Reusable performance tuner chip',
    },    
    
    ["veh_xenons"] = {
        label = "Xenons",
        weight = 1000,
        stack = true,
        close = true,
        description = "Upgrade vehicle xenons",
        client = {
            image = "veh_xenons.png",
        }
    },

    ["nitrous"] = {
        label = "Nitrous",
        weight = 1000,
        stack = true,
        close = true,
        description = "Speed up, gas pedal! :D",
        client = {
            image = "nitrous.png",
        }
    },

    ["mechmetalscrap"] = {
        label = "Mechanic Metal Scrap",
        weight = 100,
        stack = true,
        close = false,
        description = "Materials for Mechanics",
        client = {
            image = "metalscrap.png",
        }
    },

     ["mechsteel"] = {
        label = "Mechanic Steel",
        weight = 100,
        stack = true,
        close = false,
        description = "Materials for Mechanics",
        client = {
            image = "steel.png",
        }
    },

    ["veh_armor"] = {
        label = "Armor",
        weight = 1000,
        stack = true,
        close = true,
        description = "Upgrade vehicle armor",
        client = {
            image = "veh_armor.png",
        }
    },
    
    ["mechrubber"] = {
        label = "Mechanic Rubber",
        weight = 100,
        stack = true,
        close = false,
        description = "Materials for Mechanics",
        client = {
            image = "rubber.png",
        }
    },

    ["turbopart"] = {
        label = "Parts for Turbo",
        weight = 1000,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "turbopart.png",
        }
    },
    
    ["mechiron"] = {
        label = "Mechanic Iron",
        weight = 100,
        stack = true,
        close = false,
        description = "Materials for Mechanics",
        client = {
            image = "iron.png",
        }
    },
    
    ["mechaluminum"] = {
        label = "Mechanic Aluminium",
        weight = 100,
        stack = true,
        close = false,
        description = "Materials for Mechanics",
        client = {
            image = "aluminum.png",
        }
    },
    
    ["repairkit"] = {
        label = "Repairkit",
        weight = 2500,
        stack = true,
        close = true,
        description = "A nice toolbox with stuff to repair your vehicle",
        client = {
            image = "repairkit.png",
        }
    },
    
    ["mechplastic"] = {
        label = "Mechanic Plastic",
        weight = 100,
        stack = true,
        close = false,
        description = "Materials for Mechanics",
        client = {
            image = "plastic.png",
        }
    },

    ["brakespart"] = {
        label = "Brake Parts",
        weight = 1000,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "brakespart.png",
        }
    },
    
    ["suspensionpart"] = {
        label = "Parts for suspension",
        weight = 1000,
        stack = true,
        close = false,
        description = "",
        client = {
            image = "suspension5.png",
        }
    },
    
    ["stancekit"] = {
        label = "Stancer Kit",
        weight = 1000,
        stack = true,
        close = false,
        description = "stancer kit",
        client = {
            image = "stancekit.png",
        }
    },

    ["engine_oil"] = {
        label = "Engine Oil",
        weight = 1000,
    },
    ["tyre_replacement"] = {
        label = "Tyre Replacement",
        weight = 1000,
    },
    ["clutch_replacement"] = {
        label = "Clutch Replacement",
        weight = 1000,
    },
    ["air_filter"] = {
        label = "Air Filter",
        weight = 100,
    },
    ["spark_plug"] = {
        label = "Spark Plug",
        weight = 1000,
    },
    ["brakepad_replacement"] = {
        label = "Brakepad Replacement",
        weight = 1000,
    },
    ["suspension_parts"] = {
        label = "Suspension Parts",
        weight = 1000,
    },
    -- Engine Items
    ["i4_engine"] = {
        label = "I4 Engine",
        weight = 1000,
    },
    ["v6_engine"] = {
        label = "V6 Engine",
        weight = 1000,
    },
    ["v8_engine"] = {
        label = "V8 Engine",
        weight = 1000,
    },
    ["v12_engine"] = {
        label = "V12 Engine",
        weight = 1000,
    },
    ["turbocharger"] = {
        label = "Turbocharger",
        weight = 1000,
    },
    -- Electric Engines
    ["ev_motor"] = {
        label = "EV Motor",
        weight = 1000,
    },
    ["ev_battery"] = {
        label = "EV Battery",
        weight = 1000,
    },
    ["ev_coolant"] = {
        label = "EV Coolant",
        weight = 1000,
    },
    -- Drivetrain Items
    ["awd_drivetrain"] = {
        label = "AWD Drivetrain",
        weight = 1000,
    },
    ["rwd_drivetrain"] = {
        label = "RWD Drivetrain",
        weight = 1000,
    },
    ["fwd_drivetrain"] = {
        label = "FWD Drivetrain",
        weight = 1000,
    },
    -- Tuning Items
    ["slick_tyres"] = {
        label = "Slick Tyres",
        weight = 1000,
    },
    ["semi_slick_tyres"] = {
        label = "Semi Slick Tyres",
        weight = 1000,
    },
    ["offroad_tyres"] = {
        label = "Offroad Tyres",
        weight = 1000,
    },
    ["drift_tuning_kit"] = {
        label = "Drift Tuning Kit",
        weight = 1000,
    },
    ["ceramic_brakes"] = {
        label = "Ceramic Brakes",
        weight = 1000,
    },
    -- Cosmetic Items
    ["lighting_controller"] = {
        label = "Lighting Controller",
        weight = 100,
        client = {
            event = "jg-mechanic:client:show-lighting-controller",
        }
    },
    ["stancing_kit"] = {
        label = "Stancer Kit",
        weight = 100,
        client = {
            event = "jg-mechanic:client:show-stancer-kit",
        }
    },
    ["cosmetic_part"] = {
        label = "Cosmetic Parts",
        weight = 100,
    },
    ["respray_kit"] = {
        label = "Respray Kit",
        weight = 1000,
    },
    ["vehicle_wheels"] = {
        label = "Vehicle Wheels Set",
        weight = 1000,
    },
    ["tyre_smoke_kit"] = {
        label = "Tyre Smoke Kit",
        weight = 1000,
    },
    ["bulletproof_tyres"] = {
        label = "Bulletproof Tyres",
        weight = 1000,
    },
    ["extras_kit"] = {
        label = "Extras Kit",
        weight = 1000,
    },
    -- Nitrous & Cleaning Items
    ["nitrous_bottle"] = {
        label = "Nitrous Bottle",
        weight = 1000,
        client = {
            event = "jg-mechanic:client:use-nitrous-bottle",
        }
    },
    ["empty_nitrous_bottle"] = {
        label = "Empty Nitrous Bottle",
        weight = 1000,
    },
    ["nitrous_install_kit"] = {
        label = "Nitrous Install Kit",
        weight = 1000,
    },
    ["cleaning_kit"] = {
        label = "Cleaning Kit",
        weight = 1000,
        client = {
            event = "jg-mechanic:client:clean-vehicle",
        }
    },
    ["repair_kit"] = {
        label = "Repair Kit",
        weight = 1000,
    },
    ["duct_tape"] = {
        label = "Duct Tape",
        weight = 1000,
        client = {
            event = "jg-mechanic:client:use-duct-tape",
        }
    },
    -- Performance Item
    ["performance_part"] = {
        label = "Performance Parts",
        weight = 1000,
    },
    -- Mechanic Tablet Item
    ["mechanic_tablet"] = {
        label = "Mechanic Tablet",
        weight = 1000,
        client = {
            event = "jg-mechanic:client:use-tablet",
        }
    },
    -- Gearbox
    ["manual_gearbox"] = {
        label = "Manual Gearbox",
        weight = 1000,
    },    
    ["mech_toolkit"] = {
        label = "Harness Remover",
        weight = 1000,
        stack = false,
        close = true,
    },    

    ['race_harness'] = {
        label = 'Harness',
        weight = 500,
        stack = false,
        close = true,
        client = { event = 'qbx_harness:client:useHarness'}    
    },

    -- Gangs --

    ["head_bag"] = {
        label = "Headbag",
        weight = 100,
        stack = true,
        close = true,
        client = {
            image = "head_bag.png",
        }
    },

    -- Police --
    
    ["drone_lspd"] = {
        label = "PD Drone",
        weight = 1500,
        stack = false,
        close = true,
        description = "A PD Issue drone with special features",
        client = {
            image = "drone_lspd.png",
        }
    },

    ["grappler"] = {
        label = "Grappler",
        weight = 1500,
        stack = false,
        close = true,
        description = "A grappler for PD vehicles",
        client = {
            event = 'Client:installGrappler',
            image = "grappler.png",
        }
    },
    

    -- Civ Items --
    
    ["binoculars"] = {
        label = "Binoculars",
        weight = 600,
        stack = true,
        close = true,
        description = "Sneaky Breaky...",
        client = {
            image = "binoculars.png",
        }
    },
    
    ["phone"] = {
        label = "Phone",
        weight = 1000,
        stack = false,
        close = false,
        description = "You got games on your phone?",
    },

    ["phone_black"] = {
        label = "Phone",
        weight = 1000,
        stack = false,
        close = false,
        description = "You got games on your phone?",
    },

    ["phone_blue"] = {
        label = "Phone",
        weight = 1000,
        stack = false,
        close = false,
        description = "You got games on your phone?",
    },

    ["phone_grey"] = {
        label = "Phone",
        weight = 1000,
        stack = false,
        close = false,
        description = "You got games on your phone?",
    },

    ["phone_lime"] = {
        label = "Phone",
        weight = 1000,
        stack = false,
        close = false,
        description = "You got games on your phone?",
    },

    ["phone_orange"] = {
        label = "Phone",
        weight = 1000,
        stack = false,
        close = false,
        description = "You got games on your phone?",
    },

    ["phone_pink"] = {
        label = "Phone",
        weight = 1000,
        stack = false,
        close = false,
        description = "You got games on your phone?",
    },

    ["phone_red"] = {
        label = "Phone",
        weight = 1000,
        stack = false,
        close = false,
        description = "You got games on your phone?",
    },

    ["phone_white"] = {
        label = "Phone",
        weight = 1000,
        stack = false,
        close = false,
        description = "You got games on your phone?",
    },

    ["phone_yellow"] = {
        label = "Phone",
        weight = 1000,
        stack = false,
        close = false,
        description = "You got games on your phone?",
    },

    ["heavyarmor"] = {
        label = "Heavy Armor",
        weight = 3000,
        stack = true,
        close = true,
        allowArmed = true,
        description = "Some protection won't hurt... right?",
        client = {
            image = "heavy_armor.png",
        }
    },

    ["kevlar"] = {
        label = "Kevlar",
        weight = 500,
        stack = true,
        close = true,
        allowArmed = true,
        description = "Minimal body protection",
    },

    -- GUN PARTS --

    ["pistolparts"] = {
        label = "Pistol Parts",
        weight = 100,
        stack = true,
        close = true,
        description = "Parts used to make weapons",
    },

    ["smgbody"] = {
        label = "SMG Body",
        weight = 500,
        stack = true,
        close = true,
        description = "Part used to make SMGs",
    },

    ["smggrip"] = {
        label = "SMG Grip",
        weight = 500,
        stack = true,
        close = true,
        description = "Part used to make SMGs",
    },

    ["smgbarrel"] = {
        label = "SMG Barrel",
        weight = 500,
        stack = true,
        close = true,
        description = "Part used to make SMGs",
    },

    ["smgblueprint"] = {
        label = "SMG Blueprint",
        weight = 500,
        stack = true,
        close = true,
        description = "The foundation for SMG crafting",
    },

    ["riflebody"] = {
        label = "Rifle Body",
        weight = 500,
        stack = true,
        close = true,
        description = "Part used to make an assault rifle",
    },

    ["riflebarrel"] = {
        label = "Rifle Barrel",
        weight = 500,
        stack = true,
        close = true,
        description = "Part used to make an assault rifle",
    },

    ["riflegrip"] = {
        label = "Rifle Grip",
        weight = 500,
        stack = true,
        close = true,
        description = "Part used to make an assault rifle",
    },

    ["riflemagazine"] = {
        label = "Rifle Magazine",
        weight = 500,
        stack = true,
        close = true,
        description = "Part used to make an assault rifle",
    },

    ["riflestock"] = {
        label = "Rifle Stock",
        weight = 500,
        stack = true,
        close = true,
        description = "Part used to make an assault rifle",
    },

    ["rifleblueprint"] = {
        label = "Rifle Blueprint",
        weight = 500,
        stack = true,
        close = true,
        description = "The foundation for assault rifle crafting",
    },

    ["shotgunbody"] = {
        label = "Shotgun Body",
        weight = 500,
        stack = true,
        close = true,
        description = "Part used to make a shotgun",
    },

    ["shotgunbarrel"] = {
        label = "Shotgun Barrel",
        weight = 500,
        stack = true,
        close = true,
        description = "Part used to make a shotgun",
    },

    ["shotgunblueprint"] = {
        label = "Shotgun Blueprint",
        weight = 500,
        stack = true,
        close = true,
        description = "The foundation for shotgun crafting",
    },
        
    ["breathalyzer"] = {
        label = "Breathalyzer",
        weight = 1000,
        stack = true,
        close = true,
        description = "A vintage 2000's WiWang breathalyzer engraved Property of LSPD",
        client = {
            image = "breathalyzer.png",
        }
    },
    
    ["drone"] = {
        label = "Drone",
        weight = 1500,
        stack = false,
        close = true,
        description = "A regular drone",
        client = {
            image = "drone.png",
        }
    },
       
    ["laptop"] = {
        label = "Laptop",
        weight = 1000,
        stack = true,
        close = true,
        description = "Expensive laptop",
        client = {
            image = "laptop.png",
        }
    },
       
    ["lockpick"] = {
        label = "Lockpick",
        weight = 500,
        stack = true,
        close = true,
        description = "Very useful if you lose your keys a lot.. or if you want to use it for something else...",
        client = {
            image = "lockpick.png",
            event = 'lockpick:use'
        }
    },

	["fakeplate"] = {
        label = "Fake Plate",
        weight = 1000,
        stack = true,
        close = true,
    },

	["bank_card"] = {
        label = "Bank Card",
        weight = 1000,
        stack = false,
        close = true,
    },

    ["afaks"] = {
        label = "afaks",
        weight = 250,
        stack = true,
        close = true,
        allowArmed = true,
        description = "afaks are for healing.",
        client = {
            image = "afaks.png",
        }
    },
          
    ['breath_alcohol_tester'] = {
        label = 'breath_alcohol_tester',
        weight = 250,
        close = true,
        client = {},
        server = {
            export = 'rcore_drunk.breath_alcohol_tester',
        },
    },
   
    ["ifaks"] = {
        label = "ifaks",
        weight = 200,
        stack = true,
        close = true,
        allowArmed = true,
        description = "ifaks are for healing.",
        client = {
            image = "ifaks.png",
        }
    },
            
    ["policegunrack"] = {
        label = "Police Gun Rack",
        weight = 15000,
        stack = true,
        close = true,
        description = "Gun rack for police vehicles",
        client = {
            image = "policegunrack.png",
        }
    },
        
    ["firework1"] = {
        label = "2Brothers",
        weight = 1000,
        stack = true,
        close = true,
        description = "Fireworks",
        client = {
            image = "firework1.png",
        }
    },
        
    ["wetbills"] = {
        label = "Wet Bills",
        weight = 1500,
        stack = false,
        close = true,
        description = "Money?",
        client = {
            image = "wetbills.png",
        }
    },
    
    ["armor"] = {
        label = "Armor",
        weight = 1000,
        stack = true,
        close = true,
        allowArmed = true,
        description = "Some protection won't hurt... right?",
        client = {
            image = "armor.png",
        }
    },
    
    ["fitbit"] = {
        label = "Fitbit",
        weight = 1000,
        stack = false,
        close = true,
        description = "I like fitbit",
        client = {
            image = "fitbit.png",
        }
    },

    -- CRYPTO
    
    ["cryptostick"] = {
        label = "Crypto Stick",
        weight = 500,
        stack = true,
        close = true,
        degrade = 20160,
        decay = true,
        client = {
            image = "cryptostick.png",
        }
    },

    ["cryptoharddrive"] = {
        label = "Crypto Hard Drive",
        weight = 2500,
        stack = true,
        close = true,
        degrade = 20160,
        decay = true,
        description = "Looks like a extra large cryptostick..?",
        client = {
            image = "cryptoharddrive.png",
        }
    },
   
    ["markedbills"] = {
        label = "Marked Money",
        weight = 1500,
        stack = false,
        close = true,
        description = "Money?",
        client = {
            image = "markedbills.png",
        }
    },      
    
    ["parachute"] = {
        label = "Parachute",
        weight = 10000,
        stack = false,
        close = true,
        consume = 1,
        description = "The sky is the limit! Woohoo!",
        client = {
            image = "parachute.png",
        }
    },
    
    ["radio"] = {
        label = "Radio",
        weight = 2000,
        stack = false,
        close = true,
        description = "You can communicate with this through a signal",
        client = {
            image = "radio.png",
        }
    },
    
    
    ["bag"] = {
        label = "Bag",
        weight = 1000,
        stack = true,
        close = true,
        description = "A Bag",
        client = {
            image = "bag.png",
        }
    },
    
    ["advancedlockpick"] = {
        label = "Advanced Lockpick",
        weight = 500,
        stack = true,
        close = true,
        description = "If you lose your keys a lot this is very useful... Also useful to open your beers",
        client = {
            image = "advancedlockpick.png",
            event = 'lockpick:use'
        }
    },
            
    ["accesstool"] = {
        label = "Access Tool",
        weight = 1000,
        stack = true,
        close = true,
        description = "Snap into an access tool.",
        client = {
            image = "accesstool.png",
        }
    },
    
    ["painkillers"] = {
        label = "Painkillers",
        weight = 100,
        stack = true,
        close = true,
        description = "For pain you can't stand anymore, take this pill that'd make you feel great again",
        client = {
            image = "painkillers.png",
        }
    },
    
    ["boostingtablet"] = {
        label = "Boosting tablet",
        weight = 1000,
        stack = false,
        close = true,
        description = "Seems like something's installed on this.",
        client = {
            image = "boostingtablet.png",
        }
    },
    
    ["emptybaggy"] = {
        label = "Resealable Bag",
        weight = 100,
        stack = true,
        close = true,
        description = "A small empty bag",
        client = {
            image = "emptybaggy.png",
        }
    },

    ["plasticwrap"] = {
        label = "Plastic Wrap",
        weight = 100,
        stack = true,
        close = true,
        description = "Plastic Wrap",
        client = {
            image = "plasticwrap.png",
        }
    },

    -- PRINTERS
    
    ["printerdocument"] = {
        label = "Document",
        weight = 10,
        stack = false,
        close = true,
        description = "A printed document",
        client = {
            image = "printerdocument.png",
            export = "xt-printers.printerdocument"
        }
    },

    ["printer"] = {
        label = "Printer",
        weight = 1000,
        stack = true,
        close = false,
        description = "Machine used to print documents",
        client = {
            image = "printer.png",
            event = 'xt-printers:client:openMenu'
        }
    },

    ["printerink"] = {
        label = "Ink Cartridge",
        weight = 200,
        stack = true,
        close = false,
        description = "Ink for printing",
            client = {
            image = "printerink.png",
        }
    },

    ["printerpaper"] = {
        label = "Blank Printer Paper",
        weight = 10,
        stack = true,
        close = false,
        description = "Blank paper for printing",
            client = {
            image = "printerpaper.png",
        }
    },
        
    ["oxy"] = {
        label = "Prescription Oxy",
        weight = 100,
        stack = true,
        close = true,
        allowArmed = true,
        description = "The Label Has Been Ripped Off",
        client = {
            image = "oxy.png",
        }
    },
        
    ["drugtestkit"] = {
        label = "Drug Test Kit",
        weight = 1000,
        stack = true,
        close = true,
        description = "A multipanel field test kit used to test for popular drugs in a suspects saliva, it's probably accurate.",
        client = {
            image = "drugtestkit.png",
        }
    },
        
    ["dnatestkit"] = {
        label = "DNA Field Swab Kit",
        weight = 200,
        stack = true,
        close = true,
        description = "A field DNA swab kit containing several vials and swabs",
        client = {
            image = "dnatestkit.png",
        }
    },
    
    ["diving_gear"] = {
        label = "Diving Gear",
        weight = 20000,
        stack = false,
        close = true,
        description = "An oxygen tank and a rebreather",
        durability = 100,
        client = {
            image = "diving_gear.png",
        }
    },
    
    ["gunpowder"] = {
        label = "Gunpowder",
        weight = 250,
        stack = true,
        close = true,
        description = "A key ingredient for explosives and ammo",
        client = {
            image = "gunpowder.png",
        }
    },
    
    ["bodycam"] = {
        label = "Body Cam",
        weight = 250,
        stack = false,
        close = true,
        description = "A bodycam.",
        client = {
            image = "bodycam.png",
        }
    },
        
    ["offportspack"] = {
        label = "Offport Pack",
        weight = 4000,
        stack = true,
        close = true,
        description = "Pack of offport cigarettes. Use to aquire 20 cigarettes.",
        client = {
            image = "offportspack.png",
        }
    },
    
    ["offportcigarette"] = {
        label = "Offport Cigarette",
        weight = 100,
        stack = true,
        close = true,
        description = "Offport cigarette",
        client = {
            image = "offportcigarette.png",
        }
    },
    
    ["wire_cutter"] = {
        label = "Wire Cutters",
        weight = 1000,
        stack = true,
        close = true,
        client = {
            image = "wire_cutter.png",
        }
    },

    ["screwdriver"] = {
        label = "Screwdriver",
        weight = 1000,
        stack = true,
        close = true,
        client = {
        image = "screwdriver.png",
        }
    },

    ["postagestamp"] = {
        label = "Postage Stamp",
        weight = 100,
        stack = true,
        close = true,
        client = {
            image = "postagestamp.png",
        }
    },
    
    ["cutters"] = {
        label = "Snips",
        weight = 1000,
        stack = false,
        close = true,
        client = {
            image = "cutters.png",
            export = 'Grappler.removeGrapplerWithCutter'
        }
    },
   
    ["empty_evidence_bag"] = {
        label = "Empty Evidence Bag",
        weight = 0,
        stack = true,
        close = false,
        description = "Used a lot to keep DNA from blood, bullet shells and more",
        client = {
            image = "evidence.png",
        }
    },
    
    ["blank_usb"] = {
        label = "Blank USB",
        weight = 1000,
        stack = true,
        close = true,
        description = "Empty USB.",
        client = {
            image = "blank_usb.png",
        }
    },
    
    ["kq_outfitbag"] = {
        label = "Outfit bag",
        weight = 4000,
        stack = true,
        close = true,
        description = "Holds different outfits",
        client = {
            image = "kq_outfitbag.png",
        }
    },

    ["kq_airdrop_flare"] = {
        label = "Air Drop Flare",
        weight = 500,
        stack = true,
        close = true,
        description = "Flare which calls upon an airdrop",
        client = {
            image = "kq_airdrop_flare.png",
        }
    },
    
    ["filled_evidence_bag"] = {
        label = "Evidence Bag",
        weight = 100,
        stack = false,
        close = false,
        description = "A filled evidence bag to see who committed the crime >:(",
        client = {
            image = "evidence.png",
        }
    },
    
    ["billingtablet"] = {
        label = "Billing Tablet",
        weight = 1000,
        stack = true,
        close = true,
        description = "Every business needs to bill their customers",
        client = {
            image = "billingtablet.png",
        }
    },
    
    ["dealertablet"] = {
        label = "Dealer Tablet",
        weight = 1000,
        stack = true,
        close = true,
        client = {
            image = "billingtablet.png",
            event = 'jg-dealerships:client:useDealerTablet'
        }
    },

    ["fingerprintreader"] = {
        label = "Pro Tech XFR8001",
        weight = 1000,
        stack = false,
        close = true,
        description = "A Pro Tech mobile fingerprint reader that looks like it's seen better days, currently stuck in french.",
        client = {
            image = "fingerprintreader.png",
        }
    },
    
    ["gsrtestkit"] = {
        label = "GSR Field Test Kit",
        weight = 1000,
        stack = true,
        close = true,
        description = "A field GSR test kit containing several test strips",
        client = {
            image = "gsrtestkit.png",
        }
    },
    
    ["tablet"] = {
        label = "Tablet",
        weight = 2000,
        stack = true,
        close = true,
        description = "Expensive tablet",
        client = {
            image = "tablet.png",
        }
    },   
    
    ["contract"] = {
        label = "Contract",
        weight = 500,
        stack = true,
        close = true,
        description = "A contract",
        client = {
            image = "contract.png",
        }
    },
    
    ["fingerprinttape"] = {
        label = "Fingerprint Tape",
        weight = 1000,
        stack = false,
        close = true,
        description = "Extra clear tape used to lift fingerprints from smooth, nonporous surfaces",
        client = {
            image = "fingerprinttape.png",
        }
    },
        
    ["diving_fill"] = {
        label = "Diving Tube",
        weight = 1500,
        stack = false,
        close = true,
        description = "An oxygen tube and a rebreather",
        durability = 100,
        client = {
            image = "diving_fill.png",
        }
    },
        
    ["nekon"] = {
        label = "Camera",
        weight = 1000,
        stack = false,
        close = true,
        description = "Caught in 4K",
        client = {
            image = "nekon.png",
        }
    },
    
    ["bandage"] = {
        label = "Bandage",
        weight = 100,
        stack = true,
        close = true,
        allowArmed = true,
        description = "A bandage works every time",
        client = {
            image = "bandage.png",
        }
    },
        
    ["chemicals"] = {
        label = "Chemicals",
        weight = 500,
        stack = true,
        close = false,
        description = "Chemicals, handle with care...",
        client = {
            image = "chemicals.png",
        }
    },
    
    
    ["rentalpapers"] = {
        label = "Rental Papers",
        weight = 1000,
        stack = false,
        close = false,
        description = "Yea, this is my car i can prove it!",
        client = {
            image = "rentalpapers.png",
        }
    },
    
    ["fingerprintkit"] = {
        label = "Fingerprint Kit",
        weight = 1000,
        stack = false,
        close = true,
        description = "A small kit that includes fingerprint dust, chemicals, and a brush for developing fingerprints",
        client = {
            image = "fingerprintkit.png",
        }
    },   
    
    ["lighter"] = {
        label = "Lighter",
        weight = 250,
        stack = true,
        close = true,
        description = "On new years eve a nice fire to stand next to",
        client = {
            image = "lighter.png",
        }
    },
    
    ["firework4"] = {
        label = "Weeping Willow",
        weight = 1000,
        stack = true,
        close = true,
        description = "Fireworks",
        client = {
            image = "firework4.png",
        }
    },
    
    ["firework3"] = {
        label = "WipeOut",
        weight = 1000,
        stack = true,
        close = true,
        description = "Fireworks",
        client = {
            image = "firework3.png",
        }
    },   
    
    ["firework2"] = {
        label = "Poppelers",
        weight = 1000,
        stack = true,
        close = true,
        description = "Fireworks",
        client = {
            image = "firework2.png",
        }
    },
    
    ["handcuffs"] = {
        label = "Handcuffs",
        weight = 1000,
        stack = false,
        close = true,
        description = "Comes in handy when people misbehave. Maybe it can be used for something else?",
        client = {
            image = "handcuffs.png",
        }
    },

    ["fuzzyhandcuffs"] = {
        label = "Fuzzy Handcuffs",
        weight = 1000,
        stack = false,
        close = true,
        description = "Comes in handy when people misbehave. Maybe it can be used for something else?",
        client = {
            image = "fuzzyhandcuffs.png",
        }
    },
    
    ["spikespack"] = {
        label = "Spike Strip",
        weight = 1500,
        stack = false,
        close = true,
        description = "A set of PD Spikes",
        client = {
            image = "spikespack.png",
        }
    },

    ["spikesbox"] = {
        label = "Spike Strip Box",
        weight = 2000,
        stack = false
    },

    ["spikebox_pilot"] = {
        label = "Spike Strip Remote",
        weight = 200,
        stack = false
    },

    ["placeable_gps"] = {
        label = "GPS Tracker",
        weight = 100,
        stack = false
    },

    ["shootable_gps"] = {
        label = "GPS Tracker (Shootable)",
        weight = 50,
        stack = true,
    },    

    ["blank_card"] = {
        label = "Blank Card",
        weight = 1000,
        stack = true,
        close = true,
        description = "Empty Card.",
        client = {
            image = "blank_card.png",
        }
    },   
    
    ["cryptotablet"] = {
        label = "Crypto Tablet",
        weight = 1000,
        stack = true,
        close = true,
        description = "Crypto Tablet",
        client = {
            image = "cryptotablet.png",
        }
    },
        
    ["driving_test_permit"] = {
        label = "Driving Test Permit",
        weight = 1000,
        stack = false,
        close = true,
        description = "Permit for Driving Test",
        client = {
            image = "driving_test_permit.png",
        }
    },
        
    ["police_stormram"] = {
        label = "Stormram",
        weight = 10000,
        stack = true,
        close = true,
        description = "A nice tool to break into doors",
        client = {
            image = "police_stormram.png",
        }
    },

    ["radioscanner"] = {
        label = "Police Radio Scanner",
        weight = 1000,
        stack = false,
        description = "Picks up the occaisional dispatch call.",
    },

    -- Bait
    ["bread"] = {
        label = "Bread",
        weight = 10,
        stack = true, -- assuming 'unique' is false means it should be stackable
        close = true,
        description = "Bread",
        client = {
            image = "bread.png",
        }
    },
    
    ["earthworm"] = {
        label = "Earthworm",
        weight = 10,
        stack = true,
        close = true,
        description = "Earthworm",
        client = {
            image = "earthworm.png",
        }
    },
    
    ["dough"] = {
        label = "Dough",
        weight = 10,
        stack = true,
        close = true,
        description = "Dough",
        client = {
            image = "dough.png",
        }
    },
    
    ["grub"] = {
        label = "Grub",
        weight = 10,
        stack = true,
        close = true,
        description = "Grub",
        client = {
            image = "grub.png",
        }
    },
    
    ["caddis_fly"] = {
        label = "Caddis Fly",
        weight = 10,
        stack = true,
        close = true,
        description = "Caddis Fly",
        client = {
            image = "caddis_fly.png",
        }
    },
    
    ["fly"] = {
        label = "Fly",
        weight = 10,
        stack = true,
        close = true,
        description = "Fly",
        client = {
            image = "fly.png",
        }
    },
 
    ["dragonfly"] = {
        label = "Dragonfly",
        weight = 10,
        stack = true,
        close = true,
        description = "Dragonfly",
        client = {
            image = "dragonfly.png",
        }
    },
    
    ["grasshoper"] = {
        label = "Grasshoper",
        weight = 10,
        stack = true,
        close = true,
        description = "Grasshoper",
        client = {
            image = "grasshoper.png",
        }
    },
    
    ["shrimp"] = {
        label = "Shrimp",
        weight = 10,
        stack = true,
        close = true,
        description = "Shrimp",
        client = {
            image = "shrimp.png",
        }
    },
    
    ["leech"] = {
        label = "Leech",
        weight = 10,
        stack = true,
        close = true,
        description = "Leech",
        client = {
            image = "leech.png",
        }
    },
    
    ["snail"] = {
        label = "Snail",
        weight = 10,
        stack = true,
        close = true,
        description = "Snail",
        client = {
            image = "snail.png",
        }
    },
    
    ["liver"] = {
        label = "Liver",
        weight = 10,
        stack = true,
        close = true,
        description = "Liver",
        client = {
            image = "liver.png",
        }
    },
    -- Lines
    ["express_fishing_super_line"] = {
        label = "Express Super Line 0.1mm",
        weight = 70,
        stack = true, -- assuming 'unique' is false means it should be stackable
        close = true,
        description = "Express Super Line 0.1mm",
        client = {
            image = "express_fishing_super_line.png",
        }
    },
    
    ["syberia_indiana_green"] = {
        label = "Indiana Green 0.14mm",
        weight = 70,
        stack = true,
        close = true,
        description = "Indiana Green 0.14mm",
        client = {
            image = "syberia_indiana_green.png",
        }
    },
    
    ["syberia_indiana_white"] = {
        label = "Indiana White 0.18mm",
        weight = 70,
        stack = true,
        close = true,
        description = "Indiana White 0.18mm",
        client = {
            image = "syberia_indiana_white.png",
        }
    },
    
    ["simmons_mono_original"] = {
        label = "Simmons Original 0.25mm",
        weight = 70,
        stack = true,
        close = true,
        description = "Simmons Original 0.25mm",
        client = {
            image = "simmons_mono_original.png",
        }
    },
    
    ["simmons_mono_ss"] = {
        label = "Simmons SS 0.28mm",
        weight = 70,
        stack = true,
        close = true,
        description = "Simmons SS 0.28mm",
        client = {
            image = "simmons_mono_ss.png",
        }
    },
    
    ["syberia_indiana_green_2"] = {
        label = "Indiana Green 0.32mm",
        weight = 70,
        stack = true,
        close = true,
        description = "Indiana Green 0.32mm",
        client = {
            image = "syberia_indiana_green_2.png",
        }
    },
    
    ["syberia_indiana_white_2"] = {
        label = "Indiana White 0.36mm",
        weight = 70,
        stack = true,
        close = true,
        description = "Indiana White 0.36mm",
        client = {
            image = "syberia_indiana_white_2.png",
        }
    },
    
    ["snake_power_line_clr"] = {
        label = "Snake Power Line 0.41mm",
        weight = 70,
        stack = true,
        close = true,
        description = "Snake Power Line 0.41mm",
        client = {
            image = "snake_power_line_clr.png",
        }
    },
    
    ["simmons_mono_original_2"] = {
        label = "Simmons Original 0.48mm",
        weight = 70,
        stack = true,
        close = true,
        description = "Simmons Original 0.48mm",
        client = {
            image = "simmons_mono_original_2.png",
        }
    },
    
    ["simmons_mono_ss_2"] = {
        label = "Simmons SS 0.52mm",
        weight = 70,
        stack = true,
        close = true,
        description = "Simmons SS 0.52mm",
        client = {
            image = "simmons_mono_ss_2.png",
        }
    },
    
    ["snake_power_line_clr_2"] = {
        label = "Snake Power Line 0.65mm",
        weight = 70,
        stack = true,
        close = true,
        description = "Snake Power Line 0.65mm",
        client = {
            image = "snake_power_line_clr_2.png",
        }
    },
    
    ["solid_hipower_nylon"] = {
        label = "HiPower Nylon 0.8mm",
        weight = 70,
        stack = true,
        close = true,
        description = "HiPower Nylon 0.8mm",
        client = {
            image = "solid_hipower_nylon.png",
        }
    },
    
    ["solid_hipower_nylon_lime"] = {
        label = "HiPower Nylon L 0.85mm",
        weight = 70,
        stack = true,
        close = true,
        description = "HiPower Nylon L 0.85mm",
        client = {
            image = "solid_hipower_nylon_lime.png",
        }
    },
    
    ["solid_hipower_nylon_orange"] = {
        label = "HiPower Nylon O 0.9mm",
        weight = 70,
        stack = true,
        close = true,
        description = "HiPower Nylon O 0.9mm",
        client = {
            image = "solid_hipower_nylon_orange.png",
        }
    },
    
    ["solid_hipower_nylon_2"] = {
        label = "HiPower Nylon 1.05mm",
        weight = 70,
        stack = true,
        close = true,
        description = "HiPower Nylon 1.05mm",
        client = {
            image = "solid_hipower_nylon_2.png",
        }
    },
    
    ["solid_hipower_nylon_lime_2"] = {
        label = "HiPower Nylon L 1.15mm",
        weight = 70,
        stack = true,
        close = true,
        description = "HiPower Nylon L 1.15mm",
        client = {
            image = "solid_hipower_nylon_lime_2.png",
        }
    },
    
    ["solid_hipower_nylon_orange_2"] = {
        label = "HiPower Nylon O 1.25mm",
        weight = 70,
        stack = true,
        close = true,
        description = "HiPower Nylon O 1.25mm",
        client = {
            image = "solid_hipower_nylon_orange_2.png",
        }
    },
    -- Rods
    ["ufe_telerod_370"] = {
        label = "UFE Telerod 370",
        weight = 150,
        stack = false, -- assuming 'unique' is false means it should be stackable
        close = true,
        description = "UFE Telerod 370",
        client = {
            image = "ufe_telerod_370.png",
        }
    },
    
    ["carptack_feeder_master_250"] = {
        label = "Carptack Feeder Master 250",
        weight = 150,
        stack = false,
        close = true,
        description = "Carptack Feeder Master 250",
        client = {
            image = "carptack_feeder_master_250.png",
        }
    },
    
    ["sakura_tsubarea_tsa_552_xul"] = {
        label = "Sakura Tsubarea TSA 552 XUL",
        weight = 150,
        stack = false,
        close = true,
        description = "Sakura Tsubarea TSA 552 XUL",
        client = {
            image = "sakura_tsubarea_tsa_552_xul.png",
        }
    },
    
    ["carpex_hybid_carp_270"] = {
        label = "Carpex Hybid Carp 270",
        weight = 150,
        stack = false,
        close = true,
        description = "Carpex Hybid Carp 270",
        client = {
            image = "carpex_hybid_carp_270.png",
        }
    },
    
    ["ufe_float_x5_300"] = {
        label = "UFE Float X5 300",
        weight = 150,
        stack = false,
        close = true,
        description = "UFE Float X5 300",
        client = {
            image = "ufe_float_x5_300.png",
        }
    },
    
    ["predatek_fast_perch_210"] = {
        label = "Predatek Fast Perch 210",
        weight = 150,
        stack = false,
        close = true,
        description = "Predatek Fast Perch 210",
        client = {
            image = "predatek_fast_perch_210.png",
        }
    },
    
    ["sakura_ionizer_bass_insb_701_ml"] = {
        label = "Sakura Ionizer Bass INSB 701",
        weight = 150,
        stack = false,
        close = true,
        description = "Sakura Ionizer Bass INSB 701",
        client = {
            image = "sakura_ionizer_bass_insb_701_ml.png",
        }
    },
    
    ["sakura_redbird_rds_602_l"] = {
        label = "Sakura Redbird RDS 602 L",
        weight = 150,
        stack = false,
        close = true,
        description = "Sakura Redbird RDS 602 L",
        client = {
            image = "sakura_redbird_rds_602_l.png",
        }
    },
    
    ["carpex_cobalt_carp_360"] = {
        label = "Carpex Cobalt Carp 360",
        weight = 150,
        stack = false,
        close = true,
        description = "Carpex Cobalt Carp 360",
        client = {
            image = "carpex_cobalt_carp_360.png",
        }
    },
    
    ["sakura_salt_sniper_salss_611_mj1"] = {
        label = "Sakura Salt Sniper SALSS 611",
        weight = 150,
        stack = false,
        close = true,
        description = "Sakura Salt Sniper SALSS 611",
        client = {
            image = "sakura_salt_sniper_salss_611_mj1.png",
        }
    },
    
    ["sakura_speciz_spes_light_602_zander"] = {
        label = "Sakura Speciz Spes Light 602",
        weight = 150,
        stack = false,
        close = true,
        description = "Sakura Speciz Spes Light 602",
        client = {
            image = "sakura_speciz_spes_light_602_zander.png",
        }
    },
    
    ["sakura_redbird_rds_662"] = {
        label = "Sakura Redbird RDS 662",
        weight = 150,
        stack = false,
        close = true,
        description = "Sakura Redbird RDS 662",
        client = {
            image = "sakura_redbird_rds_662.png",
        }
    },
    
    ["sakura_salt_sniper_salss_902_h"] = {
        label = "Sakura Salt Sniper SALSS 902",
        weight = 150,
        stack = false,
        close = true,
        description = "Sakura Salt Sniper SALSS 902",
        client = {
            image = "sakura_salt_sniper_salss_902_h.png",
        }
    },
    
    ["predatek_seahunter_230"] = {
        label = "Predatek Seahunter 230",
        weight = 150,
        stack = false,
        close = true,
        description = "Predatek Seahunter 230",
        client = {
            image = "predatek_seahunter_230.png",
        }
    },
 
    ["sakura_shukan_shuc_661_lj"] = {
        label = "Sakura Shukan Shuc 661 LJ",
        weight = 150,
        stack = false,
        close = true,
        description = "Sakura Shukan Shuc 661 LJ",
        client = {
            image = "sakura_shukan_shuc_661_lj.png",
        }
    },
    
    ["ufe_powercatch_270"] = {
        label = "UFE Powercatch 270",
        weight = 150,
        stack = false,
        close = true,
        description = "UFE Powercatch 270",
        client = {
            image = "ufe_powercatch_270.png",
        }
    },
    
    ["predatek_pilk_200"] = {
        label = "Predatek Pilk 200",
        weight = 150,
        stack = false,
        close = true,
        description = "Predatek Pilk 200",
        client = {
            image = "predatek_pilk_200.png",
        }
    },
    
    ["robinson_carbonic_nordic_pilk_300"] = {
        label = "Robinson Carbonic Nordic Pilk",
        weight = 150,
        stack = false,
        close = true,
        description = "Robinson Carbonic Nordic Pilk",
        client = {
            image = "robinson_carbonic_nordic_pilk_300.png",
        }
    },
    
    ["carptack_bottom_cast_360"] = {
        label = "Carptack Bottom Cast 360",
        weight = 150,
        stack = false,
        close = true,
        description = "Carptack Bottom Cast 360",
        client = {
            image = "carptack_bottom_cast_360.png",
        }
    },
    
    ["seax_salfighter_170"] = {
        label = "Seax Salfighter 170",
        weight = 150,
        stack = false,
        close = true,
        description = "Seax Salfighter 170",
        client = {
            image = "seax_salfighter_170.png",
        }
    },
    -- Reels
    ["ufe_canta_1000"] = {
        label = "UFE Canta 1000",
        weight = 100,
        stack = false,
        close = true,
        description = "UFE Canta 1000",
        client = {
            image = "ufe_canta_1000.png",
        }
    },
    
    ["ufe_barracuda_2000bt"] = {
        label = "UFE Barracuda 2000BT",
        weight = 100,
        stack = false,
        close = true,
        description = "UFE Barracuda 2000BT",
        client = {
            image = "ufe_barracuda_2000bt.png",
        }
    },
    
    ["sakura_alpax_4508"] = {
        label = "Sakura Alpax 4508",
        weight = 100,
        stack = false,
        close = true,
        description = "Sakura Alpax 4508",
        client = {
            image = "sakura_alpax_4508.png",
        }
    },
    
    ["sakura_alpax_8508"] = {
        label = "Sakura Alpax 8508",
        weight = 100,
        stack = false,
        close = true,
        description = "Sakura Alpax 8508",
        client = {
            image = "sakura_alpax_8508.png",
        }
    },
    
    ["ufe_belona_4000"] = {
        label = "UFE Belona 4000",
        weight = 100,
        stack = false,
        close = true,
        description = "UFE Belona 4000",
        client = {
            image = "ufe_belona_4000.png",
        }
    },
    
    ["ufe_bigspin_8000b"] = {
        label = "UFE Bigspin 8000B",
        weight = 100,
        stack = false,
        close = true,
        description = "UFE Bigspin 8000B",
        client = {
            image = "ufe_bigspin_8000b.png",
        }
    },
    
    ["ufe_batara_8000g"] = {
        label = "UFE Batara 8000G",
        weight = 100,
        stack = false,
        close = true,
        description = "UFE Batara 8000G",
        client = {
            image = "ufe_batara_8000g.png",
        }
    },
    
    ["ufe_batara_1000r"] = {
        label = "UFE Batara 1000R",
        weight = 100,
        stack = false,
        close = true,
        description = "UFE Batara 1000R",
        client = {
            image = "ufe_batara_1000r.png",
        }
    },
    
    ["robinson_big_runner_807qd"] = {
        label = "Robinson Big Runner 807QD",
        weight = 100,
        stack = false,
        close = true,
        description = "Robinson Big Runner 807QD",
        client = {
            image = "robinson_big_runner_807qd.png",
        }
    },
    
    ["spooler_catchpro_4000fd"] = {
        label = "Spooler Catchpro 4000FD",
        weight = 100,
        stack = false,
        close = true,
        description = "Spooler Catchpro 4000FD",
        client = {
            image = "spooler_catchpro_4000fd.png",
        }
    },
    
    ["ufe_opensea_8000_x"] = {
        label = "UFE Opensea 8000-X",
        weight = 100,
        stack = false,
        close = true,
        description = "UFE Opensea 8000-X",
        client = {
            image = "ufe_opensea_8000_x.png",
        }
    },
    
    ["spooler_catchpro_8000fd"] = {
        label = "Spooler Catchpro 8000FD",
        weight = 100,
        stack = false,
        close = true,
        description = "Spooler Catchpro 8000FD",
        client = {
            image = "spooler_catchpro_8000fd.png",
        }
    },
    
    ["spooler_catchpro_14000fd"] = {
        label = "Spooler Catchpro 14000FD",
        weight = 100,
        stack = false,
        close = true,
        description = "Spooler Catchpro 14000FD",
        client = {
            image = "spooler_catchpro_14000fd.png",
        }
    },
    -- Hooks
    ["ufa_bait_hook"] = {
        label = "UFA Bait",
        weight = 40,
        stack = true,
        close = true,
        description = "UFA Bait",
        client = {
            image = "ufa_bait_hook.png",
        }
    },
    
    ["ufa_sproat_hook"] = {
        label = "UFA Sproat",
        weight = 40,
        stack = true,
        close = true,
        description = "UFA Sproat",
        client = {
            image = "ufa_sproat_hook.png",
        }
    },
    
    ["captack_claw_xl_hook"] = {
        label = "Captack Claw XL",
        weight = 40,
        stack = true,
        close = true,
        description = "Captack Claw XL",
        client = {
            image = "captack_claw_xl_hook.png",
        }
    },
    
    ["ufa_sproat_g_hook"] = {
        label = "UFA Sproat-G",
        weight = 40,
        stack = true,
        close = true,
        description = "UFA Sproat-G",
        client = {
            image = "ufa_sproat_g_hook.png",
        }
    },
    
    ["carptack_carp_ss_hook"] = {
        label = "Carptack Carp S&S",
        weight = 40,
        stack = true,
        close = true,
        description = "Carptack Carp S&S",
        client = {
            image = "carptack_carp_ss_hook.png",
        }
    },
    
    ["ufa_wide_gap_bl_hook"] = {
        label = "UFA Wide Gap BL",
        weight = 40,
        stack = true,
        close = true,
        description = "UFA Wide Gap BL",
        client = {
            image = "ufa_wide_gap_bl_hook.png",
        }
    },
    
    ["ufa_aberdeen_hook"] = {
        label = "UFA Aberdeen",
        weight = 40,
        stack = true,
        close = true,
        description = "UFA Aberdeen",
        client = {
            image = "ufa_aberdeen_hook.png",
        }
    },
    
    ["ufa_octopus_bl_hook"] = {
        label = "UFA Octopus BL",
        weight = 40,
        stack = true,
        close = true,
        description = "UFA Octopus BL",
        client = {
            image = "ufa_octopus_bl_hook.png",
        }
    },
    
    ["ufa_livebait_hook"] = {
        label = "UFA Livebait",
        weight = 40,
        stack = true,
        close = true,
        description = "UFA Livebait",
        client = {
            image = "ufa_livebait_hook.png",
        }
    },
    
    ["carptack_micro_barb_hook"] = {
        label = "Carptack Micro Barb",
        weight = 40,
        stack = true,
        close = true,
        description = "Carptack Micro Barb",
        client = {
            image = "carptack_micro_barb_hook.png",
        }
    },
    
    ["carptack_carp_hook"] = {
        label = "Carptack Carp",
        weight = 40,
        stack = true,
        close = true,
        description = "Carptack Carp",
        client = {
            image = "carptack_carp_hook.png",
        }
    },
    
    ["ufa_fusion_bl_hook"] = {
        label = "UFA Fusion BL",
        weight = 40,
        stack = true,
        close = true,
        description = "UFA Fusion BL",
        client = {
            image = "ufa_fusion_bl_hook.png",
        }
    },
    
    ["predatek_octopus_hook"] = {
        label = "Predatek Octopus",
        weight = 40,
        stack = true,
        close = true,
        description = "Predatek Octopus",
        client = {
            image = "predatek_octopus_hook.png",
        }
    },
    
    ["predatek_fusion_hook"] = {
        label = "Predatek Fusion",
        weight = 40,
        stack = true,
        close = true,
        description = "Predatek Fusion",
        client = {
            image = "predatek_fusion_hook.png",
        }
    },
    
    ["alligator_gar"] = {
        label = "Alligator Gar",
        weight = 750,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "An alligator gar fish.",
        client = {
            image = "alligator_gar.png",
        }
    },
    
    ["amur_pike"] = {
        label = "Amur Pike",
        weight = 750,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "An Amur Pike fish.",
        client = {
            image = "amur_pike.png",
        }
    },
    
    ["atlantic_cod"] = {
        label = "Atlantic Cod",
        weight = 300,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "An Atlantic Cod fish.",
        client = {
            image = "atlantic_cod.png",
        }
    },
    
    ["fishing_gear"] = {
        label = "Fishing Gear",
        weight = 30,  -- Dropped a 0 from the weight
        stack = false,  -- Made non-stackable (unique item)
        close = true,  -- Equivalent to shouldClose
        description = "Essential gear for fishing.",
        client = {
            image = "fishing_gear.png",
        }
    },
    
    ["aquarium_pass"] = {
        label = "Aquarium Pass",
        weight = 30,  -- Dropped a 0 from the weight
        stack = false,  -- Made non-stackable
        close = true,  -- Equivalent to shouldClose
        description = "Pass for entry to the aquarium.",
        client = {
            image = "aquarium_pass.png",
        }
    },
    
    ["research_kit"] = {
        label = "Research Kit",
        weight = 30,  -- Dropped a 0 from the weight
        stack = false,  -- Made non-stackable
        close = true,  -- Equivalent to shouldClose
        description = "A kit useful for conducting field research.",
        client = {
            image = "research_kit.png",
        }
    },
    ["special_boots"] = {
        label = "Special Boots",
        weight = 30,  -- Dropped a 0 from the weight
        stack = false,  -- Made non-stackable
        close = true,  -- Equivalent to shouldClose
        description = "Specially designed boots for rugged terrain.",
        client = {
            image = "special_boots.png",
        }
    },
    
    ["museum_ticket"] = {
        label = "Museum Ticket",
        weight = 30,  -- Dropped a 0 from the weight
        stack = false,  -- Made non-stackable
        close = true,  -- Equivalent to shouldClose
        description = "Ticket for entry to the museum.",
        client = {
            image = "museum_ticket.png",
        }
    },
    
    ["atlantic_salmon"] = {
        label = "Atlantic Salmon",
        weight = 500,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "An Atlantic Salmon fish.",
        client = {
            image = "atlantic_salmon.png",
        }
    },
    
    ["barbel"] = {
        label = "Barbel",
        weight = 600,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Barbel fish.",
        client = {
            image = "barbel.png",
        }
    },
    
    ["beluga_sturgeon"] = {
        label = "Beluga Sturgeon",
        weight = 1500,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Beluga Sturgeon fish.",
        client = {
            image = "beluga_sturgeon.png",
        }
    },
    
    ["black_grayling"] = {
        label = "Black Grayling",
        weight = 150,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Black Grayling fish.",
        client = {
            image = "black_grayling.png",
        }
    },
    
    ["blacktip_reef_shark"] = {
        label = "Blacktip Reef Shark",
        weight = 1500,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Blacktip Reef Shark.",
        client = {
            image = "blacktip_reef_shark.png",
        }
    },
    
    ["blue_marlin"] = {
        label = "Blue Marlin",
        weight = 750,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Blue Marlin fish.",
        client = {
            image = "blue_marlin.png",
        }
    },
    
    ["bluefin_tuna"] = {
        label = "Bluefin Tuna",
        weight = 750,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Bluefin Tuna fish.",
        client = {
            image = "bluefin_tuna.png",
        }
    },
    
    ["bluegill"] = {
        label = "Bluegill",
        weight = 120,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Bluegill fish.",
        client = {
            image = "bluegill.png",
        }
    },
    
    ["brook_trout"] = {
        label = "Brook Trout",
        weight = 700,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Brook Trout fish.",
        client = {
            image = "brook_trout.png",
        }
    },
    
    ["brown_trout"] = {
        label = "Brown Trout",
        weight = 230,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Brown Trout fish.",
        client = {
            image = "brown_trout.png",
        }
    },
    
    ["bull_trout"] = {
        label = "Bull Trout",
        weight = 300,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Bull Trout fish.",
        client = {
            image = "bull_trout.png",
        }
    },
    
    ["chub"] = {
        label = "Chub",
        weight = 150,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Chub fish.",
        client = {
            image = "chub.png",
        }
    },
    
    ["chum_salmon"] = {
        label = "Chum Salmon",
        weight = 600,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Chum Salmon fish.",
        client = {
            image = "chum_salmon.png",
        }
    },
    
    ["coho_salmon"] = {
        label = "Coho Salmon",
        weight = 500,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Coho Salmon fish.",
        client = {
            image = "coho_salmon.png",
        }
    },
    
    ["common_bleak"] = {
        label = "Common Bleak",
        weight = 50,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Common Bleak fish.",
        client = {
            image = "common_bleak.png",
        }
    },
    
    ["common_bream"] = {
        label = "Common Bream",
        weight = 400,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Common Bream fish.",
        client = {
            image = "common_bream.png",
        }
    },
    
    ["common_carp"] = {
        label = "Common Carp",
        weight = 700,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Common Carp fish.",
        client = {
            image = "common_carp.png",
        }
    },
    ["crucian_carp"] = {
        label = "Crucian Carp",
        weight = 140,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Crucian Carp fish.",
        client = {
            image = "crucian_carp.png",
        }
    },
    
    ["european_bass"] = {
        label = "European Bass",
        weight = 250,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A European Bass fish.",
        client = {
            image = "european_bass.png",
        }
    },
    
    ["european_eel"] = {
        label = "European Eel",
        weight = 300,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A European Eel fish.",
        client = {
            image = "european_eel.png",
        }
    },
    
    ["european_flounder"] = {
        label = "European Flounder",
        weight = 170,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A European Flounder fish.",
        client = {
            image = "european_flounder.png",
        }
    },
    
    ["european_perch"] = {
        label = "European Perch",
        weight = 500,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A European Perch fish.",
        client = {
            image = "european_perch.png",
        }
    },
    
    ["european_sea_sturgeon"] = {
        label = "European Sea Sturgeon",
        weight = 2000,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A European Sea Sturgeon.",
        client = {
            image = "european_sea_sturgeon.png",
        }
    },
    
    ["electric_eel"] = {
        label = "Electric Eel",
        weight = 1500,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "An Electric Eel.",
        client = {
            image = "electric_eel.png",
        }
    },
    
    ["garfish"] = {
        label = "Garfish",
        weight = 50,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Garfish.",
        client = {
            image = "garfish.png",
        }
    },
    
    ["giant_freshwater_stingray"] = {
        label = "Giant Freshwater Stingray",
        weight = 1500,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Giant Freshwater Stingray.",
        client = {
            image = "giant_freshwater_stingray.png",
        }
    },
    
    ["giant_grouper"] = {
        label = "Giant Grouper",
        weight = 750,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Giant Grouper fish.",
        client = {
            image = "giant_grouper.png",
        }
    },
    
    ["giant_squid"] = {
        label = "Giant Squid",
        weight = 2000,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Giant Squid.",
        client = {
            image = "giant_squid.png",
        }
    },
    
    ["giant_trevally"] = {
        label = "Giant Trevally",
        weight = 200,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Giant Trevally fish.",
        client = {
            image = "giant_trevally.png",
        }
    },
    
    ["golden_trout"] = {
        label = "Golden Trout",
        weight = 750,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Golden Trout fish.",
        client = {
            image = "golden_trout.png",
        }
    },
    
    ["grass_carp"] = {
        label = "Grass Carp",
        weight = 150,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Grass Carp fish.",
        client = {
            image = "grass_carp.png",
        }
    },
    
    ["grass_pickerel"] = {
        label = "Grass Pickerel",
        weight = 90,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Grass Pickerel fish.",
        client = {
            image = "grass_pickerel.png",
        }
    },
    
    ["grayling"] = {
        label = "Grayling",
        weight = 80,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Grayling fish.",
        client = {
            image = "grayling.png",
        }
    },
    
    ["great_barracuda"] = {
        label = "Great Barracuda",
        weight = 900,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Great Barracuda fish.",
        client = {
            image = "great_barracuda.png",
        }
    },
    
    ["grey_snapper"] = {
        label = "Grey Snapper",
        weight = 400,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Grey Snapper fish.",
        client = {
            image = "grey_snapper.png",
        }
    },
    
    ["huchen"] = {
        label = "Huchen",
        weight = 1500,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Huchen fish.",
        client = {
            image = "huchen.png",
        }
    },
    
    ["ide"] = {
        label = "Ide",
        weight = 100,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "An Ide fish.",
        client = {
            image = "ide.png",
        }
    },
    
    ["indian_threadfish"] = {
        label = "Indian Threadfish",
        weight = 250,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "An Indian Threadfish.",
        client = {
            image = "indian_threadfish.png",
        }
    },
    
    ["lake_sturgeon"] = {
        label = "Lake Sturgeon",
        weight = 1600,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Lake Sturgeon fish.",
        client = {
            image = "lake_sturgeon.png",
        }
    },
    
    ["largemouth_bass"] = {
        label = "Largemouth Bass",
        weight = 300,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Largemouth Bass fish.",
        client = {
            image = "largemouth_bass.png",
        }
    },
    
    ["mahi_mahi"] = {
        label = "Mahi-Mahi",
        weight = 1000,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Mahi-Mahi fish.",
        client = {
            image = "mahi_mahi.png",
        }
    },
    
    ["malabar_grouper"] = {
        label = "Malabar Grouper",
        weight = 1500,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Malabar Grouper fish.",
        client = {
            image = "malabar_grouper.png",
        }
    },
    
    ["mirror_carp"] = {
        label = "Mirror Carp",
        weight = 700,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Mirror Carp fish.",
        client = {
            image = "mirror_carp.png",
        }
    },
    
    ["northern_pike"] = {
        label = "Northern Pike",
        weight = 500,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Northern Pike fish.",
        client = {
            image = "northern_pike.png",
        }
    },
    
    ["pink_river_dolphin"] = {
        label = "Pink River Dolphin",
        weight = 1550,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Pink River Dolphin.",
        client = {
            image = "pink_river_dolphin.png",
        }
    },
    
    ["pink_salmon"] = {
        label = "Pink Salmon",
        weight = 200,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Pink Salmon fish.",
        client = {
            image = "pink_salmon.png",
        }
    },
    
    ["prussian_carp"] = {
        label = "Prussian Carp",
        weight = 90,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Prussian Carp fish.",
        client = {
            image = "prussian_carp.png",
        }
    },
    
    ["pufferfish"] = {
        label = "Pufferfish",
        weight = 750,  -- Dropped a 0 from the weight
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Pufferfish.",
        client = {
            image = "pufferfish.png",
        }
    },
    
    ["pumpkinseed"] = {
        label = "Pumpkinseed",
        weight = 50,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Pumpkinseed fish.",
        client = {
            image = "pumpkinseed.png",
        }
    },
    
    ["rainbow_trout"] = {
        label = "Rainbow Trout",
        weight = 150,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Rainbow Trout fish.",
        client = {
            image = "rainbow_trout.png",
        }
    },
    
    ["red_lionfish"] = {
        label = "Red Lionfish",
        weight = 300,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Red Lionfish.",
        client = {
            image = "red_lionfish.png",
        }
    },
    
    ["redeye_piranha"] = {
        label = "Redeye Piranha",
        weight = 150,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Redeye Piranha.",
        client = {
            image = "redeye_piranha.png",
        }
    },
    
    ["redfin_pickerel"] = {
        label = "Redfin Pickerel",
        weight = 150,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Redfin Pickerel fish.",
        client = {
            image = "redfin_pickerel.png",
        }
    },
    
    ["roach"] = {
        label = "Roach",
        weight = 50,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Roach fish.",
        client = {
            image = "roach.png",
        }
    },
    
    ["sea_trout"] = {
        label = "Sea Trout",
        weight = 200,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Sea Trout fish.",
        client = {
            image = "sea_trout.png",
        }
    },
    
    ["silver_carp"] = {
        label = "Silver Carp",
        weight = 1000,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Silver Carp fish.",
        client = {
            image = "silver_carp.png",
        }
    },
    
    ["skeleton"] = {
        label = "Skeleton",
        weight = 10,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Skeleton.",
        client = {
            image = "skeleton.png",
        }
    },
    
    ["smallmouth_bass"] = {
        label = "Smallmouth Bass",
        weight = 150,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Smallmouth Bass fish.",
        client = {
            image = "smallmouth_bass.png",
        }
    },
    
    ["sockeye_salmon"] = {
        label = "Sockeye Salmon",
        weight = 300,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Sockeye Salmon fish.",
        client = {
            image = "sockeye_salmon.png",
        }
    },
    
    ["south_sea_pearl_oyster"] = {
        label = "South Sea Pearl Oyster",
        weight = 1500,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A South Sea Pearl Oyster.",
        client = {
            image = "south_sea_pearl_oyster.png",
        }
    },
    
    ["tench"] = {
        label = "Tench",
        weight = 250,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Tench fish.",
        client = {
            image = "tench.png",
        }
    },
    
    ["tiger_shark"] = {
        label = "Tiger Shark",
        weight = 5500,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Tiger Shark.",
        client = {
            image = "tiger_shark.png",
        }
    },
    
    ["wels_catfish"] = {
        label = "Wels Catfish",
        weight = 400,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Wels Catfish fish.",
        client = {
            image = "wels_catfish.png",
        }
    },
    
    ["white_sturgeon"] = {
        label = "White Sturgeon",
        weight = 800,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A White Sturgeon fish.",
        client = {
            image = "white_sturgeon.png",
        }
    },
    
    ["yellow_perch"] = {
        label = "Yellow Perch",
        weight = 40,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Yellow Perch fish.",
        client = {
            image = "yellow_perch.png",
        }
    },
    
    ["yellowfin_tuna"] = {
        label = "Yellowfin Tuna",
        weight = 900,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Yellowfin Tuna fish.",
        client = {
            image = "yellowfin_tuna.png",
        }
    },
    
    ["yellowtail_barracuda"] = {
        label = "Yellowtail Barracuda",
        weight = 150,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Yellowtail Barracuda.",
        client = {
            image = "yellowtail_barracuda.png",
        }
    },
    
    ["zander"] = {
        label = "Zander",
        weight = 200,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A Zander fish.",
        client = {
            image = "zander.png",
        }
    },
    
    ["paddlefish"] = {
        label = "Paddle Fish",
        weight = 1000,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A rare and illegal Paddle Fish.",
        client = {
            image = "paddlefish.png",
        }
    },
    
    ["sawfish"] = {
        label = "Saw Fish",
        weight = 1000,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A rare and illegal Saw Fish.",
        client = {
            image = "sawfish.png",
        }
    },
    
    ["eel"] = {
        label = "Eel",
        weight = 1000,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A rare and illegal Eel.",
        client = {
            image = "eel.png",
        }
    },
    
    ["hammerheadshark"] = {
        label = "Hammer Head Shark",
        weight = 2500,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A rare and illegal Hammer Head Shark.",
        client = {
            image = "hammerheadshark.png",
        }
    },
    
    ["seaturtle"] = {
        label = "Sea Turtle",
        weight = 2500,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A rare and illegal Sea Turtle.",
        client = {
            image = "seaturtle.png",
        }
    },
    
    ["leopardshark"] = {
        label = "Leopard Shark",
        weight = 2500,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A rare and illegal Leopard Shark.",
        client = {
            image = "leopardshark.png",
        }
    },
    
    ["blueshark"] = {
        label = "Blue Shark",
        weight = 4000,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A legendary and illegal Blue Shark.",
        client = {
            image = "blueshark.png",
        }
    },
    
    ["greatwhiteshark"] = {
        label = "Great White Shark",
        weight = 10000,  -- Converted weight to OxInventory format
        stack = true,  -- Made stackable
        close = true,  -- Equivalent to shouldClose
        description = "A mythic and illegal Great White Shark.",
        client = {
            image = "greatwhiteshark.png",
        }
    },
    
    -- Fishing Script Diving Items
    ["ancient_artifact"] = {
        label = "Ancient Artifact",
        weight = 1000,  
        stack = true,  
        close = true,  
        description = "An Ancient Artifact!",
        client = {
            image = "ancient_artifact.png",
        }
    },
    ["antique_compass"] = {
        label = "Antique Compass",
        weight = 1000,  
        stack = true,  
        close = true,  
        description = "An Antique Compass.",
        client = {
            image = "antique_compass.png",
        }
    },
    ["enchanted_jewel"] = {
        label = "Enchanted Jewel",
        weight = 1000,  
        stack = true,  
        close = true,  
        description = "An Enchanted Jewel.",
        client = {
            image = "enchanted_jewel.png",
        }
    },
    ["luxury_watch"] = {
        label = "Luxury Watch",
        weight = 1000,  
        stack = true,  
        close = true,  
        description = "An Expensive Watch.",
        client = {
            image = "luxury_watch.png",
        }
    },
    ["meteorite_ore"] = {
        label = "Meteorite Ore",
        weight = 1000,  
        stack = true,  
        close = true,  
        description = "Meteorite Ore.",
        client = {
            image = "meteorite_ore.png",
        }
    },
    ["mystic_crystal"] = {
        label = "Mystic Crystal",
        weight = 1000,  
        stack = true,  
        close = true,  
        description = "A Mystic Crystal.",
        client = {
            image = "mystic_crystal.png",
        }
    },
    ["phantom_amulet"] = {
        label = "Phantom Amulet",
        weight = 1000,  
        stack = true,  
        close = true,  
        description = "A Phantom Amulet.",
        client = {
            image = "phantom_amulet.png",
        }
    },
    ["precious_pearls"] = {
        label = "Precious Pearls",
        weight = 1000,  
        stack = true,  
        close = true,  
        description = "Handfull of Precious Pearls.",
        client = {
            image = "precious_pearls.png",
        }
    },
    ["rare_spices"] = {
        label = "Rare Spices",
        weight = 1000,  
        stack = true,  
        close = true,  
        description = "Collection of Rare Spices.",
        client = {
            image = "rare_spices.png",
        }
    },
    ["spy_gadget"] = {
        label = "Spy Gadget",
        weight = 1000,  
        stack = true,  
        close = true,  
        description = "A Spy Gadget.",
        client = {
            image = "spy_gadget.png",
        }
    },

    -- GANG ITEMS

    ['spray'] = {
        label = 'Spray Can',
        weight = 250,
        close = true,
        stack = true,
        consume = 0,
        client = {
            event = "op-crime:useSpray",
        }
    },
    ['spray_remover'] = {
        label = 'Spray Remover',
        weight = 250,
        close = true,
        stack = true,
        consume = 0,
        client = {
            event = "op-crime:useRemover",
        }
    },

    ["paperbag"] = {
        label = "Paper bag",
        weight = 1000,
        stack = true,
        close = true,
        description = "Maybe it can be put on someone's head?",
        client = {
            image = "paperbag.png",
        }
    },

    -- STANCE
    ["stancehousevoucher"] = {
        label = "Stance House Voucher",
        weight = 1,
        stack = true,
        close = true,
        description = "Voucher to receive a FREE Full Service at Stance House!",
        client = {
            image = "stancehousevoucher.png",
        }
    },

    -- VANGELICO

    ["giant_gem"] = {
        label = "Giant Gem",
        weight = 1500,
        stack = true,
        close = true,
        description = "A large diamond. Could be valuable at a fence.",
        client = {
            image = "giant_gem.png",
        }
    },

    -- HOUSE ROBBERIES

    ["house_key"] = {
        label = "House Key",
        weight = 100,
        stack = false,
        close = false,
        description = "To unlock the front door",
        client = {
            image = "house_key.png",
        }
    },
    
    ["x_burner"] = {
        label = "Burner Phone",
        weight = 100,
        stack = false,
        close = false,
        description = "Nothing suspicious about this phone..",
    },

    ["x_tablet"] = {
        label = "X Tablet",
        weight = 100,
        stack = false,
        close = false,
        description = "Nothing suspicious about this tablet..",
    },

    ["x_stethoscope"] = {
        label = "X Stethoscope",
        weight = 200,
        stack = false,
        close = false,
        description = "click click",
        client = {
            image = "x_stethoscope.png",
        }
    },

    ["x_device"] = {
        label = "X Device",
        weight = 50,
        stack = false,
        close = false,
        description = "?????????",
    },

    ["glass_cutter"] = {
        label = "Glass Cutter",
        weight = 1000,
        stack = false,
        close = false,
        description = "",
    },

    ["x_coffeemaker"] = {
        label = "Coffee Maker",
        weight = 5000,
        stack = true,
        close = false,
        description = "To make that perfect cup of Joe!",
        client = {
            image = "x_coffeemaker.png",
        }
     },

    ["x_microwave"] = {
        label = "Microwave",
        weight = 5000,
        stack = true,
        close = false,
        description = "A microwave - for heating things up!",
        client = {
            image = "x_microwave.png",
        }
    },

    ["x_painting"] = {
        label = "Painting",
        weight = 3000,
        stack = true,
        close = false,
        description = "A beautiful painting - worth a lot!",
        client = {
            image = "x_painting.png",
        }
    },

    ["x_plush"] = {
        label = "Plush Toy",
        weight = 100,
        stack = true,
        close = false,
        description = "A cute plush toy",
    },

    ["x_toaster"] = {
        label = "Toaster",
        weight = 1000,
        stack = true,
        close = false,
        description = "A kitchen toaster",
        client = {
            image = "x_toaster.png",
        }
    },

    ["x_printer"] = {
        label = "Printer",
        weight = 5000,
        stack = true,
        close = false,
        description = "A color printer",
    },

    ['x_goldenknife'] = {
        label = "Golden Knife",
        weight = 300,
        stack = false,
        close = false,
        description = "?????????",
    },

    ['x_television'] = {
        label = "Television",
        weight = 10000,
        stack = false,
        close = false,
        description = "A high-definition television",
        client = {
            image = "x_television.png",
        }
    },

    ["x_watch"] = {
        label = "Watch",
        weight = 100,
        stack = true,
        close = false,
        description = "Wrist watch",
    },

    ["x_bananatrophy"] = {
        label = "Banana Trophy",
        weight = 1000,
        stack = false,
        close = false,
        description = "Don't ask..",
        client = {
            image = "x_bananatrophy.png",
        }
    },

    ["x_electricguitar"] = {
        label = "Electric Guitar",
        weight = 1000,
        stack = false,
        close = false,
        description = "Rock on!",
        client = {
            image = "x_guitar.png",
        }
    },

    ["x_suitcase"] = {
        label = "Suitcase",
        weight = 1000,
        stack = false,
        close = false,
        description = "Nothing like a vacation",
    },
    
    ["giant_gem"] = {
        label = "Giant Gem",
        weight = 500,
        stack = false,
        close = false,
        description = "A huge sparkling gem",
    },

    ["skateboard"] = {
        label = "Skateboard",
        weight = 2000,
        stack = false,
        close = true,
        client = {
        image = "skateboard.png"
        }
    },

    ["scooter"] = {
        label = "Scooter",
        weight = 2000,
        stack = false,
        close = true,
        client = {
        image = "scooter.png"
        }
    },

    ['rollers'] = {
        label = 'Roller Skates',
        weight = 1500,
        close = true,
        stack = false,
    },

    ["recyclablematerial"] = {
        label = "Recyclable Box",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "recyclablematerial.png",
        }
    },

    -- DIVING

    ['ls_diving_crate'] = {
        label = 'Crate',
        weight = 2000
    },

        -- Hunting

    ['bone_fragments'] = {
        label = 'Bone Fragments',
        weight = 3,
        stack = true,
        close = true,
        description = nil
    },
    ['cloth'] = {
        label = 'Cloth',
        weight = 4,
        stack = true,
        close = true,
        description = nil
    },
    ['leather'] = {
        label = 'Leather',
        weight = 5,
        stack = true,
        close = true,
        description = nil
    },
    ['raw_pork'] = {
        label = 'Raw Pork',
        weight = 7,
        stack = true,
        close = true,
        description = nil
    },
    ['animal_fat'] = {
        label = 'Animal Fat',
        weight = 5,
        stack = true,
        close = true,
        description = nil
    },
    ['meat_stand'] = {
        label = 'Meat Bait',
        weight = 10,
        stack = false,
        close = true,
        description = nil
    },
    ['deer'] = {
        label = 'Deer Bait',
        weight = 10,
        stack = false,
        close = true,
        description = nil
    },
    ['boar_meat'] = {
        label = 'Boar Bait',
        weight = 10,
        stack = false,
        close = true,
        description = nil
    },
    ['deer_horn'] = {
        label = 'Deer Horn',
        weight = 10,
        stack = false,
        close = true,
        description = nil
    },

    -- BEEKEEPING

    ["bee-hive"] = {
        label = "Bee Hive",
        weight = 1000,
        stack = false,
        close = true,
        description = "",
        consume = 0,
        client = {
            image = "bee-hive.png",
        },
        server = {
            export = 'sd-beekeeping.useBee-hive',
        }
    },
        
    -- Bee Honey (Basic)
    ["bee-honey"] = {
        label = "Bee Honey",
        weight = 100,
        stack = true,
        close = true,
        description = "Pure honey harvested directly from the hive, rich in natural sweetness.",
        consume = 0,
        client = {
            image = "bee-honey.png",
        }
    },

    -- Chiliad Honey
    ["chiliad-honey"] = {
        label = "Chiliad Honey",
        weight = 100,
        stack = true,
        close = true,
        description = "A robust honey infused with the essence of Chiliad's wild flora.",
        consume = 0,
        client = {
            image = "chiliad-honey.png",
        }
    },

    -- Green Hills Honey
    ["green-hills-honey"] = {
        label = "Green Hills Honey",
        weight = 100,
        stack = true,
        close = true,
        description = "Delicate honey crafted from the abundant clover fields of Green Hills.",
        consume = 0,
        client = {
            image = "green-hills-honey.png",
        }
    },

    -- Alamo Honey
    ["alamo-honey"] = {
        label = "Alamo Honey",
        weight = 100,
        stack = true,
        close = true,
        description = "Exquisite honey sourced from the serene Alamo Grove, known for its unique taste.",
        consume = 0,
        client = {
            image = "alamo-honey.png",
        }
    },

    -- Bee Wax
    ["bee-wax"] = {
        label = "Bee Wax",
        weight = 100,
        stack = true,
        close = true,
        description = "Versatile beeswax, perfect for crafting candles, cosmetics, and artisanal goods.",
        consume = 0,
        client = {
            image = "bee-wax.png",
        }
    },
        
    ["bee-house"] = {
        label = "Bee House",
        weight = 1000,
        stack = false,
        close = true,
        description = "",
        consume = 0,
        client = {
            image = "bee-house.png",
        },
        server = {
            export = 'sd-beekeeping.useBee-house',
        }
    },
        
    ["bee-queen"] = {
        label = "Bee Queen",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        consume = 0,
        client = {
            image = "bee-queen.png",
        }
    },

    ["bee-worker"] = {
        label = "Worker Bee",
        weight = 100,
        stack = true,
        close = true,
        description = "",
        consume = 0,
        client = {
            image = "bee-worker.png",
        }
    },

    ["thymol"] = {
        label = "Thymol",
        weight = 100,
        stack = true,
        close = true,
        description = "A natural treatment derived from thyme oil, effective in combating hive infections and supporting bee health.",
        consume = 0,
        client = {
            image = "thymol.png",
        }
    },

    -- Metal Detecting
    ['blue_metaldetector'] = {
        label = 'Beginner\'s Beacon',
        weight = 500
    },
    
    ['green_metaldetector'] = {
        label = 'Lustrous Locator',
        weight = 500
    },
    
    ['red_metaldetector'] = {
        label = 'Treasure Trove Tracker',
        weight = 500
    },
    
    ['orange_metaldetector'] = {
        label = 'Goldseeker\'s Grail',
        weight = 500
    },
    
    ['black_metaldetector'] = {
        label = 'Archaeo Ace',
        weight = 500
    },
    ['md_shovel'] = {
        label = 'Shovel',
        weight = 75
    },

    -- Easter
    ['ngd_egghuntegg'] = {
        label = 'Easter Egg',
        weight = 15,
    },
    ['ngd_eggbasket'] = {
        label = 'Egg Basket',
        weight = 15,
    },
    ['ngd_chocobunny'] = {
        label = 'Chocolate Bunny',
        weight = 15,
    },
    ['goldenticket'] = {
        label = 'Carrot Car',
        description = "Redeem in a ticket to claim your carrot car.",
        weight = 15,
    },

    -- MEGAPHONE

    ['megaphone'] = {
        label = 'Megaphone',
        description = "I think you talk into it?",
        weight = 1000,
    },

    -- Envi Items
    ['sparkler'] = {
        label = 'Sparkler',
        weight = 500,
        stack = false,
        close = true,
        durability = 50.0,
        degrade = 10.0,
        description = nil
    },
    ['large_sparkler'] = {
        label = 'Large Sparkler',
        weight = 1000,
        stack = false,
        close = true,
        durability = 50.0,
        degrade = 10.0,
        description = nil
    },
    ['large_green_sparkler'] = {
        label = 'Large Green Sparkler',
        weight = 1000,
        stack = false,
        close = true,
        durability = 50.0,
        degrade = 10.0,
        description = nil
    },
    ['large_pink_sparkler'] = {
        label = 'Large Pink Sparkler',
        weight = 1000,
        stack = false,
        close = true,
        durability = 50.0,
        degrade = 10.0,
        description = nil
    },
    ['large_blue_sparkler'] = {
        label = 'Large Blue Sparkler',
        weight = 1000,
        stack = false,
        close = true,
        durability = 50.0,
        degrade = 10.0,
        description = nil
    },
    ['american_sparkler'] = {
        label = 'USA Sparkler',
        weight = 1000,
        stack = false,
        close = true,
        durability = 50.0,
        degrade = 10.0,
        description = nil
    },
    ['fire_torch'] = {
        label = 'Fire Torch',
        weight = 1000,
        stack = false,
        close = true,
        description = nil
    },
    ['large_usa_sparkler'] = {
        label = 'Large USA Sparkler',
        weight = 1000,
        stack = false,
        close = true,
        durability = 50.0,
        degrade = 10.0,
        description = nil
    },
    ['green_sparkler'] = {
        label = 'Green Sparkler',
        weight = 1000,
        stack = false,
        close = true,
        durability = 50.0,
        degrade = 10.0,
        description = nil
    },
    ['pink_sparkler'] = {
        label = 'Pink Sparkler',
        weight = 1000,
        stack = false,
        close = true,
        durability = 50.0,
        degrade = 10.0,
        description = nil
    },
    ['blue_sparkler'] = {
        label = 'Blue Sparkler',
        weight = 1000,
        stack = false,
        close = true,
        durability = 50.0,
        degrade = 10.0,
        description = nil
    },
    
    -- USED DEALERSHIP

    ["dealership_contract"] = {
        label = "Used Dealership Contract",
        weight = 500,
        stack = false,
        close = true,
        description = "A vehicle contract",
        client = {
            image = "dealership_contract.png",
        }
    },
    -- HOBO KING
    ['poptab'] = {
        label = 'Pop Tab',
        weight = 0,
        stack = true,
        close = true,
    },
    ['cardboard_bed'] = {
        label = 'Cardboard Bed',
        weight = 1,
        stack = false,
        close = true,
    },
    ['hobo_gloves'] = {
        label = 'Hobo Gloves',
        weight = 1,
        stack = false,
        close = true,
    },
    ['hobo_tent'] = {
        label = 'Hobo Tent',
        weight = 10000,
        stack = false,
        close = true,
    },
    ['begging_sign'] = {
        label = 'Begging Sign',
        weight = 1,
        stack = true,
        close = true,
    },
    ['medical_care_package'] = {
        label = 'Medical Care Package',
        weight = 10000,
        stack = false,
        close = true,
    },
    ['rat_treats'] = {
        label = 'Rat Treats',
        weight = 1,
        stack = true,
        close = true,
    },
    ['racoon_treats'] = {
        label = 'Raccoon Treats',
        weight = 1,
        stack = true,
        close = true,
    },
    ['rat_bait'] = {
        label = 'Rat Bait',
        weight = 1,
        stack = true,
        close = true,
    },
    ['hobo_crown'] = {
        label = 'Hobo Crown',
        weight = 500,
        stack = false,
        close = true,
    },
    ['sleeping_bag'] = {
        label = 'Sleeping Bag',
        weight = 2000,
        stack = false,
        close = true,
    },
    ['hobo_bottle'] = {
        label = 'Dirty Water',
        weight = 500,
        stack = false,
        close = true,
        description = 'A bottle of dirty water, it smells bad..',
    },
    ['ration_pack'] = {
        label = 'Ration Pack',
        weight = 1500,
        stack = false,
        close = true,
    },
    ['wooden_junk'] = {
        label = 'Wooden Junk',
        weight = 100,
        stack = true,
        close = true,
    },
    ['copper_junk'] = {
        label = 'Copper Junk',
        weight = 100,
        stack = true,
        close = true,
    },
    ['scrap_junk'] = {
        label = 'Scrap Junk',
        weight = 100,
        stack = true,
        close = true,
    },
    ['cloth_junk'] = {
        label = 'Cloth Junk',
        weight = 100,
        stack = true,
        close = true,
    },
    ['plastic_junk'] = {
        label = 'Plastic Junk',
        weight = 100,
        stack = true,
        close = true,
    },
    ['electronic_junk'] = {
        label = 'Electronic Junk',
        weight = 100,
        stack = true,
        close = true,
    },
    ['broken_phone'] = {
        label = 'Broken Phone',
        weight = 50,
        stack = true,
        close = true,
    },
    ['food_waste'] = {
        label = 'Food Waste',
        weight = 100,
        stack = true,
        close = true,
    },
    ['medical_waste'] = {
        label = 'Medical Waste',
        weight = 100,
        stack = true,
        close = true,
    },
    ['paper_junk'] = {
        label = 'Paper Junk',
        weight = 100,
        stack = true,
        close = true,
    },
    ['glass_junk'] = {
        label = 'Glass Junk',
        weight = 100,
        stack = true,
        close = true,
    },
    ['rabies_shot'] = {
        label = 'Rabies Shot',
        weight = 100,
        stack = true,
        close = true,
    },
    ['tetanus_shot'] = {
        label = 'Tetanus Shot',
        weight = 100,
        stack = true,
        close = true,
    },
    ['portable_shopping_cart'] = {
        label = 'Portable Shopping Cart',
        weight = 15000,
    },
    ['hoboticket'] = {
        label = 'Skart Voucher',
        description = "Redeem in a ticket to claim your skart car.",
        weight = 15,
    },

    -- PHOTOGRAPHY ITEMS

    ['photography_lightcase'] = {
        label = 'Photography Light Case',
        weight = 1000,
        stack = true,
        close = true,
        consume = 1,
        description = 'Portable studio light kit.',
        client = {
            image = "Photography_lightcase.png",
            event = 'xmmx_photolights:client:UsePhotoLight',
        }
    },
    ["blue_light"] = {
        label = "Blue Light",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "blue_light.png",
            
        }
    },
    ["green_light"] = {
            label = "Green Light",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "green_light.png",
                
            }
    },
    ["orange_light"] = {
            label = "Orange Light",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "orange_light.png",
                
            }
    },
    ["pink_light"] = {
            label = "Pink Light",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "pink_light.png",
                
            }
    },
    ["purple_light"] = {
            label = "Purple Light",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "purple_light.png",
                
            }
    },
    ["red_light"] = {
            label = "Red Light",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "red_light.png",
                
            }
    },
    ["photolights"] = {
            label = "Studio Lamp",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "white_light.png",
                
            }
    },
    ["tripodlight"] = {
            label = "Tripod Light",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "light1.png",
                
            }
    },
    ["white_light"] = {
            label = "White Light",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "white_light.png",
                
            }
    },
    ["yellow_light"] = {
            label = "Yellow Light",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "yellow_light.png",
                
            }
    },
    ["blue_lamp"] = {
            label = "Blue Lamp Pole",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "blue_lamp.png",
                
            }
    },
    ["green_lamp"] = {
            label = "Green Lamp Pole",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "green_lamp.png",
                
            }
    },
    ["orange_lamp"] = {
            label = "Orange Lamp Pole",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "orange_lamp.png",
                
            }
    },
    ["pink_lamp"] = {
            label = "Pink Lamp Pole",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "pink_lamp.png",
                
            }
    },
    ["purple_lamp"] = {
            label = "Purple Lamp Pole",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "purple_lamp.png",
                
            }
    },
    ["red_lamp"] = {
            label = "Red Lamp Pole",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "red_lamp.png",
                
            }
    },
    ["white_lamp"] = {
            label = "White Lamp Pole",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "white_lamp.png",
                
            }
    },
    ["yellow_lamp"] = {
            label = "Yellow Lamp Pole",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "yellow_lamp.png",
                
            }
    },
    ["photobox_1"] = {
        label = "Photo Box 1",
        weight = 1000,
        stack = true,
        close = true,
        description = "",
        client = {
            image = "photobox_1.png",
            
        }
    },
    ["photobox_2"] = {
            label = "Photo Box 2",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "photobox_2.png",
                
            }
    },
    ["photobox_3"] = {
            label = "Photo Box 3",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "photobox_3.png",
                
            }
    },
    ["photobox_4"] = {
            label = "Photo Box 4",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "photobox_4.png",
                
            }
    },
    ["photobox_5"] = {
            label = "Photo Box 5",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "photobox_5.png",
                
            }
    },
    ["photobox_6"] = {
            label = "Photo Box 6",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "photobox_6.png",
                
            }
    },
    ["photobox_7"] = {
            label = "Photo Box 7",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "photobox_7.png",
                
            }
    },
    ["photobox_8"] = {
            label = "Photo Box 8",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "photobox_8.png",
                
            }
    },
    ["photobox_9"] = {
            label = "Photo Box 9",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "photobox_9.png",
                
            }
    },
    ["photobox_10"] = {
            label = "Photo Box 10",
            weight = 1000,
            stack = true,
            close = true,
            description = "",
            client = {
                image = "photobox_10.png",
                
            }
    },

    -- CARD SHOP --

    ['boosterpack1'] = {
		label  = ' Booster Pack',
		weight = 2,
		consume = 1,
    		metadata = {},
		client = {export = 't3_tradingcards.boosterpack'},
		stack = true,
		close = true,
		description = ''
	},
    ['album1'] = {
		label  = ' Album',
		weight = 2,
		consume = 0,
    		metadata = {},
		client = {export = 't3_tradingcards.album'},
		stack = false,
		close = true,
		description = ''
	},
    ['boosterpack2'] = {
		label  = ' V2 Booster Pack',
		weight = 2,
		consume = 1,
    		metadata = {},
		client = {export = 't3_tradingcards.boosterpack'},
		stack = true,
		close = true,
		description = ''
	},
    ['album2'] = {
		label  = ' V2 Album',
		weight = 2,
		consume = 0,
    		metadata = {},
		client = {export = 't3_tradingcards.album'},
		stack = true,
		close = true,
		description = ''
	},
    ['tradingcard'] = {
		label  = 'Trading Card',
		weight = 2,
		consume = 0,
    		metadata = {},
		client = {export = 't3_tradingcards.useCard'},
		buttons = {{label='Add to album',action=function(slot) TriggerServerEvent('t3_tradingcards:passCard',slot) end}},
		stack = true,
		close = true,
		description = ''
	},

    -- BACKPACKS

    ['backpack'] = {
        label = 'Backpack',
        weight = 2500,
        stack = false,
        consume = 0,
        client = {
            export = 'os-backpacks.aceopenpack_backpack'
        }
    },

    ['backpack2'] = {
        label = 'Backpack',
        weight = 2500,
        stack = false,
        consume = 0,
        client = {
            export = 'os-backpacks.aceopenpack_backpack2'
        }
    },

    ['backpack3'] = {
        label = 'Backpack',
        weight = 2500,
        stack = false,
        consume = 0,
        client = {
            export = 'os-backpacks.aceopenpack_backpack3'
        }
    },

    ['backpack4'] = {
        label = 'Backpack',
        weight = 2500,
        stack = false,
        consume = 0,
        client = {
            export = 'os-backpacks.aceopenpack_backpack4'
        }
    },

    ['backpack5'] = {
        label = 'Backpack',
        weight = 2500,
        stack = false,
        consume = 0,
        client = {
            export = 'os-backpacks.aceopenpack_backpack5'
        }
    },

    ['backpack6'] = {
        label = 'Backpack',
        weight = 2500,
        stack = false,
        consume = 0,
        client = {
            export = 'os-backpacks.aceopenpack_backpack6'
        }
    },

    ['backpack7'] = {
        label = 'Backpack',
        weight = 2500,
        stack = false,
        consume = 0,
        client = {
            export = 'os-backpacks.aceopenpack_backpack7'
        }
    },

    ['backpack8'] = {
        label = 'Backpack',
        weight = 2500,
        stack = false,
        consume = 0,
        client = {
            export = 'os-backpacks.aceopenpack_backpack8'
        }
    },

    ['backpack9'] = {
        label = 'Backpack',
        weight = 2500,
        stack = false,
        consume = 0,
        client = {
            export = 'os-backpacks.aceopenpack_backpack9'
        }
    },

    ['backpack10'] = {
        label = 'Backpack',
        weight = 3000,
        stack = false,
        consume = 0,
        client = {
            export = 'os-backpacks.aceopenpack_backpack10'
        }
    },

    -- WEAPON TINTS

    ['tint_default'] = {
        label = 'Weapon Tint Remover',
        weight = 100,
        stack = true,
        close = true,
        description = 'Restores the default tint to your weapon',
        client = {
            event = 'weapon_tinting:UseTint',
            args = { tint = 0 }
        }
    },
    
    ['tint_green'] = {
        label = 'Green Weapon Tint',
        weight = 100,
        stack = true,
        close = true,
        description = 'Applies a green tint to your weapon',
        client = {
            event = 'weapon_tinting:UseTint',
            args = { tint = 1 }
        }
    },
    
    ['tint_gold'] = {
        label = 'Gold Weapon Tint',
        weight = 100,
        stack = true,
        close = true,
        description = 'Applies a gold tint to your weapon',
        client = {
            event = 'weapon_tinting:UseTint',
            args = { tint = 2 }
        }
    },
    
    ['tint_pink'] = {
        label = 'Pink Weapon Tint',
        weight = 100,
        stack = true,
        close = true,
        description = 'Applies a pink tint to your weapon',
        client = {
            event = 'weapon_tinting:UseTint',
            args = { tint = 3 }
        }
    },
    
    ['tint_army'] = {
        label = 'Army Weapon Tint',
        weight = 100,
        stack = true,
        close = true,
        description = 'Applies an army camo tint to your weapon',
        client = {
            event = 'weapon_tinting:UseTint',
            args = { tint = 4 }
        }
    },
    
    ['tint_lspd'] = {
        label = 'Blue Weapon Tint',
        weight = 100,
        stack = true,
        close = true,
        description = 'Applies an LSPD blue tint to your weapon',
        client = {
            event = 'weapon_tinting:UseTint',
            args = { tint = 5 }
        }
    },
    
    ['tint_orange'] = {
        label = 'Orange Weapon Tint',
        weight = 100,
        stack = true,
        close = true,
        description = 'Applies an orange tint to your weapon',
        client = {
            event = 'weapon_tinting:UseTint',
            args = { tint = 6 }
        }
    },
    
    ['tint_platinum'] = {
        label = 'Platinum Weapon Tint',
        weight = 100,
        stack = true,
        close = true,
        description = 'Applies a platinum tint to your weapon',
        client = {
            event = 'weapon_tinting:UseTint',
            args = { tint = 7 }
        }
    },
    
      -- EMS
    ["medbag"] = {
        label = "Medical Bag",
        weight = 2500,
        stack = true,
        close = true,
        description = 'A bag of medic tools',
    },
    ["tweezers"] = {
        label = "Tweezers",
        weight = 250,
        stack = true,
        close = true,
        description = 'For picking out bullets',
    },    
    ["suturekit"] = {
        label = "Suture Kit",
        weight = 250,
        stack = true,
        close = true,
        description = 'For stitching your patients',
    },    
    ["icepack"] = {
        label = "Ice Pack",
        weight = 500,
        stack = true,
        close = true,
        description = 'To help reduce swelling',
    },    
    ["burncream"] = {
        label = "Burn Cream",
        weight = 250,
        stack = true,
        close = true,
        description = 'To help with burns',
    },    
    ["sedative"] = {
        label = "Sedative",
        weight = 2500,
        stack = true,
        close = true,
        description = 'If needed, this will sedate patient',
    },    
    ["defib"] = {
        label = "Defibrillator",
        weight = 1000,
        stack = true,
        close = true,
        description = 'Used to revive patients',
    },    
    ["morphine30"] = {
        label = "Morphine 30MG",
        weight = 50,
        stack = true,
        close = true,
        description = 'A bag of medic tools',
    },    
    ["morphine15"] = {
        label = "Morphine 15MG",
        weight = 50,
        stack = true,
        close = true,
        description = 'A bag of medic tools',
    },    
    ["perc30"] = {
        label = "'Percocet 30MG",
        weight = 50,
        stack = true,
        close = true,
        description = 'A bag of medic tools',
    },    
    ["perc10"] = {
        label = "'Percocet 10MG",
        weight = 50,
        stack = true,
        close = true,
        description = 'A bag of medic tools',
    },    
    ["perc5"] = {
        label = "'Percocet 5MG",
        weight = 50,
        stack = true,
        close = true,
        description = 'A bag of medic tools',
    },    
    ["vic10"] = {
        label = "Vicodin 10MG",
        weight = 50,
        stack = true,
        close = true,
        description = 'A bag of medic tools',
    },    
    ["vic5"] = {
        label = "Vicodin 5MG",
        weight = 50,
        stack = true,
        close = true,
        description = 'A bag of medic tools',
    },    
    ["medikit"] = {
        label = "Medical Kit",
        weight = 1000,
        stack = true,
        close = true,
        description = 'A first aid kit for healing injured people.',
    },    
    ["crutch"] = {
        label = "Crutch",
        weight = 1000,
        stack = false,
        close = true,
    },    
    ["wheelchair"] = {
        label = "Wheel Chair",
        weight = 2500,
        stack = false,
        close = true,
    },    

    -- Evidence
    ["uvlight"] = {
        label = "UV Light",
        weight = 1000,
        stack = false,
        close = true,
        description = 'To scan for fingerprints',
    },    
    ["bleachwipes"] = {
        label = "Bleach Wipes",
        weight = 500,
        stack = true,
        close = true,
        description = 'To clean and sanatize',
    },    

    -- Drugs

    ['ammonia'] = {
    label = 'Ammonia',
    weight = 500,
    stack = true,
    },

    ['sodium_benzoate'] = {
        label = 'Sodium benzoate',
        weight = 750,
        stack = true,
    },

    ['meth_bag'] = {
        label = 'Meth bag',
        weight = 1000,
        stack = true,
    },

    ['plastic_bag'] = {
        label = 'Plastic bag',
        weight = 40,
        stack = true,
    },

    ['meth_syringe'] = {
        label = 'Meth syringe',
        weight = 75,
        stack = true,
    },

    -- Cocaine related items
    ['coke_seed'] = {
        label = 'Cocaine seed',
        weight = 10,
        stack = true,
    },

    ['coke_leaf'] = {
        label = 'Cocaine leaf',
        weight = 50,
        stack = true,
    },

    ['coke_paste'] = {
        label = 'Cocaine paste',
        weight = 150,
        stack = true,
    },

    ['coke'] = {
        label = 'Cocaine',
        weight = 1,
        stack = true,
    },

    ['coke_bag'] = {
        label = 'Cocaine bag',
        weight = 50,
        stack = true,
    },

    ['coke_doll'] = {
        label = 'Cocaine doll',
        weight = 500,
        stack = true,
    },

    -- Weed related items
    ['weed_seed'] = {
        label = 'Weed seed',
        weight = 5,
        stack = true,
    },

    ['weed_pot'] = {
        label = 'Flower Pot',
        weight = 500,
        stack = true,
    },

    ['trowel'] = {
        label = 'Trowel',
        weight = 150,
        stack = true,
    },

    ['weed_bud'] = {
        label = 'Weed bud',
        weight = 25,
        stack = true,
    },

    ['clean_weed_bud'] = {
        label = 'Clean weed bud',
        weight = 20,
        stack = true,
    },

    ['cookie_dough'] = {
        label = 'Cookie dough',
        weight = 200,
        stack = true
    },

    ['weed_cookie'] = {
        label = 'Weed cookie',
        weight = 50,
        stack = true
    },

    ['weed_bag'] = {
        label = 'Weed bag',
        weight = 50,
        stack = true,
    },

    ['weed_joint'] = {
        label = 'Weed joint',
        weight = 15,
        stack = true,
    },

    ['weed_papers'] = {
        label = 'Weed papers',
        weight = 5,
        stack = true,
    },

    -- Heroin related items
    ['poppy_seeds'] = {
        label = 'Poppy seeds',
        weight = 5,
        stack = true,
    },

    ['poppy_plant'] = {
        label = 'Poppy plant',
        weight = 100,
        stack = true,
    },

    ['opium'] = {
        label = 'Opium',
        weight = 1,
        stack = true,
    },

    ['heroin_bag'] = {
        label = 'Heroin bag',
        weight = 50,
        stack = true,
    },

    ['heroin_syringe'] = {
        label = 'Heroin syringe',
        weight = 75,
        stack = true,
    },

    ['syringe'] = {
        label = 'Syringe',
        weight = 25,
        stack = true,
    },

    -- LSD related items
    ['ergot_fungus'] = {
        label = 'Ergot fungus',
        weight = 50,
        stack = true,
    },

    ['generic_leaf'] = {
        label = 'Leaf',
        weight = 20,
        stack = true,
    },

    ['lsd_liquid'] = {
        label = 'LSD liquid',
        weight = 25,
        stack = true,
    },

    ['art_papers'] = {
        label = 'Art papers',
        weight = 5,
        stack = true,
    },

    -- Ecstasy related items
    ['safrole_oil'] = {
        label = 'Safrole oil',
        weight = 300,
        stack = true,
    },

    ['ecstasy_crystals'] = {
        label = 'Ecstasy crystals',
        weight = 1,
        stack = true,
    },

    ['ecstasy_pill'] = {
        label = 'Ecstasy pill',
        weight = 15,
        stack = true,
    },

    -- Mushroom related items
    ['mushrooms'] = {
        label = 'Mushrooms',
        weight = 1,
        stack = true,
    },

    ['mushroom_powder'] = {
        label = 'Mushroom powder',
        weight = 1,
        stack = true,
    },

    ['chocolate_chips'] = {
        label = 'Chocolate chips',
        weight = 30,
        stack = true,
    },

    ['mushroom_chocolate'] = {
        label = 'Mushroom chocolate',
        weight = 45,
        stack = true,
    },

    -- Ketamine related items
    ['anesthetic'] = {
        label = 'anesthetic',
        weight = 200,
        stack = true,
    },

    ['ketamine'] = {
        label = 'Ketamine',
        weight = 1,
        stack = true,
    },

    ['ketamine_bag'] = {
        label = 'Ketamine bag',
        weight = 50,
        stack = true,
    },

    -- Crack related items
    ['baking_soda'] = {
        label = 'Baking soda',
        weight = 100,
        stack = true,
    },

    ['crack'] = {
        label = 'Crack',
        weight = 1,
        stack = true,
    },

    ['crack_bag'] = {
        label = 'Crack bag',
        weight = 50,
        stack = true,
    },

    ['crack_pipe'] = {
        label = 'Crack pipe',
        weight = 150,
        stack = true,
    },

    ['crack_syringe'] = {
        label = 'Crack syringe',
        weight = 75,
        stack = true,
    },

    ['pipe'] = {
        label = 'Pipe',
        weight = 100,
        stack = true,
    },

    -- Fentanyl related items
    ['npp_chemical'] = {
        label = 'NPP chemical',
        weight = 300,
        stack = true,
    },

    ['aniline_solution'] = {
        label = 'Aniline solution',
        weight = 250,
        stack = true,
    },

    ['fentanyl'] = {
        label = 'Fentanyl',
        weight = 1,
        stack = true,
    },

    ['fentanyl_bag'] = {
        label = 'Fentanyl bag',
        weight = 25,
        stack = true,
    },

    ['meth_table'] = {
        label = 'Meth table',
        weight = 2250,
        stack = false
    },

    ['coke_table'] = {
        label = 'Coke table',
        weight = 2250,
        stack = false
    },

    ['weed_table'] = {
        label = 'Weed table',
        weight = 2250,
        stack = false
    },

    ['lean_table'] = {
        label = 'Lean table',
        weight = 2250,
        stack = false
    },

    ['chem_table'] = {
        label = 'Chemistry table',
        weight = 2250,
        stack = false
    },

    ['burner_phone'] = {
        label = 'Burner phone',
        weight = 200,
        stack = true
    },

    ['light1'] = {
        label = 'Portable Lamp',
        weight = 2000,
        stack = true
    },

    ['light2'] = {
        label = 'Portable Lamp',
        weight = 2000,
        stack = true
    },

    ['fertilizer'] = {
        label = 'Fertilizer',
        weight = 250,
        stack = true
    },

    ['water_can'] = {
        label = 'Watering can',
        weight = 250,
        stack = true
    },

    -- 0r Jobs
    
    ["gold_tooth"] = {
	label = "Gold Tooth",
	weight = 1,
	stack = true,
	close = false,
    },
    ["dirty_photo"] = {
        label = "Dity Photo",
        weight = 1,
        stack = true,
        close = false,
    },
    ["chain"] = {
        label = "Chain",
        weight = 1,
        stack = true,
        close = false,
    },
    ["medal"] = {
        label = "Medal",
        weight = 1,
        stack = true,
        close = false,
    },
    ["rusted_tin"] = {
        label = "Rusted Tin",
        weight = 1,
        stack = true,
        close = false,
    },
    ["nail"] = {
        label = "Nail",
        weight = 1,
        stack = true,
        close = false,
    },
    ["ring"] = {
        label = "Ring",
        weight = 1,
        stack = true,
        close = false,
    },
    ["vehicle_tyre"] = {
        label = "Vehicle Tyre",
        weight = 1,
        stack = true,
        close = false,
    },
    ["vehicle_door"] = {
        label = "Vehicle Door",
        weight = 1,
        stack = true,
        close = false,
    },

        -- Ammo Cases
    
    	['pistol_case'] = {
			label = 'Pistol Ammo Case (12)',
			weight = 24,
		},

		['hunting_case'] = {
			label = 'Hunting Ammo Case (10)',
			weight = 20,
		},

		['rubber_case'] = {
			label = 'Rubber Pellet Case (10)',
			weight = 20,
		},

		['smg_case'] = {
			label = 'SMG Ammo Case (30)',
			weight = 150,
		},

		['rifle_case'] = {
			label = 'AR Ammo Case (30)',
			weight = 300,
		},

		['shotgun_case'] = {
			label = 'Shotgun Ammo Case (12)',
			weight = 36,
		},

		['snp_case'] = {
			label = 'Sniper Ammo Case (5)',
			weight = 12500,
		},

		['paint_case'] = {
			label = 'Paintball Package (100)',
			weight = 1000,
		},
    
        -- Farming

        ['watering_can'] = {
            label = 'Watering Can',
            weight = 0,
            stack = true,
            close = true,
            description = 'A can used to water plants.',
            consume = 0,
            client = { image = 'watering_can.png' }
        },

        ['wheat_seed'] = {
            label = 'Wheat Seed',
            weight = 100,
            stack = true,
            close = false,
            description = 'Seed for growing wheat.',
            client = { image = 'wheat_seed.png' }
        },

        ['wheat'] = {
            label = 'Wheat',
            weight = 100,
            stack = true,
            close = false,
            description = 'Harvested wheat.',
            client = { image = 'wheat.png' }
        },

        ['rose_seed'] = {
            label = 'Rose Seed',
            weight = 100,
            stack = true,
            close = false,
            description = 'Seed for growing roses.',
            client = { image = 'rose_seed.png' }
        },
        ['rose'] = {
            label = 'Rose',
            weight = 100,
            stack = true,
            close = false,
            description = 'A beautiful rose.',
            client = { image = 'rose.png' }
        },

        ['green_seed'] = {
            label = 'Green Seed',
            weight = 100,
            stack = true,
            close = false,
            description = 'Seed for growing greens.',
            client = { image = 'green_seed.png' }
        },
        ['green'] = {
            label = 'Green',
            weight = 100,
            stack = true,
            close = false,
            description = 'Harvested green plant.',
            client = { image = 'green.png' }
        },

        ['daisy_seed'] = {
            label = 'Daisy Seed',
            weight = 100,
            stack = true,
            close = false,
            description = 'Seed for growing daisies.',
            client = { image = 'daisy_seed.png' }
        },
        ['daisy'] = {
            label = 'Daisy',
            weight = 100,
            stack = true,
            close = false,
            description = 'A fresh daisy.',
            client = { image = 'daisy.png' }
        },

        ['poppy_seed'] = {
            label = 'Poppy Seed',
            weight = 100,
            stack = true,
            close = false,
            description = 'Seed for growing poppies.',
            client = { image = 'poppy_seed.png' }
        },
        ['poppy'] = {
            label = 'Poppy',
            weight = 100,
            stack = true,
            close = false,
            description = 'A red poppy flower.',
            client = { image = 'poppy.png' }
        },

        ['melon_seed'] = {
            label = 'Melon Seed',
            weight = 100,
            stack = true,
            close = false,
            description = 'Seed for growing melons.',
            client = { image = 'melon_seed.png' }
        },
        ['melon'] = {
            label = 'Melon',
            weight = 100,
            stack = true,
            close = false,
            description = 'A ripe melon.',
            client = { image = 'melon.png' }
        },

        ['watermelon_seed'] = {
            label = 'Watermelon Seed',
            weight = 100,
            stack = true,
            close = false,
            description = 'Seed for growing watermelons.',
            client = { image = 'watermelon_seed.png' }
        },
        ['watermelon'] = {
            label = 'Watermelon',
            weight = 100,
            stack = true,
            close = false,
            description = 'A juicy watermelon.',
            client = { image = 'watermelon.png' }
        },

        ['pumpkin_seed'] = {
            label = 'Pumpkin Seed',
            weight = 100,
            stack = true,
            close = false,
            description = 'Seed for growing pumpkins.',
            client = { image = 'pumpkin_seed.png' }
        },
        ['pumpkin'] = {
            label = 'Pumpkin',
            weight = 100,
            stack = true,
            close = false,
            description = 'A large pumpkin.',
            client = { image = 'pumpkin.png' }
        },

        ['farming_tablet'] = {
            label = 'Farming Tablet',
            weight = 100,
            stack = true,
            close = true,
            description = 'A tablet for farm management.',
            consume = 0,
            client = { image = 'farming_tablet.png' }
        },

        -- Petty Crime

        ['envelope'] = {
            label = 'Envelope',
            weight = 25,
        },

        ['catalog_envelope'] = {
            label = 'Catalog Envelope',
            weight = 50,
        },

        ['letter'] = {
            label = 'Letter',
            weight = 10,
        },

        ['pp_small_1'] = {
            label = 'Small Package',
            weight = 500,
            stack = false,
        },

        ['pp_small_2'] = {
            label = 'Small Package',
            weight = 750,
            stack = false,
        },

        ['pp_small_3'] = {
            label = 'Small Package',
            weight = 1000,
            stack = false,
        },

        ['pp_medium_1'] = {
            label = 'Medium Package',
            weight = 1500,
            stack = false,
        },

        ['pp_large_1'] = {
            label = 'Large Package',
            weight = 2500,
            stack = false,
        },

        -- Jim G Trading Cards
        ['card_sleeves'] = {                      label = 'Card Sleeves',      weight = 1,    stack = true,     close = true,    description = 'Protects cards from condition loss when showing/trading',},
        ['cvg_label_star_galaxy'] = {             label = 'CVG Label - Star Galaxy', weight = 1, stack = true, close = true, description = 'Applies a Star Galaxy label to a CVG slab',},
        ['cvg_label_color_shift'] = {             label = 'CVG Label - Color Shift', weight = 1, stack = true, close = true, description = 'Applies a Color Shift label to a CVG slab',},
        ['cvg_label_p_and_b_mix'] = {             label = 'CVG Label - P & B Mix', weight = 1, stack = true, close = true, description = 'Applies a P & B Mix label to a CVG slab',},
        ['cvg_label_mellow_sky'] = {             label = 'CVG Label - Mellow Sky', weight = 1, stack = true, close = true, description = 'Applies a Mellow Sky label to a CVG slab',},
        ['cvg_label_aetheric_sigil'] = {          label = 'CVG Label - Aetheric Sigil', weight = 1, stack = true, close = true, description = 'Applies an Aetheric Sigil label to a CVG slab',},
        ['cvg_label_arcane_circle'] = {           label = 'CVG Label - Arcane Circle', weight = 1, stack = true, close = true, description = 'Applies an Arcane Circle label to a CVG slab',},
        ['cvg_label_astral_dragon'] = {           label = 'CVG Label - Astral Dragon', weight = 1, stack = true, close = true, description = 'Applies an Astral Dragon label to a CVG slab',},
        ['cvg_label_celestial_gear'] = {          label = 'CVG Label - Celestial Gear', weight = 1, stack = true, close = true, description = 'Applies a Celestial Gear label to a CVG slab',},
        ['cvg_label_cosmic_phoenix'] = {          label = 'CVG Label - Cosmic Phoenix', weight = 1, stack = true, close = true, description = 'Applies a Cosmic Phoenix label to a CVG slab',},
        ['cvg_label_elemental_fusion'] = {        label = 'CVG Label - Elemental Fusion', weight = 1, stack = true, close = true, description = 'Applies an Elemental Fusion label to a CVG slab',},
        ['cvg_label_glacial_inferno'] = {         label = 'CVG Label - Glacial Inferno', weight = 1, stack = true, close = true, description = 'Applies a Glacial Inferno label to a CVG slab',},
        ['cvg_label_golden_valley'] = {           label = 'CVG Label - Golden Valley', weight = 1, stack = true, close = true, description = 'Applies a Golden Valley label to a CVG slab',},
        ['cvg_label_katana_street'] = {           label = 'CVG Label - Katana Street', weight = 1, stack = true, close = true, description = 'Applies a Katana Street label to a CVG slab',},
        ['cvg_label_mecha_hangar'] = {            label = 'CVG Label - Mecha Hangar', weight = 1, stack = true, close = true, description = 'Applies a Mecha Hangar label to a CVG slab',},
        ['cvg_label_nebula_drift'] = {            label = 'CVG Label - Nebula Drift', weight = 1, stack = true, close = true, description = 'Applies a Nebula Drift label to a CVG slab',},
        ['cvg_label_nebula_fox'] = {              label = 'CVG Label - Nebula Fox', weight = 1, stack = true, close = true, description = 'Applies a Nebula Fox label to a CVG slab',},
        ['cvg_label_sage_alignment'] = {          label = 'CVG Label - Sage Alignment', weight = 1, stack = true, close = true, description = 'Applies a Sage Alignment label to a CVG slab',},
        ['cvg_label_solaris_runes'] = {           label = 'CVG Label - Solaris Runes', weight = 1, stack = true, close = true, description = 'Applies a Solaris Runes label to a CVG slab',},
        ['cvg_label_winter_shrine'] = {           label = 'CVG Label - Winter Shrine', weight = 1, stack = true, close = true, description = 'Applies a Winter Shrine label to a CVG slab',},
        --######################################################  cvg grading items  ####################################################################################--
        ['empty_grading_case'] = {                    label = 'empty grading case', weight = 20, stack = true, close = true, description = 'Empty CVG-style case that stores a graded card',},
        ['grading_case'] = {                          label = 'Grading Case',      weight = 20,   stack = false,    close = true,    description = 'CVG-style case that stores a graded card',},
        ['cvg_binder'] = {                          label = 'CVG Binder',      weight = 20,   stack = false,    close = true,    description = 'CVG binder that stores graded slabs',},
        ['cvg_case_splitter'] = {                  label = 'CVG Case Splitter', weight = 10, stack = true, close = true, description = 'Splits open a CVG slab and returns the card',},
        --######################################################  _card  ####################################################################################--
        ['_card_pack'] = {                      label = ' Booster Pack', weight = 10, stack = true, close = true, description = 'Opens to reveal 6 random cards',},
        ['_card_booster_box'] = {               label = ' Booster Box', weight = 10, stack = true, close = true, description = ' booster box with 6 packs.',},
        ['_card_book'] = {                      label = ' Trading Card Book', weight = 10,   stack = false,    close = true,    description = 'Open to add your card to your collection.',},
        --######################################################  jg_warlords  ####################################################################################--
        ['jg_warlords_pack'] = {                      label = 'JG Warlords Booster Pack', weight = 10, stack = true, close = true, description = 'Opens to reveal 6 random cards',},
        ['jg_warlords_pack_mythic'] = {               label = 'JG Warlords Mythic Booster Pack', weight = 10, stack = true, close = true, description = 'Mythic booster pack, reveals 6 cards',},
        ['jg_warlords_pack_legendary'] = {            label = 'JG Warlords Legendary Booster Pack', weight = 10, stack = true, close = true, description = 'Legendary booster pack, reveals 6 cards',},
        ['jg_warlords_booster_box'] = {               label = 'JG Warlords Booster Box', weight = 10, stack = true, close = true, description = 'JG Warlords booster box with 6 packs.',},
        ['jg_warlords_booster_box_mythic'] = {        label = 'JG Warlords Mythic Booster Box', weight = 10, stack = true, close = true, description = 'JG Warlords Mythic booster box with Mythic 6 packs.',},
        ['jg_warlords_booster_box_legendary'] = {     label = 'JG Warlords Legendary Booster Box', weight = 10, stack = true, close = true, description = 'JG Warlords Legendary booster box with Legendary 6 packs.',},
        ['jg_warlords_book'] = {                      label = 'JG Warlords Trading Card Book', weight = 10,   stack = false,    close = true,    description = 'Open to add your card to your collection.',},
        --######################################################  jg_void_ether  ####################################################################################--
        ['jg_void_ether_pack'] = {                    label = 'JG Void Ether Booster Pack', weight = 10, stack = true, close = true, description = 'JG Void Ether booster pack, reveals 6 cards',},
        ['jg_void_ether_pack_mythic'] = {             label = 'JG Void Ether Mythic Booster Pack', weight = 10, stack = true, close = true, description = 'JG Void Ether Mythic booster pack, reveals 6 cards',},
        ['jg_void_ether_pack_legendary'] = {          label = 'JG Void Ether Legendary Booster Pack', weight = 10, stack = true, close = true, description = 'JG Void Ether Legendary booster pack, reveals 6 cards',},
        ['jg_void_ether_booster_box'] = {             label = 'JG Void Ether Booster Box', weight = 10, stack = true, close = true, description = 'JG Void Ether booster box with 6 packs.',},
        ['jg_void_ether_booster_box_mythic'] = {      label = 'JG Void Ether Mythic Booster Box', weight = 10, stack = true, close = true, description = 'JG Void Ether Mythic booster box with Mythic 6 packs.',},
        ['jg_void_ether_booster_box_legendary'] = {   label = 'JG Void Ether Legendary Booster Box', weight = 10, stack = true, close = true, description = 'JG Void Ether Legendary booster box with Legendary 6 packs.',},
        ['jg_void_ether_book'] = {                    label = 'JG Void Ether trading card book', weight = 10, stack = false, close = true, description = 'Open to add your card to your collection.',},    
        --######################################################  jg_shin_genesis  ####################################################################################--
        ['jg_shin_genesis_pack'] = {                  label = 'JG Shin Genesis Booster Pack', weight = 10, stack = true, close = true, description = 'Opens to reveal 6 random cards',},
        ['jg_shin_genesis_pack_mythic'] = {           label = 'JG Shin Genesis Mythic Booster Pack', weight = 10, stack = true, close = true, description = 'Mythic booster pack, reveals 6 cards',},
        ['jg_shin_genesis_pack_legendary'] = {        label = 'JG Shin Genesis Legendary Booster Pack', weight = 10, stack = true, close = true, description = 'legendary booster pack, reveals 6 cards',},
        ['jg_shin_genesis_booster_box'] = {           label = 'JG Shin Genesis Booster Box', weight = 10, stack = true, close = true, description = 'JG Shin Genesis booster box with 6 packs.',},
        ['jg_shin_genesis_booster_box_mythic'] = {    label = 'JG Shin Genesis Mythic Booster Box', weight = 10, stack = true, close = true, description = 'JG Shin Genesis booster box with 6 mythic packs.',},    
        ['jg_shin_genesis_booster_box_legendary'] = { label = 'JG Shin Genesis Legendary Booster Box', weight = 10, stack = true, close = true, description = 'JG Shin Genesis booster box with 6 legendary packs.',},
        ['jg_shin_genesis_book'] = {                  label = 'JG Shin Genesis trading card book', weight = 10, stack = false, close = true, description = 'Open to add your card to your collection.',},
        --######################################################  jg_sands_of_eternity  ####################################################################################--
        ['jg_sands_of_eternity_pack'] = {             label = 'JG Sands Of Eternity Booster Pack', weight = 10, stack = true, close = true, description = 'JG Sands Of Eternity booster pack, reveals 6 cards',},
        ['jg_sands_of_eternity_pack_mythic'] = {      label = 'JG Sands Of Eternity Mythic Booster Pack', weight = 10, stack = true, close = true, description = 'JG Sands Of Eternity Mythic booster pack, reveals 6 cards',},
        ['jg_sands_of_eternity_pack_legendary'] = {   label = 'JG Sands Of Eternity Legendary Booster Pack', weight = 10, stack = true, close = true, description = 'JG Sands Of Eternity Legendary booster pack, reveals 6 cards',},
        ['jg_sands_of_eternity_booster_box'] = {      label = 'JG Sands Of Eternity Booster Box', weight = 10, stack = true, close = true, description = 'JG Sands Of Eternity booster box with 6 packs.',},
        ['jg_sands_of_eternity_booster_box_mythic'] = { label = 'JG Sands Of Eternity Mythic Booster Box', weight = 10, stack = true, close = true, description = 'JG Sands Of Eternity Mythic booster box with Mythic 6 packs.',},
        ['jg_sands_of_eternity_booster_box_legendary'] = { label = 'JG Sands Of Eternity Legendary Booster Box', weight = 10, stack = true, close = true, description = 'JG Sands Of Eternity Legendary booster box with Legendary 6 packs.',},
        ['jg_sands_of_eternity_book'] = {             label = 'JG Sands Of Eternity trading card book', weight = 10, stack = false, close = true, description = 'Open to add your card to your collection.',},
        --######################################################  ammunation_elite  ####################################################################################--
        ['ammunation_elite_pack'] = {                 label = 'Ammunation Elite Booster Pack', weight = 10, stack = true, close = true, description = 'Ammunation Elite Booster Pack',},
        ['ammunation_elite_mythic_pack'] = {          label = 'Ammunation Elite Booster Pack Mythic', weight = 10, stack = true, close = true, description = 'Ammunation Elite Booster Pack Mythic',},
        ['ammunation_elite_legendary_pack'] = {       label = 'Ammunation Elite Booster Pack Legendary', weight = 10, stack = true, close = true, description = 'Ammunation Elite Booster Pack Legendary',},
        ['ammunation_elite_booster_box'] = {          label = 'Ammunation Elite Booster Box', weight = 10, stack = true, close = true, description = 'Ammunation Elite Booster Box',},  
        ['ammunation_elite_booster_box_mythic'] = {   label = 'Ammunation Elite Booster Box Mythic', weight = 10, stack = true, close = true, description = 'Ammunation Elite Booster Box Mythic',},
        ['ammunation_elite_booster_box_legendary'] = { label = 'Ammunation Elite Booster Box Legendary', weight = 10, stack = true, close = true, description = 'Ammunation Elite Booster Box Legendary',},
        ['ammunation_elite_book'] = {                 label = 'Ammunation Elite Book', weight = 10,   stack = true,     close = true,    description = 'Open to add your card to your collection.',},
        --######################################################  full_throttle  ####################################################################################--
        ['full_throttle_pack'] = {                    label = 'Full Throttle Booster Pack', weight = 10, stack = true, close = true, description = 'Full Throttle Booster Pack',},
        ['full_throttle_mythic_pack'] = {             label = 'Full Throttle Booster Pack Mythic', weight = 10, stack = true, close = true, description = 'Full Throttle Booster Pack Mythic',},
        ['full_throttle_legendary_pack'] = {          label = 'Full Throttle Booster Pack Legendary', weight = 10, stack = true, close = true, description = 'Full Throttle Booster Pack Legendary',},
        ['full_throttle_booster_box'] = {             label = 'Full Throttle Booster Box', weight = 10, stack = true, close = true, description = 'Full Throttle Booster Box',},
        ['full_throttle_booster_box_mythic'] = {      label = 'Full Throttle Booster Box Mythic', weight = 10, stack = true, close = true, description = 'Full Throttle Booster Box Mythic',},
        ['full_throttle_booster_box_legendary'] = {   label = 'Full Throttle Booster Box Legendary', weight = 10, stack = true, close = true, description = 'Full Throttle Booster Box Legendary',},
        ['full_throttle_book'] = {                    label = 'Full Throttle Book', weight = 10,    stack = true,     close = true,    description = 'Open to add your card to your collection.',},
        --######################################################  ls_legends  ####################################################################################--
        ['ls_legends_pack'] = {                       label = 'LS Legends Booster Pack', weight = 10, stack = true, close = true, description = 'LS Legends Booster Pack',},
        ['ls_legends_mythic_pack'] = {                label = 'LS Legends Mythic Pack', weight = 10, stack = true, close = true, description = 'LS Legends Mythic Pack',},
        ['ls_legends_legendary_pack'] = {             label = 'LS Legends Legendary Pack', weight = 10, stack = true, close = true, description = 'LS Legends Legendary Pack',},
        ['ls_legends_booster_box'] = {                label = 'LS Legends Booster Box', weight = 10, stack = true, close = true, description = 'LS Legends Booster Box',},
        ['ls_legends_booster_box_mythic'] = {         label = 'LS Legends Booster Box Mythic', weight = 10, stack = true, close = true, description = 'LS Legends Booster Box Mythic',},
        ['ls_legends_booster_box_legendary'] = {      label = 'LS Legends Booster Box Legendary', weight = 10, stack = true, close = true, description = 'LS Legends Booster Box Legendary',},
        ['ls_legends_book'] = {                       label = 'LS Legends Book',  weight = 10,    stack = true,     close = true,    description = 'Open to add your card to your collection.',},
        --######################################################  ls_landmark  ####################################################################################--
        ['ls_landmark_pack'] = {                      label = 'LS Landmark Booster Pack', weight = 10, stack = true, close = true, description = 'LS Landmark Booster Pack',},
        ['ls_landmark_mythic_pack'] = {               label = 'LS Landmark Mythic Pack', weight = 10, stack = true, close = true, description = 'LS Landmark Mythic Pack',},
        ['ls_landmark_legendary_pack'] = {            label = 'LS Landmark Legendary Pack', weight = 10, stack = true, close = true, description = 'LS Landmark Legendary Pack',},
        ['ls_landmark_booster_box'] = {               label = 'LS Landmark Booster Box', weight = 10, stack = true, close = true, description = 'LS Landmark Booster Box',},
        ['ls_landmark_booster_box_mythic'] = {        label = 'LS Landmark Booster Box Mythic', weight = 10, stack = true, close = true, description = 'LS Landmark Booster Box Mythic',},
        ['ls_landmark_booster_box_legendary'] = {     label = 'LS Landmark Booster Box Legendary', weight = 10, stack = true, close = true, description = 'LS Landmark Booster Box Legendary',},
        ['ls_landmark_book'] = {                      label = 'LS Landmark Book', weight = 10,    stack = true,     close = true,    description = 'Open to add your card to your collection.',},
        --######################################################  _card  ####################################################################################--
        ['card_worldwide'] = {         label = 'A Chance to Go Worldwide',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_almighty'] = {         label = 'Almighty Push',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_stars'] = {         label = 'Among the Stars',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_angel'] = {         label = 'Angel One Guardians',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_above'] = {         label = 'As Above Down Below',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_aura'] = {         label = 'Aura',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_baaaa'] = {         label = 'Baaaaa',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_bigt'] = {         label = 'Big T',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_boing'] = {         label = 'Boing',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_burger'] = {         label = 'Burger Boy',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_burning'] = {         label = 'Burning Son',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_chief'] = {         label = 'Chief James',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_compensation'] = {         label = 'Compensation Conversation',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_dark'] = {         label = 'Dark Storm',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_dusk'] = {         label = 'Dusk Til Dawn',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_ems'] = {         label = 'EMS on Top',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_final'] = {         label = 'Final Boss',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_grime'] = {         label = 'Grime Busters',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_gym'] = {         label = 'Gym Rat & Her Dumbbell',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_halal'] = {         label = 'Halal Highway Patrol',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_hold'] = {         label = 'Hold Me Like It Hurts',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_hunny'] = {         label = 'HunnyBunny',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_blue'] = {         label = 'Im so Blue',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_chi'] = {         label = 'Inner Chi',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_phase'] = {         label = 'It was Never a Phase',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_jack'] = {         label = 'Jack of All Trades',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_jear'] = {         label = 'JearBear',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_vibe'] = {         label = 'Just Vibe',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_deal'] = {         label = 'Kinda a Big Deal',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_kingpin'] = {         label = 'Kingpin',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_sasquatch'] = {         label = 'Lieutenant Sasquatch',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_flex'] = {         label = 'Lil Flex',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_luh'] = {         label = 'Luh U Mean It',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_wish'] = {         label = 'Make a Wish',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_myself'] = {         label = 'Me Myself & I',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_mistletoe'] = {         label = 'Mistletoe Mischief',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_moomuffin'] = {         label = 'Moomuffin Extraordinaire',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_mustache'] = {         label = 'Mustache Man',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_town'] = {         label = 'My Town',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_tots'] = {         label = 'NICETOTS',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_night'] = {         label = 'Night Watch',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_old'] = {         label = 'Old Man',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_case'] = {         label = 'On The Case',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_pink'] = {         label = 'Pink Hair Dont Care',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_pinky'] = {         label = 'Pinky',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_plomo'] = {         label = 'Plata O Plomo',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_pov'] = {         label = 'pov',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_proud'] = {         label = 'Proud Of You Son',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_raygun'] = {         label = 'RayGun',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_rest'] = {         label = 'Rest & Repair',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_roulette'] = {         label = 'Russian Roulette',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_sassy'] = {         label = 'Sassy Q 157 Hazel 0',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_shark'] = {         label = 'Shark Tale',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_silent'] = {         label = 'Silent Requiem',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_sin'] = {         label = 'Sin So Sweet',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_soup'] = {         label = 'Soup With a Side of ERP',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_frosty'] = {         label = 'Stay Frosty',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_sugar'] = {         label = 'Sugar & Spice',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_sweet'] = {         label = 'Sweet as a Peach',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_butterfly'] = {         label = 'The Butterfly Effect',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_frostys'] = {         label = 'The Frostys',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_high'] = {         label = 'The High Times',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_nose'] = {         label = 'The Nose Knows',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_nightshade'] = {         label = 'Nightshade',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_og'] = {         label = 'The OG',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_snack'] = {         label = 'The Snack Guardian',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_sun'] = {         label = 'The Gun Gods',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_welshman'] = {         label = 'The Welshman',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_biggs'] = {         label = 'This Town Aint Biggs Enough',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_thugs'] = {         label = 'Thugs',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_twilight'] = {         label = 'Twilight Bond',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_two'] = {         label = 'Two is Better than One',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_up'] = {         label = 'Up-Dog',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_vital'] = {         label = 'Vital Trio',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_red'] = {         label = 'Walking RED Flag',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_what'] = {         label = 'What to Do',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_whatever'] = {         label = 'Whatever U Want Here',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_wish_you'] = {         label = 'Wish You Were Her(e)',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_yin'] = {         label = 'Yin and Yang',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_super'] = {         label = 'The Super Bros',        weight = 10,    stack = false,    close = true,    description = '',},
        ['card_pato'] = {         label = 'El Pato',        weight = 10,    stack = false,    close = true,    description = '',},
        --######################################################  jg_warlords  ####################################################################################--
        ['card_aetherion'] = {         label = 'Aetherion',        weight = 10,    stack = false,    close = true,    description = 'Aetherion',},
        ['card_venom_burrower'] = {    label = 'Venom Burrower',   weight = 10,    stack = false,    close = true,    description = 'Venom Burrower',},
        ['card_dark_knight'] = {       label = 'Dark Knight',      weight = 10,    stack = false,    close = true,    description = 'Dark Knight',},
        ['card_toxic_hydra'] = {       label = 'Toxic Hydra',      weight = 10,    stack = false,    close = true,    description = 'Toxic Hydra',},
        ['card_gloom_dragon'] = {      label = 'Gloom Dragon',     weight = 10,    stack = false,    close = true,    description = 'Gloom Dragon',},
        ['card_steel_mauler'] = {      label = 'Steel Mauler',     weight = 10,    stack = false,    close = true,    description = 'Steel Mauler',},
        ['card_spirit_hornet'] = {     label = 'Spirit Hornet',    weight = 10,    stack = false,    close = true,    description = 'Spirit Hornet',},
        ['card_blight_harpy'] = {      label = 'Blight Harpy',     weight = 10,    stack = false,    close = true,    description = 'Blight Harpy',},
        ['card_thunder_gryphon'] = {   label = 'Thunder Gryphon',  weight = 10,    stack = false,    close = true,    description = 'Thunder Gryphon',},
        ['card_grimblight'] = {        label = 'Grimblight',       weight = 10,    stack = false,    close = true,    description = 'Grimblight',},
        ['card_plagueborn'] = {        label = 'Plagueborn',       weight = 10,    stack = false,    close = true,    description = 'Plagueborn',},
        ['card_soul_eater'] = {        label = 'Soul Eater',       weight = 10,    stack = false,    close = true,    description = 'Soul Eater',},
        ['card_frostclaw_ape'] = {     label = 'Frostclaw Ape',    weight = 10,    stack = false,    close = true,    description = 'Frostclaw Ape',},
        ['card_blazehoof'] = {         label = 'Blazehoof',        weight = 10,    stack = false,    close = true,    description = 'Blazehoof',},
        ['card_ashwalker'] = {         label = 'Ashwalker',        weight = 10,    stack = false,    close = true,    description = 'Ashwalker',},
        ['card_thunder_serpent'] = {   label = 'Thunder Serpent',  weight = 10,    stack = false,    close = true,    description = 'Thunder Serpent',},
        ['card_lightning_mantis'] = {  label = 'Lightning Mantis', weight = 10,    stack = false,    close = true,    description = 'Lightning Mantis',},
        ['card_quake_bison'] = {       label = 'Quake Bison',      weight = 10,    stack = false,    close = true,    description = 'Quake Bison',},
        ['card_earthshaker'] = {       label = 'Earthshaker',      weight = 10,    stack = false,    close = true,    description = 'Earthshaker',},
        ['card_ancient_one'] = {       label = 'Ancient One',      weight = 10,    stack = false,    close = true,    description = 'Ancient One',},
        ['card_arcane_wolf'] = {       label = 'Arcane Wolf',      weight = 10,    stack = false,    close = true,    description = 'Arcane Wolf',},
        ['card_dreadeye'] = {          label = 'Dreadeye',         weight = 10,    stack = false,    close = true,    description = 'Dreadeye',},
        ['card_voidborn'] = {          label = 'Voidborn',         weight = 10,    stack = false,    close = true,    description = 'Voidborn',},
        ['card_sand_ravager'] = {      label = 'Sand Ravager',     weight = 10,    stack = false,    close = true,    description = 'Sand Ravager',},
        ['card_phantom_sentry'] = {    label = 'Phantom Sentry',   weight = 10,    stack = false,    close = true,    description = 'Phantom Sentry',},
        ['card_soul_ripper'] = {       label = 'Soul Ripper',      weight = 10,    stack = false,    close = true,    description = 'Soul Ripper',},
        ['card_fire_kraken'] = {       label = 'Fire Kraken',      weight = 10,    stack = false,    close = true,    description = 'Fire Kraken',},
        ['card_granite_behemoth'] = {  label = 'Granite Behemoth', weight = 10,    stack = false,    close = true,    description = 'Granite Behemoth',},
        ['card_molten_reaper'] = {     label = 'Molten Reaper',    weight = 10,    stack = false,    close = true,    description = 'Molten Reaper',},
        ['card_night_howler'] = {      label = 'Night Howler',     weight = 10,    stack = false,    close = true,    description = 'Night Howler',},
        ['card_abyss_crawler'] = {     label = 'Abyss Crawler',    weight = 10,    stack = false,    close = true,    description = 'Abyss Crawler',},
        ['card_stormling_beast'] = {   label = 'Stormling Beast',  weight = 10,    stack = false,    close = true,    description = 'Stormling Beast',},
        ['card_dread_warden'] = {      label = 'Dread Warden',     weight = 10,    stack = false,    close = true,    description = 'Dread Warden',},
        ['card_storm_brute'] = {       label = 'Storm Brute',      weight = 10,    stack = false,    close = true,    description = 'Storm Brute',},
        ['card_storm_spirit'] = {      label = 'Storm Spirit',     weight = 10,    stack = false,    close = true,    description = 'Storm Spirit',},
        ['card_mist_leviathan'] = {    label = 'Mist Leviathan',   weight = 10,    stack = false,    close = true,    description = 'Mist Leviathan',},
        ['card_frost_golem'] = {       label = 'Frost Golem',      weight = 10,    stack = false,    close = true,    description = 'Frost Golem',},
        ['card_ash_hollow'] = {        label = 'Ash Hollow',       weight = 10,    stack = false,    close = true,    description = 'Ash Hollow',},
        ['card_iron_fang'] = {         label = 'Iron Fang',        weight = 10,    stack = false,    close = true,    description = 'Iron Fang',},
        ['card_shadow_marauder'] = {   label = 'Shadow Marauder',  weight = 10,    stack = false,    close = true,    description = 'Shadow Marauder',},
        ['card_void_revenant'] = {     label = 'Void Revenant',    weight = 10,    stack = false,    close = true,    description = 'Void Revenant',},
        ['card_cloud_watcher'] = {     label = 'Cloud Watcher',    weight = 10,    stack = false,    close = true,    description = 'Cloud Watcher',},
        ['card_ember_ogre'] = {        label = 'Ember Ogre',       weight = 10,    stack = false,    close = true,    description = 'Ember Ogre',},
        ['card_echo_shade'] = {        label = 'Echo Shade',       weight = 10,    stack = false,    close = true,    description = 'Echo Shade',},
        ['card_crystal_titan'] = {     label = 'Crystal Titan',    weight = 10,    stack = false,    close = true,    description = 'Crystal Titan',},
        ['card_chaos_spawn'] = {       label = 'Chaos Spawn',      weight = 10,    stack = false,    close = true,    description = 'Chaos Spawn',},
        ['card_chaos_gorgon'] = {      label = 'Chaos Gorgon',     weight = 10,    stack = false,    close = true,    description = 'Chaos Gorgon',},
        ['card_blood_talon'] = {       label = 'Blood Talon',      weight = 10,    stack = false,    close = true,    description = 'Blood Talon',},
        ['card_lunar_specter'] = {     label = 'Lunar Specter',    weight = 10,    stack = false,    close = true,    description = 'Lunar Specter',},
        ['card_dread_basilisk'] = {    label = 'Dread Basilisk',   weight = 10,    stack = false,    close = true,    description = 'Dread Basilisk',},
        ['card_venom_hunter'] = {      label = 'Venom Hunter',     weight = 10,    stack = false,    close = true,    description = 'Venom Hunter',},
        ['card_void_stalker'] = {      label = 'Void Stalker',     weight = 10,    stack = false,    close = true,    description = 'Void Stalker',},
        ['card_ember_wraith'] = {      label = 'Ember Wraith',     weight = 10,    stack = false,    close = true,    description = 'Ember Wraith',},
        ['card_wind_phantom'] = {      label = 'Wind Phantom',     weight = 10,    stack = false,    close = true,    description = 'Wind Phantom',},
        ['card_bone_colossus'] = {     label = 'Bone Colossus',    weight = 10,    stack = false,    close = true,    description = 'Bone Colossus',},
        ['card_flame_beast'] = {       label = 'Flame Beast',      weight = 10,    stack = false,    close = true,    description = 'Flame Beast',},
        ['card_valtherix'] = {         label = 'Valtherix',        weight = 10,    stack = false,    close = true,    description = 'A rare and powerful',},
        ['card_eldrephon'] = {         label = 'eldrephon',        weight = 10,    stack = false,    close = true,    description = 'An electric-type',},
        ['card_rootstride'] = {        label = 'rootstride',       weight = 10,    stack = false,    close = true,    description = 'A normal-type',},
        ['card_tektorrath'] = {        label = 'tektorrath',       weight = 10,    stack = false,    close = true,    description = 'A legendary psychic-type',},
        ['card_aetheron'] = {          label = 'Aetheron',         weight = 10,    stack = false,    close = true,    description = 'Mystic-wisp creature attuned to ether winds',},
        ['card_boltstride'] = {        label = 'Boltstride',       weight = 10,    stack = false,    close = true,    description = 'Swift skirmisher crackling with storm energy',},
        ['card_chronospecter'] = {     label = 'Chronospecter',    weight = 10,    stack = false,    close = true,    description = 'Phantom that bends time echoes',},
        ['card_cinderfang'] = {        label = 'Cinderfang',       weight = 10,    stack = false,    close = true,    description = 'Ash-born predator with ember talons',},
        ['card_crystalfrost'] = {      label = 'Crystalfrost',     weight = 10,    stack = false,    close = true,    description = 'Shards of winter focused into a sentinel',},
        ['card_hydrusk'] = {           label = 'Hydrusk',          weight = 10,    stack = false,    close = true,    description = 'Aquatic brute that cleaves tides',},
        ['card_ironclad_leviathan'] = {label = 'Ironclad Leviathan', weight = 10,   stack = false,    close = true,    description = 'Ocean colossus plated in steel',},
        ['card_mirthful_mimic'] = {    label = 'Mirthful Mimic',   weight = 10,    stack = false,    close = true,    description = 'Illusory trickster with cheerful guise',},
        ['card_shroomancer'] = {       label = 'Shroomancer',      weight = 10,    stack = false,    close = true,    description = 'Spore mage weaving fungal rites',},
        ['card_stormcoil'] = {         label = 'Stormcoil',        weight = 10,    stack = false,    close = true,    description = 'Thunder serpent coiling tempests',},
        ['card_sunscorch'] = {         label = 'Sunscorch',        weight = 10,    stack = false,    close = true,    description = 'Radiant predator with solar flare',},
        ['card_tanglevine'] = {        label = 'Tanglevine',       weight = 10,    stack = false,    close = true,    description = 'Vinebound guardian of wild groves',},
        ['card_terraklaw'] = {         label = 'Terraklaw',        weight = 10,    stack = false,    close = true,    description = 'Earth raptor forged by faultlines',},
        ['card_whisperwing'] = {       label = 'Whisperwing',      weight = 10,    stack = false,    close = true,    description = 'Silent courier of night breezes',},
        ['card_grizzlethorn'] = {      label = 'Grizzlethorn',     weight = 10,    stack = false,    close = true,    description = 'Grizzlethorn',},
        ['card_hollowmane'] = {        label = 'Hollowmane',       weight = 10,    stack = false,    close = true,    description = 'Hollowmane',},
        ['card_iron_warlock'] = {      label = 'Iron Warlock',     weight = 10,    stack = false,    close = true,    description = 'Iron Warlock',},
        ['card_glintfang'] = {         label = 'Glintfang',        weight = 10,    stack = false,    close = true,    description = 'Glintfang',},
        ['card_razorbloom'] = {        label = 'Razorbloom',       weight = 10,    stack = false,    close = true,    description = 'Razorbloom',},
        ['card_whisperling'] = {       label = 'Whisperling',      weight = 10,    stack = false,    close = true,    description = 'Whisperling',},
        ['card_moltencore'] = {        label = 'Moltencore',       weight = 10,    stack = false,    close = true,    description = 'Moltencore',},
        ['card_spectrix'] = {          label = 'Spectrix',         weight = 10,    stack = false,    close = true,    description = 'Spectrix',},
        ['card_lumigore'] = {          label = 'Lumigore',         weight = 10,    stack = false,    close = true,    description = 'Lumigore',},
        ['card_brackenshade'] = {      label = 'Brackenshade',     weight = 10,    stack = false,    close = true,    description = 'Brackenshade',},
        ['card_quillfin'] = {          label = 'Quillfin',         weight = 10,    stack = false,    close = true,    description = 'Quillfin',},
        ['card_thornax'] = {           label = 'Thornax',          weight = 10,    stack = false,    close = true,    description = 'Thornax',},
        ['card_nimbra'] = {            label = 'Nimbra',           weight = 10,    stack = false,    close = true,    description = 'Nimbra',},
        ['card_bone_collector'] = {    label = 'Bone Collector',   weight = 10,    stack = false,    close = true,    description = 'Bone Collector',},
        ['card_vexwing'] = {           label = 'Vexwing',          weight = 10,    stack = false,    close = true,    description = 'Vexwing',},
        ['card_crystide'] = {          label = 'Crystide',         weight = 10,    stack = false,    close = true,    description = 'Crystide',},
        ['card_fire_demon'] = {        label = 'Fire Demon',       weight = 10,    stack = false,    close = true,    description = 'Fire Demon',},
        ['card_void_walker'] = {       label = 'Void Walker',      weight = 10,    stack = false,    close = true,    description = 'Void Walker',},
        ['card_toxic_spitter'] = {     label = 'Toxic Spitter',    weight = 10,    stack = false,    close = true,    description = 'Toxic Spitter',},
        ['card_murklash'] = {          label = 'Murklash',         weight = 10,    stack = false,    close = true,    description = 'Murklash',},
        ['card_cursed_knight'] = {     label = 'Cursed Knight',    weight = 10,    stack = false,    close = true,    description = 'Cursed Knight',},
        ['card_zyphoon'] = {           label = 'Zyphoon',          weight = 10,    stack = false,    close = true,    description = 'Zyphoon',},
        ['card_stone_crusher'] = {     label = 'Stone Crusher',    weight = 10,    stack = false,    close = true,    description = 'Stone Crusher',},
        ['card_star_touched'] = {      label = 'Star Touched',     weight = 10,    stack = false,    close = true,    description = 'Star Touched',},
        ['card_voidcaller'] = {        label = 'Voidcaller',       weight = 10,    stack = false,    close = true,    description = 'Voidcaller',},
        ['card_mistweaver'] = {        label = 'Mistweaver',       weight = 10,    stack = false,    close = true,    description = 'Mistweaver',},
        ['card_storm_juggernaut'] = {  label = 'Storm Juggernaut', weight = 10,    stack = false,    close = true,    description = 'Storm Juggernaut',},
        ['card_the_chronos_wraith'] = {label = 'The Chronos Wraith', weight = 10,   stack = false,    close = true,    description = 'Original art card',},
        ['card_vortex_stalker'] = {    label = 'Vortex Stalker',   weight = 10,    stack = false,    close = true,    description = 'Original art card',},
        ['card_runebane_golem'] = {    label = 'Runebane Golem',   weight = 10,    stack = false,    close = true,    description = 'Original art card',},
        ['card_ignis_rex'] = {         label = 'Ignis Rex',        weight = 10,    stack = false,    close = true,    description = 'Original art card',},
        ['card_quillwing_harpy'] = {   label = 'Quillwing Harpy',  weight = 10,    stack = false,    close = true,    description = 'Original art card',},
        ['card_terrashear_hydra'] = {  label = 'Terrashear Hydra', weight = 10,    stack = false,    close = true,    description = 'Original art card',},
        ['card_gravemaw'] = {          label = 'Gravemaw',         weight = 10,    stack = false,    close = true,    description = 'Original art card',},
        ['card_shadow_silk'] = {       label = 'Shadow Silk',      weight = 10,    stack = false,    close = true,    description = 'Original art card',},
        ['card_fang'] = {              label = 'Fang',             weight = 10,    stack = false,    close = true,    description = 'Original art card',},
        --######################################################  jg_void_ether  ##################################################################################--
        ['card_flamewing_dragon'] = {  label = 'flamewing dragon', weight = 10,    stack = false,    close = true,    description = 'flamewing dragon',},
        ['card_ashspike_drake'] = {    label = 'ashspike drake',   weight = 10,    stack = false,    close = true,    description = 'ashspike drake',},
        ['card_cindergloom_fiend'] = { label = 'cindergloom fiend', weight = 10,   stack = false,    close = true,    description = 'cindergloom fiend',},
        ['card_bloodmaw_horror'] = {   label = 'bloodmaw horror',  weight = 10,    stack = false,    close = true,    description = 'bloodmaw horror',},
        ['card_bloodhorn_minotaur'] = {label = 'bloodhorn minotaur', weight = 10,   stack = false,    close = true,    description = 'bloodhorn minotaur',},
        ['card_darkspire_mage'] = {    label = 'darkspire mage',   weight = 10,    stack = false,    close = true,    description = 'darkspire mage',},
        ['card_chaos_drake'] = {       label = 'chaos drake',      weight = 10,    stack = false,    close = true,    description = 'chaos drake',},
        ['card_embermaw_hydra'] = {    label = 'embermaw hydra',   weight = 10,    stack = false,    close = true,    description = 'embermaw hydra',},
        ['card_obsidian_seer'] = {     label = 'obsidian seer',    weight = 10,    stack = false,    close = true,    description = 'obsidian seer',},
        ['card_fleshmire_beast'] = {   label = 'fleshmire beast',  weight = 10,    stack = false,    close = true,    description = 'fleshmire beast',},
        ['card_voidspawn_aberration'] = {label = 'voidspawn aberration', weight = 10, stack = false,   close = true,    description = 'voidspawn aberration',},
        ['card_soulweaver_sorceress'] = {label = 'soulweaver sorceress', weight = 10, stack = false,   close = true,    description = 'soulweaver sorceress',},
        ['card_nightshroud_hag'] = {   label = 'nightshroud hag',  weight = 10,    stack = false,    close = true,    description = 'nightshroud hag',},
        ['card_voidscream_specter'] = {label = 'voidscream specter', weight = 10,  stack = false,    close = true,    description = 'voidscream specter',},
        ['card_cindermaw_beast'] = {   label = 'cindermaw beast',  weight = 10,    stack = false,    close = true,    description = 'cindermaw beast',},
        ['card_voidmaw_beast'] = {     label = 'voidmaw beast',    weight = 10,    stack = false,    close = true,    description = 'voidmaw beast',},
        ['card_darkfang_beast'] = {    label = 'darkfang beast',   weight = 10,    stack = false,    close = true,    description = 'darkfang beast',},
        ['card_blazefang'] = {         label = 'blazefang',        weight = 10,    stack = false,    close = true,    description = 'blazefang',},
        ['card_ashclaw'] = {           label = 'ashclaw',          weight = 10,    stack = false,    close = true,    description = 'ashclaw',},
        ['card_shadowspike_predator'] = {label = 'shadowspike predator', weight = 10, stack = false,   close = true,    description = 'shadowspike predator',},
        ['card_ashenfang_dragon'] = {  label = 'ashenfang dragon', weight = 10,    stack = false,    close = true,    description = 'ashenfang dragon',},
        ['card_hunter_noble'] = {      label = 'hunter noble',     weight = 10,    stack = false,    close = true,    description = 'hunter noble',},
        ['card_cindergale'] = {        label = 'cindergale',       weight = 10,    stack = false,    close = true,    description = 'cindergale',},
        ['card_ancient_rall'] = {      label = 'ancient rall',     weight = 10,    stack = false,    close = true,    description = 'ancient rall',},
        ['card_shadowmancer'] = {      label = 'shadowmancer',     weight = 10,    stack = false,    close = true,    description = 'shadowmancer',},
        ['card_twilight_hag'] = {      label = 'twilight hag',     weight = 10,    stack = false,    close = true,    description = 'twilight hag',},
        ['card_seeall'] = {            label = 'seeall',           weight = 10,    stack = false,    close = true,    description = 'seeall',},
        ['card_ashfang_basilisk'] = {  label = 'ashfang basilisk', weight = 10,    stack = false,    close = true,    description = 'ashfang basilisk',},
        ['card_bonegrasp_horror'] = {  label = 'bonegrasp horror', weight = 10,    stack = false,    close = true,    description = 'bonegrasp horror',},
        ['card_boneclaw_horror'] = {   label = 'boneclaw horror',  weight = 10,    stack = false,    close = true,    description = 'boneclaw horror',},
        ['card_nightgore_abomination'] = {label = 'nightgore abomination', weight = 10, stack = false,  close = true,    description = 'nightgore abomination',},
        ['card_doomveil_phantom'] = {  label = 'doomveil phantom', weight = 10,    stack = false,    close = true,    description = 'doomveil phantom',},
        ['card_soulreaper_wraith'] = { label = 'soulreaper wraith', weight = 10,   stack = false,    close = true,    description = 'soulreaper wraith',},
        ['card_shadowclaw'] = {        label = 'shadowclaw',       weight = 10,    stack = false,    close = true,    description = 'shadowclaw',},
        ['card_bloodtalon_demon'] = {  label = 'bloodtalon demon', weight = 10,    stack = false,    close = true,    description = 'bloodtalon demon',},
        ['card_ashfang_ghoul'] = {     label = 'ashfang ghoul',    weight = 10,    stack = false,    close = true,    description = 'ashfang ghoul',},
        ['card_shadowfang_lycan'] = {  label = 'shadowfang lycan', weight = 10,    stack = false,    close = true,    description = 'shadowfang lycan',},
        ['card_nightfang_horror'] = {  label = 'nightfang horror', weight = 10,    stack = false,    close = true,    description = 'nightfang horror',},
        ['card_bonegloom_abomination'] = {label = 'bonegloom abomination', weight = 10, stack = false,  close = true,    description = 'bonegloom abomination',},
        ['card_darkshroud_wraith'] = { label = 'darkshroud wraith', weight = 10,   stack = false,    close = true,    description = 'darkshroud wraith',},
        ['card_battle_champion'] = {   label = 'battle champion',  weight = 10,    stack = false,    close = true,    description = 'battle champion',},
        ['card_scorchclaw'] = {        label = 'scorchclaw',       weight = 10,    stack = false,    close = true,    description = 'scorchclaw',},
        ['card_stormbeak'] = {         label = 'stormbeak',        weight = 10,    stack = false,    close = true,    description = 'stormbeak',},
        ['card_nightveil_witch'] = {   label = 'nightveil witch',  weight = 10,    stack = false,    close = true,    description = 'nightveil witch',},
        ['card_stormfang_monster'] = { label = 'stormfang monster', weight = 10,   stack = false,    close = true,    description = 'stormfang monster',},
        ['card_desert_sentinel'] = {   label = 'desert sentinel',  weight = 10,    stack = false,    close = true,    description = 'desert sentinel',},
        ['card_soulshade_sorcerer'] = {label = 'soulshade sorcerer', weight = 10,  stack = false,    close = true,    description = 'soulshade sorcerer',},
        ['card_stormmaw_abomination'] = {label = 'stormmaw abomination', weight = 10, stack = false,   close = true,    description = 'stormmaw abomination',},
        ['card_ashclaw_behemoth'] = {  label = 'ashclaw behemoth', weight = 10,    stack = false,    close = true,    description = 'ashclaw behemoth',},
        ['card_shadowmaw_horror'] = {  label = 'shadowmaw horror', weight = 10,    stack = false,    close = true,    description = 'shadowmaw horror',},
        ['card_soulbloom_wizard'] = {  label = 'soulbloom wizard', weight = 10,    stack = false,    close = true,    description = 'soulbloom wizard',},
        ['card_voidfeather_specter'] = {label = 'voidfeather specter', weight = 10, stack = false,   close = true,    description = 'voidfeather specter',},
        ['card_cinderveil_witch'] = {  label = 'cinderveil witch', weight = 10,    stack = false,    close = true,    description = 'cinderveil witch',},
        ['card_ironveil_witch'] = {    label = 'ironveil witch',   weight = 10,    stack = false,    close = true,    description = 'ironveil witch',},
        ['card_noble_guardian'] = {    label = 'noble guardian',   weight = 10,    stack = false,    close = true,    description = 'noble guardian',},
        ['card_ironhide_colossus'] = { label = 'ironhide colossus', weight = 10,   stack = false,    close = true,    description = 'ironhide colossus',},
        ['card_gravefang_specter'] = { label = 'gravefang specter', weight = 10,   stack = false,    close = true,    description = 'gravefang specter',},
        ['card_soulfang_wraith'] = {   label = 'soulfang wraith',  weight = 10,    stack = false,    close = true,    description = 'soulfang wraith',},
        ['card_scorchmaw_horror'] = {  label = 'scorchmaw horror', weight = 10,    stack = false,    close = true,    description = 'scorchmaw horror',},
        ['card_iron_vigilant'] = {     label = 'iron vigilant',    weight = 10,    stack = false,    close = true,    description = 'iron vigilant',},
        ['card_shadowwing_horror'] = { label = 'shadowwing horror', weight = 10,   stack = false,    close = true,    description = 'shadowwing horror',},
        ['card_bloodbeak_fiend'] = {   label = 'bloodbeak fiend',  weight = 10,    stack = false,    close = true,    description = 'bloodbeak fiend',},
        ['card_frostbloom_enchantress'] = {label = 'frostbloom enchantress', weight = 10, stack = false, close = true,    description = 'frostbloom enchantress',},
        ['card_stormveil_sorcerer'] = {label = 'stormveil sorcerer', weight = 10,  stack = false,    close = true,    description = 'stormveil sorcerer',},
        ['card_blightthorn_witch'] = { label = 'blightthorn witch', weight = 10,    stack = false,    close = true,    description = 'blightthorn witch',},
        ['card_ironscale'] = {         label = 'ironscale',        weight = 10,    stack = false,    close = true,    description = 'ironscale',},
        ['card_iron_sigils_wizard'] = {label = 'iron sigils wizard', weight = 10,  stack = false,    close = true,    description = 'iron sigils wizard',},
        ['card_bloodshade_wizard'] = { label = 'bloodshade wizard', weight = 10,   stack = false,    close = true,    description = 'bloodshade wizard',},
        ['card_venomclaw_abomination'] = {label = 'venomclaw abomination', weight = 10, stack = false, close = true,    description = 'venomclaw abomination',},
        ['card_ironwing_gargant'] = {  label = 'ironwing gargant', weight = 10,    stack = false,    close = true,    description = 'ironwing gargant',},
        ['card_emberlash_drake'] = {   label = 'emberlash drake',  weight = 10,    stack = false,    close = true,    description = 'emberlash drake',},
        ['card_ashfeather'] = {        label = 'ashfeather',       weight = 10,    stack = false,    close = true,    description = 'ashfeather',},
        ['card_sable_coven_witch'] = { label = 'sable coven witch', weight = 10,   stack = false,    close = true,    description = 'sable coven witch',},
        ['card_wizard_of_broken_time'] = {label = 'wizard of broken time', weight = 10, stack = false, close = true,    description = 'wizard of broken time',},
        ['card_gravewing'] = {         label = 'gravewing',        weight = 10,    stack = false,    close = true,    description = 'gravewing',},
        ['card_wizard_of_frozen_runes'] = {label = 'wizard of frozen runes', weight = 10, stack = false, close = true,    description = 'wizard of frozen runes',},
        ['card_darktalon'] = {         label = 'darktalon',        weight = 10,    stack = false,    close = true,    description = 'darktalon',},
        ['card_gold_armorer'] = {      label = 'gold armorer',     weight = 10,    stack = false,    close = true,    description = 'gold armorer',},
        ['card_arcane_relic_wizard'] = {label = 'arcane relic wizard', weight = 10, stack = false,   close = true,    description = 'arcane relic wizard',},
        ['card_soulwing'] = {          label = 'soulwing',         weight = 10,    stack = false,    close = true,    description = 'soulwing',},
        ['card_cryptfire_wizard'] = {  label = 'cryptfire wizard', weight = 10,    stack = false,    close = true,    description = 'cryptfire wizard',},
        ['card_ashen_tome_wizard'] = { label = 'ashen tome wizard', weight = 10,   stack = false,    close = true,    description = 'ashen tome wizard',},
        ['card_frostscar_wyrm'] = {    label = 'frostscar wyrm',   weight = 10,    stack = false,    close = true,    description = 'frostscar wyrm',},
        ['card_moonseer'] = {          label = 'moonseer',         weight = 10,    stack = false,    close = true,    description = 'moonseer',},
        ['card_spellscar_wizard'] = {  label = 'spellscar wizard', weight = 10,    stack = false,    close = true,    description = 'spellscar wizard',},
        ['card_starfall_wizard'] = {   label = 'starfall wizard',  weight = 10,    stack = false,    close = true,    description = 'starfall wizard',},
        ['card_grim_archive_wizard'] = {label = 'grim archive wizard', weight = 10, stack = false,   close = true,    description = 'grim archive wizard',},
        ['card_gravebloom_witch'] = {  label = 'gravebloom witch', weight = 10,    stack = false,    close = true,    description = 'gravebloom witch',},
        ['card_voidbinding_wizard'] = {label = 'voidbinding wizard', weight = 10,  stack = false,    close = true,    description = 'voidbinding wizard',},
        ['card_thorncurse_witch'] = {  label = 'thorncurse witch', weight = 10,    stack = false,    close = true,    description = 'thorncurse witch',},
        ['card_cinderbone_witch'] = {  label = 'cinderbone witch', weight = 10,    stack = false,    close = true,    description = 'cinderbone witch',},
        ['card_moonrot_witch'] = {     label = 'moonrot witch',    weight = 10,    stack = false,    close = true,    description = 'moonrot witch',},
        ['card_nighthex_witch'] = {    label = 'nighthex witch',   weight = 10,    stack = false,    close = true,    description = 'nighthex witch',},
        ['card_cryptmist_specter'] = { label = 'cryptmist specter', weight = 10,   stack = false,    close = true,    description = 'cryptmist specter',},
        ['card_shadowflame_elemental'] = {label = 'shadowflame elemental', weight = 10, stack = false, close = true,    description = 'shadowflame elemental',},
        ['card_bloodveil_witch'] = {   label = 'bloodveil witch',  weight = 10,    stack = false,    close = true,    description = 'bloodveil witch',},
        ['card_star_noble'] = {        label = 'star noble',       weight = 10,    stack = false,    close = true,    description = 'star noble',},
        ['card_sunken_prince'] = {     label = 'sunken prince',    weight = 10,    stack = false,    close = true,    description = 'sunken prince',},
        ['card_soulmaw_wraith'] = {    label = 'soulmaw wraith',   weight = 10,    stack = false,    close = true,    description = 'soulmaw wraith',},
        ['card_voidcaller_witch'] = {  label = 'voidcaller witch', weight = 10,    stack = false,    close = true,    description = 'voidcaller witch',},
        ['card_cindercloak_wizard'] = {label = 'cindercloak wizard', weight = 10,  stack = false,    close = true,    description = 'cindercloak wizard',},
        ['card_emberflame_witch'] = {  label = 'emberflame witch', weight = 10,    stack = false,    close = true,    description = 'emberflame witch',},
        ['card_moon_lancer'] = {       label = 'moon lancer',      weight = 10,    stack = false,    close = true,    description = 'moon lancer',},
        ['card_fallen_scribe'] = {     label = 'fallen scribe',    weight = 10,    stack = false,    close = true,    description = 'fallen scribe',},
        ['card_dreadbloom_witch'] = {  label = 'dreadbloom witch', weight = 10,    stack = false,    close = true,    description = 'dreadbloom witch',},
        ['card_gravewhisper'] = {      label = 'gravewhisper',     weight = 10,    stack = false,    close = true,    description = 'gravewhisper',},
        ['card_high_priest'] = {       label = 'high priest',      weight = 10,    stack = false,    close = true,    description = 'high priest',},
        ['card_pharaoh_ruler'] = {     label = 'pharaoh ruler',    weight = 10,    stack = false,    close = true,    description = 'pharaoh ruler',},
        ['card_flameveil_witch'] = {   label = 'flameveil witch',  weight = 10,    stack = false,    close = true,    description = 'flameveil witch',},
        ['card_soulveil_witch'] = {    label = 'soulveil witch',   weight = 10,    stack = false,    close = true,    description = 'soulveil witch',},
        ['card_bloodrot_witch'] = {    label = 'bloodrot witch',   weight = 10,    stack = false,    close = true,    description = 'bloodrot witch',},
        ['card_nightgloom_witch'] = {  label = 'nightgloom witch', weight = 10,    stack = false,    close = true,    description = 'nightgloom witch',},
        ['card_shadowbloom_witch'] = { label = 'shadowbloom witch', weight = 10,   stack = false,    close = true,    description = 'shadowbloom witch',},
        ['card_cryptveil_witch'] = {   label = 'cryptveil witch',  weight = 10,    stack = false,    close = true,    description = 'cryptveil witch',},
        ['card_frostbane_sorcerer'] = {label = 'frostbane sorcerer', weight = 10,  stack = false,    close = true,    description = 'frostbane sorcerer',},
        ['card_stormbinder'] = {       label = 'stormbinder',      weight = 10,    stack = false,    close = true,    description = 'stormbinder',},
        ['card_ashen_circle_witch'] = {label = 'ashen circle witch', weight = 10,  stack = false,    close = true,    description = 'ashen circle witch',},
        ['card_scorchtome'] = {        label = 'scorchtome',       weight = 10,    stack = false,    close = true,    description = 'scorchtome',},
        ['card_voidveil_witch'] = {    label = 'voidveil witch',   weight = 10,    stack = false,    close = true,    description = 'voidveil witch',},
        ['card_dark_archenemy'] = {    label = 'dark archenemy',   weight = 10,    stack = false,    close = true,    description = 'dark archenemy',},
        --######################################################  jg_shin_genesis  ################################################################################--
        ['card_android_aria_v3'] = {   label = 'Android Aria V3',   weight = 10,    stack = false,    close = true,    description = 'Android Aria V3',},
        ['card_android_final_form'] = {label = 'Android Final Form', weight = 10,   stack = false,    close = true,    description = 'Android Final Form',},
        ['card_android_izumi_x'] = {   label = 'Android Izumi X',   weight = 10,    stack = false,    close = true,    description = 'Android Izumi X',},
        ['card_android_jin_model_s'] = {label = 'Android Jin Model S', weight = 10, stack = false,    close = true,    description = 'Android Jin Model S',},
        ['card_android_kaya_flow'] = { label = 'Android Kaya Flow', weight = 10,    stack = false,    close = true,    description = 'Android Kaya Flow',},
        ['card_android_natsu_g'] = {   label = 'Android Natsu G',   weight = 10,    stack = false,    close = true,    description = 'Android Natsu G',},
        ['card_android_t_80_girl'] = { label = 'Android T-80 Girl', weight = 10,    stack = false,    close = true,    description = 'Android T-80 Girl',},
        ['card_android_unit_99'] = {   label = 'Android Unit 99',   weight = 10,    stack = false,    close = true,    description = 'Android Unit 99',},
        ['card_aoi_vector_girl'] = {   label = 'Aoi Vector Girl',   weight = 10,    stack = false,    close = true,    description = 'Aoi Vector Girl',},
        ['card_asuka_saber_vessel'] = {label = 'Asuka Saber Vessel', weight = 10,   stack = false,    close = true,    description = 'Asuka Saber Vessel',},
        ['card_ayaka_armor_angel'] = { label = 'Ayaka Armor Angel', weight = 10,    stack = false,    close = true,    description = 'Ayaka Armor Angel',},
        ['card_chihiro_cradle_pilot'] = {label = 'Chihiro Cradle Pilot', weight = 10, stack = false,   close = true,    description = 'Chihiro Cradle Pilot',},
        ['card_cyborg_benji_blast'] = {label = 'Cyborg Benji Blast', weight = 10,   stack = false,    close = true,    description = 'Cyborg Benji Blast',},
        ['card_cyborg_daisuke_x'] = {  label = 'Cyborg Daisuke X',  weight = 10,    stack = false,    close = true,    description = 'Cyborg Daisuke X',},
        ['card_cyborg_goro_tank'] = {  label = 'Cyborg Goro Tank',  weight = 10,    stack = false,    close = true,    description = 'Cyborg Goro Tank',},
        ['card_cyborg_kenji_prime'] = {label = 'Cyborg Kenji Prime', weight = 10,   stack = false,    close = true,    description = 'Cyborg Kenji Prime',},
        ['card_cyborg_raiden_v'] = {   label = 'Cyborg Raiden V',   weight = 10,    stack = false,    close = true,    description = 'Cyborg Raiden V',},
        ['card_cyborg_zane_rogue'] = { label = 'Cyborg Zane Rogue', weight = 10,    stack = false,    close = true,    description = 'Cyborg Zane Rogue',},
        ['card_daichi_gravity_king'] = {label = 'Daichi Gravity King', weight = 10, stack = false,    close = true,    description = 'Daichi Gravity King',},
        ['card_eri_plasma_witch'] = {  label = 'Eri Plasma Witch',  weight = 10,    stack = false,    close = true,    description = 'Eri Plasma Witch',},
        ['card_fuka_frost_android'] = {label = 'Fuka Frost Android', weight = 10,   stack = false,    close = true,    description = 'Fuka Frost Android',},
        ['card_gaku_ground_zero'] = {  label = 'Gaku Ground Zero',  weight = 10,    stack = false,    close = true,    description = 'Gaku Ground Zero',},
        ['card_gen_cortex_crusher'] = {label = 'Gen Cortex Crusher', weight = 10,   stack = false,    close = true,    description = 'Gen Cortex Crusher',},
        ['card_genesis_eve_girl'] = {  label = 'Genesis Eve Girl',  weight = 10,    stack = false,    close = true,    description = 'Genesis Eve Girl',},
        ['card_hana_neon_sniper'] = {  label = 'Hana Neon Sniper',  weight = 10,    stack = false,    close = true,    description = 'Hana Neon Sniper',},
        ['card_haru_wire_walker'] = {  label = 'Haru Wire Walker',  weight = 10,    stack = false,    close = true,    description = 'Haru Wire Walker',},
        ['card_hikari_light_speed'] = {label = 'Hikari Light Speed', weight = 10,   stack = false,    close = true,    description = 'Hikari Light Speed',},
        ['card_hina_echo_dancer'] = {  label = 'Hina Echo Dancer',  weight = 10,    stack = false,    close = true,    description = 'Hina Echo Dancer',},
        ['card_hiro_bolt_mechanic'] = {label = 'Hiro Bolt Mechanic', weight = 10,   stack = false,    close = true,    description = 'Hiro Bolt Mechanic',},
        ['card_ichiro_signal_lost'] = {label = 'Ichiro Signal Lost', weight = 10,   stack = false,    close = true,    description = 'Ichiro Signal Lost',},
        ['card_itsuki_forest_hacker'] = {label = 'Itsuki Forest Hacker', weight = 10, stack = false,  close = true,    description = 'Itsuki Forest Hacker',},
        ['card_izumi_neon_assassin'] = {label = 'Izumi Neon Assassin', weight = 10,  stack = false,    close = true,    description = 'Izumi Neon Assassin',},
        ['card_jin_iron_blood'] = {    label = 'Jin Iron Blood',    weight = 10,    stack = false,    close = true,    description = 'Jin Iron Blood',},
        ['card_kaito_storm_rider'] = { label = 'Kaito Storm Rider', weight = 10,    stack = false,    close = true,    description = 'Kaito Storm Rider',},
        ['card_karin_spark_medic'] = { label = 'Karin Spark Medic', weight = 10,    stack = false,    close = true,    description = 'Karin Spark Medic',},
        ['card_keiko_wire_puppet'] = { label = 'Keiko Wire Puppet', weight = 10,    stack = false,    close = true,    description = 'Keiko Wire Puppet',},
        ['card_ken_carbon_fist'] = {   label = 'Ken Carbon Fist',   weight = 10,    stack = false,    close = true,    description = 'Ken Carbon Fist',},
        ['card_kenshin_neo_samurai'] = {label = 'Kenshin Neo Samurai', weight = 10,  stack = false,    close = true,    description = 'Kenshin Neo Samurai',},
        ['card_kira_blade_dancer'] = { label = 'Kira Blade Dancer', weight = 10,    stack = false,    close = true,    description = 'Kira Blade Dancer',},
        ['card_koharu_glitch_girl'] = {label = 'Koharu Glitch Girl', weight = 10,   stack = false,    close = true,    description = 'Koharu Glitch Girl',},
        ['card_kouta_drift_king'] = {  label = 'Kouta Drift King',  weight = 10,    stack = false,    close = true,    description = 'Kouta Drift King',},
        ['card_kyosuke_void_walker'] = {label = 'Kyosuke Void Walker', weight = 10,  stack = false,    close = true,    description = 'Kyosuke Void Walker',},
        ['card_last_hope_aria'] = {    label = 'Last Hope Aria',    weight = 10,    stack = false,    close = true,    description = 'Last Hope Aria',},
        ['card_legendary_yuki_blade'] = {label = 'Legendary Yuki Blade', weight = 10, stack = false,   close = true,    description = 'Legendary Yuki Blade',},
        ['card_luna_ghost_pilot'] = {  label = 'Luna Ghost Pilot',  weight = 10,    stack = false,    close = true,    description = 'Luna Ghost Pilot',},
        ['card_mai_titanium_rose'] = { label = 'Mai Titanium Rose', weight = 10,    stack = false,    close = true,    description = 'Mai Titanium Rose',},
        ['card_makoto_justice_bot'] = {label = 'Makoto Justice Bot', weight = 10,   stack = false,    close = true,    description = 'Makoto Justice Bot',},
        ['card_masaru_heavy_metal'] = {label = 'Masaru Heavy Metal', weight = 10,   stack = false,    close = true,    description = 'Masaru Heavy Metal',},
        ['card_mecha_dojo_master'] = { label = 'Mecha Dojo Master', weight = 10,    stack = false,    close = true,    description = 'Mecha Dojo Master',},
        ['card_mecha_kensei_g'] = {    label = 'Mecha Kensei G',    weight = 10,    stack = false,    close = true,    description = 'Mecha Kensei G',},
        ['card_mecha_maid_unit_1'] = { label = 'Mecha Maid Unit 1', weight = 10,    stack = false,    close = true,    description = 'Mecha Maid Unit 1',},
        ['card_mecha_sentry_m_2'] = {  label = 'Mecha Sentry M 2',  weight = 10,    stack = false,    close = true,    description = 'Mecha Sentry M 2',},
        ['card_mika_data_runner'] = {  label = 'Mika Data Runner',  weight = 10,    stack = false,    close = true,    description = 'Mika Data Runner',},
        ['card_minato_harbor_guard'] = {label = 'Minato Harbor Guard', weight = 10,  stack = false,    close = true,    description = 'Minato Harbor Guard',},
        ['card_misaki_laser_eye'] = {  label = 'Misaki Laser Eye',  weight = 10,    stack = false,    close = true,    description = 'Misaki Laser Eye',},
        ['card_miyuu_mirror_mask'] = { label = 'Miyuu Mirror Mask', weight = 10,    stack = false,    close = true,    description = 'Miyuu Mirror Mask',},
        ['card_momo_binary_brawler'] = {label = 'Momo Binary Brawler', weight = 10,  stack = false,    close = true,    description = 'Momo Binary Brawler',},
        ['card_nanami_nano_slayer'] = {label = 'Nanami Nano Slayer', weight = 10,   stack = false,    close = true,    description = 'Nanami Nano Slayer',},
        ['card_nao_silicon_heart'] = { label = 'Nao Silicon Heart', weight = 10,    stack = false,    close = true,    description = 'Nao Silicon Heart',},
        ['card_nozomi_solar_soul'] = { label = 'Nozomi Solar Soul', weight = 10,    stack = false,    close = true,    description = 'Nozomi Solar Soul',},
        ['card_overlord_mecha_saki'] = {label = 'Overlord Mecha Saki', weight = 10,  stack = false,    close = true,    description = 'Overlord Mecha Saki',},
        ['card_prototype_zero_boy'] = {label = 'Prototype Zero Boy', weight = 10,   stack = false,    close = true,    description = 'Prototype Zero Boy',},
        ['card_rei_system_proxy'] = {  label = 'Rei System Proxy',  weight = 10,    stack = false,    close = true,    description = 'Rei System Proxy',},
        ['card_ren_cyber_shinobi'] = { label = 'Ren Cyber Shinobi', weight = 10,    stack = false,    close = true,    description = 'Ren Cyber Shinobi',},
        ['card_rika_chrome_queen'] = { label = 'Rika Chrome Queen', weight = 10,    stack = false,    close = true,    description = 'Rika Chrome Queen',},
        ['card_rin_techno_geisha'] = { label = 'Rin Techno Geisha', weight = 10,    stack = false,    close = true,    description = 'Rin Techno Geisha',},
        ['card_rina_metal_soul'] = {  label = 'Rina Metal Soul',   weight = 10,    stack = false,    close = true,    description = 'Rina Metal Soul',},
        ['card_ritsuko_radar_girl'] = {label = 'Ritsuko Radar Girl', weight = 10,   stack = false,    close = true,    description = 'Ritsuko Radar Girl',},
        ['card_ryota_static_sword'] = {label = 'Ryota Static Sword', weight = 10,   stack = false,    close = true,    description = 'Ryota Static Sword',},
        ['card_ryu_street_warlord'] = {label = 'Ryu Street Warlord', weight = 10,   stack = false,    close = true,    description = 'Ryu Street Warlord',},
        ['card_ryusei_comet_crasher'] = {label = 'Ryusei Comet Crasher', weight = 10, stack = false,   close = true,    description = 'Ryusei Comet Crasher',},
        ['card_ryuu_dragon_hybrid'] = {label = 'Ryuu Dragon Hybrid', weight = 10,   stack = false,    close = true,    description = 'Ryuu Dragon Hybrid',},
        ['card_sae_circuit_seeker'] = {label = 'Sae Circuit Seeker', weight = 10,   stack = false,    close = true,    description = 'Sae Circuit Seeker',},
        ['card_sakura_cyber_vixen'] = {label = 'Sakura Cyber Vixen', weight = 10,   stack = false,    close = true,    description = 'Sakura Cyber Vixen',},
        ['card_satoshi_code_breaker'] = {label = 'Satoshi Code Breaker', weight = 10, stack = false,   close = true,    description = 'Satoshi Code Breaker',},
        ['card_sayuri_neon_ghost'] = { label = 'Sayuri Neon Ghost', weight = 10,    stack = false,    close = true,    description = 'Sayuri Neon Ghost',},
        ['card_shadow_council_ren'] = {label = 'Shadow Council Ren', weight = 10,   stack = false,    close = true,    description = 'Shadow Council Ren',},
        ['card_shin_genesis_alpha_boy'] = {label = 'Shin Genesis Alpha Boy', weight = 10, stack = false, close = true,    description = 'Shin Genesis Alpha Boy',},
        ['card_shin_genesis_warlord'] = {label = 'Shin Genesis Warlord', weight = 10, stack = false,  close = true,    description = 'Shin Genesis Warlord',},
        ['card_shizuku_water_wire'] = {label = 'Shizuku Water Wire', weight = 10,   stack = false,    close = true,    description = 'Shizuku Water Wire',},
        ['card_sho_vortex_pilot'] = {  label = 'Sho Vortex Pilot',  weight = 10,    stack = false,    close = true,    description = 'Sho Vortex Pilot',},
        ['card_shun_flash_rebel'] = {  label = 'Shun Flash Rebel',  weight = 10,    stack = false,    close = true,    description = 'Shun Flash Rebel',},
        ['card_sora_plasma_princess'] = {label = 'Sora Plasma Princess', weight = 10, stack = false,  close = true,    description = 'Sora Plasma Princess',},
        ['card_sora_sky_stalker'] = {  label = 'Sora Sky Stalker',  weight = 10,    stack = false,    close = true,    description = 'Sora Sky Stalker',},
        ['card_sota_ransom_boy'] = {   label = 'Sota Ransom Boy',   weight = 10,    stack = false,    close = true,    description = 'Sota Ransom Boy',},
        ['card_taiga_tiger_tech'] = {  label = 'Taiga Tiger Tech',  weight = 10,    stack = false,    close = true,    description = 'Taiga Tiger Tech',},
        ['card_takumi_tech_monk'] = {  label = 'Takumi Tech Monk',  weight = 10,    stack = false,    close = true,    description = 'Takumi Tech Monk',},
        ['card_taro_scrap_dealer'] = { label = 'Taro Scrap Dealer', weight = 10,    stack = false,    close = true,    description = 'Taro Scrap Dealer',},
        ['card_the_jg_prototype'] = {  label = 'The JG Prototype',  weight = 10,    stack = false,    close = true,    description = 'The JG Prototype',},
        ['card_the_shin_original_boy'] = {label = 'The Shin Original Boy', weight = 10, stack = false, close = true,    description = 'The Shin Original Boy',},
        ['card_toshi_gear_shifter'] = {label = 'Toshi Gear Shifter', weight = 10,   stack = false,    close = true,    description = 'Toshi Gear Shifter',},
        ['card_tsubasa_wing_unit'] = { label = 'Tsubasa Wing Unit', weight = 10,    stack = false,    close = true,    description = 'Tsubasa Wing Unit',},
        ['card_ultimate_shin_boy'] = { label = 'Ultimate Shin Boy', weight = 10,    stack = false,    close = true,    description = 'Ultimate Shin Boy',},
        ['card_unit_7_guardian'] = {   label = 'Unit 7 Guardian',   weight = 10,    stack = false,    close = true,    description = 'Unit 7 Guardian',},
        ['card_unit_alpha_tactician'] = {label = 'Unit Alpha Tactician', weight = 10, stack = false,  close = true,    description = 'Unit Alpha Tactician',},
        ['card_unit_delta_heavy'] = {  label = 'Unit Delta Heavy',  weight = 10,    stack = false,    close = true,    description = 'Unit Delta Heavy',},
        ['card_unit_gamma_sniper'] = {  label = 'Unit Gamma Sniper', weight = 10,    stack = false,    close = true,    description = 'Unit Gamma Sniper',},
        ['card_unit_iota_infiltrator'] = {label = 'Unit Iota Infiltrator', weight = 10, stack = false, close = true,    description = 'Unit Iota Infiltrator',},
        ['card_unit_kappa_hunter'] = { label = 'Unit Kappa Hunter', weight = 10,    stack = false,    close = true,    description = 'Unit Kappa Hunter',},
        ['card_unit_lambda_leader'] = {label = 'Unit Lambda Leader', weight = 10,   stack = false,    close = true,    description = 'Unit Lambda Leader',},
        ['card_unit_mu_executioner'] = {label = 'Unit Mu Executioner', weight = 10,  stack = false,    close = true,    description = 'Unit Mu Executioner',},
        ['card_unit_nyx_shadow_girl'] = {label = 'Unit Nyx Shadow Girl', weight = 10, stack = false,  close = true,    description = 'Unit Nyx Shadow Girl',},
        ['card_unit_omega_slayer'] = { label = 'Unit Omega Slayer', weight = 10,    stack = false,    close = true,    description = 'Unit Omega Slayer',},
        ['card_unit_sigma_sentry'] = { label = 'Unit Sigma Sentry', weight = 10,    stack = false,    close = true,    description = 'Unit Sigma Sentry',},
        ['card_unit_theta_ghost'] = {  label = 'Unit Theta Ghost',  weight = 10,    stack = false,    close = true,    description = 'Unit Theta Ghost',},
        ['card_unit_zeta_breaker'] = { label = 'Unit Zeta Breaker', weight = 10,    stack = false,    close = true,    description = 'Unit Zeta Breaker',},
        ['card_yuki_blade_daughter'] = {label = 'Yuki Blade Daughter', weight = 10, stack = false,   close = true,    description = 'Yuki Blade Daughter',},
        ['card_yumi_pulse_archer'] = { label = 'Yumi Pulse Archer', weight = 10,    stack = false,    close = true,    description = 'Yumi Pulse Archer',},
        ['card_yuna_core_breaker'] = { label = 'Yuna Core Breaker', weight = 10,    stack = false,    close = true,    description = 'Yuna Core Breaker',},
        ['card_yuto_neural_linker'] = {label = 'Yuto Neural Linker', weight = 10,   stack = false,    close = true,    description = 'Yuto Neural Linker',},
        --######################################################  jg_sands_of_eternity  ###########################################################################--
        ['card_ammit_eater'] = {      label = 'ammit eater',      weight = 10,    stack = false,    close = true,    description = 'ammit eater',},
        ['card_ankh_keeper'] = {      label = 'ankh keeper',      weight = 10,    stack = false,    close = true,    description = 'ankh keeper',},
        ['card_ankhbrace'] = {        label = 'ankhbrace',        weight = 10,    stack = false,    close = true,    description = 'ankhbrace',},
        ['card_ankhou_justice'] = {   label = 'ankhou justice',   weight = 10,    stack = false,    close = true,    description = 'ankhou justice',},
        ['card_ankhouveil'] = {       label = 'ankhouveil',       weight = 10,    stack = false,    close = true,    description = 'ankhouveil',},
        ['card_anubis_guardian'] = {  label = 'anubis guardian',  weight = 10,    stack = false,    close = true,    description = 'anubis guardian',},
        ['card_apep_serpent'] = {     label = 'apep serpent',     weight = 10,    stack = false,    close = true,    description = 'apep serpent',},
        ['card_apepcoil'] = {         label = 'apepcoil',         weight = 10,    stack = false,    close = true,    description = 'apepcoil',},
        ['card_apepdevourer'] = {     label = 'apepdevourer',     weight = 10,    stack = false,    close = true,    description = 'apepdevourer',},
        ['card_apepshadow'] = {       label = 'apepshadow',       weight = 10,    stack = false,    close = true,    description = 'apepshadow',},
        ['card_aten_disk'] = {        label = 'aten disk',        weight = 10,    stack = false,    close = true,    description = 'aten disk',},
        ['card_atenflare_divine'] = { label = 'atenflare divine', weight = 10,    stack = false,    close = true,    description = 'atenflare divine',},
        ['card_bast_shadow'] = {      label = 'bast shadow',      weight = 10,    stack = false,    close = true,    description = 'bast shadow',},
        ['card_bastet_protector'] = { label = 'bastet protector', weight = 10,    stack = false,    close = true,    description = 'bastet protector',},
        ['card_bastetpurr'] = {       label = 'bastetpurr',       weight = 10,    stack = false,    close = true,    description = 'bastetpurr',},
        ['card_bastpatrol'] = {       label = 'bastpatrol',       weight = 10,    stack = false,    close = true,    description = 'bastpatrol',},
        ['card_bastpaw'] = {          label = 'bastpaw',          weight = 10,    stack = false,    close = true,    description = 'bastpaw',},
        ['card_bastshadow'] = {       label = 'bastshadow',       weight = 10,    stack = false,    close = true,    description = 'bastshadow',},
        ['card_bennucry'] = {         label = 'bennucry',         weight = 10,    stack = false,    close = true,    description = 'bennucry',},
        ['card_bennuwing'] = {        label = 'bennuwing',        weight = 10,    stack = false,    close = true,    description = 'bennuwing',},
        ['card_dedunbring'] = {       label = 'dedunbring',       weight = 10,    stack = false,    close = true,    description = 'dedunbring',},
        ['card_dedunprosper'] = {     label = 'dedunprosper',     weight = 10,    stack = false,    close = true,    description = 'dedunprosper',},
        ['card_duat_guardian'] = {    label = 'duat guardian',    weight = 10,    stack = false,    close = true,    description = 'duat guardian',},
        ['card_duatveil'] = {         label = 'duatveil',         weight = 10,    stack = false,    close = true,    description = 'duatveil',},
        ['card_gebsoil'] = {          label = 'gebsoil',          weight = 10,    stack = false,    close = true,    description = 'gebsoil',},
        ['card_hapiflows'] = {        label = 'hapiflows',        weight = 10,    stack = false,    close = true,    description = 'hapiflows',},
        ['card_hapinile'] = {         label = 'hapinile',         weight = 10,    stack = false,    close = true,    description = 'hapinile',},
        ['card_hathor_goddess'] = {   label = 'hathor goddess',   weight = 10,    stack = false,    close = true,    description = 'hathor goddess',},
        ['card_hathorcharm'] = {      label = 'hathorcharm',      weight = 10,    stack = false,    close = true,    description = 'hathorcharm',},
        ['card_hathorhorn'] = {       label = 'hathorhorn',       weight = 10,    stack = false,    close = true,    description = 'hathorhorn',},
        ['card_hathorpulse'] = {      label = 'hathorpulse',      weight = 10,    stack = false,    close = true,    description = 'hathorpulse',},
        ['card_hathorvoice'] = {      label = 'hathorvoice',      weight = 10,    stack = false,    close = true,    description = 'hathorvoice',},
        ['card_horus_sky_warrior'] = {label = 'horus sky warrior', weight = 10,    stack = false,    close = true,    description = 'horus sky warrior',},
        ['card_horusfalcon'] = {      label = 'horusfalcon',      weight = 10,    stack = false,    close = true,    description = 'horusfalcon',},
        ['card_horusra_watcher'] = {  label = 'horusra watcher',  weight = 10,    stack = false,    close = true,    description = 'horusra watcher',},
        ['card_horuswatch'] = {       label = 'horuswatch',       weight = 10,    stack = false,    close = true,    description = 'horuswatch',},
        ['card_isis_mother'] = {      label = 'isis mother',      weight = 10,    stack = false,    close = true,    description = 'isis mother',},
        ['card_isisbless'] = {        label = 'isisbless',        weight = 10,    stack = false,    close = true,    description = 'isisbless',},
        ['card_isisglow'] = {         label = 'isisglow',         weight = 10,    stack = false,    close = true,    description = 'isisglow',},
        ['card_isisgrace'] = {        label = 'isisgrace',        weight = 10,    stack = false,    close = true,    description = 'isisgrace',},
        ['card_isisveil'] = {         label = 'isisveil',         weight = 10,    stack = false,    close = true,    description = 'isisveil',},
        ['card_keb_earth'] = {        label = 'keb earth',        weight = 10,    stack = false,    close = true,    description = 'keb earth',},
        ['card_kebrock'] = {          label = 'kebrock',          weight = 10,    stack = false,    close = true,    description = 'kebrock',},
        ['card_khepribeetle'] = {     label = 'khepribeetle',     weight = 10,    stack = false,    close = true,    description = 'khepribeetle',},
        ['card_kheprihold'] = {       label = 'kheprihold',       weight = 10,    stack = false,    close = true,    description = 'kheprihold',},
        ['card_khnemu_creator'] = {   label = 'khnemu creator',   weight = 10,    stack = false,    close = true,    description = 'khnemu creator',},
        ['card_khonsu_moon'] = {      label = 'khonsu moon',      weight = 10,    stack = false,    close = true,    description = 'khonsu moon',},
        ['card_khonsubright'] = {     label = 'khonsubright',     weight = 10,    stack = false,    close = true,    description = 'khonsubright',},
        ['card_khonsulight'] = {      label = 'khonsulight',      weight = 10,    stack = false,    close = true,    description = 'khonsulight',},
        ['card_khonsumoon'] = {       label = 'khonsumoon',       weight = 10,    stack = false,    close = true,    description = 'khonsumoon',},
        ['card_khonsusilver'] = {     label = 'khonsusilver',     weight = 10,    stack = false,    close = true,    description = 'khonsusilver',},
        ['card_maahes_huntress'] = {  label = 'maahes huntress',  weight = 10,    stack = false,    close = true,    description = 'maahes huntress',},
        ['card_maahes_lion'] = {      label = 'maahes lion',      weight = 10,    stack = false,    close = true,    description = 'maahes lion',},
        ['card_nun_primordial'] = {   label = 'nun primordial',   weight = 10,    stack = false,    close = true,    description = 'nun primordial',},
        ['card_osiris_ruler'] = {     label = 'osiris ruler',     weight = 10,    stack = false,    close = true,    description = 'osiris ruler',},
        ['card_osirislament'] = {     label = 'osirislament',     weight = 10,    stack = false,    close = true,    description = 'osirislament',},
        ['card_osiriswatch'] = {      label = 'osiriswatch',      weight = 10,    stack = false,    close = true,    description = 'osiriswatch',},
        ['card_ptah_creator'] = {     label = 'ptah creator',     weight = 10,    stack = false,    close = true,    description = 'ptah creator',},
        ['card_ptahforge'] = {        label = 'ptahforge',        weight = 10,    stack = false,    close = true,    description = 'ptahforge',},
        ['card_ptahhammer'] = {       label = 'ptahhammer',       weight = 10,    stack = false,    close = true,    description = 'ptahhammer',},
        ['card_ra_sun_god'] = {       label = 'ra sun god',       weight = 10,    stack = false,    close = true,    description = 'ra sun god',},
        ['card_raet_lightbringer'] = {label = 'raet lightbringer', weight = 10,   stack = false,    close = true,    description = 'raet lightbringer',},
        ['card_raet_sun'] = {         label = 'raet sun',          weight = 10,    stack = false,    close = true,    description = 'raet sun',},
        ['card_raflame'] = {          label = 'raflame',           weight = 10,    stack = false,    close = true,    description = 'raflame',},
        ['card_raflare'] = {          label = 'raflare',           weight = 10,    stack = false,    close = true,    description = 'raflare',},
        ['card_raheat'] = {           label = 'raheat',            weight = 10,    stack = false,    close = true,    description = 'raheat',},
        ['card_renpetcircle'] = {     label = 'renpetcircle',      weight = 10,    stack = false,    close = true,    description = 'renpetcircle',},
        ['card_renpetcycle'] = {      label = 'renpetcycle',       weight = 10,    stack = false,    close = true,    description = 'renpetcycle',},
        ['card_sah_star'] = {         label = 'sah star',          weight = 10,    stack = false,    close = true,    description = 'sah star',},
        ['card_sahglow'] = {          label = 'sahglow',           weight = 10,    stack = false,    close = true,    description = 'sahglow',},
        ['card_sahstar'] = {          label = 'sahstar',           weight = 10,    stack = false,    close = true,    description = 'sahstar',},
        ['card_sahure_guardian'] = {  label = 'sahure guardian',   weight = 10,    stack = false,    close = true,    description = 'sahure guardian',},
        ['card_sauket_magic'] = {     label = 'sauket magic',      weight = 10,    stack = false,    close = true,    description = 'sauket magic',},
        ['card_sauketcloak'] = {      label = 'sauketcloak',       weight = 10,    stack = false,    close = true,    description = 'sauketcloak',},
        ['card_sekmet_warrior'] = {   label = 'sekmet warrior',    weight = 10,    stack = false,    close = true,    description = 'sekmet warrior',},
        ['card_sekmetclaw'] = {       label = 'sekmetclaw',        weight = 10,    stack = false,    close = true,    description = 'sekmetclaw',},
        ['card_sekmetfury'] = {       label = 'sekmetfury',        weight = 10,    stack = false,    close = true,    description = 'sekmetfury',},
        ['card_serqetsting'] = {      label = 'serqetsting',       weight = 10,    stack = false,    close = true,    description = 'serqetsting',},
        ['card_serqetstinger'] = {    label = 'serqetstinger',     weight = 10,    stack = false,    close = true,    description = 'serqetstinger',},
        ['card_set_chaos_lord'] = {   label = 'set chaos lord',    weight = 10,    stack = false,    close = true,    description = 'set chaos lord',},
        ['card_setchaos'] = {         label = 'setchaos',          weight = 10,    stack = false,    close = true,    description = 'setchaos',},
        ['card_setstorm'] = {         label = 'setstorm',          weight = 10,    stack = false,    close = true,    description = 'setstorm',},
        ['card_shu_air'] = {          label = 'shu air',           weight = 10,    stack = false,    close = true,    description = 'shu air',},
        ['card_shubreeze'] = {        label = 'shubreeze',         weight = 10,    stack = false,    close = true,    description = 'shubreeze',},
        ['card_shusky'] = {           label = 'shusky',            weight = 10,    stack = false,    close = true,    description = 'shusky',},
        ['card_sobekflood'] = {       label = 'sobekflood',        weight = 10,    stack = false,    close = true,    description = 'sobekflood',},
        ['card_sobekhunt'] = {        label = 'sobekhunt',         weight = 10,    stack = false,    close = true,    description = 'sobekhunt',},
        ['card_sobekjaw_predator'] = {label = 'sobekjaw predator', weight = 10,    stack = false,    close = true,    description = 'sobekjaw predator',},
        ['card_sopduguardian'] = {    label = 'sopduguardian',     weight = 10,    stack = false,    close = true,    description = 'sopduguardian',},
        ['card_sopduspear'] = {       label = 'sopduspear',        weight = 10,    stack = false,    close = true,    description = 'sopduspear',},
        ['card_sopduspire'] = {       label = 'sopduspire',        weight = 10,    stack = false,    close = true,    description = 'sopduspire',},
        ['card_sphinx_guard'] = {     label = 'sphinx guard',      weight = 10,    stack = false,    close = true,    description = 'sphinx guard',},
        ['card_sphinxriddle'] = {     label = 'sphinxriddle',      weight = 10,    stack = false,    close = true,    description = 'sphinxriddle',},
        ['card_sphinxrune'] = {       label = 'sphinxrune',        weight = 10,    stack = false,    close = true,    description = 'sphinxrune',},
        ['card_taweret_protector'] = {label = 'taweret protector', weight = 10,    stack = false,    close = true,    description = 'taweret protector',},
        ['card_tefnut_moisture'] = {  label = 'tefnut moisture',   weight = 10,    stack = false,    close = true,    description = 'tefnut moisture',},
        ['card_tefnutdrop'] = {       label = 'tefnutdrop',        weight = 10,    stack = false,    close = true,    description = 'tefnutdrop',},
        ['card_thoth_scribe'] = {     label = 'thoth scribe',      weight = 10,    stack = false,    close = true,    description = 'thoth scribe',},
        ['card_thothscribe'] = {      label = 'thothscribe',       weight = 10,    stack = false,    close = true,    description = 'thothscribe',},
        ['card_thothwisdom_keeper'] = {label = 'thothwisdom keeper', weight = 10,  stack = false,    close = true,    description = 'thothwisdom keeper',},
        ['card_wadjet_protector'] = { label = 'wadjet protector',  weight = 10,    stack = false,    close = true,    description = 'wadjet protector',},
        ['card_wadjetcobra'] = {      label = 'wadjetcobra',       weight = 10,    stack = false,    close = true,    description = 'wadjetcobra',},
        ['card_wadjeteye'] = {        label = 'wadjeteye',         weight = 10,    stack = false,    close = true,    description = 'wadjeteye',},
        ['card_wadjetprotect'] = {    label = 'wadjetprotect',     weight = 10,    stack = false,    close = true,    description = 'wadjetprotect',},
        --######################################################  ammunation_elite  ###############################################################################--
        ['card_weapon_bat'] = {         label = 'Bat',              weight = 10,    stack = false,    close = true,    description = 'Bat',},
        ['card_weapon_crowbar'] = {     label = 'Crowbar',          weight = 10,    stack = false,    close = true,    description = 'Crowbar',},
        ['card_weapon_flashlight'] = {  label = 'Flashlight',       weight = 10,    stack = false,    close = true,    description = 'Flashlight',},
        ['card_weapon_golfclub'] = {    label = 'Golf Club',        weight = 10,    stack = false,    close = true,    description = 'Golf Club',},
        ['card_weapon_hammer'] = {      label = 'Hammer',           weight = 10,    stack = false,    close = true,    description = 'Hammer',},
        ['card_weapon_knife'] = {       label = 'Knife',            weight = 10,    stack = false,    close = true,    description = 'Knife',},
        ['card_weapon_nightstick'] = {  label = 'Nightstick',       weight = 10,    stack = false,    close = true,    description = 'Nightstick',},
        ['card_weapon_pistol'] = {      label = 'Pistol',           weight = 10,    stack = false,    close = true,    description = 'Pistol',},
        ['card_weapon_poolcue'] = {     label = 'Pool Cue',         weight = 10,    stack = false,    close = true,    description = 'Pool Cue',},
        ['card_weapon_wrench'] = {      label = 'Wrench',           weight = 10,    stack = false,    close = true,    description = 'Wrench',},
        ['card_weapon_appisto'] = {     label = 'Appisto',          weight = 10,    stack = false,    close = true,    description = 'Appisto',},
        ['card_weapon_bottle'] = {      label = 'Bottle',           weight = 10,    stack = false,    close = true,    description = 'Bottle',},
        ['card_weapon_combatpistol'] = { label = 'Combat Pistol',    weight = 10,    stack = false,    close = true,    description = 'Combat Pistol',},
        ['card_weapon_dagger'] = {      label = 'Dagger',           weight = 10,    stack = false,    close = true,    description = 'Dagger',},
        ['card_weapon_hatchet'] = {     label = 'Hatchet',          weight = 10,    stack = false,    close = true,    description = 'Hatchet',},
        ['card_weapon_knuckle'] = {     label = 'Knuckle',          weight = 10,    stack = false,    close = true,    description = 'Knuckle',},
        ['card_weapon_machete'] = {     label = 'Machete',          weight = 10,    stack = false,    close = true,    description = 'Machete',},
        ['card_weapon_microsmg'] = {    label = 'Micro SMG',        weight = 10,    stack = false,    close = true,    description = 'Micro SMG',},
        ['card_weapon_pistol_mk2'] = {  label = 'Pistol Mk2',       weight = 10,    stack = false,    close = true,    description = 'Pistol Mk2',},
        ['card_weapon_pumpshotgun'] = { label = 'Pump Shotgun',     weight = 10,    stack = false,    close = true,    description = 'Pump Shotgun',},
        ['card_weapon_sawnoffshotgun'] = { label = 'Sawnoff Shotgun',  weight = 10,    stack = false,    close = true,    description = 'Sawnoff Shotgun',},
        ['card_weapon_switchblade'] = { label = 'Switchblade',      weight = 10,    stack = false,    close = true,    description = 'Switchblade',},
        ['card_weapon_snspistol'] = {   label = 'SNS Pistol',       weight = 10,    stack = false,    close = true,    description = 'SNS Pistol',},
        ['card_weapon_assaultrifle'] = { label = 'Assault Rifle',    weight = 10,    stack = false,    close = true,    description = 'Assault Rifle',},
        ['card_weapon_assaultsmg'] = {  label = 'Assault SMG',      weight = 10,    stack = false,    close = true,    description = 'Assault SMG',},
        ['card_weapon_carbinerifle'] = { label = 'Carbine Rifle',    weight = 10,    stack = false,    close = true,    description = 'Carbine Rifle',},
        ['card_weapon_compactrifle'] = { label = 'Compact Rifle',    weight = 10,    stack = false,    close = true,    description = 'Compact Rifle',},
        ['card_weapon_grenade'] = {     label = 'Grenade',          weight = 10,    stack = false,    close = true,    description = 'Grenade',},
        ['card_weapon_heavypistol'] = { label = 'Heavy Pistol',     weight = 10,    stack = false,    close = true,    description = 'Heavy Pistol',},
        ['card_weapon_machinepistol'] = { label = 'Machine Pistol',   weight = 10,    stack = false,    close = true,    description = 'Machine Pistol',},
        ['card_weapon_marksmanpistol'] = { label = 'Marksman Pistol',  weight = 10,    stack = false,    close = true,    description = 'Marksman Pistol',},
        ['card_weapon_minismg'] = {     label = 'Mini SMG',         weight = 10,    stack = false,    close = true,    description = 'Mini SMG',},
        ['card_weapon_pumpshotgun_mk2'] = { label = 'Pump Shotgun Mk2', weight = 10,    stack = false,    close = true,    description = 'Pump Shotgun Mk2',},
        ['card_weapon_smg'] = {         label = 'SMG',              weight = 10,    stack = false,    close = true,    description = 'SMG',},
        ['card_weapon_smokegrenade'] = { label = 'Smoke Grenade',    weight = 10,    stack = false,    close = true,    description = 'Smoke Grenade',},
        ['card_weapon_vintagepistol'] = { label = 'Vintage Pistol',   weight = 10,    stack = false,    close = true,    description = 'Vintage Pistol',},
        ['card_weapon_stickybomb'] = {  label = 'Sticky Bomb',      weight = 10,    stack = false,    close = true,    description = 'Sticky Bomb',},
        ['card_weapon_advancedrifle'] = { label = 'Advanced Rifle',   weight = 10,    stack = false,    close = true,    description = 'Advanced Rifle',},
        ['card_weapon_assaultshotgun'] = { label = 'Assault Shotgun',  weight = 10,    stack = false,    close = true,    description = 'Assault Shotgun',},
        ['card_weapon_bullpuprifle'] = { label = 'Bullpup Rifle',    weight = 10,    stack = false,    close = true,    description = 'Bullpup Rifle',},
        ['card_weapon_bullpupshotgun'] = { label = 'Bullpup Shotgun',  weight = 10,    stack = false,    close = true,    description = 'Bullpup Shotgun',},
        ['card_weapon_combatpdw'] = {   label = 'Combat PDW',       weight = 10,    stack = false,    close = true,    description = 'Combat PDW',},
        ['card_weapon_heavyrifle'] = {  label = 'Heavy Rifle',      weight = 10,    stack = false,    close = true,    description = 'Heavy Rifle',},
        ['card_weapon_militaryrifle'] = { label = 'Military Rifle',   weight = 10,    stack = false,    close = true,    description = 'Military Rifle',},
        ['card_weapon_proxmine'] = {    label = 'Prox Mine',        weight = 10,    stack = false,    close = true,    description = 'Prox Mine',},
        ['card_weapon_revolver'] = {    label = 'Revolver',         weight = 10,    stack = false,    close = true,    description = 'Revolver',},
        ['card_weapon_revolver_mk2'] = { label = 'Revolver Mk2',     weight = 10,    stack = false,    close = true,    description = 'Revolver Mk2',},
        ['card_weapon_smg_mk2'] = {     label = 'SMG Mk2',          weight = 10,    stack = false,    close = true,    description = 'SMG Mk2',},
        ['card_weapon_sniperrifle'] = { label = 'Sniper Rifle',     weight = 10,    stack = false,    close = true,    description = 'Sniper Rifle',},
        ['card_weapon_specialcarbine'] = { label = 'Special Carbine',  weight = 10,    stack = false,    close = true,    description = 'Special Carbine',},
        ['card_weapon_navnavy_revolver'] = { label = 'Navy Revolver',    weight = 10,    stack = false,    close = true,    description = 'Navy Revolver',},
        ['card_weapon_pistolxm3'] = {   label = 'Pistol XM3',       weight = 10,    stack = false,    close = true,    description = 'Pistol XM3',},
        ['card_weapon_specialcarbine_mk2'] = { label = 'Special Carbine Mk2', weight = 10,    stack = false,    close = true,    description = 'Special Carbine Mk2',},
        ['card_weapon_tacticalrifle'] = { label = 'Tactical Rifle',   weight = 10,    stack = false,    close = true,    description = 'Tactical Rifle',},
        ['card_weapon_tecpistol'] = {   label = 'Tec Pistol',       weight = 10,    stack = false,    close = true,    description = 'Tec Pistol',},
        ['card_weapon_autoshotgun'] = { label = 'Auto Shotgun',     weight = 10,    stack = false,    close = true,    description = 'Auto Shotgun',},
        ['card_weapon_combatmg'] = {    label = 'Combat MG',        weight = 10,    stack = false,    close = true,    description = 'Combat MG',},
        ['card_weapon_combatmg_mk2'] = { label = 'Combat MG Mk2',    weight = 10,    stack = false,    close = true,    description = 'Combat MG Mk2',},
        ['card_weapon_combatshotgun'] = { label = 'Combat Shotgun',   weight = 10,    stack = false,    close = true,    description = 'Combat Shotgun',},
        ['card_weapon_doubleaction'] = { label = 'Double Action',    weight = 10,    stack = false,    close = true,    description = 'Double Action',},
        ['card_weapon_gadgetpistol'] = { label = 'Gadget Pistol',    weight = 10,    stack = false,    close = true,    description = 'Gadget Pistol',},
        ['card_weapon_heavyshotgun'] = { label = 'Heavy Shotgun',    weight = 10,    stack = false,    close = true,    description = 'Heavy Shotgun',},
        ['card_weapon_heavysniper'] = { label = 'Heavy Sniper',     weight = 10,    stack = false,    close = true,    description = 'Heavy Sniper',},
        ['card_weapon_marksmanrifle'] = { label = 'Marksman Rifle',   weight = 10,    stack = false,    close = true,    description = 'Marksman Rifle',},
        ['card_weapon_marksmanrifle_mk2'] = { label = 'Marksman Rifle Mk2', weight = 10,    stack = false,    close = true,    description = 'Marksman Rifle Mk2',},
        ['card_weapon_rpg'] = {         label = 'RPG',              weight = 10,    stack = false,    close = true,    description = 'RPG',},
        ['card_weapon_compactlauncher'] = { label = 'Compact Launcher', weight = 10,    stack = false,    close = true,    description = 'Compact Launcher',},
        ['card_weapon_raypistol'] = { label = 'raypistol', weight = 10,    stack = false,    close = true,    description = 'raypistol',},
        ['card_weapon_emplauncher'] = { label = 'EMP Launcher',     weight = 10,    stack = false,    close = true,    description = 'EMP Launcher',},
        ['card_weapon_firework'] = {    label = 'Firework',         weight = 10,    stack = false,    close = true,    description = 'Firework',},
        ['card_weapon_grenadelauncher'] = { label = 'Grenade Launcher', weight = 10,    stack = false,    close = true,    description = 'Grenade Launcher',},
        ['card_weapon_heavysniper_mk2'] = { label = 'Heavy Sniper Mk2', weight = 10,    stack = false,    close = true,    description = 'Heavy Sniper Mk2',},
        ['card_weapon_hominglauncher'] = { label = 'Homing Launcher',  weight = 10,    stack = false,    close = true,    description = 'Homing Launcher',},
        ['card_weapon_minigun'] = {     label = 'Minigun',          weight = 10,    stack = false,    close = true,    description = 'Minigun',},
        ['card_weapon_precisionrifle'] = { label = 'Precision Rifle',  weight = 10,    stack = false,    close = true,    description = 'Precision Rifle',},
        ['card_weapon_railgun'] = {     label = 'Railgun',          weight = 10,    stack = false,    close = true,    description = 'Railgun',},
        ['card_weapon_raycarbine'] = {  label = 'Ray Carbine',      weight = 10,    stack = false,    close = true,    description = 'Ray Carbine',},
        ['card_weapon_rayminigun'] = {  label = 'Ray Minigun',      weight = 10,    stack = false,    close = true,    description = 'Ray Minigun',},
        ['card_weapon_stungun'] = {     label = 'Stun Gun',         weight = 10,    stack = false,    close = true,    description = 'Stun Gun',},
        ['card_weapon_ball'] = {        label = 'Ball',             weight = 10,    stack = false,    close = true,    description = 'Ball',},
        ['card_weapon_battleaxe'] = {   label = 'Battle Axe',       weight = 10,    stack = false,    close = true,    description = 'Battle Axe',},
        ['card_weapon_candycane'] = {   label = 'Candy Cane',       weight = 10,    stack = false,    close = true,    description = 'Candy Cane',},
        ['card_weapon_ceramicpistol'] = { label = 'Ceramic Pistol',   weight = 10,    stack = false,    close = true,    description = 'Ceramic Pistol',},
        ['card_weapon_fireextinguisher'] = { label = 'Fire Extinguisher', weight = 10,    stack = false,    close = true,    description = 'Fire Extinguisher',},
        ['card_weapon_flaregun'] = {    label = 'Flare Gun',        weight = 10,    stack = false,    close = true,    description = 'Flare Gun',},
        ['card_weapon_gusenberg'] = {   label = 'Gusenberg',        weight = 10,    stack = false,    close = true,    description = 'Gusenberg',},
        ['card_weapon_hazardcan'] = {   label = 'Hazard Can',       weight = 10,    stack = false,    close = true,    description = 'Hazard Can',},
        ['card_weapon_molotov'] = {     label = 'Molotov',          weight = 10,    stack = false,    close = true,    description = 'Molotov',},
        ['card_weapon_musket'] = {      label = 'Musket',           weight = 10,    stack = false,    close = true,    description = 'Musket',},
        ['card_weapon_petrolcan'] = {   label = 'Petrol Can',       weight = 10,    stack = false,    close = true,    description = 'Petrol Can',},
        ['card_weapon_pipebomb'] = {    label = 'Pipe Bomb',        weight = 10,    stack = false,    close = true,    description = 'Pipe Bomb',},
        ['card_weapon_snowball'] = {    label = 'Snowball',         weight = 10,    stack = false,    close = true,    description = 'Snowball',},
        ['card_weapon_stone_hatchet'] = { label = 'Stone Hatchet',    weight = 10,    stack = false,    close = true,    description = 'Stone Hatchet',},
        --######################################################  full_throttle  ##################################################################################--
        ['card_panto'] = {             label = 'Panto',            weight = 10,    stack = false,    close = true,    description = 'Panto',},
        ['card_dilettante'] = {        label = 'Dilettante',       weight = 10,    stack = false,    close = true,    description = 'Dilettante',},
        ['card_asea'] = {              label = 'Asea',             weight = 10,    stack = false,    close = true,    description = 'Asea',},
        ['card_regina'] = {            label = 'Regina',           weight = 10,    stack = false,    close = true,    description = 'Regina',},
        ['card_journey'] = {           label = 'Journey',          weight = 10,    stack = false,    close = true,    description = 'Journey',},
        ['card_taco'] = {              label = 'Taco Van',         weight = 10,    stack = false,    close = true,    description = 'Taco Van',},
        ['card_boxville2'] = {         label = 'Post OP Boxville', weight = 10,    stack = false,    close = true,    description = 'Post OP Boxville',},
        ['card_feltzer2'] = {          label = 'Feltzer',          weight = 10,    stack = false,    close = true,    description = 'Feltzer',},
        ['card_oracle'] = {            label = 'Oracle',           weight = 10,    stack = false,    close = true,    description = 'Oracle',},
        ['card_sentinel2'] = {         label = 'Sentinel XS',      weight = 10,    stack = false,    close = true,    description = 'Sentinel XS',},
        ['card_blista2'] = {           label = 'Blista Compact',   weight = 10,    stack = false,    close = true,    description = 'Blista Compact',},
        ['card_issi2'] = {             label = 'Issi',             weight = 10,    stack = false,    close = true,    description = 'Issi',},
        ['card_prairie'] = {           label = 'Prairie',          weight = 10,    stack = false,    close = true,    description = 'Prairie',},
        ['card_ingot'] = {             label = 'Ingot',            weight = 10,    stack = false,    close = true,    description = 'Ingot',},
        ['card_stratum'] = {           label = 'Stratum',          weight = 10,    stack = false,    close = true,    description = 'Stratum',},
        ['card_premier'] = {           label = 'Premier',          weight = 10,    stack = false,    close = true,    description = 'Premier',},
        ['card_stanier'] = {           label = 'Stanier',          weight = 10,    stack = false,    close = true,    description = 'Stanier',},
        ['card_rhapsody'] = {          label = 'Rhapsody',         weight = 10,    stack = false,    close = true,    description = 'Rhapsody',},
        ['card_faggio'] = {            label = 'Faggio',           weight = 10,    stack = false,    close = true,    description = 'Faggio',},
        ['card_tractor'] = {           label = 'Tractor',          weight = 10,    stack = false,    close = true,    description = 'Tractor',},
        ['card_bati'] = {              label = 'Bati 801',         weight = 10,    stack = false,    close = true,    description = 'Bati 801',},
        ['card_akuma'] = {             label = 'Akuma',            weight = 10,    stack = false,    close = true,    description = 'Akuma',},
        ['card_hakuchou2'] = {         label = 'Hakuchou Drag',    weight = 10,    stack = false,    close = true,    description = 'Hakuchou Drag',},
        ['card_double'] = {            label = 'Double-T',         weight = 10,    stack = false,    close = true,    description = 'Double-T',},
        ['card_sanchez'] = {           label = 'Sanchez',          weight = 10,    stack = false,    close = true,    description = 'Sanchez',},
        ['card_manchez2'] = {          label = 'Manchez Scout',    weight = 10,    stack = false,    close = true,    description = 'Manchez Scout',},
        ['card_faggio3'] = {           label = 'Faggio Sport',     weight = 10,    stack = false,    close = true,    description = 'Faggio Sport',},
        ['card_faggio2'] = {           label = 'Faggio Mod',       weight = 10,    stack = false,    close = true,    description = 'Faggio Mod',},
        ['card_bf400'] = {             label = 'BF400',            weight = 10,    stack = false,    close = true,    description = 'BF400',},
        ['card_shinobi'] = {           label = 'Shinobi',          weight = 10,    stack = false,    close = true,    description = 'Shinobi',},
        ['card_vindicator'] = {        label = 'Vindicator',       weight = 10,    stack = false,    close = true,    description = 'Vindicator',},
        ['card_gargoyle'] = {          label = 'Gargoyle',         weight = 10,    stack = false,    close = true,    description = 'Gargoyle',},
        ['card_chimera'] = {           label = 'Chimera',          weight = 10,    stack = false,    close = true,    description = 'Chimera',},
        ['card_bmx'] = {               label = 'BMX',              weight = 10,    stack = false,    close = true,    description = 'BMX',},
        ['card_sandking'] = {          label = 'Sandking XL',      weight = 10,    stack = false,    close = true,    description = 'Sandking XL',},
        ['card_dubsta3'] = {           label = 'Dubsta 6x6',       weight = 10,    stack = false,    close = true,    description = 'Dubsta 6x6',},
        ['card_kamacho'] = {           label = 'Kamacho',          weight = 10,    stack = false,    close = true,    description = 'Kamacho',},
        ['card_draugur'] = {           label = 'Draugur',          weight = 10,    stack = false,    close = true,    description = 'Draugur',},
        ['card_insurgent'] = {         label = 'Insurgent',        weight = 10,    stack = false,    close = true,    description = 'Insurgent',},
        ['card_nightshark'] = {        label = 'Nightshark',       weight = 10,    stack = false,    close = true,    description = 'Nightshark',},
        ['card_toros'] = {             label = 'Toros',            weight = 10,    stack = false,    close = true,    description = 'Toros',},
        ['card_baller7'] = {           label = 'Baller ST',        weight = 10,    stack = false,    close = true,    description = 'Baller ST',},
        ['card_rebel'] = {             label = 'Rebel',            weight = 10,    stack = false,    close = true,    description = 'Rebel',},
        ['card_bifta'] = {             label = 'Bifta',            weight = 10,    stack = false,    close = true,    description = 'Bifta',},
        ['card_freecrawler'] = {       label = 'Freecrawler',      weight = 10,    stack = false,    close = true,    description = 'Freecrawler',},
        ['card_patriot3'] = {          label = 'Patriot Mil-Spec', weight = 10,    stack = false,    close = true,    description = 'Patriot Mil-Spec',},
        ['card_granger2'] = {          label = 'Granger 3600LX',   weight = 10,    stack = false,    close = true,    description = 'Granger 3600LX',},
        ['card_marshall'] = {          label = 'Marshall',         weight = 10,    stack = false,    close = true,    description = 'Marshall',},
        ['card_dominator'] = {         label = 'Dominator',        weight = 10,    stack = false,    close = true,    description = 'Dominator',},
        ['card_gauntlet4'] = {         label = 'Gauntlet Hellfire', weight = 10,   stack = false,    close = true,    description = 'Gauntlet Hellfire',},
        ['card_deathbike'] = {         label = 'Duke O Death',    weight = 10,    stack = false,    close = true,    description = 'Duke O Death',},
        ['card_dukes'] = {             label = 'Dukes',            weight = 10,    stack = false,    close = true,    description = 'Dukes',},
        ['card_buccaneer'] = {         label = 'Buccaneer',        weight = 10,    stack = false,    close = true,    description = 'Buccaneer',},
        ['card_tornado'] = {           label = 'Tornado',          weight = 10,    stack = false,    close = true,    description = 'Tornado',},
        ['card_voodoo'] = {            label = 'Voodoo',           weight = 10,    stack = false,    close = true,    description = 'Voodoo',},
        ['card_hermes'] = {            label = 'Hermes',           weight = 10,    stack = false,    close = true,    description = 'Hermes',},
        ['card_mamba'] = {             label = 'Mamba',            weight = 10,    stack = false,    close = true,    description = 'Mamba',},
        ['card_ztype'] = {             label = 'Z-Type',           weight = 10,    stack = false,    close = true,    description = 'Z-Type',},
        ['card_monroe'] = {            label = 'Monroe',           weight = 10,    stack = false,    close = true,    description = 'Monroe',},
        ['card_peyote'] = {            label = 'Peyote',           weight = 10,    stack = false,    close = true,    description = 'Peyote',},
        ['card_coquette2'] = {         label = 'Coquette Classic', weight = 10,    stack = false,    close = true,    description = 'Coquette Classic',},
        ['card_elegy2'] = {            label = 'Elegy RH8',        weight = 10,    stack = false,    close = true,    description = 'Elegy RH8',},
        ['card_elegy'] = {             label = 'Elegy Retro Custom', weight = 10,  stack = false,    close = true,    description = 'Elegy Retro Custom',},
        ['card_sultanrs'] = {          label = 'Sultan RS',        weight = 10,    stack = false,    close = true,    description = 'Sultan RS',},
        ['card_banshee2'] = {          label = 'Banshee 900R',     weight = 10,    stack = false,    close = true,    description = 'Banshee 900R',},
        ['card_jester4'] = {           label = 'Jester RR',        weight = 10,    stack = false,    close = true,    description = 'Jester RR',},
        ['card_calico'] = {            label = 'Calico GTF',       weight = 10,    stack = false,    close = true,    description = 'Calico GTF',},
        ['card_futo2'] = {             label = 'Futo GTX',         weight = 10,    stack = false,    close = true,    description = 'Futo GTX',},
        ['card_dominator7'] = {        label = 'Dominator ASP',    weight = 10,    stack = false,    close = true,    description = 'Dominator ASP',},
        ['card_previon'] = {           label = 'Karin Previon',    weight = 10,    stack = false,    close = true,    description = 'Karin Previon',},
        ['card_remus'] = {             label = 'Annis Remus',      weight = 10,    stack = false,    close = true,    description = 'Annis Remus',},
        ['card_rt3000'] = {            label = 'RT3000',           weight = 10,    stack = false,    close = true,    description = 'RT3000',},
        ['card_zr350'] = {             label = 'ZR350',            weight = 10,    stack = false,    close = true,    description = 'ZR350',},
        ['card_penumbra2'] = {         label = 'Penumbra FF',      weight = 10,    stack = false,    close = true,    description = 'Penumbra FF',},
        ['card_comet7'] = {            label = 'Comet S2',         weight = 10,    stack = false,    close = true,    description = 'Comet S2',},
        ['card_kuruma2'] = {           label = 'Kuruma',           weight = 10,    stack = false,    close = true,    description = 'Kuruma',},
        ['card_adder'] = {             label = 'Adder',            weight = 10,    stack = false,    close = true,    description = 'Adder',},
        ['card_zentorno'] = {          label = 'Zentorno',         weight = 10,    stack = false,    close = true,    description = 'Zentorno',},
        ['card_t20'] = {               label = 'T20',              weight = 10,    stack = false,    close = true,    description = 'T20',},
        ['card_osiris'] = {            label = 'Osiris',           weight = 10,    stack = false,    close = true,    description = 'Osiris',},
        ['card_emerus'] = {            label = 'Emerus',           weight = 10,    stack = false,    close = true,    description = 'Emerus',},
        ['card_krieger'] = {           label = 'Krieger',          weight = 10,    stack = false,    close = true,    description = 'Krieger',},
        ['card_italigto'] = {          label = 'Itali GTO',        weight = 10,    stack = false,    close = true,    description = 'Itali GTO',},
        ['card_pariah'] = {            label = 'Pariah',           weight = 10,    stack = false,    close = true,    description = 'Pariah',},
        ['card_turismor'] = {          label = 'Turismo R',        weight = 10,    stack = false,    close = true,    description = 'Turismo R',},
        ['card_infernus'] = {          label = 'Infernus',         weight = 10,    stack = false,    close = true,    description = 'Infernus',},
        ['card_cheetah'] = {           label = 'Cheetah',          weight = 10,    stack = false,    close = true,    description = 'Cheetah',},
        ['card_entityxf'] = {          label = 'Entity XF',        weight = 10,    stack = false,    close = true,    description = 'Entity XF',},
        ['card_vagner'] = {            label = 'Vagner',           weight = 10,    stack = false,    close = true,    description = 'Vagner',},
        ['card_tezeract'] = {          label = 'Tezeract',         weight = 10,    stack = false,    close = true,    description = 'Tezeract',},
        ['card_thrax'] = {             label = 'Thrax',            weight = 10,    stack = false,    close = true,    description = 'Thrax',},
        ['card_ignus'] = {             label = 'Ignus',            weight = 10,    stack = false,    close = true,    description = 'Ignus',},
        ['card_champion'] = {          label = 'Caldwell',         weight = 10,    stack = false,    close = true,    description = 'Caldwell',},
        ['card_nero2'] = {             label = 'Nero Custom',      weight = 10,    stack = false,    close = true,    description = 'Nero Custom',},
        ['card_xa21'] = {              label = 'XA-21',            weight = 10,    stack = false,    close = true,    description = 'XA-21',},
        ['card_tyrant'] = {            label = 'Tyrant',           weight = 10,    stack = false,    close = true,    description = 'Tyrant',},
        ['card_entity3'] = {           label = 'Entity MT',        weight = 10,    stack = false,    close = true,    description = 'Entity MT',},
        ['card_furia'] = {             label = 'Furia',            weight = 10,    stack = false,    close = true,    description = 'Furia',},
        ['card_gp1'] = {               label = 'GP1',              weight = 10,    stack = false,    close = true,    description = 'GP1',},
        ['card_sultan3'] = {           label = 'Sultan Classic',   weight = 10,    stack = false,    close = true,    description = 'Sultan Classic',},
        ['card_kanjosj'] = {           label = 'Kanjo SJ',         weight = 10,    stack = false,    close = true,    description = 'Kanjo SJ',},
        ['card_penumbra'] = {          label = 'Penumbra',         weight = 10,    stack = false,    close = true,    description = 'Penumbra',},
        ['card_dominator8'] = {        label = 'Dominator GTT',    weight = 10,    stack = false,    close = true,    description = 'Dominator GTT',},
        ['card_vigero2'] = {           label = 'Vigero ZX',        weight = 10,    stack = false,    close = true,    description = 'Vigero ZX',},
        ['card_manana'] = {            label = 'Manana',           weight = 10,    stack = false,    close = true,    description = 'Manana',},
        ['card_terminus'] = {          label = 'Terminus',         weight = 10,    stack = false,    close = true,    description = 'Terminus',},
        ['card_dorado'] = {            label = 'Dorado',           weight = 10,    stack = false,    close = true,    description = 'Dorado',},
        ['card_benson'] = {            label = 'Benson',           weight = 10,    stack = false,    close = true,    description = 'Benson',},
        --######################################################  ls_legends  #####################################################################################--
        ['card_s_m_m_marine_02'] = {   label = 'Marine',           weight = 10,    stack = false,    close = true,    description = 'Marine',},
        ['card_ig_englishdave'] = {    label = 'English Dave',     weight = 10,    stack = false,    close = true,    description = 'English Dave',},
        ['card_g_m_m_mexboss_02'] = {  label = 'Cartel Boss',      weight = 10,    stack = false,    close = true,    description = 'Cartel Boss',},
        ['card_ig_avon'] = {           label = 'Avon Hertz',       weight = 10,    stack = false,    close = true,    description = 'Avon Hertz',},
        ['card_s_m_y_clown_01'] = {    label = 'Cliffford',        weight = 10,    stack = false,    close = true,    description = 'Cliffford',},
        ['card_csb_bogdan'] = {        label = 'Bogdan',           weight = 10,    stack = false,    close = true,    description = 'Bogdan',},
        ['card_u_f_y_lauren'] = {      label = 'Lauren',           weight = 10,    stack = false,    close = true,    description = 'Lauren',},
        ['card_u_m_y_party_01'] = {    label = 'Partygoer',        weight = 10,    stack = false,    close = true,    description = 'Partygoer',},
        ['card_u_f_y_bikerchic'] = {   label = 'Biker Chic',       weight = 10,    stack = false,    close = true,    description = 'Biker Chic',},
        ['card_a_m_y_methhead_01'] = { label = 'Meth Head',        weight = 10,    stack = false,    close = true,    description = 'Meth Head',},
        ['card_u_f_y_beth'] = {        label = 'Beth',             weight = 10,    stack = false,    close = true,    description = 'Beth',},
        ['card_ig_sol'] = {            label = 'Sol',              weight = 10,    stack = false,    close = true,    description = 'Sol',},
        ['card_ig_tonyprince'] = {     label = 'Tony Prince',      weight = 10,    stack = false,    close = true,    description = 'Tony Prince',},
        ['card_ig_lazlow_2'] = {       label = 'Lazlow (Online)',  weight = 10,    stack = false,    close = true,    description = 'Lazlow (Online)',},
        ['card_ig_ortega'] = {         label = 'Ortega',           weight = 10,    stack = false,    close = true,    description = 'Ortega',},
        ['card_ig_dom'] = {            label = 'Dom Beasley',      weight = 10,    stack = false,    close = true,    description = 'Dom Beasley',},
        ['card_ig_maryann'] = {        label = 'Mary-ann Quinn',   weight = 10,    stack = false,    close = true,    description = 'Mary-ann Quinn',},
        ['card_ig_barry'] = {          label = 'Barry',            weight = 10,    stack = false,    close = true,    description = 'Barry',},
        ['card_ig_beverly'] = {        label = 'Beverly Felton',   weight = 10,    stack = false,    close = true,    description = 'Beverly Felton',},
        ['card_ig_dreyfuss'] = {       label = 'Dreyfuss',         weight = 10,    stack = false,    close = true,    description = 'Dreyfuss',},
        ['card_ig_abigail'] = {        label = 'Abigail Mathers',  weight = 10,    stack = false,    close = true,    description = 'Abigail Mathers',},
        ['card_ig_josh'] = {           label = 'Josh Bernstein',   weight = 10,    stack = false,    close = true,    description = 'Josh Bernstein',},
        ['card_ig_nigel'] = {          label = 'Nigel',            weight = 10,    stack = false,    close = true,    description = 'Nigel',},
        ['card_ig_mrs_thornhill'] = {  label = 'Mrs. Thornhill',   weight = 10,    stack = false,    close = true,    description = 'Mrs. Thornhill',},
        ['card_ig_maude'] = {          label = 'Maude Eccles',     weight = 10,    stack = false,    close = true,    description = 'Maude Eccles',},
        ['card_ig_cletus'] = {         label = 'Cletus Ewing',     weight = 10,    stack = false,    close = true,    description = 'Cletus Ewing',},
        ['card_ig_omega'] = {          label = 'Omega',            weight = 10,    stack = false,    close = true,    description = 'Omega',},
        ['card_ig_tonya'] = {          label = 'Tonya Wiggins',    weight = 10,    stack = false,    close = true,    description = 'Tonya Wiggins',},
        ['card_s_m_m_lifeinvad_01'] = { label = 'JB Schaller',     weight = 10,    stack = false,    close = true,    description = 'JB Schaller',},
        ['card_ig_hao'] = {            label = 'Hao',              weight = 10,    stack = false,    close = true,    description = 'Hao',},
        ['card_ig_roccopelosi'] = {    label = 'Rocco Pelosi',     weight = 10,    stack = false,    close = true,    description = 'Rocco Pelosi',},
        ['card_s_m_m_highsec_01_2'] = { label = 'Gianni',          weight = 10,    stack = false,    close = true,    description = 'Gianni',},
        ['card_s_m_y_construct_01'] = { label = 'Eddie Tow',       weight = 10,    stack = false,    close = true,    description = 'Eddie Tow',},
        ['card_ig_talina'] = {         label = 'Taliana Martinez', weight = 10,    stack = false,    close = true,    description = 'Taliana Martinez',},
        ['card_ig_paige'] = {          label = 'Paige Harris',     weight = 10,    stack = false,    close = true,    description = 'Paige Harris',},
        ['card_u_m_y_staggrm_01'] = {  label = 'Christian Feltz',  weight = 10,    stack = false,    close = true,    description = 'Christian Feltz',},
        ['card_ig_lestercrest'] = {    label = 'Lester Crest',     weight = 10,    stack = false,    close = true,    description = 'Lester Crest',},
        ['card_ig_lazlow'] = {         label = 'Lazlow Jones',     weight = 10,    stack = false,    close = true,    description = 'Lazlow Jones',},
        ['card_ig_solomon'] = {        label = 'Solomon Richards', weight = 10,    stack = false,    close = true,    description = 'Solomon Richards',},
        ['card_s_m_y_devinsec_01'] = { label = 'Kyle Chavis',      weight = 10,    stack = false,    close = true,    description = 'Kyle Chavis',},
        ['card_ig_drfriedlander'] = {  label = 'Dr. Isiah Friedlander', weight = 10, stack = false, close = true, description = 'Dr. Isiah Friedlander',},
        ['card_ig_oneil'] = {          label = 'Elwood O Neil',    weight = 10,    stack = false,    close = true,    description = 'Elwood O Neil',},
        ['card_a_m_m_hillbilly_01'] = { label = 'Wynel O Neil',    weight = 10,    stack = false,    close = true,    description = 'Wynel O Neil',},
        ['card_s_m_m_highsec_01'] = {  label = 'Gustavo Mota',     weight = 10,    stack = false,    close = true,    description = 'Gustavo Mota',},
        ['card_s_m_m_highsec_02'] = {  label = 'Karl Abolaji',     weight = 10,    stack = false,    close = true,    description = 'Karl Abolaji',},
        ['card_s_m_m_fiboffice_02'] = { label = 'Norm Richards',   weight = 10,    stack = false,    close = true,    description = 'Norm Richards',},
        ['card_s_m_y_blackops_01'] = { label = 'Daryl Johns',      weight = 10,    stack = false,    close = true,    description = 'Daryl Johns',},
        ['card_s_m_y_blackops_02'] = { label = 'Hugh Welsh',       weight = 10,    stack = false,    close = true,    description = 'Hugh Welsh',},
        ['card_ig_chef'] = {           label = 'Chef',             weight = 10,    stack = false,    close = true,    description = 'Chef',},
        ['card_hc_gunman'] = {         label = 'Heist Gunman',     weight = 10,    stack = false,    close = true,    description = 'Heist Gunman',},
        ['card_s_m_y_xmech_01'] = {    label = 'Mechanic',         weight = 10,    stack = false,    close = true,    description = 'Mechanic',},
        ['card_s_m_y_waretech_01'] = { label = 'Warehouse Tech',   weight = 10,    stack = false,    close = true,    description = 'Warehouse Tech',},
        ['card_s_m_y_waiter_01'] = {   label = 'Karim Denz',       weight = 10,    stack = false,    close = true,    description = 'Karim Denz',},
        ['card_g_m_m_mexboss_01'] = {  label = 'Javier Madrazo',   weight = 10,    stack = false,    close = true,    description = 'Javier Madrazo',},
        ['card_ig_stretch'] = {        label = 'Stretch',          weight = 10,    stack = false,    close = true,    description = 'Stretch',},
        ['card_ig_ballasog'] = {       label = 'D',                weight = 10,    stack = false,    close = true,    description = 'D',},
        ['card_ig_jay_norris'] = {     label = 'Jay Norris',       weight = 10,    stack = false,    close = true,    description = 'Jay Norris',},
        ['card_u_m_y_antonb'] = {      label = 'Anton Beaudelaire',weight = 10,    stack = false,    close = true,    description = 'Anton Beaudelaire',},
        ['card_ig_davenorton'] = {     label = 'Dave Norton',      weight = 10,    stack = false,    close = true,    description = 'Dave Norton',},
        ['card_ig_stevehains'] = {     label = 'Steve Haines',     weight = 10,    stack = false,    close = true,    description = 'Steve Haines',},
        ['card_ig_andreas'] = {        label = 'Andreas Sanchez',  weight = 10,    stack = false,    close = true,    description = 'Andreas Sanchez',},
        ['card_ig_devin'] = {          label = 'Devin Weston',     weight = 10,    stack = false,    close = true,    description = 'Devin Weston',},
        ['card_ig_molly'] = {          label = 'Molly Schultz',    weight = 10,    stack = false,    close = true,    description = 'Molly Schultz',},
        ['card_ig_karen_daniels'] = {  label = 'Karen Daniels',    weight = 10,    stack = false,    close = true,    description = 'Karen Daniels',},
        ['card_ig_fbisuit_01'] = {     label = 'FIB Suit',         weight = 10,    stack = false,    close = true,    description = 'FIB Suit',},
        ['card_ig_patricia'] = {       label = 'Patricia Madrazo', weight = 10,    stack = false,    close = true,    description = 'Patricia Madrazo',},
        ['card_ig_chengsr'] = {        label = 'Wei Cheng',        weight = 10,    stack = false,    close = true,    description = 'Wei Cheng',},
        ['card_ig_taocheng'] = {       label = 'Tao Cheng',        weight = 10,    stack = false,    close = true,    description = 'Tao Cheng',},
        ['card_player_zero'] = {       label = 'Michael De Santa', weight = 10,    stack = false,    close = true,    description = 'Michael De Santa',},
        ['card_player_one'] = {        label = 'Franklin Clinton', weight = 10,    stack = false,    close = true,    description = 'Franklin Clinton',},
        ['card_player_two'] = {        label = 'Trevor Philips',   weight = 10,    stack = false,    close = true,    description = 'Trevor Philips',},
        ['card_ig_amandatownley'] = {  label = 'Amanda De Santa',  weight = 10,    stack = false,    close = true,    description = 'Amanda De Santa',},
        ['card_ig_jimmydisanto'] = {   label = 'Jimmy De Santa',   weight = 10,    stack = false,    close = true,    description = 'Jimmy De Santa',},
        ['card_ig_tracydisanto'] = {   label = 'Tracey De Santa',  weight = 10,    stack = false,    close = true,    description = 'Tracey De Santa',},
        ['card_ig_lamardavis'] = {     label = 'Lamar Davis',      weight = 10,    stack = false,    close = true,    description = 'Lamar Davis',},
        ['card_a_c_chop'] = {          label = 'Chop',             weight = 10,    stack = false,    close = true,    description = 'Chop',},
        ['card_ig_nervousron'] = {     label = 'Ron Jakowski',     weight = 10,    stack = false,    close = true,    description = 'Ron Jakowski',},
        ['card_ig_wade'] = {           label = 'Wade Hebert',      weight = 10,    stack = false,    close = true,    description = 'Wade Hebert',},
        ['card_ig_siemonyetarian'] = { label = 'Simeon Yetarian',  weight = 10,    stack = false,    close = true,    description = 'Simeon Yetarian',},
        ['card_ig_chrisformage'] = {   label = 'Cris Formage',     weight = 10,    stack = false,    close = true,    description = 'Cris Formage',},
        ['card_ig_jimmyboston'] = {    label = 'Jimmy Boston',     weight = 10,    stack = false,    close = true,    description = 'Jimmy Boston',},
        ['card_ig_marnie'] = {         label = 'Marnie Allen',     weight = 10,    stack = false,    close = true,    description = 'Marnie Allen',},
        ['card_u_m_y_baygor'] = {      label = 'Baygor',           weight = 10,    stack = false,    close = true,    description = 'Baygor',},
        ['card_s_m_y_mime'] = {        label = 'The Mime',         weight = 10,    stack = false,    close = true,    description = 'The Mime',},
        ['card_u_m_y_pogo_01'] = {     label = 'Pogo the Monkey',  weight = 10,    stack = false,    close = true,    description = 'Pogo the Monkey',},
        ['card_u_m_y_imporage'] = {    label = 'Impotent Rage',    weight = 10,    stack = false,    close = true,    description = 'Impotent Rage',},
        ['card_u_f_y_princess'] = {    label = 'Princess Robot',   weight = 10,    stack = false,    close = true,    description = 'Princess Robot',},
        ['card_u_m_y_rsranger_01'] = { label = 'Space Ranger',     weight = 10,    stack = false,    close = true,    description = 'Space Ranger',},
        ['card_u_f_y_hotposh_01'] = {  label = 'Hot Posh',         weight = 10,    stack = false,    close = true,    description = 'Hot Posh',},
        ['card_ig_benny'] = {          label = 'Benny',            weight = 10,    stack = false,    close = true,    description = 'Benny',},
        ['card_u_f_y_dancelthr_01'] = { label = 'Raver',           weight = 10,    stack = false,    close = true,    description = 'Raver',},
        ['card_ig_vincent'] = {        label = 'Vincent',          weight = 10,    stack = false,    close = true,    description = 'Vincent',},
        ['card_s_m_y_valet_01'] = {    label = 'Felipe',           weight = 10,    stack = false,    close = true,    description = 'Felipe',},
        --######################################################  ls_landmark  #####################################################################################--
        ['card_los_santos_customs_burton'] = {  label = 'Los Santos Customs',                  weight = 10,    stack = false,    close = true,    description = 'Los Santos Customs Burton',},
        ['card_supermarket_24_7'] = {           label = '24/7 Supermarket',                    weight = 10,    stack = false,    close = true,    description = '24/7 Supermarket',},
        ['card_ltd_gasoline'] = {               label = 'LTD Gasoline',                        weight = 10,    stack = false,    close = true,    description = 'LTD Gasoline',},
        ['card_ammu_nation_downtown'] = {       label = 'Ammu-Nation',                         weight = 10,    stack = false,    close = true,    description = 'Ammu-Nation Downtown',},
        ['card_fleeca_bank'] = {                label = 'Fleeca Bank',                         weight = 10,    stack = false,    close = true,    description = 'Fleeca Bank',},
        ['card_vanilla_unicorn'] = {            label = 'Vanilla Unicorn',                     weight = 10,    stack = false,    close = true,    description = 'Vanilla Unicorn',},
        ['card_bean_machine'] = {               label = 'Bean Machine',                        weight = 10,    stack = false,    close = true,    description = 'Bean Machine',},
        ['card_burger_shot'] = {                label = 'Burger Shot',                         weight = 10,    stack = false,    close = true,    description = 'Burger Shot',},
        ['card_cluckin_bell'] = {               label = 'Cluckin\' Bell',                      weight = 10,    stack = false,    close = true,    description = 'Cluckin\' Bell',},
        ['card_up_n_atom_burger'] = {           label = 'Up-n-Atom Burger',                    weight = 10,    stack = false,    close = true,    description = 'Up-n-Atom Burger',},
        ['card_hookies'] = {                    label = 'Hookies',                             weight = 10,    stack = false,    close = true,    description = 'Hookies',},
        ['card_yellow_jack_inn'] = {            label = 'Yellow Jack Inn',                     weight = 10,    stack = false,    close = true,    description = 'Yellow Jack Inn',},
        ['card_liquor_ace'] = {                 label = 'Liquor Ace',                          weight = 10,    stack = false,    close = true,    description = 'Liquor Ace',},
        ['card_hen_house'] = {                  label = 'Hen House',                           weight = 10,    stack = false,    close = true,    description = 'Hen House',},
        ['card_tequi_la_la'] = {                label = 'Tequi-la-la',                         weight = 10,    stack = false,    close = true,    description = 'Tequi-la-la',},
        ['card_bahama_mamas'] = {               label = 'Bahama Mamas',                        weight = 10,    stack = false,    close = true,    description = 'Bahama Mamas',},
        ['card_los_santos_golf_club'] = {       label = 'Los Santos Golf Club',                weight = 10,    stack = false,    close = true,    description = 'Los Santos Golf Club',},
        ['card_vespucci_tennis_courts'] = {     label = 'Vespucci Tennis Courts',              weight = 10,    stack = false,    close = true,    description = 'Vespucci Tennis Courts',},
        ['card_public_library'] = {             label = 'Public Library',                      weight = 10,    stack = false,    close = true,    description = 'Public Library',},
        ['card_bishops_wtf_museum'] = {         label = 'Bishop\'s WTF Museum',                weight = 10,    stack = false,    close = true,    description = 'Bishop\'s WTF Museum',},
        ['card_del_perro_pier'] = {             label = 'Del Perro Pier',                      weight = 10,    stack = false,    close = true,    description = 'Del Perro Pier',},
        ['card_pacific_standard_bank'] = {      label = 'Pacific Standard Bank',               weight = 10,    stack = false,    close = true,    description = 'Pacific Standard Bank',},
        ['card_maze_bank_arena'] = {            label = 'Maze Bank Arena',                     weight = 10,    stack = false,    close = true,    description = 'Maze Bank Arena',},
        ['card_los_santos_international_airport'] = { label = 'Los Santos International Airport', weight = 10,  stack = false,    close = true,    description = 'Los Santos International Airport LSIA',},
        ['card_port_of_south_los_santos'] = {   label = 'Port of South Los Santos',            weight = 10,    stack = false,    close = true,    description = 'Port of South Los Santos',},
        ['card_union_depository'] = {           label = 'Union Depository',                    weight = 10,    stack = false,    close = true,    description = 'Union Depository',},
        ['card_fib_building'] = {               label = 'FIB Building',                        weight = 10,    stack = false,    close = true,    description = 'FIB Building',},
        ['card_iaa_building'] = {               label = 'IAA Building',                        weight = 10,    stack = false,    close = true,    description = 'IAA Building',},
        ['card_schlongberg_sachs_center'] = {   label = 'Schlongberg Sachs Center',            weight = 10,    stack = false,    close = true,    description = 'Schlongberg Sachs Center',},
        ['card_richards_majestic_studio'] = {   label = 'Richards Majestic Studio',            weight = 10,    stack = false,    close = true,    description = 'Richards Majestic Studio',},
        ['card_weazel_news_tower'] = {          label = 'Weazel News Tower',                   weight = 10,    stack = false,    close = true,    description = 'Weazel News Tower',},
        ['card_kortz_center'] = {               label = 'Kortz Center',                        weight = 10,    stack = false,    close = true,    description = 'Kortz Center',},
        ['card_ulsa_university'] = {            label = 'ULSA University',                     weight = 10,    stack = false,    close = true,    description = 'ULSA University',},
        ['card_st_fiacre_hospital'] = {         label = 'St. Fiacre Hospital',                 weight = 10,    stack = false,    close = true,    description = 'St. Fiacre Hospital',},
        ['card_central_los_santos_medical_center'] = { label = 'Central Los Santos Medical Center', weight = 10, stack = false, close = true, description = 'Central Los Santos Medical Center',},
        ['card_bolingbroke_penitentiary'] = {   label = 'Bolingbroke Penitentiary',            weight = 10,    stack = false,    close = true,    description = 'Bolingbroke Penitentiary',},
        ['card_palmer_taylor_power_station'] = { label = 'Palmer-Taylor Power Station',        weight = 10,    stack = false,    close = true,    description = 'Palmer-Taylor Power Station',},
        ['card_ron_alternates_wind_farm'] = {   label = 'RON Alternates Wind Farm',            weight = 10,    stack = false,    close = true,    description = 'RON Alternates Wind Farm',},
        ['card_davis_quartz_quarry'] = {        label = 'Davis Quartz Quarry',                 weight = 10,    stack = false,    close = true,    description = 'Davis Quartz Quarry',},
        ['card_redwood_lights_track'] = {       label = 'Redwood Lights Track',                weight = 10,    stack = false,    close = true,    description = 'Redwood Lights Track',},
        ['card_vinewood_sign'] = {              label = 'Vinewood Sign',                       weight = 10,    stack = false,    close = true,    description = 'Vinewood Sign',},
        ['card_galileo_observatory'] = {        label = 'Galileo Observatory',                 weight = 10,    stack = false,    close = true,    description = 'Galileo Observatory',},
        ['card_diamond_casino_resort'] = {      label = 'Diamond Casino & Resort',             weight = 10,    stack = false,    close = true,    description = 'Diamond Casino & Resort',},
        ['card_fort_zancudo'] = {               label = 'Fort Zancudo',                        weight = 10,    stack = false,    close = true,    description = 'Fort Zancudo Military Base',},
        ['card_humane_labs_and_research'] = {   label = 'Humane Labs and Research',            weight = 10,    stack = false,    close = true,    description = 'Humane Labs and Research',},
        ['card_land_act_dam'] = {               label = 'Land Act Dam',                        weight = 10,    stack = false,    close = true,    description = 'Land Act Dam',},
        ['card_mount_chiliad_cable_car'] = {    label = 'Mount Chiliad Cable Car',             weight = 10,    stack = false,    close = true,    description = 'Mount Chiliad Cable Car',},
        ['card_paleto_bay_sheriffs_office'] = { label = 'Paleto Bay Sheriff’s Office',         weight = 10,    stack = false,    close = true,    description = 'Paleto Bay Sheriff’s Office',},
        ['card_sandy_shores_airfield'] = {      label = 'Sandy Shores Airfield',               weight = 10,    stack = false,    close = true,    description = 'Sandy Shores Airfield',},
        ['card_grapeseed_oneil_ranch'] = {      label = 'Grapeseed O\'Neil Ranch',             weight = 10,    stack = false,    close = true,    description = 'Grapeseed O\'Neil Ranch',},
        ['card_dignity_village'] = {            label = 'Dignity Village',                     weight = 10,    stack = false,    close = true,    description = 'Dignity Village',},
        ['card_altruist_camp'] = {              label = 'Altruist Camp',                       weight = 10,    stack = false,    close = true,    description = 'Altruist Camp',},
        ['card_noose'] = {                      label = 'N.O.S.E',                             weight = 10,    stack = false,    close = true,    description = 'N.O.S.E',},
        ['card_los_santos_city_hall'] = {       label = 'Los Santos City Hall',                weight = 10,    stack = false,    close = true,    description = 'Los Santos City Hall',},
        ['card_mirror_park_lake'] = {           label = 'Mirror Park Lake',                    weight = 10,    stack = false,    close = true,    description = 'Mirror Park Lake',},
        ['card_maze_bank_tower'] = {            label = 'Maze Bank Tower',                     weight = 10,    stack = false,    close = true,    description = 'Maze Bank Tower The Tallest',},
        ['card_eclipse_towers'] = {             label = 'Eclipse Towers',                      weight = 10,    stack = false,    close = true,    description = 'Eclipse Towers',},
        ['card_playboy_mansion'] = {            label = 'Playboy Mansion',                     weight = 10,    stack = false,    close = true,    description = 'Playboy Mansion Richman Mansion',},
        ['card_the_lighthouse'] = {             label = 'The Lighthouse',                      weight = 10,    stack = false,    close = true,    description = 'The Lighthouse El Gordo',},
        ['card_mount_gordo'] = {                label = 'Mount Gordo',                         weight = 10,    stack = false,    close = true,    description = 'Mount Gordo',},
        ['card_mount_josiah'] = {               label = 'Mount Josiah',                        weight = 10,    stack = false,    close = true,    description = 'Mount Josiah',},
        ['card_cassidy_creek_bridge'] = {       label = 'Cassidy Creek Bridge',                weight = 10,    stack = false,    close = true,    description = 'Cassidy Creek Bridge',},
        ['card_raton_canyon'] = {               label = 'Raton Canyon',                        weight = 10,    stack = false,    close = true,    description = 'Raton Canyon',},
        ['card_north_yankton'] = {              label = 'North Yankton',                       weight = 10,    stack = false,    close = true,    description = 'North Yankton Ludendorff Church',},
        ['card_cayo_perico_mansion'] = {        label = 'Cayo Perico Mansion',                 weight = 10,    stack = false,    close = true,    description = 'Cayo Perico Mansion',},
        ['card_merryweather_hq'] = {            label = 'Merryweather HQ',                     weight = 10,    stack = false,    close = true,    description = 'Merryweather HQ Elysian Island',},
        ['card_coveted_cove'] = {               label = 'Coveted Cove',                        weight = 10,    stack = false,    close = true,    description = 'Coveted Cove',},
        ['card_calafia_bridge'] = {             label = 'Calafia Bridge',                      weight = 10,    stack = false,    close = true,    description = 'Calafia Bridge',},
        ['card_tongva_valley_waterfall'] = {    label = 'Tongva Valley Waterfall',             weight = 10,    stack = false,    close = true,    description = 'Tongva Valley Waterfall',},
        ['card_mount_chiliad_summit'] = {       label = 'Mount Chiliad Summit',                weight = 10,    stack = false,    close = true,    description = 'Mount Chiliad Summit',},
        ['card_the_sunken_ufo'] = {             label = 'The Sunken UFO',                      weight = 10,    stack = false,    close = true,    description = 'The Sunken UFO North of Paleto',},
        ['card_the_sunken_cargo_ship'] = {      label = 'The Sunken Cargo Ship',               weight = 10,    stack = false,    close = true,    description = 'The Sunken Cargo Ship',},
        ['card_the_abandoned_mine_shaft'] = {   label = 'The Abandoned Mine Shaft',            weight = 10,    stack = false,    close = true,    description = 'The Abandoned Mine Shaft',},
        ['card_the_infinity_8_killers_house'] = { label = 'The Infinity 8 Killer’s House',     weight = 10,    stack = false,    close = true,    description = 'The Infinity 8 Killer’s House',},
        ['card_the_epsilon_center'] = {         label = 'The Epsilon Center',                  weight = 10,    stack = false,    close = true,    description = 'The Epsilon Center',},
        ['card_the_big_orange'] = {             label = 'The Big Orange',                      weight = 10,    stack = false,    close = true,    description = 'The Big Orange Juice Stand',},
        ['card_the_giant_dinosaur'] = {         label = 'The Giant Dinosaur',                  weight = 10,    stack = false,    close = true,    description = 'The Giant Dinosaur Rex\'s Diner',},
        ['card_the_chiliad_mystery_mural'] = {  label = 'The Chiliad Mystery Mural',           weight = 10,    stack = false,    close = true,    description = 'The Chiliad Mystery Mural',},
        ['card_the_golden_tree'] = {            label = 'The Golden Tree',                     weight = 10,    stack = false,    close = true,    description = 'The Golden Tree',},
        ['card_the_underwater_plane_wreck'] = { label = 'The Underwater Plane Wreck',          weight = 10,    stack = false,    close = true,    description = 'The Underwater Plane Wreck',},
        ['card_de_santa_house'] = {             label = 'De Santa House',                      weight = 10,    stack = false,    close = true,    description = 'De Santa House',},
        ['card_trevors_house'] = {              label = 'Trevor\'s House',                     weight = 10,    stack = false,    close = true,    description = 'Trevor\'s House',},
        ['card_franklins_house'] = {            label = 'Franklins House',                     weight = 10,    stack = false,    close = true,    description = 'Franklins House',},
        ['card_lamar_davis_house'] = {          label = 'Lamar Davis House',                   weight = 10,    stack = false,    close = true,    description = 'Lamar Davis House',},
        ['card_lester_crests_house'] = {        label = 'Lester Crest\'s House',               weight = 10,    stack = false,    close = true,    description = 'Lester Crest\'s House',},
        ['card_ron_jakowski_house'] = {         label = 'Ron Jakowski House',                  weight = 10,    stack = false,    close = true,    description = 'Ron Jakowski House',},
        ['card_ls_river_concrete'] = {          label = 'Los Santos River',                    weight = 10,    stack = false,    close = true,    description = 'Los Santos River Drainage Canal',},
        ['card_vespucci_lifeguard_tower'] = {   label = 'Vespucci Beach',                      weight = 10,    stack = false,    close = true,    description = 'Vespucci Beach Lifeguard Tower',},
        ['card_grand_senora_highway'] = {       label = 'Grand Senora Desert',                 weight = 10,    stack = false,    close = true,    description = 'Grand Senora Desert Highway',},
        ['card_tinsel_towers'] = {              label = 'Tinsel Towers',                       weight = 10,    stack = false,    close = true,    description = 'Tinsel Towers',},
        ['card_the_jetty'] = {                  label = 'The Jetty',                           weight = 10,    stack = false,    close = true,    description = 'The Jetty',},
        ['card_pipeline_inn'] = {               label = 'Pipeline Inn',                        weight = 10,    stack = false,    close = true,    description = 'Pipeline Inn',},
        ['card_pillbox_hospital'] = {           label = 'Pillbox Hospital',                    weight = 10,    stack = false,    close = true,    description = 'Pillbox Hospital',},
        ['card_oil_fields'] = {                 label = 'Oil Fields',                          weight = 10,    stack = false,    close = true,    description = 'Oil Fields',},
        ['card_maahesclaw'] = {       label = 'maahesclaw',       weight = 10,    stack = false,    close = true,    description = 'maahesclaw',},
        ['card_maat_truth'] = {       label = 'maat truth',       weight = 10,    stack = false,    close = true,    description = 'maat truth',},
        ['card_maatlaw_truth'] = {    label = 'maatlaw truth',    weight = 10,    stack = false,    close = true,    description = 'maatlaw truth',},
        ['card_maatlawbalance'] = {   label = 'maatlawbalance',   weight = 10,    stack = false,    close = true,    description = 'maatlawbalance',},
        ['card_menkheper_ra'] = {     label = 'menkheper ra',     weight = 10,    stack = false,    close = true,    description = 'menkheper ra',},
        ['card_montu_striker'] = {    label = 'montu striker',    weight = 10,    stack = false,    close = true,    description = 'montu striker',},
        ['card_montu_warrior'] = {    label = 'montu warrior',    weight = 10,    stack = false,    close = true,    description = 'montu warrior',},
        ['card_montubreaker'] = {     label = 'montubreaker',     weight = 10,    stack = false,    close = true,    description = 'montubreaker',},
        ['card_montufury'] = {        label = 'montufury',        weight = 10,    stack = false,    close = true,    description = 'montufury',},
        ['card_nebet_majesty'] = {    label = 'nebet majesty',    weight = 10,    stack = false,    close = true,    description = 'nebet majesty',},
        ['card_neith_hunter'] = {     label = 'neith hunter',     weight = 10,    stack = false,    close = true,    description = 'neith hunter',},
        ['card_neitharrow'] = {       label = 'neitharrow',       weight = 10,    stack = false,    close = true,    description = 'neitharrow',},
        ['card_neithhunt'] = {        label = 'neithhunt',        weight = 10,    stack = false,    close = true,    description = 'neithhunt',},
        ['card_nephthys_shadow'] = {  label = 'nephthys shadow',  weight = 10,    stack = false,    close = true,    description = 'nephthys shadow',},
        ['card_nephthysdark'] = {     label = 'nephthysdark',     weight = 10,    stack = false,    close = true,    description = 'nephthysdark',},
        ['card_nephthysveil'] = {     label = 'nephthysveil',     weight = 10,    stack = false,    close = true,    description = 'nephthysveil',},
    
        
        -- Car Radio

        ['smallspeaker'] = {
		label = 'Small Speaker',
		weight = 150,
		stack = true,
		close = true,
        },
        ['mediumspeaker'] = {
            label = 'Medium Speaker',
            weight = 250,
            stack = true,
            close = true,
        },

        ['largespeaker'] = {
            label = 'Large Speaker',
            weight = 350,
            stack = true,
            close = true,
        },
        ['car_radio'] = {
            label = 'Car Radio',
            weight = 150,
            stack = true,
            close = true,
        },

        -- Chop Shop

        ['ls_auto_parts'] = {
            label = 'Vehicle Scrap',
            weight = 250,
        },

        -- ['ls_torch'] = {
        --     label = 'Torch',
        --     weight = 275,
        -- },

        -- ['ls_lug_wrench'] = {
        --     label = 'Lug Wrench',
        --     weight = 225,
        -- },

        ['ls_vehicle_finder'] = {
            label = 'Vehicle Locater',
            weight = 1000,
        },
        -- Drugs
        ['ls_plain_jane_seed'] = {
            label = 'Plain Jane Seed',
            weight = 5,
        },

        ['ls_plain_jane_bud'] = {
            label = 'Plain Jane Bud',
            weight = 5,
        },

        ['ls_plain_jane_bag'] = {
            label = 'Plain Jane Bag',
            weight = 10,
        },

        ['ls_plain_jane_joint'] = {
            label = 'Plain Jane Joint',
            weight = 10,
        },

        ['ls_banana_kush_seed'] = {
            label = 'Banana Kush Seed',
            weight = 5,
        },

        ['ls_banana_kush_bud'] = {
            label = 'Banana Kush Bud',
            weight = 5,
        },

        ['ls_banana_kush_bag'] = {
            label = 'Banana Kush Bag',
            weight = 10,
        },

        ['ls_banana_kush_joint'] = {
            label = 'Banana Kush Joint',
            weight = 10,
        },

        ['ls_blue_dream_seed'] = {
            label = 'Blue Dream Seed',
            weight = 5,
        },

        ['ls_blue_dream_bud'] = {
            label = 'Blue Dream Bud',
            weight = 5,
        },

        ['ls_blue_dream_bag'] = {
            label = 'Blue Dream Bag',
            weight = 10,
        },

        ['ls_blue_dream_joint'] = {
            label = 'Blue Dream Joint',
            weight = 10,
        },

        ['ls_purple_haze_seed'] = {
            label = 'Purple Haze Seed',
            weight = 5,
        },

        ['ls_purple_haze_bud'] = {
            label = 'Purple Haze Bud',
            weight = 5,
        },

        ['ls_purple_haze_bag'] = {
            label = 'Purple Haze Bag',
            weight = 10,
        },

        ['ls_purple_haze_joint'] = {
            label = 'Purple Haze Joint',
            weight = 10,
        },

        ['ls_orange_crush_seed'] = {
            label = 'Orange Crush Seed',
            weight = 5,
        },

        ['ls_orange_crush_bud'] = {
            label = 'Orange Crush Bud',
            weight = 5,
        },

        ['ls_orange_crush_bag'] = {
            label = 'Orange Crush Bag',
            weight = 10,
        },

        ['ls_orange_crush_joint'] = {
            label = 'Orange Crush Joint',
            weight = 10,
        },

        ['ls_cosmic_kush_seed'] = {
            label = 'Cosmic Kush Seed',
            weight = 5,
        },

        ['ls_cosmic_kush_bud'] = {
            label = 'Cosmic Kush Bud',
            weight = 5,
        },

        ['ls_cosmic_kush_bag'] = {
            label = 'Cosmic Kush Bag',
            weight = 10,
        },

        ['ls_cosmic_kush_joint'] = {
            label = 'Cosmic Kush Joint',
            weight = 10,
        },

        ['ls_rolling_paper'] = {
            label = 'Rolling Paper',
            weight = 5,
        },

        ['ls_empty_baggy'] = {
            label = 'Empty Baggy',
            weight = 5,
        },

        ['ls_access_card'] = {
            label = 'Access Card',
            weight = 15,
        },

        ['ls_watering_can'] = {
            label = 'Watering Can',
            weight = 3250,
            stack = false,
        },

        ['ls_fertilizer'] = {
            label = 'Fertilizer',
            weight = 1500,
            stack = false,
        },

        ['ls_plant_pot'] = {
            label = 'Plant Pot',
            weight = 25,
        },

        ['ls_shovel'] = {
            label = 'Shovel',
            weight = 75,
        },

        ['ls_shears'] = {
            label = 'Shears',
            weight = 10,
        },

        ['ls_weed_table'] = {
            label = 'Weed Table',
            weight = 1000,
            stack = false
        },
    -- Coke
        ['ls_coke_table'] = {
            label = 'Coke Table',
            weight = 1000,
        },

        ['ls_coca_seed'] = {
            label = 'Coca Seed',
            weight = 5,
        },

        ['ls_coca_leaf'] = {
            label = 'Coca Leaf',
            weight = 5,
        },

        ['ls_coca_ground'] = {
            label = 'Ground Coca',
            weight = 20,
        },

        ['ls_coca_base_unf'] = {
            label = 'Coca Base (unfinished)',
            weight = 40,
        },

        ['ls_coca_base'] = {
            label = 'Coca Base',
            weight = 50,
        },

        ['ls_cocaine_brick'] = {
            label = 'Cocaine Brick',
            weight = 100,
        },

        ['ls_crack_brick'] = {
            label = 'Crack Brick',
            weight = 100,
        },

        ['ls_baking_soda'] = {
            label = 'Baking Soda',
            weight = 25,
        },

        ['ls_gasoline'] = {
            label = 'Gasoline',
            weight = 1000,
            stack = false,
        },

        ['ls_cement'] = {
            label = 'Cement',
            weight = 2000,
            stack = false,
        },

        ['ls_cocaine_bag'] = {
            label = 'Cocaine',
            weight = 10,
        },

        ['ls_crack_bag'] = {
            label = 'Crack',
            weight = 10,
        },
        
        ["kq_meth_low"] = {
            label = "Meth (Low grade)",
            weight = 100,
            stack = true,
            close = true,
        },

        ["kq_meth_mid"] = {
            label = "Meth (Medium grade)",
            weight = 100,
            stack = true,
            close = true,
        },

        ["kq_meth_high"] = {
            label = "Meth (High grade)",
            weight = 100,
            stack = true,
            close = true,
        },

        ["kq_ethanol"] = {
            label = "Ethanol",
            weight = 200,
            stack = true,
            close = true,
        },

        ["kq_meth_pills"] = {
            label = "Pseudoephedrine",
            weight = 300,
            stack = true,
            close = true,
        },

        ["kq_lithium"] = {
            label = "Lithium pack",
            weight = 300,
            stack = true,
            close = true,
        },

        ["kq_acetone"] = {
            label = "Acetone",
            weight = 1000,
            stack = true,
            close = true,
        },

        ["kq_ammonia"] = {
            label = "Ammonia",
            weight = 1000,
            stack = true,
            close = true,
        },

        ["kq_meth_lab_kit"] = {
            label = "Meth cooking kit",
            weight = 3000,
            stack = true,
            close = true,
        },
    --Easter Event
    
        ['easter_egg_common'] = {
            label       = 'Easter Egg',
            weight      = 150,
            stack       = false,
            close       = true,
            description = 'A common Easter egg. Incubate it to crack it open.',
        },

        ['easter_egg_rare'] = {
            label       = 'OS Easter Egg',
            weight      = 150,
            stack       = false,
            close       = true,
            description = 'A rare Easter egg. Incubate it to crack it open.',
        },

        ['easter_eggshell'] = {
            label       = 'EggShells',
            weight      = 50,
            stack       = true,
            close       = false,
            description = 'Collect 50 eggshells and exchange them at the Easter Trader.',
        },    

}