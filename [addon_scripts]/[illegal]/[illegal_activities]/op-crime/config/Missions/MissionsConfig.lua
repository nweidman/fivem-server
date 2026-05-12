-- ⚠️ Each mission must be configured using the structure below! ⚠️

--- @param type: car / weapon / money / black_money / item
--- Description:
---   - "car" → Must be a vehicle available in the Vehicle Store. Otherwise, it will not appear.
---   - To assign a vehicle as a mission reward, enable "vehicle visibility" from the Admin Panel
---     and provide the model name using:
---       @param ModelName

-- 💡 Mission-related functions are located in:
--    config/Missions/MissionsFunctions.lua

Config.DisableMissions = false -- Disable / Enable missions tab from crime tablet

Config.Missions = {
    -- Note: Metadata currently work only for ox_inventory. If you want to make metadata compatible with your inventory script:
    -- Files that need to be edited: `integrations/server/inventory/` and one of `framework/server` function Fr.AddItem
    
    ["find_vehicle"] = {
        UI = {
            levelRequired = 1,
            missionLabel = "Find a Vehicle on the Street",
            missionDescription = "Find the vehicle model we send you and bring it back without damaging it.",
            missionExp = 150,
            missionReward = {
                {
                    label = "Heavy Armor x5",
                    nameSpawn = "heavyarmor",
                    amount = 5,
                    img = "https://data.otherplanet.dev/fivemicons/%5bpd%5d/armor.png",
                    rare = "purple",
                    type = "item",
                },
            }
        },
        OnMissionStart = function()
            startFindVehicleMission()
        end,
    },
    -- ["laundry_100k"] = {
    --     UI = {
    --         levelRequired = 1,
    --         missionLabel = "Money Laundering",
    --         missionDescription = "Launder $100,000 of dirty money at a laundering point. Your gang must unlock the laundering upgrade.",
    --         missionExp = 250,
    --         missionReward = {
    --             {
    --                 label = "1x Pistol SNS",
    --                 nameSpawn = "weapon_snspistol",
    --                 amount = 1,
    --                 img = "https://data.otherplanet.dev/fivemicons/%5bweapons%5d/weapon_vintagepistol.png",
    --                 rare = "purple",
    --                 type = "item"
    --             }
    --         }
    --     },
    --     OnMissionStart = function()
    --         startLaundryMission()
    --     end,
    -- },
    ["capture_1Zone"] = {
        UI = {
            levelRequired = 1,
            missionLabel = "Capture at Least 1 Zone",
            missionDescription = "Capture at least one zone to claim extra rewards and EXP for your gang.",
            missionExp = 150,
            missionReward = {
                {
                    label = "15 000$",
                    nameSpawn = "",
                    amount = 15000,
                    img = "https://cdn-icons-png.flaticon.com/512/7630/7630510.png",
                    rare = "blue",
                    type = "money"
                }
            }
        },
        OnMissionStart = function()
            startZoneCaptureMission()
        end,
    },
    ["spray_graffiti"] = {
        UI = {
            levelRequired = 1,
            missionLabel = "Graffiti Mission",
            missionDescription = "Spray at least 3 graffiti in assigned turf zones.",
            missionExp = 100,
            missionReward = {
                {
                    label = "15 000$",
                    nameSpawn = "",
                    amount = 15000,
                    img = "https://cdn-icons-png.flaticon.com/512/7630/7630510.png",
                    rare = "blue",
                    type = "money"
                }
            }
        },
        OnMissionStart = function()
            startSprayGraffitiMission()
        end,
    },
    ["remove_graffiti"] = {
        UI = {
            levelRequired = 1,
            missionLabel = "Graffiti Removal Mission",
            missionDescription = "Remove at least 5 enemy gang graffiti in assigned turf zones.",
            missionExp = 100,
            missionReward = {
                {
                    label = "15 000$",
                    nameSpawn = "",
                    amount = 15000,
                    img = "https://cdn-icons-png.flaticon.com/512/7630/7630510.png",
                    rare = "blue",
                    type = "money"
                }
            }
        },
        OnMissionStart = function()
            startRemoveGraffitiMission()
        end,
    },
    ["sell_drugs"] = {
        UI = {
            levelRequired = 1,
            missionLabel = "Sell Drugs",
            missionDescription = "Sell any drug to 50 people inside of a turf zone.",
            missionExp = 150,
            missionReward = {
                {
                    label = "20 000$",
                    nameSpawn = "",
                    amount = 20000,
                    img = "https://cdn-icons-png.flaticon.com/512/7630/7630510.png",
                    rare = "blue",
                    type = "money"
                }
            }
        },
        OnMissionStart = function()
            startSellingDrugsMission()
        end,
    },
    ["steal_van"] = {
        UI = {
            levelRequired = 1,
            missionLabel = "Steal Drug Van",
            missionDescription = "Steal a drug van from an armed gang and deliver it safely.",
            missionExp = 250,
            missionReward = {
                {
                    label = "Parts Mystery Box 3x",
                    nameSpawn = "partsmysterybox",
                    amount = 3,
                    img = "https://data.otherplanet.dev/fivemicons/%5bweapons%5d/weapon_vector.png",
                    rare = "red",
                    type = "item"
                }
            }
        },
        OnMissionStart = function()
            deliverVanMission()
        end,
    },
    -- ["armored_truck_heist"] = {
    --     UI = {
    --         levelRequired = 1,
    --         missionLabel = "Armored Truck Heist",
    --         missionDescription = "Phase 1: steal the stockade. Phase 2: open the rear door in a safe area. Phase 3: deliver the cargo.",
    --         missionExp = 200,
    --         missionReward = {
    --             {
    --                 label = "30 000$",
    --                 nameSpawn = "",
    --                 amount = 30000,
    --                 img = "https://cdn-icons-png.flaticon.com/512/7630/7630510.png",
    --                 rare = "purple",
    --                 type = "money"
    --             }
    --         }
    --     },
    --     OnMissionStart = function()
    --         startArmoredTruckHeistMission()
    --     end,
    -- },
    -- ["intercept_convoy"] = {
    --     UI = {
    --         levelRequired = 1,
    --         missionLabel = "Intercept NPC Convoy",
    --         missionDescription = "Intercept an armed convoy, steal the target van, and deliver it to the marked point.",
    --         missionExp = 200,
    --         missionReward = {
    --             {
    --                 label = "1x Pistol",
    --                 nameSpawn = "weapon_pistol",
    --                 amount = 1,
    --                 img = "https://data.otherplanet.dev/fivemicons/%5bweapons%5d/weapon_pistol.png",
    --                 rare = "purple",
    --                 type = "item"
    --             },
    --             {
    --                 label = "5 000$",
    --                 nameSpawn = "",
    --                 amount = 5000,
    --                 img = "https://cdn-icons-png.flaticon.com/512/7630/7630510.png",
    --                 rare = "purple",
    --                 type = "money"
    --             }
    --         }
    --     },
    --     OnMissionStart = function()
    --         startConvoyInterceptMission()
    --     end,
    -- },
    -- ["coast_air_contraband"] = {
    --     UI = {
    --         levelRequired = 1,
    --         missionLabel = "Coast/Air Contraband",
    --         missionDescription = "Pick up the package on the coast and deliver it inland with no active wanted level.",
    --         missionExp = 200,
    --         missionReward = {
    --             {
    --                 label = "10 000$",
    --                 nameSpawn = "",
    --                 amount = 10000,
    --                 img = "https://cdn-icons-png.flaticon.com/512/7630/7630510.png",
    --                 rare = "blue",
    --                 type = "money"
    --             }
    --         }
    --     },
    --     OnMissionStart = function()
    --         startCoastAirContrabandMission()
    --     end,
    -- },
    -- ["drug_sell_npc"] = {
    --     UI = {
    --         levelRequired = 1,
    --         missionLabel = "Drug Delivery",
    --         missionDescription = "Deliver 50 bags of drugs to the marked location.",
    --         missionExp = 150,
    --         missionReward = {
    --             {
    --                 label = "5 000$",
    --                 nameSpawn = "",
    --                 amount = 5000,
    --                 img = "https://cdn-icons-png.flaticon.com/512/7630/7630510.png",
    --                 rare = "purple",
    --                 type = "money"
    --             }
    --         }
    --     },
    --     ItemName = "bagofweed", -- Item name to sell to ped. THIS SHIT IS NOT USED LOOK AT drug_sell_npc.lua INSTEAD
    --     OnMissionStart = function()
    --         startWeedDelivey()
    --     end,
    -- },
    -- ["mobile_lab_assault"] = {
    --     UI = {
    --         levelRequired = 1,
    --         missionLabel = "Mobile Lab Assault",
    --         missionDescription = "Intercept a mobile lab, survive armed pursuit, and deliver it to a safe zone.",
    --         missionExp = 200,
    --         missionReward = {
    --             {
    --                 label = "15 000$",
    --                 nameSpawn = "",
    --                 amount = 15000,
    --                 img = "https://cdn-icons-png.flaticon.com/512/7630/7630510.png",
    --                 rare = "purple",
    --                 type = "money"
    --             }
    --         }
    --     },
    --     OnMissionStart = function()
    --         startMobileLabAssaultMission()
    --     end,
    -- },
    ["recover_stash_raid"] = {
        UI = {
            levelRequired = 1,
            missionLabel = "Recover Stash After Raid",
            missionDescription = "Recover a stash seized in a raid and deliver it before you lose it.",
            missionExp = 200,
            missionReward = {
                {
                    label = "10 000$",
                    nameSpawn = "",
                    amount = 10000,
                    img = "https://cdn-icons-png.flaticon.com/512/7630/7630510.png",
                    rare = "blue",
                    type = "money"
                }
            }
        },
        OnMissionStart = function()
            startRecoverStashAfterRaidMission()
        end,
    },
    ["multi_checkpoint_delivery"] = {
        UI = {
            levelRequired = 1,
            missionLabel = "Multi Delivery x3",
            missionDescription = "Complete 3 checkpoints with the cargo before time runs out.",
            missionExp = 300,
            missionReward = {
                {
                    label = "15 000$",
                    nameSpawn = "",
                    amount = 15000,
                    img = "https://cdn-icons-png.flaticon.com/512/7630/7630510.png",
                    rare = "purple",
                    type = "money"
                }
            }
        },
        OnMissionStart = function()
            startMultiCheckpointDeliveryMission()
        end,
    },

    --[[ 

    -------------------------------------------------
    -- ONLY FOR VEHICLE THEFT SCRIPT ----------------
    -- https://www.otherplanet.dev/product/6503031 --
    -------------------------------------------------

    ["vehicleTheft"] = {
        UI = {
            levelRequired = 1,
            missionLabel = "Complete Vehicle Theft Hacking",
            missionDescription = "Start and complete vehicle theft hacking proccess.",
            missionExp = 350,
            missionReward = {
                {
                    label = "50 000$",
                    nameSpawn = "",
                    amount = 15,
                    img = "https://cdn-icons-png.flaticon.com/512/7630/7630510.png",
                    rare = "blue",
                    type = "money"
                }
            }
        },
        OnMissionStart = function()
            startVehicleTheftMission()
        end,
    },]]--
}