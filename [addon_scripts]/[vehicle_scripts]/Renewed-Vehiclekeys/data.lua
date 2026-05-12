return {
    lockChance = 0.8, -- (50%) Chance of local vehicles to be locked around the world
    lockChanceAI = 0.8, -- (50%) Chance of AI vehicles to be locked around the world

    useWeaponRobbery = true, -- Be able to rob driving peds for their vehicle keys

    useKeybindKey = true, -- Weather or not to use the build in keybind system
    useHotwireSystem = true, -- Weather or not to use the hotwire system

    vehicleAutoStart = true, -- if a player have the keys to a car should it auto start when they enter the vehicles

    useKeyItem = false, -- set to true if you want to use a item based key system

    engineKey = 'G', -- Key to toggle the engine on and off
    lockKey = 'L', -- Key to toggle the lock on and off

    circleProgress = true, -- Uses the circle progress bar instead of the default one from ox_lib

    immune = {
        [`bmx`] = true,
        ['cruiser'] = true,
        ['fixter'] = true,
        ['scorcher'] = true,
        ['tribike'] = true,
        ['tribike2'] = true,
        ['tribike3'] = true,
        ['iak_wheelchair'] = true,

    },

    -- Specific Doors that are ALWAYS locked no matter what
    doorsBlocked = {
        [`stockade`] = {[1] = true, [2] = true}
    },

    searchPercent = 0.00, -- 3% chance of getting a item from searching a vehicle
    rewards = {
        { name = 'money', amount = 20, },
        { name = 'key' } -- we don't need to specify amount here as it will just give u 1 or if not using items give u the key
    },

    -- Minigame settings

    -- Whichs possible keys can show up when they lockpick / hotwire the vehicle
    keys = {'1', '2', '3', '4'},

    difficulties = {
        slow = { time = {min = 75, max = 150}, turns = {min = 3, max = 5} },
        medium = { time = {min = 50, max = 100}, turns = {min = 2, max = 4} },
        fast = { time = {min = 25, max = 50}, turns = {min = 1, max = 2} }
    },

    Locations = {
        ["NoDispatchZones"] = {
            [1] = {label = "Var", coords = vector3(2171.4573, 2920.8975, -81.0776), length = 100.0, width = 100.0, heading = 70, minZ = -90.8, maxZ = -70.8},
            [2] = {label = "Cayo", coords = vector3(4724.05, -5087.58, 49.32), length = 2000.0, width = 2200.0, heading = 70, minZ = -20.8, maxZ = 200.8},
            --[2] = {label = "Paintball", coords = vector3(2797.2012, -3799.9456, 140.0590), length = 600.0, width = 600.0, heading = 270, minZ = 50.62, maxZ = 300.62},
            [3] = {label = "Oil", coords = vector3(-2730.14, 6598.66, 26.12), length = 600.0, width = 600.0, heading = 270, minZ = 0.62, maxZ = 100.62},
        }
    },

    -- Vehicle Config
    vehicles = {
        -- Compacts --
        [0] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },


        -- Sedans --
        [1] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },


        -- SUVS --
        [2] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },


        -- COUPES --
        [3] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },


        -- MUSCLES --
        [4] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },

        -- SPORT CLASSICS --
        [5] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },

        -- Sports --
        [6] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },

        -- SUPERS --
        [7] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },

        -- MOTORCYCLES --
        [8] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
            noLocks = false, -- This vehicle cannot be locked!
        },

        -- OFF-ROAD --
        [9] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },


        -- Industrial --
        [10] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },

        -- Utility --
        [11] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },

        -- Vans --
        [12] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },

        -- Cycles --
        [13] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
            noLocks = true, -- This vehicle cannot be locked!
        },

        -- Boats --
        [14] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },

        -- Helicopters --
        [15] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },


        -- Planes --
        [16] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },

        -- Service --
        [17] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },

        -- Emergency --
        [18] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = false, -- Can this vehicle be hotwired?
            search = false, -- Can this vehicle be searched?
        },

        -- Military --
        [19] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },

        -- Commercial --
        [20] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },

        -- Trains --
        [21] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },

        -- Open Wheel --
        [22] = {
            pickable = true, -- Can this vehicle be lock picked?
            pickItem = {  -- What item is required to lock pick this vehicle?
                lockpick = {
                    difficulty = 'slow',
                    degrade = {min = 0, max = 0}
                },

                advancedlockpick = {
                    difficulty = 'medium',
                    degrade = {min = 0, max = 0}
                }
            },
            hotwire = 'slow', -- The difficulty of hotwiring this vehicle, false if it cannot be hotwired
            search = false, -- Time it takes to search this vehicle, if false it cannot be searched
        },
    },


    -- List of all the weapons that peds do not become scared of when you aim at them
    blockedWeapons = {
        [`WEAPON_UNARMED`] = true,
        [`WEAPON_KNIFE`] = true,
        [`WEAPON_NIGHTSTICK`] = true,
        [`WEAPON_HAMMER`] = true,
        [`WEAPON_BAT`] = true,
        [`WEAPON_CROWBAR`] = true,
        [`WEAPON_GOLFCLUB`] = true,
        [`WEAPON_BOTTLE`] = true,
        [`WEAPON_DAGGER`] = true,
        [`WEAPON_HATCHET`] = true,
        [`WEAPON_MACHETE`] = true,
        [`WEAPON_FLASHLIGHT`] = true,
        [`WEAPON_SWITCHBLADE`] = true,
        [`WEAPON_POOLCUE`] = true,
        [`WEAPON_WRENCH`] = true,
        [`WEAPON_BATTLEAXE`] = true,
        [`WEAPON_GRENADE`] = true,
        [`WEAPON_STICKYBOMB`] = true,
        [`WEAPON_BZGAS`] = true,
        [`WEAPON_MOLOTOV`] = true,
        [`WEAPON_FIREEXTINGUISHER`] = true,
        [`WEAPON_PETROLCAN`] = true,
        [`WEAPON_FLARE`] = true,
        [`WEAPON_BALL`] = true,
        [`WEAPON_SNOWBALL`] = true,
        [`WEAPON_SMOKEGRENADE`] = true,
        [`WEAPON_ZKKNIFE`] = true,
        [`WEAPON_TARANTULA`] = true,
        [`WEAPON_PDBATON`] = true,
        [`WEAPON_CANDYAXE`] = true,
        [`WEAPON_SLEDGEHAMMER`] = true,
        [`WEAPON_GLOW_BAT`] = true,
        [`WEAPON_VALSPIKEDBAT`] = true,
        [`WEAPON_KATANA`] = true,
        [`WEAPON_KATANA2`] = true,
        [`WEAPON_KATANA3`] = true,
        [`WEAPON_KATANA4`] = true,
        [`WEAPON_NERFSNIPER`] = true,
        [`WEAPON_NERFRIFLE`] = true,
        [`WEAPON_HUNTINGRIFLE`] = true,
        [`WEAPON_BLOWUP_HAMMER`] = true,
        [`WEAPON_POOLNOODLE`] = true,
        [`WEAPON_EASTERKATANA`] = true,
        [`WEAPON_STICKEGG`] = true,
        [`WEAPON_EASTERSIGN`] = true,
    }
}