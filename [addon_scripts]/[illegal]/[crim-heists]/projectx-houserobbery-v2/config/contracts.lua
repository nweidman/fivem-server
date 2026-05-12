Config.Contracts = {
    ["Enable"] = false, -- Enable/Disable Contracts system

    ["HideRewardsOnDialogs"] = false, -- If true, the rewards will be hidden on the contract dialogs

    ["RequiredItems"] = {
        ["Break Objects"] = "melee", -- (melee is for all melee weapons) Item required for breaking objects contracts, set it to false (RequiredItemForBreaking = false)
        ["Steal Objects"] = "bag", -- Item required for stealing objects contracts, set it to false (RequiredItemForStealing = false)
        ["Littering"] = false, -- Item required for littering contracts, set it to false (RequiredItemForLittering = false)
        ["TakingPictures"] = "phone", -- (x_burner is more immersive, for the messaging) Item required for taking pictures contracts, set it to false (RequiredItemForTakingPictures = false)
    },

    ["Peds"] = {
        {
            -- ["PedModel"] = "g_m_y_korean_01",
            -- ["Coords"] = vector4(1023.52, -1870.82, 30.89, 359.91),
            -- ["Scenario"] = "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT",
        },
        -- {
        --     ["PedModel"] = "g_m_y_korean_01",
        --     ["Coords"] = vector4(-22.72, -1250.14, 29.23, 359.6),
        --     ["Animation"] = {Dict = "anim@amb@casino@hangout@ped_male@stand@02b@idles", Anim = "idle_a"}
        -- },
    },
    ["DialogTexts"] = {
        ["InitialDialog"] = {
            ["Content"] = "I have some contracts, would you like to take a look? I will give u a reward for each one you complete.",
            ["Confirm"] = "Sure",
            ["Cancel"] = "No, thanks, I'll think about it"
        },
        ["AcceptingContracts"] = {
            ["Content"] = "Here are the available contracts:",
            ["Confirm"] = "Accept Contracts",
            ["Cancel"] = "Maybe later"
        },
        ["EndConversation"] = {
            ["Content"] = "Bring back the items I asked for, or take a picture (Breaking or Littering) with your burner phone, then come back for your reward.",
            ["Confirm"] = "Will do, Goodbye",
        },
    },
    ["PossibleContracts"] = {
        ["Steal Objects"] = { -- You can add more contracts of this type by following the same structure
            ["Briefcase"] = {
                ["Label"] = "Snatch the Briefcase",
                ["Description"] = "Sneak in and grab the briefcase",
                ["Icon"] = "fas fa-briefcase",

                ["Model"] = "prop_ld_case_01",

                ["Animation"] = {Dict = "random@domestic", Anim = "pickup_low"}, -- Animation played when breaking the object
                ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
                ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                    ["Model"] = "prop_ld_case_01", -- Prop to be attached to the player when breaking the object
                    ["Bone"] = 57005, -- Bone where the prop will be attached
                    ["Offset"] = vector3(0.1, 0.0, -0.03), -- Offset of the prop when attached
                    ["Rotation"] = vector3(-90.0, 0.0, 0.0), -- Rotation of the prop when attached
                },

                ["Reward"] = {
                    ["Exp"] = 20, -- Amount of XP given (If you use an XP system)
                    ["Type"] = "money", -- "item" or "money"
                    ["Item"] = "", -- No need to enter anything here if ["Type"] = "money"
                    ["Amount"] = {min = 275, max = 300},
                    ["MetaData"] = false, -- Set to true if you use black money with meta data (info when hovering over the item)
                }
            },
            ["Harddrive"] = {
                ["Label"] = "Retrieve the Harddrive",
                ["Description"] = "Steal the owner's harddrive",
                ["Icon"] = "fas fa-hard-drive",

                ["Model"] = "v_res_harddrive",

                ["Animation"] = {Dict = "anim@heists@ornate_bank@hack", Anim = "hack_loop"}, -- Animation played when breaking the object
                ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
                ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                    ["Model"] = "v_res_harddrive", -- Prop to be attached to the player when breaking the object
                    ["Bone"] = 57005, -- Bone where the prop will be attached
                    ["Offset"] = vector3(0.1, 0.0, -0.03), -- Offset of the prop when attached
                    ["Rotation"] = vector3(-90.0, 0.0, 0.0), -- Rotation of the prop when attached
                },

                ["Reward"] = {
                    ["Exp"] = 20, -- Amount of XP given (If you use an XP system)
                    ["Type"] = "money", -- "item" or "money"
                    ["Item"] = "", -- No need to enter anything here if ["Type"] = "money"
                    ["Amount"] = {min = 275, max = 300},
                    ["MetaData"] = false, -- Set to true if you use black money with meta data (info when hovering over the item)
                }
            },
        },
        ["Break Objects"] = { -- You can add more contracts of this type by following the same structure
            ["Laptop"] = {
                ["Label"] = "Smash the Laptop's Screen",
                ["Description"] = "Teach this overpriced laptop a lesson.",
                ["Icon"] = "fas fa-laptop",

                ["Model"] = "prop_laptop_lester",
                ["BrokenModel"] = "gr_prop_gr_laptop_01c",
                ["Sound"] = "electronics", -- Sound to play when breaking the object "glass", "electronics", "thud" -- Set to false for no sound

                ["Animation"] = {
                    ["Breaking"] = {
                        ["Animation"] = {Dict = "anim@melee@machete@streamed_core@", Anim = "plyr_walking_attack_a"}, -- Animation played when breaking the object
                        ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_laptop_lester", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 57005, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.1, 0.0, -0.03), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-90.0, 0.0, 0.0), -- Rotation of the prop when attached
                        -- },
                    },
                    ["TakingPicture"]  = {
                        ["Scenario"] = "WORLD_HUMAN_STAND_MOBILE",
                        ["DelayUntilCancelled"] = 4, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_ing_camera_01", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 60309, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.0980, 0.0560, 0.1330), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-15.8221, 107.0825, -16.0159), -- Rotation of the prop when attached
                        -- },
                    },
                },

                ["Reward"] = {
                    ["Exp"] = 20, -- Amount of XP given (If you use an XP system)
                    ["Type"] = "money", -- "item" or "money"
                    ["Item"] = "", -- No need to enter anything here if ["Type"] = "money"
                    ["Amount"] = {min = 275, max = 300},
                    ["MetaData"] = false, -- Set to true if you use black money with meta data (info when hovering over the item)
                }
            },
            ["Drone"] = {
                ["Label"] = "Smash the Drone",
                ["Description"] = "Break off the drone's wings",
                ["Icon"] = "fas fa-helicopter",

                ["Model"] = "ch_prop_casino_drone_02a",
                ["BrokenModel"] = "ch_prop_casino_drone_broken01a",
                ["Sound"] = "electronics", -- Sound to play when breaking the object "glass", "electronics", "thud" -- Set to false for no sound

                ["Animation"] = {
                    ["Breaking"] = {
                        ["Animation"] = {Dict = "anim@melee@machete@streamed_core@", Anim = "plyr_walking_attack_a"}, -- Animation played when breaking the object
                        ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_laptop_lester", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 57005, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.1, 0.0, -0.03), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-90.0, 0.0, 0.0), -- Rotation of the prop when attached
                        -- },
                    },
                    ["TakingPicture"]  = {
                        ["Scenario"] = "WORLD_HUMAN_STAND_MOBILE",
                        ["DelayUntilCancelled"] = 4, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_ing_camera_01", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 60309, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.0980, 0.0560, 0.1330), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-15.8221, 107.0825, -16.0159), -- Rotation of the prop when attached
                        -- },
                    },
                },

                ["Reward"] = {
                    ["Exp"] = 20, -- Amount of XP given (If you use an XP system)
                    ["Type"] = "money", -- "item" or "money"
                    ["Item"] = "", -- No need to enter anything here if ["Type"] = "money"
                    ["Amount"] = {min = 275, max = 300},
                    ["MetaData"] = false, -- Set to true if you use black money with meta data (info when hovering over the item)
                }
            },
            ["Tablet"] = {
                ["Label"] = "Shatter the Tablet",
                ["Description"] = "Destoy their precious iTablet Pro",
                ["Icon"] = "fas fa-tablet-screen-button",

                ["Model"] = "sf_prop_sf_tablet_01a",
                ["BrokenModel"] = "hei_prop_dlc_tablet",
                ["Sound"] = "electronics", -- Sound to play when breaking the object "glass", "electronics", "thud" -- Set to false for no sound

                ["Animation"] = {
                    ["Breaking"] = {
                        ["Animation"] = {Dict = "anim@melee@machete@streamed_core@", Anim = "plyr_walking_attack_a"}, -- Animation played when breaking the object
                        ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_laptop_lester", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 57005, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.1, 0.0, -0.03), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-90.0, 0.0, 0.0), -- Rotation of the prop when attached
                        -- },
                    },
                    ["TakingPicture"]  = {
                        ["Scenario"] = "WORLD_HUMAN_STAND_MOBILE",
                        ["DelayUntilCancelled"] = 4, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_ing_camera_01", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 60309, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.0980, 0.0560, 0.1330), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-15.8221, 107.0825, -16.0159), -- Rotation of the prop when attached
                        -- },
                    },
                },

                ["Reward"] = {
                    ["Exp"] = 20, -- Amount of XP given (If you use an XP system)
                    ["Type"] = "money", -- "item" or "money"
                    ["Item"] = "", -- No need to enter anything here if ["Type"] = "money"
                    ["Amount"] = {min = 275, max = 300},
                    ["MetaData"] = false, -- Set to true if you use black money with meta data (info when hovering over the item)
                }
            },
            ["Phone"] = {
                ["Label"] = "Smash their Phone",
                ["Description"] = "Disconnect them from brainrot",
                ["Icon"] = "fas fa-phone-flip",

                ["Model"] = "prop_npc_phone",
                ["BrokenModel"] = "sf_prop_sf_art_phone_01a",
                ["Sound"] = "electronics", -- Sound to play when breaking the object "glass", "electronics", "thud" -- Set to false for no sound

                ["Animation"] = {
                    ["Breaking"] = {
                        ["Animation"] = {Dict = "anim@melee@machete@streamed_core@", Anim = "plyr_walking_attack_a"}, -- Animation played when breaking the object
                        ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_laptop_lester", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 57005, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.1, 0.0, -0.03), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-90.0, 0.0, 0.0), -- Rotation of the prop when attached
                        -- },
                    },
                    ["TakingPicture"]  = {
                        ["Scenario"] = "WORLD_HUMAN_STAND_MOBILE",
                        ["DelayUntilCancelled"] = 4, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_ing_camera_01", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 60309, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.0980, 0.0560, 0.1330), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-15.8221, 107.0825, -16.0159), -- Rotation of the prop when attached
                        -- },
                    },
                },

                ["Reward"] = {
                    ["Exp"] = 20, -- Amount of XP given (If you use an XP system)
                    ["Type"] = "money", -- "item" or "money"
                    ["Item"] = "", -- No need to enter anything here if ["Type"] = "money"
                    ["Amount"] = {min = 275, max = 300},
                    ["MetaData"] = false, -- Set to true if you use black money with meta data (info when hovering over the item)
                }
            },
            ["TV"] = {
                ["Label"] = "Smash the TV",
                ["Description"] = "Make it seem as if their kid threw a controller on the TV",
                ["Icon"] = "fas fa-tv",

                ["Model"] = "prop_tv_stand_01",
                ["BrokenModel"] = "xm_prop_x17_tv_stand_01a",
                ["Sound"] = "electronics", -- Sound to play when breaking the object "glass", "electronics", "thud" -- Set to false for no sound

                ["Animation"] = {
                    ["Breaking"] = {
                        ["Animation"] = {Dict = "anim@melee@machete@streamed_core@", Anim = "plyr_walking_attack_a"}, -- Animation played when breaking the object
                        ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_laptop_lester", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 57005, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.1, 0.0, -0.03), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-90.0, 0.0, 0.0), -- Rotation of the prop when attached
                        -- },
                    },
                    ["TakingPicture"]  = {
                        ["Scenario"] = "WORLD_HUMAN_STAND_MOBILE",
                        ["DelayUntilCancelled"] = 4, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_ing_camera_01", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 60309, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.0980, 0.0560, 0.1330), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-15.8221, 107.0825, -16.0159), -- Rotation of the prop when attached
                        -- },
                    },
                },

                ["Reward"] = {
                    ["Exp"] = 20, -- Amount of XP given (If you use an XP system)
                    ["Type"] = "money", -- "item" or "money"
                    ["Item"] = "", -- No need to enter anything here if ["Type"] = "money"
                    ["Amount"] = {min = 275, max = 300},
                    ["MetaData"] = false, -- Set to true if you use black money with meta data (info when hovering over the item)
                }
            },
            ["Frame"] = {
                ["Label"] = "Smash the Picture Frame",
                ["Description"] = "Add a modern art touch to their picture frames.",
                ["Icon"] = "fas fa-tablet",

                ["Model"] = "v_ilev_trev_pictureframe",
                ["BrokenModel"] = "v_ilev_trev_pictureframebroken",
                ["Sound"] = "glass", -- Sound to play when breaking the object "glass", "electronics", "thud" -- Set to false for no sound

                ["Animation"] = {
                    ["Breaking"] = {
                        ["Animation"] = {Dict = "anim@melee@machete@streamed_core@", Anim = "plyr_walking_attack_a"}, -- Animation played when breaking the object
                        ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_laptop_lester", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 57005, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.1, 0.0, -0.03), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-90.0, 0.0, 0.0), -- Rotation of the prop when attached
                        -- },
                    },
                    ["TakingPicture"]  = {
                        ["Scenario"] = "WORLD_HUMAN_STAND_MOBILE",
                        ["DelayUntilCancelled"] = 4, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_ing_camera_01", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 60309, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.0980, 0.0560, 0.1330), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-15.8221, 107.0825, -16.0159), -- Rotation of the prop when attached
                        -- },
                    },
                },

                ["Reward"] = {
                    ["Exp"] = 20, -- Amount of XP given (If you use an XP system)
                    ["Type"] = "money", -- "item" or "money"
                    ["Item"] = "", -- No need to enter anything here if ["Type"] = "money"
                    ["Amount"] = {min = 275, max = 300},
                    ["MetaData"] = false, -- Set to true if you use black money with meta data (info when hovering over the item)
                }
            },
            ["Statue"] = {
                ["Label"] = "Break the Statue",
                ["Description"] = "Leave the statue headless",
                ["Icon"] = "fas fa-user",

                ["Model"] = "hei_prop_drug_statue_01",
                ["BrokenModel"] = "hei_prop_drug_statue_base_01",
                ["Sound"] = "glass", -- Sound to play when breaking the object "glass", "electronics", "thud" -- Set to false for no sound

                ["Animation"] = {
                    ["Breaking"] = {
                        ["Animation"] = {Dict = "anim@melee@machete@streamed_core@", Anim = "plyr_walking_attack_a"}, -- Animation played when breaking the object
                        ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_laptop_lester", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 57005, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.1, 0.0, -0.03), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-90.0, 0.0, 0.0), -- Rotation of the prop when attached
                        -- },
                    },
                    ["TakingPicture"]  = {
                        ["Scenario"] = "WORLD_HUMAN_STAND_MOBILE",
                        ["DelayUntilCancelled"] = 4, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_ing_camera_01", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 60309, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.0980, 0.0560, 0.1330), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-15.8221, 107.0825, -16.0159), -- Rotation of the prop when attached
                        -- },
                    },
                },

                ["Reward"] = {
                    ["Exp"] = 20, -- Amount of XP given (If you use an XP system)
                    ["Type"] = "money", -- "item" or "money"
                    ["Item"] = "", -- No need to enter anything here if ["Type"] = "money"
                    ["Amount"] = {min = 275, max = 300},
                    ["MetaData"] = false, -- Set to true if you use black money with meta data (info when hovering over the item)
                }
            },
        },
        ["Littering"] = { -- You can add more contracts of this type by following the same structure
            ["Cans"] = {
                ["Label"] = "Scatter cans",
                ["Description"] = "Scatter cans around like you own the place.",
                ["Icon"] = "fas fa-trash-can",

                ["Model"] = "v_ret_247_popcan2", -- Model to use for the initial item
                ["LitteredModel"] = "prop_rub_litter_01", -- Item to scatter
                ["Sound"] = "trash", -- Sound to play when littering "poop", "spill", "trash" -- Set to false for no sound

                ["Animation"] = {
                    ["Pickup"] = {
                        ["Animation"] = {Dict = "anim@melee@machete@streamed_core@", Anim = "plyr_walking_attack_a"}, -- Animation played when breaking the object
                        ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_laptop_lester", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 57005, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.1, 0.0, -0.03), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-90.0, 0.0, 0.0), -- Rotation of the prop when attached
                        -- },
                    },
                    ["Litter"] = {
                        ["Animation"] = {Dict = "anim@melee@machete@streamed_core@", Anim = "plyr_walking_attack_a"}, -- Animation played when breaking the object
                        ["DelayUntilCancelled"] = 3, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_laptop_lester", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 57005, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.1, 0.0, -0.03), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-90.0, 0.0, 0.0), -- Rotation of the prop when attached
                        -- },
                    },
                    ["TakingPicture"]  = {
                        ["Scenario"] = "WORLD_HUMAN_STAND_MOBILE",
                        ["DelayUntilCancelled"] = 4, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_ing_camera_01", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 60309, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.0980, 0.0560, 0.1330), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-15.8221, 107.0825, -16.0159), -- Rotation of the prop when attached
                        -- },
                    },
                },


                ["Reward"] = {
                    ["Exp"] = 15, -- Amount of XP given (If you use an XP system)
                    ["Type"] = "money", -- "item" or "money"
                    ["Item"] = "", -- No need to enter anything here if ["Type"] = "money"
                    ["Amount"] = {min = 200, max = 250},
                    ["MetaData"] = false, -- Set to true if you use black money with meta data (info when hovering over the item)
                }
            },
            ["Trashcan"] = {
                ["Label"] = "Kick the trashcan over",
                ["Description"] = "Flip the trashcan on the floor.",
                ["Icon"] = "fas fa-trash-can",

                ["Model"] = "prop_cs_bin_02", -- Model to use for the initial item
                ["LitteredModel"] = "prop_rub_litter_03", -- Item to scatter
                ["Sound"] = "trash", -- Sound to play when littering "poop", "spill", "trash" -- Set to false for no sound

                ["Animation"] = {
                    ["Pickup"] = {
                        ["Animation"] = {Dict = "anim@melee@machete@streamed_core@", Anim = "plyr_walking_attack_a"}, -- Animation played when breaking the object
                        ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_laptop_lester", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 57005, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.1, 0.0, -0.03), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-90.0, 0.0, 0.0), -- Rotation of the prop when attached
                        -- },
                    },
                    ["Litter"] = {
                        ["Animation"] = {Dict = "anim@melee@machete@streamed_core@", Anim = "plyr_walking_attack_a"}, -- Animation played when breaking the object
                        ["DelayUntilCancelled"] = 3, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_laptop_lester", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 57005, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.1, 0.0, -0.03), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-90.0, 0.0, 0.0), -- Rotation of the prop when attached
                        -- },
                    },
                    ["TakingPicture"]  = {
                        ["Scenario"] = "WORLD_HUMAN_STAND_MOBILE",
                        ["DelayUntilCancelled"] = 4, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_ing_camera_01", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 60309, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.0980, 0.0560, 0.1330), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-15.8221, 107.0825, -16.0159), -- Rotation of the prop when attached
                        -- },
                    },
                },

                ["Reward"] = {
                    ["Exp"] = 15, -- Amount of XP given (If you use an XP system)
                    ["Type"] = "money", -- "item" or "money"
                    ["Item"] = "", -- No need to enter anything here if ["Type"] = "money"
                    ["Amount"] = {min = 200, max = 250},
                    ["MetaData"] = false, -- Set to true if you use black money with meta data (info when hovering over the item)
                }
            },
            ["Stain"] = {
                ["Label"] = "Stain the floor",
                ["Description"] = "Paint the Floor with some spilled drink",
                ["Icon"] = "fas fa-wine-bottle",

                ["Model"] = "p_whiskey_bottle_s", -- Model to use for the initial item
                ["LitteredModel"] = "p_oil_slick_01", -- Item to scatter
                ["Sound"] = "spill", -- Sound to play when littering "poop", "spill", "trash" -- Set to false for no sound

                ["Animation"] = {
                    ["Pickup"] = {
                        ["Animation"] = {Dict = "mp_common", Anim = "givetake1_b"}, -- Animation played when breaking the object
                        ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                            ["Model"] = "p_whiskey_bottle_s", -- Prop to be attached to the player when breaking the object
                            ["Bone"] = 57005, -- Bone where the prop will be attached
                            ["Offset"] = vector3(0.1, 0.0, -0.03), -- Offset of the prop when attached
                            ["Rotation"] = vector3(-90.0, 0.0, 0.0), -- Rotation of the prop when attached
                        },
                    },
                    ["Litter"] = {
                        ["Animation"] = {Dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", Anim = "machinic_loop_mechandplayer"}, -- Animation played when breaking the object
                        ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                            ["Model"] = "p_whiskey_bottle_s", -- Prop to be attached to the player when breaking the object
                            ["Bone"] = 57005, -- Bone where the prop will be attached
                            ["Offset"] = vector3(0.15, 0.1, 0.0), -- Offset of the prop when attached
                            ["Rotation"] = vector3(60.0, 25.0, 180.0), -- Rotation of the prop when attached
                        },
                    },
                    ["TakingPicture"]  = {
                        ["Scenario"] = "WORLD_HUMAN_STAND_MOBILE",
                        ["DelayUntilCancelled"] = 4, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_ing_camera_01", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 60309, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.0980, 0.0560, 0.1330), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-15.8221, 107.0825, -16.0159), -- Rotation of the prop when attached
                        -- },
                    },
                },

                ["Reward"] = {
                    ["Exp"] = 15, -- Amount of XP given (If you use an XP system)
                    ["Type"] = "money", -- "item" or "money"
                    ["Item"] = "", -- No need to enter anything here if ["Type"] = "money"
                    ["Amount"] = {min = 200, max = 250},
                    ["MetaData"] = false, -- Set to true if you use black money with meta data (info when hovering over the item)
                }
            },
            ["Poop"] = {
                ["Label"] = "Leave a “Smelly Surprise” on the Bed",
                ["Description"] = "Decorate the bed with a little personal touch.",
                ["Icon"] = "fas fa-poo",

                ["Model"] = "ng_proc_coffee_01a", -- Model to use for the initial item
                ["LitteredModel"] = "prop_big_shit_01", -- Item to scatter
                ["Sound"] = "poop", -- Sound to play when littering "poop", "spill", "trash" -- Set to false for no sound

                ["Animation"] = {

                    ["Pickup"] = {
                        ["Animation"] = {Dict = "mp_player_intdrink", Anim = "loop_bottle"}, -- Animation played when breaking the object
                        ["DelayUntilCancelled"] = 1, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                            ["Model"] = "ng_proc_coffee_01a", -- Prop to be attached to the player when breaking the object
                            ["Bone"] = 18905, -- Bone where the prop will be attached
                            ["Offset"] = vector3(0.12, 0.008, 0.03), -- Offset of the prop when attached
                            ["Rotation"] = vector3(240.0, -60.0, 0.0), -- Rotation of the prop when attached
                        },
                    },
                    ["Litter"] = {
                        ["Animation"] = {Dict = "missfbi3ig_0", Anim = "shit_loop_trev"}, -- Animation played when breaking the object
                        ["DelayUntilCancelled"] = 3, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_laptop_lester", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 57005, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.1, 0.0, -0.03), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-90.0, 0.0, 0.0), -- Rotation of the prop when attached
                        -- },
                    },
                    ["TakingPicture"]  = {
                        ["Scenario"] = "WORLD_HUMAN_STAND_MOBILE",
                        ["DelayUntilCancelled"] = 4, -- (Seconds) Delay until the animation gets cancelled
                        ["TurnToFaceProp"] = false, -- Makes the ped turn to face the prop
                        -- ["AnimationProp"] = { -- Remove this whole table if you dont want to use a prop
                        --     ["Model"] = "prop_ing_camera_01", -- Prop to be attached to the player when breaking the object
                        --     ["Bone"] = 60309, -- Bone where the prop will be attached
                        --     ["Offset"] = vector3(0.0980, 0.0560, 0.1330), -- Offset of the prop when attached
                        --     ["Rotation"] = vector3(-15.8221, 107.0825, -16.0159), -- Rotation of the prop when attached
                        -- },
                    },
                },

                ["Reward"] = {
                    ["Exp"] = 15, -- Amount of XP given (If you use an XP system)
                    ["Type"] = "money", -- "item" or "money"
                    ["Item"] = "", -- No need to enter anything here if ["Type"] = "money"
                    ["Amount"] = {min = 200, max = 250},
                    ["MetaData"] = false, -- Set to true if you use black money with meta data (info when hovering over the item)
                }
            },
        }
    }
}