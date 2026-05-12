--[[
    Asset → Pet keys mapping for shop/stock visibility.
    Only pets whose resource (folder) is present will appear in the shop and in the manage/stock panel.
    Keys = shop item key (same as Item in pets.lua / key in shop.lua).

    BUNDLES (from [cdev_assets] peds.meta):
    - cdev_cat_pets: all cats in one pack.
    - cdev_dog_pets: dogs from first pack (rott, dobermann, bully2, chiua, chow, dal, dash, frbull, golden, husky2, mal, minipitt, pitt, poodle, pug, shep, shusky, terrier, york, akita, austshep, bloodhound, engbulldog, bulldogpup).
    - cdev_dog_pets2: dogs from second pack (bichon, dalpup, pup/goldenpup, shepup).

    SINGLE-RESOURCE: one folder = one (or few) pet keys. Use when selling assets separately.
]]
AssetToPets = {
    -- ========== BUNDLES (match peds.meta in each resource) ==========
    ["cdev_cat_pets"] = {
        "pet_amer", "pet_synphix", "pet_turk", "pet_wcoon", "pet_wolf",
        "pet_cat_black", "pet_cat_egyptian", "pet_cat_grey", "pet_cat_siamese", "pet_cat_tricolor",
    },
    ["cdev_dog_pets"] = {
        "pet_dobermann", "pet_chop", "pet_bully", "pet_chiua", "pet_chow", "pet_dal", "pet_dash",
        "pet_frbul", "pet_gold", "pet_husky", "pet_mal", "pet_minpit", "pet_pitt", "pet_poodle",
        "pet_pug", "pet_shep", "pet_shusky", "pet_terrierk", "pet_york",
        "pet_akita", "pet_austshep", "pet_bloodhound", "pet_engbulldog", "pet_bulldogpup",
    },
    ["cdev_dog_pets2"] = {
        "pet_bichon", "pet_dalpup", "pet_goldenpup", "pet_shepup",
    },

    -- ========== SINGLE-RESOURCE ASSETS ==========
    ["cdev_dog_york"] = { "pet_york" },
    ["cdev_dog_terrier"] = { "pet_terrierk" },
    ["cdev_dog_shusky"] = { "pet_shusky" },
    ["cdev_dog_shep"] = { "pet_shep" },
    ["cdev_dog_pitt"] = { "pet_pitt" },
    ["cdev_dog_minipitt"] = { "pet_minpit" },
    ["cdev_dog_mal"] = { "pet_mal" },
    ["cdev_dog_husky2"] = { "pet_husky" },
    ["cdev_dog_golden"] = { "pet_gold" },
    ["cdev_dog_frbull"] = { "pet_frbul" },
    ["cdev_dog_dash"] = { "pet_dash" },
    ["cdev_dog_dal"] = { "pet_dal" },
    ["cdev_dog_chow"] = { "pet_chow" },
    ["cdev_dog_chiua"] = { "pet_chiua" },
    ["cdev_dog_bully2"] = { "pet_bully" },
    ["cdev_dog_dobb"] = { "pet_dobermann" },
    ["cdev_dog_rott"] = { "pet_chop" },
    ["cdev_cat_turk"] = { "pet_turk" },
    ["cdev_cat_synphix"] = { "pet_synphix" },
    ["cdev_cat_wcoon"] = { "pet_wcoon" },
    ["cdev_cat_wolf"] = { "pet_wolf" },
    ["cdev_cat_amer"] = { "pet_amer" },
    ["cdev_dog_poodle"] = { "pet_poodle" },
    ["cdev_dog_akita"] = { "pet_akita" },
    ["cdev_dog_austshep"] = { "pet_austshep" },
    ["cdev_dog_bloodhound"] = { "pet_bloodhound" },
    ["cdev_dog_bulldogpup"] = { "pet_bulldogpup" },
    ["cdev_dog_engbulldog"] = { "pet_engbulldog" },
    ["cdev_dog_bichon"] = { "pet_bichon" },
    ["cdev_dog_dalpup"] = { "pet_dalpup" },
    ["cdev_dog_pup"] = { "pet_goldenpup" },
    ["cdev_dog_shepup"] = { "pet_shepup" },
    ["cdev_cat_black"] = { "pet_cat_black" },
    ["cdev_cat_egyptian"] = { "pet_cat_egyptian" },
    ["cdev_cat_grey"] = { "pet_cat_grey" },
    ["cdev_cat_siamese"] = { "pet_cat_siamese" },
    ["cdev_cat_tricolor"] = { "pet_cat_tricolor" },
    -- ["cdev_animal_capy"] = { "pet_animal_capy" },
    -- ["cdev_animal_lion"] = { "pet_animal_lion" },
    -- ["cdev_animal_puma"] = { "pet_animal_puma" },
    -- ["cdev_animal_tiger"] = { "pet_animal_tiger" },
}
