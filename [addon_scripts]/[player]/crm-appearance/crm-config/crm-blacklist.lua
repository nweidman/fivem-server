local crm_blacklist = {
    ['crm-charcreator'] = {},
}

crm_blacklist['crm-charcreator'] = {
    -- Blacklist/Whitelist for male.
 ['crm-male'] = {
        ['crm-peds'] = {
            {crm_models = {"ig_cornwood"}, crm_identifiers = {"LBX33433"}},  --Chubbs McGraw -- Only show for player with Specific Identifier. 
            {crm_models = {"pw_roscoe"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"pw_andreas"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"pw_hao"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"pw_jiwon"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"sl_fatcop_01"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"ft-aushep"}, crm_identifiers = {"TLYXP32U"}}, 
            {crm_models = {"ft-bloodhound"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"pw_hendry"}, crm_identifiers = {"FLS79822"}}, --Gilbert Jordan
            {crm_models = {"ma_mizo"}, crm_identifiers = {"ZEW3ABAU"}}, --Omar Sicilian
            {crm_models = {"ft-groe"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"ft-pterrier"}, crm_identifiers = {"VTJ68226", "Z0541V35"}}, --Gz, Bear K9
            {crm_models = {"max"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"ft-pandags"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"pw_george"}, crm_identifiers = {"VND08140"}}, --Paradox
            {crm_models = {"misscandy"}, crm_identifiers = {"TCV677CD", "XWW50789"}}, --chann, Miss Candy
            {crm_models = {"ft-amakita"}, crm_identifiers = {"HUP47969", "NBJ01855", "X37LQOGR"}}, --Conk Von Slay, Athena
            {crm_models = {"ft_dshepherd"}, crm_identifiers = {"WP99832G"}}, -- Gator K9
            {crm_models = {"a_c_aussiepup"}, crm_identifiers = {"TRJ27179"}}, --Sora Whisky
            {crm_models = {"s_m_m_gaffer_01"}, crm_identifiers = {"CEL94301"}}, --Falaichte
            {crm_models = {"a_m_y_methhead_01"}, crm_identifiers = {"LYP69641"}}, --Dalton Conner
            {crm_models = {"pw_carter80"}, crm_identifiers = {"XWW50789", "DFO40215"}}, --Damon
            {crm_model =  {'hm_justin'}, crm_identifiers = {"CID"}}, --notred.69
            {crm_models = {"pw_andreas80"}, crm_identifiers = {"WZS93831", "LD06R643"}}, --Jerome Williams, Jimmy Biggs
            {crm_models = {"tstudio_alvarg_eltuerto"}, crm_identifiers = {"JAODD35I"}}, --Draco Santana
            {crm_models = {"roy_ruckus"}, crm_identifiers = {"G6VGMY2R"}}, --Roy Ruckus
            {crm_models = {"John_Woody"}, crm_identifiers = {"VR210Q5X"}}, --John Woody

            -- Animals
            {crm_models = {"k9dog"}, crm_identifiers = {"FGQ18595", "XRY59425", "YWA88765", "CQE62105", "CNK46130", "IGR56136", "XMG45626", "Z0541V35"}},
            {crm_models = {"bugk9"}, crm_identifiers = {"PYB91YBL", "K5G88A37", "VKB42W05", "I38TH293"}}, -- Kalista, Pepper, Chawa, Athena
            {crm_models = {"bughusky"}, crm_identifiers = {"NV818618"}}, --Chance
            {crm_models = {"a_c_husky"}, crm_identifiers = {"TTC65791"}}, --Youth_GamR
            {crm_models = {"racoon_new"}, crm_identifiers = {"GIU55500"}}, --Josie
            {crm_models = {"ft-dobermanv2"}, crm_identifiers = {"ACR0S259"}}, --Rook K9
            {crm_models = {"bugdoberman"}, crm_identifiers = {"TLYXP32U", "L6P6ERP5"}}, --Fish K9
            {crm_models = {"a_c_dalmatian"}, crm_identifiers = {"CID"}},
            {crm_models = {"golden_r"}, crm_identifiers = {"BXNXWZZ5"}}, --Cookie K9

        }, -- Peds
        ['crm-hair'] = {}, -- Hair
        ['crm-facial'] = {}, -- Facial Hair
        ['crm-chest'] = {}, -- Chest Hair
        ['crm-eyebrows'] = {}, -- Eyebrows
        ['crm-makeup'] = {}, -- Makeup
        ['crm-blush'] = {}, -- Blush
        ['crm-lipstick'] = {}, -- Lipstick
        ['crm-clothing-0'] = {}, -- Heads
        ['crm-clothing-1'] = {}, -- Masks
        ['crm-clothing-3'] = {}, -- Hands
        ['crm-clothing-4'] = {}, -- Legs
        ['crm-clothing-5'] = {}, -- Bags and Parachutes
        ['crm-clothing-6'] = {}, -- Shoes
        ['crm-clothing-7'] = {}, -- Accessories
        ['crm-clothing-8'] = {}, -- Undershirts
        ['crm-clothing-9'] = {}, -- Body Armors
        ['crm-clothing-10'] = {}, -- Decals
        ['crm-clothing-11'] = {}, -- Tops/Torsos
        ['crm-accessories-0'] = {}, -- Hats
        ['crm-accessories-1'] = {}, -- Glasses
        ['crm-accessories-2'] = {}, -- Ears
        ['crm-accessories-6'] = {}, -- Watches
        ['crm-accessories-7'] = {}, -- Bracelets
    },
    -- Blacklist/Whitelist for female.
    ['crm-female'] = {
        ['crm-peds'] = {
            {crm_models = {"ig_cornwood"}, crm_identifiers = {"LBX33433"}},  --Chubbs McGraw -- Only show for player with Specific Identifier. 
            {crm_models = {"pw_roscoe"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"pw_andreas"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"pw_hao"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"pw_jiwon"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"sl_fatcop_01"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"ft-aushep"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"ft-bloodhound"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"pw_hendry"}, crm_identifiers = {"FLS79822"}}, --Gilbert Jordan
            {crm_models = {"ma_mizo"}, crm_identifiers = {"ZEW3ABAU"}}, --Omar Sicilian
            {crm_models = {"ft-groe"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"ft-pterrier"}, crm_identifiers = {"VTJ68226", "Z0541V35"}}, --Gz, Bear K9
            {crm_models = {"max"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"ft-pandags"}, crm_identifiers = {"CID"}}, 
            {crm_models = {"pw_george"}, crm_identifiers = {"VND08140"}}, --Paradox
            {crm_models = {"misscandy"}, crm_identifiers = {"TCV677CD", "XWW50789"}}, --chann, Miss Candy
            {crm_models = {"ft-amakita"}, crm_identifiers = {"HUP47969", "NBJ01855", "X37LQOGR"}}, --Conk Von Slay, Athena
            {crm_models = {"ft_dshepherd"}, crm_identifiers = {"WP99832G"}}, -- Gator K9 
            {crm_models = {"a_c_aussiepup"}, crm_identifiers = {"TRJ27179"}}, --Sora Whisky
            {crm_models = {"s_m_m_gaffer_01"}, crm_identifiers = {"CEL94301"}}, --Falaichte
            {crm_models = {"a_m_y_methhead_01"}, crm_identifiers = {"LYP69641"}}, --Dalton Conner
            {crm_models = {"pw_carter80"}, crm_identifiers = {"XWW50789", "DFO40215"}}, --Damon
            {crm_model =  {'hm_justin'}, crm_identifiers = {"CID"}}, --notred.69
            {crm_models = {"pw_andreas80"}, crm_identifiers = {"WZS93831", "LD06R643"}}, --Jerome Williams, Jimmy Biggs
            {crm_models = {"tstudio_alvarg_eltuerto"}, crm_identifiers = {"JAODD35I"}}, --Draco Santana
            {crm_models = {"roy_ruckus"}, crm_identifiers = {"G6VGMY2R"}}, --Roy Ruckus
            {crm_models = {"John_Woody"}, crm_identifiers = {"VR210Q5X"}}, --John Woody

            -- Animals
            {crm_models = {"k9dog"}, crm_identifiers = {"FGQ18595", "XRY59425", "YWA88765", "CQE62105", "CNK46130", "IGR56136", "XMG45626", "Z0541V35"}},
            {crm_models = {"bugk9"}, crm_identifiers = {"PYB91YBL", "K5G88A37", "VKB42W05", "I38TH293"}}, -- Kalista, Pepper, Chawa, Athena
            {crm_models = {"bughusky"}, crm_identifiers = {"NV818618"}}, --Chance
            {crm_models = {"a_c_husky"}, crm_identifiers = {"TTC65791"}}, --Youth_GamR
            {crm_models = {"racoon_new"}, crm_identifiers = {"GIU55500"}}, --Josie
            {crm_models = {"ft-dobermanv2"}, crm_identifiers = {"ACR0S259"}}, --Rook K9
            {crm_models = {"bugdoberman"}, crm_identifiers = {"TLYXP32U", "L6P6ERP5"}}, --Fish K9
            {crm_models = {"a_c_dalmatian"}, crm_identifiers = {"CID"}},
            {crm_models = {"golden_r"}, crm_identifiers = {"BXNXWZZ5"}}, --Cookie K9

        }, -- Peds
        ['crm-hair'] = {}, -- Hair
        ['crm-facial'] = {}, -- Facial Hair
        ['crm-chest'] = {}, -- Chest Hair
        ['crm-eyebrows'] = {}, -- Eyebrows
        ['crm-makeup'] = {}, -- Makeup
        ['crm-blush'] = {}, -- Blush
        ['crm-lipstick'] = {}, -- Lipstick
        ['crm-clothing-0'] = {}, -- Heads
        ['crm-clothing-1'] = {}, -- Masks
        ['crm-clothing-3'] = {}, -- Hands
        ['crm-clothing-4'] = {}, -- Legs
        ['crm-clothing-5'] = {}, -- Bags and Parachutes
        ['crm-clothing-6'] = {}, -- Shoes
        ['crm-clothing-7'] = {}, -- Accessories
        ['crm-clothing-8'] = {}, -- Undershirts
        ['crm-clothing-9'] = {}, -- Body Armors
        ['crm-clothing-10'] = {}, -- Decals
        ['crm-clothing-11'] = {}, -- Tops/Torsos
        ['crm-accessories-0'] = {}, -- Hats
        ['crm-accessories-1'] = {}, -- Glasses
        ['crm-accessories-2'] = {}, -- Ears
        ['crm-accessories-6'] = {}, -- Watches
        ['crm-accessories-7'] = {}, -- Bracelets        
    },
}

-- crm-appearance - 

function crm_get_blacklist(crm_type)
    return crm_blacklist[crm_type]
end
