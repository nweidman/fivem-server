---Gang names must be lower case (top level table key)
---@type table<string, Gang>
return {
    ['none'] = {
        label = 'No Gang',
        grades = {
            [0] = {
                name = 'Unaffiliated'
            },
        },
    },
    ['hos'] = {
        label = 'House of Sins',
        grades = {
            [0] = {
                name = 'Associate'
            },
            [1] = {
                name = 'Soldier'
            },
            [2] = {
                name = 'Capo'
            },
            [3] = {
                name = 'Consigliere'
            },
            [4] = {
                name = 'War General'
            },
            [5] = {
                name = 'Underboss',
                isboss = true,
                bankAuth = true
            },
            [6] = {
                name = 'Boss',
                isboss = true,
                bankAuth = true
            },
        },
    },
    ['milk'] = {
        label = 'Milk',
        grades = {
            [0] = {
                name = 'Skim'
            },
            [1] = {
                name = '2%'
            },
            [2] = {
                name = '1%'
            },
            [3] = {
                name = 'Whole'
            },
            [4] = {
                name = 'Cream',
                isboss = true,
                bankAuth = true
            },
            [5] = {
                name = 'Carton',
                isboss = true,
                bankAuth = true
            },
        },
    },
    ['grimz'] = {
        label = 'Grimz',
        grades = {
            [0] = {
                name = 'Hangaround'
            },
            [1] = {
                name = 'Soldier'
            },
            [2] = {
                name = 'Enforcer'
            },
            [3] = {
                name = 'Lieutenant'
            },
            [4] = {
                name = 'Warlord'
            },
            [5] = {
                name = 'Left Hand'
            },
            [6] = {
                name = 'Right Hand',
                isboss = true,
                bankAuth = true
            },
            [7] = {
                name = 'OG',
                isboss = true,
                bankAuth = true
            },
        },
    },
    ['kage'] = {
        label = 'Dead Mans Zyndicate',
        grades = {
            [0] = {
                name = 'Soldier'
            },
            [1] = {
                name = 'Enforcer'
            },
            [2] = {
                name = 'War General'
            },
            [3] = {
                name = 'First Lieutenant'
            },
            [4] = {
                name = 'Underboss',
                isboss = true,
                bankAuth = true
            },
            [5] = {
                name = 'Boss',
                isboss = true,
                bankAuth = true
            },
        },
    },
    ['blackhand'] = {
        label = 'The Black Hand',
        grades = {
            [0] = {
                name = 'Soldier'
            },
            [1] = {
                name = 'Capo'
            },
            [2] = {
                name = 'Kanbu',
                isboss = true,
                bankAuth = true
            },
            [3] = {
                name = 'Don',
                isboss = true,
                bankAuth = true
            },
        },
    },
    ['mercy'] = {
        label = 'Mercy',
        grades = {
            [0] = {
                name = 'Hangaround'
            },
            [1] = {
                name = 'Soldier'
            },
            [2] = {
                name = 'Shotcaller'
            },
            [3] = {
                name = 'Righthand',
                isboss = true,
                bankAuth = true
            },
            [4] = {
                name = 'OG',
                isboss = true,
                bankAuth = true
            },
        },
    },
    ['shadow'] = {
        label = 'Ghost Syndicate',
        grades = {
            [0] = {
                name = 'Recruit'
            },
            [1] = {
                name = 'Soldier'
            },
            [2] = {
                name = 'Veteran Scout'
            },
            [3] = {
                name = 'Division Enforcer'
            },
            [4] = {
                name = 'Division Lieutenant'
            },
            [5] = {
                name = 'War Captain'
            },
            [6] = {
                name = 'War Chief',
                isboss = true,
                bankAuth = true
            },
            [7] = {
                name = 'Warlord',
                isboss = true,
                bankAuth = true
            },
        },
    },
    ['bsmc'] = {
        label = 'Burning Suns MC',
        grades = {
            [0] = {
                name = 'Hangaround'
            },
            [1] = {
                name = 'Prospect'
            },
            [2] = {
                name = 'Member'
            },
            [3] = {
                name = 'Chaplin'
            },
            [4] = {
                name = 'Tail Gunner'
            },
            [5] = {
                name = 'Enforcer'
            },
            [6] = {
                name = 'Head Enforcer'
            },
            [7] = {
                name = 'Road Captain'
            },
            [8] = {
                name = 'Treasurer'
            },
            [9] = {
                name = 'Secretary'
            },
            [10] = {
                name = 'Sgt at Arms'
            },
            [11] = {
                name = 'Vice President',
                isboss = true,
                bankAuth = true
            },
            [12] = {
                name = 'President',
                isboss = true,
                bankAuth = true
            },
        },
    },
    ['cid'] = {
        label = 'Criminal Investigation Division',
        grades = {
            [0] = {
                name = 'Detective 1'
            },
            [1] = {
                name = 'Detective 2'
            },
            [2] = {
                name = 'Detective 3'
            },
            [3] = {
                name = 'Lead Detective',
                isboss = true,
                bankAuth = true
            },
        },
    }
}

