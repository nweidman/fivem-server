--[[
BY RX Scripts © rxscripts.xyz
--]]

Config.MaxMissions = 3 -- Max amount of missions that can be active at the same time (make sure its 1 less than the amount of missions in the table below so it can rotate)

Config.Missions = {
    ["Kill 5x Pig"] = {
        endTime = 12, -- Time in hours to complete the mission (after this a random other mission will start)
        type = 'kills', -- 'kills' or 'cuts'
        amount = 5, -- Amount of kills or cuts required
        animal = 'Pig', -- Animal to kill or cut (key from config/animals.lua)
        rewards = {
            xp = 50, -- Set to 0 to disable
            money = 1500, -- Set to 0 to disable
            moneyType = 'bank',
            items = { -- Empty table to disable
                { item = 'deer_horn', amount = 1 },
                { item = 'boar_meat', amount = 1 },
            }
        }
    },
    ["Kill 3x Lion"] = {
        endTime = 24,
        type = 'kills',
        amount = 3,
        animal = 'Lion',
        rewards = {
            xp = 100,
            money = 3500,
            moneyType = 'bank',
            items = {
                { item = 'boar_meat', amount = 2 },
                { item = 'deer_horn', amount = 1 },
            }
        }
    },
    ["Cut 15x Coyote"] = {
        endTime = 24,
        type = 'cuts',
        amount = 15,
        animal = 'Coyote',
        rewards = {
            xp = 150,
            money = 3500,
            moneyType = 'bank',
            items = {
                { item = 'meat_stand', amount = 1 },
                { item = 'boar_meat', amount = 2 },
            }
        },
    },
    ["Cut 15x Cow"] = {
        endTime = 12,
        type = 'cuts',
        amount = 15,
        animal = 'Cow',
        rewards = {
            xp = 100,
            money = 2500,
            moneyType = 'bank',
            items = {
                { item = 'meat_stand', amount = 1 },
                { item = 'deer', amount = 1 },
            }
        },
    },
    ["Cut 15x Lion"] = {
        endTime = 24,
        type = 'cuts',
        amount = 15,
        animal = 'Lion',
        rewards = {
            xp = 200,
            money = 3500,
            moneyType = 'bank',
            items = {
                { item = 'deer_horn', amount = 1 },
                { item = 'boar_meat', amount = 3 },
            }
        },
    },
    ["Cut 10x Boar"] = {
        endTime = 24,
        type = 'cuts',
        amount = 10,
        animal = 'Boar',
        rewards = {
            xp = 100,
            money = 1500,
            moneyType = 'bank',
            items = {
                { item = 'meat_stand', amount = 2 },
                { item = 'boar_meat', amount = 3 },
            }
        },
    },
    ["Kill 10x Deer"] = {
        endTime = 24,
        type = 'cuts',
        amount = 10,
        animal = 'Deer',
        rewards = {
            xp = 100,
            money = 1500,
            moneyType = 'bank',
            items = {
                { item = 'deer_horn', amount = 1 },
                { item = 'deer', amount = 1 },
            }
        },
    },
}