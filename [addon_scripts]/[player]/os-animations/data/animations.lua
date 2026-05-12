-- animatios when weapon is unholstered and holstered.
local info = {}

weapons = {
    `WEAPON_PISTOL`,
    `WEAPON_PISTOL_MK2`,
    `WEAPON_COMBATPISTOL`,
    `WEAPON_APPISTOL`,
    `WEAPON_PISTOL50`,
    `WEAPON_REVOLVER`,
    `WEAPON_SNSPISTOL`,
    `WEAPON_HEAVYPISTOL`,
    `WEAPON_VINTAGEPISTOL`,
    `weapon_stungun`,
    `weapon_marksmanpistol`,      
    `weapon_revolver`,       
    `weapon_revolver_mk2`,
    `weapon_2011`,
    `weapon_de`,
    `weapon_fnx45`,
    `weapon_glock17`,
    `weapon_m9`,
    `weapon_m1911`,
    `weapon_glock18c`,
    `weapon_p5`,
    `weapon_mrevolver`,
    `WEAPON_PROJECTXPISTOL`,
    `WEAPON_M320b`,
    `weapon_x19`,
    `weapon_gang1`,
    `weapon_gang2`,
    `weapon_gang3`,
    `weapon_gang4`,
    `weapon_gang5`,
    `weapon_gang6`,
    `weapon_gang7`,
    `weapon_gang8`,
    `weapon_gang9`,
    `weapon_gang10`,
    `WEAPON_EASTERAP`,
    `WEAPON_EASTERSEMI`,
    `weapon_x17`,
    `weapon_g19xcustom`,
    `weapon_glock22`,
    `weapon_g17g5mos`,
    `weapon_g26switchp`,
    `weapon_cg17p80s`,
    `weapon_glock41`,
    `WEAPON_A45`,
    `weapon_g19xblack`,
    `WEAPON_NERFAP`,
    `WEAPON_RATREV`,
    `WEAPON_PT39`,
    `WEAPON_P1911KT`,
    `WEAPON_PT19`,
    `WEAPON_PPH120`,
    `WEAPON_PXS9`,
    `WEAPON_PT17`,
    `WEAPON_PHW45`,
    `WEAPON_PPH350`,
    `WEAPON_BTASER`,
    `WEAPON_YTASER`,
    `WEAPON_PDT19`,
    `WEAPON_PDT22`,
    `WEAPON_PDFC66`,
    `WEAPON_PDMK45`,
    `WEAPON_PDMKUSP`,
}

info.animations = {
    mele = {
        holster = { dict = "melee@holster", clip = "holster", duration = 200 },
        unholster = { dict = "melee@holster", clip = "unholster", duration = 200 }
    },
    gang = {
        holster = { dict = "reaction@intimidation@1h", clip = "outro", duration = 800 },
        unholster = { dict = "reaction@intimidation@1h", clip = "intro", duration = 900 }
    },
    police = {
        holster = { dict = "reaction@intimidation@cop@unarmed", clip = "intro", duration = 400, clothing = 300 },
        unholster = { dict = "rcmjosh4", clip = "josh_leadout_cop2", duration = 300, clothing = 0, cancel = true }
    }
}

-- default anim for weapons not found in groups, weapons, or clothing.
info.default = "gang"

-- weapon groups can be found here: https://docs.fivem.net/natives/?_0xC3287EE3050FB74C
info.weaponGroups = {
    [`GROUP_MELEE`] = "mele",
    [`GROUP_PISTOL`] = "gang",
}

-- If you add a weapon here it will ignore the animation on it's group and instead play a specific animation set here.
info.weapons = {
    -- [`WEAPON_STUNGUN`] = "police",
    [`WEAPON_SWITCHBLADE`] = false, -- setting to false will not play any anim and instead use the in game default.
    [`WEAPON_KNUCKLE`] = {
        holster = { dict = "reaction@intimidation@cop@unarmed", clip = "intro", duration = 400 },
        unholster = { dict = "rcmjosh4", clip = "josh_leadout_cop2", duration = 300 }
    }
}

-- if wearing specific clothing such as a holster then everything else ignored and that anim is used.
info.clothing = {
    holster = {
        {
            anim = "police",
            weapons = weapons,
            variation = 7,
            male = {179,181,183,185,187,189,191,193,195,197,199,201,203,205,207,209,211.213},
            female = {149,151,153,155,159,161,163,165}
        }
    },
    unholster = {
        {
            anim = "police",
            weapons = weapons,
            variation = 7,
            male = {178,180,182,184,186,188,190,192,194,196,198,200,202,204,206,208,210,212},
            female = {148,150,152,154,158,160,162,164}
        }
    }
}

return info
