PlayerShop = {
    Roles = {
        BOSS = 100, -- These values are not employee salary amounts. They represent the permission level for each role.
        MANAGER = 50,
        VETERINARY = 25,
        CLERK = 0,
    }
}

PublicSharedPetsConfig = {
    -- If true, certain pet items will be limited to players who have active VIP status
    -- in your server, for setting up VIP integration check the documentation for cdev_lib
    UseVIPSystem = true,

    -- If true, players won't be able to spawn VIP pets if their VIP status is inactive
    -- To add a pet as VIP in the shop, you need to add the variable `vip = true` in the file `public/config/shop.lua`.
    -- even if they previously purchased the pet while having VIP
    RequireActiveVIPForSpawning = true,

    -- If true, there will be a button for opening the pet shop in your Pet Bag
    -- If false, you must integrate the pet shop by yourself, check docs for cdev_pets
    WantPetShopButton = false,

    BlockWeaponUsageInBall = true,

    BlockWeaponWhilePetInBackpack = true,

    -- The game time (in ms) until which we wait for the pet to fetch the ball; after this, the pet returns and the ball is restored to the player
    TimeOutBallThrow = 15000,

    -- Max distance (meters) for players to hear custom vocal (Meow/Bark, happiness, mood, etc.) when synced; only players within this radius receive the sound
    VocalSyncRadius = 40.0,

    -- When true, if the pet is loyal enough it will attack players you aim at, if you decide to keep this disabled use the export to trigger attacks from your own script ":Attack(ped)"
    WantAttackWhenAiming = false,

    -- Works the same as WantAttackWhenAiming, but if you disable WantAttackWhenAiming you can still enable this to allow K9s to attack when aiming
    WantAttackWhenAimingIfK9 = false,

    -- if true, pets can only attack players
    -- if false, pets can attack any entity
    EnablePetToOnlyAttackPlayers = true,

    -- If true, will enable the new attack update with the police being the only that can use this feature and train the dog
    -- If true, only the K9 will be able to attack, and it won’t deal damage to players — it will only knock them down and immobilize them to make it more realistic.
    -- If false, will reverse to old one
    -- If This is true need EnablePetToOnlyAttackPlayers to be true
    EnableAttackUpdate = false,

    -- Configuration for opening a pet shop via Ped.
    PedShop = {

        -- If true, it will create a pet shop to use as a pet shop.
        WantPedShop = true,

        -- If true, it will use the drawtext system to interaction with PedShop
        UseDrawTextForPedShop = false,
        DrawTextDistance = 1.5,
        PedShopControl = 38, -- E

        -- Coords to define where the ped will spawn
        PedCoords = vector4(1380.7599, 3533.7722, 35.6757, 232.1291),

        -- Parameter to define the ped model.
        PedModel = "cs_mrsphillips",

    },

    -- ==========================================
    -- 🔄 PET TRANSFER SYSTEM CONFIGURATION
    -- ==========================================
    --
    -- 🐕 OVERVIEW:
    -- The Pet Transfer system allows players to transfer their pets (including all stats and inventory)
    -- to another player. Optionally, the feature can be fully disabled or you can require the new owner
    -- to pay a transfer fee (with confirmation).

    PetTransfer = {
        -- 🔘 Master toggle: Set to 'false' to completely disable pet transfers (players will not see the transfer option in pet menu)
        enable = true,

        -- 💸 Enable/Disable charging a fee for transferring pets
        -- If 'false', no fee required or confirmation for the receiving player; transfer is instant.
        -- If 'true', transferring player will enter a transfer amount, and the receiver must accept the charge and have enough money.
        enableCharge = false,

        -- 💵 Minimum and maximum fee allowed when charging is enabled
        -- (Prevents typos, very low/high charges, and can be used for default server economy balancing)
        minCharge = 0,     -- Smallest amount player must charge (default: 0 = free allowed)
        maxCharge = 50000, -- Highest amount allowed for a transfer (default: 50000)
    },

    PlayerShop = {
        -- If true, it will use the drawtext system to show the pet shop
        UseDrawtextForPetShopEntities = false,
        UseDrawtextForManagment = false,
        UseDrawTextForStoreStores = false,
        DrawtextDistance = 1.5,

        UseBankInsteadOfCash = true,

        -- ⌨️ Default controls for the shop creator menu (see https://docs.fivem.net/docs/game-references/controls)
        CreatorControls = {
            CONFIRM_ANY_ACTION = 38, -- E
            CANCEL_ANY_ACTION = 200, -- ESC
            GENERAL_SAVE = 201,      -- Enter
            GENERAL_TOGGLE = 37,     -- TAB
            GENERAL_ALTERNATE = 19,  -- L. ALT
            INCREASE = 15,           -- Scroll UP
            DECREASE = 14,           -- Scroll DOWN
        },

        VetControls = {
            CANCEL_ANY_ACTION = 200, -- ESC
            HEAL = 201,              -- Enter
        },

        -- ⌨️ Default controls for drawtext shops if using any (see https://docs.fivem.net/docs/game-references/controls)
        DrawtextShopControls = {
            BROWSE_STOCK = 38, -- E
            MANAGEMENT = 38,   -- E
            PETSHOP = 38,      -- E
        },

        Job = {
            RoleRequirements = {
                OpenManagementMenu = PlayerShop.Roles.CLERK,
                ManageStock = PlayerShop.Roles.CLERK,
                ManageEmployees = PlayerShop.Roles.MANAGER,
                ManageSettings = PlayerShop.Roles.MANAGER,
                ManageVault = PlayerShop.Roles.MANAGER,
                PlaceDogs = PlayerShop.Roles.MANAGER,
                TreatDogs = PlayerShop.Roles.VETERINARY,
            },
        },

        -- ==========================================
        -- 🩺 VETERINARY SYSTEM CONFIGURATION
        -- ==========================================
        --
        -- 🐕 OVERVIEW:
        -- The veterinary system allows veterinarians to heal pets in two ways:
        -- 1. Quick Heal: Revive dead pets on the ground (fast, partial recovery)
        -- 2. Table Treatment: Full treatment on veterinary tables (slow, full recovery)

        Veterinary = {

            -- ==========================================
            -- 👤 WHO CAN ACT AS VETERINARIAN
            -- ==========================================
            --
            -- List of job names that can perform vet actions (quick heal, table treatment).
            -- Employees of a Player Shop with role "Veterinary" are always allowed (no need to add here).
            --
            AllowedVeterinarianJobs = {
                -- "veterinarian",
                -- "doctor",
                "ambulance",
            },

            -- 🏥 Quick Heal (Revive Dead Pets)
            -- Used when veterinarian revives a dead pet on the ground
            -- This is a FAST emergency treatment
            QuickHeal = {
                HealthRecover = 25, -- HP recovered (0-100) | Recommended: 25-50
            },

            -- 🏥 Table Treatment (Full Treatment)
            -- Used when veterinarian treats a pet on a treatment table
            -- This is a FULL treatment that restores everything
            TableTreatment = {
                HealthRecover = 100, -- HP recovered (0-100) | Recommended: 100
                HungerRecover = 100, -- Hunger recovered (0-100) | Recommended: 100
                ThirstRecover = 100, -- Thirst recovered (0-100) | Recommended: 100
            },

            -- ==========================================
            -- 🎬 ANIMATION SETTINGS
            -- ==========================================

            -- 💉 Quick Treatment Animation
            -- Played when veterinarian revives a dead pet
            QuickTreatmentAnim = {
                dict = "amb@medic@standing@kneel@idle_a", -- Animation dictionary
                anim = "idle_a",                          -- Animation name
                flag = 1,                                 -- Animation flag (1 = normal)
                duration = 3000,                          -- Animation duration in ms (3 seconds)
            },

            -- 🔧 Table Treatment Animation
            -- Played when veterinarian treats a pet on a table
            TableTreatmentAnim = {
                dict = "mini@repair",  -- Animation dictionary
                anim = "fixing_a_ped", -- Animation name
                flag = 1,              -- Animation flag (1 = normal)
                duration = 5000,       -- Animation duration in ms (5 seconds)
            },

            -- ==========================================
            -- 📏 DISTANCE SETTINGS
            -- ==========================================

            -- Maximum distance for quick heal (revive dead pet)
            -- Veterinarian must be within this distance to revive a dead pet
            MaxHealDistance = 3.0, -- In meters | Recommended: 2.0-4.0

            -- Maximum distance for table interactions
            -- Player must be within this distance to interact with treatment tables
            TableInteractionDistance = 2.0, -- In meters | Recommended: 1.5-2.5

            -- ==========================================
            -- 🎮 INTERACTION METHOD CONFIGURATION
            -- ==========================================

            -- 💀 Quick Heal (Revive Dead Pets)
            -- When a pet dies, veterinarian can revive it
            UseDrawTextForQuickHeal = false, -- true = DrawText | false = Target/Raycast
            -- If true: Shows "Press [E] to revive pet" text
            -- If false: Shows target icon when looking at dead pet

            -- 🛏️ Treatment Tables
            -- Pet owners place pets on tables, veterinarians treat them
            UseDrawTextForTables = false, -- true = DrawText | false = Target
            -- If true: Shows "Press [K] to place pet" / "Press [E] to treat" / "Press [L] to remove" texts
            -- If false: Shows target options when near table

            -- ==========================================
            -- 🔔 NOTIFICATION CONFIGURATION
            -- ==========================================
            --
            -- 💡 CUSTOMIZE WHAT NOTIFICATIONS APPEAR:
            -- Set to 'false' to disable specific notifications
            -- Set to 'true' to enable specific notifications
            --
            -- ==========================================

            Notifications = {
                -- Quick Heal Notifications
                ShowQuickHealStart = true,   -- "Reviving pet..." (to veterinarian)
                ShowQuickHealSuccess = true, -- "Pet revived! +25 HP" (to veterinarian)
                ShowQuickHealToOwner = true, -- "Your pet was healed by Dr. Smith (+25 HP)" (to owner)

                -- Table Treatment Notifications
                ShowTableTreatStart = true,   -- "Treating pet..." (to veterinarian)
                ShowTableTreatSuccess = true, -- "Pet fully treated! +100 HP, +100 Hunger, +100 Thirst" (to veterinarian)
                ShowTableTreatToOwner = true, -- "Your pet was fully treated by Dr. Smith" (to owner)

                -- Table Interaction Notifications
                ShowPlacePetSuccess = true,  -- "Pet placed on treatment table" (to owner)
                ShowRemovePetSuccess = true, -- "Pet removed from table" (to owner)
            },

            -- ==========================================
            -- ⌨️ DRAWTEXT KEYS CONFIGURATION
            -- ==========================================
            --
            -- 🔑 KEY CODES:
            -- These keys are used ONLY when DrawText mode is enabled
            -- If you use Target mode, these keys are IGNORED

            -- 🔗 FULL LIST:
            -- See: https://docs.fivem.net/docs/game-references/controls/

            Keys = {
                -- 💀 Quick Heal Key (Revive Dead Pet)
                -- Veterinarian uses this key when near a dead pet
                DrawTextQuickHeal = 38, -- E key | Shows: "Press [E] to revive pet"

                -- 💉 Table Heal Key (Treat Pet on Table)
                -- Veterinarian uses this key to treat a pet on a table
                DrawTextTableHeal = 38, -- E key | Shows: "Press [E] to treat pet"

                -- 🛏️ Place Pet Key (Owner Action)
                -- Pet owner uses this key to place their pet on a treatment table
                DrawTextPlaceOnTable = 311, -- K key | Shows: "Press [K] to place pet on table"

                -- 🐕 Remove Pet Key (Owner Action)
                -- Pet owner uses this key to remove their pet from a treatment table
                DrawTextRemoveFromTable = 182, -- L key | Shows: "Press [L] to remove pet from table"
            },
        },

    },

    -- Range the Keybinds/Commands will work
    Range = 5.0,

    -- [[ Keybinds are cached by FiveM on each player's PC (fivem.cfg). After you change any keybind here, every player who
    --     had already joined the server with the old config must clear their keybind cache and restart FiveM for the new
    --     keybinds to apply. How to clear: https://docs.cdev.shop/fivem/pet-system/faq#i-changed-the-keybinds-in-the-config-but-they-didnt-change-in-game.-how-do-i-fix-this ]]
    Keybinds = {
        Enabled = true,

        QuickAction_Bubbles = false,

        -- Quick action for following/staying
        QuickAction_Follow = "G",

        -- Quick action for opening the menu
        QuickAction_Menu = "E",

        -- Quick action for cuddling
        QuickAction_Cuddle = "F",

        -- Quick action for standing up (leaving bed)
        QuickAction_Stand = "G",

        -- Cancel action
        CancelAction = "X",

        -- Keybind for opening your Pet Bag
        PetsBag = "Z",

        -- Optional: require modifier + PetsBag to open Pet Bag (avoids accidental opens and reduces server calls)
        -- When true, player must hold PetsBagModifier and press PetsBag (e.g. ALT + TAB).
        PetsBagUseCombo = true,
        PetsBagModifier = "CAPSLOCK",    -- Any key name (same as PetsBag/other keybinds). Recommended: ALT, SHIFT, CTRL (or LMENU, LSHIFT, LCONTROL). Only used when PetsBagUseCombo = true.
        PetsBagComboCooldownMs = 0, -- Min ms 3000 = 3sec between opens (combo and non-combo). 0 = no cooldown. Notify shows remaining time if blocked.
    },

    Commands = {
        Enabled = true,

        -- Command for following/staying
        petfollow = "petfollow",

        -- Command for opening the menu
        openpetmenu = "petmenu",

        -- Command for cuddling
        petcuddle = "petcuddle",

        -- Command for cancelling action
        petcancel = "petcancel",

        -- Command for opening pet Bag
        petbag = "petbag",

        -- Command for standing up (leaving bed)
        petstand = "petstand"
    },

    -- ==========================================
    -- 🐾 PET MOVEMENT & FOLLOW SYSTEM
    -- ==========================================
    -- 🐕 OVERVIEW:
    -- This system controls how pets follow players, adjusting their speed
    -- dynamically based on player movement (walking, running, sprinting).
    -- Prevents pets from falling behind and includes smart teleportation.

    PetMovement = {

        -- ==========================================
        -- 🏃 SPEED MULTIPLIER SETTINGS
        -- ==========================================
        --
        -- 💡 HOW IT WORKS:
        -- 1.0 = Normal NPC speed (default GTA V speed)
        -- 2.0 = 2x faster than normal
        -- 10.0 = 10x faster (66 m/s when sprinting)
        --
        -- ⚠️ TECHNICAL LIMITS (Native):
        -- MIN: 0.0 (frozen) | MAX: 10.0 (extremely fast)
        --
        -- ⚠️ RECOMMENDED LIMITS (Visual Quality):
        -- MIN: 1.0 | MAX: 4.0
        -- Values above 4.0 cause animation desync and look unnatural
        -- ==========================================

        -- 🚶 Base Speed (Player Walking)
        -- Applied when player is walking normally
        -- TECHNICAL: 0.0-10.0 | RECOMMENDED: 1.5-2.5 | VISUAL LIMIT: 3.0
        BaseSpeedMultiplier = 1.8,

        -- 🏃 Running Speed (Player Running)
        -- Applied when player is running (holding Shift on keyboard)
        -- TECHNICAL: 0.0-10.0 | RECOMMENDED: 2.0-3.0 | VISUAL LIMIT: 4.0
        RunningSpeedMultiplier = 2.2,

        -- 🏃💨 Sprinting Speed (Player Sprinting)
        -- Applied when player is sprinting (tapping Shift repeatedly)
        -- TECHNICAL: 0.0-10.0 | RECOMMENDED: 2.5-4.0 | VISUAL LIMIT: 5.0
        -- ⚠️ WARNING: Values above 5.0 will cause severe animation glitches
        SprintingSpeedMultiplier = 3.0,

        -- ==========================================
        -- 📏 DISTANCE SETTINGS
        -- ==========================================

        -- 🎯 Minimum Distance for Speed Boost
        -- Pet only gets speed boost when farther than this distance
        -- If pet is closer, it uses BaseSpeedMultiplier
        -- MIN: 0.0 | MAX: 50.0 | RECOMMENDED: 4.0-8.0
        MinDistanceForBoost = 5.0,

        -- 🚀 Maximum Follow Distance (Teleport Trigger)
        -- When pet is farther than this distance, it teleports to player
        -- This prevents pets from getting permanently lost
        -- MIN: 10.0 | MAX: 500.0 | RECOMMENDED: 30.0-60.0
        MaxFollowDistance = 40.0,

        -- ==========================================
        -- ⚙️ PERFORMANCE SETTINGS
        -- ==========================================

        -- ⏱️ Speed Update Interval
        -- How often the system checks and updates pet speed (in milliseconds)
        -- Lower = More responsive but higher CPU usage
        -- Higher = Less responsive but better performance
        -- MIN: 50 | MAX: 5000 | RECOMMENDED: 200-500
        UpdateInterval = 300,

        -- ==========================================
        -- 🔧 TELEPORT SYSTEM
        -- ==========================================

        -- 📍 Enable Smart Teleportation
        -- When enabled, pet teleports to player when too far away
        -- When disabled, pet will keep running (may get stuck/lost)
        -- true = Enabled | false = Disabled
        EnableTeleport = true,
    },


    -- Interaction for getting pet into vehicle (if false you should trigger events from your own script, events in docs)
    PetVehicleInteractionTarget = true,        -- False for enable drawtext interactions
    KeybindPetVehicleDrawTextInteraction = 73, -- X If PetVehicleInteractionTarget = false, use this key to Place/Take pet from vehicles

    BagIcon = "https://r2.fivemanage.com/h5xg7GzhtMUaOOpkouu1c/OSANI.png",

    Permissions = {
        -- Permission for adding inventory items for a pet
        PermPetInventoryAddItem = PERMISSION_HIGH,
        PermPetAddPet = PERMISSION_HIGH,
        PermPetDelPet = PERMISSION_HIGH,
        PermCreatePetShop = PERMISSION_HIGH,
        PermAddEmployees = PERMISSION_HIGH,
        PermPetManager = PERMISSION_HIGH,
    },

    Inventory = {
        -- Max slots for pet inventory by default (non-VIP)
        Slots = 25,
        -- Max slots for pet inventory for VIP players (when UseVIPSystem is enabled)
        VIPSlots = 50,
    },

    -- Settings related to pet tracker on map
    Tracker = {
        Enabled = true,
        Sprite = 621,
        Color = 5,
        Scale = 1.0,
        UpdateRateMS = 2 * 1000,
    },

    -- Settings related to pet shop
    Shop = {
        -- When true: only show pets whose asset (folder) is present OR pets not in asset_to_pets (e.g. GTA natives, third-party). See public/config/asset_to_pets.lua.
        -- When false: show all pets from the shop (no filter).
        UseAssetFilter = true,
        Icon = "https://r2.fivemanage.com/h5xg7GzhtMUaOOpkouu1c/OSANI.png",
        -- Custom currency icon in shop header. If empty, the default diamond SVG is used. If set (e.g. "nui://cdev_pets/html/icons/vip.png"), that image is used instead.
        CustomCurrencyIcon = "",
        PetCategories = {
            "pet_category_pets",
        },
        ApparelCategories = {
            "apparel_category_collar",
            "apparel_category_clothes",
            "apparel_category_shoes",
            "apparel_category_head",
            "apparel_category_patch",
            "apparel_category_glasses",
            "apparel_category_mask",
            --"apparel_category_fur",
        },
        AccessoriesCategories = {
            "accessory_category_leash",
            "accessory_category_bowl",
            "accessory_category_bed",
            "accessory_category_toys",
            "accesorry_category_training"
        },
        CareCategories = {
            "care_category_food",
            "care_category_liquids",
            "care_category_health",
        },
    },

    -- Mood UI settings
    Mood = {
        -- How far away will pet mood be displayed
        ShowRange = 20,
    },

    -- AI Related settings
    AI = {
        -- How frequently will AI tasks be processed on the server in seconds
        -- Changing this may have severe effects, not recommended
        TickFrequency = 60,
    },

    -- Pet stat related configuration
    -- Stats range from 0-100, values are changed per tick (check TickFrequency)
    Stats = {
        -- Appetite lost per tick
        AppetiteDecreasePerTick = 1,
        -- Appetite lost while following per tick
        AppetiteDecreaseFollowingPerTick = 2,
        -- Appetite change stat notification frequency
        AppetiteChangeNotify = 10,
        -- Damage dealt per tick while starving
        StarvationDamagePerTick = 5,
        -- Appetite lost when fetching a toy
        AppetiteDecreaseFromFetch = 1,
        -- Appetitle lost when healed
        ApettiteDecreaseWhenHealed = 3,
        -- Appetite lost when attacking
        AppetiteDecreaseWhenAttacking = 5,

        -- Hydration lost per tick
        HydrationDecreasePerTick = 1,
        -- Hydration lost while following per tick
        HydrationDecreaseFollowingPerTick = 2,
        -- Hydration change stat notification frequency
        HydrationChangeNotify = 10,
        -- Damage dealt per tick while dehydrated
        DehydrationDamagePerTick = 5,
        -- Hydration lost when fetching a toy
        HydrationDecreaseFromFetch = 3,
        -- Hydration lost when healed
        HydrationDecreaseWhenHealed = 3,
        -- Hydration lost when attacking
        HydrationDecreaseWhenAttacking = 5,

        -- Stamina lost while following per tick
        StaminaDecreaseFollowingPerTick = 1,
        -- Stamina lost when fetching a toy
        StaminaDecreaseFromFetch = 4,
        -- Stamina gained when sleeping per tick
        StaminaIncreaseWhileSleepingPerTick = 5,
        -- Stamina change stat notification frequency when sleeping
        StaminaChangeWhileSleepingNotify = 1,
        -- Stamina lost when attacking
        StaminaDecreaseWhenAttacking = 5,

        -- Happiness gained from cuddling (limited to cuddle frequency setting)
        HappinessBoostFromCuddle = 5,
        -- Happiness gained from following (limited to follow frequency setting)
        HappinessBoostFromFollow = 5,
        -- How often in seconds will cuddling increase happiness
        HappinessCuddleFrequency = 60 * 5,
        -- How often in seconds will following increase happiness
        HappinessFollowFrequency = 60 * 2.5,
        -- Pet will get angry when happiness is under this amount
        HappinessAngryThreshold = 30,
        -- Happiness lost when attacked by owner
        HappinessDecreaseWhenAttackedByOwner = 20,
        -- Happiness gained when fetching a toy
        HappinessBoostFromFetch = 5,

        -- Loyalty will increase when happiness above
        LoyaltyIncreaseWhenHappinessAbove = 80,
        -- Loyalty gained per tick when pet is above happiness threshold
        LoyaltyIncreasePerTickWhenHappy = 1,
        -- Loyalty lost per tick when starving
        LoyaltyDecreasePerTickWhenStarving = 1,
        -- Loyalty lost when attacked by owner
        LoyaltyDecreaseWhenAttackedByOwner = 5,
        -- Loyalty gained when revived by owner
        LoyaltyIncreaseWhenRevivedByOwner = 5,
        -- Loyalty gained when healed by owner
        LoyaltyIncreasedWhenHealedByOwner = 1,
        -- Loyalty gained when attacking
        LoyaltyIncreaseWhenAttacking = 1,
        -- Loyalty needed to perform certain actions like attacking
        LoyaltyLoyalThreshold = 80,

        -- How far away will pet stat changes be displayed
        NotifyShowRange = 20,
    },

    K9 = {
        -- Jobs that can buy and spawn K9 pets. Add your job names (e.g. "police", "sheriff", "lspd").
        -- Used by IsPlayerAllowedToBuyK9 in public/server/api.lua; override that function for custom logic.
        AllowedJobsToBuyAndSpawn = { "police" },

        -- If true, players who no longer have one of the allowed jobs cannot spawn their K9 pet (e.g. after job change).
        -- If false, anyone who already owns a K9 can always spawn it regardless of current job.
        BlockK9SpawnWhenNoPermission = true,

        -- Whether or not K9s can sniff for illegal items
        Skills = {
            sniff = {
                -- Level the k9 starts at
                DefaultLevel = 20,
                -- Minimum level the k9 can be at
                -- if 0 then it will be impossible to sniff
                MinimiumLevel = 1,
                -- How much the sniff level increases per successful sniff
                LevelIncrease = 5,
                -- How much of the skill it will take out
                TakeOut = 5,
            },
            attack = {
                -- Level the k9 starts at
                DefaultLevel = 20,
                -- Minimum level the k9 can be at
                -- if 0 then it will be impossible to attack
                MinimiumLevel = 1,
                -- How much the attack level increases per successful attack
                LevelIncrease = 5,
                -- How much time the player will be down
                takedownTime = 10000,
                -- How much of the skill it will take out
                TakeOut = 5,
            },
            agility = {
                -- Level the k9 starts at
                DefaultLevel = 20,
                -- Minimum level the k9 can be at
                -- if 0 then it will be impossible to agility
                MinimiumLevel = 1,
                -- How much the attack level increases per successful attack
                LevelIncrease = 5,
                -- How much of the skill it will take out
                TakeOut = 5,
            },
            resistance = {
                -- Level the k9 starts at
                DefaultLevel = 20,
                -- Minimum level the k9 can be at
                -- if 0 then it will be impossible to resistance
                MinimiumLevel = 1,
                -- How much the attack level increases per successful attack
                LevelIncrease = 5,
                -- How much of the skill it will take out
                TakeOut = 5,
            },

            -- Specific settings for each training type
            training = {
                Cones = {
                    TripChance = 50,    -- Chance to trip during cone training (50% default)
                    StaminaDecrease = 5 -- Stamina cost for this exercise
                },
                Ramp = {
                    TripChance = 40,    -- Chance to trip during ramp training (40% default)
                    StaminaDecrease = 7 -- Stamina cost for this exercise
                },
                Dummy = {
                    StaminaDecrease = 7 -- Stamina cost for this exercise
                },
                Hoop = {
                    StaminaDecrease = 7 -- Stamina cost for this exercise
                }
            },

            -- How often in seconds will the skill tick
            TakeOutSkillTickFrequency = 720, -- in seconds
        },

        -- Whether or not K9s can sniff for illegal items
        SearchEnabled = false,
        -- Interaction Configs
        PetSniffInteractionTargetVehicle = true,         -- (Leave this enable if you want use EyeTarget or disabled if you want drawtext)
        KeybindPetSniffVehicleDrawTextInteraction = 249, -- N (This only use if PetSniffInteractionTargetVehicle = false)

        PetSniffInteractionTargetPlayer = true,          -- (Leave this enable if you want use EyeTarget or disabled if you want drawtext)
        KeybindPetSniffPlayerDrawTextInteraction = 249,  -- N (This only use if PetSniffInteractionTargetPlayer = false)
        -- Item ids that can be sniffed by K9s
        DrugItems = {
            "phone",
        },
        MoneyItems = {
            "water_bottle",
        },
        WeaponItems = {
            "sandwich",
        },
    },

    -- Radius (meters) used to send Place/Remove/sale updates to nearby players. Players within this distance of any shop point (blip, display, management, vet) receive the sync.
    DistanceOfPlayerShopUpdate = 50.0,

    -- When true, draw spheres in-world showing the sync range (same radius as above). Requires Debug = true. Use to verify who receives updates.
    DebugDrawSyncRange = false,

    -- Maximum number of sales records sent with cdev_pets:updateShop (reduces network payload).
    -- Dashboard shows "recent" sales; increase if you need more history in sync (higher = more bandwidth).
    SyncSalesLimit = 100,

    -- ==========================================
    -- 🏠 ROUTING BUCKET COMPATIBILITY
    -- ==========================================
    -- Allows pets to work with housing scripts that use routing buckets
    -- (separate instances/dimensions for apartments, houses, etc.)

    RoutingBucket = {
        -- ⚠️ IMPORTANT: Does not affect existing clients or saved pets
        -- 📊 PERFORMANCE: TRUE = +0.01ms per active pet | FALSE = No impact
        UseServerSideSpawning = false, -- Default: false (backward compatible)

        -- Automatically stores pet when player enters different dimension (e.g., apartment, garage, house)
        -- ⚠️ REQUIREMENT: Only works if UseServerSideSpawning = true
        -- 📊 PERFORMANCE: TRUE = +0.01ms per second | FALSE = No impact
        AutoSyncBucket = true, -- Default: true

        -- How often (in seconds) to check for dimension changes
        -- ⚠️ REQUIREMENT: Only works if AutoSyncBucket = true
        -- 📊 PERFORMANCE: 1 second = ~0.01ms/s | 5 seconds = ~0.002ms/s
        BucketCheckInterval = 1, -- Default: 1 second (recommended)

        -- Delay (in milliseconds) after the pet entity appears on client before requesting control
        -- Higher values can fix "Failed to gain control" on high latency or heavy servers
        -- ⚠️ Only used when UseServerSideSpawning = true
        -- 📌 By ping: <100ms = 100 | 100–200ms = 150 | 200–250ms = 250 | 250ms+ = 300
        ServerSpawnSyncDelayMs = 150, -- Default: 150

        -- How many times the client will try to gain control of the server-spawned pet (each attempt ~50ms)
        -- Increase if players often see "Failed to gain control of server-spawned pet"
        -- ⚠️ Only used when UseServerSideSpawning = true
        -- 📌 By ping: <100ms = 40 (~2s) | 100–200ms = 60 (~3s) | 200–250ms = 80 (~4s) | 250ms+ = 90–100 (~5s)
        ServerSpawnControlAttempts = 90, -- Default: 90 (better for high ping/packet loss)

        -- Maximum total time (in milliseconds) for the whole server-spawn flow (wait for sync + delay + control attempts).
        -- If this time is exceeded, the spawn is aborted and the player is notified; pet is put away so they can try again.
        -- ⚠️ Only used when UseServerSideSpawning = true
        ServerSpawnMaxTimeMs = 25000, -- Default: 25000 (25s, better for poor connection)

        Notifications = {
            -- Show notification when pet is auto-stored due to dimension change
            ShowAutoDespawnNotification = true, -- Default: true (recommended)
        },

        -- Logs routing bucket operations to server console (spawn success/fail, bucket changes, client-side errors)
        -- Enable to find causes of "Failed to gain control" or "pet is far away" when using UseServerSideSpawning
        DebugLogging = false, -- Default: false (set true to troubleshoot routing bucket issues)
    },

    -- ==========================================
    -- 🌐 SPAWN & POOR CONNECTION (client-side spawn)
    -- ==========================================
    -- Used when RoutingBucket.UseServerSideSpawning = false (default). Tune these if players with
    -- high ping or packet loss often see "Your pet was put away" or the three bubbles not appearing.
    Spawn = {
        -- How many times the client tries to gain control of the pet entity when spawning locally.
        -- Each attempt waits ~50 ms. Total wait ≈ (value × 50 ms). If control is not gained in time,
        -- the spawn is aborted and the player is told the pet was put away (they can try again).
        -- Increase this if players with high ping often fail to spawn.
        --
        -- Examples by average ping:
        --   < 80 ms   → 40  (~2 s total)  | Good connection
        --   80–150 ms → 60  (~3 s total)  | Default, suits most servers
        --   150–250 ms → 80 (~4 s total)  | High ping
        --   250 ms+   → 100 (~5 s total)  | Very high ping / packet loss
        ClientSpawnControlAttempts = 60,

        -- After how many milliseconds of loading to show the notification:
        -- "Your pet is taking longer to load due to your connection. Please wait..."
        -- Only one such notification is shown per spawn attempt. Increase this if you do not want
        -- the message to appear for players with a good connection (e.g. 8000 = 8 seconds).
        SlowConnectionWarningAfterMs = 5000,
    },

    -- For development and support feedback only, do not use.
    Debug = false,
}
