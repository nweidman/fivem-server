---@diagnostic disable: missing-fields
---@enum ECategoryInventoryPets
ECategoryInventoryPets = {
    COLLAR = 0,
    FUR = 1,
    LEASH = 2,
    BOWL = 3,
    CLOTHES = 4,
    TOYS = 5,
    FOOD = 6,
    DRINKS = 7,
    TRAINING = 8,
}

---@type { [string]: InventoryItemSpec }
InventoryItemSpecs = {
    -------------------
    --   Training    --
    -------------------
    ["dummy"] = {
        label = "Dummy",
        category = ECategoryInventoryPets.TRAINING,
        stack = false,
        description = "Dummy item for testing.",
        canbeRemoved = true,
        usable = true,
        isK9 = true,
        onUse = {
            event = "cdev_pets:useDummy",
            data = { staminaDecrease = PublicSharedPetsConfig.K9.Skills.training.Dummy.StaminaDecrease },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["cone"] = {
        label = "Cones",
        category = ECategoryInventoryPets.TRAINING,
        stack = false,
        description = "Tunnel item for testing.",
        canbeRemoved = true,
        usable = true,

        isK9 = true,
        onUse = {
            event = "cdev_pets:useCones",
            data = { staminaDecrease = PublicSharedPetsConfig.K9.Skills.training.Cones.StaminaDecrease },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["ramp"] = {
        label = "Ramp",
        category = ECategoryInventoryPets.TRAINING,
        stack = false,
        description = "Tunnel item for testing.",
        canbeRemoved = true,
        usable = true,
        isK9 = true,
        onUse = {
            event = "cdev_pets:useRampa",
            data = { staminaDecrease = PublicSharedPetsConfig.K9.Skills.training.Ramp.StaminaDecrease },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["hoop"] = {
        label = "Hoop",
        category = ECategoryInventoryPets.TRAINING,
        stack = true,
        description =
        "A great option for playing with pets, especially dogs. They are simple, straightforward, and effective toys that can be used for playing fetch or rolling around the house or yard.",
        canbeRemoved = true,
        usable = true,

        isK9 = true,
        onUse = {
            event = "cdev_pets:UseHoop",
            data = { staminaDecrease = PublicSharedPetsConfig.K9.Skills.training.Hoop.StaminaDecrease },
            net = false,
            close = true,
            preventRestoreState = true,
        }
    },
    -------------------
    --     Toys      --
    -------------------
    ["baseball"] = {
        label = "Baseball",
        category = ECategoryInventoryPets.TOYS,
        stack = true,
        description =
        "A great option for playing with pets, especially dogs. They are simple, straightforward, and effective toys that can be used for playing fetch or rolling around the house or yard.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBall",
            data = {},
            net = false,
            close = true,
            preventRestoreState = true,
        }
    },
    -------------------
    --     Drinks    --
    -------------------
    ["cleanwater"] = {
        label = "Water Gallon",
        category = ECategoryInventoryPets.DRINKS,
        stack = true,
        description =
        "A great option for pets as it helps keep them hydrated and healthy. It is recommended to provide filtered water to pets to protect them from toxins that can be present in tap water.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 30,
        },
        onUse = {
            event = "cdev_pets:useWater",
            data = {},
            net = false,
            close = true,
            preventRestoreState = true,
        }
    },
    -------------------
    --     Food      --
    -------------------
    ["petfood1"] = {
        label = "Chicken Dog Food",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for dogs, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 14,
        },
        onUse = {
            event = "cdev_pets:useFood",
            data = {},
            close = true,
        }
    },
    ["petfood2"] = {
        label = "Porterhouse Dog Food",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for dogs, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 16,
        },
        onUse = {
            event = "cdev_pets:useFood",
            data = {},
            close = true,
        }
    },
    ["petfood3"] = {
        label = "Filetmignon Dog Food",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for dogs, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 20,
        },
        onUse = {
            event = "cdev_pets:useFood",
            data = {},
            close = true,
        }
    },
    ["petfood4"] = {
        label = "Paté Poultry Platter",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for cats, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 20,
        },
        onUse = {
            event = "cdev_pets:useFood",
            data = {},
            close = true,
        },
    },
    ["petfood5"] = {
        label = "Tasty Treasure Paté",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for cats, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 20,
        },
        onUse = {
            event = "cdev_pets:useFood",
            data = {},
            close = true,
        },
    },
    ["petfood6"] = {
        label = "Proactive Health",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for cats, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 20,
        },
        onUse = {
            event = "cdev_pets:useFood",
            data = {},
            close = true,
        },
    },
    ["pettreat1"] = {
        label = "Beef & Bacon Biscuits",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for dogs, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 10,
        },
        onUse = {
            event = "cdev_pets:useTreat",
            data = {},
            close = true,
        }
    },
    ["pettreat2"] = {
        label = "Yogurt Biscuits",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for dogs, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 14,
        },
        onUse = {
            event = "cdev_pets:useTreat",
            data = {},
            close = true,
        }
    },
    ["pettreat3"] = {
        label = "Peanut Butter Biscuits",
        category = ECategoryInventoryPets.FOOD,
        stack = true,
        description =
        "A tasty and nutritious meal for dogs, packed with essential nutrients for their overall health and well-being.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 14,
        },
        onUse = {
            event = "cdev_pets:useTreat",
            data = {},
            close = true,
        }
    },
    -------------------
    --     Health    --
    -------------------
    ["petmedlow"] = {
        label = "Pet Medkit (Low Effect)",
        stack = false,
        description =
        "The Pet Medkit (Low Effect) is a compact first aid kit for pets. It contains basic supplies to address minor injuries and ailments, providing immediate care and peace of mind for your furry friend.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 10,
        },
        onUse = {
            event = "cdev_pets:useMedication",
            data = {},
            close = true,
            preventRestoreState = true,
        }
    },
    ["petmedmed"] = {
        label = "Pet Medkit (Medium Effect)",
        stack = false,
        description =
        "The Pet Medkit (Medium Effect) is a comprehensive first aid kit for pets, providing intermediate medical support. With a wider range of supplies and treatments, it equips you to handle moderate injuries and health issues. Convenient and reliable, it's designed to ensure your pet's well-being in various emergencies.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 25,
        },
        onUse = {
            event = "cdev_pets:useMedication",
            data = {},
            close = true,
            preventRestoreState = true,
        }
    },
    ["petmedhigh"] = {
        label = "Pet Medkit (High Effect)",
        stack = false,
        description =
        "The Pet Medkit (High Effect) is an advanced and powerful first aid kit for pets. With a wide array of supplies and treatments, it provides strong medical support for addressing serious injuries and health conditions. Designed to handle high-impact emergencies, this medkit offers comprehensive care and ensures your pet's well-being in critical situations.",
        canbeRemoved = true,
        usable = true,
        metadata = {
            refill = 50,
        },
        onUse = {
            event = "cdev_pets:useMedication",
            data = {},
            close = true,
            preventRestoreState = true,
        }
    },
    -------------------
    --     Leash     --
    -------------------
    ["leashgreen"] = {
        label = "Green Leash",
        category = ECategoryInventoryPets.LEASH,
        stack = false,
        description = "Take your dog for a walk.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useLeash",
            data = {
                prop = "leashgreen",
                offset = vector3(0.18, -0.0, -0.02),
                rotation = vector3(300.0, 0.0, 0.0),
            },
            close = true,
            preventRestoreState = true,
        }
    },
    ------------------
    -- Outfit Shoes --
    -------------------
    -- Long Boots
    ["yellowbootslong"] = {
        label = "Yellow Boots Long",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A good rain day shoes for your pet color yellow",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 1,
                texture = 0,
            },
            close = true,
        }
    },
    ["bluebootslong"] = {
        label = "Cyan Boots Long",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A good rain day shoes for your pet, color cyan",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 1,
                texture = 1,
            },
            close = true,
        }
    },
    ["redbootslong"] = {
        label = "Red Boots Long",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A good rain day shoes for your pet, color red",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 1,
                texture = 2,
            },
            close = true,
        }
    },
    ["pinkyellowbootslong"] = {
        label = "Yellow/Pink Boots Long",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A good rain day shoes for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 1,
                texture = 3,
            },
            close = true,
        }
    },
    ["pinkbootslong"] = {
        label = "Pink Boots Long",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A good rain day shoes for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 1,
                texture = 4,
            },
            close = true,
        }
    },
    ["yellowboots"] = {
        label = "Light Green Boots Long",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A good rain day shoes for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 1,
                texture = 5,
            },
            close = true,
        }
    },
    ["blueboots"] = {
        label = "Blue Boots Long",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A good rain day shoes for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 1,
                texture = 6,
            },
            close = true,
        }
    },
    ["greenboots"] = {
        label = "Green Boots Long",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A good rain day shoes for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 1,
                texture = 7,
            },
            close = true,
        }
    },
    -- Snow Boots
    ["purpleshoes"] = {
        label = "Snow Purple Boots",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Good for cold feet in purple color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 0,
            },
            close = true,
        }
    },
    ["snowbootsgray"] = {
        label = "Snow Gray Boots",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Good for cold feet in gray color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 1,
            },
            close = true,
        }
    },
    ["snowbootsblue"] = {
        label = "Snow Cyan Boots",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Good for cold feet in cyan color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 2,
            },
            close = true,
        }
    },
    ["pinkwhitesnowboots"] = {
        label = "Snow Pink and white Boots",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Good for cold feet in pink and white color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 3,
            },
            close = true,
        }
    },
    ["darkbluesnowboots"] = {
        label = "Snow Dark Blue Boots",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Good for cold feet in dark blue color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 4,
            },
            close = true,
        }
    },
    ["yellowsnowboots"] = {
        label = "Snow Green and Yellow Boots",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Good for cold feet in green and yellow color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 5,
            },
            close = true,
        }
    },
    ["pinksnowboots"] = {
        label = "Snow Pink Boots",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Good for cold feet in pink color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 6,
            },
            close = true,
        }
    },
    ["greywhitesnowboots"] = {
        label = "Snow Grey and White Boots",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Good for cold feet in grey and white color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 7,
            },
            close = true,
        }
    },
    ["darkgreensnowboots"] = {
        label = "Snow Dark Green Boots",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Good for cold feet in dark green color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 2,
                texture = 8,
            },
            close = true,
        }
    },
    -- Sneaker
    ["sneakersblue"] = {
        label = "Sneakers Cyan",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Beautiful sneakers in cyan color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 3,
                texture = 0,
            },
            close = true,
        }
    },
    ["sneakerspurple"] = {
        label = "Sneakers Purple",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Beautiful sneakers in purple color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 3,
                texture = 1,
            },
            close = true,
        }
    },
    ["sneakersgreen"] = {
        label = "Sneakers Green",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Beautiful sneakers in green color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 3,
                texture = 2,
            },
            close = true,
        }
    },
    ["redboots"] = {
        label = "Sneakers Red",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Beautiful sneakers in red color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 3,
                texture = 3,
            },
            close = true,
        }
    },
    ["beigeboots"] = {
        label = "Sneakers Beige",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Beautiful sneakers in beige color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 3,
                texture = 4,
            },
            close = true,
        }
    },
    ["bluedarklightboots"] = {
        label = "Sneakers Dark Blue",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Beautiful sneakers in dark blue color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 3,
                texture = 5,
            },
            close = true,
        }
    },
    ["yelloworangeboots"] = {
        label = "Sneakers Yellow and Orange",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Beautiful sneakers in yellow and orange color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 3,
                texture = 6,
            },
            close = true,
        }
    },
    ["yellowbootsshort"] = {
        label = "Sneakers Yellow",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Beautiful sneakers in yellow color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 3,
                texture = 7,
            },
            close = true,
        }
    },
    -- Elf Boots
    ["elfwhiteboots"] = {
        label = "Elf Boots White",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Elf Boots White color",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 4,
                texture = 0,
            },
            close = true,
        }
    },
    ["elfgreenboots"] = {
        label = "Elf Boots Green",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Elf Boots Green color",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 4,
                texture = 1,
            },
            close = true,
        }
    },
    ["elfbrownboots"] = {
        label = "Elf Boots Brown",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Elf Boots Brown",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 4,
                texture = 2,
            },
            close = true,
        }
    },
    -- Stylish Boots
    ["beigestyleboots"] = {
        label = "Beige Stylish Boots",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Stylish boots for your pet in beige color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 5,
                texture = 0,
            },
            close = true,
        }
    },
    ["blackstyleboots"] = {
        label = "Black Stylish Boots",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Stylish boots for your pet in black color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 5,
                texture = 1,
            },
            close = true,
        }
    },
    ["brownstyleboots"] = {
        label = "Brown Stylish Boots",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Stylish boots for your pet in brown color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 5,
                texture = 2,
            },
            close = true,
        }
    },
    -- Star Sneakers
    ["brownboots"] = {
        label = "Star Brown Sneakers",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Star sneakers in brown color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 0,
            },
            close = true,
        }
    },
    ["purpleboots"] = {
        label = "Star Purple Sneakers",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Star sneakers in purple color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 1,
            },
            close = true,
        }
    },
    ["redbooots"] = {
        label = "Star Red Sneakers",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Star sneakers in red color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 2,
            },
            close = true,
        }
    },
    ["blackboots"] = {
        label = "Star Black Sneakers",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Star sneakers in black color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 3,
            },
            close = true,
        }
    },
    ["greenbooots"] = {
        label = "Star Green Sneakers",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Star sneakers in green color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 4,
            },
            close = true,
        }
    },
    ["darkgreenboots"] = {
        label = "Star Dark Green Sneakers",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Star sneakers in dark green color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 5,
            },
            close = true,
        }
    },
    ["beigebooots"] = {
        label = "Star Beige Sneakers",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Star sneakers in Beige color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 7,
            },
            close = true,
        }
    },
    ["darkergreenboots"] = {
        label = "Star Darker Green Sneakers",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Star sneakers in darker green color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 8,
            },
            close = true,
        }
    },
    ["blackandwhiteboots"] = {
        label = "Star Dark Black Sneakers",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Star sneakers in dark black color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 9,
            },
            close = true,
        }
    },
    ["purpleandwhiteboots"] = {
        label = "Star Dark Purple Boots",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Star sneakers in dark purple color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 6,
                texture = 10,
            },
            close = true,
        }
    },
    -- Air One Shoes
    ["redairone"] = {
        label = "Red Air One Shoes",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Air one Shoes in red color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 7,
                texture = 0,
            },
            close = true,
        }
    },
    ["pinkairone"] = {
        label = "Pink Air One Shoes",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Air one Shoes in pink color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 7,
                texture = 1,
            },
            close = true,
        }
    },
    ["blackairone"] = {
        label = "Black Air One Shoes",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Air one Shoes in black color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 7,
                texture = 2,
            },
            close = true,
        }
    },
    ["blueairone"] = {
        label = "Blue Air One Shoes",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Air one Shoes in blue color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 7,
                texture = 3,
            },
            close = true,
        }
    },
    ["cyanairone"] = {
        label = "Cyan Blue Air One Shoes",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Air one Shoes in cyan blue color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 7,
                texture = 4,
            },
            close = true,
        }
    },
    ["greenairone"] = {
        label = "Green Air One Shoes",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Air one Shoes in green color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 7,
                texture = 5,
            },
            close = true,
        }
    },
    ["darkgreenairone"] = {
        label = "Dark Green Air One Shoes",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Air one Shoes in dark green color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 7,
                texture = 6,
            },
            close = true,
        }
    },
    ["yellowairone"] = {
        label = "Yellow Air One Shoes",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Air one Shoes in yellow color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 7,
                texture = 7,
            },
            close = true,
        }
    },
    ["organgeairone"] = {
        label = "Orange Air One Shoes",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Air one Shoes in orange color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 7,
                texture = 8,
            },
            close = true,
        }
    },
    ["darkredairone"] = {
        label = "Dark Red Air One Shoes",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Air one Shoes in dark red color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 7,
                texture = 9,
            },
            close = true,
        }
    },
    ["brownairone"] = {
        label = "Brown Air One Shoes",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Classic Air one Shoes in brown color.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 6,
                drawable = 7,
                texture = 10,
            },
            close = true,
        }
    },
    -------------------
    -- Outfit Collar --
    -------------------
    --- Studded Collar
    ["goldcollar"] = {
        label = "Gold Studded Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A very strong collar for your pet, black collar with gold studded",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 1,
                texture = 1
            },
            close = true,
        }
    },
    ["whitecollar"] = {
        label = "White Studded Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A very strong collar for your pet, white collar with silver studded",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 1,
                texture = 2,
            },
            close = true,
        }
    },
    ["blackcollarstrass"] = {
        label = "Black Studded Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A very strong collar for your pet, black collar with grey studded",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 1,
                texture = 3,
            },
            close = true,
        }
    },
    --- Leather collar
    ["greenleathercollar"] = {
        label = "Green Leather Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "Cute green leather collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 2,
                texture = 0,
            },
            close = true,
        }
    },
    ["tealleathercollar"] = {
        label = "Teal Leather Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "Cute teal leather collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 2,
                texture = 1,
            },
            close = true,
        }
    },
    ["greentealleathercollar"] = {
        label = "Green Teal Leather Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "Cute green teal leather collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 2,
                texture = 2,
            },
            close = true,
        }
    },
    ["purpleleathercollar"] = {
        label = "Purple Leather Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "Cute purple leather collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 2,
                texture = 3,
            },
            close = true,
        }
    },
    ["pinkleathercollar"] = {
        label = "Pink Leather Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "Cute pink leather collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 2,
                texture = 4,
            },
            close = true,
        }
    },
    ["redleathercollar"] = {
        label = "Red Leather Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "Cute red leather collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 2,
                texture = 5,
            },
            close = true,
        }
    },
    --- Leather Gunner Collar
    ["gunnerleathercollar"] = {
        label = "Gunner Leather Collar",
        category = ECategoryInventoryPets.COLLAR,

        stack = false,
        description = "A Gunner leather collar for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 4,
                texture = 0,
            },
            close = true,
        }
    },
    --- Leather Balck and Red Collear
    ["blackandredleathercollar"] = {
        label = "Black and Red Leather Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A nice black and red leather collar for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 6,
                texture = 0,
            },
            close = true,
        }
    },
    -- Bandana
    ["whitecollarbandana"] = {
        label = "White Collar Bandana",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "Beautiful bandana collar with various patterns",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 7,
                texture = 0,
            },
            close = true,
        }
    },
    ["greencollarbandana"] = {
        label = "Green Collar Bandana",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "Beautiful bandana collar with various patterns",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 7,
                texture = 1,
            },
            close = true,
        }
    },
    ["redcollarbandana"] = {
        label = "Red Collar Bandana",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "Beautiful bandana collar with various patterns",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 7,
                texture = 2,
            },
            close = true,
        }
    },
    ["greycollarbandana"] = {
        label = "Grey Collar Bandana",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "Beautiful bandana collar with various patterns",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 7,
                texture = 3,
            },
            close = true,
        }
    },
    --- Pendant Collar
    ["silverpendantcollar"] = {
        label = "Silver Collar W Pendant",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "Beautiful silver collar with blue pendant",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 8,
                texture = 0,
            },
            close = true,
        }
    },
    ["goldpendantcollar"] = {
        label = "Gold Collar W Pendant",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "Beautiful gold collar with red pendant",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 8,
                texture = 1,
            },
            close = true,
        }
    },
    --- Chain Collar
    ["silverchaincollar"] = {
        label = "Silver Chain Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A very strong silver chain collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 9,
                texture = 0,
            },
            close = true,
        }
    },
    ["goldchaincollar"] = {
        label = "Gold Chain Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A very strong gold chain collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 9,
                texture = 1,
            },
            close = true,
        }
    },
    ["blackchaincollar"] = {
        label = "Black Chain Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A very strong black chain collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 9,
                texture = 2,
            },
            close = true,
        }
    },
    -- Metal Collar
    ["metalcollarblack"] = {
        label = "Metal Collar Black",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A very strong black metal collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 10,
                texture = 0,
            },
            close = true,
        }
    },
    ["metalcollargray"] = {
        label = "Metal Collar Gray",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A very strong gray metal collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 10,
                texture = 1,
            },
            close = true,
        }
    },
    ["metalcollarwhite"] = {
        label = "Metal Collar White",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A very strong white metal collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 10,
                texture = 2,
            },
            close = true,
        }
    },
    ["silvermetalcollar"] = {
        label = "Silver Metal Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A very strong silver metal collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 10,
                texture = 3,
            },
            close = true,
        }
    },
    -- Leather With Pendant Collar
    ["brownpendantleacollar"] = {
        label = "Brown Leather Collar W Pendant",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A beautiful brown leather collar with pendant for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 11,
                texture = 0,
            },
            close = true,
        }
    },
    ["redpendantleacollar"] = {
        label = "Red Leather Collar W Pendant",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A beautiful red leather collar with pendant for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 11,
                texture = 1,
            },
            close = true,
        }
    },
    ["greenpendantleacollar"] = {
        label = "Green Leather Collar W Pendant",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A beautiful green leather collar with pendant for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 11,
                texture = 2,
            },
            close = true,
        }
    },
    ["tribalpendantleacollar"] = {
        label = "Tribal Leather Collar W Pendant",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A beautiful tribal leather collar with pendant for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 11,
                texture = 3,
            },
            close = true,
        }
    },
    ["pinkpendantleacollar"] = {
        label = "Pink Leather Collar W Pendant",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A beautiful pink leather collar with pendant for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 11,
                texture = 4,
            },
            close = true,
        }
    },
    -- Collar With Bow
    ["whitecollarbow"] = {
        label = "White Collar W Bow",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A cuti white collar with bow for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 12,
                texture = 0,
            },
            close = true,
        }
    },
    ["darkredcollarbow"] = {
        label = "Dark Red Collar W Bow",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A cuti dark red collar with bow for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 12,
                texture = 1,
            },
            close = true,
        }
    },
    ["redcollarbow"] = {
        label = "Red Collar W Bow",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A cuti red collar with bow for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 12,
                texture = 2,
            },
            close = true,
        }
    },
    ["greencollarbow"] = {
        label = "Green Collar W Bow",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A cuti green collar with bow for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 12,
                texture = 3,
            },
            close = true,
        }
    },
    ["tealcollarbow"] = {
        label = "Teal Collar W Bow",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A cuti teal collar with bow for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 12,
                texture = 4,
            },
            close = true,
        }
    },
    ["pinkcollarbow"] = {
        label = "Pink Collar W Bow",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A cuti pink collar with bow for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 12,
                texture = 5,
            },
            close = true,
        }
    },
    ["darkbluecollarbow"] = {
        label = "Dark Blue Collar W Bow",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A cuti dark blue collar with bow for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 12,
                texture = 6,
            },
            close = true,
        }
    },
    ["beigecollarbow"] = {
        label = "Beige Collar W Bow",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A cuti beige collar with bow for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 12,
                texture = 7,
            },
            close = true,
        }
    },
    -- Stylish Collar
    ["rainbowcollar"] = {
        label = "Rainbow Collar W Pendant",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A beautiful rainbow collar with pendant for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 13,
                texture = 0,
            },
            close = true,
        }
    },
    ["tiedyecollar"] = {
        label = "Tie Dye Collar W Pendant",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A beautiful Tie Dye collar with pendant for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 13,
                texture = 1,
            },
            close = true,
        }
    },
    ["pawcolorcollar"] = {
        label = "Paw Color Collar W Pendant",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A beautiful Paw Color collar with pendant for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 8,
                drawable = 13,
                texture = 2,
            },
            close = true,
        }
    },
    -- Ties  Collar
    ["whitetie"] = {
        label = "White Tie",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A nice white tie for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 3,
                texture = 0,
            },
            close = true,
        }
    },
    ["greentie"] = {
        label = "Green Tie",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A nice green tie for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 3,
                texture = 1,
            },
            close = true,
        }
    },
    ["blacktie"] = {
        label = "Black Tie",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A nice black tie for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 3,
                texture = 2,
            },
            close = true,
        }
    },
    ["pinktie"] = {
        label = "Pink Tie",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A nice pink tie for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 3,
                texture = 4,
            },
            close = true,
        }
    },
    --------------------
    -- Outfit Clothes --
    --------------------
    -- Mask
    ["brownmask"] = {
        label = "Human Prop Mask Brown",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Funny brown mask",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 1,
                texture = 0,
            },
            close = true,
        }
    },
    ["beigemask"] = {
        label = "Human Prop Mask Beige",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Funny beige mask",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 1,
                texture = 1,
            },
            close = true,
        }
    },
    -- Badges Police
    ["securitypatch"] = {
        label = "Security Patch",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Security Patch",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 2,
                texture = 0,
            },
            close = true,
        }
    },
    ["policepatch"] = {
        label = "Police Patch",
        category = ECategoryInventoryPets.CLOTHES,
        isPremiumPackage = false,
        stack = false,
        description = "Police Patch",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 2,
                texture = 1,
            },
            close = true,
        }
    },
    ["rescuepatch"] = {
        label = "Rescue Patch",
        category = ECategoryInventoryPets.CLOTHES,

        stack = false,
        description = "Rescue Patch",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 2,
                texture = 2,
            },
            close = true,
        }
    },
    ["sheriffpatch"] = {
        label = "Sheriff Patch",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Sheriff Patch",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 2,
                texture = 3,
            },
            close = true,
        }
    },
    ["servicedogpatch"] = {
        label = "Service Dog Patch",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Service Dog Patch",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 1,
                drawable = 2,
                texture = 4,
            },
            close = true,
        }
    },
    -- Small Wings
    ["wingsred"] = {
        label = "Small Red Wings",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Small Red Wings for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 2,
                texture = 0,
            },
            close = true,
        }
    },
    ["wingsblack"] = {
        label = "Small Black Wings",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Small Black Wings for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 2,
                texture = 1,
            },
            close = true,
        }
    },
    ["wingsgreen"] = {
        label = "Small Green Wings",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Small Green Wings for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 2,
                texture = 2,
            },
            close = true,
        }
    },
    ["wingsdarkblue"] = {
        label = "Small Dark Blue Wings",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Small Dark Blue Wings for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 2,
                texture = 3,
            },
            close = true,
        }
    },
    -- Trick-or-treat buckets
    ["candyprop"] = {
        label = "Candy Prop",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween trick-or-treat candy bucket Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 3,
                texture = 0,
            },
            close = true,
        }
    },
    ["pumpkinprop"] = {
        label = "Pumpkin Prop",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween trick-or-treat pumpkin bucket Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 3,
                texture = 1,
            },
            close = true,
        }
    },
    -- Big Wings
    ["bigredwings"] = {
        label = "Big Red Wings",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Big Red Wings for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 4,
                texture = 0,
            },
            close = true,
        }
    },
    ["redorangewings"] = {
        label = "Big Red/Orange Wings",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Big Red/Orannge Wings for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 5,
                texture = 0,
            },
            close = true,
        }
    },
    ["purplewings"] = {
        label = "Big Purple Wings",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Big Purple Wings for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 5,
                texture = 1,
            },
            close = true,
        }
    },
    ["pinkwings"] = {
        label = "Big Pink Wings",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Big Pink Wings for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 5,
                texture = 2,
            },
            close = true,
        }
    },
    ["bluewings"] = {
        label = "Big Blue Wings",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Big Blue Wings for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 5,
                texture = 3,
            },
            close = true,
        }
    },
    -- Hoodie
    ["purplehoodie"] = {
        label = "Purple Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 1,
                texture = 0,
            },
            close = true,
        }
    },
    ["pinkhoodie"] = {
        label = "Pink Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 1,
                texture = 1,
            },
            close = true,
        }
    },
    ["greendothoodie"] = {
        label = "Green Dot Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 1,
                texture = 2,
            },
            close = true,
        }
    },
    ["lightyellowhoodie"] = {
        label = "Light Yellow Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 1,
                texture = 3,
            },
            close = true,
        }
    },
    ["whitehoodie"] = {
        label = "White Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 1,
                texture = 4,
            },
            close = true,
        }
    },
    ["orangehoodie"] = {
        label = "Orange Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 1,
                texture = 5,
            },
            close = true,
        }
    },
    -- Sailor Cape
    ["plaidsailorcape"] = {
        label = "Plaid Sailor Cape",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Cute sailor cape for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 2,
                texture = 0,
            },
            close = true,
        }
    },
    ["camosailorcape"] = {
        label = "Camo Sailor Cape",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Cute sailor cape for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 2,
                texture = 1,
            },
            close = true,
        }
    },
    ["graysailorcape"] = {
        label = "Gray Sailor Cape",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Cute sailor cape for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 2,
                texture = 2,
            },
            close = true,
        }
    },
    ["pinksailorcape"] = {
        label = "Pink Sailor Cape",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Cute sailor cape for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 2,
                texture = 3,
            },
            close = true,
        }
    },
    ["blacksailorcape"] = {
        label = "Black Sailor Cape",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Cute sailor cape for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 2,
                texture = 4,
            },
            close = true,
        }
    },
    -- Stylish Hoodies
    ["camohoodie"] = {
        label = "Camo Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 3,
                texture = 0,
            },
            close = true,
        }
    },
    ["purplecamohoodie"] = {
        label = "Purple Camo Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 3,
                texture = 1,
            },
            close = true,
        }
    },
    ["greencamohoodie"] = {
        label = "Green Camo Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 3,
                texture = 2,
            },
            close = true,
        }
    },
    ["pinkcamohoodie"] = {
        label = "Pink Camo Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 3,
                texture = 3,
            },
            close = true,
        }
    },
    ["bluecamohoodie"] = {
        label = "Blue Camo Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 3,
                texture = 4,
            },
            close = true,
        }
    },
    ["orangecamohoodie"] = {
        label = "Orange Camo Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 3,
                texture = 5,
            },
            close = true,
        }
    },
    ["whitebrownhoodie"] = {
        label = "White Brown Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 3,
                texture = 6
            },
            close = true,
        }
    },
    ["lightpinkhoodie"] = {
        label = "Light Pink Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful sweatshirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 3,
                texture = 7,
            },
            close = true,
        }
    },
    -- Skirts
    ["pinkskirt"] = {
        label = "Pink Skirt",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A skirt for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 4,
                texture = 0,
            },
            close = true,
        }
    },
    ["greenskirt"] = {
        label = "Green Skirt",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A nice skirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 4,
                texture = 1,
            },
            close = true,
        }
    },
    ["redskirt"] = {
        label = "Red Skirt",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A nice skirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 4,
                texture = 2,
            },
            close = true,
        }
    },
    ["blueskirt"] = {
        label = "Blue Skirt",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A nice skirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 4,
                texture = 3,
            },
            close = true,
        }
    },
    ["rainbowskirt"] = {
        label = "Rainbow Skirt",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A nice skirt for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 4,
                texture = 4,
            },
            close = true,
        }
    },
    -- Suit
    ["suit"] = {
        label = "Suit",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A nice black suit for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 5,
                texture = 0,
            },
            close = true,
        }
    },
    ["pinksuit"] = {
        label = "Pink Suit",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A nice pink suit for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 5,
                texture = 1,
            },
            close = true,
        }
    },
    ["greensuit"] = {
        label = "Green Suit",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A nice green suit for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 5,
                texture = 2,
            },
            close = true,
        }
    },
    ["bluesuit"] = {
        label = "Blue Suit",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A nice blue suit for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 5,
                texture = 3,
            },
            close = true,
        }
    },
    ["whitesuit"] = {
        label = "White Suit",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A nice white suit for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 5,
                texture = 4,
            },
            close = true,
        }
    },
    ["tealsuit"] = {
        label = "Teal Suit",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A nice teal suit for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 5,
                texture = 5,
            },
            close = true,
        }
    },
    -- Pajama
    ["animlaspajama"] = {
        label = "Pajama W Prited Animals",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cuti pajama with some printed animals for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 0,
            },
            close = true,
        }
    },
    ["skypajama"] = {
        label = "Sky Pajama",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cuti pajama with some sky printed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 1,
            },
            close = true,
        }
    },
    ["woolpajama"] = {
        label = "Wool Pajama",
        category = ECategoryInventoryPets.CLOTHES,

        stack = false,
        description = "A cuti wool pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 2,
            },
            close = true,
        }
    },
    ["flowerspajama"] = {
        label = "Flowers Pajama",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cuti pajama with some flowers printed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 3,
            },
            close = true,
        }
    },
    ["starspajama"] = {
        label = "Stars Pajama",
        category = ECategoryInventoryPets.CLOTHES,

        stack = false,
        description = "A cuti pajama with some stars printed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 4,
            },
            close = true,
        }
    },
    ["pandapajama"] = {
        label = "Panda Pajama",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cuti pajama with some panda printed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 5,
            },
            close = true,
        }
    },
    ["rainbowpajama"] = {
        label = "Rainbow Pajama",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cuti pajama with some rainbows printed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 6,
            },
            close = true,
        }
    },
    ["unicornpajama"] = {
        label = "Unicorn Pajama",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cuti pajama with some unicorn printed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 7,
            },
            close = true,
        }
    },
    ["duckpajama"] = {
        label = "Duck Pajama",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cuti pajama with some ducks printed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 6,
                texture = 8,
            },
            close = true,
        }
    },
    ["chrismaspajama"] = {
        label = "Chrismas Pajama",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cuti Chrismas pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 20,
                texture = 0,
            },
            close = true,
        }
    },
    ["greenchrismaspajama"] = {
        label = "Green Chrismas Pajama",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cuti green Chrismas pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 20,
                texture = 1,
            },
            close = true,
        }
    },
    ["whitechrismaspajama"] = {
        label = "White Chrismas Pajama",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cuti white Chrismas pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 20,
                texture = 2,
            },
            close = true,
        }
    },
    ["brownchrismaspajama"] = {
        label = "Brown Chrismas Pajama",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cuti brown Chrismas pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 20,
                texture = 3,
            },
            close = true,
        }
    },
    ["greychrismaspajama"] = {
        label = "Grey Chrismas Pajama",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cuti grey Chrismas pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 20,
                texture = 4,
            },
            close = true,
        }
    },
    ["redchrismaspajama"] = {
        label = "Red Chrismas Pajama",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cuti red Chrismas pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 20,
                texture = 5,
            },
            close = true,
        }
    },
    ["cyanchrismaspajama"] = {
        label = "Cyan Chrismas Pajama",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cuti cyan Chrismas pajama for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 20,
                texture = 6,
            },
            close = true,
        }
    },
    -- Cammo Vest Collar
    ["camovest"] = {
        label = "Camo Vest",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A nice vest for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 7,
                texture = 0,
            },
            close = true,
        }
    },
    ["camored"] = {
        label = "Camo Red Vest",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A nice vest for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 7,
                texture = 1,
            },
            close = true,
        }
    },
    ["camoblack"] = {
        label = "Camo Black Vest",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A nice vest for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 7,
                texture = 2,
            },
            close = true,
        }
    },
    ["camobluewhite"] = {
        label = "Camo Blue White Vest",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A nice vest for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 7,
                texture = 3,
            },
            close = true,
        }
    },
    ["camoblueyellow"] = {
        label = "Camo Blue Yellow Vest",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A nice vest for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 7,
                texture = 4,
            },
            close = true,
        }
    },
    ["camodarkblue"] = {
        label = "Camo Dark Blue Vest",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A nice vest for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 7,
                texture = 5,
            },
            close = true,
        }
    },
    -- Trouble Hoodie
    ["trouble"] = {
        label = "Trouble",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A trouble black hoodie for a trouble pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 8,
                texture = 0,
            },
            close = true,
        }
    },
    ["troublered"] = {
        label = "Trouble Red",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A trouble red hoodie for a trouble pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 8,
                texture = 1,
            },
            close = true,
        }
    },
    ["troublepurple"] = {
        label = "Trouble Purple",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A trouble purple hoodie for a trouble pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 8,
                texture = 2,
            },
            close = true,
        }
    },
    ["troublegreen"] = {
        label = "Trouble Green",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A trouble green hoodie for a trouble pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 8,
                texture = 3,
            },
            close = true,
        }
    },
    ["troubleyellow"] = {
        label = "Trouble Yellow",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A trouble yellow hoodie for a trouble pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 8,
                texture = 4,
            },
            close = true,
        }
    },
    ["troubleorange"] = {
        label = "Trouble Orange",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A trouble orange hoodie for a trouble pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 8,
                texture = 5,
            },
            close = true,
        }
    },
    ["troublepink"] = {
        label = "Trouble Pink",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A trouble pink hoodie for a trouble pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 8,
                texture = 6,
            },
            close = true,
        }
    },
    ["troubleblue"] = {
        label = "Trouble Blue",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A trouble blue hoodie for a trouble pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 8,
                texture = 7,
            },
            close = true,
        }
    },
    -- Sweater
    ["blacksweater"] = {
        label = "Black Sweater",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Cosy sweater for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 9,
                texture = 0,
            },
            close = true,
        }
    },
    ["pinksweater"] = {
        label = "Pink Sweater",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Cosy sweater for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 9,
                texture = 1,
            },
            close = true,
        }
    },
    ["greensweater"] = {
        label = "Green Sweater",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Cosy sweater for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 9,
                texture = 2,
            },
            close = true,
        }
    },
    ["redsweater"] = {
        label = "Red Sweater",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Cosy sweater for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 9,
                texture = 3,
            },
            close = true,
        }
    },
    -- Funy Vest
    ["prop1"] = {
        label = "Cowboy Doll Blue",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A funny cowboy Doll with blue and white t-shirt",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 10,
                texture = 0,
            },
            close = true,
        }
    },
    ["prop2"] = {
        label = "Cowboy Doll Black",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A funny cowboy Doll with black and white t-shirt",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 10,
                texture = 1,
            },
            close = true,
        }
    },
    ["prop3"] = {
        label = "Cowboy Doll Brown",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A funny cowboy Doll with brown and beige t-shirt",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 10,
                texture = 2,
            },
            close = true,
        }
    },
    ["prop4"] = {
        label = "Cowboy Doll Green",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A funny cowboy Doll with green and beige t-shirt",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 10,
                texture = 3,
            },
            close = true,
        }
    },
    -- Spider Vest
    ["spiderprop1"] = {
        label = "Spider Black Vest",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Spider black vest",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 11,
                texture = 0,
            },
            close = true,
        }
    },
    ["spiderprop2"] = {
        label = "Spider Brown Vest",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Spider brown vest",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 12,
                texture = 0,
            },
            close = true,
        }
    },
    -- Hot Dog vest
    ["hotdog"] = {
        label = "Hot Dog",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Hot Dog Clothes",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 13,
                texture = 0,
            },
            close = true,
        }
    },
    -- Mechanic Vest
    ["mechanicuniform"] = {
        label = "Mechanic Uniform",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Mechanic Uniform",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 14,
                texture = 0,
            },
            close = true,
        }
    },
    -- Scarfs
    ["beigescarf"] = {
        label = "Beige Flower Scarf",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Beige Flower Scarf",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 15,
                texture = 0,
            },
            close = true,
        }
    },
    ["grayscarf"] = {
        label = "Gray Flower Scarf",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Gray Flower Scarf",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 15,
                texture = 1,
            },
            close = true,
        }
    },
    ["bluescarf"] = {
        label = "Blue Flower Scarf",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Blue Flower Scarf",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 15,
                texture = 2,
            },
            close = true,
        }
    },
    ["lightpinkscarf"] = {
        label = "Light Pink Flower Scarf",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Light Pink Flower Scarf",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 15,
                texture = 3,
            },
            close = true,
        }
    },
    ["pinkscarf"] = {
        label = "Pink Flower Scarf",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Pink Flower Scarf",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 15,
                texture = 4,
            },
            close = true,
        }
    },
    -- Chest Collar
    ["chestcollar"] = {
        label = "Cyan Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A cyan chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 0,
            },
            close = true,
        }
    },
    ["blackchestcollar"] = {
        label = "Black Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A black chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 1,
            },
            close = true,
        }
    },
    ["bluechestcollar"] = {
        label = "Blue Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A blue chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 2,
            },
            close = true,
        }
    },
    ["pinkchestcollar"] = {
        label = "Pink Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A pink chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 3,
            },
            close = true,
        }
    },
    ["lightbluechestcollar"] = {
        label = "Light Blue Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A light blue chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 4,
            },
            close = true,
        }
    },
    ["redchestcollar"] = {
        label = "Red Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A red chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 5,
            },
            close = true,
        }
    },
    ["greenchestcollar"] = {
        label = "Green Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A green chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 6,
            },
            close = true,
        }
    },
    ["purplechestcollar"] = {
        label = "Purple Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A purple chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 7,
            },
            close = true,
        }
    },
    ["lightpinkchestcollar"] = {
        label = "Light Pink Chest Collar",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A light pink chest collar for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 16,
                texture = 8,
            },
            close = true,
        }
    },
    -- Fully Chst vest
    ["medfullyvest"] = {
        label = "Full Body Vest Medical Red",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A full body cool red vest for medical pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 17,
                texture = 0,
            },
            close = true,
        }
    },
    ["medfullyvestpurple"] = {
        label = "Full Body Vest Medical Purple",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A full body cool pruple vest for medical pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 17,
                texture = 1,
            },
            close = true,
        }
    },
    ["k9fullyvestblack"] = {
        label = "Full Body Vest K9 Vest",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A full body cool black vest for k9 pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 17,
                texture = 2,
            },
            close = true,
        }
    },
    ["k9fullyvestblackpolice"] = {
        label = "Full Body Vest K9 Police Vest",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A full body cool black vest for k9 with police name for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 17,
                texture = 3,
            },
            close = true,
        }
    },
    ["k9fullyvestbluepolice"] = {
        label = "Full Body Blue Vest K9 Police Vest",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A full body cool blue vest for k9 with police name for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 17,
                texture = 4,
            },
            close = true,
        }
    },
    ["k9fullyvestyellowpolice"] = {
        label = "Full Body Yellow Vest K9 Police Vest",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A full body cool yellow vest for k9 with police name for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 17,
                texture = 5,
            },
            close = true,
        }
    },
    ["k9fullyvestcammopolice"] = {
        label = "Full Body Cammo Vest K9 Police Vest",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A full body cool cammo vest for k9 with police name for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 17,
                texture = 6,
            },
            close = true,
        }
    },
    -- Stylish Sweaters
    ["policestylishsweater"] = {
        label = "Stylish police sweater",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful police sweater for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 18,
                texture = 0,
            },
            close = true,
        }
    },
    ["whiteredstylishsweater"] = {
        label = "Stylish White and Light Red sweater",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful white and light red sweater for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 19,
                texture = 0,
            },
            close = true,
        }
    },
    ["purpleblackstylishsweater"] = {
        label = "Stylish Purple and Black sweater",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful purple and black sweater for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 19,
                texture = 1,
            },
            close = true,
        }
    },
    ["yellowrainbowstylishsweater"] = {
        label = "Stylish Yellow and Rainbow sweater",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful yellow and rainbow sweater for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 19,
                texture = 2,
            },
            close = true,
        }
    },
    ["whiterainbowstylishsweater"] = {
        label = "Stylish White and Rainbow sweater",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful white and rainbow sweater for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 19,
                texture = 3,
            },
            close = true,
        }
    },
    ["lovemomstylishsweater"] = {
        label = "Stylish Love mom sweater",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful love mom sweater for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 19,
                texture = 4,
            },
            close = true,
        }
    },
    ["lovedadstylishsweater"] = {
        label = "Stylish Love dad sweater",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A beautiful love dad sweater for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 19,
                texture = 5,
            },
            close = true,
        }
    },
    -- Gangs Hoodies
    ["satanhoodie"] = {
        label = "Satan Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A satan hoodie for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 21,
                texture = 0,
            },
            close = true,
        }
    },
    ["emohoodie"] = {
        label = "Emo Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A emo hoodie for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 21,
                texture = 1,
            },
            close = true,
        }
    },
    ["witchhoodie"] = {
        label = "Witch Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A witch hoodie for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 21,
                texture = 2,
            },
            close = true,
        }
    },
    ["witchfamilyhoodie"] = {
        label = "Witch Family Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A witch family hoodie for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 21,
                texture = 3,
            },
            close = true,
        }
    },
    -- MC's Hoodies
    ["blackmchoodie"] = {
        label = "Full Black MC Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A full black MC hoodie for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 22,
                texture = 0,
            },
            close = true,
        }
    },
    ["aodmchoodie"] = {
        label = "Angels of Death MC Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A Angels of Death MC hoodie for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 22,
                texture = 1,
            },
            close = true,
        }
    },
    ["thelostmchoodie"] = {
        label = "The lost MC Hoodie",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A The lost MC hoodie for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 3,
                drawable = 22,
                texture = 2,
            },
            close = true,
        }
    },
    --------------------
    -- Outfit Head --
    --------------------
    --- Halow Wings
    ["halowingsgoldwhite"] = {
        label = "Halo Wings Gold White",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute halo with wings over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 1,
                texture = 0,
            },
            close = true,
        }
    },
    ["halowingsgold"] = {
        label = "Halo Wings Gold",
        category = ECategoryInventoryPets.CLOTHES,

        stack = false,
        description = "A cute halo with wings over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 1,
                texture = 1,
            },
            close = true,
        }
    },
    ["halowingssilverblack"] = {
        label = "Halo Wings Silver Black",
        category = ECategoryInventoryPets.CLOTHES,

        stack = false,
        description = "A cute halo with wings over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 1,
                texture = 2,
            },
            close = true,
        }
    },
    ["halowingsgoldpink"] = {
        label = "Halo Wings Gold Pink",
        category = ECategoryInventoryPets.CLOTHES,

        stack = false,
        description = "A cute halo with wings over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 1,
                texture = 3,
            },
            close = true,
        }
    },
    -- Flowers
    ["yellowflowers"] = {
        label = "Yellow Flowers",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Adorable yellow flowers for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 2,
                texture = 0,
            },
            close = true,
        }
    },
    ["pinkflowers"] = {
        label = "Pink Flowers",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Flowers for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 2,
                texture = 1,
            },
            close = true,
        }
    },
    ["whiteflowers"] = {
        label = "White Flowers",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Adorable white flowers for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 2,
                texture = 2,
            },
            close = true,
        }
    },
    -- Bows
    ["heartsbow"] = {
        label = "Pink Bow",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Cute Hearts bow for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 3,
                texture = 0,
            },
            close = true,
        }
    },
    ["flowersdarkbow"] = {
        label = "Flowers Dark Bow",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Cute flowers dark bow for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 3,
                texture = 1,
            },
            close = true,
        }
    },
    ["bluelinesbow"] = {
        label = "Blue Lines Bow",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Cute blue lines bow for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 3,
                texture = 2,
            },
            close = true,
        }
    },
    ["greenplaidbow"] = {
        label = "Green Plaid Bow",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Cute green Plaid bow for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 3,
                texture = 3,
            },
            close = true,
        }
    },
    ["pinkbow"] = {
        label = "Pink Bow",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Cute pink bow for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 3,
                texture = 4,
            },
            close = true,
        }
    },
    -- Cap
    ["redsailorcap"] = {
        label = "Red Sailor Cap",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A Red Sailor Cap.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 4,
                texture = 0,
            },
            close = true,
        }
    },
    ["policecap"] = {
        label = "Police Cap",
        category = ECategoryInventoryPets.CLOTHES,

        stack = false,
        description = "A Police Cap.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 4,
                texture = 1,
            },
            close = true,
        }
    },
    ["kapolicecap"] = {
        label = "KaPolice Cap",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Kanpolis Colice Cap.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 4,
                texture = 2,
            },
            close = true,
        }
    },
    ["medicalcap"] = {
        label = "Medical Cap",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A Medical Cap.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 4,
                texture = 3,
            },
            close = true,
        }
    },
    ["bluesailorcap"] = {
        label = "Blue Sailor Cap",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A Blue Sailor Cap.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 4,
                texture = 4,
            },
            close = true,
        }
    },
    -- Bandana
    ["bluebandana"] = {
        label = "Blue bandana",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A fashionable bandana for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 5,
                texture = 0,
            },
            close = true,
        }
    },
    ["pinkbandana"] = {
        label = "Pink bandana",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A fashionable bandana for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 5,
                texture = 1,
            },
            close = true,
        }
    },
    ["redbandana"] = {
        label = "Red bandana",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A fashionable bandana for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 5,
                texture = 2,
            },
            close = true,
        }
    },
    ["orangebandana"] = {
        label = "Orange bandana",
        category = ECategoryInventoryPets.COLLAR,
        stack = false,
        description = "A fashionable bandana for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 5,
                texture = 3,
            },
            close = true,
        }
    },
    -- Pumpkin Hat
    ["pumpkinhat"] = {
        label = "Pumpkin Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 6,
                texture = 0,
            },
            close = true,
        }
    },
    -- Devil earsred
    ["devilearsred"] = {
        label = "Devil Ears Red",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 7,
                texture = 0,
            },
            close = true,
        }
    },
    ["devilearsblack"] = {
        label = "Devil Ears Black",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 7,
                texture = 1,
            },
            close = true,
        }
    },
    ["devilearsgreen"] = {
        label = "Devil Ears Green",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 7,
                texture = 2,
            },
            close = true,
        }
    },
    ["devilearspink"] = {
        label = "Devil Ears Pink",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 7,
                texture = 3,
            },
            close = true,
        }
    },
    ["devilearsyellow"] = {
        label = "Devil Ears Yellow",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 7,
                texture = 4,
            },
            close = true,
        }
    },
    ["devilearsblue"] = {
        label = "Devil Ears Blue",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Halloween Props",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 7,
                texture = 5,
            },
            close = true,
        }
    },
    -- Pirate Hats
    ["wgsailorhat"] = {
        label = "White and Gold Sailor Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Stylish hat",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 8,
                texture = 0,
            },
            close = true,
        }
    },
    ["piratehat"] = {
        label = "Pirate Hat Black",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Arrrrrr!",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 8,
                texture = 1,
            },
            close = true,
        }
    },
    -- Wizard Hats
    ["wizhatwhite"] = {
        label = "Wizard Hat White",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Your dog can do magic with this hat",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 9,
                texture = 0,
            },
            close = true,
        }
    },
    ["wizhatpurple"] = {
        label = "Wizard Hat Purple",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Your dog can do magic with this hat",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 9,
                texture = 1,
            },
            close = true,
        }
    },
    ["cowdog"] = {
        label = "Cow Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Funny Cow hat",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 10,
                texture = 0,
            },
            close = true,
        }
    },
    -- Beanie Hat
    ["beaniewhite"] = {
        label = "Beanie Hat White",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Stylish beanie white hat",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 11,
                texture = 0,
            },
            close = true,
        }
    },
    ["beanieyellow"] = {
        label = "Beanie Hat Yellow",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Stylish beanie yellow hat",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 11,
                texture = 1,
            },
            close = true,
        }
    },
    ["beanieblue"] = {
        label = "Beanie Hat Blue",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Stylish beanie blue hat",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 11,
                texture = 2,
            },
            close = true,
        }
    },
    ["beaniepink"] = {
        label = "Beanie Hat Pink",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Stylish beanie pink hat",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 11,
                texture = 3,
            },
            close = true,
        }
    },
    -- Cap
    ["whitecap"] = {
        label = "White Cap",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "White baseball cap",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 12,
                texture = 0,
            },
            close = true,
        }
    },
    ["whitepinkcap"] = {
        label = "White Pink Cap",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "White Pink baseball cap",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 12,
                texture = 1,
            },
            close = true,
        }
    },
    ["whiteyellowcap"] = {
        label = "White Yellow Cap",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "White Yellow baseball cap",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 12,
                texture = 2,
            },
            close = true,
        }
    },
    -- Cowboy Hat
    ["cowboyhat"] = {
        label = "Cowboy hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A Cowboy Brown Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 13,
                texture = 0,
            },
            close = true,
        }
    },
    -- Deer Hat
    ["deerantlerbrown"] = {
        label = "Deer Antler Brown",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Deer Antler Brown over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 14,
                texture = 0,
            },
            close = true,
        }
    },
    ["deerantlerwhite"] = {
        label = "Deer Antler White",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Deer Antler White over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 14,
                texture = 1,
            },
            close = true,
        }
    },
    ["deerantlerred"] = {
        label = "Deer Antler Red",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Deer Antler Red over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 14,
                texture = 2,
            },
            close = true,
        }
    },
    ["deerantlerlightbrown"] = {
        label = "Deer Antler Light Brown",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Deer Antler Light Brown over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 14,
                texture = 3,
            },
            close = true,
        }
    },
    ["deerantlerblack"] = {
        label = "Deer Antler Black",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Deer Antler Black over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 14,
                texture = 4,
            },
            close = true,
        }
    },
    -- Heart Tiara
    ["blackhearttiara"] = {
        label = "Black Heart Tiara",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Black Heart Tiara over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 15,
                texture = 0,
            },
            close = true,
        }
    },
    ["redhearttiara"] = {
        label = "Red Heart Tiara",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Red Heart Tiara over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 15,
                texture = 1,
            },
            close = true,
        }
    },
    ["bluehearttiara"] = {
        label = "Blue Heart Tiara",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Blue Heart Tiara over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 15,
                texture = 2,
            },
            close = true,
        }
    },
    ["pinkhearttiara"] = {
        label = "Pink Heart Tiara",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Pink Heart Tiara over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 15,
                texture = 3,
            },
            close = true,
        }
    },
    ["purplehearttiara"] = {
        label = "Purple Heart Tiara",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Purple Heart Tiara over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 15,
                texture = 4,
            },
            close = true,
        }
    },
    -- Noel Hat
    ["greennoelhat"] = {
        label = "Green Noel Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Green Noel Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 16,
                texture = 0,
            },
            close = true,
        }
    },
    ["noelhat"] = {
        label = "Noel Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Noel Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 16,
                texture = 1,
            },
            close = true,
        }
    },
    ["yellownoelhat"] = {
        label = "Yellow Noel Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Yellow Noel Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 16,
                texture = 2,
            },
            close = true,
        }
    },
    ["orangenoelhat"] = {
        label = "Orange Noel Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Orange Noel Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 16,
                texture = 3,
            },
            close = true,
        }
    },
    ["pinknoelhat"] = {
        label = "Pink Noel Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Pink Noel Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 16,
                texture = 4,
            },
            close = true,
        }
    },
    ["bluenoelhat"] = {
        label = "Blue Noel Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Blue Noel Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 16,
                texture = 5,
            },
            close = true,
        }
    },
    -- Snow Hats
    ["snowcyanhat"] = {
        label = "Snow Cyan Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Snow Cyan Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 17,
                texture = 0,
            },
            close = true,
        }
    },
    ["snowpinkhat"] = {
        label = "Snow Pink Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Snow Pink Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 17,
                texture = 1,
            },
            close = true,
        }
    },
    ["snowblackhat"] = {
        label = "Snow Pig Black Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Snow Pig Black Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 17,
                texture = 2,
            },
            close = true,
        }
    },
    ["snowbeigehat"] = {
        label = "Snow Bunny Beige Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Snow Bunny Beige Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 17,
                texture = 3,
            },
            close = true,
        }
    },
    ["snowredhat"] = {
        label = "Snow Striped Red Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Snow Striped Red Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 17,
                texture = 4,
            },
            close = true,
        }
    },
    ["snowbluehat"] = {
        label = "Snow Striped Blue Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Snow Striped Blue Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 17,
                texture = 5,
            },
            close = true,
        }
    },
    ["snowpenguinhat"] = {
        label = "Snow Penguin Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Snow penguin Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 17,
                texture = 6,
            },
            close = true,
        }
    },
    ["snowfishhat"] = {
        label = "Snow Fish Hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A cute Snow fish Hat over head",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 17,
                texture = 7,
            },
            close = true,
        }
    },
    -- Police Caps
    ["darkbluepolicecap"] = {
        label = "Dark Blue Police Cap",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A dark blue police cap for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 18,
                texture = 0,
            },
            close = true,
        }
    },
    ["whiteandgoldpolicecap"] = {
        label = "White and Gold Police Cap",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A white and gold police cap for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 18,
                texture = 1,
            },
            close = true,
        }
    },
    ["blackpolicecap"] = {
        label = "Black Police Cap",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A black police cap for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 18,
                texture = 2,
            },
            close = true,
        }
    },
    -- propeller hat
    ["propellerhat"] = {
        label = "Propeller hat",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A funny Propeller hat for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 9,
                drawable = 19,
                texture = 0,
            },
            close = true,
        }
    },
    -- Sun Galsses
    ["pinksunglasses"] = {
        label = "Pink Sunglasses",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Fashionable sunglasses for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 1,
                texture = 0,
            },
            close = true,
        }
    },
    ["blacksunglasses"] = {
        label = "Black Sunglasses",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Fashionable sunglasses for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 1,
                texture = 1,
            },
            close = true,
        }
    },
    ["redsunglasses"] = {
        label = "Red Sunglasses",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Fashionable sunglasses for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 1,
                texture = 2,
            },
            close = true,
        }
    },
    ["whitesunglasses"] = {
        label = "White Sunglasses",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Fashionable sunglasses for your pet",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 1,
                texture = 3,
            },
            close = true,
        }
    },
    -- Rounded Glasses
    ["roundsunglasses"] = {
        label = "Round Sunglasses",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "Sunglasses",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 6,
                texture = 0,
            },
            close = true,
        }
    },
    -- Butterfly Glasses
    ["butterflycyanglasses"] = {
        label = "Butterfly Cyan Glasses",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A Cuti Butterfly Cyan Glasses",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 7,
                texture = 0,
            },
            close = true,
        }
    },
    ["butterflygreenglasses"] = {
        label = "Butterfly Green Glasses",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A Cuti Butterfly Green Glasses",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 7,
                texture = 1,
            },
            close = true,
        }
    },
    ["butterflyyellowglasses"] = {
        label = "Butterfly Yellow Glasses",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A Cuti Butterfly Yellow Glasses",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 7,
                texture = 2,
            },
            close = true,
        }
    },
    ["butterflypinkglasses"] = {
        label = "Butterfly Pink Glasses",
        category = ECategoryInventoryPets.CLOTHES,
        stack = false,
        description = "A Cuti Butterfly Pink Glasses",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useClothing",
            data = {
                component = 7,
                drawable = 7,
                texture = 3,
            },
            close = true,
        }
    },
    ----------
    -- Beds --
    ----------
    ["bedbones"] = {
        label = "Bed Bones",
        stack = false,
        description = "A bed with bones",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedbones",
                petOffset = vector3(0.20, 0.05, 0.15),
                petHeadingOffset = 180.0,
            },
            close = true,
        }
    },
    ["bedmaster"] = {
        label = "Bed Master",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedmaster",
                petOffset = vector3(0.10, -0.15, -0.25),
                petHeadingOffset = 90.0,
            },
            close = true,
        }
    },
    ["bedwood"] = {
        label = "Wooden Bed",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedwood",
                petOffset = vector3(0.10, -0.15, -0.25),
                petHeadingOffset = 90.0,
            },
            close = true,
        }
    },
    ["bedcream"] = {
        label = "Bed Cream",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcream",
                petOffset = vector3(0.10, -0.25, -0.25),
                petHeadingOffset = 90.0,
            },
            close = true,
        }
    },
    ["bedgold"] = {
        label = "Bed Gold",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedgold",
                petOffset = vector3(0.10, -0.25, -0.25),
                petHeadingOffset = 90.0,
            },
            close = true,
        }
    },
    ["bedmodern"] = {
        label = "Bed Modern",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedmodern",
                petOffset = vector3(0.10, -0.25, -0.25),
                petHeadingOffset = 90.0,
            },
            close = true,
        }
    },
    ["bedold"] = {
        label = "Old Bed",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedold",
                petOffset = vector3(0.10, -0.15, -0.34),
                petHeadingOffset = 80.0,
            },
            close = true,
        }
    },
    ["bedplaid"] = {
        label = "Bed Plaid",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedplaid",
                petOffset = vector3(0.10 - 0.15 - 0.50),
                petHeadingOffset = 80.0,
            },
            close = true,
        }
    },
    ["bedbath"] = {
        label = "Bathing Tub Bed",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedbath",
                petOffset = vector3(-0.05, 0.10, 0.02),
                petHeadingOffset = 305.0,
            },
            close = true,
        }
    },
    ["bedsmall"] = {
        label = "Small Bed",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedsmall",
                petOffset = vector3(0.15, 0.20, 0.10),
                petHeadingOffset = 220.0,
            },
            close = true,
        }
    },
    ["bedflower"] = {
        label = "Flower Bed",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedflower",
                petOffset = vector3(0.05, -0.15, 0.30),
                petHeadingOffset = 140.0,
            },
            close = true,
        }
    },
    ["bedhouse"] = {
        label = "House Bed",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedhouse",
                petOffset = vector3(0.05, 0.15, 0.40),
                petHeadingOffset = 205.0,
            },
            close = true,
        }
    },
    ["bedhammock"] = {
        label = "Hammock Bed",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedhammock",
                petOffset = vector3(-0.05, 0.15, 0.40),
                petHeadingOffset = 260.0,
            },
            close = true,
        }
    },
    ["bedprincess"] = {
        label = "Princess Bed",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedprincess",
                petOffset = vector3(0.20, -0.03, 0.20),
                petHeadingOffset = 150.0,
            },
            close = true,
        }
    },
    ["bedpumpkin"] = {
        label = "Pumpkin Bed",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkin",
                petOffset = vector3(0.15, -0.03, 0.03),
                petHeadingOffset = 150.0,
            },
            close = true,
        }
    },
    ["bedpumpkinhollow"] = {
        label = "Hollow Pumpkin Bed",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkinhollow",
                petOffset = vector3(0.15, -0.01, -0.15),
                petHeadingOffset = 150.0,
            },
            close = true,
        }
    },
    ["bedbath2"] = {
        label = "Bed Bath 2",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedbath2",
                petOffset = vector3(-0.05, -0.10, 0.02),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedbath3"] = {
        label = "Bed Bath 3",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedbath3",
                petOffset = vector3(-0.05, -0.10, 0.02),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedflower2"] = {
        label = "Bed Flower 2",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedflower2",
                petOffset = vector3(-0.06, -0.15, 0.30),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedflower3"] = {
        label = "Bed Flower 3",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedflower3",
                petOffset = vector3(-0.06, -0.15, 0.30),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedhouse2"] = {
        label = "Bed House 2",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedhouse2",
                petOffset = vector3(0.15, -0.05, 0.40),
                petHeadingOffset = 150.0,
            },
            close = true,
        }
    },
    ["bedhouse3"] = {
        label = "Bed House 3",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedhouse3",
                petOffset = vector3(0.15, -0.05, 0.40),
                petHeadingOffset = 150.0,
            },
            close = true,
        }
    },
    ["bedprincess2"] = {
        label = "Bed Princess 2",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedprincess2",
                petOffset = vector3(-0.03, -0.15, 0.10),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedprincess3"] = {
        label = "Bed Princess 3",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedprincess3",
                petOffset = vector3(-0.03, -0.15, 0.10),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedprincess4"] = {
        label = "Bed Princess 4",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedprincess4",
                petOffset = vector3(-0.03, -0.15, 0.10),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedpumpkin2"] = {
        label = "Bed Pumpkin 2",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkin2",
                petOffset = vector3(-0.02, -0.20, 0.02),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedpumpkin3"] = {
        label = "Bed Pumpkin 3",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkin3",
                petOffset = vector3(-0.02, -0.20, 0.02),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedpumpkin4"] = {
        label = "Bed Pumpkin 4",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkin4",
                petOffset = vector3(-0.02, -0.20, 0.02),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedpumpkin5"] = {
        label = "Bed Pumpkin 5",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkin5",
                petOffset = vector3(-0.02, -0.20, 0.02),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedpumpkin6"] = {
        label = "Bed Pumpkin 6",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkin6",
                petOffset = vector3(-0.02, -0.20, 0.02),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedpumpkinhollow2"] = {
        label = "Bed Hollow 2",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkinhollow2",
                petOffset = vector3(-0.02, -0.15, -0.15),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedpumpkinhollow3"] = {
        label = "Bed Hollow 3",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkinhollow3",
                petOffset = vector3(-0.02, -0.15, -0.15),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedpumpkinhollow4"] = {
        label = "Bed Hollow 4",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedpumpkinhollow4",
                petOffset = vector3(-0.02, -0.15, -0.15),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedsmall2"] = {
        label = "Bed Small 2",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedsmall2",
                petOffset = vector3(-0.05, -0.20, 0.10),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedsmall3"] = {
        label = "Bed Small 3",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedsmall3",
                petOffset = vector3(-0.05, -0.20, 0.10),
                petHeadingOffset = 60.0,
            },
            close = true,
        }
    },
    ["bedcomf"] = {
        label = "Bed Comf",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedcomf2"] = {
        label = "Bed Comf 2",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf2",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedcomf3"] = {
        label = "Bed Comf 3",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf3",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedcomf4"] = {
        label = "Bed Comf 4",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf4",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedcomf5"] = {
        label = "Bed Comf 5",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf5",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedcomf6"] = {
        label = "Bed Comf 6",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf6",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedcomf7"] = {
        label = "Bed Comf 7",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf7",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedcomf8"] = {
        label = "Bed Comf 8",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf8",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedcomf9"] = {
        label = "Bed Comf 9",
        stack = false,
        description = "Comfortable bed for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "bedcomf9",
                petOffset = vector3(0.10, -0.20, -0.01),
                petHeadingOffset = 65.0,
            },
            close = true,
        }
    },
    ["bedbasketa"] = {
        label = "Medium Brown Basket Bed",
        stack = false,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        description = "",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_bed1_a",
                petOffset = vector3(0.05, -0.05, 0.10),
                petHeadingOffset = 320.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bedbasketb"] = {
        label = "Brown Basket Bed",
        stack = false,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        description = "",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_bed1_b",
                petOffset = vector3(0.05, -0.05, 0.10),
                petHeadingOffset = 320.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bedbasketc"] = {
        label = "Light Brown Basket Bed",
        stack = false,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        description = "",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_bed1_c",
                petOffset = vector3(0.05, -0.05, 0.10),
                petHeadingOffset = 320.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bedbasketd"] = {
        label = "White Basket Bed",
        stack = false,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        description = "",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_bed1_d",
                petOffset = vector3(0.05, -0.05, 0.10),
                petHeadingOffset = 320.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bedsubmarinea"] = {
        label = "Brown Submarine Bed",
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_bed2_a",
                petOffset = vector3(0.05, -0.05, 0.10),
                petHeadingOffset = 300.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bedsubmarineb"] = {
        label = "Green Submarine Bed",
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_bed2_b",
                petOffset = vector3(0.05, -0.05, 0.10),
                petHeadingOffset = 300.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bedsubmarinec"] = {
        label = "Yellow Submarine Bed",
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_bed2_c",
                petOffset = vector3(0.05, -0.05, 0.10),
                petHeadingOffset = 300.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_tree1_a"] = {
        label = "Tree House Bed A",
        stack = false,
        description = "",
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_tree1_a",
                petOffset = vector3(0.35, 0.10, 1.02),
                petHeadingOffset = 90.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_tree1_b"] = {
        label = "Tree House Bed B",
        stack = false,
        description = "",
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_tree1_b",
                petOffset = vector3(0.35, 0.10, 1.02),
                petHeadingOffset = 90.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_tree1_c"] = {
        label = "Tree House Bed C",
        stack = false,
        description = "",
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_tree1_c",
                petOffset = vector3(0.35, 0.10, 1.02),
                petHeadingOffset = 90.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_tree1_d"] = {
        label = "Tree House Bed D",
        stack = false,
        description = "",
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_tree1_d",
                petOffset = vector3(0.35, 0.10, 1.02),
                petHeadingOffset = 90.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_tree2_a"] = {
        label = "Master Tree House Bed A",
        stack = false,
        description = "",
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_tree2_a",
                petOffset = vector3(0.40, 0.30, 0.70),
                petHeadingOffset = 90.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_tree2_b"] = {
        label = "Master Tree House Bed B",
        stack = false,
        description = "",
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:useBed",
            data = {
                prop = "cdev_pets_tree2_b",
                petOffset = vector3(0.40, 0.30, 0.70),
                petHeadingOffset = 90.0,
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    -- BOWLS --
    ["bluebowl"] = {
        label = "Blue Bowl",
        category = ECategoryInventoryPets.BOWL,
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "bluebowl",
            },
        },
    },
    ["brownbowl"] = {
        label = "Brown Bowl",
        category = ECategoryInventoryPets.BOWL,
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "brownbowl",
            },
        },
    },
    ["greenbowl"] = {
        label = "Green Bowl",
        category = ECategoryInventoryPets.BOWL,
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "greenbowl",
            },
        },
    },
    ["redbowl"] = {
        label = "Red Bowl",
        category = ECategoryInventoryPets.BOWL,
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "redbowl",
            },
        },
    },
    ["silverbowl"] = {
        label = "Silver Bowl",
        category = ECategoryInventoryPets.BOWL,
        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "silverbowl",
            },
        },
    },
    ["cdev_pets_plataform1"] = {
        label = "Plataform",
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseShowcaseProp",
            data = {
                prop = "cdev_pets_plataform1",
                offset = vector3(0.0, 0.0, 0.5),
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_sandbox1_a"] = {
        label = "Brown Sandbox",
        stack = false,
        canbeRemoved = true,
        usable = true,
        description = "",

        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseShowcaseProp",
            data = {
                prop = "cdev_pets_sandbox1_d",
                offset = vector3(0.0, 0.0, 0.10),
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_sandbox1_b"] = {
        label = "Medium Brown Sandbox",
        stack = false,
        canbeRemoved = true,
        usable = true,
        description = "",

        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseShowcaseProp",
            data = {
                prop = "cdev_pets_sandbox1_b",
                offset = vector3(0.0, 0.0, 0.10),
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_sandbox1_c"] = {
        label = "Light Brown Sandbox",
        stack = false,
        canbeRemoved = true,
        usable = true,
        description = "",
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseShowcaseProp",
            data = {
                prop = "cdev_pets_sandbox1_c",
                offset = vector3(0.0, 0.0, 0.10),
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_sandbox1_d"] = {
        label = "Brown Sandbox",
        stack = false,
        canbeRemoved = true,
        usable = true,
        description = "",

        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseShowcaseProp",
            data = {
                prop = "cdev_pets_sandbox1_d",
                offset = vector3(0.0, 0.0, 0.10),
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_bowl1_a"] = {
        label = "Blue round Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl1_a",
            },
        },
    },
    ["cdev_pets_bowl1_b"] = {
        label = "Black round Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl1_b",
            },
        },
    },

    ["cdev_pets_bowl1_c"] = {
        label = "Light Green round Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl1_c",
            },
        },
    },

    ["cdev_pets_bowl1_d"] = {
        label = "White/Blue round Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl1_d",
            },
        },
    },

    ["cdev_pets_bowl1_e"] = {
        label = "Brown/White round Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl1_e",
            },
        },
    },

    ["cdev_pets_bowl1_f"] = {
        label = "Light Pink round Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl1_f",
            },
        },
    },


    ["cdev_pets_bowl2_a"] = {
        label = "White Wood Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl2_a",
            },
        },
    },

    ["cdev_pets_bowl2_b"] = {
        label = "Blue Wood Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl2_b",
            },
        },
    },

    ["cdev_pets_bowl2_c"] = {
        label = "Red Wood Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl2_c",
            },
        },
    },

    ["cdev_pets_bowl2_d"] = {
        label = "White/White Wood Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl2_d",
            },
        },
    },

    ["cdev_pets_bowl2_e"] = {
        label = "Green2 Wood Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl2_e",
            },
        },
    },

    ["cdev_pets_bowl2_f"] = {
        label = "Beige Wood Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl2_f",
            },
        },
    },

    ["cdev_pets_bowl3_a"] = {
        label = "Cat White Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_a",
            },
        },
    },

    ["cdev_pets_bowl3_b"] = {
        label = "Cat Green Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_b",
            },
        },
    },

    ["cdev_pets_bowl3_c"] = {
        label = "Cat Silver Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_c",
            },
        },
    },

    ["cdev_pets_bowl3_d"] = {
        label = "Cat Pink Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_d",
            },
        },
    },

    ["cdev_pets_bowl3_e"] = {
        label = "Cat Red Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_e",
            },
        },
    },

    ["cdev_pets_bowl3_f"] = {
        label = "Cat Black Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_f",
            },
        },
    },

    ["cdev_pets_bowl3_g"] = {
        label = "Cat Blue Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_g",
            },
        },
    },

    ["cdev_pets_bowl3_h"] = {
        label = "Cat Yellow Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_h",
            },
        },
    },

    ["cdev_pets_bowl3_i"] = {
        label = "Cat Brown Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_i",
            },
        },
    },

    ["cdev_pets_bowl3_j"] = {
        label = "Cat Light Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl3_j",
            },
        },
    },

    ["cdev_pets_bowl4_a"] = {
        label = "Cat Wood Brown Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl4_a",
            },
        },
    },

    ["cdev_pets_bowl4_b"] = {
        label = "Cat Wood Red Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl4_b",
            },
        },
    },

    ["cdev_pets_bowl4_c"] = {
        label = "Cat Wood Blue Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl4_c",
            },
        },
    },

    ["cdev_pets_bowl4_d"] = {
        label = "Cat Wood White Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl4_d",
            },
        },
    },

    ["cdev_pets_bowl4_e"] = {
        label = "Cat Wood Green Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl4_e",
            },
        },
    },

    ["cdev_pets_bowl4_f"] = {
        label = "Cat Wood Baby Bowl",
        category = ECategoryInventoryPets.BOWL,

        stack = false,
        description = "A nice bowl for your pet.",
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:setBowl",
            data = {
                prop = "cdev_pets_bowl4_f",
            },
        },
    },

    ["cdev_pets_ball1_a"] = {
        label = "Black Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_a",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_b"] = {
        label = "White Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_b",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_c"] = {
        label = "Green Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_c",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_d"] = {
        label = "Blue Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_d",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_e"] = {
        label = "Yellow Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_e",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_f"] = {
        label = "Red Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_f",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_g"] = {
        label = "Purple Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_g",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_h"] = {
        label = "Pink Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_h",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_i"] = {
        label = "Light Blue Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_i",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["cdev_pets_ball1_j"] = {
        label = "Brown Playing Ball",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UsePlayingBall",
            data = {
                prop = "cdev_pets_ball1_j",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["catbaga"] = {
        label = "Blue Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_a",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },

    ["catbagb"] = {
        label = "Pink Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_b",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["catbagc"] = {
        label = "Brown Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_c",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["catbagd"] = {
        label = "Red Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_d",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["catbage"] = {
        label = "Light Purple Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_e",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["catbagf"] = {
        label = "White Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_f",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["catbagg"] = {
        label = "Purple Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_g",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["catbagh"] = {
        label = "Green Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_h",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["catbagi"] = {
        label = "Red Cat Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseCatBag",
            data = {
                prop = "cdev_pets_catbag_i",
                catoffset = { x = 0.00, y = 0.30, z = 0.00 },
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbaga"] = {
        label = "Blue Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_chop", "pet_pitt", "pet_dobermann", "pet_terrierk", "pet_gold", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal", "pet_akita", "pet_austshep", "pet_bloodhound", "pet_engbulldog" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_a",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbagb"] = {
        label = "Pink Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,

        limited = { "pet_chop", "pet_pitt", "pet_dobermann", "pet_terrierk", "pet_gold", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal", "pet_akita", "pet_austshep", "pet_bloodhound", "pet_engbulldog" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_b",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbagc"] = {
        label = "Yellow Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,

        limited = { "pet_chop", "pet_pitt", "pet_dobermann", "pet_terrierk", "pet_gold", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal", "pet_akita", "pet_austshep", "pet_bloodhound", "pet_engbulldog" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_c",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbagd"] = {
        label = "Red Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,

        limited = { "pet_chop", "pet_pitt", "pet_dobermann", "pet_terrierk", "pet_gold", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal", "pet_akita", "pet_austshep", "pet_bloodhound", "pet_engbulldog" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_d",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbage"] = {
        label = "Purple Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,

        limited = { "pet_chop", "pet_pitt", "pet_dobermann", "pet_terrierk", "pet_gold", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal", "pet_akita", "pet_austshep", "pet_bloodhound", "pet_engbulldog" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_e",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbagf"] = {
        label = "White Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,

        limited = { "pet_chop", "pet_pitt", "pet_dobermann", "pet_terrierk", "pet_gold", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal", "pet_akita", "pet_austshep", "pet_bloodhound", "pet_engbulldog" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_f",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbagg"] = {
        label = "Purple Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,

        limited = { "pet_chop", "pet_pitt", "pet_dobermann", "pet_terrierk", "pet_gold", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal", "pet_akita", "pet_austshep", "pet_bloodhound", "pet_engbulldog" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_g",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbagh"] = {
        label = "Green Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,

        limited = { "pet_chop", "pet_pitt", "pet_dobermann", "pet_terrierk", "pet_gold", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal", "pet_akita", "pet_austshep", "pet_bloodhound", "pet_engbulldog" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_h",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["bigdogbagi"] = {
        label = "Red Big Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_chop", "pet_pitt", "pet_dobermann", "pet_terrierk", "pet_gold", "pet_husky", "pet_bully", "pet_shep", "pet_dal", "pet_mal", "pet_akita", "pet_austshep", "pet_bloodhound", "pet_engbulldog" },
        onUse = {
            event = "cdev_pets:UseBigDogBag",
            data = {
                prop = "cdev_pets_bigdogbag_i",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbaga"] = {
        label = "Blue Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_frbul", "pet_minpit", "pet_pug", "pet_shusky", "pet_york", "pet_poodle", "pet_chiua", "pet_dash", "pet_bulldogpup", "pet_bichon", "pet_dalpup", "pet_goldenpup", "pet_shepup" },
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_a",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbagb"] = {
        label = "Pink Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",

        limited = { "pet_frbul", "pet_minpit", "pet_pug", "pet_shusky", "pet_york", "pet_poodle", "pet_chiua", "pet_dash", "pet_bulldogpup", "pet_bichon", "pet_dalpup", "pet_goldenpup", "pet_shepup" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_b",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbagc"] = {
        label = "Yellow Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",

        limited = { "pet_frbul", "pet_minpit", "pet_pug", "pet_shusky", "pet_york", "pet_poodle", "pet_chiua", "pet_dash", "pet_bulldogpup", "pet_bichon", "pet_dalpup", "pet_goldenpup", "pet_shepup" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_c",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbagd"] = {
        label = "Red Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",

        limited = { "pet_frbul", "pet_minpit", "pet_pug", "pet_shusky", "pet_york", "pet_poodle", "pet_chiua", "pet_dash", "pet_bulldogpup", "pet_bichon", "pet_dalpup", "pet_goldenpup", "pet_shepup" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_d",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbage"] = {
        label = "Purple Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",

        limited = { "pet_frbul", "pet_minpit", "pet_pug", "pet_shusky", "pet_york", "pet_poodle", "pet_chiua", "pet_dash", "pet_bulldogpup", "pet_bichon", "pet_dalpup", "pet_goldenpup", "pet_shepup" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_e",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbagf"] = {
        label = "White Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        limited = { "pet_frbul", "pet_minpit", "pet_pug", "pet_shusky", "pet_york", "pet_poodle", "pet_chiua", "pet_dash", "pet_bulldogpup", "pet_bichon", "pet_dalpup", "pet_goldenpup", "pet_shepup" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_f",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbagg"] = {
        label = "Purple Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",

        limited = { "pet_frbul", "pet_minpit", "pet_pug", "pet_shusky", "pet_york", "pet_poodle", "pet_chiua", "pet_dash", "pet_bulldogpup", "pet_bichon", "pet_dalpup", "pet_goldenpup", "pet_shepup" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_g",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbagh"] = {
        label = "Green Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",

        limited = { "pet_frbul", "pet_minpit", "pet_pug", "pet_shusky", "pet_york", "pet_poodle", "pet_chiua", "pet_dash", "pet_bulldogpup", "pet_bichon", "pet_dalpup", "pet_goldenpup", "pet_shepup" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_h",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["dogbagi"] = {
        label = "Hot Red Dog Bag",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        limited = { "pet_frbul", "pet_minpit", "pet_pug", "pet_shusky", "pet_york", "pet_poodle", "pet_chiua", "pet_dash", "pet_bulldogpup", "pet_bichon", "pet_dalpup", "pet_goldenpup", "pet_shepup" },
        canbeRemoved = true,
        usable = true,
        onUse = {
            event = "cdev_pets:UseDogBag",
            data = {
                prop = "cdev_pets_dogbag_i",
            },
            close = true,
            net = false,
            preventRestoreState = true,
        },
    },
    ["scratch1a"] = {
        label = "Yellow Cactus Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch1_a",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch1b"] = {
        label = "Light Green Cactus Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch1_b",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch1c"] = {
        label = "White Cactus Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch1_c",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch1d"] = {
        label = "Vanilla Cactus Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch1_d",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch1e"] = {
        label = "Black Cactus Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch1_e",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch1f"] = {
        label = "Green Cactus Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch1_f",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch2a"] = {
        label = "Yellow Chicken Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch2_a",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 180.0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch2b"] = {
        label = "Candy Cane Chicken Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch2_b",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 180.0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch2c"] = {
        label = "Yellow Chicken Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch2_c",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 180.0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
    ["scratch2d"] = {
        label = "Green Chicken Scratching Pole",
        category = ECategoryInventoryPets.TOYS,
        stack = false,
        description = "",
        canbeRemoved = true,
        usable = true,
        limited = { "pet_amer", "pet_turk", "pet_synphix", "pet_wcoon", "pet_wolf", "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor" },
        onUse = {
            event = "cdev_pets:UseScratch",
            data = {
                prop = "cdev_pets_scratch2_d",
                catoffset = { x = 0.00, y = -0.55, z = 0.00 },
                propheading = 180.0
            },
            close = true,
            net = false,
            preventRestoreState = true,
        }
    },
}
