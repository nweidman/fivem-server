local config = {}

config.debug = false -- Enable or disable debug mode

config.blur = false  -- Enable or disable blur effect

config.rewards = {   -- rewards for finished tutorial
    status = false,  -- if you set this to true, the rewards will be given
    items = {
        {
            name = 'money',
            amount = 100,
        },
        {
            name = 'sandwich',
            amount = 2,
        },
    },
}

config.itemImage = function(image)
    local BASE_URL = 'https://44417-cdn.fivemsvr.com/img/'
    return string.format('%s%s.png', BASE_URL, image)
end

config.hud = function(bool)
    if bool then
        DisplayRadar(true)
        Debug("HUD is disabled")
    else
        DisplayRadar(false)
        Debug("HUD is enabled")
    end
end

config.ped = {
    ["tutorial"] = {
        model = "a_f_y_tourist_01",
        coords = vector4(-1080.51, -1679.15, 3.97, 284.42),
        cameraCoords = vector4(-1078.60, -1678.81, 4.48, 91.65),
        scenario = 'PROP_HUMAN_SEAT_CHAIR_DRINK_BEER',
    },
    -- ["drugs"] = {
    --     model = "g_f_y_vagos_01",
    --     coords = vector4(-1080.51, -1679.15, 3.97, 284.42),
    --     cameraCoords = vector4(-1078.60, -1678.81, 4.48, 91.65),
    --     scenario = 'PROP_HUMAN_SEAT_CHAIR_DRINK_BEER',
    -- }
}

config.texts = {
    ["tutorial"] = {
        pedDialog = {
            title = "Greetings Traveler!",
            icon = 'mood-boy',
            description = [[
            Welcome, I'm Emma, and I've been told you're eager to get started here at .
            Fear not, for I'll be your guide to help get you started. 
            There is a lot to explore throughout the city, so feel free to create a ticket in our discord
            if you ever run into any problems or you have any questions! 
            You can also use /report to reach out to any staff members who are currently in the city.
        ]],
            buttons = {
                startLabel = 'Let\'s get started',
                dontLabel = 'No thanks, I don\'t need a guide'
            }
        },
        titles = {
            item = "Related Items",
            key = "Interaction Key",
        }
    },
    -- ["drugs"] = {
    --     pedDialog = {
    --         title = "Your Guide into the drug world",
    --         icon = 'mood-boy',
    --         description = [[
    --         Welcome, I'm Jeslin, and I've been told you're eager to learn about our city.
    --         Be warned, though, it's not the safest of places, but fear not, for I'll be your guide.
    --         Together, we'll embark on a journey to navigate and master the secrets of survival in this urban labyrinth.
    --         Let's begin our adventure and uncover what the city has to offer. Ready? Follow me."
    --     ]],
    --         buttons = {
    --             startLabel = 'Let\'s get started',
    --             dontLabel = 'No, I don\'t want to start'
    --         }
    --     },
    --     titles = {
    --         item = "Related Items",
    --         key = "Interaction Key",
    --     }
    -- }
}


config.coords = {
    ["tutorial"] = {
        [1] = {
            cameraCoords = vec4(184.66, -1060.53, 48.83, 138.78),
            info = {
                title = "Apartments",
                description =
                [[Every character begins with their very own apartment to get them started. It's important to note that this apartment is NOT permanent. 
                You can not own an apartment outright, so you will have to keep up with your rent daily. If your rent runs out, then you'll lose the apartment. 
                    You are only able to rent 1 apartment at a time. You can manage your apartment while inside using the F1 menu or by third eyeing the panel on the wall. 
                    This will allow you to view your rental status, place furniture, and more! Don't worry though, you start with 5 days of paid rent. 
                    You can extend your rent using the /extendrental command.]],
                icon = 'building-skyscraper',
                color = '#169145ff',
            },
            -- drawMarker = {          -- optional
            --     settings = {
            --         type = 22,       -- @https://docs.fivem.net/docs/game-references/markers/
            --         scale = 0.2,
            --         color = 'white', -- red, green, blue, yellow, black, white, aqua
            --         move = true,
            --     },
            --     coords = {
            --         vec3(177.44, -1073.1, 48.83),
            --         vec3(177.65, -1073.33, 48.33),
            --     }
            -- },
            -- items = {
            --     {
            --         label = "Jerry Can",
            --         image = config.itemImage('jerry_can')
            --     },
            --     {
            --         label = "Petrol Can",
            --         image = config.itemImage('weapon_petrolcan')
            --     },
            --     {
            --         label = "Repair Kit",
            --         image = config.itemImage('repairkit')
            --     },
            -- },
            -- key = 'ALT'
        },
        [2] = {
            cameraCoords = vec4(1335.40, -548.19, 74.46, 197.15),
            info = {
                title = "Houses",
                description = [[You can purchase a house or warehouse by contacting a real estate agent in the city. 
                The services app and birdy are two great places to start when trying to hunt down a realtor for an inquiry.]],
                icon = 'home-dollar',
                color = '#27a8dbff',
            },
        },
        [3] = {
            cameraCoords = vec4(279.98, -552.59, 43.31, 208.56),
            info = {
                title = "Medical",
                description = [[As you explore the city. It's inevitable that you encounter some danger. 
                Whether it be a beatdown from the resident locals or a stray car pummeling into you, you'll need to know how to get back on your feet. 
                There are a few ways to recieve medical assistance. First, you can purchase bandages from a nearby 24/7. 
                You also may find other items such as ifaks or painkillers to patch yourself up or temporarily make you feel better.
                If you have none of these items or your wounds are past a quick bandage, then you can always visit the Pillbox Hospital and check in at the desk.
                Don't have someone to take you to the Hospital? No worries! You can press G to call for an available EMS or use /help if no EMS are available.]],
                icon = 'medical-cross',
                color = '#ff6767ff',
            },
            drawMarker = {          -- optional
                settings = {
                    type = 2,       -- @https://docs.fivem.net/docs/game-references/markers/
                    scale = 0.2,
                    color = 'aqua', -- red, green, blue, yellow, black, white, aqua
                    move = true,
                },
                coords = {
                    -- vec3(315.86, -591.2, 43.19),
                }
            },
            items = {
                {
                    label = "Bandages",
                    image = config.itemImage('bandage')
                },
                {
                    label = "Ifaks",
                    image = config.itemImage('ifaks')
                },
                {
                    label = "Painkillers",
                    image = config.itemImage('painkillers')
                },
            },
        },
        [4] = {
            cameraCoords = vec4(-563.13, -1088.64, 22.18, 33.48),
            info = {
                title = "Food & Drink",
                description = [[As you explore the city, you'll start to feel a bit hungry and thirsty.
                Don't worry though, I have packed you a solid lunch that should last you for a while.
                When that food does run out though, you have two options. 
                You can visit a 24/7 store and purchase food there, but between you and me their food is never really all that filling. 
                I personally recommend visiting one of our many restaurants throughtout the city. You can use the services app to help determine who is open!
                And if you're one of those people who always forget to eat and drink, not to worry! A fitbit can remind you when you're hungry, and you can find one at any Digital Den.]],
                icon = 'milk',
                color = '#ca8a04'
            },
            -- drawMarker = {           -- optional
            --     settings = {
            --         type = 21,       -- @https://docs.fivem.net/docs/game-references/markers/
            --         scale = 0.1,
            --         color = 'white', -- red, green, blue, yellow
            --         move = true,
            --     },
            --     coords = {
            --         vec3(-3043.58, 582.84, 7.91),
            --     }
            -- },
            items = {
                {
                    label = "Hoagie",
                    image = config.itemImage('hoagie')
                },
                {
                    label = "Gummy Worms",
                    image = config.itemImage('gummyworms')
                },
                {
                    label = "Juice Box",
                    image = config.itemImage('juicebox')
                },
            },
            -- key = 'ALT'
        },
        [5] = {
            cameraCoords = vec4(-835.76, -227.26, 38.96, 117.59),
            info = {
                title = "Stress",
                description = [[The city can also get very stressful. So much so that you may start to experience blurry vision. 
                If that happens, you'll have to visit one of our two smoke shops in city: High Notes and SmoKing.
                High Notes has a variety of Joints and Edibles, while SmoKing offers an assortment of vapes and flavors.
                I've started you with a small box of cigarettes to get you started with stress relief, and you can always buy more at a 24/7 Store.
                Vape flavors will require you to have a vape, while joints and cigarettes require a lighter to smoke.
                ]],
                icon = 'cannabis',
                color = '#0e9250ff',
            },
            items = {
                {
                    label = "lighter",
                    image = config.itemImage('lighter')
                },
                {
                    label = "Vape",
                    image = config.itemImage('blackvape')
                },
            },
        },
        [6] = {
            cameraCoords = vec4(231.1, -815.4, 30.49, 280.37),
            info = {
                title = "Rentals",
                description = [[Not sure where to get started? Well you can start by renting a car or bicycle!
                Bicycle rentals can be found right outside of any apartment/motel building, trucking, the prison, or at the hospital.
                Looking for something faster? You can rent a car at the Legion Garage by third eyeing this fine gentleman.
                Keep in mind, you will have to repurchase a rental if you lose yours or a tsunami hits.]],
                icon = 'car-turbine',
                color = '#c76625ff',
            },
            items = { -- optional
                {
                    label = "Rental Papers",
                    image = config.itemImage('rentalpapers')
                },
                -- {
                --     label = "Driver Set",
                --     image = config.itemImage('screwdriverset')
                -- },
                -- {
                --     label = "Tablet",
                --     image = config.itemImage('tablet')
                -- },
            },
        },
        [7] = {
            cameraCoords = vec4(220.92, -1402.97, 38.89, 318.23),
            info = {
                title = "Driving School",
                description = [[Before you start driving, you'll want to make sure you get your drivers license. 
                This will save you some trouble if you ever get pulled over in the future. 
                The driving school has both a written and a practical exam that you'll have to go through before you obtain a license.
                Once you've passed the test, you can acquire your physical license at City Hall.
                If you're looking for a weapon's license, then you'll have to contact the Police Department.
                I highly recommend the services app if you ever need to contact the police.]],
                icon = 'id-badge-2',
                color = '#db536aff',
            },
            items = { -- optional
                {
                    label = "Rental Papers",
                    image = config.itemImage('rentalpapers')
                },
                -- {
                --     label = "Driver Set",
                --     image = config.itemImage('screwdriverset')
                -- },
                -- {
                --     label = "Tablet",
                --     image = config.itemImage('tablet')
                -- },
            },
        },
        [8] = {
            cameraCoords = vec4(-816.27, -253.75, 40.14, 119.02),
            info = {
                title = "Dealerships",
                description = [[
                There are 3 car dealerships in the city that sell brand new cars. Bandlands up in Paleto sells Motorcycles and Offroad vehicles. 
                At PDM, you'll find your everyday cars like Muscle Cars, Vans, SUVs, or trucks.
                Then finally, once you've got your money saved up, you can head over to Luxury Autos to browse their exotic sports and super cars.
                Every dealership has a catalogue that can be browsed at anytime to see what vehicles they have in stock.
                If you're looking to purchase a vehicle in stock, then you'll need to find an employee to come price it for you.
                    I again recommend using birdy or the services app to contact an employee!]],
                icon = 'car',
                color = '#bb38f8ff',
            },
            -- items = { -- optional
            --     {
            --         label = "Bait",
            --         image = config.itemImage('fishbait')
            --     },
            --     {
            --         label = "Fishingrod",
            --         image = config.itemImage('fishingrod')
            --     },
            --     {
            --         label = "Fish",
            --         image = config.itemImage('tuna')
            --     }
            -- },
        },
        [9] = {
            cameraCoords = vec4(-254.36, -989.59, 31.85, 19.26),
            info = {
                title = "City Hall",
                description = [[If you're looking for a quick and easy way to make a little bit of money, head over to the city hall!
                Here you can interact with two PEDs. One will sell you fresh copies of your ID card, and Licenses so you can always have one on hand.
                The other PED allows you to start various different jobs around the city from Construction and Garabage Collection to Farming or Hunting.
                Exploring the various legal activities is a great way to get situated in the city.]],
                icon = 'briefcase',
                color = '#f8d189ff',
            }
        },
        [10] = {
            cameraCoords = vec4(1734.26, 3724.94, 39.58, 209.18),
            info = {
                title = "Skills",
                description = [[As you explore the city and involve yourself in various activities, you'll slowly accumulate xp. 
                Once your xp reaches a certain threshold, you will level up and obtain skill points.
                These skill points allow you to upgrade various skills and improve your character's abilities.
                Skills range from additional stamina to faster work timers in your favorite job.
                You can view your skills at any point using the /skills command.
                Purchasing a gym membership every few hours is another great way to get some valuable xp!]],
                icon = 'wallet',
                color = '#059669',
            },
            drawMarker = {           -- optional
                settings = {
                    type = 6,        -- @https://docs.fivem.net/docs/game-references/markers/
                    scale = 0.1,
                    color = 'white', -- red, green, blue, yellow
                    move = false,
                },
                coords = {
                    vec3(147.68, -1035.79, 29.34),
                }
            },
        },
        [11] = {
            cameraCoords = vec4(622.13, 2712.64, 45.19, 2.93),
            info = {
                title = "Clothing Stores & Plastic Surgeon",
                description = [[If you're ever looking for a fresh new look, then you can head to any clothing store around the city to create the outfit of your desires.
                Similarly, if you are unhappy with your character's face or skin tone you can pay a visit to the plastic surgeon at the hospital.
                Barber shops and Tattoo Saloons offer some other ways to switch up your look should you desire. 
                If for whatever reason you closed the clothing menu early or didn't get a chance to complete your character at creation, feel free to contact a staff member to get a clothing menu.]],
                icon = 'hanger-2',
                color = '#e9ce37ff',
            }
        },
        [12] = {
            cameraCoords = vec4(-2080.04, -945.27, 10.38, 167.9),
            info = {
                title = "Store & Rewards",
                description = [[If you're looking to support the city in exchange for some custom cars, items, or other perks, then you can pay a visit to the store.
                Alternatively, the more time you spend in the city, the more coins you will build up in the menu.
                Once you've reached enough points you can access a variety of items and vehicles for purchase.]],
                icon = 'coins',
                color = '#46abefff',
            }
        },
        [13] = {
            cameraCoords = vec4(665.82, 736.5, 370.52, 348.86),
            info = {
                title = "Player & Bug Reporting",
                description = [[If you ever experience any issues or problems with another player, then we encourage you to open a report ticket to receive assistance from our staff team.
                    You can contact staff in city using /report. Sometimes staff may not be available, so you can always contact staff in the discord by opening a ticket.
                    I hope you enjoy your time here at , now go and explore the city!]],
                icon = 'checklist',
                color = '#535353ff',
            }
        },
    },
    -- ["drugs"] = {
    --     [1] = {
    --         cameraCoords = vec4(1782.17, 3323.41, 41.30, 332.54),
    --         info = {
    --             title = "Gas Station",
    --             description =
    --             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    --             icon = 'gas-station',
    --             color = '#dc2626',
    --         },
    --         drawMarker = {          -- optional
    --             settings = {
    --                 type = 6,       -- @https://docs.fivem.net/docs/game-references/markers/
    --                 scale = 0.1,
    --                 color = 'aqua', -- red, green, blue, yellow, black, white, aqua
    --                 move = true,
    --             },
    --             coords = {
    --                 vec3(1785.82, 3329.60, 41.42),
    --                 vec3(1784.82, 3331.22, 41.36),
    --             }
    --         },
    --         items = {
    --             {
    --                 label = "Jerry Can",
    --                 image = config.itemImage('jerry_can')
    --             },
    --             {
    --                 label = "Petrol Can",
    --                 image = config.itemImage('weapon_petrolcan')
    --             },
    --             {
    --                 label = "Repair Kit",
    --                 image = config.itemImage('repairkit')
    --             },
    --         },
    --         key = 'ALT'
    --     },
    -- }
}

return config
