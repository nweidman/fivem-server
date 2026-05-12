Config = {}

Config.Debug = false

Config.MysteryBoxes = {
    -- ['mysterybox'] = {
    --     Rarities = { -- Total chance must be out of 100, Color must be a hex code
    --         ['Common'] = {chance = 50, color = '898989'},
    --         ['Uncommon'] = {chance = 40, color = '0BDA51'},
    --         ['Rare'] = {chance = 6, color = '2323FF'},
    --         ['Epic'] = {chance = 3, color = '7F00FF'},
    --         ['Legendary'] = {chance = 1, color = 'FF7518'},
    --     },
    --     -- Type = item/money
    --     -- Reward = item name or money account
    --     -- Rarity = Choose a rarity defined above
    --     -- Amount = # of items or amount of money
    --     Rewards = {
    --         {type = "item", reward = 'bandage', displayName = 'Bandage', amount = 1, rarity = "Common", image = 'bandage.png'},
    --         {type = "item", reward = 'garbage', displayName = 'Garbage', amount = 1, rarity = "Common", image = 'garbage.png'},
    --         {type = "item", reward = 'lockpick', displayName = 'Lockpick', amount = 1, rarity = "Common", image = 'lockpick.png'},
    --         {type = "item", reward = 'phone', displayName = 'Phone', amount = 1, rarity = "Common", image = 'phone.png'},
    --         {type = "item", reward = 'water', displayName = 'Water', amount = 1, rarity = "Common", image = 'water.png'},
    --         {type = "item", reward = 'armour', displayName = 'Armor', amount = 1, rarity = "Common", image = 'armour.png'},
    --         {type = "item", reward = 'money', displayName = 'Money', amount = 1, rarity = "Common", image = 'money.png'},
    --         {type = "item", reward = 'lawyerpass', displayName = 'Lawyer Pass', amount = 1, rarity = "Common", image = 'lawyerpass.png'},
    --         {type = "item", reward = 'burger', displayName = 'Burger', amount = 1, rarity = "Uncommon", image = 'burger.png'},
    --         {type = "item", reward = 'sprunk', displayName = 'Sprunk', amount = 1, rarity = "Rare", image = 'sprunk.png'},
    --         {type = "item", reward = 'paperbag', displayName = 'Paper Bag', amount = 1, rarity = "Epic", image = 'paperbag.png'},
    --         {type = "item", reward = 'panties', displayName = 'Panties', amount = 1, rarity = "Legendary", image = 'panties.png'},
    --     }
    -- },
    ['mysterybag'] = {
        Rarities = { -- Total chance must be out of 100, Color must be a hex code
            ['Epic'] = {chance = 20, color = 'A671FE'},
            ['Elite'] = {chance = 30, color = '4642FF'},
            ['Icon'] = {chance = 50, color = '1830C0'},
        },
        Rewards = {
            {type = "item", reward = 'WEAPON_ZKKNIFE', displayName = 'K Knife', amount = 1, rarity = "Icon", image = 'WEAPON_ZKKNIFE.png'},
            {type = "item", reward = 'WEAPON_KATANA', displayName = 'Pop Light Sword', amount = 1, rarity = "Elite", image = 'WEAPON_KATANA.png'},
            {type = "item", reward = 'WEAPON_GLOW_BAT', displayName = 'Glow Bat', amount = 1, rarity = "Icon", image = 'WEAPON_GLOW_BAT.png'},
            {type = "item", reward = 'WEAPON_SLEDGEHAMMER', displayName = 'Sledge Hammer', amount = 1, rarity = "Icon", image = 'WEAPON_SLEDGEHAMMER.png'},
            {type = "item", reward = 'WEAPON_KATANA2', displayName = 'Just the Tip', amount = 1, rarity = "Elite", image = 'WEAPON_KATANA2.png'},
            {type = "item", reward = 'WEAPON_VALAXE', displayName = 'Heart Axe', amount = 1, rarity = "Icon", image = 'WEAPON_VALAXE.png'},
            {type = "item", reward = 'WEAPON_VALCLEVER', displayName = 'Heart Cleaver', amount = 1, rarity = "Icon", image = 'WEAPON_VALCLEVER.png'},
            {type = "item", reward = 'WEAPON_VALKNIFE', displayName = 'Heart Knife', amount = 1, rarity = "Icon", image = 'WEAPON_VALKNIFE.png'},
            {type = "item", reward = 'WEAPON_VALSPIKEDBAT', displayName = 'Spiked Bat', amount = 1, rarity = "Icon", image = 'WEAPON_VALSPIKEDBAT.png'},
            {type = "item", reward = 'WEAPON_KATANA3', displayName = 'OS Light Sword', amount = 1, rarity = "Epic", image = 'WEAPON_KATANA3.png'},
            {type = "item", reward = 'WEAPON_KATANA5', displayName = 'Rainbow Light Sword', amount = 1, rarity = "Epic", image = 'WEAPON_KATANA5.png'},
            {type = "item", reward = 'WEAPON_KATANA6', displayName = 'Red Light Sword', amount = 1, rarity = "Epic", image = 'WEAPON_KATANA6.png'},
            {type = "item", reward = 'WEAPON_KATANA7', displayName = 'Orange Light Sword', amount = 1, rarity = "Epic", image = 'WEAPON_KATANA7.png'},
            {type = "item", reward = 'WEAPON_KATANA8', displayName = 'Yellow Light Sword', amount = 1, rarity = "Epic", image = 'WEAPON_KATANA8.png'},
            {type = "item", reward = 'WEAPON_KATANA9', displayName = 'Green Light Sword', amount = 1, rarity = "Epic", image = 'WEAPON_KATANA9.png'},
            {type = "item", reward = 'WEAPON_KATANA10', displayName = 'Blue Light Sword', amount = 1, rarity = "Epic", image = 'WEAPON_KATANA10.png'},
            {type = "item", reward = 'WEAPON_KATANA11', displayName = 'Black Light Sword', amount = 1, rarity = "Epic", image = 'WEAPON_KATANA11.png'},
            {type = "item", reward = 'WEAPON_KARAMBIT', displayName = 'Karambit', amount = 1, rarity = "Epic", image = 'WEAPON_KARAMBIT.png'},
            {type = "item", reward = 'WEAPON_KARAMBIT2', displayName = 'Pink Galaxy Karambit', amount = 1, rarity = "Epic", image = 'WEAPON_KARAMBIT2.png'},
            {type = "item", reward = 'WEAPON_KARAMBIT3', displayName = 'Marble Fade Karambit', amount = 1, rarity = "Epic", image = 'WEAPON_KARAMBIT3.png'},
            {type = "item", reward = 'WEAPON_KARAMBIT4', displayName = 'Splatter Karambit', amount = 1, rarity = "Epic", image = 'WEAPON_KARAMBIT4.png'},
            {type = "item", reward = 'WEAPON_KARAMBIT5', displayName = 'Crimson Web Karambit', amount = 1, rarity = "Epic", image = 'WEAPON_KARAMBIT5.png'},
            {type = "item", reward = 'WEAPON_PENCIL', displayName = 'Pencil', amount = 1, rarity = "Epic", image = 'WEAPON_PENCIL.png'},
        }
    },
    ['partsmysterybox'] = {
        Rarities = { -- Total chance must be out of 100, Color must be a hex code
            ['Common'] = {chance = 60, color = '898989'},
            ['Uncommon'] = {chance = 25, color = '0BDA51'},
            ['Rare'] = {chance = 10, color = '2323FF'},
            ['Epic'] = {chance = 4, color = '7F00FF'},
            ['Legendary'] = {chance = 1, color = 'FF7518'},
        },
        -- Type = item/money
        -- Reward = item name or money account
        -- Rarity = Choose a rarity defined above
        -- Amount = # of items or amount of money
        Rewards = {
            {type = "item", reward = 'pistolparts', displayName = 'Pistol Parts', amount = 1, rarity = "Common", image = 'pistolparts.png'},
            {type = "item", reward = 'shotgunbarrel', displayName = 'Shotgun Barrel', amount = 1, rarity = "Uncommon", image = 'shotgunbarrel.png'},
            {type = "item", reward = 'shotgunbody', displayName = 'Shotgun Body', amount = 1, rarity = "Uncommon", image = 'shotgunbody.png'},
            {type = "item", reward = 'smgbody', displayName = 'SMG Body', amount = 1, rarity = "Rare", image = 'smgbody.png'},
            {type = "item", reward = 'smgbarrel', displayName = 'SMG Barrel', amount = 1, rarity = "Rare", image = 'smgbarrel.png'},
            {type = "item", reward = 'smggrip', displayName = 'SMG Grip', amount = 1, rarity = "Rare", image = 'smggrip.png'},
            {type = "item", reward = 'riflebody', displayName = 'Rifle Body', amount = 1, rarity = "Epic", image = 'riflebody.png'},
            {type = "item", reward = 'riflebarrel', displayName = 'Rifle Barrel', amount = 1, rarity = "Epic", image = 'riflebarrel.png'},
            {type = "item", reward = 'riflegrip', displayName = 'Rifle Grip', amount = 1, rarity = "Epic", image = 'riflegrip.png'},
            {type = "item", reward = 'riflemagazine', displayName = 'Rifle Magazine', amount = 1, rarity = "Epic", image = 'riflemagazine.png'},
            {type = "item", reward = 'riflestock', displayName = 'Rifle Stock', amount = 1, rarity = "Epic", image = 'riflestock.png'},
            {type = "item", reward = 'rifleblueprint', displayName = 'Rifle Blueprint', amount = 1, rarity = "Legendary", image = 'rifleblueprint.png'},
            {type = "item", reward = 'smgblueprint', displayName = 'SMG Blueprint', amount = 1, rarity = "Legendary", image = 'smgblueprint.png'},
            {type = "item", reward = 'shotgunblueprint', displayName = 'Shotgun Blueprint', amount = 1, rarity = "Legendary", image = 'shotgunblueprint.png'},
        }
    },
    ['xmasmysterybox'] = {
        Rarities = { -- Total chance must be out of 100, Color must be a hex code
            ['Common'] = {chance = 60, color = '898989'},
            ['Uncommon'] = {chance = 25, color = '0BDA51'},
            ['Rare'] = {chance = 10, color = '2323FF'},
            ['Epic'] = {chance = 4, color = '7F00FF'},
            ['Legendary'] = {chance = 1, color = 'FF7518'},
        },
        -- Type = item/money
        -- Reward = item name or money account
        -- Rarity = Choose a rarity defined above
        -- Amount = # of items or amount of money
        Rewards = {
            {type = "item", reward = 'WEAPON_SNOWBALL', displayName = 'Snowballs', amount = 1, rarity = "Epic", image = 'WEAPON_SNOWBALL.png'},
            {type = "item", reward = 'coal', displayName = 'Coal', amount = 1, rarity = "Uncommon", image = 'coal.png'},
            {type = "item", reward = 'coal', displayName = 'Coal', amount = 1, rarity = "Uncommon", image = 'coal.png'},
            {type = "item", reward = 'WEAPON_APPLE_CANDYCANE', displayName = 'Candy Cane Bow', amount = 1, rarity = "Legendary", image = 'WEAPON_APPLE_CANDYCANE.png'},
            {type = "item", reward = 'WEAPON_CANDYAXE', displayName = 'Candy Cane Axe', amount = 1, rarity = "Legendary", image = 'WEAPON_CANDYAXE.png'},
            {type = "item", reward = 'WEAPON_CANDYCANE', displayName = 'Candy Cane', amount = 1, rarity = "Epic", image = 'WEAPON_CANDYCANE.png'},
            {type = "item", reward = 'mysterybag', displayName = 'Mystery Bag', amount = 1, rarity = "Rare", image = 'mysterybag.png'},
            {type = "item", reward = 'partsmysterybox', displayName = 'Parts Mystery Box', amount = 1, rarity = "Rare", image = 'partsmysterybox.png'},
            {type = "item", reward = 'heistmysterybox', displayName = 'Heist Mystery Box', amount = 1, rarity = "Epic", image = 'heistmysterybox.png'},
        }
    },
    -- ['weaponmysterybox'] = { --TBD
    --     Rarities = { -- Total chance must be out of 100, Color must be a hex code
    --         ['Common'] = {chance = 60, color = '898989'},
    --         ['Uncommon'] = {chance = 25, color = '0BDA51'},
    --         ['Rare'] = {chance = 10, color = '2323FF'},
    --         ['Epic'] = {chance = 4, color = '7F00FF'},
    --         ['Legendary'] = {chance = 1, color = 'FF7518'},
    --     },
    --     -- Type = item/money
    --     -- Reward = item name or money account
    --     -- Rarity = Choose a rarity defined above
    --     -- Amount = # of items or amount of money
    --     Rewards = {
    --         {type = "item", reward = 'bandage', displayName = 'Bandage', amount = 1, rarity = "Common", image = 'bandage.png'},
    --         {type = "item", reward = 'garbage', displayName = 'Garbage', amount = 1, rarity = "Common", image = 'garbage.png'},
    --         {type = "item", reward = 'lockpick', displayName = 'Lockpick', amount = 1, rarity = "Common", image = 'lockpick.png'},
    --         {type = "item", reward = 'phone', displayName = 'Phone', amount = 1, rarity = "Common", image = 'phone.png'},
    --         {type = "item", reward = 'water', displayName = 'Water', amount = 1, rarity = "Common", image = 'water.png'},
    --         {type = "item", reward = 'armour', displayName = 'Armor', amount = 1, rarity = "Common", image = 'armour.png'},
    --         {type = "item", reward = 'money', displayName = 'Money', amount = 1, rarity = "Common", image = 'money.png'},
    --         {type = "item", reward = 'lawyerpass', displayName = 'Lawyer Pass', amount = 1, rarity = "Common", image = 'lawyerpass.png'},
    --         {type = "item", reward = 'burger', displayName = 'Burger', amount = 1, rarity = "Uncommon", image = 'burger.png'},
    --         {type = "item", reward = 'sprunk', displayName = 'Sprunk', amount = 1, rarity = "Rare", image = 'sprunk.png'},
    --         {type = "item", reward = 'paperbag', displayName = 'Paper Bag', amount = 1, rarity = "Epic", image = 'paperbag.png'},
    --         {type = "item", reward = 'panties', displayName = 'Panties', amount = 1, rarity = "Legendary", image = 'panties.png'},
    --     }
    -- },
    ['heistmysterybox'] = {
        Rarities = { -- Total chance must be out of 100, Color must be a hex code
            ['Common'] = {chance = 60, color = '898989'},
            ['Uncommon'] = {chance = 25, color = '0BDA51'},
            ['Rare'] = {chance = 10, color = '2323FF'},
            ['Epic'] = {chance = 4, color = '7F00FF'},
            ['Legendary'] = {chance = 1, color = 'FF7518'},
        },
        -- Type = item/money
        -- Reward = item name or money account
        -- Rarity = Choose a rarity defined above
        -- Amount = # of items or amount of money
        Rewards = {
            {type = "money", reward = 'crypto', displayName = '25 Qbit', amount = 25, rarity = "Common", image = 'crypto.png'},
            {type = "item", reward = 'circuitboard', displayName = 'Circuit Board', amount = 1, rarity = "Common", image = 'circuitboard.png'},
            {type = "item", reward = 'wires', displayName = '5 Wires', amount = 5, rarity = "Common", image = 'wires.png'},
            {type = "item", reward = 'explosive', displayName = 'Explosive', amount = 1, rarity = "Common", image = 'explosive.png'},
            {type = "item", reward = 'bag', displayName = 'Duffel Bag', amount = 1, rarity = "Common", image = 'bag.png'},
            {type = "item", reward = 'signaljammer', displayName = 'Signal Jammer', amount = 1, rarity = "Common", image = 'signaljammer.png'},
            {type = "item", reward = 'maliciousflashdrive', displayName = 'Malicious Flash Drive', amount = 1, rarity = "Common", image = 'maliciousflashdrive.png'},
            {type = "item", reward = 'goldbar', displayName = '10 Gold Bars', amount = 10, rarity = "Common", image = 'goldbar.png'},
            {type = "money", reward = 'crypto', displayName = '50 Qbit', amount = 50, rarity = "Uncommon", image = 'crypto.png'},
            {type = "item", reward = 'maliciouscode', displayName = 'Malicious Code', amount = 1, rarity = "Uncommon", image = 'maliciouscode.png'},
            {type = "item", reward = 'cryptoharddrive', displayName = 'Crypto Hard Drive', amount = 1, rarity = "Uncommon", image = 'cryptoharddrive.png'},
            {type = "item", reward = 'hackdevice', displayName = 'Hack Device', amount = 1, rarity = "Uncommon", image = 'hackdevice.png'},
            {type = "item", reward = 'gasgrenade', displayName = 'Gas Grenade', amount = 1, rarity = "Uncommon", image = 'gasgrenade.png'},
            {type = "item", reward = 'whiteusb', displayName = 'White USB', amount = 1, rarity = "Uncommon", image = 'whiteusb.png'},
            {type = "item", reward = 'cashexchangekey', displayName = 'Cash Exchange Vault Key', amount = 1, rarity = "Uncommon", image = 'cashexchangekey.png'},
            {type = "item", reward = 'toolkit', displayName = 'Tool Kit', amount = 1, rarity = "Uncommon", image = 'toolkit.png'},
            {type = "item", reward = 'dynamite', displayName = 'Dynamite', amount = 1, rarity = "Uncommon", image = 'dynamite.png'},
            {type = "item", reward = 'passcodeinjector', displayName = 'Passcode Injector', amount = 1, rarity = "Rare", image = 'passcodeinjector.png'},
            {type = "item", reward = 'c4', displayName = 'C4', amount = 1, rarity = "Rare", image = 'c4.png'},
            {type = "item", reward = 'vangelicosafekey', displayName = 'Vangelico Safe Key', amount = 1, rarity = "Rare", image = 'vangelicosafekey.png'},
            {type = "item", reward = 'purpleusb', displayName = 'Purple USB', amount = 1, rarity = "Epic", image = 'purpleusb.png'},
            {type = "money", reward = 'crypto', displayName = '250 Qbit', amount = 250, rarity = "Epic", image = 'crypto.png'},
            {type = "item", reward = 'yellowusb', displayName = 'Yellow USB', amount = 1, rarity = "Legendary", image = 'yellowusb.png'},
            {type = "item", reward = 'blackusb', displayName = 'Black USB', amount = 1, rarity = "Legendary", image = 'blackusb.png'},
            {type = "money", reward = 'crypto', displayName = '500 Qbit', amount = 500, rarity = "Legendary", image = 'crypto.png'},
        }
    },
}