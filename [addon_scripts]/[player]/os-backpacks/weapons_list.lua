ItemsList = {}
GetList = ItemsList



--- You can add your own weapons and stuff in here
ItemsList.smallWeapons = {
    -- Pistols
    "WEAPON_PISTOL", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL", "WEAPON_PISTOL50",
    "WEAPON_SNSPISTOL", "WEAPON_HEAVYPISTOL", "WEAPON_VINTAGEPISTOL", "WEAPON_MARKSMANPISTOL",
    "WEAPON_REVOLVER", "WEAPON_DOUBLEACTION", "WEAPON_CERAMICPISTOL", "WEAPON_NAVYREVOLVER",

    -- Small SMGs
    "WEAPON_MICROSMG", "WEAPON_MINISMG", "WEAPON_MACHINEPISTOL",

    -- Light melee
    "WEAPON_KNIFE", "WEAPON_SWITCHBLADE", "WEAPON_DAGGER", "WEAPON_KNUCKLE", "WEAPON_BOTTLE",
    "WEAPON_FLASHLIGHT", "WEAPON_WRENCH",
    
    "ammo-22", "ammo-38", "ammo-44", "ammo-45", "ammo-50", "ammo-9", "ammo-firework", 
    "ammo-flare", "ammo-grenade", "ammo-heavysniper", "ammo-laser", "ammo-musket", "ammo-railgun", 
    "ammo-rifle", "ammo-rifle2", "ammo-rocket", "ammo-shotgun", "ammo-sniper", "ammo-emp"
}

-- Medium Weapons
ItemsList.mediumWeapons = {
    -- Larger melee weapons
    "WEAPON_BAT", "WEAPON_CROWBAR", "WEAPON_GOLFCLUB", "WEAPON_HAMMER", "WEAPON_POOLCUE",
    "WEAPON_HATCHET", "WEAPON_MACHETE", "WEAPON_BATTLEAXE", "WEAPON_STONE_HATCHET",

    -- Standard SMGs
    "WEAPON_SMG", "WEAPON_ASSAULTSMG", "WEAPON_COMBATPDW",

    -- Shotguns
    "WEAPON_PUMPSHOTGUN", "WEAPON_SAWNOFFSHOTGUN", "WEAPON_BULLPUPSHOTGUN",
    "WEAPON_ASSAULTSHOTGUN", "WEAPON_HEAVYSHOTGUN", "WEAPON_DBSHOTGUN", "WEAPON_AUTOSHOTGUN",
    "WEAPON_MUSKET",

    "ammo-22", "ammo-38", "ammo-44", "ammo-45", "ammo-50", "ammo-9", "ammo-firework", 
    "ammo-flare", "ammo-grenade", "ammo-heavysniper", "ammo-laser", "ammo-musket", "ammo-railgun", 
    "ammo-rifle", "ammo-rifle2", "ammo-rocket", "ammo-shotgun", "ammo-sniper", "ammo-emp"
}

-- Main Block List
ItemsList.largeWeapons = {

    -- Assault Rifles / Carbines
    "WEAPON_ASSAULTRIFLE", "WEAPON_CARBINERIFLE", "WEAPON_ADVANCEDRIFLE",
    "WEAPON_SPECIALCARBINE", "WEAPON_BULLPUPRIFLE", "WEAPON_COMPACTRIFLE",
    "WEAPON_MILITARYRIFLE", "WEAPON_HEAVYRIFLE", "WEAPON_TACTICALRIFLE",
    "WEAPON_BATTLERIFLE",
    "WEAPON_ASSAULTRIFLE_MK2", "WEAPON_CARBINERIFLE_MK2",
    "WEAPON_SPECIALCARBINE_MK2", "WEAPON_BULLPUPRIFLE_MK2",

    -- SMGs / PDWs
    "WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_ASSAULTSMG",
    "WEAPON_MACHINEPISTOL", "WEAPON_MINISMG",
    "WEAPON_COMBATPDW", "WEAPON_TECPISTOL",
    "WEAPON_SMG_MK2",

    -- Shotguns
    "WEAPON_PUMPSHOTGUN", "WEAPON_SAWNOFFSHOTGUN",
    "WEAPON_ASSAULTSHOTGUN", "WEAPON_BULLPUPSHOTGUN",
    "WEAPON_HEAVYSHOTGUN", "WEAPON_DBSHOTGUN",
    "WEAPON_AUTOSHOTGUN", "WEAPON_COMBATSHOTGUN",
    "WEAPON_PUMPSHOTGUN_MK2",

    -- Snipers / Marksman
    "WEAPON_SNIPERRIFLE", "WEAPON_HEAVYSNIPER",
    "WEAPON_HEAVYSNIPER_MK2", "WEAPON_MARKSMANRIFLE",
    "WEAPON_MARKSMANRIFLE_MK2", "WEAPON_PRECISIONRIFLE",
    "WEAPON_HUNTINGRIFLE",

    -- LMGs
    "WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_GUSENBERG",
    "WEAPON_COMBATMG_MK2",

    -- Heavy / Explosives
    "WEAPON_RPG", "WEAPON_GRENADELAUNCHER",
    "WEAPON_MINIGUN", "WEAPON_COMPACTLAUNCHER",
    "WEAPON_EMPLAUNCHER", "WEAPON_SNOWLAUNCHER",

    -- Melee (Large)
    "WEAPON_BAT", "WEAPON_GOLFCLUB", "WEAPON_CROWBAR",
    "WEAPON_BATTLEAXE", "WEAPON_POOLCUE",
    "WEAPON_SLEDGEHAMMER", "WEAPON_CANDYAXE",
    "WEAPON_GLOW_BAT",

    -- Melee (Custom / Swords)
    "WEAPON_KATANA", "WEAPON_KATANA2", "WEAPON_KATANA3",
    "WEAPON_KATANA4", "WEAPON_EASTERKATANA",
    "WEAPON_EASTERSICKLE",

    -- Tools / Misc Large
    "WEAPON_NIGHTSTICK", "WEAPON_HAZARDCAN",
    "WEAPON_METALDETECTOR", "WEAPON_STICKEGG",
    "WEAPON_BEANBAGSHOTGUN", "WEAPON_WATERGUN",
    "WEAPON_BLOWUP_HAMMER", "WEAPON_POOLNOODLE",
    "WEAPON_CANDY_CANE", "WEAPON_APPLE_CANDYCANE",

    -- Hobo / Props (Large)
    "WEAPON_HOBO_TOILET", "WEAPON_HOBO_STICK",
    "WEAPON_HOBO_MOP", "WEAPON_HOBO_REBAR",
    "WEAPON_HOBO_PLANK", "WEAPON_HOBO_OLDMACHETE",
    "WEAPON_HOBO_RATSTICK", "WEAPON_HOBO_PIPE",

    -- Custom Rifles / Weapons
    "WEAPON_MCXSPEAR", "WEAPON_RFB", "WEAPON_NSR9",
    "WEAPON_SA80", "WEAPON_MUTANT_LONG",
    "WEAPON_VIRTUS_4", "WEAPON_MK18",
    "WEAPON_PROJECTX", "WEAPON_PROJECTXSMG",
    "WEAPON_ARCTIC516", "WEAPON_AGC",
    "WEAPON_KVR", "WEAPON_PM4", "WEAPON_C36",
    "WEAPON_2S", "WEAPON_590", "WEAPON_MI9",
    "WEAPON_MB47",

    -- Police / Tactical Weapons
    "WEAPON_PDPT870", "WEAPON_PDPT700",
    "WEAPON_MK417", "WEAPON_PDDT607",
    "WEAPON_PDDT7", "WEAPON_PDBR5",
    "WEAPON_PDMK33",

    -- Misc Weapons
    "WEAPON_DOUBLEACTION", "WEAPON_MUSKET",
    "WEAPON_PETROLCAN", "WEAPON_TARANTULA",
    "WEAPON_FMICRODRAGON", "WEAPON_PSTRIKEH",
    "WEAPON_PSPIKE", "WEAPON_PH4",
    "WEAPON_PT39", "WEAPON_PCM4A1",
    "WEAPON_PMK40H1",

    -- Backpacks / Items
    "backpack",  "backpack2",  "backpack3",  "backpack4", 
     "backpack5",  "backpack6",  "backpack7",  "backpack8", 
      "backpack9",  "backpack10"

}

-- Throwables
ItemsList.throwables = {
    "WEAPON_GRENADE", "WEAPON_BZGAS", "WEAPON_MOLOTOV", "WEAPON_STICKYBOMB",
    "WEAPON_PROXMINE", "WEAPON_SNOWBALL", "WEAPON_PIPEBOMB", "WEAPON_BALL",
    "WEAPON_SMOKEGRENADE", "WEAPON_FLARE",

    "ammo-22", "ammo-38", "ammo-44", "ammo-45", "ammo-50", "ammo-9", "ammo-firework", 
    "ammo-flare", "ammo-grenade", "ammo-heavysniper", "ammo-laser", "ammo-musket", "ammo-railgun", 
    "ammo-rifle", "ammo-rifle2", "ammo-rocket", "ammo-shotgun", "ammo-sniper", "ammo-emp"
}

-- Utility / Misc
ItemsList.utilityWeapons = {
    "WEAPON_PETROLCAN", "WEAPON_FIREEXTINGUISHER", "WEAPON_DIGISCANNER",
    "WEAPON_HAZARDCAN", "WEAPON_FERTILIZERCAN",

    "ammo-22", "ammo-38", "ammo-44", "ammo-45", "ammo-50", "ammo-9", "ammo-firework", 
    "ammo-flare", "ammo-grenade", "ammo-heavysniper", "ammo-laser", "ammo-musket", "ammo-railgun", 
    "ammo-rifle", "ammo-rifle2", "ammo-rocket", "ammo-shotgun", "ammo-sniper", "ammo-emp"
}

ItemsList.thrownWeapons = {
    "WEAPON_GRENADE",
    "WEAPON_BZGAS",
    "WEAPON_MOLOTOV",
    "WEAPON_STICKYBOMB",
    "WEAPON_PROXMINE",
    "WEAPON_SNOWBALL",
    "WEAPON_PIPEBOMB",
    "WEAPON_BALL",
    "WEAPON_SMOKEGRENADE",
    "WEAPON_FLARE",

    "ammo-22", "ammo-38", "ammo-44", "ammo-45", "ammo-50", "ammo-9", "ammo-firework", 
    "ammo-flare", "ammo-grenade", "ammo-heavysniper", "ammo-laser", "ammo-musket", "ammo-railgun", 
    "ammo-rifle", "ammo-rifle2", "ammo-rocket", "ammo-shotgun", "ammo-sniper", "ammo-emp"
}

ItemsList.handguns = {
    "WEAPON_PISTOL",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_PISTOL50",
    "WEAPON_SNSPISTOL",
    "WEAPON_HEAVYPISTOL",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_MARKSMANPISTOL",
    "WEAPON_REVOLVER",
    "WEAPON_DOUBLEACTION",
    "WEAPON_CERAMICPISTOL",
    "WEAPON_NAVYREVOLVER",

    "ammo-22", "ammo-38", "ammo-44", "ammo-45", "ammo-50", "ammo-9", "ammo-firework", 
    "ammo-flare", "ammo-grenade", "ammo-heavysniper", "ammo-laser", "ammo-musket", "ammo-railgun", 
    "ammo-rifle", "ammo-rifle2", "ammo-rocket", "ammo-shotgun", "ammo-sniper", "ammo-emp"
}

local function mergeTables(...)
    local merged = {}
    for i = 1, select("#", ...) do
        local tbl = select(i, ...)
        for _, v in ipairs(tbl) do
            table.insert(merged, v)
        end
    end
    return merged
end

ItemsList.AllWeapons = mergeTables(
    ItemsList.smallWeapons,
    ItemsList.mediumWeapons,
    ItemsList.largeWeapons,
    ItemsList.throwables,
    ItemsList.utilityWeapons,
    ItemsList.thrownWeapons,
    ItemsList.handguns
)