Config = {}
Config.Locale = "en" -- Supported: EN / SK / CS / DE

-- Czech and Slovak languages by: iceyy4400 (discord id: 1057394957897441380)
-- German Language by: nameitsphil (discord id: 457672439510335498)

Config.Debug = false

-- 15% OFF WITH CODE "NEWCUSTOMER" at https://otherplanet.dev
-- Best Gangs Script for FiveM -> https://otherplanet.dev/product/gangs

Config.AdditionalScripts = {
    op_Gangs = true, -- https://otherplanet.dev/product/gangs
}

Config.LevelCommand = "druglevel" -- Check current player level and boost. Set it to false to disable.

Config.dispatchScript = "cd_dispatch" 
-- Supported:
-- none
-- cd_dispatch 
-- codem_dispatch 
-- lb-tablet 
-- ps-dispatch 
-- origen_police
-- piotreq_gpt
-- rcore_dispatch

Config.CurrencySettings = {
    -- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat
    currency = "USD",
    style = "currency",
    format = "en-US"
}

Config.Misc = {
    AccessMethod = "ox-target", -- Supported: ox-target / qb-target
    Notify = "ox_lib", 
    -- Supported:
    -- op_hud 
    -- okokNotify 
    -- vms_notify 
    -- brutal_notify 
    -- ox_lib 
    -- ESX 
    -- QBCORE 
    -- QBOX
}

Config.CopMultiplier = 1.8
Config.CopsNeededForMultiplier = 6

Config.DirtyMoney = {
    -- This is Dirty Money item name.
    -- It works only for QB/QBOX
    -- ESX Handles dirty money using balance black_money
    itemName = "markedbills"
}

Config.DrugSelling = {
    availableDrugs = {
        -- Create items in your inventory - https://docs.otherplanet.dev
        ["bagofweed"] = {
            itemName = "bagofweed",
            label = "Weed",
            minimumPrice = 100,
            optimalPrice = 150,
            maximumPrice = 250,
            maxAmountPedTransaction = 8,
            handPropName = "prop_weed_bottle",
            icon = "https://data.otherplanet.dev/fivemicons/%5bdrugs%5d/baggy_weed.png",
        },
        ["bagofmeth"] = {
            itemName = "bagofmeth",
            label = "Meth",
            minimumPrice = 175,
            optimalPrice = 250,
            maximumPrice = 300,
            maxAmountPedTransaction = 8,
            handPropName = "p_meth_bag_01_s",
            icon = "https://data.otherplanet.dev/fivemicons/%5bdrugs%5d/baggy_meth.png",
        },
        -- ["bagofcoke"] = {
        --     itemName = "bagofcoke",
        --     label = "Cocaine",
        --     minimumPrice = 175,
        --     optimalPrice = 225,
        --     maximumPrice = 300,
        --     maxAmountPedTransaction = 8,
        --     handPropName = "p_meth_bag_01_s",
        --     icon = "https://data.otherplanet.dev/fivemicons/%5bdrugs%5d/baggy_cocaine.png",
        -- },
        ["ls_plain_jane_bag"] = {
            itemName = "ls_plain_jane_bag",
            label = "Plain Jane Weed",
            minimumPrice = 125,
            optimalPrice = 150,
            maximumPrice = 175,
            maxAmountPedTransaction = 8,
            handPropName = "prop_weed_bottle",
            icon = "https://r2.fivemanage.com/h5xg7GzhtMUaOOpkouu1c/ls_plain_jane_bag.png",
        },
        ["ls_banana_kush_bag"] = {
            itemName = "ls_banana_kush_bag",
            label = "Banana Kush Weed",
            minimumPrice = 150,
            optimalPrice = 175,
            maximumPrice = 200,
            maxAmountPedTransaction = 8,
            handPropName = "prop_weed_bottle",
            icon = "https://r2.fivemanage.com/h5xg7GzhtMUaOOpkouu1c/ls_banana_kush_bag.png",
        },
        ["ls_blue_dream_bag"] = {
            itemName = "ls_blue_dream_bag",
            label = "Blue Dream Weed",
            minimumPrice = 175,
            optimalPrice = 200,
            maximumPrice = 225,
            maxAmountPedTransaction = 8,
            handPropName = "prop_weed_bottle",
            icon = "https://r2.fivemanage.com/h5xg7GzhtMUaOOpkouu1c/ls_blue_dream_bag.png",
        },
        ["ls_purple_haze_bag"] = {
            itemName = "ls_purple_haze_bag",
            label = "Purple Haze Weed",
            minimumPrice = 200,
            optimalPrice = 225,
            maximumPrice = 250,
            maxAmountPedTransaction = 8,
            handPropName = "prop_weed_bottle",
            icon = "https://r2.fivemanage.com/h5xg7GzhtMUaOOpkouu1c/ls_purple_haze_bag.png",
        },
        ["ls_orange_crush_bag"] = {
            itemName = "ls_orange_crush_bag",
            label = "Orange Crush Weed",
            minimumPrice = 225,
            optimalPrice = 250,
            maximumPrice = 275,
            maxAmountPedTransaction = 8,
            handPropName = "prop_weed_bottle",
            icon = "https://r2.fivemanage.com/h5xg7GzhtMUaOOpkouu1c/ls_orange_crush_bag.png",
        },
        ["ls_cosmic_kush_bag"] = {
            itemName = "ls_cosmic_kush_bag",
            label = "Cosmic Kush Weed",
            minimumPrice = 250,
            optimalPrice = 275,
            maximumPrice = 300,
            maxAmountPedTransaction = 8,
            handPropName = "prop_weed_bottle",
            icon = "https://r2.fivemanage.com/h5xg7GzhtMUaOOpkouu1c/ls_cosmic_kush_bag.png",
        },
        ["bagofcoke"] = {
            itemName = "bagofcoke",
            label = "Cocaine",
            minimumPrice = 200,
            optimalPrice = 275,
            maximumPrice = 325,
            maxAmountPedTransaction = 8,
            handPropName = "p_meth_bag_01_s",
            icon = "https://r2.fivemanage.com/h5xg7GzhtMUaOOpkouu1c/ls_cocaine_bag.png",
        },
        ["kq_meth_low"] = {
            itemName = "kq_meth_low",
            label = "Meth (Low Quality)",
            minimumPrice = 175,
            optimalPrice = 200,
            maximumPrice = 225,
            maxAmountPedTransaction = 8,
            handPropName = "p_meth_bag_01_s",
            icon = "https://r2.fivemanage.com/h5xg7GzhtMUaOOpkouu1c/kq_meth_low.png",
        },
        ["kq_meth_mid"] = {
            itemName = "kq_meth_mid",
            label = "Meth (Mid Quality)",
            minimumPrice = 200,
            optimalPrice = 225,
            maximumPrice = 250,
            maxAmountPedTransaction = 8,
            handPropName = "p_meth_bag_01_s",
            icon = "https://r2.fivemanage.com/h5xg7GzhtMUaOOpkouu1c/kq_meth_low.png",
        },
        ["kq_meth_high"] = {
            itemName = "kq_meth_high",
            label = "Meth (High Quality)",
            minimumPrice = 225,
            optimalPrice = 255,
            maximumPrice = 275,
            maxAmountPedTransaction = 8,
            handPropName = "p_meth_bag_01_s",
            icon = "https://r2.fivemanage.com/h5xg7GzhtMUaOOpkouu1c/kq_meth_high.png",
        },
        ["oxy"] = {
            itemName = "oxy",
            label = "Oxy",
            minimumPrice = 100,
            optimalPrice = 125,
            maximumPrice = 200,
            maxAmountPedTransaction = 8,
            handPropName = "prop_weed_bottle",
            icon = "https://data.otherplanet.dev/fivemicons/%5bems%5d/oxy.png",
        },
        ["purebagofweed"] = {
            itemName = "purebagofweed",
            label = "Pure Weed",
            minimumPrice = 150,
            optimalPrice = 200,
            maximumPrice = 300,
            maxAmountPedTransaction = 8,
            handPropName = "prop_weed_bottle",
            icon = "https://data.otherplanet.dev/fivemicons/%5bdrugs%5d/baggy_weed.png",
        },
        ["purebagofmeth"] = {
            itemName = "purebagofmeth",
            label = "Pure Meth",
            minimumPrice = 225,
            optimalPrice = 300,
            maximumPrice = 350,
            maxAmountPedTransaction = 8,
            handPropName = "p_meth_bag_01_s",
            icon = "https://data.otherplanet.dev/fivemicons/%5bdrugs%5d/baggy_meth.png",
        },
        ["purebagofcoke"] = {
            itemName = "purebagofcoke",
            label = "Pure Cocaine",
            minimumPrice = 225,
            optimalPrice = 275,
            maximumPrice = 350,
            maxAmountPedTransaction = 8,
            handPropName = "p_meth_bag_01_s",
            icon = "https://data.otherplanet.dev/fivemicons/%5bdrugs%5d/baggy_cocaine.png",
        }
    },
    dispatchCallChance = 15, -- 15% Chance that after transaction dispatch will be called.
    blipData = {
        -- Dispatch Blips Data
        sprite = 51, -- Blip sprite
        color = 1, -- Blip color
    }
}

Config.CornerDealing = {
    Enable = true, 
    SellTimeout = 120, -- Time in second after which next ped will be spawned In Corner Mode.
    Command = "startselling",
    Zones = {
        {center = vec3(1708.08, 3292.83, 41.15), distance=300.0}, -- Sandy Airfield
        {center = vec3(1722.79, -1671.02, 112.57), distance=300.0}, -- El Burro Heights
        {center = vec3(285.66, 2636.25, 44.67), distance=300.0}, -- Harmony
        {center = vec3(960.38, 3601.47, 33.23), distance=300.0}, --Alamo Beach
        {center = vec3(2569.96, 4724.73, 33.69), distance=400.0}, --Grapeseed/South Grapeseed
        {center = vec3(2389.45, 3107.45, 48.15), distance=300.0}, -- Grand Senora Desert
        {center = vec3(-689.64, 5781.78, 17.33), distance=300.0}, -- Paleto Forest
        {center = vec3(1470.78, 6365.62, 23.71), distance=300.0}, -- Procopio Beach
        {center = vec3(-523.09, 662.53, 140.65), distance=300.0}, -- Vinewood Hills East/West
        {center = vec3(180.29, -2632.02, 5.99), distance=300.0}, -- Elysian Island
    }
}

Config.Leveling = {
    Enable = true,
    LevelEXP = 5000, -- One level == 500 exp.
    LevelsList = {
        [1] = 1, -- 1% Boost for level.
        [2] = 2, -- 2% Boost for level.
        [3] = 3, -- 3% Boost for level.
        [4] = 4, -- 4% Boost for level.
        [5] = 5, -- 5% Boost for level.
    }
}

Config.PedTypes = {
    ['addicted'] = {
        label = "Addicted",
        saleEXP = 5, -- EXP per Sale.
        stealDrugChance = 10, -- Chance that ped will steal your drugs!
        buyChance = 90, -- Range 0-100
        refuseChance = 0, -- Range 0-100 (This is refuse without even open of drug dealing menu)
        dispatchCall = false, -- Can this type of ped call dispatch
        colors = {
            -- Label Box next to ped Name.
            border = "#8400ff",
            background = "#8400ff8c"
        }
    },
    ['normal'] = {
        label = "Normal",
        saleEXP = 25, -- EXP per Sale.
        stealDrugChance = 5, -- Chance that ped will steal your drugs!
        buyChance = 80, -- Range 0-100
        refuseChance = 1, -- Range 0-100 (This is refuse without even open of drug dealing menu)
        dispatchCall = true, -- Can this type of ped call dispatch
        colors = {
            -- Label Box next to ped Name.
            border = "#00ccffff",
            background = "#00aeff8c"
        }
    },
    ['party'] = {
        label = "Party",
        saleEXP = 15, -- EXP per Sale.
        stealDrugChance = 5, -- Chance that ped will steal your drugs!
        buyChance = 85, -- Range 0-100
        refuseChance = 1, -- Range 0-100 (This is refuse without even open of drug dealing menu)
        dispatchCall = true, -- Can this type of ped call dispatch
        colors = {
            -- Label Box next to ped Name.
            border = "#ffa600ff",
            background = "#ffbb008c"
        }
    },
    ['snitch'] = {
        label = "Snitch",
        saleEXP = 40,
        stealDrugChance = 0, -- nie kradnie
        buyChance = 20, -- bardzo rzadko kupuje
        refuseChance = 5, -- często od razu odmawia
        dispatchCall = true, -- zawsze duże ryzyko wzywania policji
        colors = {
            border = "#ff0000",
            background = "#ff00008c"
        }
    },
    ['dealer'] = {
        label = "Street Dealer",
        saleEXP = 30,
        stealDrugChance = 5, -- może spróbować cię ograć
        buyChance = 60, -- kupi, ale w większych ilościach
        refuseChance = 2,
        dispatchCall = false, -- nie wzywa psów, bo sam kręci biznes
        colors = {
            border = "#00ff00",
            background = "#00ff008c"
        }
    },
    ['rich'] = {
        label = "Rich Guy",
        saleEXP = 10,
        stealDrugChance = 0,
        buyChance = 90, -- prawie zawsze kupuje
        refuseChance = 0,
        dispatchCall = true, -- czasami zadzwoni, jak się przestraszy
        colors = {
            border = "#ffd700",
            background = "#ffd7008c"
        }
    },
    ['junkie'] = {
        label = "Junkie",
        saleEXP = 5,
        stealDrugChance = 20, -- mega ryzyko kradzieży
        buyChance = 70,
        refuseChance = 5,
        dispatchCall = false, -- nie ogarnia policji
        colors = {
            border = "#8b4513",
            background = "#8b45138c"
        }
    },
    ['undercover'] = {
        label = "Undercover Cop",
        saleEXP = 50,
        stealDrugChance = 0,
        buyChance = 30, -- udaje że kupuje
        refuseChance = 0,
        dispatchCall = true, -- 100% szansa że poleci dispatch
        colors = {
            border = "#2121c4ff",
            background = "#0404ff69"
        }
    },
}

Config.PedsList = {
    -- Other Peds Not Listed Here will be handled like Normal Ped Type.
    -- [Addicted Peds]
    [`a_f_m_skidrow_01`] = 'addicted',
    [`g_m_y_ballasout_01`] = 'addicted',
    [`g_m_y_ballaeast_01`] = 'addicted',
    [`g_m_y_famca_01`] = 'addicted',
    [`g_m_y_famdnf_01`] = 'addicted',
    [`g_m_y_mexgoon_03`] = 'addicted',
    [`g_m_y_pologoon_01`] = 'addicted',
    [`g_m_y_pologoon_02`] = 'addicted',
    [`g_m_y_salvagoon_01`] = 'addicted',
    [`g_m_y_salvagoon_03`] = 'addicted',
    [`g_m_y_strpunk_01`] = 'addicted',

    -- [Party Peds]
    [`a_m_y_hipster_01`] = 'party',
    [`a_f_y_clubcust_01`] = 'party',
    [`a_m_y_clubcust_01`] = 'party',
    [`a_f_y_clubcust_02`] = 'party',
    [`a_m_y_clubcust_02`] = 'party',
    [`a_m_y_clubcust_03`] = 'party',
    [`csb_ramp_hipster`] = 'party',
    [`csb_ramp_mex`] = 'party',

    -- [Snitch Peds]
    [`a_m_m_business_01`] = 'snitch',
    [`a_m_m_eastsa_02`] = 'snitch',
    [`a_f_y_business_01`] = 'snitch',
    [`a_f_y_business_02`] = 'snitch',
    [`csb_reporter`] = 'snitch',

    -- [Dealer Peds]
    [`g_m_y_ballaorig_01`] = 'dealer',
    [`g_m_y_mexgang_01`] = 'dealer',
    [`g_m_y_mexgoon_01`] = 'dealer',
    [`g_m_y_famfor_01`] = 'dealer',
    [`g_m_y_strpunk_02`] = 'dealer',

    -- [Rich Peds]
    [`a_m_m_soucent_01`] = 'rich',
    [`a_m_y_bevhills_01`] = 'rich',
    [`a_f_y_bevhills_01`] = 'rich',
    [`a_f_y_bevhills_02`] = 'rich',
    [`u_m_y_imporage`] = 'rich',
    [`u_m_y_party_01`] = 'rich',

    -- [Junkie Peds]
    [`a_m_y_skater_01`] = 'junkie',
    [`a_m_y_skater_02`] = 'junkie',
    [`a_m_m_tramp_01`] = 'junkie',
    [`a_f_m_tramp_01`] = 'junkie',
    [`a_m_m_trampbeac_01`] = 'junkie',
    [`a_m_m_trampbeac_02`] = 'junkie',
    [`u_m_y_staggrm_01`] = 'junkie',

    -- [Undercover Cop Peds]
    [`s_m_m_ciasec_01`] = 'undercover',
    [`s_m_m_highsec_01`] = 'undercover',
    [`s_m_m_highsec_02`] = 'undercover',
    [`s_m_y_cop_01`] = 'undercover',
    [`csb_undercover`] = 'undercover'
}


-- Black list peds
Config.BlackListPeds = {
    [`a_m_m_skidrow_01`] = true,
    [`mp_m_shopkeep_01`] = true,
    [`s_m_y_ammucity_01`] = true,
    [`a_m_y_business_03`] = true,
    [`s_m_y_casino_01`] = true,
    [`s_m_m_doctor_01`] = true,
    [`u_m_m_willyfist`] = true,
    [`ig_terry`] = true,
    [`ig_ashley`] = true,
    [`S_M_Y_Casino_01`] = true,
    [`S_F_Y_Casino_01`] = true,
    [`u_f_m_casinocash_01`] = true,
    [`U_M_Y_BurgerDrug_01`] = true,
    [`S_M_Y_Chef_01`] = true,
    [`CSB_Stripper_02`] = true,
    [`A_F_Y_Hipster_02`] = true,
    [`S_M_M_AmmuCountry`] = true,
    [`a_m_y_business_02`] = true,
    [`a_m_y_bevhills_02`] = true,
    [`a_m_m_og_boss_01`] = true,
    [`cs_stevehains`] = true,
    [`s_m_m_armoured_01`] = true,
    [`s_m_y_casino_01`] = true,
    [`cs_molly`] = true,
    [`s_m_y_dealer_01`] = true,
    [`s_m_m_highsec_01`] = true,
    [`s_m_m_highsec_02`] = true,
    [`s_m_m_fiboffice_02`] = true,
    [`a_m_m_tramp_01`] = true,
    [`g_m_y_armgoon_02`] = true,
    [`s_m_y_armymech_01`] = true,
    [`s_m_y_shop_mask`] = true,
    [`player_two`] = true,
    [`mp_f_meth_01`] = true,
    [`s_m_m_scientist_01`] = true,  
    [`a_m_m_mlcrisis_01`] = true,
    [`hc_hacker`] = true,
    [`G_M_M_ChemWork_01`] = true,
    [`a_f_y_fitness_01`] = true,
    [`cs_barry`] = true,
    [`a_m_y_genstreet_01`] = true,
    [`s_m_m_prisguard_01`] = true,
    [`cs_guadalope`] = true,
    [`s_m_y_prismuscl_01`] = true,
    [`a_m_m_farmer_01`] = true,
    [`cs_mrsphillips`] = true,
    [`a_c_boar`] = true,
    [`a_c_cat_01`] = true,
    [`a_c_chickenhawk`] = true,
    [`a_c_chickenhawk_01`] = true,
    [`a_c_chimp`] = true,
    [`a_c_chop`] = true,
    [`a_c_cormorant`] = true,
    [`a_c_cow`] = true,
    [`a_c_coyote`] = true,
    [`a_c_crow`] = true,
    [`a_c_deer`] = true,
    [`a_c_dolphin`] = true,
    [`a_c_fish`] = true,
    [`a_c_hen`] = true,
    [`a_c_humpback`] = true,
    [`a_c_husky`] = true,
    [`a_c_killerwhale`] = true,
    [`a_c_mtlion`] = true,
    [`a_c_pig`] = true,
    [`a_c_pigeon`] = true,
    [`a_c_poodle`] = true,
    [`a_c_pug`] = true,
    [`a_c_rabbit_01`] = true,
    [`a_c_rat`] = true,
    [`a_c_retriever`] = true,
    [`a_c_rhesus`] = true,
    [`a_c_rottweiler`] = true,
    [`a_c_seagull`] = true,
    [`a_c_sharkhammer`] = true,
    [`a_c_sharktiger`] = true,
    [`a_c_shepherd`] = true,
    [`a_c_stingray`] = true,
    [`a_c_westy`] = true,
    [`cdev_dog_york`] = true,
    [`cdev_dog_terrier`] = true,
    [`cdev_dog_shusky`] = true,
    [`cdev_dog_shep`] = true,
    [`cdev_dog_pitt`] = true,
    [`cdev_dog_minipitt`] = true,
    [`cdev_dog_mal`] = true,
    [`cdev_dog_husky2`] = true,
    [`cdev_dog_golden`] = true,
    [`cdev_dog_frbull`] = true,
    [`cdev_dog_dash`] = true,
    [`cdev_dog_dal`] = true,
    [`cdev_dog_chow`] = true,
    [`cdev_dog_chiua`] = true,
    [`cdev_dog_bully2`] = true,
    [`cdev_dog_dobb`] = true,
    [`cdev_dog_rott`] = true,
    [`cdev_dog_poodle`] = true,
    [`cdev_dog_akita`] = true,
    [`cdev_dog_austshep`] = true,
    [`cdev_dog_bloodhound`] = true,
    [`cdev_dog_bulldogpup`] = true,
    [`cdev_dog_engbulldog`] = true,
    [`cdev_dog_bichon`] = true,
    [`cdev_dog_dalpup`] = true,
    [`cdev_dog_pup`] = true,
    [`cdev_dog_shepup`] = true,
    [`cdev_cat_turk`] = true,
    [`cdev_cat_synphix`] = true,
    [`cdev_cat_wcoon`] = true,
    [`cdev_cat_wolf`] = true,
    [`cdev_cat_amer`] = true,
    [`cdev_cat_black`] = true,
    [`cdev_cat_egyptian`] = true,
    [`cdev_cat_grey`] = true,
    [`cdev_cat_siamese`] = true,
    [`cdev_cat_tricolor`] = true,
    [`g_m_y_mexgang_01`] = true,
    [`s_f_m_maid_01`] = true,
    [`s_m_y_valet_01`] = true,
    [`a_m_o_ktown_01`] = true,
    [`ig_drfriedlander`] = true,
    [`u_m_y_pogo_01`] = true,
    [`A_F_Y_Beach_02`] = true,
    [`u_m_y_rsranger_01`] = true,
    [`s_m_m_lathandy_01`] = true,
}
