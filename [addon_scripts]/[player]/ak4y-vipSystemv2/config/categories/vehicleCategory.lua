local preCategory = {
    label = "Vehicle", -- Category Label
    pageValue = "vehicle-menu", -- DONT Change page value (This is the page name value) ("vehicle-menu" for vehicle menu)
    categoryType = "vehicle", -- Dont change this value
    items = {
        {
            id = 1, -- Should be unique
            label = "Jubilee", -- Display name
            itemName = "amjubilee", -- Item name ( Spawn name for vehicle )
            filter = "Slider", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 3200, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 800, -- New price (if discount is active)
            },
            itemImg = "./itemImages/amjubilee.png", -- Item image
        },
        {
            id = 2, -- Should be unique 
            label = "Cavalcade XL", -- Display name
            itemName = "gstcavxl1", -- Item name ( Spawn name for vehicle )
            filter = "Slider", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4500, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/gstcavxl1.png", -- Item image
        },
        {
            id = 3, -- Should be unique 
            label = "Rebla GTS", -- Display name
            itemName = "gstreb1", -- Item name ( Spawn name for vehicle )
            filter = "Slider", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 3200, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/gstreb1.png", -- Item image
        },
        {
            id = 4, -- Should be unique 
            label = "Seminole GTS", -- Display name
            itemName = "gstsemxl1", -- Item name ( Spawn name for vehicle )
            filter = "Slider", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 3200, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/gstsemxl1.png", -- Item image
        },
        {
            id = 5, -- Should be unique 
            label = "Toros GTS", -- Display name
            itemName = "gsttoros1", -- Item name ( Spawn name for vehicle )
            filter = "Slider", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4500, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/gsttoros1.png", -- Item image
        },
        {
            id = 6, -- Should be unique 
            label = "Komoda I", -- Display name
            itemName = "komodai", -- Item name ( Spawn name for vehicle )
            filter = "Slider", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4500, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/komodai.png", -- Item image
        },
        {
            id = 7, -- Should be unique 
            label = "Rebla X", -- Display name
            itemName = "polyreblasuv", -- Item name ( Spawn name for vehicle )
            filter = "Slider", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 3200, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/polyreblasuv.png", -- Item image
        },
        {
            id = 8, -- Should be unique 
            label = "Rover Mini", -- Display name
            itemName = "PV_rover", -- Item name ( Spawn name for vehicle )
            filter = "Toy", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/PV_rover.png", -- Item image
        },
        {
            id = 9, -- Should be unique 
            label = "Banshee Mini", -- Display name
            itemName = "GODzBANSHEEM", -- Item name ( Spawn name for vehicle )
            filter = "Toy", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/GODzBANSHEEM.png", -- Item image
        },
        {
            id = 10, -- Should be unique 
            label = "S1 Toy Bike", -- Display name
            itemName = "toyretchs1", -- Item name ( Spawn name for vehicle )
            filter = "Toy", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 3000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/toyretchs1.png", -- Item image
        },
        {
            id = 11, -- Should be unique 
            label = "G2R Toy Bike", -- Display name
            itemName = "labstoyh2r", -- Item name ( Spawn name for vehicle )
            filter = "Toy", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 3000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/labstoyh2r.png", -- Item image
        },
        {
            id = 12, -- Should be unique 
            label = "RS666 Mini", -- Display name
            itemName = "rs666mini", -- Item name ( Spawn name for vehicle )
            filter = "Toy", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/rs666mini.png", -- Item image
        },
        {
            id = 13, -- Should be unique 
            label = "Warrener Custom", -- Display name
            itemName = "warrener3", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 1400, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/warrener3.png", -- Item image
        },
        {
            id = 14, -- Should be unique 
            label = "Boor Custom", -- Display name
            itemName = "boorbc", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 1400, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/boorbc.png", -- Item image
        },
        {
            id = 15, -- Should be unique 
            label = "500F", -- Display name
            itemName = "CB500F", -- Item name ( Spawn name for vehicle )
            filter = "Bike", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 2000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/CB500F.png", -- Item image
        },
        {
            id = 16, -- Should be unique 
            label = "EBR 1000R", -- Display name
            itemName = "ebr1000r", -- Item name ( Spawn name for vehicle )
            filter = "Bike", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4500, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/ebr1000r.png", -- Item image
        },
        {
            id = 17, -- Should be unique 
            label = "G2 Stretch", -- Display name
            itemName = "GODzNINJAH2", -- Item name ( Spawn name for vehicle )
            filter = "Bike", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 6000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/GODzNINJAH2.png", -- Item image
        },
        {
            id = 18, -- Should be unique 
            label = "Z Drift", -- Display name
            itemName = "godzdriftz", -- Item name ( Spawn name for vehicle )
            filter = "Drift", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/godzdriftz.png", -- Item image
        },
        {
            id = 19, -- Should be unique 
            label = "Boss Drift", -- Display name
            itemName = "GODzR35BOSS", -- Item name ( Spawn name for vehicle )
            filter = "Drift", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/GODzR35BOSS.png", -- Item image
        },
        {
            id = 20, -- Should be unique 
            label = "King Drift", -- Display name
            itemName = "GODzS14KING", -- Item name ( Spawn name for vehicle )
            filter = "Drift", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/GODzS14KING.png", -- Item image
        },
        {
            id = 21, -- Should be unique 
            label = "Chilly Bin", -- Display name
            itemName = "chillybin", -- Item name ( Spawn name for vehicle )
            filter = "Toy", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 1000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/chillybin.png", -- Item image
        },
        {
            id = 22, -- Should be unique 
            label = "BMX Glow", -- Display name
            itemName = "bmx2", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 750, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/bmx2.png", -- Item image
        },
        {
            id = 23, -- Should be unique 
            label = "NS Hearts", -- Display name
            itemName = "204sJDMSportscar", -- Item name ( Spawn name for vehicle )
            filter = "Tuner", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4800, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/204sJDMSportscar.png", -- Item image
        },
        {
            id = 24, -- Should be unique 
            label = "BabyZilla", -- Display name
            itemName = "204sBabyZilla", -- Item name ( Spawn name for vehicle )
            filter = "Tuner", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4800, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/204sBabyZilla.png", -- Item image
        },
        {
            id = 25, -- Should be unique 
            label = "ZK2", -- Display name
            itemName = "204sV10Rocket", -- Item name ( Spawn name for vehicle )
            filter = "Tuner", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4800, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/204sV10Rocket.png", -- Item image
        },
        {
            id = 26, -- Should be unique 
            label = "XR7", -- Display name
            itemName = "204sXR7", -- Item name ( Spawn name for vehicle )
            filter = "Tuner", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4800, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/204sXR7.png", -- Item image
        },
        {
            id = 27, -- Should be unique 
            label = "Giant Golf Cart", -- Display name
            itemName = "gcart", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 1800, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/gcart.png", -- Item image
        },
        {
            id = 28, -- Should be unique 
            label = "Noir Restricted", -- Display name
            itemName = "gstsimplisticecorche1", -- Item name ( Spawn name for vehicle )
            filter = "Crown Test A", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 5000000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/crowntest.png", -- Item image
        },
        {
            id = 29, -- Should be unique 
            label = "Mach 620X", -- Display name
            itemName = "620gtsanim", -- Item name ( Spawn name for vehicle )
            filter = "Crown Test B", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 5000000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/crowntest.png", -- Item image
        },
        {
            id = 30, -- Should be unique 
            label = "Sentinel Coupe", -- Display name
            itemName = "204sSentinelCoupe", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 5200, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/204sSentinelCoupe.png", -- Item image
        },
        {
            id = 31, -- Should be unique 
            label = "Comet T", -- Display name
            itemName = "204sCometS", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 5200, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/204sCometS.png", -- Item image
        },
        {
            id = 32, -- Should be unique 
            label = "Cupid Kuruma", -- Display name
            itemName = "204sKurumaX", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 5200, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/204sKurumaX.png", -- Item image
        },
        {
            id = 33, -- Should be unique 
            label = "Pure", -- Display name
            itemName = "204spure", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 1800, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/204spure.png", -- Item image
        },
        {
            id = 34, -- Should be unique 
            label = "Track Cat", -- Display name
            itemName = "GODzTRACKCAT", -- Item name ( Spawn name for vehicle )
            filter = "Muscle", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 5000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/GODzTRACKCAT.png", -- Item image
        },
        {
            id = 35, -- Should be unique 
            label = "The Gauntlet", -- Display name
            itemName = "rrgauntcustom", -- Item name ( Spawn name for vehicle )
            filter = "Muscle", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 5000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/rrgauntcustom.png", -- Item image
        },
        {
            id = 36, -- Should be unique 
            label = "Seminole R", -- Display name
            itemName = "rrseminoleex", -- Item name ( Spawn name for vehicle )
            filter = "Muscle", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 5000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/rrseminoleex.png", -- Item image
        },
        {
            id = 37, -- Should be unique 
            label = "The Cozy", -- Display name
            itemName = "cozycoupe", -- Item name ( Spawn name for vehicle )
            filter = "Toy", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 1800, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/cozycoupe.png", -- Item image
        },
        {
            id = 38, -- Should be unique 
            label = "Shopping Kart", -- Display name
            itemName = "skart", -- Item name ( Spawn name for vehicle )
            filter = "Toy", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 1800, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/skart.png", -- Item image
        },
        {
            id = 39, -- Should be unique 
            label = "Blazer Trick", -- Display name
            itemName = "204sTrick", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 1800, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/204sTrick.png", -- Item image
        },
        {
            id = 40, -- Should be unique 
            label = "Hissi", -- Display name
            itemName = "204sKittyIssi", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/204sKittyIssi.png", -- Item image
        },
        {
            id = 41, -- Should be unique 
            label = "PurrMobile", -- Display name
            itemName = "DRcEvoX", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/DRcEvoX.png", -- Item image
        },
        {
            id = 42, -- Should be unique 
            label = "Jester X", -- Display name
            itemName = "GODzHYCADEMK4V2", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 5000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/GODzHYCADEMK4V2.png", -- Item image
        },
        {
            id = 43, -- Should be unique 
            label = "S95 RR", -- Display name
            itemName = "gr86", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 5000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/gr86.png", -- Item image
        },
        {
            id = 44, -- Should be unique 
            label = "EVX Drift", -- Display name
            itemName = "GODzEVXDRIFT", -- Item name ( Spawn name for vehicle )
            filter = "Drift", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 1800, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/GODzEVXDRIFT.png", -- Item image
        },
        {
            id = 45, -- Should be unique 
            label = "Brunki Kart", -- Display name
            itemName = "GODzD75BRONCO4DRSEMAKART", -- Item name ( Spawn name for vehicle )
            filter = "Toy", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 3000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/GODzD75BRONCO4DRSEMAKART.png", -- Item image
        },
        {
            id = 46, -- Should be unique 
            label = "Pit Bike", -- Display name
            itemName = "HBLMINIDRAG_V2", -- Item name ( Spawn name for vehicle )
            filter = "Toy", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 1800, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/HBLMINIDRAG_V2.png", -- Item image
        },
        {
            id = 47, -- Should be unique 
            label = "Monster Caddy", -- Display name
            itemName = "GODzMONSTERCADDI4SEAT", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 3000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/GODzMONSTERCADDI4SEAT.png", -- Item image
        },
        {
            id = 48, -- Should be unique 
            label = "Aquashift Restricted", -- Display name
            itemName = "GODzXC1HOVERCRAFT", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 2500, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/GODzXC1HOVERCRAFT.png", -- Item image
        },
        {
            id = 49, -- Should be unique 
            label = "G4 Wagon Mini", -- Display name
            itemName = "g4m82touringrc", -- Item name ( Spawn name for vehicle )
            filter = "Toy", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/g4m82touringrc.png", -- Item image
        },
        {
            id = 50, -- Should be unique 
            label = "Zenith Offroad Mini", -- Display name
            itemName = "offzenithrc", -- Item name ( Spawn name for vehicle )
            filter = "Toy", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/offzenithrc.png", -- Item image
        },
        {
            id = 51, -- Should be unique 
            label = "Obey Sport Mini", -- Display name
            itemName = "obeysportrc", -- Item name ( Spawn name for vehicle )
            filter = "Toy", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/obeysportrc.png", -- Item image
        },
        {
            id = 52, -- Should be unique 
            label = "Limo Mini", -- Display name
            itemName = "dc500lrc", -- Item name ( Spawn name for vehicle )
            filter = "Toy", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 4000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/dc500lrc.png", -- Item image
        },
        {
            id = 53, -- Should be unique 
            label = "Ruckus", -- Display name
            itemName = "delcuhdiak2", -- Item name ( Spawn name for vehicle )
            filter = "Truck", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 5000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/delcuhdiak2.png", -- Item image
        },
        {
            id = 54, -- Should be unique 
            label = "Mudhawk", -- Display name
            itemName = "bcsummit2500hd", -- Item name ( Spawn name for vehicle )
            filter = "Truck", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 5000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/bcsummit2500hd.png", -- Item image
        },
        {
            id = 55, -- Should be unique 
            label = "Stretched S1", -- Display name
            itemName = "clretchs1", -- Item name ( Spawn name for vehicle )
            filter = "Bike", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 6000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/clretchs1.png", -- Item image
        },
        {
            id = 56, -- Should be unique 
            label = "Sassy Q6", -- Display name
            itemName = "EZAshR6", -- Item name ( Spawn name for vehicle )
            filter = "Bike", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 6000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/EZAshR6.png", -- Item image
        },
        {
            id = 57, -- Should be unique 
            label = "Mini RH7", -- Display name
            itemName = "gstrh5pm1", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 5000, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/gstrh5pm1.png", -- Item image
        },
        {
            id = 58, -- Should be unique 
            label = "Tri-Caddy", -- Display name
            itemName = "sportcaddy", -- Item name ( Spawn name for vehicle )
            filter = "Other", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 1500, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/sportcaddy.png", -- Item image
        },
        {
            id = 59, -- Should be unique 
            label = "Little Pony", -- Display name
            itemName = "ponyy", -- Item name ( Spawn name for vehicle )
            filter = "Toy", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 1500, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/ponyy.png", -- Item image
        },
        {
            id = 60, -- Should be unique 
            label = "Fluffy Unicorn", -- Display name
            itemName = "unicorn", -- Item name ( Spawn name for vehicle )
            filter = "Toy", -- Filter name
            itemType = "vehicle", -- Item type || vehicle, air, boat...
            itemCount = 1, -- Just 1 for vehicle
            garage = "Legion Square", -- Garage name (When you buy this vehicle, it will be stored in this garage)
            price = 1500, -- Price (Without discount)
            testable = true, -- If you want to test this vehicle, set it to true
            graph = { -- Graphical settings...
                { label = "Engine", stat = 100, fa = "fa-solid fa-gauge-simple-high" }, 
                { label = "Brakes", stat = 100, fa = "fa-solid fa-angles-down" },
                { label = "Suspension", stat = 100, fa = "fa-solid fa-car-rear" },
            },
            discount = { -- Discount settings...
                state = false, -- If you want to discount, set it to true
                newPrice = 300, -- New price (if discount is active)
            },
            itemImg = "./itemImages/unicorn.png", -- Item image
        },
                                  
    },
}

Citizen.Wait(10)

if Settings.Debug then
    Settings.DebugPrint("Vehicle Category Preloaded", json.encode(preCategory))
end

table.insert(AK4Y.Categories, preCategory)
