local preCategory = {
    label = "Misc",
    pageValue = "customize-menu",
    categoryType = "customize",
    items = {
        -- {
        --     id = 1, -- should be unique
        --     price = 1000, -- Price (Without discount)
        --     label = "Plate Change", -- Display name
        --     itemType = "plate", -- Dont change for plate customizations.
        --     itemImg = "./itemImages/plate.png", -- Item image
        --     discount = { state = false, newPrice = 0 }, -- If you want to discount, set it to true
        -- },
        {
            id = 1, -- should be unique
            price = 1500, -- Price (Without discount)
            label = "Number Change", -- Display name
            itemType = "number", -- Dont change for number customizations.
            itemImg = "./itemImages/phone.png", -- Item image
            discount = { state = false, newPrice = 0 }, -- If you want to discount, set it to true
        },
        {
            id = 2, -- should be unique
            label = "Boom-Box (SMALL)", -- item label 
            itemName = "smallspeaker", -- item name (used for giving item))
            itemType = "item", -- item type (item, weapon, etc)
            itemCount = 1, -- how many items should be given
            price = 250, -- item price (without discount)
            filter = "Tool", -- item filter (used for filtering items)
            description = "Portable boombox to play music on the go!",
            discount = { -- discount state and new price
                state = false, -- discount state
                newPrice = 500, -- new price (will be calculated with discount percentage if discount is active)
            },
            itemImg = "./itemImages/smallspeaker.png", -- item image path
        },
        {
            id = 3, -- should be unique
            label = "Boom-Box (MEDIUM)", -- item label 
            itemName = "mediumspeaker", -- item name (used for giving item))
            itemType = "item", -- item type (item, weapon, etc)
            itemCount = 1, -- how many items should be given
            price = 500, -- item price (without discount)
            filter = "Tool", -- item filter (used for filtering items)
            description = "Portable boombox to play music on the go!",
            discount = { -- discount state and new price
                state = false, -- discount state
                newPrice = 500, -- new price (will be calculated with discount percentage if discount is active)
            },
            itemImg = "./itemImages/mediumspeaker.png", -- item image path
        },
    },
},

Citizen.Wait(10)

if Settings.Debug then
    Settings.DebugPrint("Customize Category Preloaded", json.encode(preCategory))
end

table.insert(AK4Y.Categories, preCategory)