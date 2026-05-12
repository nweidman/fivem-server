----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

-- SAFE Language table (FA5 icons, no Config concatenations)
Language = {
    Targeting = {
        ['dutyicon']         = 'fas fa-clipboard',
        ['dutylabel']        = 'Clock In/Out',
        ['bossicon']         = 'fas fa-clipboard-list',
        ['bosslabel']        = 'Job Management',
        ['bossstorageicon']  = 'fas fa-box',
        ['bossstoragelabel'] = 'Open Management Storage',
        ['jobstorageicon']   = 'fas fa-box',
        ['jobstoragelabel']  = 'Open Storage',
        ['eposicon']         = 'fas fa-cash-register',
        ['eposlabel']        = 'Charge Customer',
        ['traystorageicon']  = 'fas fa-shopping-cart',
        ['traystoragelabel'] = 'Collect Order',
        ['rollingicon']      = 'fas fa-cannabis',
        ['rollinglabel']     = 'Roll Joints',
        ['jobstoreicon']     = 'fas fa-shopping-basket',
        ['jobstorelabel']    = 'Purchase Stock',
        ['snacktableicon']   = 'fas fa-shopping-basket',
        ['snacktablelabel']  = 'Purchase Snacks',
        ['outfiticon']       = 'fas fa-tshirt',          -- FA5 (was fa-shirt)
        ['outfitlabel']      = 'Change Outfit',
        ['trimicon']         = 'fas fa-cut',
        ['trimlabel']        = 'Trim Cannabis',
        ['harvesticon']      = 'fas fa-cannabis',
        ['strain1label']     = 'Harvest Wedding Cake Plants',
        ['strain2label']     = 'Harvest Sour Diesel Plants',
        ['strain3label']     = 'Harvest Grand Daddy Purple Plants',
        ['strain4label']     = 'Harvest Afghan Kush Plants',
        ['strain5label']     = 'Harvest Jack Herrer Plants',
        ['bongicon']         = 'fas fa-bong',
        ['bonglabel']        = 'Take A Hit From The Bong',
        ['ediblesicon']      = 'fas fa-cannabis',
        ['edibleslabel']     = 'Prepare Edibles',
        ['garageicon']       = 'fas fa-car',
        ['garagelabel']      = 'Company Vehicle',
        ['forceentryicon']   = 'fas fa-unlock',          -- FA5 (was fa-solid fa-unlock)
        ['forceentrylabel']  = 'Force Open Storage',
    },

    Locations = {
        Duty = {
            ['dutymenuheader']     = 'Staff Duty',
            ['dutymenuheadertext'] = 'Clock in and out of duty here!',
            ['dutymenuheadericon'] = 'fas fa-briefcase',
            ['dutytoggle']         = '• Clock In/Out',
            ['dutytoggleicon']     = 'fas fa-clock',
        },

        Billing = {
            ['paymenuheader']   = 'White Widow',
            ['paymenuheadertext']= 'Charge Customer',
            ['invoicesent']     = 'Invoice sent successfully!',
            ['invoicereceived'] = 'Invoice received!',
            ['minamount']       = 'You can’t charge zero.',
            ['billself']        = 'You can’t bill yourself.',
            ['billoffline']     = 'That player is offline.',
            ['noaccess']        = 'You are not authorised to make sales.',
            ['paytext']         = 'paypal id',
            ['payamount']       = '$ amount',
        },

        Rolling = {
            ['jointsmenuheader']     = 'Joint Rolling Station',
            ['jointsmenuheadertext'] = 'Roll your joints here!',
            ['jointsmenuheadericon'] = 'fas fa-joint',

            -- These used to concatenate Config at load-time. Keep them static and
            -- build dynamic “Required:” text in the menu code instead.
            ['strain1menuheader']     = 'Wedding Cake',
            ['strain1menuheadertext'] = 'Required: 3x Wedding Cake Buds 1x Grinder 3x Rolling Papers',
            ['strain1menuheadericon'] = 'fas fa-cannabis',

            ['strain2menuheader']     = 'Sour Diesel',
            ['strain2menuheadertext'] = 'Required: 3x Sour Diesel buds 1x Grinder 3x Rolling Papers',
            ['strain2menuheadericon'] = 'fas fa-cannabis',

            ['strain3menuheader']     = 'Grand Daddy Purple',
            ['strain3menuheadertext'] = 'Required: 3x Grand Daddy Purple buds 1x Grinder 3x Rolling Papers',
            ['strain3menuheadericon'] = 'fas fa-cannabis',

            ['strain4menuheader']     = 'Afghan Kush',
            ['strain4menuheadertext'] = 'Required: 3x Afghan Kush buds 1x Grinder 3x Rolling Papers',
            ['strain4menuheadericon'] = 'fas fa-cannabis',

            ['strain5menuheader']     = 'Jack Herrer',
            ['strain5menuheadertext'] = 'Required: 3x Jack Herrer buds 1x Grinder 3x Rolling Papers',
            ['strain5menuheadericon'] = 'fas fa-cannabis',
        },

        Trimming = {
            ['trimmenuheader']     = 'Trimming Station',
            ['trimmenuheadertext'] = 'Trim your crops into something usable!',
            ['trimmenuheadericon'] = 'fas fa-scissors',

            ['strain1menuheader']     = 'Wedding Cake',
            ['strain1menuheadertext'] = 'Required: 1x Trimming Shears 3x Wedding Cake Crop 3x Resealable Bags',
            ['strain1menuheadericon'] = 'fas fa-cannabis',

            ['strain2menuheader']     = 'Sour Diesel',
            ['strain2menuheadertext'] = 'Required:  1x Trimming Shears 3x Sour Diesel Crop 3x Resealable Bags',
            ['strain2menuheadericon'] = 'fas fa-cannabis',

            ['strain3menuheader']     = 'Grand Daddy Purple',
            ['strain3menuheadertext'] = 'Required:  1x Trimming Shears 3x Grand Daddy Purple Crop 3x Resealable Bags',
            ['strain3menuheadericon'] = 'fas fa-cannabis',

            ['strain4menuheader']     = 'Afghan Kush',
            ['strain4menuheadertext'] = 'Required:  1x Trimming Shears 3x Afghan Kush Crop 3x Resealable Bags',
            ['strain4menuheadericon'] = 'fas fa-cannabis',

            ['strain5menuheader']     = 'Jack Herrer',
            ['strain5menuheadertext'] = 'Required:  1x Trimming Shears 3x Jack Herrer Crop 3x Resealable Bags',
            ['strain5menuheadericon'] = 'fas fa-cannabis',

            ['noshears']   = 'You can’t trim without shears.',
            ['noweed']     = 'You need weed.',
            ['enoughweed'] = 'Not enough weed.',
            ['enoughbags'] = 'Not enough bags.',
            ['nobags']     = 'You need bags.',
            ['trimmingweed']= 'Trimming Weed..',
            ['trimmedweed']= 'You successfully trimmed some weed!',
        },

        Harvest = {
            ['harvestedplant'] = 'You successfully harvested from a plant!',
            ['strain1harvest'] = 'Harvesting Wedding Cake..',
            ['strain2harvest'] = 'Harvesting Sour Diesel..',
            ['strain3harvest'] = 'Harvesting Grand Daddy Purple..',
            ['strain4harvest'] = 'Harvesting Afghan Kush..',
            ['strain5harvest'] = 'Harvesting Jack Herrer..',
        },

        JointRolling = {
            ['enoughweed']   = 'Not enough weed to roll.',
            ['noweed']       = 'You can’t roll without weed.',
            ['enoughpapers'] = 'Not enough papers.',
            ['nopapers']     = 'You need rolling papers.',
            ['nogrinder']    = 'You need a grinder to roll joints.',
            ['rolledjoints'] = 'You successfully rolled some joints!',
            ['rollingjoints']= 'Rolling Joints..',
        },

        Edibles = {
            ['ediblesmenuheader']     = 'Cooking Table',
            ['ediblesmenuheadertext'] = 'Prepare edibles here!',
            ['ediblesmenuheadericon'] = 'fas fa-fire',   -- FA5 (was fa-fire-burner)
            ['strain1menuheader']     = 'Wedding Cake Gummies',
            ['strain1menuheadertext'] = 'Required: Gummy Bear Mold 3x Wedding Cake Crop 3x Gelatine 3x Raw Honey',
            ['strain1menuheadericon'] = 'fas fa-cannabis',
            ['strain2menuheader']     = 'Sour Diesel Gummies',
            ['strain2menuheadertext'] = 'Required:  Gummy Bear Mold 3x Sour Diesel Crop 3x Gelatine 3x Raw Honey',
            ['strain2menuheadericon'] = 'fas fa-cannabis',
            ['strain3menuheader']     = 'Grand Daddy Purple Gummies',
            ['strain3menuheadertext'] = 'Required:  Gummy Bear Mold 3x Grand Daddy Purple Crop 3x Gelatine 3x Raw Honey',
            ['strain3menuheadericon'] = 'fas fa-cannabis',
            ['strain4menuheader']     = 'Afghan Kush Gummies',
            ['strain4menuheadertext'] = 'Required:  Gummy Bear Mold 3x Afghan Kush Crop 3x Gelatine 3x Raw Honey',
            ['strain4menuheadericon'] = 'fas fa-cannabis',
            ['strain5menuheader']     = 'Jack Herrer Gummies',
            ['strain5menuheadertext'] = 'Required:  Gummy Bear Mold 3x Jack Herrer Crop 3x Gelatine 3x Raw Honey',
            ['strain5menuheadericon'] = 'fas fa-cannabis',

            ['enoughweed'] = 'Not enough weed for edibles.',
            ['noweed']     = 'You have no weed.',
            ['noitem1']    = 'You need a mould.',
            ['enoughitem2']= 'Not enough gelatine!',
            ['noitem2']    = 'You don’t have any gelatine!',
            ['enoughitem3']= 'Not enough honey!',
            ['noitem3']    = 'You don’t have any honey!',
            ['makeedibles']= 'Preparing Edibles..',
            ['eatedibles'] = 'Eating an Edible..',
        },

        BongTables = {
            ['bongmenuheader']     = 'Hit The Bong',
            ['bongmenuheadertext'] = 'Required: 1x Weed (2g), 1x Lighter',
            ['bongmenuheadericon'] = 'fas fa-bong',
            ['strain1menuheader']     = 'Wedding Cake',
            ['strain1menuheadertext'] = 'Yo ass stunk like a skunk..',
            ['strain1menuheadericon'] = 'fas fa-cannabis',
            ['strain2menuheader']     = 'Sour Diesel',
            ['strain2menuheadertext'] = 'The K-U-S-H keeps us so high..',
            ['strain2menuheadericon'] = 'fas fa-cannabis',
            ['strain3menuheader']     = 'Grand Daddy Purple',
            ['strain3menuheadertext'] = 'I bust put that white widow weed in the..',
            ['strain3menuheadericon'] = 'fas fa-cannabis',
            ['strain4menuheader']     = 'Afghan Kush',
            ['strain4menuheadertext'] = 'AK47, MAC-11, Glocks, and 9s..',
            ['strain4menuheadericon'] = 'fas fa-cannabis',
            ['strain5menuheader']     = 'Jack Herrer',
            ['strain5menuheadertext'] = 'But my amnes way more potent..',
            ['strain5menuheadericon'] = 'fas fa-cannabis',
            ['noweed']                = 'How are you planning to smoke without weed?',
            ['usebong']               = 'Hitting The Bong..',
        },

        Garage = {
            ['returnedvan']   = 'Thank you for returning the van!',
            ['rentedvan']     = 'You took out a van! Return it when you’re done!',
            ['nomoney']       = 'You can’t afford the deposit.',
            ['rentheader']    = 'White Widow Garage',
            ['rentheadericon']= 'fas fa-warehouse',
            ['rentmenuheader']= 'Company Van',
            ['rentmenutext']  = 'A deposit is required.',
            ['rentmenuicon']  = 'fas fa-car',
            ['returnmenuheader']= 'Return Van',
            ['returnmenutext']= 'Return the vehicle to receive half your deposit.',
            ['returnmenuicon']= 'fas fa-car',
        }
    },

    Joints = {
        ['smokejoint'] = 'Hitting The Blunt..',
    },

    Shared = {
        ['returnmenu']   = 'Return',
        ['returnmenuicon']= 'fas fa-backward',
        ['exitmenu']     = 'Exit',
        ['exitmenuicon'] = 'fas fa-times-circle', -- FA5 (was fa-circle-xmark)
        ['cancelled']    = 'Action cancelled..',
        ['noinvent']     = 'Looks like your pockets are full..',
        ['outrange']     = 'Looks like you are too far away..',
        ['searchcd']     = 'You have already searched this location.. Come back later..',
        ['nolighter']    = 'How are you planning to smoke without a lighter?',
        ['forceentry']   = 'Forcing Entry..',
    }
}
