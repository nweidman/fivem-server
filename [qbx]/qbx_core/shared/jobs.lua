---Job names must be lower case (top level table key)
---@type table<string, Job>
return {
    ['unemployed'] = {
        label = 'Civilian',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Freelancer',
                payment = 0
            },
        },
    },
    ['police'] = {
        label = 'Police',
        type = 'leo',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Probationary Officer',
                payment = 1500
            },
            [1] = {
                name = 'Officer',
                payment = 1600
            },
            [2] = {
                name = 'Senior Officer',
                payment = 1750
            },
            [3] = {
                name = 'Corporal',
                payment = 1800
            },
            [4] = {
                name = 'Sergeant',
                payment = 1900
            },
            [5] = {
                name = 'Senior Sergeant',
                payment = 2000
            },
            [6] = {
                name = 'Sergeant BCSO',
                payment = 2000
            },
            [7] = {
                name = 'Lieutenant',
                isboss = true,
                bankAuth = true,
                payment = 2250
            },
            [8] = {
                name = 'Lieutenant BCSO',
                isboss = true,
                bankAuth = true,
                payment = 2250
            },
            [9] = {
                name = 'Captain',
                isboss = true,
                bankAuth = true,
                payment = 2500
            },
            [10] = {
                name = 'Commander',
                isboss = true,
                bankAuth = true,
                payment = 2750
            },
            [11] = {
                name = 'Chief Deputy',
                isboss = true,
                bankAuth = true,
                payment = 3000
            },
            [12] = {
                name = 'Assistant Chief',
                isboss = true,
                bankAuth = true,
                payment = 3000
            },
            [13] = {
                name = 'Undersheriff',
                isboss = true,
                bankAuth = true,
                payment = 3500
            },
            [14] = {
                name = 'Chief',
                isboss = true,
                bankAuth = true,
                payment = 3500
            },
            [15] = {
                name = 'Sheriff',
                isboss = true,
                bankAuth = true,
                payment = 4000
            },
            [16] = {
                name = 'Commissioner',
                isboss = true,
                bankAuth = true,
                payment = 4000
            },
        },
    },
    ['ambulance'] = {
        label = 'EMS',
        type = 'ems',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'REMT',
                payment = 1500
            },
            [1] = {
                name = 'EMT',
                payment = 1700
            },
            [2] = {
                name = 'Paramedic',
                payment = 2000
            },
            [3] = {
                name = 'Senior Paramedic',
                payment = 2250
            },
            [4] = {
                name = 'Lieutenant',
                isboss = true,
                bankAuth = true,
                payment = 2500
            },
            [5] = {
                name = 'Captain',
                isboss = true,
                bankAuth = true,
                payment = 2700
            },
            [6] = {
                name = 'Dep. Medical Chief',
                isboss = true,
                bankAuth = true,
                payment = 3000
            },
            [7] = {
                name = 'Medical Chief',
                isboss = true,
                bankAuth = true,
                payment = 3500
            },
        },
    },
    ['petshoptest'] = {
        label = 'Pet Shop Test Shop',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Clerk',
                payment = 25
            },
            [25] = {
                name = 'Veterinarian',
                payment = 50
            },
            [50] = {
                name = 'Manager',
                payment = 75
            },
            [100] = {
                name = 'Boss',
                payment = 150,
                isboss = true,
                bankAuth = true
            },
        },
    },
    -- ['doj'] = {
    --     label = 'Department of Justice',
    --     defaultDuty = true,
    --     offDutyPay = false,
    --     grades = {
    --         [0] = {
    --             name = 'Lawyer',
    --             payment = 2000
    --         },
    --         [1] = {
    --             name = 'District Attorney',
    --             payment = 2500
    --         },
    --         [2] = {
    --             name = 'Judge',
    --             payment = 3000
    --         },
    --         [3] = {
    --             name = 'Attorney General',
    --             isboss = true,
    --             bankAuth = true,
    --             payment = 3500
    --         },
    --         [4] = {
    --             name = 'Chief Justice',
    --             isboss = true,
    --             bankAuth = true,
    --             payment = 4000
    --         },
    --     },
    -- },
    ['realestate'] = {
        label = 'Real Estate',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 0
            },
            [1] = {
                name = 'House Sales',
                payment = 0
            },
            [2] = {
                name = 'Business Sales',
                payment = 0
            },
            [3] = {
                name = 'Broker',
                payment = 0
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['pdm'] = {
        label = 'PDM',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 0
            },
            [1] = {
                name = 'Showroom Sales',
                payment = 0
            },
            [2] = {
                name = 'Business Sales',
                payment = 0
            },
            [3] = {
                name = 'Finance',
                payment = 0
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [5] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['lux'] = {
        label = 'Luxury Autos',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 0
            },
            [1] = {
                name = 'Showroom Sales',
                payment = 0
            },
            [2] = {
                name = 'Business Sales',
                payment = 0
            },
            [3] = {
                name = 'Finance',
                payment = 0
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [5] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['badlands'] = {
        label = 'Badlands Motors',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 0
            },
            [1] = {
                name = 'Showroom Sales',
                payment = 0
            },
            [2] = {
                name = 'Business Sales',
                payment = 0
            },
            [3] = {
                name = 'Finance',
                payment = 0
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [5] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['lscustoms'] = {
        label = 'LS Customs',
        type = 'mechanic',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Apprentice',
                payment = 0
            },
            [1] = {
                name = 'Junior Mechanic',
                payment = 0
            },
            [2] = {
                name = 'Mechanic',
                payment = 0
            },
            [3] = {
                name = 'Senior Mechanic',
                payment = 0
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [5] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['ccm'] = {
        label = 'Cruisin Craftsmen',
        type = 'mechanic',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 0
            },
            [1] = {
                name = 'Novice',
                payment = 0
            },
            [2] = {
                name = 'Experienced',
                payment = 0
            },
            [3] = {
                name = 'Advanced',
                payment = 0
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [5] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['ss'] = {
        label = 'Seaton Sands',
        type = 'mechanic',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Novice',
                payment = 0
            },
            [1] = {
                name = 'Experienced',
                payment = 0
            },
            [2] = {
                name = 'Advanced',
                payment = 0
            },
            [3] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [4] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['esm'] = {
        label = 'Mirror Park Auto',
        type = 'mechanic',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 0
            },
            [1] = {
                name = 'Novice',
                payment = 0
            },
            [2] = {
                name = 'Experienced',
                payment = 0
            },
            [3] = {
                name = 'Advanced',
                payment = 0
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [5] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['stance'] = {
        label = 'Stance House',
        type = 'stance',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Recruit',
                payment = 0
            },
            [1] = {
                name = 'Novice',
                payment = 0
            },
            [2] = {
                name = 'Experienced',
                payment = 0
            },
            [3] = {
                name = 'Advanced',
                payment = 0
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [5] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['highnote'] = {
        label = 'High Note',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Trainee',
                payment = 0
            },
            [1] = {
                name = 'Grower',
                payment = 0
            },
            [2] = {
                name = 'Assistant Manager',
                payment = 0
            },
            [3] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [4] = {
                name = 'Head Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [5] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['auction'] = {
        label = 'Auction',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Auctioneer',
                payment = 0
            },
        },
    },
    ['bahama'] = {
        label = 'Bahama Mamas',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Security',
                payment = 0
            },
            [1] = {
                name = 'Bartender',
                payment = 0
            },
            [2] = {
                name = 'Dancer',
                payment = 0
            },
            [3] = {
                name = 'DJ',
                payment = 0
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [5] = {
                name = 'Boss',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    -- ['used'] = {
    --     label = 'Shoreline Used Sales',
    --     defaultDuty = true,
    --     offDutyPay = false,
    --     grades = {
    --         [0] = {
    --             name = 'Sales Associate',
    --             payment = 0
    --         },
    --         [1] = {
    --             name = 'Senior Sales Rep',
    --             payment = 0
    --         },
    --         [2] = {
    --             name = 'Sales Manager',
    --             isboss = true,
    --             bankAuth = true,
    --             payment = 0
    --         },
    --         [3] = {
    --             name = 'Owner',
    --             isboss = true,
    --             bankAuth = true,
    --             payment = 0
    --         },
    --     },
    -- },
    ['photo'] = {
        label = 'Vibe Studios',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Assistant',
                payment = 0
            },
            [1] = {
                name = 'Graphic Designer',
                payment = 0
            },
            [2] = {
                name = 'Interior Designer ',
                payment = 0
            },
            [3] = {
                name = 'Photographer',
                payment = 0
            },
            [4] = {
                name = 'Senior Photographer',
                payment = 0
            },
            [5] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [6] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['hobo'] = {
        label = 'Hobo',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Street Rat',
                payment = 10
            },
        },
    },
    ['dj'] = {
        label = 'DJ',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Wandering DJ',
                payment = 0
            },
        },
    },
    ['pitapan'] = {
        label = 'Pita Pan',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Dish Washer',
                payment = 0
            },
            [1] = {
                name = 'Chef',
                payment = 0
            },
            [2] = {
                name = 'Shift Supervisor',
                payment = 0
            },
            [3] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [4] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['saltlabsmoothies'] = {
        label = 'Salt lab Smoothies',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Dish Washer',
                payment = 0
            },
            [1] = {
                name = 'Chef',
                payment = 0
            },
            [2] = {
                name = 'Shift Supervisor',
                payment = 0
            },
            [3] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [4] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['lilypad'] = {
        label = 'Lily Pad',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Dish Washer',
                payment = 0
            },
            [1] = {
                name = 'Chef',
                payment = 0
            },
            [2] = {
                name = 'Shift Supervisor',
                payment = 0
            },
            [3] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [4] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['moo'] = {
        label = 'Moo Moo Cafe',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Dish Washer',
                payment = 0
            },
            [1] = {
                name = 'Chef',
                payment = 0
            },
            [2] = {
                name = 'Shift Supervisor',
                payment = 0
            },
            [3] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [4] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['boathouse'] = {
        label = 'Boat House',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Dish Washer',
                payment = 0
            },
            [1] = {
                name = 'Chef',
                payment = 0
            },
            [2] = {
                name = 'Shift Supervisor',
                payment = 0
            },
            [3] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [4] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['casino'] = {
        label = 'Diamond Casino',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Employee',
                payment = 0
            },
            [1] = {
                name = 'Manager',
                payment = 0
            },
            [2] = {
                name = 'Boss',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['smoking'] = {
        label = 'SmoKing Vapes',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Trainee',
                payment = 0
            },
            [1] = {
                name = 'Experienced',
                payment = 0
            },
            [2] = {
                name = 'Shift Supervisor',
                payment = 0
            },
            [3] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [4] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['news'] = {
        label = 'Weazel News',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Intern',
                payment = 0
            },
            [1] = {
                name = 'Photo Journalist',
                payment = 0
            },
            [2] = {
                name = 'Columnist',
                payment = 0
            },
            [3] = {
                name = 'Journalist ',
                payment = 0
            },
            [4] = {
                name = 'Editor',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [5] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['towing'] = {
        label = 'Camel Tow',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Tow Trainee',
                payment = 0
            },
            [1] = {
                name = 'Tow Operator',
                payment = 0
            },
            [2] = {
                name = 'Tow Supervisor',
                payment = 0
            },
            [3] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [4] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['jewelry'] = {
        label = 'Prestige Jewelry',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Jeweler',
                payment = 0
            },
            [1] = {
                name = 'Jewelry Designer',
                payment = 0
            },
            [2] = {
                name = 'Supervisor',
                payment = 0
            },
            [3] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
            [4] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
    ['k9'] = {
        label = 'K9',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'K9 Dog',
                payment = 500
            },
            [1] = {
                name = 'K9 Handler',
                isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
    },
}
