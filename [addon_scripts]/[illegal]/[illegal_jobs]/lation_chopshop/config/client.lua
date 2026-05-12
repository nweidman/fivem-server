return {
    ----------------------------------------------
    --     📊 Customize stats & leaderboard
    ----------------------------------------------

    -- Don't want to show the stats menu option at all?
    -- Set all stats below to false!
    stats = {
        -- Do you want to show the total vehicles chopped stat?
        vehicles = true,
        -- Do you want to show the total parts received stat?
        parts = true
    },

    -- Do you want to display the leaderboard?
    -- This shows the top 10 divers by XP
    -- 🗒️ Note: the leaderboard is not updated constantly
    -- It is only updated on server restarts & player logouts
    leaderboard = true,

    ----------------------------------------------
    --          🗺️ Customize blips
    ----------------------------------------------

    blips = {
        -- The location of the starting/main ped
        start = {
            -- Enable or disable the blip
            enable = false,
            -- Sprite ID (https://docs.fivem.net/docs/game-references/blips/)
            sprite = 225,
            -- Color (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
            color = 2,
            -- Size/scale
            scale = 0.9,
            -- Label
            label = 'Chop Shop'
        },
        -- The available chop zones
        zones = {
            enable = false,
            sprite = 225,
            color = 0,
            scale = 0.9,
            label = 'Chop Zones'
        }
    },

    ----------------------------------------------
    --     💃 Customize animations & props
    ----------------------------------------------

    anims = {
        chopWheel = {
            part1 = {
                dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
                clip = 'machinic_loop_mechandplayer'
            },
            part2 = {
                label = 'Removing part..',
                description = 'Using your lug wrench you start to remove the wheel',
                icon = 'fas fa-wrench',
                duration = nil,
                position = 'bottom',
                useWhileDead = false,
                canCancel = true,
                disable = { move = true, car = true, combat = true },
                anim = { },
                prop = { }
            }
        },
        chopDoor = {
            part1 = {
                dict = 'amb@world_human_welding@male@base',
                clip = 'base',
                fx = {
                    dict = 'scr_ih_fin',
                    name = 'scr_ih_fin_torch_lock_cutting',
                    pos = vec3(-0.18, 0.15, 0.0),
                    rot = vec3(0.0, 0.0, 0.0),
                    scale = 1.0
                },
                prop = {
                    model = 'prop_weld_torch',
                    pos = vec3(-0.01, 0.03, 0.02),
                    rot = vec3(0.0, 0.0, -1.5)
                }
            },
            part2 = {
                label = 'Removing part..',
                description = 'Using your torch you start to remove the door',
                icon = 'fas fa-fire',
                duration = nil,
                position = 'bottom',
                useWhileDead = false,
                canCancel = true,
                disable = { move = true, car = true, combat = true },
                anim = { },
                prop = { }
            }
        },
        chopFrame = {
            part1 = {
                dict = 'amb@world_human_welding@male@base',
                clip = 'base',
                fx = {
                    dict = 'scr_ih_fin',
                    name = 'scr_ih_fin_torch_lock_cutting',
                    pos = vec3(-0.18, 0.15, 0.0),
                    rot = vec3(0.0, 0.0, 0.0),
                    scale = 1.0
                },
                prop = {
                    model = 'prop_weld_torch',
                    pos = vec3(-0.01, 0.03, 0.02),
                    rot = vec3(0.0, 0.0, -1.5)
                }
            },
            part2 = {
                label = 'Scrapping frame..',
                description = 'You finish up the job by scrapping the frame',
                icon = 'fas fa-fire',
                duration = nil,
                position = 'bottom',
                useWhileDead = false,
                canCancel = true,
                disable = { move = true, car = true, combat = true },
                anim = { },
                prop = { }
            }
        },
        createGroup = {
            label = 'Creating group..',
            icon = 'fas fa-users',
            duration = 1000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = { car = true, move = true, combat = true },
            anim = { },
            prop = { }
        },
    }
}