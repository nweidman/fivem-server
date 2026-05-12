---@alias PetLeashSettings { Bone: number, BoneName: string, BoneOffset: table }
---@alias PetFloatingUISetting { Bone: number, Offset: table; MenuOffset: table; BalloonOffset: table; StatsOffset: table }
---@alias CameraSettings { Bone: number, Offset: table, Rotation: table }
---@alias BallSettings { Enable: boolean, AttachBone: number, AttachBoneOffset: table }
---@alias PetDetails { Item: string, LeashSettings: PetLeashSettings, FloatingUISettings: PetFloatingUISetting, CameraCloseSettings: CameraSettings, BallSettings: BallSettings, Customization: any, Animations: any }
---@type table<string, PetDetails>
PetDetails = {
    ["cdev_dog_rott"] = {
        Item = "pet_chop",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"]
    },
    ["cdev_dog_dobb"] = {
        Item = "pet_dobermann",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"]
    },
    ["cdev_dog_husky2"] = {
        Item = "pet_husky",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"]
    },
    ["cdev_dog_golden"] = {
        Item = "pet_gold",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"]
    },
    ["cdev_dog_pug"] = {
        Item = "pet_pug",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["SmallDog"],
    },
    ["cdev_dog_shusky"] = {
        Item = "pet_shusky",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["SmallDog"],
    },
    ["cdev_dog_frbull"] = {
        Item = "pet_frbul",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["SmallDog"],
        SkipVehicleScenarios = true,
    },
    ["cdev_dog_bully2"] = {
        Item = "pet_bully",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"],
    },
    ["cdev_dog_pitt"] = {
        Item = "pet_pitt",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"],
    },
    ["cdev_dog_shep"] = {
        Item = "pet_shep",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"],
    },
    ["cdev_dog_chow"] = {
        Item = "pet_chow",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"],
    },
    ["cdev_dog_dal"] = {
        Item = "pet_dal",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"],
    },
    ["cdev_dog_mal"] = {
        Item = "pet_mal",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"],
    },
    ["cdev_dog_terrier"] = {
        Item = "pet_terrierk",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"],
    },
    ["cdev_dog_minipitt"] = {
        Item = "pet_minpit",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["SmallDog"],
    },
    ["cdev_dog_chiua"] = {
        Item = "pet_chiua",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["SmallDog"],
    },
    ["cdev_dog_dash"] = {
        Item = "pet_dash",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        Gender = {
            DrawableId = "0",
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["SmallDog"],
    },
    ["cdev_dog_york"] = {
        Item = "pet_york",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["SmallDog"],
    },
    ["cdev_dog_poodle"] = {
        Item = "pet_poodle",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["SmallDog"],
    },
    ["cdev_dog_akita"] = {
        Item = "pet_akita",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"]
    },
    ["cdev_dog_austshep"] = {
        Item = "pet_austshep",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"]
    },
    ["cdev_dog_bloodhound"] = {
        Item = "pet_bloodhound",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"]
    },
    ["cdev_dog_engbulldog"] = {
        Item = "pet_engbulldog",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigDog"]
    },
    ["cdev_dog_bulldogpup"] = {
        Item = "pet_bulldogpup",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["SmallDog"],
    },
    ["cdev_dog_bichon"] = {
        Item = "pet_bichon",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["SmallDog"],
    },
    ["cdev_dog_dalpup"] = {
        Item = "pet_dalpup",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["SmallDog"],
    },
    ["cdev_dog_pup"] = {
        Item = "pet_goldenpup",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["SmallDog"],
    },
    ["cdev_dog_shepup"] = {
        Item = "pet_shepup",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["SmallDog"],
    },
    ["cdev_animal_capy"] = {
        Item = "pet_animal_capy",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigCat"]
    },
    ["cdev_animal_lion"] = {
        Item = "pet_animal_lion",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigCat"]
    },
    ["cdev_animal_puma"] = {
        Item = "pet_animal_puma",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigCat"]
    },
    ["cdev_animal_tiger"] = {
        Item = "pet_animal_tiger",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck_1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["BigCat"]
    },
    -- cats
    ["cdev_cat_turk"] = {
        Item = "pet_turk",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["Cat"]
    },
    ["cdev_cat_amer"] = {
        Item = "pet_amer",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["Cat"]
    },
    ["cdev_cat_synphix"] = {
        Item = "pet_synphix",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["Cat"]
    },
    ["cdev_cat_wcoon"] = {
        Item = "pet_wcoon",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["Cat"]
    },
    ["cdev_cat_wolf"] = {
        Item = "pet_wolf",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["Cat"]
    },
    ["cdev_cat_black"] = {
        Item = "pet_cat_black",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["Cat"]
    },
    ["cdev_cat_egyptian"] = {
        Item = "pet_cat_egyptian",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["Cat"]
    },
    ["cdev_cat_grey"] = {
        Item = "pet_cat_grey",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["Cat"]
    },
    ["cdev_cat_siamese"] = {
        Item = "pet_cat_siamese",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["Cat"]
    },
    ["cdev_cat_tricolor"] = {
        Item = "pet_cat_tricolor",
        LeashSettings = {
            Bone = 39317,
            BoneName = "SKEL_Neck1",
            BoneOffset = vector3(0.0, 0.15, -0.1),
        },
        FloatingUISettings = {
            Bone = 31086,
            Offset = vector3(0.0, 0.0, 0.6),
            MenuOffset = vector3(0.0, 0.05, 0.4),
            BalloonOffset = vector3(0.0, 0.0, 1.0),
            StatsOffset = vector3(-0.2, 0.0, -0.1)
        },
        CameraCloseSettings = {
            Bone = 31086,
            Offset = vector3(0.3, 1.2, 0.5),
            Rotation = vector3(0.0, 0.0, 160.0),
        },
        BallSettings = {
            Enable = true,
            AttachBone = 46240,
            AttachBoneOffset = vector3(0.14, 0.0, 0.05),
        },
        Animations = DogAnims["Cat"]
    },
}
