local preCategory = {
    label = "Bundle",
    pageValue = "bundle-menu",
    categoryType = "bundle",
    items = {
        {
            id = 1, -- Should be unique 
            label = "Mini Cars", -- Display name
            itemType = "bundle", -- Type of item (JUST BUNDLE)
            giveItems = { -- item types: "vehicle", "item", "money", "weapon"
                { label = "Rover Mini", itemName = "PV_rover", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/PV_rover.png" },
                { label = "Banshee Mini", itemName = "GODzBANSHEEM", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/GODzBANSHEEM.png" },
                { label = "RS666 Mini", itemName = "rs666mini", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/rs666mini.png" },
            },
            price = 10000, -- Price (Without discount)
            description = "A collection of mini cars. Compact, colorful, and full of charm.",
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
        },
        {
            id = 2, -- Should be unique 
            label = "Toy Bikes", -- Display name
            itemType = "bundle", -- Type of item (JUST BUNDLE)
            giveItems = { -- item types: "vehicle", "item", "money", "weapon"
                { label = "S1 Toy Bike", itemName = "toyretchs1", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/toyretchs1.png" },
                { label = "G2R Toy Bike", itemName = "labstoyh2r", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/labstoyh2r.png" },
            },
            price = 5000, -- Price (Without discount)
            description = "A fun collection of small, tiny bikes that are perfect for little spaces and big imaginations!",
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
        },
        {
            id = 3, -- Should be unique 
            label = "Sliders v1", -- Display name
            itemType = "bundle", -- Type of item (JUST BUNDLE)
            giveItems = { -- item types: "vehicle", "item", "money", "weapon"
                { label = "Jubilee", itemName = "amjubilee", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/amjubilee.png" },
                { label = "Rebla GTS", itemName = "gstreb1", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/gstreb1.png" },
                { label = "Seminole GTS", itemName = "gstsemxl1", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/gstsemxl1.png" },
                { label = "Rebla X", itemName = "polyreblasuv", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/polyreblasuv.png" },
            },
            price = 11000, -- Price (Without discount)
            description = "A set of sleek, fast-moving cars designed for endless fun!",
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
        },
        {
            id = 4, -- Should be unique 
            label = "Sliders v2", -- Display name
            itemType = "bundle", -- Type of item (JUST BUNDLE)
            giveItems = { -- item types: "vehicle", "item", "money", "weapon"
                { label = "Toros GTS", itemName = "gsttoros1", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/gsttoros1.png" },
                { label = "Komoda I", itemName = "komodai", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/komodai.png" },
                { label = "Cavalcade XL", itemName = "gstcavxl1", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/gstcavxl1.png" },
            },
            price = 11000, -- Price (Without discount)
            description = "A collection of fast, smooth-gliding cars delivering action every time.",
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
        },
        {
            id = 5, -- Should be unique 
            label = "Bikes", -- Display name
            itemType = "bundle", -- Type of item (JUST BUNDLE)
            giveItems = { -- item types: "vehicle", "item", "money", "weapon"
                { label = "500F", itemName = "CB500F", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/CB500F.png" },
                { label = "EBR 1000R", itemName = "ebr1000r", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/ebr1000r.png" },
                { label = "G2 Stretch", itemName = "GODzNINJAH2", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/GODzNINJAH2.png" },
            },
            price = 11000, -- Price (Without discount)
            description = "Rev up the fun with this set of bikes!",
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
        },
        {
            id = 6, -- Should be unique 
            label = "Drift", -- Display name
            itemType = "bundle", -- Type of item (JUST BUNDLE)
            giveItems = { -- item types: "vehicle", "item", "money", "weapon"
                { label = "Z Drift", itemName = "godzdriftz", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/godzdriftz.png" },
                { label = "Boss Drift", itemName = "GODzR35BOSS", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/GODzR35BOSS.png" },
                { label = "King Drift", itemName = "GODzS14KING", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/GODzS14KING.png" },
            },
            price = 10000, -- Price (Without discount)
            description = "Get ready to hit the track and drift like a pro with this collection!",
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
        },
        {
            id = 7, -- Should be unique 
            label = "Tuner", -- Display name
            itemType = "bundle", -- Type of item (JUST BUNDLE)
            giveItems = { -- item types: "vehicle", "item", "money", "weapon"
                { label = "NS Hearts", itemName = "204sJDMSportscar", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/204sJDMSportscar.png" },
                { label = "BabyZilla", itemName = "204sBabyZilla", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/204sBabyZilla.png" },
                { label = "ZK2", itemName = "204sV10Rocket", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/204sV10Rocket.png" },
                { label = "XR7", itemName = "204sXR7", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/204sXR7.png" },
            },
            price = 14000, -- Price (Without discount)
            description = "Unleash peak performance and style with our ultimate tuner car collection.",
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
        },
        {
            id = 8, -- Should be unique 
            label = "Duo", -- Display name
            itemType = "bundle", -- Type of item (JUST BUNDLE)
            giveItems = { -- item types: "vehicle", "item", "money", "weapon"
                { label = "Sentinel Coupe", itemName = "204sSentinelCoupe", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/204sSentinelCoupe.png" },
                { label = "Comet T", itemName = "204sCometS", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/204sCometS.png" },
            },
            price = 10000, -- Price (Without discount)
            description = "Drive this perfect pair around the city!",
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
        },
        {
            id = 9, -- Should be unique 
            label = "Muscle", -- Display name
            itemType = "bundle", -- Type of item (JUST BUNDLE)
            giveItems = { -- item types: "vehicle", "item", "money", "weapon"
                { label = "Track Cat", itemName = "GODzTRACKCAT", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/GODzTRACKCAT.png" },
                { label = "The Gauntlet", itemName = "rrgauntcustom", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/rrgauntcustom.png" },
                { label = "Seminole R", itemName = "rrseminoleex", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/rrseminoleex.png" },
            },
            price = 13000, -- Price (Without discount)
            description = "Get ready to dominate the streets with these muscle cars!",
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
        },
        {
            id = 10, -- Should be unique 
            label = "Purrfect Pair", -- Display name
            itemType = "bundle", -- Type of item (JUST BUNDLE)
            giveItems = { -- item types: "vehicle", "item", "money", "weapon"
                { label = "Hissi", itemName = "204sKittyIssi", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/204sKittyIssi.png" },
                { label = "PurrMobile", itemName = "DRcEvoX", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/DRcEvoX.png" },
            },
            price = 7000, -- Price (Without discount)
            description = "Awww, it's just so purrfect!",
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
        },
        {
            id = 11, -- Should be unique 
            label = "Twin Turbo", -- Display name
            itemType = "bundle", -- Type of item (JUST BUNDLE)
            giveItems = { -- item types: "vehicle", "item", "money", "weapon"
                { label = "Jester X", itemName = "GODzHYCADEMK4V2", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/GODzHYCADEMK4V2.png" },
                { label = "S95 RR", itemName = "gr86", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/gr86.png" },
            },
            price = 8000, -- Price (Without discount)
            description = "Twin turbos, double the thrill.",
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
        },
        {
            id = 12, -- Should be unique 
            label = "Mini Cars v2", -- Display name
            itemType = "bundle", -- Type of item (JUST BUNDLE)
            giveItems = { -- item types: "vehicle", "item", "money", "weapon"
                { label = "G4 Wagon Mini", itemName = "g4m82touringrc", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/g4m82touringrc.png" },
                { label = "Zenith Offroad Mini", itemName = "offzenithrc", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/offzenithrc.png" },
                { label = "Obey Sport Mini", itemName = "obeysportrc", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/obeysportrc.png" },
            },
            price = 10000, -- Price (Without discount)
            description = "A pocket sized fleet of tiny rides. Bright, bold, and adorable.",
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
        },
        {
            id = 13, -- Should be unique 
            label = "Truck", -- Display name
            itemType = "bundle", -- Type of item (JUST BUNDLE)
            giveItems = { -- item types: "vehicle", "item", "money", "weapon"
                { label = "Ruckus", itemName = "delcuhdiak2", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/delcuhdiak2.png" },
                { label = "Mudhawk", itemName = "bcsummit2500hd", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/bcsummit2500hd.png" },
            },
            price = 8000, -- Price (Without discount)
            description = "Two trucks packed with power.",
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
        },
        {
            id = 14, -- Should be unique 
            label = "His & Hers", -- Display name
            itemType = "bundle", -- Type of item (JUST BUNDLE)
            giveItems = { -- item types: "vehicle", "item", "money", "weapon"
                { label = "Stretched S1", itemName = "clretchs1", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/clretchs1.png" },
                { label = "Sassy Q6", itemName = "EZAshR6", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/EZAshR6.png" },
            },
            price = 10000, -- Price (Without discount)
            description = "For you and your boo.",
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
        },
        {
            id = 15, -- Should be unique 
            label = "Twin Tails", -- Display name
            itemType = "bundle", -- Type of item (JUST BUNDLE)
            giveItems = { -- item types: "vehicle", "item", "money", "weapon"
                { label = "Little Pony", itemName = "ponyy", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/ponyy.png" },
                { label = "Fluffy Unicorn", itemName = "unicorn", itemCount = 1, itemType = "vehicle", garage = "Legion Square", itemImg = "./itemImages/unicorn.png" },
            },
            price = 2500, -- Price (Without discount)
            description = "Two cute ponies, perfectly paired.",
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 950, -- New price (if discount is active)
            },
        },
    },
},

Citizen.Wait(10)

if Settings.Debug then
    Settings.DebugPrint("Bundle Category Preloaded", json.encode(preCategory))
end

table.insert(AK4Y.Categories, preCategory)