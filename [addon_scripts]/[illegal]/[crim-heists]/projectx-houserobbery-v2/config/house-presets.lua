Config.PresetHouseCoords = {
    ["Shells"] = {
        ["k4_house4_furn"] = {
            ["ExitCoords"] = vector4(1.46, -10.33, 1.70, 0.0), -- Exit coords of the house
            ["Spots"] = {
                ["1"] = {
                    ["Type"] = "drawer",
                    ["Coords"] = vector3(3.574, 7.871, 1.80),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search drawer",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["2"] = {
                    ["Type"] = "drawer",
                    ["Coords"] = vector3(5.95, 9.34, 1.80),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search drawer",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["3"] = {
                    ["Type"] = "kitchen",
                    ["Coords"] = vector3(-0.498, 0.351, 1.80),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search kitchen",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["4"] = {
                    ["Type"] = "cabinet",
                    ["Coords"] = vector3(7.489, 4.024, 1.50),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search cabinet",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["5"] = {
                    ["Type"] = "cabinet",
                    ["Coords"] = vector3(0.580, 1.214, 1.80),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search cabinet",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
            },
            ["Props"] = {
                ["1"] = {
                    ["Reward"] = "laptop", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "xm_prop_x17_laptop_agent14_01", -- Prop name
                    ["Coords"] = vector3(-3.51, 6.27, 1.35), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 95.0), -- Rotation of the prop
                    ["Icon"] = 'fas fa-box-archive', -- Icon for the prop
                    ["Label"] = "Steal Laptop", -- Label for the prop
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["2"] = {
                    ["Reward"] = "x_coffeemaker", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "prop_coffee_mac_02", -- Prop name
                    ["Coords"] = vector3(-0.51, -0.83, 1.83), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 227.85), -- Rotation of the prop
                    ["Icon"] = 'fas fa-box-archive', -- Icon for the prop
                    ["Label"] = "Steal Coffee Machine", -- Label for the prop
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
            },
            ["Cash"] = {
                ["1"] = {
                    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
                    ['CashItem'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
                    ['Amount'] = {min = 125, max = 300}, -- Cash that is recieved
                    ['MetaData'] = false, -- Meta data for the cash item (Item info)

                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "prop_anim_cash_pile_02", -- Prop name
                    ["Coords"] = vector3(-3.51, 6.27, 1.35), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 95.0), -- Rotation of the prop
                    ["Icon"] = 'fas fa-money-bill-wave', -- Icon for the prop
                    ["Label"] = "Steal Cash", -- Label for the prop
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
            },
            ["Safe"] = {
                ["1"] = {
                    ["Exp"] = 10, -- XP Reward

                    ["Coords"] = vector3(-0.19, 9.80, 1.86), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 0.0), -- Rotation of the prop
                    ["Icon"] = 'fab fa-keycdn', -- Icon for the prop
                    ["Label"] = "Unlock Safe" -- Label for the prop
                },
            },
            ["Display"] = {
                ["1"] = {
                    ["Reward"] = "diamond", -- Reward name
                    ["Exp"] = 10, -- XP Reward

                    ["DisplayCoords"] = vector3(-7.35, 2.99, 1.86), -- Coords of the prop
                    ["DisplayHeading"] = 90.0, -- Rotation of the prop

                    ["Prop"] = "h4_prop_h4_diamond_01a", -- Prop to be displayed in the glass stand
                    ["PropCoords"] = vector3(-7.35, 2.99, 2.085), -- Coords of the prop
                    ["PropHeading"] = -180.0, -- Rotation of the prop

                    ["RemoveStand"] = false, -- If true, the stand inside the display will not spawn
                    ["Icon"] = 'fas fa-glass-water', -- Icon for the prop
                    ["Label"] = "Break Glass" -- Label for the prop
                },
            },
            ["Painting"] = {
                ["1"] = {
                    ["Reward"] = "x_painting", -- Reward name
                    ["Exp"] = 10, -- XP Reward

                    ["Coords"] = vector3(4.25, 10.37, 1.91), -- Coords of the prop
                    ["Rotation"] = vec3(0.00, -0.00, 0.0), -- Rotation of the prop
                    ["AnimRotation"] = vec3(0.00, -0.00, 0.0), -- Rotation of the prop
                    ["AnimPosition"] = vector3(4.32, 9.92, 1.86), -- Position where the player will be placed when looting the painting
                    ["Prop"] = "ch_prop_vault_painting_01g", -- Prop to be displayed in the glass stand
                    ["Icon"] = 'fas fa-paintbrush', -- Icon for the prop
                    ["Label"] = "Steal Painting" -- Label for the prop
                },
            },
            ["HighValueItems"] = {
                ["1"] = {
                    ["Reward"] = "phone", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Coords"] = vector3(-3.48, 6.22, 1.45), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 95.0), -- Rotation of the prop
                    ["Prop"] = "xm_prop_x17_phone_01", -- Prop to be displayed in the glass stand
                    ["Icon"] = 'fab fa-shirtsinbulk', -- Icon for the prop
                    ["Label"] = "Steal Phone", -- Label for the prop
                },
            },
            ["Tenants"] = {
                {
                    ["Coords"] = vector4(4.53, 6.63, 1.50, 210.39),
                    ["Model"] = "s_m_m_autoshop_01",

                    ["Animation"] = {Dict = "timetable@tracy@sleep@", Anim = "idle_c"},

                    ["Detection"] = {
                        ["Enable"] = false,
                        ["ZoneCoords"] = {}, -- Check other examples that i've done
                        ["ZoneHeight"] = 4.0,
                    },
                },
            },
            ["Pets"] = {
                {["Coords"] = vector4(-0.52, 5.78, 1.75, 210.39), ["Model"] = "a_c_chop", ["Detection"] = false, ["Animation"] = {Dict = "creatures@rottweiler@amb@sleep_in_kennel@", Anim = "sleep_in_kennel"}},
            },
            ["Laser"] = {
                ["LasersProp"] = {["Model"] = "ch_prop_fingerprint_scanner_01e", ["Coords"] = vector4(3.33, -6.56, 1.95, 270.0), ["Label"] = "Turn off the lasers", ["Icon"] = "fas fa-barcode"}, -- (Coords is in an offset)
                ["RequiredLaserItem"] = false, -- Item required to turn off the lasers, set to false if you don't want a required item
                ["LaserCoords"] = {
                    {["Coords1"] = vector3(0.10, -5.78, 1.50), ["Coords2"] = vector3(3.30, -5.69, 1.50), ["Range"] = 5.0},
                    {["Coords1"] = vector3(0.10, -5.78, 2.10), ["Coords2"] = vector3(3.30, -5.69, 2.10), ["Range"] = 5.0},
                },
            },
            ["Alarms"] = {
                ["AlarmProp"] = {Model = "v_res_tre_alarmbox", Coords = vector4(3.15, 5.14, 2.0, 0.0), Label = "Disable Alarm", Icon = "fas fa-bell-slash"}, -- Alarm prop (Coords is in an offset)
                ["RequiredItem"] = false, -- Item required to disable the alarm, set it to false if you don't want a required item
            },
            ["Cameras"] = {
                {["Coords"] = vector3(-4.91, 9.95, 3.65), ["Rotation"] = vector3(-0.001617, -0.000026, -138.359222), ["Rotatable"] = true, ["Infos"] = {["Displays"] = false, ["Paintings"] = false, ["Safes"] = false, ["HighValueItems"] = false, ["TimeFrame"] = true, ["TenantCount"] = true}},
                {["Coords"] = vector3(7.53, 3.10, 3.65), ["Rotation"] = vector3(0.000000, -0.000000, 50.033669), ["Rotatable"] = true, ["Infos"] = {["Displays"] = true, ["Paintings"] = true, ["Safes"] = true, ["HighValueItems"] = true, ["TimeFrame"] = false, ["TenantCount"] = false}},
            },
            ["Contracts"] = {
                ["ChanceOfSpawning"] = 100, -- (%) Chance of spawning a contract
                ["PossibleContracts"] = {
                    ["1"] = {
                        ["Contract"] = "Laptop", -- Contract name (Take those from contracts.lua file)
                        ["Type"] = "Break Objects", -- Contract type "Break Objects" or "Littering" or "Steal Objects"

                        ["ModelCoords"] = vector3(-3.57, 1.51, 1.88), -- Coords where the contract will spawn
                        ["ModelRotation"] = vector3(0.0, 0.0, 0.0), -- Rotation of the contract model
                        ["BrokenCoords"] = vector3(-3.57, 1.51, 1.88), -- Coords where the contract will spawn
                        ["BrokenRotation"] = vector3(0.0, 0.0, 0.0), -- Rotation of the broken contract model
                    },
                    ["2"] = {
                        ["Contract"] = "Briefcase", -- Contract name (Take those from contracts.lua file)
                        ["Type"] = "Steal Objects", -- Contract type "Break Objects" or "Littering" or "Steal Objects"

                        ["Item"] = "x_suitcase", -- Item that will be given when stealing the object
                        ["Exp"] = 10, -- How much XP will be given for stealing this object

                        ["ModelCoords"] = vector3(7.74, 9.20, 0.82), -- Coords where the contract will spawn
                        ["ModelRotation"] = vector3(0.0, 0.0, 270.94), -- Rotation of the contract model
                    },
                    ["3"] = {
                        ["Contract"] = "Poop", -- Contract name (Take those from contracts.lua file)
                        ["Type"] = "Littering", -- Contract type "Break Objects" or "Littering" or "Steal Objects"

                        ["PickupCoords"] = vector3(-2.98, -0.96, 1.80), -- Coords where the contract will spawn
                        ["PickupRotation"] = vector3(0.0, 0.0, 0.0), -- Rotation of the contract model

                        ["LitteredCoords"] = vector3(5.23, 6.66, 1.55), -- Coords where the contract will spawn
                        ["LitteredRotation"] = vector3(0.0, 0.0, 0.0), -- Rotation of the contract model
                    },
                },
            }
        },
        ["lev_apartment_shell"] = {
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
                    ["Reward"] = "rolex", -- Item that will be obtained from looting this prop
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
                ["RequiredItem"] = false, -- Item required to disable the alarm, set it to false if you don't want a required item
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
        },
        ["k4_v16low1_shell"] = {
            ["ExitCoords"] = vector4(4.71, -6.54, 1.21, 0.0), -- Exit coords of the house
            ["Spots"] = {
                ["1"] = {
                    ["Type"] = "drawer",
                    ["Coords"] = vector3(3.20, 5.93, 3.00),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search drawer",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["2"] = {
                    ["Type"] = "drawer",
                    ["Coords"] = vector3(4.75, 4.33, 3.01),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search drawer",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["3"] = {
                    ["Type"] = "closet",
                    ["Coords"] = vector3(4.71, 0.43, 3.30),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search closet",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["4"] = {
                    ["Type"] = "cabinet",
                    ["Coords"] = vector3(4.91, 2.01, 3.25),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search cabinet",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
            },
            ["Props"] = {
                ["1"] = {
                    ["Reward"] = "x_television", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "prop_tv_03", -- Prop name
                    ["Coords"] = vector3(-4.32, 3.96, 3.05), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 88.88), -- Rotation of the prop
                    ["Icon"] = 'fas fa-tv', -- Icon for the prop
                    ["Label"] = "Steal TV", -- Label for the prop
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["2"] = {
                    ["Reward"] = "x_coffeemaker", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "prop_coffee_mac_02", -- Prop name
                    ["Coords"] = vector3(4.92, 5.89, 3.20), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, -47.96), -- Rotation of the prop
                    ["Icon"] = 'fas fa-box-archive', -- Icon for the prop
                    ["Label"] = "Steal Coffee Machine", -- Label for the prop
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["3"] = {
                    ["Reward"] = "x_toaster", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "prop_toaster_02", -- Prop name
                    ["Coords"] = vector3(2.09, 6.13, 3.19), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 0.0), -- Rotation of the prop
                    ["Icon"] = 'fas fa-box-archive', -- Icon for the prop
                    ["Label"] = "Steal Toaster", -- Label for the prop
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
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
                    ["Coords"] = vector3(1.50, 3.86, 3.13), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, -39.68), -- Rotation of the prop
                    ["Icon"] = 'fas fa-money-bill-wave', -- Icon for the prop
                    ["Label"] = "Steal Cash", -- Label for the prop
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
            },
            ["Painting"] = {
                ["1"] = {
                    ["Reward"] = "x_painting", -- Reward name
                    ["Exp"] = 10, -- XP Reward

                    ["Coords"] = vector3(1.68, -0.44, 3.30), -- Coords of the prop
                    ["Rotation"] = vec3(0.00, -0.00, 178.71), -- Rotation of the prop
                    ["AnimRotation"] = vec3(0.000000, -0.000000, 179.072495), -- Rotation of the prop
                    ["AnimPosition"] = vector3(1.65, 0.01, 3.21), -- Position where the player will be placed when looting the painting
                    ["Prop"] = "ch_prop_vault_painting_01g", -- Prop to be displayed in the glass stand
                    ["Icon"] = 'fas fa-paintbrush', -- Icon for the prop
                    ["Label"] = "Steal Painting" -- Label for the prop
                },
            },
            ["Tenants"] = {
                {
                    ["Coords"] = vector4(-0.46, 4.16, 2.60, 89.14),
                    ["Model"] = "s_m_m_gardener_01",

                    ["Animation"] = {Dict = "timetable@tracy@sleep@", Anim = "idle_c"},

                    ["Detection"] = {
                        ["Enable"] = false,
                        ["ZoneCoords"] = {}, -- Check other examples that i've done
                        ["ZoneHeight"] = 4.0,
                    },
                },
            },
            ["EnableStationaryProps"] = true, -- Enable/Disable Stationary props in the house
            ["StationaryProps"] = {
                {
                    ["Prop"] = "prop_couch_sm_06", -- Prop name
                    ["Coords"] = vector3(-0.26, 4.12, 2.21), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, -93.85), -- Rotation of the prop
                },
                {
                    ["Prop"] = "prop_rub_table_01", -- Prop name
                    ["Coords"] = vector3(-4.44, 4.03, 2.21), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 91.14), -- Rotation of the prop
                },
            },
            ["Cameras"] = {
                {["Coords"] = vector3(1.51, -0.14, 4.85), ["Rotation"] = vector3(0.000000, -0.000000, -0.706275), ["Rotatable"] = true, ["Infos"] = {["Paintings"] = true, ["TimeFrame"] = true, ["TenantCount"] = true}},
            },
            ["Contracts"] = {
                ["ChanceOfSpawning"] = 100, -- (%) Chance of spawning a contract
                ["PossibleContracts"] = {
                    ["1"] = {
                        ["Contract"] = "Phone", -- Contract name (Take those from contracts.lua file)
                        ["Type"] = "Break Objects", -- Contract type "Break Objects" or "Littering" or "Steal Objects"

                        ["ModelCoords"] = vector3(-0.33, 3.14, 2.94), -- Coords where the contract will spawn
                        ["ModelRotation"] = vector3(-90.684, -0.511, -94.085), -- Rotation of the contract model
                        ["BrokenCoords"] = vector3(-0.33, 3.14, 3.01), -- Coords where the contract will spawn
                        ["BrokenRotation"] = vector3(-1.712, 3.574, -90.058), -- Rotation of the broken contract model
                    },
                },
            }
        },
    },
    ["IPLs"] = {
        ["MissionRowApartment"] = {
            ["ExitCoords"] = vector4(266.12, -1007.49, -101.01, 355.68), -- Exit coords of the house
            ["Spots"] = {
                ["1"] = {
                    ["Type"] = "kitchen",
                    ["Coords"] = vector3(265.48, -995.13, -99.31),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search cabinet",
                    ["Animation"] = {Dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", Anim = "machinic_loop_mechandplayer"},
                },

                ["2"] = {
                    ["Type"] = "cabinet",
                    ["Coords"] = vector3(266.24, -999.39, -99.19),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search cabinet",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["3"] = {
                    ["Type"] = "drawer",
                    ["Coords"] = vector3(261.36, -1002.21, -99.36),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search drawer",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["4"] = {
                    ["Type"] = "kitchen",
                    ["Coords"] = vector3(263.54, -995.13, -99.23),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search drawer",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["5"] = {
                    ["Type"] = "closet",
                    ["Coords"] = vector3(259.81, -1004.40, -98.90),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search closet",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
            },
            ["Props"] = {
                ["1"] = {
                    ["Reward"] = "laptop", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "xm_prop_x17_laptop_agent14_01", -- Prop name
                    ["Coords"] = vector3(258.56, -996.73, -99.56), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 120.0), -- Rotation of the prop
                    ["Icon"] = 'fas fa-box-archive', -- Icon for the prop
                    ["Label"] = "Steal Laptop", -- Label for the prop
                    ["Animation"] = {Dict = "anim@amb@carmeet@checkout_car@female_d@base", Anim = "base"},
                },
                ["2"] = {
                    ["Reward"] = "x_microwave", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "prop_microwave_1", -- Prop name
                    ["Coords"] = vector3(266.28, -994.98, -99.04), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 310.13), -- Rotation of the prop
                    ["Icon"] = 'fas fa-box-archive', -- Icon for the prop
                    ["Label"] = "Steal Microwave", -- Label for the prop
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["3"] = {
                    ["Reward"] = "x_toaster", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "prop_toaster_02", -- Prop name
                    ["Coords"] = vector3(266.32, -996.97, -99.04), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 132.97), -- Rotation of the prop
                    ["Icon"] = 'fas fa-box-archive', -- Icon for the prop
                    ["Label"] = "Steal Toaster", -- Label for the prop
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
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
                    ["Coords"] = vector3(262.88, -997.13, -99.09), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 95.0), -- Rotation of the prop
                    ["Icon"] = 'fas fa-money-bill-wave', -- Icon for the prop
                    ["Label"] = "Steal Cash", -- Label for the prop
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["2"] = {
                    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
                    ['CashItem'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
                    ['Amount'] = {min = 25, max = 100}, -- Cash that is recieved
                    ['MetaData'] = false, -- Meta data for the cash item (Item info)

                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "prop_anim_cash_pile_02", -- Prop name
                    ["Coords"] = vector3(262.00, -1000.44, -99.30), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 95.0), -- Rotation of the prop
                    ["Icon"] = 'fas fa-money-bill-wave', -- Icon for the prop
                    ["Label"] = "Steal Cash", -- Label for the prop
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
            },
            ["Tenants"] = {
                {
                    ["Coords"] = vector4(262.54, -1004.3, -98.24, 177.0),
                    ["Model"] = "s_f_y_bartender_01",

                    ["Animation"] = {Dict = "timetable@tracy@sleep@", Anim = "idle_c"},

                    ["Detection"] = {
                        ["Enable"] = false,
                        ["ZoneCoords"] = {}, -- Check other examples that i've done
                        ["ZoneHeight"] = 4.0,
                    },
                },
            },
            ["Pets"] = {
                {["Coords"] = vector4(257.74, -997.65, -99.01, 243.6), ["Model"] = "a_c_retriever", ["Animation"] = {Dict = "creatures@rottweiler@amb@sleep_in_kennel@", Anim = "sleep_in_kennel"}},
                {["Coords"] = vector4(260.94, -1003.94, -99.01, 356.8), ["Model"] = "a_c_chop", ["Animation"] = {Dict = "creatures@rottweiler@amb@sleep_in_kennel@", Anim = "sleep_in_kennel"}},
            },
            ["Contracts"] = {
                ["ChanceOfSpawning"] = 100, -- (%) Chance of spawning a contract
                ["PossibleContracts"] = {
                    ["1"] = {
                        ["Contract"] = "Tablet", -- Contract name (Take those from contracts.lua file)
                        ["Type"] = "Break Objects", -- Contract type "Break Objects" or "Littering" or "Steal Objects"

                        ["ModelCoords"] = vector3(261.31, -997.66, -99.44), -- Coords where the contract will spawn
                        ["ModelRotation"] = vector3(-91.145, -2.860, 96.837), -- Rotation of the contract model
                        ["BrokenCoords"] = vector3(261.31, -997.66, -99.44), -- Coords where the contract will spawn
                        ["BrokenRotation"] = vector3(-91.145, -2.860, 96.837), -- Rotation of the broken contract model
                    },
                },
            }
        },
        ["3655WildOatsDrive"] = {
            ["ExitCoords"] = vector4(-174.39, 497.91, 137.65, 359.87), -- Exit coords of the house
            ["Spots"] = {
                ["1"] = {
                    ["Type"] = "drawer",
                    ["Coords"] = vector3(-171.77, 487.21, 137.13),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search drawer",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },

                ["2"] = {
                    ["Type"] = "kitchen",
                    ["Coords"] = vector3(-166.93, 497.10, 137.48),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search drawer",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["3"] = {
                    ["Type"] = "closet",
                    ["Coords"] = vector3(-167.51, 488.45, 133.67),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search closet",
                    ["Animation"] = {Dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", Anim = "machinic_loop_mechandplayer"},
                },
                ["4"] = {
                    ["Type"] = "cabinet",
                    ["Coords"] = vector3(-171.01, 482.40, 137.04),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search cabinet",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["5"] = {
                    ["Type"] = "cabinet",
                    ["Coords"] = vector3(-170.78, 481.59, 133.59),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search cabinet",
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
            },
            ["Props"] = {
                ["1"] = {
                    ["Reward"] = "laptop", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "xm_prop_x17_laptop_agent14_01", -- Prop name
                    ["Coords"] = vector3(-164.22, 484.36, 136.74), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 120.0), -- Rotation of the prop
                    ["Icon"] = 'fas fa-box-archive', -- Icon for the prop
                    ["Label"] = "Steal Laptop", -- Label for the prop
                    ["Animation"] = {Dict = "anim@amb@carmeet@checkout_car@female_d@base", Anim = "base"},
                },
                ["2"] = {
                    ["Reward"] = "x_coffeemaker", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "prop_coffee_mac_02", -- Prop name
                    ["Coords"] = vector3(-167.42, 497.38, 137.60), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 0.0), -- Rotation of the prop
                    ["Icon"] = 'fas fa-box-archive', -- Icon for the prop
                    ["Label"] = "Steal Coffee Machine", -- Label for the prop
                    ["Animation"] = {Dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", Anim = "machinic_loop_mechandplayer"},
                },
                ["3"] = {
                    ["Reward"] = "x_microwave", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "prop_microwave_1", -- Prop name
                    ["Coords"] = vector3(-166.57, 493.58, 137.60), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, -156.43), -- Rotation of the prop
                    ["Icon"] = 'fas fa-box-archive', -- Icon for the prop
                    ["Label"] = "Steal Microwave", -- Label for the prop
                    ["Animation"] = {Dict = "amb@prop_human_bum_shopping_cart@male@idle_a", Anim = "idle_c"},
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
                    ["Coords"] = vector3(-162.69, 485.50, 133.48), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 95.0), -- Rotation of the prop
                    ["Icon"] = 'fas fa-money-bill-wave', -- Icon for the prop
                    ["Label"] = "Steal Cash", -- Label for the prop
                    ["Animation"] = {Dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", Anim = "machinic_loop_mechandplayer"},
                },
                ["2"] = {
                    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
                    ['CashItem'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
                    ['Amount'] = {min = 25, max = 100}, -- Cash that is recieved
                    ['MetaData'] = false, -- Meta data for the cash item (Item info)

                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "prop_anim_cash_pile_02", -- Prop name
                    ["Coords"] = vector3(-168.24, 479.45, 133.28), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 95.0), -- Rotation of the prop
                    ["Icon"] = 'fas fa-money-bill-wave', -- Icon for the prop
                    ["Label"] = "Steal Cash", -- Label for the prop
                    ["Animation"] = {Dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", Anim = "machinic_loop_mechandplayer"},
                },
            },
            ["Safe"] = {
                ["1"] = {
                    ["Exp"] = 10, -- XP Reward

                    ["Coords"] = vector3(-171.29, 489.79, 130.04), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 193.7), -- Rotation of the prop
                    ["Icon"] = 'fab fa-keycdn', -- Icon for the prop
                    ["Label"] = "Unlock Safe" -- Label for the prop
                },
            },
            ["Display"] = {
                ["1"] = {
                    ["Reward"] = "diamond", -- Reward name
                    ["Exp"] = 10, -- XP Reward

                    ["DisplayCoords"] = vector3(-173.94, 489.39, 130.04), -- Coords of the prop
                    ["DisplayHeading"] = 195.7, -- Rotation of the prop

                    ["Prop"] = "h4_prop_h4_diamond_01a", -- Prop to be displayed in the glass stand
                    ["PropCoords"] = vector3(-173.94, 489.39, 130.24), -- Coords of the prop
                    ["PropHeading"] = -180.0, -- Rotation of the prop

                    ["RemoveStand"] = false, -- If true, the stand inside the display will not spawn
                    ["Icon"] = 'fas fa-glass-water', -- Icon for the prop
                    ["Label"] = "Break Glass" -- Label for the prop
                },
            },
            ["Painting"] = {
                ["1"] = {
                    ["Reward"] = "x_painting", -- Reward name
                    ["Exp"] = 10, -- XP Reward

                    ["Coords"] = vector3(-175.580, 500.785, 134.78), -- Coords of the prop
                    ["Rotation"] = vec3(0.00, -0.00, 11.779), -- Rotation of the prop
                    ["AnimRotation"] = vec3(0.00, -0.00, 9.955569), -- Rotation of the prop
                    ["AnimPosition"] = vector3(-175.49, 500.36, 134.64), -- Position where the player will be placed when looting the painting
                    ["Prop"] = "ch_prop_vault_painting_01g", -- Prop to be displayed in the glass stand
                    ["Icon"] = 'fas fa-paintbrush', -- Icon for the prop
                    ["Label"] = "Steal Painting" -- Label for the prop
                },
            },
            ["Tenants"] = {
                {
                    ["Coords"] = vector4(-262.82, -1004.32, -98.2, 176.64),
                    ["Model"] = "g_f_y_vagos_01",

                    ["Animation"] = {Dict = "timetable@tracy@sleep@", Anim = "idle_c"},

                    ["Detection"] = {
                        ["Enable"] = false,
                        ["ZoneCoords"] = {}, -- Check other examples that i've done
                        ["ZoneHeight"] = 4.0,
                    },
                },
            },
            ["Pets"] = {
                {["Coords"] = vector4(-166.1, 484.16, 136.27, 66.96), ["Model"] = "a_c_retriever", ["Animation"] = {Dict = "creatures@rottweiler@amb@sleep_in_kennel@", Anim = "sleep_in_kennel"}},
                {["Coords"] = vector4(-173.4, 492.11, 132.84, 1.08), ["Model"] = "a_c_chop", ["Animation"] = {Dict = "creatures@rottweiler@amb@sleep_in_kennel@", Anim = "sleep_in_kennel"}},
            },
            ["Laser"] = {
                ["LasersProp"] = {["Model"] = "ch_prop_fingerprint_scanner_01e", ["Coords"] = vector4(-174.54, 500.995, 130.39, 11.88), ["Label"] = "Turn off the lasers", ["Icon"] = "fas fa-barcode"}, -- (Coords is in an offset)
                ["RequiredLaserItem"] = false, -- Item required to turn off the lasers, set to false if you don't want a required item
                ["LaserCoords"] = {
                    {["Coords1"] = vector3(-171.69, 496.0, 129.04), ["Coords2"] = vector3(-171.69, 496.0, 131.04), ["Range"] = 3.7},
                    {["Coords1"] = vector3(-172.3, 495.89, 129.04), ["Coords2"] = vector3(-172.3, 495.89, 131.04), ["Range"] = 3.7},
                    {["Coords1"] = vector3(-172.99, 495.73, 129.04), ["Coords2"] = vector3(-172.99, 495.73, 131.04), ["Range"] = 3.7},
                },
            },
            ["Contracts"] = {
                ["ChanceOfSpawning"] = 100, -- (%) Chance of spawning a contract
                ["PossibleContracts"] = {
                    ["1"] = {
                        ["Contract"] = "Harddrive", -- Contract name (Take those from contracts.lua file)
                        ["Type"] = "Steal Objects", -- Contract type "Break Objects" or "Littering" or "Steal Objects"

                        ["Item"] = "cryptoharddrive", -- Item that will be given when stealing the object
                        ["Exp"] = 10, -- How much XP will be given for stealing this object

                        ["ModelCoords"] = vector3(-169.62, 494.64, 129.76), -- Coords where the contract will spawn
                        ["ModelRotation"] = vector3(0.0, 0.0, 0.0), -- Rotation of the contract model
                    },
                    ["2"] = {
                        ["Contract"] = "Frame", -- Contract name (Take those from contracts.lua file)
                        ["Type"] = "Break Objects", -- Contract type "Break Objects" or "Littering" or "Steal Objects"

                        ["ModelCoords"] = vector3(-173.03, 490.20, 137.49), -- Coords where the contract will spawn
                        ["ModelRotation"] = vector3(0.0, 0.0, 99.14), -- Rotation of the contract model
                        ["BrokenCoords"] = vector3(-173.03, 490.20, 137.49), -- Coords where the contract will spawn
                        ["BrokenRotation"] = vector3(0.0, 0.0, 99.14), -- Rotation of the broken contract model
                    },
                },
            }
        },
        ["EclipseTowersPenthouse2"] = {
            ["ExitCoords"] = vector4(-785.21, 314.32, 217.64, 0), -- Exit coords of the house
            ["Spots"] = {
                ["1"] = {
                    ["Type"] = "drawer",
                    ["Coords"] = vector3(-789.06, 321.8, 217.04),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search Drawer",
                    ["Animation"] = {Dict = "amb@prop_human_bum_shopping_cart@male@idle_a", Anim = "idle_c"},
                },
                ["2"] = {
                    ["Type"] = "cabinet",
                    ["Coords"] = vector3(-789.02, 320.12, 217.04),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search Cabinet",
                    ["Animation"] = {Dict = "amb@prop_human_bum_shopping_cart@male@idle_a", Anim = "idle_c"},
                },
                ["3"] = {
                    ["Type"] = "kitchen",
                    ["Coords"] = vector3(-782.0, 328.4, 217.04),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search Kitchen",
                    ["Animation"] = {Dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", Anim = "machinic_loop_mechandplayer"},
                },
                ["4"] = {
                    ["Type"] = "cabinet",
                    ["Coords"] = vector3(-783.12, 325.38, 217.04),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search Cabinet",
                    ["Animation"] = {Dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", Anim = "machinic_loop_mechandplayer"},
                },
                ["5"] = {
                    ["Type"] = "drawer",
                    ["Coords"] = vector3(-800.07, 338.2, 220.44),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search Drawer",
                    ["Animation"] = {Dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", Anim = "machinic_loop_mechandplayer"},
                },
                ["6"] = {
                    ["Type"] = "drawer",
                    ["Coords"] = vector3(-797.8, 333.32, 220.44),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search Drawer",
                    ["Animation"] = {Dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", Anim = "machinic_loop_mechandplayer"},
                },
                ["7"] = {
                    ["Type"] = "cabinet",
                    ["Coords"] = vector3(-797.8, 333.32, 220.44),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search Cabinet",
                    ["Animation"] = {Dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", Anim = "machinic_loop_mechandplayer"},
                },
                ["8"] = {
                    ["Type"] = "drawer",
                    ["Coords"] = vector3(-792.65, 330.04, 217.04),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search Drawer",
                    ["Animation"] = {Dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", Anim = "machinic_loop_mechandplayer"},
                },
                ["9"] = {
                    ["Type"] = "kitchen",
                    ["Coords"] = vector3(-792.65, 330.04, 217.04),
                    ["Icon"] = 'fas fa-search',
                    ["Label"] = "Search Under Sink",
                    ["Animation"] = {Dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", Anim = "machinic_loop_mechandplayer"},
                },
            },
            ["Props"] = {
                ["1"] = {
                    ["Reward"] = "x_plush", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "sum_prop_sum_arcade_plush_05a", -- Prop name
                    ["Coords"] = vector3(-797.17, 335.84, 220.11), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 95.0), -- Rotation of the prop
                    ["Icon"] = 'fas fa-box-archive', -- Icon for the prop
                    ["Label"] = "Steal plushie", -- Label for the prop
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["2"] = {
                    ["Reward"] = "x_toaster", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "prop_toaster_02", -- Prop name
                    ["Coords"] = vector3(-781.43, 330.64, 216.98), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 92.274), -- Rotation of the prop
                    ["Icon"] = 'fas fa-box-archive', -- Icon for the prop
                    ["Label"] = "Steal toaster", -- Label for the prop
                    ["Animation"] = {Dict = "random@train_tracks", Anim = "idle_e"},
                },
                ["3"] = {
                    ["Reward"] = "laptop", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "reh_prop_reh_laptop_01a", -- Prop name
                    ["Coords"] = vector3(-787.51, 330.19, 216.86), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 227.85), -- Rotation of the prop
                    ["Icon"] = 'fas fa-box-archive', -- Icon for the prop
                    ["Label"] = "Steal laptop", -- Label for the prop
                    ["Animation"] = {Dict = "random@train_tracks", Anim = "idle_e"},
                },
                ["4"] = {
                    ["Reward"] = "x_printer", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "v_res_printer", -- Prop name
                    ["Coords"] = vector3(-798.5, 328.28, 216.76), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, -0.473), -- Rotation of the prop
                    ["Icon"] = 'fas fa-box-archive', -- Icon for the prop
                    ["Label"] = "Steal printer", -- Label for the prop
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
            },
            ["Cash"] = {
                ["1"] = {
                    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
                    ['CashItem'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
                    ['Amount'] = {min = 250, max = 500}, -- Cash that is recieved
                    ['MetaData'] = false, -- Meta data for the cash item (Item info)

                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "prop_ld_purse_01", -- Prop name
                    ["Coords"] = vector3(-794.0, 341.54, 216.79), -- Coords of the prop
                    ["Rotation"] = vector3(86.389, -4.940, 35.907), -- Rotation of the prop
                    ["Icon"] = 'fas fa-money-bill-wave', -- Icon for the prop
                    ["Label"] = "Steal Cash", -- Label for the prop
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
                ["2"] = {
                    ['Cash'] = true, -- Set this to false to use a cash "item", or true to use cash
                    ['CashItem'] = "markedbills", -- Item you want to use for cash (['Cash'] = false)
                    ['Amount'] = {min = 250, max = 1000}, -- Cash that is recieved
                    ['MetaData'] = false, -- Meta data for the cash item (Item info)

                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "prop_ld_wallet_pickup", -- Prop name
                    ["Coords"] = vector3(-789.54, 320.54, 217.13), -- Coords of the prop
                    ["Rotation"] = vector3(-91.413, -0.000, -107.493), -- Rotation of the prop
                    ["Icon"] = 'fas fa-money-bill-wave', -- Icon for the prop
                    ["Label"] = "Steal Cash", -- Label for the prop
                    ["Animation"] = {Dict = "mini@repair", Anim = "fixing_a_player"},
                },
            },
            ["Safe"] = {
                ["1"] = {
                    ["Exp"] = 10, -- XP Reward

                    ["Coords"] = vector3(-797.51, 326.38, 220.44), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, -180.67), -- Rotation of the prop
                    ["Icon"] = 'fab fa-keycdn', -- Icon for the prop
                    ["Label"] = "Unlock Safe" -- Label for the prop
                },
            },
            ["Painting"] = {
                ["1"] = {
                    ["Reward"] = "x_painting", -- Reward name
                    ["Exp"] = 10, -- XP Reward

                    ["Coords"] = vector3(-791.20, 325.68, 217.00), -- Coords of the prop
                    ["Rotation"] = vector3(0.00, -0.00, 90.03), -- Rotation of the prop
                    ["AnimRotation"] = vector3(0.00, -0.00, 90.10), -- Rotation of the prop
                    ["AnimPosition"] = vector3(-790.67, 325.68, 217.00), -- Position where the player will be placed when looting the painting 
                    ["Prop"] = "ch_prop_vault_painting_01g", -- Prop to be displayed in the glass stand
                    ["Icon"] = 'fas fa-paintbrush', -- Icon for the prop
                    ["Label"] = "Steal Painting" -- Label for the prop
                },
                ["2"] = {
                    ["Reward"] = "x_painting", -- Reward name
                    ["Exp"] = 10, -- XP Reward

                    ["Coords"] = vector3(-791.08, 333.53, 220.44), -- Coords of the prop  vector3(-791.12, 333.86, 221.69)
                    ["Rotation"] = vector3(0.00, -0.00, 269.99), -- Rotation of the prop
                    ["AnimRotation"] = vector3(0.00, -0.00, -90.87), -- Rotation of the prop
                    ["AnimPosition"] = vector3(-791.53, 333.53, 220.44), -- Position where the player will be placed when looting the painting vector3(-792.39, 332.93, 220.44)
                    ["Prop"] = "h4_prop_h4_painting_01c", -- Prop to be displayed in the glass stand
                    ["Icon"] = 'fas fa-paintbrush', -- Icon for the prop
                    ["Label"] = "Steal Painting" -- Label for the prop
                },
            },
            ["Display"] = {
                ["1"] = {
                    ["Reward"] = "x_goldenknife", -- Reward name
                    ["Exp"] = 10, -- XP Reward

                    ["DisplayCoords"] = vector3(-798.99, 325.33, -217.04), -- Coords of the prop
                    ["DisplayHeading"] = 269.22, -- Rotation of the prop

                    ["Prop"] = "w_me_knife_xm3_08", -- Prop to be displayed in the glass stand
                    ["PropCoords"] = vector3(-798.99, 325.33, -217.04), -- Coords of the prop
                    ["PropHeading"] = 269.22, -- Rotation of the prop

                    ["RemoveStand"] = true, -- If true, the stand inside the display will not spawn
                    ["Icon"] = 'fas fa-gem', -- Icon for the prop
                    ["Label"] = "Break Glass" -- Label for the prop
                },
            },
            ["HighValueItems"] = {
                ["1"] = {
                    ["Reward"] = "emerald_necklace", -- Item that will be obtained from looting this prop
                    ["Exp"] = 5, -- How much XP will be given for looting this prop

                    ["Prop"] = "sf_prop_sf_necklace_01a", -- Prop name
                    ["Coords"] = vector3(-795.91, 328.81, 220.43), -- Coords of the prop
                    ["Rotation"] = vector3(0.0, 0.0, 43.255), -- Rotation of the prop
                    ["Icon"] = 'fas fa-box-archive', -- Icon for the prop
                    ["Label"] = "Steal necklace", -- Label for the prop
                    ["Animation"] = {Dict = "anim@amb@carmeet@checkout_car@female_d@base", Anim = "base"},
                },
            },
            ["Tenants"] = {
                {
                    ["Coords"] = vector4(-786.12, 338.46, 216.85, 274.16),
                    ["Model"] = "s_m_m_strpreach_01",

                    ["Animation"] = {Dict = "timetable@ron@ig_3_couch", Anim = "base"},

                    ["Detection"] = {
                        ["Enable"] = true,
                        ["ZoneCoords"] = {vec(-787.71, 335.15, 216.84), vec(-787.71, 341.45, 216.84), vec(-780.58, 341.45, 216.68), vec(-780.58, 335.15, 216.68)},
                        ["ZoneHeight"] = 4.0,
                    },
                },
                {
                    ["Coords"] = vector4(-798.0, 335.83, 221.11, 94.45),
                    ["Model"] = "s_f_y_clubbar_01",

                    ["Animation"] = {Dict = "timetable@tracy@sleep@", Anim = "idle_c"},

                    ["Detection"] = {
                        ["Enable"] = false,
                        ["ZoneCoords"] = {}, -- Check other examples that i've done
                        ["ZoneHeight"] = 0.0,
                    },
                },
            },
            ["Pets"] = {
                {["Coords"] = vector4(-784.26, 336.2, 216.84, 95.18), ["Model"] = "a_c_chop", ["Animation"] = {Dict = "creatures@rottweiler@amb@sleep_in_kennel@", Anim = "sleep_in_kennel"}},
            },

            ["Laser"] = {
                ["LasersProp"] = {["Model"] = "ch_prop_fingerprint_scanner_01e", ["Coords"] = vector4(-793.47, 324.82, 217.04, 0), ["Label"] = "Turn off the lasers", ["Icon"] = "fas fa-barcode"}, -- (Coords is in an offset)
                ["RequiredLaserItem"] = false, -- Item required to turn off the lasers, set to false if you don't want a required item vector3(-793.99, 324.8, 218.44)
                ["LaserCoords"] = {
                    {["Coords1"] = vector3(-794.48, 324.2, 215.04), ["Coords2"] = vector3(-794.48, 324.2, 220.04), ["Range"] = 5.0},
                    {["Coords1"] = vector3(-794.48, 323.62, 215.04), ["Coords2"] = vector3(-794.48, 323.62, 220.04), ["Range"] = 5.0},
                },
            },

            ["Alarms"] = {
                ["AlarmProp"] = {Model = "v_res_tre_alarmbox", Coords = vector4(-793.76, 331.26, 220.44, 180.43), Label = "Disable Alarm", Icon = "fas fa-bell-slash"}, -- Alarm prop (Coords is in an offset)
                ["RequiredItem"] = false, -- Item required to disable the alarm, set it to false if you don't want a required item 
            },

            ["Contracts"] = {
                ["ChanceOfSpawning"] = 100, -- (%) Chance of spawning a contract
                ["PossibleContracts"] = {
                    ["1"] = {
                        ["Contract"] = "Trashcan", -- Contract name (Take those from contracts.lua file)
                        ["Type"] = "Littering", -- Contract type "Break Objects" or "Littering" or "Steal Objects"

                        ["PickupCoords"] = vector3(-764.00, 321.12, 199.17), -- Coords where the contract will spawn
                        ["PickupRotation"] = vector3(0.0, 0.0, 343.53), -- Rotation of the contract model

                        ["LitteredCoords"] = vector3(-764.00, 321.12, 199.17), -- Coords where the contract will spawn
                        ["LitteredRotation"] = vector3(0.0, 0.0, 343.53), -- Rotation of the contract model
                    },
                },
            }
        },
    }
}