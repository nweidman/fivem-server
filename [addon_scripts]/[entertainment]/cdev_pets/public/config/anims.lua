clib = exports.cdev_lib:Get()
loc = clib.localizer.get

DogAnims = {
    ["BigDog"] = {
        -- General
        PlayerCallPetLeftAnim = { "missfra0_chop_find", "call_chop_l" },
        PlayerCallPetRightAnim = { "missfra0_chop_find", "call_chop_r" },

        -- Bed
        PlayerPickupBed = { "pickup_object", "pickup_low" },
        PetSleepBedAnim = { "creatures@rottweiler@amb@sleep_in_kennel@", "sleep_in_kennel" },
        PetLeaveBedAnim = { "creatures@rottweiler@amb@sleep_in_kennel@", "exit_kennel" },

        -- Drink
        PlayerPickupBowl = { "pickup_object", "pickup_low" },
        PetDrinkingAnim = { "amb@lo_res_idles@", "creatures_world_deer_grazing_lo_res_base" },

        -- Eat
        PetBegAnim = { "creatures@rottweiler@tricks@", "beg_enter" },
        PetBegLoopAnim = { "creatures@rottweiler@tricks@", "beg_loop" },
        PetBegExitAnim = { "creatures@rottweiler@tricks@", "beg_exit" },
        PettingPlayerAnim = { "creatures@rottweiler@tricks@", "petting_franklin" },
        PetMoveAnim = { "creatures@rottweiler@move", "walk_start_180_r" },

        -- Sit
        PetSitAnim = { "creatures@rottweiler@tricks@", "sit_loop" },
        BackSitCarOffset = { x = 0.0, y = -0.25, z = 0.45 },
        FrontSitCarOffset = { x = 0.0, y = 0.0, z = 0.45 },

        -- Cuddle
        PlayerCuddleAnim = { "creatures@rottweiler@tricks@", "petting_franklin" },
        PetCuddleAnim = { "creatures@rottweiler@tricks@", "petting_chop" },

        -- Throw Ball
        PetThrowBallPickup = { "creatures@rottweiler@move", "fetch_pickup" },
        PetThrowBallDrop = { "creatures@rottweiler@move", "fetch_drop" },

        -- Bag
        PetBagStance = { "cdev@bigdogbag", "bag_clip" },

        -- Vocalization (animation + sounds per category).
        VocalizeAnim = { "creatures@rottweiler@amb@world_dog_barking@idle_a", "idle_a" },
        Vocalization = {
            animalType = 3,
            bark = "bark",
            bark_seq = "bark_seq",
            whine = "whine",
            growl = "growl",
            agitated = "agitated",
            sniff = "chop_sniff_seq",
            vocalizeLabelKey = "pet_bark",
        },

        Poses = {
            SitGround = {
                label = loc("bigdoggroundsit"),
                icon = "BIGSITGROUND",
                dog = { "gnddogposehuman01@animations", "gnddogposehuman01_clip" },
                player = { "gndhumanposedog01@animations", "gndhumanposedog01_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = -1,
                    offsetX = -0.6,
                    offsetY = 0.1,
                    offsetZ = -0.85,
                    rotationX = 70.07,
                    rotationY = -149.47,
                    rotationZ = 11.82
                }
            },

            OnKnee = {
                label = loc("bigdogonknee"),
                icon = "BIGONKNEE",
                dog = { "gnddogposehuman02@animations", "gnddogposehuman02_clip" },
                player = { "gndhumanposedog02@animations", "gndhumanposedog02_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = 0,
                    offsetX = -0.09,
                    offsetY = 0.51,
                    offsetZ = -0.62,
                    rotationX = -130.65,
                    rotationY = -7.71,
                    rotationZ = -120.06,
                }
            },

            Sitgroundlay = {
                label = loc("bigdogsitgroundlay"),
                icon = "BIGSITGROUNDDLAY",
                dog = { "gndcarinhocachorrodeitado@animations", "gndcarinhocachorrodeitado_clip" },
                player = { "gndcarinhohumamcachorrodeitado@animations", "gndcarinhohumamcachorrodeitado_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = 0,
                    offsetX = -0.09,
                    offsetY = 0.49,
                    offsetZ = 0.4,
                    rotationX = -14.36,
                    rotationY = 32.98,
                    rotationZ = 55.66,
                }
            },

            LayGround = {
                label = loc("bigdoglay"),
                icon = "LAYGROUNDBIG",
                player = { "gndhumansleepdog@animations", "gndhumansleepdog_clip" },
                dog = { "gnddogsleep@animations", "gnddogsleep_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = 0,
                    offsetX = -0.1,
                    offsetY = -0.25,
                    offsetZ = 0.0,
                    rotationX = 0.0,
                    rotationY = -80.98,
                    rotationZ = 80.49,
                }
            },

            HoldAir = {
                label = loc("bigdogholdair"),
                icon = "BIGHOLDAIR",
                player = { "gndhumancarrydog@animations", "gndhumancarrydog_clip" },
                dog = { "gnddogcarry@animations", "gnddogcarry_clip" },
                config = {
                    freeze = false,
                    blockWeaponUsage = true,
                    offsetX = 0.01,
                    offsetY = 0.54,
                    offsetZ = 0.49,
                    rotationX = 0.0,
                    rotationY = 0.0,
                    rotationZ = -84.63,
                    flag = 49,
                    bone = 24816,
                }
            }
        }

    },
    ['SmallDog'] = {
        -- General
        PlayerCallPetLeftAnim = { "missfra0_chop_find", "call_chop_l" },
        PlayerCallPetRightAnim = { "missfra0_chop_find", "call_chop_r" },

        -- Bed
        PlayerPickupBed = { "pickup_object", "pickup_low" },
        PetSleepBedAnim = { "ped@cdev", "sleep_in_kennel_clip" },
        PetLeaveBedAnim = { "ped@cdev", "exit_kennel_clip" },

        -- Drink
        PlayerPickupBowl = { "pickup_object", "pickup_low" },
        PetDrinkingAnim = { "ped@cdev", "eat_clip" },

        -- Eat
        PetBegAnim = { "ped@cdev", "beg_clip" },
        PetBegLoopAnim = { "ped@cdev", "beg_clip" },
        PetBegExitAnim = { "ped@cdev", "beg_clip" },
        PettingPlayerAnim = { "creatures@rottweiler@tricks@", "petting_franklin" },
        --PetMoveAnim = {"creatures@rottweiler@move", "walk_start_180_r"},

        -- Sit
        PetSitAnim = { "ped@cdev", "sit_clip" },
        BackSitCarOffset = { x = 0.0, y = 0.0, z = 0.3 },
        FrontSitCarOffset = { x = 0.0, y = 0.0, z = 0.3 },

        -- Cuddle
        PlayerCuddleAnim = { "creatures@rottweiler@tricks@", "petting_franklin" },
        PetCuddleAnim = { "ped@cdev", "beg_clip" },

        -- Throw Ball
        PetThrowBallPickup = { "ped@cdev", "fetch1_clip" },
        PetThrowBallDrop = { "ped@cdev", "fetch2_clip" },

        -- Bag
        PetBagStance = { "cdev@frbullbag", "bag_clip" },

        VocalizeAnim = { "creatures@rottweiler@amb@world_dog_barking@idle_a", "idle_a" },
        Vocalization = {
            animalType = 3,
            bark = "bark",
            bark_seq = "bark_seq",
            whine = "whine",
            growl = "growl",
            agitated = "agitated",
            sniff = "chop_sniff_seq",
            vocalizeLabelKey = "pet_bark",
        },

        Poses = {
            SitGround = { -- Done
                label = loc("smalldoggroundsit"),
                icon = "SMALLSITGROUND",
                player = { "gndhumanposedog01@animations", "gndhumanposedog01_clip" },
                dog = { "gndpugsentadopose01@animations", "gndpugsentadopose01_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = 0,
                    offsetX = -0.13,
                    offsetY = 0.8,
                    offsetZ = 0.34,
                    rotationX = -80.0,
                    rotationY = 35.0,
                    rotationZ = 50.0
                },
            },
            Onlap = {
                label = loc("smalldogonlap"),
                icon = "SMALLONLAP",
                player = { "gndpughumamsentado02@animations", "gndpughumamsentado02_clip" },
                dog = { "gndpugsentado02@animations", "gndpugsentado02_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = 0,
                    offsetX = -0.12,
                    offsetY = 0.54,
                    offsetZ = 0.66,
                    rotationX = -42.65,
                    rotationY = -13.43,
                    rotationZ = -7.39
                }
            },
            Carry3 = {
                label = loc("smalldogcarry3"),
                icon = "SMALLCARRY2",
                player = { "gndcatcolohuman06@animations", "gndcatcolohuman06_clip" },
                dog = { "gndcatcolo06@animations", "gndcatcolo06_clip" },
                config = {
                    freeze = false,
                    blockWeaponUsage = true,
                    flag = 49,
                    bone = 0,
                    offsetX = -0.12,
                    offsetY = -0.07,
                    offsetZ = 0.0,
                    rotationX = -10.1,
                    rotationY = -20.0,
                    rotationZ = -50.1
                }
            },
            Carry1 = {
                label = loc("smalldogcarry1"),
                icon = "SMALLCARRY1",
                player = { "gndpugcolopose01human@animations", "gndpugcolopose01human_clip" },
                dog = { "gndpugcolopose01@animations", "gndpugcolopose01_clip" },
                config = {
                    freeze = false,
                    blockWeaponUsage = true,
                    flag = 49,
                    bone = 0,
                    offsetX = -0.24,
                    offsetY = 0.06,
                    offsetZ = 0.37,
                    rotationX = 0.0,
                    rotationY = 0.0,
                    rotationZ = -24.57
                }
            },
            Carry2 = {
                label = loc("smalldogcarry2"),
                icon = "SMALLCARRY2",
                player = { "gndpugcolopose02human@animations", "gndpugcolopose02human_clip" },
                dog = { "gndpugcolopose02@animations", "gndpugcolopose02_clip" },
                config = {
                    freeze = false,
                    blockWeaponUsage = true,
                    flag = 49,
                    bone = 24816,
                    offsetX = 0.0,
                    offsetY = 0.0,
                    offsetZ = 0.0,
                    rotationX = 0.0,
                    rotationY = 0.0,
                    rotationZ = 0.0
                }
            },
            OnShoulder = {
                label = loc("smalldogonshoulder"),
                icon = "SMALLONSHOULDER",
                player = { "gndpugcolopose03human@animations", "gndpugcolopose03human_clip" },
                dog = { "gndpugcolopose03@animations", "gndpugcolopose03_clip" },
                config = {
                    freeze = false,
                    blockWeaponUsage = true,
                    bone = 0,
                    offsetX = 0.0,
                    offsetY = 0.0,
                    offsetZ = 0.0,
                    rotationX = 0.0,
                    rotationY = 0.0,
                    rotationZ = 0.0
                }
            },
            CarryLap = {
                label = loc("smalldogcarrylap"),
                icon = "SMALLCARRYLAP",
                player = { "gndpugcolopose04human@animations", "gndpugcolopose04human_clip" },
                dog = { "gndpugcolopose04@animations", "gndpugcolopose04_clip" },
                config = {
                    freeze = false,
                    blockWeaponUsage = true,
                    flag = 49,
                    bone = 0,
                    offsetX = 0.0,
                    offsetY = 0.0,
                    offsetZ = 0.0,
                    rotationX = 0.0,
                    rotationY = 0.0,
                    rotationZ = 0.0
                }
            },
            LayLap = {
                label = loc("smalldoglaylap"),
                icon = "SMALLONLAP",
                player = { "gndhumampugsentadocruzado@animations", "gndhumampugsentadocruzado_clip" },
                dog = { "gndpugsentadocruzado@animations", "gndpugsentadocruzado_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = 0,
                    offsetX = 0.0,
                    offsetY = 0.25,
                    offsetZ = -0.05,
                    rotationX = 0.0,
                    rotationY = -20.0,
                    rotationZ = 120.0
                }
            },
            LayGround = {
                label = loc("smalldoglayground"),
                icon = "SMALLLAYGROUND",
                player = { "gndhumansleepdog@animations", "gndhumansleepdog_clip" },
                dog = { "gndpugsleeppose@animations", "gndpugsleeppose_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = 0,
                    offsetX = -0.03,
                    offsetY = 0.66,
                    offsetZ = -0.38,
                    rotationX = -114.66,
                    rotationY = 0.0,
                    rotationZ = 0.0
                }
            },
            HoldAir = {
                label = loc("smalldogholdair"),
                icon = "SMALLHOLDAIR",
                dog = { "gndpugcarrypose@animations", "gndpugcarrypose_clip" },
                player = { "gndpugcarryhuman@animations", "gndpugcarryhuman_clip" },
                config = {
                    blockWeaponUsage = true,
                    freeze = false,
                    flag = 49,
                    bone = 24816,
                    offsetX = 0.0,
                    offsetY = 0.0,
                    offsetZ = -0.08,
                    rotationX = 0.0,
                    rotationY = 0.0,
                    rotationZ = 0.0,
                }
            }
        },
    },
    ['Cat'] = {
        -- General
        PlayerCallPetLeftAnim = { "missfra0_chop_find", "call_chop_l" },
        PlayerCallPetRightAnim = { "missfra0_chop_find", "call_chop_r" },

        -- Bed
        PlayerPickupBed = { "pickup_object", "pickup_low" },
        PetSleepBedAnim = { "creatures@cat@amb@world_cat_sleeping_ground@base", "base" },
        PetLeaveBedAnim = { "creatures@cat@amb@world_cat_sleeping_ground@exit", "exit" },

        -- Drink
        PlayerPickupBowl = { "pickup_object", "pickup_low" },
        PetDrinkingAnim = { "cdev@cateating", "eating_clip" },
        PetDrinkingHeading = 180,

        -- Eat
        PetBegAnim = { "ped@cdev", "beg_clip" },
        PetBegLoopAnim = { "ped@cdev", "beg_clip" },
        PetBegExitAnim = { "ped@cdev", "beg_clip" },
        PettingPlayerAnim = { "creatures@rottweiler@tricks@", "petting_franklin" },
        PetMoveAnim = { "creatures@cat@move", "idle" },

        -- Sit
        PetSitAnim = { "gndcatseat@animations", "gndcatseat_clip" },

        BackSitCarOffset = { x = 0.0, y = 0.0, z = 0.3 },
        FrontSitCarOffset = { x = 0.0, y = 0.0, z = 0.3 },

        -- Bag

        PetLayDownAnim = { "gndcatdeitadonamochila@animations", "gndcatdeitadonamochila_clip" },

        -- Cuddle
        PlayerCuddleAnim = { "creatures@rottweiler@tricks@", "petting_franklin" },
        PetCuddleAnim = { "ped@cdev", "beg_clip" },

        -- Throw Ball
        PetThrowBallPickup = { "ped@cdev", "fetch1_clip" },
        PetThrowBallDrop = { "ped@cdev", "fetch2_clip" },

        -- Scratch
        PetScratching = { "gndcatarranhando@animations", "gndcatarranhando_clip" },

        -- Ball
        BallFollowing = { "gndcatplaying@animations", "gndcatplaying_clip" },

        -- Cat: no native sounds (all dog-like). Set customSound* URLs when using xsound; put .ogg in xsound/html/sounds/
        VocalizeAnim = { "creatures@cat@amb@world_cat_sitting@base", "base" },
        Vocalization = {
            animalType       = 3,
            bark             = nil,
            bark_seq         = nil,
            whine            = nil,
            growl            = nil,
            agitated         = nil,
            sniff            = nil,
            -- Optional: one URL per vocal (requires xsound). Put .ogg in xsound/html/sounds/ (ex.: cat_meow.ogg)
            --customSoundBark     = "nui://xsound/html/sounds/cat_meow.ogg",
            -- customSoundBarkSeq  = "nui://xsound/html/sounds/cat_meow2.ogg",
            -- customSoundWhine    = "nui://xsound/html/sounds/cat_whine.ogg",
            -- customSoundGrowl    = "nui://xsound/html/sounds/cat_growl.ogg",
            -- customSoundAgitated = "nui://xsound/html/sounds/cat_hiss.ogg",
            -- customSoundSniff    = nil,
            vocalizeLabelKey = "pet_meow",
        },

        Poses = {
            SitGround = {
                label = loc("catsitground"),
                icon = "SMALLSITGROUND",
                player = { "gndhumanposedog01@animations", "gndhumanposedog01_clip" },
                dog = { "gndcatsentadopose01@animations", "gndcatsentadopose01_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = 0,
                    offsetX = -0.04,
                    offsetY = 0.85,
                    offsetZ = 0.21,
                    rotationX = -90.0,
                    rotationY = 0.0,
                    rotationZ = 0.0,
                }
            },
            LapGround = {
                label = loc("catlapground"),
                icon = "CATLAPGROUND",
                player = { "gndcathumamsentado02@animations", "gndcathumamsentado02_clip" },
                dog = { "gndcatsentado02@animations", "gndcatsentado02_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = 0,
                    offsetX = 0.0,
                    offsetY = 0.39,
                    offsetZ = 0.72,
                    rotationX = -35.32,
                    rotationY = 8.67,
                    rotationZ = 21.68
                }
            },
            Carry1 = {
                label = loc("catcarry1"),
                icon = "CATCARRY1",
                player = { "gndcatcolohuman05@animations", "gndcatcolohuman05_clip" },
                dog = { "gndcatcolo05@animations", "gndcatcolo05_clip" },
                config = {
                    freeze = false,
                    blockWeaponUsage = true,
                    flag = 49,
                    bone = 0,
                    offsetX = 0.0,
                    offsetY = 0.0,
                    offsetZ = 0.0,
                    rotationX = 0.0,
                    rotationY = 0.0,
                    rotationZ = 0.0
                }
            },
            Carry2 = {
                label = loc("catcarry2"),
                icon = "CATCARRY2",
                player = { "gndcatcolohuman@animations", "gndcatcolohuman_clip" },
                dog = { "gndcatcolo@animations", "gndcatcolo_clip" },
                config = {
                    freeze = false,
                    blockWeaponUsage = true,
                    flag = 49,
                    bone = 0,
                    offsetX = 0.0,
                    offsetY = 0.0,
                    offsetZ = 0.0,
                    rotationX = 0.0,
                    rotationY = 0.0,
                    rotationZ = 0.0
                }
            },
            OnShoulder = {
                label = loc("catonshoulder"),
                icon = "CATONSHOULDER",
                player = { "gndcatcolohuman03@animations", "gndcatcolohuman03_clip" },
                dog = { "gndcatcolo03@animations", "gndcatcolo03_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = 0,
                    offsetX = 0.0,
                    offsetY = 0.0,
                    offsetZ = 0.0,
                    rotationX = 0.0,
                    rotationY = 0.0,
                    rotationZ = 0.0
                }
            },
            Carry3 = {
                label = loc("catcarry3"),
                icon = "CATCARRY2",
                player = { "gndcatcolohuman04@animations", "gndcatcolohuman04_clip" },
                dog = { "gndcatcolo04@animations", "gndcatcolo04_clip" },
                config = {
                    freeze = false,
                    blockWeaponUsage = true,
                    flag = 49,
                    bone = 0,
                    offsetX = 0.0,
                    offsetY = 0.0,
                    offsetZ = 0.0,
                    rotationX = 0.0,
                    rotationY = 0.0,
                    rotationZ = 0.0
                }
            },
            SitGround2 = {
                label = loc("catlapground2"),
                icon = "CATLAPGROUND",
                player = { "gndhumamcatsentado@animations", "gndhumamcatsentado_clip" },
                dog = { "gndcatsentadocruzado@animations", "gndcatsentadocruzado_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = 0,
                    offsetX = -0.05,
                    offsetY = 1.09,
                    offsetZ = 0.06,
                    rotationX = -105.46,
                    rotationY = 36.07,
                    rotationZ = 35.49
                }
            },
            LayGround = {
                label = loc("catlayground"),
                icon = "CATLAYGROUND",
                player = { "gndhumansleepdog@animations", "gndhumansleepdog_clip" },
                dog = { "gndcatsleep@animations", "gndcatsleep_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = 0,
                    offsetX = -0.01,
                    offsetY = 0.86,
                    offsetZ = -0.06,
                    rotationX = -93.1,
                    rotationY = 0.0,
                    rotationZ = -0.31
                }
            },
            HoldAir = {
                label = loc("catholdair"),
                icon = "CATHOLDAIR",
                player = { "gndcatcarryhuman@animations", "gndcatcarryhuman_clip" },
                dog = { "gndcatcarry@animations", "gndcatcarry_clip" },
                config = {
                    freeze = false,
                    flag = 49,
                    blockWeaponUsage = true,
                    offsetX = 0.0,
                    offsetY = 0.0,
                    offsetZ = 0.0,
                    rotationX = 0.0,
                    rotationY = 0.0,
                    rotationZ = 0.0,
                    bone = 24816,
                }
            }
        }


    },
    ["BigCat"] = {
        -- Exotic big cats (lion, tiger, puma) + capybara: same movements as BigDog, different vocalization (growl, no bark).
        -- General
        PlayerCallPetLeftAnim = { "missfra0_chop_find", "call_chop_l" },
        PlayerCallPetRightAnim = { "missfra0_chop_find", "call_chop_r" },

        -- Bed
        PlayerPickupBed = { "pickup_object", "pickup_low" },
        PetSleepBedAnim = { "creatures@rottweiler@amb@sleep_in_kennel@", "sleep_in_kennel" },
        PetLeaveBedAnim = { "creatures@rottweiler@amb@sleep_in_kennel@", "exit_kennel" },

        -- Drink
        PlayerPickupBowl = { "pickup_object", "pickup_low" },
        PetDrinkingAnim = { "amb@lo_res_idles@", "creatures_world_deer_grazing_lo_res_base" },

        -- Eat
        PetBegAnim = { "creatures@rottweiler@tricks@", "beg_enter" },
        PetBegLoopAnim = { "creatures@rottweiler@tricks@", "beg_loop" },
        PetBegExitAnim = { "creatures@rottweiler@tricks@", "beg_exit" },
        PettingPlayerAnim = { "creatures@rottweiler@tricks@", "petting_franklin" },
        PetMoveAnim = { "creatures@rottweiler@move", "walk_start_180_r" },

        -- Sit
        PetSitAnim = { "creatures@rottweiler@tricks@", "sit_loop" },
        BackSitCarOffset = { x = 0.0, y = -0.25, z = 0.45 },
        FrontSitCarOffset = { x = 0.0, y = 0.0, z = 0.45 },

        -- Cuddle
        PlayerCuddleAnim = { "creatures@rottweiler@tricks@", "petting_franklin" },
        PetCuddleAnim = { "creatures@rottweiler@tricks@", "petting_chop" },

        -- Throw Ball
        PetThrowBallPickup = { "creatures@rottweiler@move", "fetch_pickup" },
        PetThrowBallDrop = { "creatures@rottweiler@move", "fetch_drop" },

        -- Bag
        PetBagStance = { "cdev@bigdogbag", "bag_clip" },

        -- BigCat: no native sounds (all dog-like). Set customSound* URLs when using xsound; put .ogg in xsound/html/sounds/
        VocalizeAnim = { "creatures@rottweiler@melee@streamed_taunts@", "taunt_01" },
        Vocalization = {
            animalType = 3,
            bark = nil,
            bark_seq = nil,
            whine = nil,
            growl = nil,
            agitated = nil,
            sniff = nil,
            -- Optional: one URL per vocal (requires xsound)
            -- customSoundBark     = "nui://xsound/html/sounds/lion_roar.ogg",
            -- customSoundBarkSeq  = "nui://xsound/html/sounds/lion_roar2.ogg",
            -- customSoundWhine    = "nui://xsound/html/sounds/lion_whine.ogg",
            -- customSoundGrowl    = "nui://xsound/html/sounds/lion_growl.ogg",
            -- customSoundAgitated = "nui://xsound/html/sounds/lion_snarl.ogg",
            -- customSoundSniff    = nil,
            vocalizeLabelKey = "pet_vocalize",
        },

        Poses = {
            SitGround = {
                label = loc("bigdoggroundsit"),
                icon = "BIGSITGROUND",
                dog = { "gnddogposehuman01@animations", "gnddogposehuman01_clip" },
                player = { "gndhumanposedog01@animations", "gndhumanposedog01_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = -1,
                    offsetX = -0.6,
                    offsetY = 0.1,
                    offsetZ = -0.85,
                    rotationX = 70.07,
                    rotationY = -149.47,
                    rotationZ = 11.82
                }
            },

            OnKnee = {
                label = loc("bigdogonknee"),
                icon = "BIGONKNEE",
                dog = { "gnddogposehuman02@animations", "gnddogposehuman02_clip" },
                player = { "gndhumanposedog02@animations", "gndhumanposedog02_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = 0,
                    offsetX = -0.09,
                    offsetY = 0.51,
                    offsetZ = -0.62,
                    rotationX = -130.65,
                    rotationY = -7.71,
                    rotationZ = -120.06,
                }
            },

            Sitgroundlay = {
                label = loc("bigdogsitgroundlay"),
                icon = "BIGSITGROUNDDLAY",
                dog = { "gndcarinhocachorrodeitado@animations", "gndcarinhocachorrodeitado_clip" },
                player = { "gndcarinhohumamcachorrodeitado@animations", "gndcarinhohumamcachorrodeitado_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = 0,
                    offsetX = -0.09,
                    offsetY = 0.49,
                    offsetZ = 0.4,
                    rotationX = -14.36,
                    rotationY = 32.98,
                    rotationZ = 55.66,
                }
            },

            LayGround = {
                label = loc("bigdoglay"),
                icon = "LAYGROUNDBIG",
                player = { "gndhumansleepdog@animations", "gndhumansleepdog_clip" },
                dog = { "gnddogsleep@animations", "gnddogsleep_clip" },
                config = {
                    freeze = true,
                    blockWeaponUsage = true,
                    bone = 0,
                    offsetX = -0.1,
                    offsetY = -0.25,
                    offsetZ = 0.0,
                    rotationX = 0.0,
                    rotationY = -80.98,
                    rotationZ = 80.49,
                }
            },

            HoldAir = {
                label = loc("bigdogholdair"),
                icon = "BIGHOLDAIR",
                player = { "gndhumancarrydog@animations", "gndhumancarrydog_clip" },
                dog = { "gnddogcarry@animations", "gnddogcarry_clip" },
                config = {
                    freeze = false,
                    blockWeaponUsage = true,
                    offsetX = 0.01,
                    offsetY = 0.54,
                    offsetZ = 0.49,
                    rotationX = 0.0,
                    rotationY = 0.0,
                    rotationZ = -84.63,
                    flag = 49,
                    bone = 24816,
                }
            }
        }
    },
}
