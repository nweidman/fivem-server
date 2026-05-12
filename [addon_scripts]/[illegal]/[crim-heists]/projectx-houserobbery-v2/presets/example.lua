-- Preset for house "example" with an Interior Type of "Shells"
LoadHousePreset("Shells", "example", {
    ["ExitCoords"] = vector4(-0.46, -2.42, 1.39, 0.0), -- Exit coords of the house
    ["Spots"] = {
        ["1"] = {
            ["Type"] = "drawer",
            ["Coords"] = vector3(4.03, 2.85, 0.94),
            ["Icon"] = 'fas fa-search',
            ["Label"] = "Search drawer",
            ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
        },
        ["2"] = {
            ["Type"] = "drawer",
            ["Coords"] = vector3(1.78, -3.02, 1.17),
            ["Icon"] = 'fas fa-search',
            ["Label"] = "Search drawer",
            ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
        },
        ["3"] = {
            ["Type"] = "closet",
            ["Coords"] = vector3(7.73, 3.47, 1.60),
            ["Icon"] = 'fas fa-search',
            ["Label"] = "Search closet",
            ["Animation"] = {Dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", Anim = "machinic_loop_mechandplayer"},
        },
    },
    ["Props"] = {
        ["1"] = {
            ["Reward"] = "laptop", -- Item that will be obtained from looting this prop
            ["Exp"] = 5, -- How much XP will be given for looting this prop

            ["Prop"] = "xm_prop_x17_laptop_agent14_01", -- Prop name
            ["Coords"] = vector3(7.93, 1.93, 0.96), -- Coords of the prop
            ["Rotation"] = vector3(0.0, 0.0, -89.080), -- Rotation of the prop
            ["Icon"] = 'fas fa-box-archive', -- Icon for the prop
            ["Label"] = "Steal Laptop", -- Label for the prop
            ["Animation"] = {Dict = "anim@amb@carmeet@checkout_car@female_d@base", Anim = "base"},
        },
        ["2"] = {
            ["Reward"] = "x_watch", -- Item that will be obtained from looting this prop
            ["Exp"] = 5, -- How much XP will be given for looting this prop

            ["Prop"] = "p_watch_04", -- Prop name
            ["Coords"] = vector3(-0.81, -0.38, 1.16), -- Coords of the prop
            ["Rotation"] = vector3(0.0, 0.0, 227.85), -- Rotation of the prop
            ["Icon"] = 'fas fa-clock', -- Icon for the prop
            ["Label"] = "Steal Watch", -- Label for the prop
            ["Animation"] = {Dict = "random@train_tracks", Anim = "idle_e"},
        },
        ["3"] = {
            ["Reward"] = "x_electricguitar", -- Item that will be obtained from looting this prop
            ["Exp"] = 5, -- How much XP will be given for looting this prop

            ["Prop"] = "prop_el_guitar_01", -- Prop name
            ["Coords"] = vector3(-1.00, 1.32, 0.42), -- Coords of the prop
            ["Rotation"] = vector3(-15.29, -0.21, -175.15), -- Rotation of the prop
            ["Icon"] = 'fas fa-guitar', -- Icon for the prop
            ["Label"] = "Steal Electric Guitar", -- Label for the prop
            ["Animation"] = {Dict = "anim@amb@carmeet@checkout_car@female_d@base", Anim = "base"},
        },
    },
    ["Cash"] = {
        ["1"] = {
            ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
            ['CashItem'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
            ['Amount'] = {min = 25, max = 100}, -- Cash that is recieved
            ['MetaData'] = false, -- Meta data for the cash item (Item info)

            ["Exp"] = 5, -- How much XP will be given for looting this prop

            ["Prop"] = "prop_anim_cash_pile_02", -- Prop name
            ["Coords"] = vector3(1.74, 2.70, 1.13), -- Coords of the prop
            ["Rotation"] = vector3(0.0, 0.0, 95.0), -- Rotation of the prop
            ["Icon"] = 'fas fa-money-bill-wave', -- Icon for the prop
            ["Label"] = "Steal Cash", -- Label for the prop
            ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
        },
    },
    ["Safe"] = {
        ["1"] = {
            ["Exp"] = 10, -- XP Reward

            ["Coords"] = vector3(7.68, -0.21, 1.36), -- Coords of the prop
            ["Rotation"] = vector3(0.0, 0.0, -89.080), -- Rotation of the prop
            ["Icon"] = 'fab fa-keycdn', -- Icon for the prop
            ["Label"] = "Unlock Safe" -- Label for the prop
        },
    },
    ["HighValueItems"] = {
        ["1"] = {
            ["Reward"] = "x_bananatrophy", -- Item that will be obtained from looting this prop
            ["Exp"] = 5, -- How much XP will be given for looting this prop

            ["Coords"] = vector3(5.67, -1.34, 0.99), -- Coords of the prop
            ["Rotation"] = vector3(0.0, 0.0, 95.0), -- Rotation of the prop
            ["Prop"] = "ch_prop_ch_trophy_monkey_01a", -- Prop to be displayed in the glass stand
            ["Icon"] = 'fas fa-apple-whole', -- Icon for the prop
            ["Label"] = "Steal Trophy", -- Label for the prop
        },
    },
    ["Tenants"] = {
        {
            ["Coords"] = vector4(5.07, 2.27, 1.06, 265.21),
            ["Model"] = "s_m_y_busboy_01",

            ["Animation"] = {Dict = "timetable@tracy@sleep@", Anim = "idle_c"},

            ["Detection"] = {
                ["Enable"] = false,
                ["ZoneCoords"] = {}, -- Check other examples that i've done
                ["ZoneHeight"] = 4.0,
            },
        },
        {
            ["Coords"] = vector4(5.96, 2.30, 1.02, 265.21),
            ["Model"] = "s_f_y_movprem_01",

            ["Animation"] = {Dict = "timetable@tracy@sleep@", Anim = "idle_c"},

            ["Detection"] = {
                ["Enable"] = false,
                ["ZoneCoords"] = {}, -- Check other examples that i've done
                ["ZoneHeight"] = 4.0,
            },
        },
    },
    ["Alarms"] = {
        ["AlarmProp"] = {Model = "v_res_tre_alarmbox", Coords = vector4(8.18, 0.93, 1.73, 89.14), Label = "Disable Alarm", Icon = "fas fa-bell-slash"}, -- Alarm prop (Coords is in an offset)
        ["RequiredItem"] = "x_device", -- Item required to disable the alarm, set it to false if you don't want a required item
    },
    ["Cameras"] = {
        {["Coords"] = vector3(3.51, -3.15, 3.35), ["Rotation"] = vector3(-0.0, -0.0, 37.010670), ["Rotatable"] = true, ["Infos"] = {["Displays"] = false, ["Paintings"] = false, ["Safes"] = false, ["HighValueItems"] = false, ["TimeFrame"] = true, ["TenantCount"] = false}},
        {["Coords"] = vector3(7.77, -1.30, 3.35), ["Rotation"] = vector3(0.000000, -0.000000, 37.010670), ["Rotatable"] = true, ["Infos"] = {["Displays"] = false, ["Paintings"] = false, ["Safes"] = true, ["HighValueItems"] = true, ["TimeFrame"] = false, ["TenantCount"] = true}},
    },
    ["Contracts"] = {
        ["ChanceOfSpawning"] = 100, -- (%) Chance of spawning a contract
        ["PossibleContracts"] = {
            -- ["1"] = {
            --     ["Contract"] = "Drone", -- Contract name (Take those from contracts.lua file)
            --     ["Type"] = "Break Objects", -- Contract type "Break Objects" or "Littering" or "Steal Objects"

            --     ["ModelCoords"] = vector3(3.38, -2.28, 0.91), -- Coords where the contract will spawn
            --     ["ModelRotation"] = vector3(0.0, 0.0, 0.0), -- Rotation of the contract model
            --     ["BrokenCoords"] = vector3(3.38, -2.28, 0.91), -- Coords where the contract will spawn
            --     ["BrokenRotation"] = vector3(0.0, 0.0, 0.0), -- Rotation of the broken contract model
            -- },
            ["1"] = {
                ["Contract"] = "Stain", -- Contract name (Take those from contracts.lua file)
                ["Type"] = "Littering", -- Contract type "Break Objects" or "Littering" or "Steal Objects"

                ["PickupCoords"] = vector3(2.60, 1.52, 1.22), -- Coords where the contract will spawn
                ["PickupRotation"] = vector3(0.0, 0.0, 0.0), -- Rotation of the contract model

                ["LitteredCoords"] = vector3(3.42, -0.05, 0.39), -- Coords where the contract will spawn
                ["LitteredRotation"] = vector3(0.0, 0.0, 0.0), -- Rotation of the contract model
            },
        },
    }
})