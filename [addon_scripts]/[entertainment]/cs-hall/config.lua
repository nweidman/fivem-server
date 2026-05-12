-- Find extra entries, integrations, controllers and more, in our GitHub (https://github.com/criticalscripts-shop/extra-hac/tree/main/cs-hall) and in our Discord (https://criticalscripts.shop/discord).

config = {
    -- Set whether you want to be informed in your server's console about updates regarding this resource.
    ['updatesCheck'] = false,

    -- Enabling debug will draw lines useful for debugging, especially when creating a new config entry.
    ['debug'] = false,

    -- The DUI URL, by default loaded locally.
    ['duiUrl'] = 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/index.html',

    -- Strings through-out the resource to translate them if you wish.
    ['lang'] = {
        ['addToQueue'] = 'Add to Queue',
        ['bassSmoke'] = 'Bass Smoke',
        ['bassSparklers'] = 'Bass Sparklers',
        ['triggerSmoke'] = 'Trigger Smoke',
        ['triggerSparklers'] = 'Trigger Sparklers',
        ['whiteSpotlights'] = 'White Spotlights',
        ['dynamicSpotlights'] = 'Dynamic Spotlights',
        ['photorythmicSpotlights'] = 'Photorythmic Spotlights',
        ['whiteVehicles'] = 'White Vehicles',
        ['dynamicVehicles'] = 'Dynamic Vehicles',
        ['photorythmicVehicles'] = 'Photorythmic Vehicles',
        ['videoToggle'] = 'Video Toggle',
        ['screenControl'] = 'Screen Control',
        ['remoteControl'] = 'Remote Control',
        ['play'] = 'Play',
        ['queueNow'] = 'Queue Now',
        ['queueNext'] = 'Queue Next',
        ['remove'] = 'Remove',
        ['pause'] = 'Pause',
        ['stop'] = 'Stop',
        ['skip'] = 'Skip',
        ['loop'] = 'Loop',
        ['volume'] = 'Volume',
        ['invalidUrl'] = 'URL invalid.',
        ['sourceError'] = 'Playable media error occurred.',
        ['sourceNotFound'] = 'Playable media not be found.',
        ['queueLimitReached'] = 'The queue has already too many entries.',
        ['scenes'] = 'Scenes',
        ['allUrlPlaceholder'] = 'URL',
        ['frame'] = 'Frame'
    },

    -- Loading related timeouts, default values should work in most servers.
    ['timeouts'] = {
        ['scaleformRequestMs'] = 30000,
        ['assetLoadMs'] = 30000,
        ['syncAssetLoadMs'] = 3000
    },

    -- Visit our Discord over at https://criticalscripts.shop/discord to get more entries and share yours too!

    ['entries'] = {
        -- Vanilla Unicorn
        -- If you are using the default Vanilla Unicorn or a similar variant of it, keep it enabled below.

        ['playboy'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://cdn.discordapp.com/attachments/900418600270184518/1119010462873432084/logo1920x1080.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = false
                },

                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = false
                }
            },

            ['area'] = {
                ['range'] = 164.0,
                ['center'] = vector3(-1529.47, 116.14, 58.59),
                ['height'] = nil,
                ['polygons'] = nil
            },

            ['disableEmitters'] = nil,
            ['scaleform'] = nil,

            ['replacers'] = {
                ['prop_tv_flat_01'] = 'script_rt_tvscreen',
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
            },
            

            ['monitors'] = {
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(-1464.6, 172.51, 58.73),
                    ['rotation'] = nil,
                    ['heading'] = 319.52,
                    ['lodDistance'] = nil
                },
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(-1482.93, 155.41, 56.90),
                    ['rotation'] = nil,
                    ['heading'] = 141.52,
                    ['lodDistance'] = nil
                },
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(-1488.24, 198.74, 59.69),
                    ['rotation'] = nil,
                    ['heading'] = 72.06,
                    ['lodDistance'] = nil
                }
            },

            ['screens'] = nil,

            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1468.40, 178.95, 57.47),
                    ['rotation'] = nil,
                    ['heading'] = 282.255199432373,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 1, 1}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1465.8, 175.17, 58.85),
                    ['rotation'] = nil,
                    ['heading'] = 296.44,
                    ['lodDistance'] = nil,
                    ['color'] = {250, 250, 250}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1508.62, 174.37, 61.45),
                    ['rotation'] = nil,
                    ['heading'] = 75.44,
                    ['lodDistance'] = nil,
                    ['color'] = {250, 250, 250}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1505.18, 154.89, 59.97),
                    ['rotation'] = nil,
                    ['heading'] = 134.39436340332,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1502.96, 150.35, 60.4),
                    ['rotation'] = nil,
                    ['heading'] = 55.98,
                    ['lodDistance'] = nil,
                    ['color'] = {15, 3, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1501.25, 132.35, 62.26),
                    ['rotation'] = nil,
                    ['heading'] = 149.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                },  

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1540.77, 109.96, 61.00),
                    ['rotation'] = nil,
                    ['heading'] = 226.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },   

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1538.68, 128.74, 62.70),
                    ['rotation'] = nil,
                    ['heading'] = 318.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },   

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1558.37, 131.68, 64.93),
                    ['rotation'] = nil,
                    ['heading'] = 37.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1477.0, 64.73, 59.54),
                    ['rotation'] = nil,
                    ['heading'] = 66.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1509.05, 94.55, 63.17),
                    ['rotation'] = nil,
                    ['heading'] = 11.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1534.81, 99.59, 63.0),
                    ['rotation'] = nil,
                    ['heading'] = 35.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },


                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1489.52, 110.74, 62.63),
                    ['rotation'] = nil,
                    ['heading'] = 76.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1496.82, 102.92, 62.59),
                    ['rotation'] = nil,
                    ['heading'] = 6.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1493.33, 125.2, 62.26),
                    ['rotation'] = nil,
                    ['heading'] = 140.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },      

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1461.86, 204.65, 64.36),
                    ['rotation'] = nil,
                    ['heading'] = 125.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                }, 

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1522.89, 147.67, 62.65),
                    ['rotation'] = nil,
                    ['heading'] = 73.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },  
                                
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1451.77, 241.08, 64.1),
                    ['rotation'] = nil,
                    ['heading'] = 12.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },     

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1488.08, 198.89, 61.14),
                    ['rotation'] = nil,
                    ['heading'] = 71.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },  

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1434.11, 196.62, 64.22),
                    ['rotation'] = nil,
                    ['heading'] = 246.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                },   

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1438.13, 214.73, 62.98),
                    ['rotation'] = nil,
                    ['heading'] = 330.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                },   

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1467.29, 194.04, 61.91),
                    ['rotation'] = nil,
                    ['heading'] = 344.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                }, 

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1426.58, 209.14, 65.03),
                    ['rotation'] = nil,
                    ['heading'] = 271.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                },   

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1464.07, 178.96, 58.13),
                    ['rotation'] = nil,
                    ['heading'] = 100.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                }, 

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1462.52, 233.66, 67.5),
                    ['rotation'] = nil,
                    ['heading'] = 23.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },       

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1439.06, 218.21, 62.99),
                    ['rotation'] = nil,
                    ['heading'] = 245.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },    
                
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1455.74, 184.26, 57.89),
                    ['rotation'] = nil,
                    ['heading'] = 353.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },  
                
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1453.64, 141.64, 59.85),
                    ['rotation'] = nil,
                    ['heading'] = 247.05226135254,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                }
            },

            ['smokers'] = {
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1478.03, 63.13, 52.58),
                    ['rotation'] = nil,
                    ['heading'] = 4.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1466.25, 63.29, 52.0),
                    ['rotation'] = nil,
                    ['heading'] = 4.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1491.51, 90.08, 53.94),
                    ['rotation'] = nil,
                    ['heading'] = 8.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1483.74, 156.42, 53.67),
                    ['rotation'] = nil,
                    ['heading'] = 140.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1481.67, 154.77, 53.7),
                    ['rotation'] = nil,
                    ['heading'] = 140.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1467.63, 176.65, 56.7),
                    ['rotation'] = nil,
                    ['heading'] = 295.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1488.2, 199.29, 55.72),
                    ['rotation'] = nil,
                    ['heading'] = 68.93,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1433.3, 200.64, 57.14),
                    ['rotation'] = nil,
                    ['heading'] = 214.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1438.66, 214.33, 56.61),
                    ['rotation'] = nil,
                    ['heading'] = 354.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1501.46, 133.17, 54.65),
                    ['rotation'] = nil,
                    ['heading'] = 176.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1461.29, 183.44, 54.92),
                    ['rotation'] = nil,
                    ['heading'] = 49.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1452.06, 180.78, 54.92),
                    ['rotation'] = nil,
                    ['heading'] = 283.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                }
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1467.9, 67.12, 52.24),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1473.83, 66.97, 52.29),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1473.83, 66.97, 52.29),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1533.81, 99.55, 55.76),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1529.74, 103.8, 55.77),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1537.77, 127.22, 55.82),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1540.31, 129.56, 55.8),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1484.87, 157.2, 53.64),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1480.75, 154.08, 53.72),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1460.83, 179.06, 62.18),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1464.14, 181.88, 60.94),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1463.23, 174.0, 59.15),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1486.81, 201.63, 55.68),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1472.2, 198.43, 55.67),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1446.86, 203.07, 56.43),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                }
            },

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1466.63, 70.23, 52.34),
                    ['rotation'] = nil,
                    ['heading'] = 188.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1486.53, 89.97, 53.79),
                    ['rotation'] = nil,
                    ['heading'] = 356.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1518.57, 101.45, 55.45),
                    ['rotation'] = nil,
                    ['heading'] = 317.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1537.62, 96.09, 55.78),
                    ['rotation'] = nil,
                    ['heading'] = 50.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1540.1, 122.72, 55.78),
                    ['rotation'] = nil,
                    ['heading'] = 265.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1558.81, 128.24, 55.83),
                    ['rotation'] = nil,
                    ['heading'] = 42.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1534.46, 115.84, 54.64),
                    ['rotation'] = nil,
                    ['heading'] = 133.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1508.74, 127.56, 54.64),
                    ['rotation'] = nil,
                    ['heading'] = 284.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1511.42, 112.92, 54.64),
                    ['rotation'] = nil,
                    ['heading'] = 45.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1497.63, 132.41, 54.65),
                    ['rotation'] = nil,
                    ['heading'] = 172.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1518.54, 140.7, 54.65),
                    ['rotation'] = nil,
                    ['heading'] = 136.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1485.29, 156.25, 53.52),
                    ['rotation'] = nil,
                    ['heading'] = 179.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1480.84, 153.36, 53.63),
                    ['rotation'] = nil,
                    ['heading'] = 98.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1457.32, 174.38, 54.92),
                    ['rotation'] = nil,
                    ['heading'] = 187.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1488.53, 197.73, 55.67),
                    ['rotation'] = nil,
                    ['heading'] = 81.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1439.06, 216.58, 56.88),
                    ['rotation'] = nil,
                    ['heading'] = 244.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1441.22, 238.53, 58.99),
                    ['rotation'] = nil,
                    ['heading'] = 322.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1473.66, 227.13, 58.11),
                    ['rotation'] = nil,
                    ['heading'] = 57.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                }
            }
        },

        -- Vanilla Unicorn
--         ['vanilla'] = {
--             ['enabled'] = true,
--             ['maxVolumePercent'] = 100,
        
--             ['idleWallpaperUrl'] = 'https://cdn.discordapp.com/attachments/1194238179956490311/1253078054348128297/VU-Discord-BG-Revised.png?ex=66748b61&is=667339e1&hm=cafa84c75d88b8cc23e07b42cb935b2bf5032a0f8c32c4ca5a2fa997a704592f&',
        
--             ['bass'] = {
--                 ['smoke'] = {
--                     ['cooldownMs'] = 30000,
--                     ['colorWithDynamicSpotlights'] = true
--                 },
        
--                 ['sparklers'] = {
--                     ['cooldownMs'] = 30000,
--                     ['colorWithDynamicSpotlights'] = true
--                 }
--             },
        
        
--             ['area'] = {
--                 ['range'] = 60.0,
--                 ['center'] = vector3(116.48, -1290.19, 28.46),
--                 ['height'] = nil,
        
--                 ['polygons'] = {
--                     ['applyLowPassFilterOutside'] = true,
--                     ['invertLowPassApplication'] = false,
--                     ['hideReplacersOutside'] = true,
        
--                     ['entries'] = {
--                         {  
--                             ['height'] = {
--                                 ['min'] = 27.0,
--                                 ['max'] = 35.0
--                             },
        
--                             ['points'] = {
--                                 vector2(139.64, -1285.80),
--                                 vector2(133.90, -1275.69),
--                                 vector2(118.24, -1279.33),
--                                 vector2(118.66, -1281.03),
--                                 vector2(108.11, -1286.74),
--                                 vector2(104.78, -1281.90),
--                                 vector2(100.52, -1282.45),
--                                 vector2(114.23, -1305.23),
--                                 vector2(125.81, -1298.40),
--                                 vector2(124.53, -1295.02)
        
--                             }
--                         },
--                         {
--                             ['height'] = {
--                                 ['min'] = 18.0,
--                                 ['max'] = 25.5
--                             },
        
--                             ['points'] = {
--                                 vector2(127.97, -1288.97),
--                                 vector2(134.91, -1302.15),
--                                 vector2(118.96, -1311.48),
--                                 vector2(114.32, -1304.98),
--                                 vector2(95.97, -1316.19),
--                                 vector2(86.51, -1298.29),
--                                 vector2(104.68, -1287.97),
--                                 vector2(101.63, -1280.97),
--                                 vector2(117.66, -1271.90),
--                                 vector2(124.88, -1284.80),
--                                 vector2(120.01, -1287.58),
--                                 vector2(116.35, -1281.56),
--                                 vector2(110.61, -1284.83),
--                                 vector2(113.97, -1291.05),
--                                 vector2(108.43, -1294.42),
--                                 vector2(110.98, -1298.69),
--                                 vector2(116.60, -1295.35),
--                                 vector2(120.34, -1301.85), 
--                                 vector2(126.28, -1298.26),
--                                 vector2(122.55, -1291.91)
        
--                             }
                            
--                         },
--                     }
--                 }
--             },
        
--             ['replacers'] = {
--                 ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
--                 ['v_ilev_cin_screen'] = 'script_rt_cinscreen',
--             },
        
--             ['monitors'] = {
--                 {
--                     ['hash'] = 'ba_prop_battle_club_screen_02',
--                     ['position'] = vector3(105.99, -1292.00, 30.22),
--                     ['heading'] = 120.48,
--                     ['lodDistance'] = 323.98
--                 },
--                 {
--                     ['hash'] = 'ba_prop_battle_club_screen_02',
--                     ['position'] = vector3(112.38, -1302.70, 30.22),
--                     ['heading'] = 120.48,
--                     ['lodDistance'] = 323.98
--                 }
-- --[[                 {
--                     ['hash'] = 'v_ilev_cin_screen',
--                     ['position'] = vector3(93.0, -1306.00, 23.39),
--                     ['heading'] = 120.48,
--                     ['lodDistance'] = 323.98
--                 } ]]
        
        
--             },
        
--             ['spotlights'] = {
--                 {
--                     ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
--                     ['hash'] = 'cs_prop_hall_spotlight',
--                     ['position'] = vector3(111.05, -1287.86, 32.15),
--                     ['heading'] = 61.62,
--                     ['color'] = {255, 5, 190}
--                 },
        
--                 {
--                     ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
--                     ['hash'] = 'cs_prop_hall_spotlight',
--                     ['position'] = vector3(108.12, -1289.0, 32.0),
--                     ['heading'] = 61.62,
--                     ['color'] = {255, 255, 0}
--                 },
        
--                 {
--                     ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
--                     ['hash'] = 'cs_prop_hall_spotlight',
--                     ['position'] = vector3(115.85, -1284.91, 32.15),
--                     ['heading'] = 61.62,
--                     ['color'] = {3, 83, 255}
--                 },
        
--                 {
--                     ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
--                     ['hash'] = 'cs_prop_hall_spotlight',
--                     ['position'] = vector3(118.03, -1284.0, 32.15),
--                     ['heading'] =  61.62,
--                     ['color'] = {15, 3, 255}
--                 }
        
--             },
        
--             ['disableEmitters'] = {
--                 'LOS_SANTOS_VANILLA_UNICORN_01_STAGE',
--                 'LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM',
--                 'LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM'
--             },
        
        
--             ['speakers'] = {
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = false,
--                     ['position'] = vector3(133.14, -1284.71, 29.22),
--                     ['heading'] = 121.54,
--                     ['soundOffset'] = vector3(0, 0, 0),
--                     ['refDistance'] = 32.0,
--                     ['lodDistance'] = 256.0,
--                     ['rolloffFactor'] = 1.5
--                 },
                
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = false,
--                     ['position'] = vector3(90.96, -1304.18, 21.86),
--                     ['heading'] = 300.4,
--                     ['soundOffset'] = vector3(0, 0, 0),
--                     ['refDistance'] = 32.0,
--                     ['lodDistance'] = 256.0,
--                     ['rolloffFactor'] = 1.5
--                 },
        
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = false,
--                     ['position'] = vector3(103.31, -1283.24, 29.22),
--                     ['heading'] = 214.3,
--                     ['soundOffset'] = vector3(0, 0, 0),
--                     ['refDistance'] = 32.0,
--                     ['lodDistance'] = 256.0,
--                     ['rolloffFactor'] = 1.5
--                 },
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = false,
--                     ['position'] = vector3(112.99, -1305.34, 20.39),
--                     ['heading'] = 245.7171,
--                     ['soundOffset'] = vector3(0, 0, 0),
--                     ['refDistance'] = 32.0,
--                     ['lodDistance'] = 256.0,
--                     ['rolloffFactor'] = 1.5
--                 },
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = false,
--                     ['position'] = vector3(103.97, -1289.14, 20.39),
--                     ['heading'] = 331.7633,
--                     ['soundOffset'] = vector3(0, 0, 0),
--                     ['refDistance'] = 32.0,
--                     ['lodDistance'] = 256.0,
--                     ['rolloffFactor'] = 1.5
--                 },
--              }
        
--         },
        -- High Note
        ['highnote'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://i.postimg.cc/tCRvHJCD/m-Uc-CMpx.gif',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = false
                },

                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = false
                }
            },
        
        
            ['area'] = {
                ['range'] = 60.0,
                ['center'] = vector3(-849.70, -232.78, 61.03),
                ['height'] = nil,
        
                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,
        
                    ['entries'] = {
                        {  
                            ['height'] = {
                                ['min'] = 36.0,
                                ['max'] = 40.00
                            },
        
                            ['points'] = {
                                vector2(-848.10, -220.92),
                                vector2(-835.55, -241.21),
                                vector2(-840.38, -243.25),
                                vector2(-842.91, -238.46),
                                vector2(-848.63, -241.88),
                                vector2(-854.17, -230.19),
                                vector2(-848.32, -226.96),
                                vector2(-850.73, -222.69)
        
                            }
                        },
                        {
                            ['height'] = {
                                ['min'] = 59.0,
                                ['max'] = 69.0
                            },
        
                            ['points'] = {
                                vector2(-835.79, -241.36),
                                vector2(-859.46, -244.12),
                                vector2(-872.97, -218.10),
                                vector2(-865.52, -213.61),
                                vector2(-860.93, -213.52),
                                vector2(-855.74, -212.90),
                                vector2(-853.83, -216.11),
                                vector2(-846.81, -219.46),
                                vector2(-834.32, -241.13),
                                vector2(-834.49, -243.08),
                                vector2(-835.32, -243.71),
                                vector2(-840.34, -239.69),
                                vector2(-842.19, -236.59),
                                vector2(-844.19, -237.60),
                                vector2(-843.59, -239.26),
                                vector2(-849.05, -236.61),
                                vector2(-852.19, -236.78),
                                vector2(-854.07, -238.01),
                                vector2(-855.47, -240.36),
                                vector2(-855.69, -242.51)
        
                            }
                            
                        },
                        {
                            ['height'] = {
                                ['min'] = 29.0,
                                ['max'] = 33.0
                            },
        
                            ['points'] = {
                                vector2(-841.05, -238.04),
                                vector2(-848.82, -223.81),
                                vector2(-855.42, -227.61),
                                vector2(-847.81, -242.19)
        
                            }
                            
                        },
                    }
                }
            },
        
            ['replacers'] = {
                ['prop_tv_flat_michael'] = 'script_rt_tvscreen',
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
            },

            ['monitors'] = {
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(-850.65, -236.60, 64.00),
                    ['rotation'] = nil,
                    ['heading'] = 182.8409,
                    ['lodDistance'] = nil
                },
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(-860.35, -233.14, 63.00),
                    ['rotation'] = nil,
                    ['heading'] = 28.0,
                    ['lodDistance'] = nil
                }
            },
        
            ['smokers'] = {
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-863.43, -234.96, 60.31),
                    ['rotation'] = nil,
                    ['heading'] = 69.1127,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                }
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-856.05, -239.65, 60.01),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-859.52, -239.45, 60.01),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
            },
                
            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-858.90, -243.01, 60.99),
                    ['heading'] = 174.0012,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 10.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-856.23, -213.46, 61.59),
                    ['heading'] = 333.3170,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 10.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-867.80, -216.02, 60.01),
                    ['heading'] = 8.6832,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 10.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-835.14, -242.64, 60.01),
                    ['heading'] = 210.4496,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 10.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-848.91, -221.88, 36.19),
                    ['heading'] = 19.2280,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 10.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-837.13, -240.77, 36.19),
                    ['heading'] = 248.6682,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 10.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-851.87, -226.24, 30.06),
                    ['heading'] = 26.8873,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 10.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
             }
        
        },


        ['moo'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://i.postimg.cc/C1dLcVpQ/moomoo.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,
 
            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },
 
                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },
 
            ['monitors'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_screen_02',
                    ['position'] = vector3(-570.5315, -1061.4529, 24.1948),
                    ['heading'] = 270.0
                }
            },
 
            ['area'] = {
                ['range'] = 98,
                ['center'] = vector3(-580.13, -1056.95, 23.3),
 
                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
 
                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 20.0,
                                ['max'] = 35.0
                            },
 
                            ['points'] = {
                               vec2(-607.24, -1079.52),
                               vec2(-591.0, -1087.98),
                               vec2(-563.35, -1086.99),
                               vec2(-563.45, -1044.5),
                               vec2(-582.43, -1037.61),
                               vec2(-600.72, -1037.46),
                               vec2(-601.42, -1046.93),
                               vec2(-613.78, -1047.98)
                            }
                        }
                    }
                }
            },
 
            ['replacers'] = {
                ['prop_tv_flat_01'] = 'script_rt_tvscreen',
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv'
            },
            
            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-575.8, -1048.63, 23.11), --vector3(-587.09, -1068.6, 25.99)
                    ['heading'] = 311.08, --306.86
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-582.16, -1048.77, 23.11), --vector3(-587.09, -1068.6, 25.99)
                    ['heading'] = 39.02, --306.86
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-587.35, -1069.67, 23.11), --vector3(-587.09, -1068.6, 25.99)
                    ['heading'] = 146.34, --306.86
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-570.57, -1070.13, 23.11), --vector3(-587.09, -1068.6, 25.99)
                    ['heading'] = 229.81, --306.86
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                } 
            }
        },
        ['smoking'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://i.postimg.cc/RFzsKKbB/smoking.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,
 
 
            ['replacers'] = {
                ['prop_tv_flat_01'] = 'script_rt_tvscreen',
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
            },

            ['monitors'] = {
                -- {
                --     ['hash'] = 'h4_prop_battle_club_screen',
                --     ['position'] = vec3(433.36, -1890.47, 30.14),
                --     ['rotation'] = nil,
                --     ['heading'] = 127.46,
                --     ['lodDistance'] = nil
                -- },
                {
                    ['hash'] = 'prop_tv_flat_01',
                    ['position'] = vec3(440.40, -1893.49, 27.30),
                    ['rotation'] = nil,
                    ['heading'] = 217.97,
                    ['lodDistance'] = nil
                }
            },
             
            ['area'] = {
                ['range'] = 30,
                ['center'] = vec3(435.79, -1888.02, 26.97),
 
                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
 
                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 25.0,
                                ['max'] = 30.0
                            },
 
                            ['points'] = {
                                vec2(433.1, -1872.99), 
                                vec2(420.74, -1883.3), 
                                vec2(441.72, -1906.21), 
                                vec2(454.66, -1896.52),  
                            }
                        }
                    }
                }
            },
             
            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(446.54, -1895.31, 27.26), 
                    ['rotation'] = nil,
                    ['heading'] = 266.3,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(441.29, -1900.8, 27.09), 
                    ['rotation'] = nil,
                    ['heading'] = 182.52,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(429.22, -1885.66, 26.82), 
                    ['rotation'] = nil,
                    ['heading'] = 87.09,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(435.44, -1880.61, 26.8), 
                    ['rotation'] = nil,
                    ['heading'] = 3.54,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                }
            }
        },
        ['lilypad'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://cdn.discordapp.com/attachments/1427796269077631007/1445928431211774127/09c8e3334b165f68ab486f3a8cc31197.png?ex=6932214a&is=6930cfca&hm=24989dcceffd9e70c8b42d9bb8b5e2b5c56c022fd4fa858106e3b59731619e37&',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,
 
            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },
 
                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },
 
            ['replacers'] = {
                ['big_screens'] = 'script_rt_big_disp',
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
            },
            
            ['scaleform'] = {
                ['solid'] = true,
                ['position'] = vector3(92.8770, 6571.6763, 46.7737),
                ['rotation'] = vector3(0, 0, 45.00),
                ['scale'] = vector3(1.059999969, 0.564999985, -0.1)
            },
       
            ['monitors'] = {
                -- {
                --     ['hash'] = 'prop_huge_display_01',
                --     ['position'] = vec3(1087.08, -678.61, 58.54), 
                --     ['heading'] = 138.55
                -- },
                {
                    ['hash'] = 'ba_prop_battle_club_screen_02',
                    ['position'] = vec3(1114.95, -639.99, 58.29),
                    ['rotation'] = nil,
                    ['heading'] = 11.46,
                    ['lodDistance'] = nil
                }
            },
 
            ['area'] = {
                ['range'] = 98,
                ['center'] = vec3(1110.85, -648.19, 56.65),
 
                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
 
                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 50.5,
                                ['max'] = 65.00
                            },
 
                            ['points'] = {
                               vec2(1151.13, -668.87), 
                                vec2(1092.55, -691.07), 
                                vec2(1071.95, -673.79), 
                                vec2(1083.98, -634.66),
                                vec2(1146.76, -622.42)


                            }
                        }
                    }
                }
            },
            
            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(1122.99, -658.19, 56.4), 
                    ['rotation'] = nil,
                    ['heading'] = 233.35,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 100.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 2.5,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(1117.62, -634.49, 56.4), 
                    ['rotation'] = nil,
                    ['heading'] = 320.59,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 100.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 2.5,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(1097.01, -638.26, 56.4), 
                    ['rotation'] = nil,
                    ['heading'] = 68.15,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 100.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 2.5,
                    ['lowPassGainReductionPercent'] = 15
                }, 
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(1101.44, -663.17, 56.4), 
                    ['rotation'] = nil,
                    ['heading'] = 145.95,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 100.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.5,
                    ['lowPassGainReductionPercent'] = 15
                },
                -- {
                --     ['hash'] = 'ba_prop_battle_club_speaker_large',
                --     ['visible'] = false,
                --     ['position'] = vector3(48.15, 6565.31, 30.32), 
                --     ['rotation'] = nil,
                --     ['heading'] = 45.0,
                --     ['lodDistance'] = nil,
                --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                --     ['directionOffset'] = nil,
                --     ['maxDistance'] = 100.0,
                --     ['refDistance'] = 16.0,
                --     ['rolloffFactor'] = 1.25,
                --     ['coneInnerAngle'] = 90,
                --     ['coneOuterAngle'] = 180,
                --     ['coneOuterGain'] = 0.5,
                --     ['fadeDurationMs'] = 250,
                --     ['volumeMultiplier'] = 1.5,
                --     ['lowPassGainReductionPercent'] = 15
                -- },
                -- {
                --     ['hash'] = 'ba_prop_battle_club_speaker_large',
                --     ['visible'] = false,
                --     ['position'] = vector3(104.96, 6508.02, 30.39), 
                --     ['rotation'] = nil,
                --     ['heading'] = 223.96,
                --     ['lodDistance'] = nil,
                --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                --     ['directionOffset'] = nil,
                --     ['maxDistance'] = 100.0,
                --     ['refDistance'] = 16.0,
                --     ['rolloffFactor'] = 1.25,
                --     ['coneInnerAngle'] = 90,
                --     ['coneOuterAngle'] = 180,
                --     ['coneOuterGain'] = 0.5,
                --     ['fadeDurationMs'] = 250,
                --     ['volumeMultiplier'] = 1.5,
                --     ['lowPassGainReductionPercent'] = 15
                -- },
                -- {
                --     ['hash'] = 'ba_prop_battle_club_speaker_large',
                --     ['visible'] = false,
                --     ['position'] = vector3(35.57, 6547.25, 30.45), 
                --     ['rotation'] = nil,
                --     ['heading'] = 94.44,
                --     ['lodDistance'] = nil,
                --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                --     ['directionOffset'] = nil,
                --     ['maxDistance'] = 100.0,
                --     ['refDistance'] = 16.0,
                --     ['rolloffFactor'] = 1.25,
                --     ['coneInnerAngle'] = 90,
                --     ['coneOuterAngle'] = 180,
                --     ['coneOuterGain'] = 0.5,
                --     ['fadeDurationMs'] = 250,
                --     ['volumeMultiplier'] = 2.5,
                --     ['lowPassGainReductionPercent'] = 15
                -- }
             }
        },
        ['pitapan'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://r2.fivemanage.com/pME1XcKB17GDqSwS7AlUD/Pita.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,
 
            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },
 
                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },

            ['disableEmitters'] = {
                'LOS_SANTOS_VANILLA_UNICORN_01_STAGE',
                'LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM',
                'LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM'
            },
 
            ['replacers'] = {
                ['prop_tv_flat_01'] = 'script_rt_tvscreen',
                ['v_ilev_cin_screen'] = 'script_rt_tvscreen',
            },
                          
             ['monitors'] = {
                {
                    ['hash'] = 'prop_tv_flat_01',
                    ['position'] = vec3(251.11, -825.36, 30.64), 
                    ['heading'] = 160.97
                }
            },
            
 
            ['area'] = {
                ['range'] = 30,
                ['center'] = vec3(252.27, -819.26, 30.21),
 
                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
 
                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 28.50,
                                ['max'] = 35.00
                            },
 
                            ['points'] = {
                                vec2(238.22, -826.65), 
                                vec2(255.14, -833.44), 
                                vec2(266.73, -818.95), 
                                vec2(269.18, -804.9),
                                vec2(248.02, -798.12),
                            }
                        }
                    }
                }
            },
            
            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(245.74, -822.76, 30.16), 
                    ['rotation'] = nil,
                    ['heading'] = 119.02,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 35.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(256.48, -826.99, 30.16), 
                    ['rotation'] = nil,
                    ['heading'] = 197.77,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 35.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(260.36, -816.45, 30.16), 
                    ['rotation'] = nil,
                    ['heading'] = 299.37,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 35.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(248.97, -812.33, 30.16), 
                    ['rotation'] = nil,
                    ['heading'] = 27.56,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 35.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
             }
        },
        ['boathouse'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://i.postimg.cc/TPMgp7P7/first-try-(1).jpg',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,
 
            ['bass'] = nil,

            ['disableEmitters'] = nil,
            ['scaleform'] = nil,
 
            ['replacers'] = {
                ['prop_tv_flat_01'] = 'script_rt_tvscreen',
                ['prop_tv_flat_michael'] = 'script_rt_tvscreen',
            },
                        
            ['area'] = {
                ['range'] = 100,
                ['center'] = vec3(1526.26, 3789.1, 34.52),
 
                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
 
                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 30.00,
                                ['max'] = 42.00
                            },
 
                            ['points'] = {
                                vec2(1507.83, 3763.07),
                                vec2(1527.96, 3765.52),
                                vec2(1566.2, 3780.37),
                                vec2(1557.44, 3834.51),
                                vec2(1483.42, 3782.12)
                            }
                        }
                    }
                }
            },

            ['monitors'] = {
                {
                    ['hash'] = 'prop_tv_flat_01',
                    ['position'] = vec3(1535.94, 3785.95, 35.41), 
                    ['heading'] = 298.53
                }
            },
            
            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(1509.96, 3772.26, 34.51), 
                    ['rotation'] = nil,
                    ['heading'] = 140.62,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 35.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(1519.39, 3786.25, 34.56), 
                    ['rotation'] = nil,
                    ['heading'] = 79.39,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 35.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                 {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(1536.85, 3783.91, 34.51), 
                    ['rotation'] = nil,
                    ['heading'] = 251.45,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 35.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                 {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(1549.08, 3801.62, 34.51), 
                    ['rotation'] = nil,
                    ['heading'] = 299.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 35.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                 {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(1518.93, 3796.68, 33.51), 
                    ['rotation'] = nil,
                    ['heading'] = 35.07,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 35.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
             }
        },

        -- Stance House
        ['stance'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://i.postimg.cc/PxtYKKCZ/image.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['area'] = {
                ['range'] = 98,
                ['center'] = vec3(-3075.33, 446.3, 6.96),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = -2.0,
                                ['max'] = 20.0
                            },
        
                            ['points'] = {
                                vec2(-3039.37, 458.46),
                                vec2(-3106.89, 498.59),
                                vec2(-3140.12, 434.79),
                                vec2(-3065.47, 405.23)
                            }
                        },
                    }
                }
            },

            ['disableEmitters'] = nil,
            ['scaleform'] = nil,

            ['replacers'] = {
                ['vw_prop_vw_cinema_tv_01'] = 'script_rt_tvscreen',
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
            },

            ['monitors'] = {
                -- {
                --     ['hash'] = 'h4_prop_battle_club_screen',
                --     ['position'] = vector3(-1065.41, -1733.74, 8.85),
                --     ['rotation'] = nil,
                --     ['heading'] = 135.0,
                --     ['lodDistance'] = nil
                -- },
                -- {
                --     ['hash'] = 'h4_prop_battle_club_screen',
                --     ['position'] = vector3(-1039.96, -1724.9, 7.00),
                --     ['rotation'] = nil,
                --     ['heading'] = 45.0,
                --     ['lodDistance'] = nil
                -- }
            },


            ['screens'] = nil,

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-3088.61, 430.11, 3.78), 
                    ['rotation'] = nil,
                    ['heading'] = 245.16,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-3082.17, 443.1, 3.78),
                    ['rotation'] = nil,
                    ['heading'] = 248.23,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-3076.0, 455.25, 3.79),
                    ['rotation'] = nil,
                    ['heading'] = 242.25,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-3089.4, 428.51, 6.97),
                    ['rotation'] = nil,
                    ['heading'] = 99.48,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-3078.18, 452.51, 6.97),
                    ['rotation'] = nil,
                    ['heading'] = 29.49,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-3077.83, 423.74, 12.62),
                    ['rotation'] = nil,
                    ['heading'] = 205.14,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-3089.13, 428.76, 12.63),
                    ['rotation'] = nil,
                    ['heading'] = 109.31,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-3076.12, 465.83, 11.85),
                    ['rotation'] = nil,
                    ['heading'] = 22.22,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-3063.46, 451.5, 11.96),
                    ['rotation'] = nil,
                    ['heading'] = 305.79,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
            }
        },

        -- CCM
        ['ccm'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://cdn.discordapp.com/attachments/1433899929285427301/1445929367619506238/9k.png?ex=69322229&is=6930d0a9&hm=632a94f4526beda6a06e9895f485b9f60bf28f4e791efb5b2c9f6305b1a7b68e&',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['area'] = {
                ['range'] = 100,
                ['center'] = vec3(-341.08, -1355.38, 31.45),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 27.0,
                                ['max'] = 45.15
                            },
        
                            ['points'] = {
                                vec2(-296.47, -1410.35),
                                vec2(-295.95, -1264.65),
                                vec2(-324.59, -1255.45),
                                vec2(-355.3, -1285.98),
                                vec2(-363.78, -1324.42),
                                vec2(-363.11, -1385.51),
                                vec2(-356.66, -1411.54)
                            }
                        },
                    }
                }
            },

            ['disableEmitters'] = nil,
            ['scaleform'] = nil,

            ['replacers'] = {
                ['prop_tv_flat_michael'] = 'script_rt_tvscreen',
                ['prop_tv_flat_01'] = 'script_rt_tvscreen',
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv'
            },

            ['monitors'] = {
                {
                    ['hash'] = 'prop_tv_flat_01',
                    ['position'] = vec3(-328.15, -1355.03, 33.19),
                    ['rotation'] = nil,
                    ['heading'] = 270.74,
                    ['lodDistance'] = 50
                },
                {
                    ['hash'] = 'ba_prop_battle_club_screen_02',
                    ['position'] = vec3(-339.84, -1363.90, 34.75),
                    ['rotation'] = nil,
                    ['heading'] = 179.82,
                    ['lodDistance'] = 50
                }
            },


            ['screens'] = nil,

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-362.72, -1337.98, 31.45), 
                    ['rotation'] = nil,
                    ['heading'] = 44.94,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-362.68, -1371.01, 31.45),
                    ['rotation'] = nil,
                    ['heading'] = 136.22,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-328.28, -1370.9, 31.28),
                    ['rotation'] = nil,
                    ['heading'] = 224.8,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-328.32, -1339.73, 31.46),
                    ['rotation'] = nil,
                    ['heading'] = 318.19,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-328.17, -1339.19, 36.29),
                    ['rotation'] = nil,
                    ['heading'] = 321.34,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-316.23, -1289.87, 33.3),
                    ['rotation'] = nil,
                    ['heading'] = 1.69,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-316.36, -1283.29, 33.24),
                    ['rotation'] = nil,
                    ['heading'] = 179.81,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                -- {
                --     ['hash'] = 'ba_prop_battle_club_speaker_large',
                --     ['visible'] = false,
                --     ['position'] = vector3(-59.74, -1399.18, 35.18),
                --     ['rotation'] = nil,
                --     ['heading'] = 46.46,
                --     ['lodDistance'] = nil,
                --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                --     ['directionOffset'] = nil,
                --     ['maxDistance'] = 32.0,
                --     ['refDistance'] = 16.0,
                --     ['rolloffFactor'] = 1.25,
                --     ['coneInnerAngle'] = 90,
                --     ['coneOuterAngle'] = 180,
                --     ['coneOuterGain'] = 0.5,
                --     ['fadeDurationMs'] = 250,
                --     ['volumeMultiplier'] = 1.0,
                --     ['lowPassGainReductionPercent'] = 15
                -- },
                -- {
                --     ['hash'] = 'ba_prop_battle_club_speaker_large',
                --     ['visible'] = false,
                --     ['position'] = vector3(-59.83, -1408.15, 35.18),
                --     ['rotation'] = nil,
                --     ['heading'] = 139.73,
                --     ['lodDistance'] = nil,
                --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                --     ['directionOffset'] = nil,
                --     ['maxDistance'] = 32.0,
                --     ['refDistance'] = 16.0,
                --     ['rolloffFactor'] = 1.25,
                --     ['coneInnerAngle'] = 90,
                --     ['coneOuterAngle'] = 180,
                --     ['coneOuterGain'] = 0.5,
                --     ['fadeDurationMs'] = 250,
                --     ['volumeMultiplier'] = 1.0,
                --     ['lowPassGainReductionPercent'] = 15
                -- },
                -- {
                --     ['hash'] = 'ba_prop_battle_club_speaker_large',
                --     ['visible'] = false,
                --     ['position'] = vector3(-50.8, -1406.37, 35.2),
                --     ['rotation'] = nil,
                --     ['heading'] = 89.69,
                --     ['lodDistance'] = nil,
                --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                --     ['directionOffset'] = nil,
                --     ['maxDistance'] = 32.0,
                --     ['refDistance'] = 16.0,
                --     ['rolloffFactor'] = 1.25,
                --     ['coneInnerAngle'] = 90,
                --     ['coneOuterAngle'] = 180,
                --     ['coneOuterGain'] = 0.5,
                --     ['fadeDurationMs'] = 250,
                --     ['volumeMultiplier'] = 1.0,
                --     ['lowPassGainReductionPercent'] = 15
                -- },
                -- {
                --     ['hash'] = 'ba_prop_battle_club_speaker_large',
                --     ['visible'] = false,
                --     ['position'] = vector3(-25.91, -1399.14, 29.39),
                --     ['rotation'] = nil,
                --     ['heading'] = 312.26,
                --     ['lodDistance'] = nil,
                --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                --     ['directionOffset'] = nil,
                --     ['maxDistance'] = 32.0,
                --     ['refDistance'] = 16.0,
                --     ['rolloffFactor'] = 1.25,
                --     ['coneInnerAngle'] = 90,
                --     ['coneOuterAngle'] = 180,
                --     ['coneOuterGain'] = 0.5,
                --     ['fadeDurationMs'] = 250,
                --     ['volumeMultiplier'] = 1.0,
                --     ['lowPassGainReductionPercent'] = 15
                -- },
                -- {
                --     ['hash'] = 'ba_prop_battle_club_speaker_large',
                --     ['visible'] = false,
                --     ['position'] = vector3(-66.98, -1399.04, 29.39),
                --     ['rotation'] = nil,
                --     ['heading'] = 62.21,
                --     ['lodDistance'] = nil,
                --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                --     ['directionOffset'] = nil,
                --     ['maxDistance'] = 32.0,
                --     ['refDistance'] = 16.0,
                --     ['rolloffFactor'] = 1.25,
                --     ['coneInnerAngle'] = 90,
                --     ['coneOuterAngle'] = 180,
                --     ['coneOuterGain'] = 0.5,
                --     ['fadeDurationMs'] = 250,
                --     ['volumeMultiplier'] = 1.0,
                --     ['lowPassGainReductionPercent'] = 15
                -- },
                -- {
                --     ['hash'] = 'ba_prop_battle_club_speaker_large',
                --     ['visible'] = false,
                --     ['position'] = vector3(-18.56, -1417.06, 29.39),
                --     ['rotation'] = nil,
                --     ['heading'] = 263.99,
                --     ['lodDistance'] = nil,
                --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                --     ['directionOffset'] = nil,
                --     ['maxDistance'] = 32.0,
                --     ['refDistance'] = 16.0,
                --     ['rolloffFactor'] = 1.25,
                --     ['coneInnerAngle'] = 90,
                --     ['coneOuterAngle'] = 180,
                --     ['coneOuterGain'] = 0.5,
                --     ['fadeDurationMs'] = 250,
                --     ['volumeMultiplier'] = 1.0,
                --     ['lowPassGainReductionPercent'] = 15
                -- },
            }
        },



        -- LS CUSTOMS --
        ['lscustoms'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://media.tenor.com/UgA-jqT83R8AAAAd/lsc1.gif' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['area'] = {
                ['range'] = 98,
                ['center'] = vector3(-333.22, -133.28, 39.01),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 38.05,
                                ['max'] = 45.00
                            },
        
                            ['points'] = {
                                vector2(-356.82, -138.23), 
                                vector2(-348.7, -151.84),
                                vector2(-352.52, -161.21),
                                vector2(-337.42, -169.05),
                                vector2(-316.32, -163.0),
                                vector2(-302.71, -125.59),
                                vector2(-346.74, -109.8)
                            }
                        },
                    }
                }
            },

            ['disableEmitters'] = {
                'SE_FRANKLIN_HILLS_HOUSE_RADIO_01'
            },
            ['scaleform'] = nil,

            ['replacers'] = {
                ['prop_tv_flat_michael'] = 'script_rt_tvscreen',
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
            },

            ['monitors'] = {
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(-337.62, -131.64, 42.99),
                    ['rotation'] = nil,
                    ['heading'] = 69.00,
                    ['lodDistance'] = nil
                }
            },


            ['screens'] = nil,

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(913.62, -2132.81, 29.85), 
                    ['rotation'] = nil,
                    ['heading'] = 220.84,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-332.17, -157.3, 38.01),
                    ['rotation'] = nil,
                    ['heading'] = 176.49,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-346.46, -134.33, 38.01),
                    ['rotation'] = nil,
                    ['heading'] = 67.19,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-342.54, -123.6, 38.01),
                    ['rotation'] = nil,
                    ['heading'] = 62.8,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
            }
        },
                -- EastSide
                ['esm'] = {
                    ['enabled'] = true,
                    ['autoAdjustTime'] = false,
                    ['idleWallpaperUrl'] = 'https://r2.fivemanage.com/h5xg7GzhtMUaOOpkouu1c/tesstess1.png',
                    ['maxVolumePercent'] = 50,
                    ['smokeFxMultiplier'] = 3,
                    ['smokeTimeoutMs'] = 5000,
                    ['sparklerFxMultiplier'] = 1,
                    ['sparklerTimeoutMs'] = 1500,
                    ['delayBetweenSmokeChainMs'] = 1500,
                    ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
                    ['featureDelayWithControllerInterfaceClosedMs'] = 500,
        
                    ['area'] = {
                        ['range'] = 30,
                        ['center'] = vec3(1147.74, -783.86, 57.66),
                        ['height'] = nil,
        
                        ['polygons'] = {
                            ['applyLowPassFilterOutside'] = true,
                            ['invertLowPassApplication'] = false,
                            ['hideReplacersOutside'] = true,
        
                            ['entries'] = {
                                {
                                    ['height'] = {
                                        ['min'] = 54.00,
                                        ['max'] = 68.00
                                    },
                
                                    ['points'] = {
                                        vec2(1117.23, -771.86),
                                        vec2(1164.6, -771.4),
                                        vec2(1163.14, -808.09),
                                        vec2(1117.85, -808.51)
                                    }
                                },
                            }
                        }
                    },
        
                    ['disableEmitters'] = {
                        'LOS_SANTOS_VANILLA_UNICORN_01_STAGE',
                        'LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM',
                        'LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM'
                    },
                
                    ['scaleform'] = nil,
        
                    ['replacers'] = {
                        ['prop_tv_flat_michael'] = 'script_rt_tvscreen',
                        ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
                    },
        
                    ['monitors'] = {
                        {
                            ['hash'] = 'h4_prop_battle_club_screen',
                            ['position'] = vec3(1159.75, -779.75, 60.43),
                            ['rotation'] = nil,
                            ['heading'] = 269.95,
                            ['lodDistance'] = nil
                        },
                          },
        
        
                    ['screens'] = nil,
        
                    ['speakers'] = {
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = true,
                            ['position'] = vec3(1132.67, -776.57, 57.64), 
                            ['rotation'] = nil,
                            ['heading'] = 46.04,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 32.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
        
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = true,
                            ['position'] = vec3(1139.01, -791.75, 57.53),
                            ['rotation'] = nil,
                            ['heading'] = 136.61,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 32.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = true,
                            ['position'] = vec3(1160.87, -796.21, 57.46),
                            ['rotation'] = nil,
                            ['heading'] = 223.23,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 32.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = true,
                            ['position'] = vec3(1160.19, -776.9, 57.72),
                            ['rotation'] = nil,
                            ['heading'] = 310.46,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 32.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                    }
                },
                -- Seaton
                ['ss'] = {
                    ['enabled'] = true,
                    ['autoAdjustTime'] = false,
                    ['idleWallpaperUrl'] = 'https://r2.fivemanage.com/pME1XcKB17GDqSwS7AlUD/seaton.gif',
                    ['maxVolumePercent'] = 50,
                    ['smokeFxMultiplier'] = 3,
                    ['smokeTimeoutMs'] = 5000,
                    ['sparklerFxMultiplier'] = 1,
                    ['sparklerTimeoutMs'] = 1500,
                    ['delayBetweenSmokeChainMs'] = 1500,
                    ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
                    ['featureDelayWithControllerInterfaceClosedMs'] = 500,
        
                    ['area'] = {
                        ['range'] = 50,
                        ['center'] = vector3(1720.16, 3699.64, 34.76),
                        ['height'] = nil,
        
                        ['polygons'] = {
                            ['applyLowPassFilterOutside'] = true,
                            ['invertLowPassApplication'] = false,
                            ['hideReplacersOutside'] = true,
        
                            ['entries'] = {
                                {
                                    ['height'] = {
                                        ['min'] = 29.00,
                                        ['max'] = 50.00
                                    },
                
                                    ['points'] = {
                                        vector2(1687.26, 3710.26),
                                        vector2(1718.09, 3656.21),
                                        vector2(1750.57, 3674.44),
                                        vector2(1733.43, 3703.27),
                                        vector2(1756.64, 3716.57),
                                        vector2(1741.37, 3742.1),
                                        vector2(1718.83, 3728.85)
                                    }
                                },
                            }
                        }
                    },
        
                    ['disableEmitters'] = {
                        'LOS_SANTOS_VANILLA_UNICORN_01_STAGE',
                        'LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM',
                        'LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM'
                    },
                
                    ['scaleform'] = nil,
        
                    ['replacers'] = {
                        ['car_service_chiilzone_det'] = 'script_rt_tvscreen',
                        ['h4_prop_battle_club_projector'] = 'script_rt_club_projector',
                        ['prop_tv_flat_01'] = 'script_rt_tvscreen',
                    },
        
                    ['monitors'] = {
                        {
                            ['hash'] = 'prop_tv_flat_01',
                            ['position'] = vector3(1702.83, 3685.1, 35.83),
                            ['rotation'] = nil,
                            ['heading'] = 120.00,
                            ['lodDistance'] = nil
                        },
                        {
                            ['hash'] = 'prop_tv_flat_01',
                            ['position'] = vector3(1698.25, 3692.83, 35.83),
                            ['rotation'] = nil,
                            ['heading'] = 120.00,
                            ['lodDistance'] = nil
                        },
                          },
        
        
                    ['screens'] = nil,
        
                    ['speakers'] = {
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = true,
                            ['position'] = vector3(1741.28, 3738.79, 32.91), 
                            ['rotation'] = nil,
                            ['heading'] = 350.0,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 32.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = true,
                            ['position'] = vector3(1755.59, 3716.26, 33.18), 
                            ['rotation'] = nil,
                            ['heading'] = 264.0,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 32.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = true,
                            ['position'] = vector3(1690.38, 3708.57, 33.25), 
                            ['rotation'] = nil,
                            ['heading'] = 92.0,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 32.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = true,
                            ['position'] = vector3(1719.06, 3660.23, 34.08), 
                            ['rotation'] = nil,
                            ['heading'] = 162.0,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 32.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = true,
                            ['position'] = vector3(1702.21, 3687.3, 38.0), 
                            ['rotation'] = nil,
                            ['heading'] = 120.0,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 32.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },

                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = true,
                            ['position'] = vector3(1721.13, 3727.58, 32.86), 
                            ['rotation'] = nil,
                            ['heading'] = 30.0,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 32.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },

                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = true,
                            ['position'] = vector3(1739.49, 3671.22, 33.67), 
                            ['rotation'] = nil,
                            ['heading'] = 213.0,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 32.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
        
                        -- {
                        --     ['hash'] = 'ba_prop_battle_club_speaker_small',
                        --     ['visible'] = true,
                        --     ['position'] = vector3(170.57, 6392.19, 33.2),
                        --     ['rotation'] = nil,
                        --     ['heading'] = 297.78,
                        --     ['lodDistance'] = nil,
                        --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                        --     ['directionOffset'] = nil,
                        --     ['maxDistance'] = 32.0,
                        --     ['refDistance'] = 16.0,
                        --     ['rolloffFactor'] = 1.25,
                        --     ['coneInnerAngle'] = 90,
                        --     ['coneOuterAngle'] = 180,
                        --     ['coneOuterGain'] = 0.5,
                        --     ['fadeDurationMs'] = 250,
                        --     ['volumeMultiplier'] = 1.0,
                        --     ['lowPassGainReductionPercent'] = 15
                        -- },
                        -- {
                        --     ['hash'] = 'ba_prop_battle_club_speaker_small',
                        --     ['visible'] = true,
                        --     ['position'] = vector3(178.36, 6390.82, 33.84),
                        --     ['rotation'] = nil,
                        --     ['heading'] = 298.77,
                        --     ['lodDistance'] = nil,
                        --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                        --     ['directionOffset'] = nil,
                        --     ['maxDistance'] = 32.0,
                        --     ['refDistance'] = 16.0,
                        --     ['rolloffFactor'] = 1.25,
                        --     ['coneInnerAngle'] = 90,
                        --     ['coneOuterAngle'] = 180,
                        --     ['coneOuterGain'] = 0.5,
                        --     ['fadeDurationMs'] = 250,
                        --     ['volumeMultiplier'] = 1.0,
                        --     ['lowPassGainReductionPercent'] = 15
                        -- },
                    }
                },
                ['photo'] = {
                    ['enabled'] = true,
                    ['autoAdjustTime'] = false,
                    ['idleWallpaperUrl'] = 'https://media.discordapp.net/attachments/1381637250684682382/1381808848448393329/raw.png?ex=68498606&is=68483486&hm=d4c378e84ff30ba76ba1697b63f13175470bcb1285ddbc5ed6c03982cd4a46fe&=&format=webp&quality=lossless&width=1006&height=1006',
                    ['maxVolumePercent'] = 50,
                    ['smokeFxMultiplier'] = 3,
                    ['smokeTimeoutMs'] = 5000,
                    ['sparklerFxMultiplier'] = 1,
                    ['sparklerTimeoutMs'] = 1500,
                    ['delayBetweenSmokeChainMs'] = 1500,
                    ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
                    ['featureDelayWithControllerInterfaceClosedMs'] = 500,
         
                    ['bass'] = nil,
        
                    ['disableEmitters'] = nil,
                    ['scaleform'] = nil,
         
                    ['replacers'] = {
                        ['prop_tv_flat_01'] = 'script_rt_tvscreen',
                        ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                    },
                                
                    ['area'] = {
                        ['range'] = 50,
                        ['center'] = vector3(-2692.38, -139.31, 11.36),
         
                        ['polygons'] = {
                            ['applyLowPassFilterOutside'] = true,
         
                            ['entries'] = {
                                {
                                    ['height'] = {
                                        ['min'] = 0.00,
                                        ['max'] = 30.00
                                    },
         
                                    ['points'] = {
                                        vector2(-2626.63, -138.36),
                                        vector2(-2664.29, -93.37),
                                        vector2(-2742.72, -153.28),
                                        vector2(-2702.36, -205.3)
                                    }
                                }
                            }
                        }
                    },
                    ['monitors'] = {
                        {
                            ['hash'] = 'prop_tv_flat_01',
                            ['position'] = vector3(-2694.17, -146.25, 12.5),
                            ['rotation'] = nil,
                            ['heading'] = 311.7,
                            ['lodDistance'] = nil
                        },
                        {
                            ['hash'] = 'prop_tv_flat_01',
                            ['position'] = vector3(-2689.8, -151.45, 12.5),
                            ['rotation'] = nil,
                            ['heading'] = 311.7,
                            ['lodDistance'] = nil
                        },
                          },
                    ['speakers'] = {
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = true,
                            ['position'] = vector3(-2700.08, -165.38, 11.0), 
                            ['rotation'] = nil,
                            ['heading'] = 171.71,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 35.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = false,
                            ['position'] = vector3(-2711.31, -151.69, 11.0), 
                            ['rotation'] = nil,
                            ['heading'] = 86.6,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 35.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = false,
                            ['position'] = vector3(-2687.29, -154.75, 11.0), 
                            ['rotation'] = nil,
                            ['heading'] = 270.46,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 35.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = false,
                            ['position'] = vector3(-2698.82, -141.29, 11.0), 
                            ['rotation'] = nil,
                            ['heading'] = 357.94,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 35.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                     }
                },
        
        -- ['postalislandmlo'] = {
        --     ['enabled'] = true,
        --     ['autoAdjustTime'] = false,
        --                 ['idleWallpaperUrl'] = 'https://tenor.googleapis.com/v2/media?id=9892890777717938929&format=optimizedgif&client_key=tenor_web&appversion=browser-r20241030-1&access_token=ya29.a0AeDClZDLwVZi7ourhD5UiQjP1MUavyq2XqKwlKcBCqT8BMg8fjFSL1vRHwPPapKt9xDGs7Mtykn2NAINYJObN38JhP8USc_K4I-jq5ZNTYEHHJv_HToVP2pRGOkYYpTxH7XudOQxmWKmZiCyo7TMIF7YSgFNWJD-qAaCgYKAaASARMSFQHGX2MiEj_80BfmYetM7NMClTw2Pg0169&key=AIzaSyC-P6_qz3FzCoXGLk6tgitZo4jEJ5mLzD8', 'https://tenor.googleapis.com/v2/media?id=9892890777717938929&format=optimizedgif&client_key=tenor_web&appversion=browser-r20241030-1&access_token=ya29.a0AeDClZDLwVZi7ourhD5UiQjP1MUavyq2XqKwlKcBCqT8BMg8fjFSL1vRHwPPapKt9xDGs7Mtykn2NAINYJObN38JhP8USc_K4I-jq5ZNTYEHHJv_HToVP2pRGOkYYpTxH7XudOQxmWKmZiCyo7TMIF7YSgFNWJD-qAaCgYKAaASARMSFQHGX2MiEj_80BfmYetM7NMClTw2Pg0169&key=AIzaSyC-P6_qz3FzCoXGLk6tgitZo4jEJ5mLzD8',
        --     ['maxVolumePercent'] = 100,
        --     ['smokeFxMultiplier'] = 3,
        --     ['smokeTimeoutMs'] = 5000,
        --     ['sparklerFxMultiplier'] = 1,
        --     ['sparklerTimeoutMs'] = 1500,
        --     ['delayBetweenSmokeChainMs'] = 1500,
        --     ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
        --     ['featureDelayWithControllerInterfaceClosedMs'] = 500,

        --     ['bass'] = {
        --         ['smoke'] = {
        --             ['cooldownMs'] = 30000,
        --             ['colorWithDynamicSpotlights'] = false
        --         },

        --         ['sparklers'] = {
        --             ['cooldownMs'] = 30000,
        --             ['colorWithDynamicSpotlights'] = false
        --         }
        --     },

        --     ['area'] = {
        --         ['range'] = 150.0,
        --         ['center'] = vector3(-2453.14, -1176.2, 13.12),
        --         ['height'] = nil,
        --         ['polygons'] = nil
        --     },

        --     ['disableEmitters'] = nil,
        --     ['scaleform'] = nil,

        --     ['replacers'] = {
        --         ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
        --     },

        --     ['monitors'] = {
        --         {
        --             ['hash'] = 'h4_prop_battle_club_screen',
        --             ['position'] = vector3(-2453.15, -1175.97, 15.1),
        --             ['rotation'] = nil,
        --             ['heading'] = 311.21,
        --             ['lodDistance'] = nil
        --         },
        --         {
        --             ['hash'] = 'h4_prop_battle_club_screen', 
        --             ['position'] = vector3(-2467.79, -1167.82, 12.34),
        --             ['rotation'] = nil,
        --             ['heading'] = 219.86,
        --             ['lodDistance'] = nil
        --         }
        --     },

        --     ['screens'] = nil,

        --     ['spotlights'] = {
        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
        --             ['hash'] = 'cs_prop_hall_spotlight',
        --             ['position'] = vector3(-2434.13, -1142.57, 8.25),
        --             ['rotation'] = nil,
        --             ['heading'] = 285.255199432373,
        --             ['lodDistance'] = nil,
        --             ['color'] = {255, 1, 1}
        --         },

        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
        --             ['hash'] = 'cs_prop_hall_spotlight',
        --             ['position'] = vector3(-2436.23, -1139.03, 8.25),
        --             ['rotation'] = nil,
        --             ['heading'] = 313.44,
        --             ['lodDistance'] = nil,
        --             ['color'] = {250, 250, 250}
        --         },

        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
        --             ['hash'] = 'cs_prop_hall_spotlight',
        --             ['position'] = vector3(-2446.11, -1143.51, 8.35),
        --             ['rotation'] = nil,
        --             ['heading'] = 36.44,
        --             ['lodDistance'] = nil,
        --             ['color'] = {250, 250, 250}
        --         },

        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
        --             ['hash'] = 'cs_prop_hall_spotlight',
        --             ['position'] = vector3(-2465.68, -1166.7, 10.45),
        --             ['rotation'] = nil,
        --             ['heading'] = 215.39436340332,
        --             ['lodDistance'] = nil,
        --             ['color'] = {255, 255, 0}
        --         },

        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
        --             ['hash'] = 'cs_prop_hall_spotlight',
        --             ['position'] = vector3(-2450.02, -1186.5, 15.0),
        --             ['rotation'] = nil,
        --             ['heading'] = 222.46636962891,
        --             ['lodDistance'] = nil,
        --             ['color'] = {15, 3, 255}
        --         },

        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
        --             ['hash'] = 'cs_prop_hall_spotlight',
        --             ['position'] = vector3(-2446.54, -1185.57, 15.0),
        --             ['rotation'] = nil,
        --             ['heading'] = 224.10606384277,
        --             ['lodDistance'] = nil,
        --             ['color'] = {3, 83, 255}
        --         },

        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
        --             ['hash'] = 'cs_prop_hall_spotlight',
        --             ['position'] = vector3(-2449.73, -1194.22, 15.0),
        --             ['rotation'] = nil,
        --             ['heading'] = 168.10606384277,
        --             ['lodDistance'] = nil,
        --             ['color'] = {255, 255, 0}
        --         },      

        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
        --             ['hash'] = 'cs_prop_hall_spotlight',
        --             ['position'] = vector3(-2457.12, -1171.52, 16.18),
        --             ['rotation'] = nil,
        --             ['heading'] = 358.10606384277,
        --             ['lodDistance'] = nil,
        --             ['color'] = {255, 5, 190}
        --         },        
                
        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
        --             ['hash'] = 'cs_prop_hall_spotlight',
        --             ['position'] = vector3(-2465.0, -1178.38, 16.18),
        --             ['rotation'] = nil,
        --             ['heading'] = 84.10606384277,
        --             ['lodDistance'] = nil,
        --             ['color'] = {255, 255, 0}
        --         }, 
                                
        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
        --             ['hash'] = 'cs_prop_hall_spotlight',
        --             ['position'] = vector3(-2466.34, -1177.25, 18.07),
        --             ['rotation'] = nil,
        --             ['heading'] = 213.10606384277,
        --             ['lodDistance'] = nil,
        --             ['color'] = {3, 83, 255}
        --         }, 
        --         --
        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
        --             ['hash'] = 'cs_prop_hall_spotlight',
        --             ['position'] = vector3(-2458.62, -1170.68, 18.07),
        --             ['rotation'] = nil,
        --             ['heading'] = 229.10606384277,
        --             ['lodDistance'] = nil,
        --             ['color'] = {3, 83, 255}
        --         }, 
        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
        --             ['hash'] = 'cs_prop_hall_spotlight',
        --             ['position'] = vector3(-2474.49, -1151.21, 14.65),
        --             ['rotation'] = nil,
        --             ['heading'] = 249.10606384277,
        --             ['lodDistance'] = nil,
        --             ['color'] = {255, 5, 190}
        --         }, 
        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
        --             ['hash'] = 'cs_prop_hall_spotlight',
        --             ['position'] = vector3(-2477.73, -1153.58, 14.65),
        --             ['rotation'] = nil,
        --             ['heading'] = 62.10606384277,
        --             ['lodDistance'] = nil,
        --             ['color'] = {3, 83, 255}
        --         }, 
        --         --
        --         --
        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
        --             ['hash'] = 'cs_prop_hall_spotlight',
        --             ['position'] = vector3(-2490.96, -1144.98, 14.65),
        --             ['rotation'] = nil,
        --             ['heading'] = 78.10606384277,
        --             ['lodDistance'] = nil,
        --             ['color'] = {255, 5, 190}
        --         }, 
        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
        --             ['hash'] = 'cs_prop_hall_spotlight',
        --             ['position'] = vector3(-2479.91, -1136.69, 14.65),
        --             ['rotation'] = nil,
        --             ['heading'] = 341.10606384277,
        --             ['lodDistance'] = nil,
        --             ['color'] = {255, 5, 190}
        --         }
        --         -- {
        --         --     ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
        --         --     ['hash'] = 'cs_prop_hall_spotlight',
        --         --     ['position'] = vector3(-2795.6, 1444.43, 102.84),
        --         --     ['rotation'] = nil,
        --         --     ['heading'] = 156.10606384277,
        --         --     ['lodDistance'] = nil,
        --         --     ['color'] = {255, 255, 0}
        --         -- },
        --         -- {
        --         --     ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
        --         --     ['hash'] = 'cs_prop_hall_spotlight',
        --         --     ['position'] = vector3(-2793.58, 1457.56, 102.84),
        --         --     ['rotation'] = nil,
        --         --     ['heading'] = 335.10606384277,
        --         --     ['lodDistance'] = nil,
        --         --     ['color'] = {255, 255, 0}
        --         -- }
        --         -- {
        --         --     ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
        --         --     ['hash'] = 'cs_prop_hall_spotlight',
        --         --     ['position'] = vector3(-1601.68, 745.83, 196.84),
        --         --     ['rotation'] = nil,
        --         --     ['heading'] = 176.10606384277,
        --         --     ['lodDistance'] = nil,
        --         --     ['color'] = {255, 255, 0}
        --         -- },
        --         -- --                
        --         -- {
        --         --     ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
        --         --     ['hash'] = 'cs_prop_hall_spotlight',
        --         --     ['position'] = vector3(-1584.4, 767.18, 193.16),
        --         --     ['rotation'] = nil,
        --         --     ['heading'] = 292.05226135254,
        --         --     ['lodDistance'] = nil,
        --         --     ['color'] = {255, 5, 190}
        --         -- }
        --     },

        --     ['smokers'] = {
        --         {
        --             ['hash'] = 'ba_prop_club_smoke_machine',
        --             ['visible'] = true,

        --             ['fx'] = {
        --                 ['library'] = 'scr_ba_club',
        --                 ['effect'] = 'scr_ba_club_smoke_machine',
        --             },

        --             ['position'] = vector3(-2435.99, -1138.93, 4.92),
        --             ['rotation'] = nil,
        --             ['heading'] = 306.95,
        --             ['lodDistance'] = nil,
        --             ['color'] = {248, 184, 120}
        --         },

        --         {
        --             ['hash'] = 'ba_prop_club_smoke_machine',
        --             ['visible'] = true,

        --             ['fx'] = {
        --                 ['library'] = 'scr_ba_club',
        --                 ['effect'] = 'scr_ba_club_smoke_machine',
        --             },

        --             ['position'] = vector3(-2445.71, -1143.22, 4.92),
        --             ['rotation'] = nil,
        --             ['heading'] = 35.95,
        --             ['lodDistance'] = nil,
        --             ['color'] = {248, 184, 120}
        --         },

        --         {
        --             ['hash'] = 'ba_prop_club_smoke_machine',
        --             ['visible'] = true,

        --             ['fx'] = {
        --                 ['library'] = 'scr_ba_club',
        --                 ['effect'] = 'scr_ba_club_smoke_machine',
        --             },

        --             ['position'] = vector3(-2457.04, -1152.57, 4.92),
        --             ['rotation'] = nil,
        --             ['heading'] = 86.95,
        --             ['lodDistance'] = nil,
        --             ['color'] = {248, 184, 120}
        --         },

        --         {
        --             ['hash'] = 'ba_prop_club_smoke_machine',
        --             ['visible'] = true,

        --             ['fx'] = {
        --                 ['library'] = 'scr_ba_club',
        --                 ['effect'] = 'scr_ba_club_smoke_machine',
        --             },

        --             ['position'] = vector3(-2466.92, -1171.53, 11.07),
        --             ['rotation'] = nil,
        --             ['heading'] = 120.95,
        --             ['lodDistance'] = nil,
        --             ['color'] = {248, 184, 120}
        --         },

        --         {
        --             ['hash'] = 'ba_prop_club_smoke_machine',
        --             ['visible'] = true,

        --             ['fx'] = {
        --                 ['library'] = 'scr_ba_club',
        --                 ['effect'] = 'scr_ba_club_smoke_machine',
        --             },

        --             ['position'] = vector3(-2462.71, -1181.0, 11.44),
        --             ['rotation'] = nil,
        --             ['heading'] = 126.95,
        --             ['lodDistance'] = nil,
        --             ['color'] = {248, 184, 120}
        --         },

        --         {
        --             ['hash'] = 'ba_prop_club_smoke_machine',
        --             ['visible'] = true,

        --             ['fx'] = {
        --                 ['library'] = 'scr_ba_club',
        --                 ['effect'] = 'scr_ba_club_smoke_machine',
        --             },

        --             ['position'] = vector3(-2491.69, -1144.04, 11.16),
        --             ['rotation'] = nil,
        --             ['heading'] = 77.95,
        --             ['lodDistance'] = nil,
        --             ['color'] = {248, 184, 120}
        --         },

        --         {
        --             ['hash'] = 'ba_prop_club_smoke_machine',
        --             ['visible'] = true,

        --             ['fx'] = {
        --                 ['library'] = 'scr_ba_club',
        --                 ['effect'] = 'scr_ba_club_smoke_machine',
        --             },

        --             ['position'] = vector3(-2470.71, -1148.37, 11.15),
        --             ['rotation'] = nil,
        --             ['heading'] = 254.95,
        --             ['lodDistance'] = nil,
        --             ['color'] = {248, 184, 120}
        --         },

        --         {
        --             ['hash'] = 'ba_prop_club_smoke_machine',
        --             ['visible'] = true,

        --             ['fx'] = {
        --                 ['library'] = 'scr_ba_club',
        --                 ['effect'] = 'scr_ba_club_smoke_machine',
        --             },

        --             ['position'] = vector3(-2470.99, -1156.17, 8.13),
        --             ['rotation'] = nil,
        --             ['heading'] = 31.36,
        --             ['lodDistance'] = nil,
        --             ['color'] = {248, 184, 120}
        --         }
        --     },

        --     ['sparklers'] = {
        --         {
        --             ['hash'] = 'prop_cs_pour_tube',
        --             ['visible'] = true,

        --             ['fx'] = {
        --                 ['library'] = 'scr_ih_club',
        --                 ['effect'] = 'scr_ih_club_sparkler',
        --             },

        --             ['position'] = vector3(-2454.87, -1155.35, 4.85),
        --             ['rotation'] = nil,
        --             ['heading'] = 0.0,
        --             ['lodDistance'] = nil,
        --             ['color'] = {248, 184, 120}
        --         },
        --         {
        --             ['hash'] = 'prop_cs_pour_tube',
        --             ['visible'] = true,

        --             ['fx'] = {
        --                 ['library'] = 'scr_ih_club',
        --                 ['effect'] = 'scr_ih_club_sparkler',
        --             },

        --             ['position'] = vector3(-2436.76, -1137.91, 4.93),
        --             ['rotation'] = nil,
        --             ['heading'] = 0.0,
        --             ['lodDistance'] = nil,
        --             ['color'] = {248, 184, 120}
        --         },
        --         {
        --             ['hash'] = 'prop_cs_pour_tube',
        --             ['visible'] = true,

        --             ['fx'] = {
        --                 ['library'] = 'scr_ih_club',
        --                 ['effect'] = 'scr_ih_club_sparkler',
        --             },

        --             ['position'] = vector3(-2467.61, -1169.64, 11.07),
        --             ['rotation'] = nil,
        --             ['heading'] = 0.0,
        --             ['lodDistance'] = nil,
        --             ['color'] = {248, 184, 120}
        --         },
        --         {
        --             ['hash'] = 'prop_cs_pour_tube',
        --             ['visible'] = true,

        --             ['fx'] = {
        --                 ['library'] = 'scr_ih_club',
        --                 ['effect'] = 'scr_ih_club_sparkler',
        --             },

        --             ['position'] = vector3(-2457.95, -1170.03, 11.07),
        --             ['rotation'] = nil,
        --             ['heading'] = 0.0,
        --             ['lodDistance'] = nil,
        --             ['color'] = {248, 184, 120}
        --         },
        --         {
        --             ['hash'] = 'prop_cs_pour_tube',
        --             ['visible'] = true,

        --             ['fx'] = {
        --                 ['library'] = 'scr_ih_club',
        --                 ['effect'] = 'scr_ih_club_sparkler',
        --             },

        --             ['position'] = vector3(-2466.4, -1177.08, 11.1),
        --             ['rotation'] = nil,
        --             ['heading'] = 0.0,
        --             ['lodDistance'] = nil,
        --             ['color'] = {248, 184, 120}
        --         },                                               
        --         {
        --             ['hash'] = 'prop_cs_pour_tube',
        --             ['visible'] = true,

        --             ['fx'] = {
        --                 ['library'] = 'scr_ih_club',
        --                 ['effect'] = 'scr_ih_club_sparkler',
        --             },

        --             ['position'] = vector3(-2473.75, -1158.2, 8.21),
        --             ['rotation'] = nil,
        --             ['heading'] = 0.0,
        --             ['lodDistance'] = nil,
        --             ['color'] = {248, 184, 120}
        --         }
        --     },

        --     ['speakers'] = {
        --         {
        --             ['hash'] = 'ba_prop_battle_club_speaker_large',
        --             ['visible'] = true,
        --             ['position'] = vector3(-2450.22, -1146.82, 4.92),
        --             ['rotation'] = nil,
        --             ['heading'] = 36.99,
        --             ['lodDistance'] = nil,
        --             ['soundOffset'] = vector3(0.0, 0.0, 1.4),
        --             ['directionOffset'] = nil,
        --             ['maxDistance'] = 32.0,
        --             ['refDistance'] = 16.0,
        --             ['rolloffFactor'] = 1.25,
        --             ['coneInnerAngle'] = 90,
        --             ['coneOuterAngle'] = 180,
        --             ['coneOuterGain'] = 0.5,
        --             ['fadeDurationMs'] = 250,
        --             ['volumeMultiplier'] = 1.0,
        --             ['lowPassGainReductionPercent'] = 15
        --         },

        --         {
        --             ['hash'] = 'ba_prop_battle_club_speaker_large',
        --             ['visible'] = true,
        --             ['position'] = vector3(-2435.52, -1140.66, 4.84),
        --             ['rotation'] = nil,
        --             ['heading'] = 310.99,
        --             ['lodDistance'] = nil,
        --             ['soundOffset'] = vector3(0.0, 0.0, 1.4),
        --             ['directionOffset'] = nil,
        --             ['maxDistance'] = 32.0,
        --             ['refDistance'] = 16.0,
        --             ['rolloffFactor'] = 1.25,
        --             ['coneInnerAngle'] = 90,
        --             ['coneOuterAngle'] = 180,
        --             ['coneOuterGain'] = 0.5,
        --             ['fadeDurationMs'] = 250,
        --             ['volumeMultiplier'] = 1.0,
        --             ['lowPassGainReductionPercent'] = 15
        --         },

        --         {
        --             ['hash'] = 'ba_prop_battle_club_speaker_large',
        --             ['visible'] = true,
        --             ['position'] = vector3(-2467.22, -1156.68, 7.29),
        --             ['rotation'] = nil,
        --             ['heading'] = 45.99,
        --             ['lodDistance'] = nil,
        --             ['soundOffset'] = vector3(0.0, 0.0, 1.4),
        --             ['directionOffset'] = nil,
        --             ['maxDistance'] = 32.0,
        --             ['refDistance'] = 16.0,
        --             ['rolloffFactor'] = 1.25,
        --             ['coneInnerAngle'] = 90,
        --             ['coneOuterAngle'] = 180,
        --             ['coneOuterGain'] = 0.5,
        --             ['fadeDurationMs'] = 250,
        --             ['volumeMultiplier'] = 1.0,
        --             ['lowPassGainReductionPercent'] = 15
        --         },
        --         {
        --             ['hash'] = 'ba_prop_battle_club_speaker_large',
        --             ['visible'] = true,
        --             ['position'] = vector3(-2480.26, -1156.49, 11.25),
        --             ['rotation'] = nil,
        --             ['heading'] = 174.99,
        --             ['lodDistance'] = nil,
        --             ['soundOffset'] = vector3(0.0, 0.0, 1.4),
        --             ['directionOffset'] = nil,
        --             ['maxDistance'] = 32.0,
        --             ['refDistance'] = 16.0,
        --             ['rolloffFactor'] = 1.25,
        --             ['coneInnerAngle'] = 90,
        --             ['coneOuterAngle'] = 180,
        --             ['coneOuterGain'] = 0.5,
        --             ['fadeDurationMs'] = 250,
        --             ['volumeMultiplier'] = 1.0,
        --             ['lowPassGainReductionPercent'] = 15
        --         },

        --         {
        --             ['hash'] = 'ba_prop_battle_club_speaker_large',
        --             ['visible'] = true,
        --             ['position'] = vector3(-2480.64, -1135.79, 11.15),
        --             ['rotation'] = nil,
        --             ['heading'] = 358.99,
        --             ['lodDistance'] = nil,
        --             ['soundOffset'] = vector3(0.0, 0.0, 1.4),
        --             ['directionOffset'] = nil,
        --             ['maxDistance'] = 32.0,
        --             ['refDistance'] = 16.0,
        --             ['rolloffFactor'] = 1.25,
        --             ['coneInnerAngle'] = 90,
        --             ['coneOuterAngle'] = 180,
        --             ['coneOuterGain'] = 0.5,
        --             ['fadeDurationMs'] = 250,
        --             ['volumeMultiplier'] = 1.0,
        --             ['lowPassGainReductionPercent'] = 15
        --         },
        --         --
        --         {
        --             ['hash'] = 'ba_prop_battle_club_speaker_large',
        --             ['visible'] = true,
        --             ['position'] = vector3(-2466.44, -1169.16, 6.73),
        --             ['rotation'] = nil,
        --             ['heading'] = 199.99,
        --             ['lodDistance'] = nil,
        --             ['soundOffset'] = vector3(0.0, 0.0, 1.4),
        --             ['directionOffset'] = nil,
        --             ['maxDistance'] = 32.0,
        --             ['refDistance'] = 16.0,
        --             ['rolloffFactor'] = 1.25,
        --             ['coneInnerAngle'] = 90,
        --             ['coneOuterAngle'] = 180,
        --             ['coneOuterGain'] = 0.5,
        --             ['fadeDurationMs'] = 250,
        --             ['volumeMultiplier'] = 1.0,
        --             ['lowPassGainReductionPercent'] = 15
        --         },
        --         {
        --             ['hash'] = 'ba_prop_battle_club_speaker_large',
        --             ['visible'] = true,
        --             ['position'] = vector3(-2470.18, -1176.25, 11.07),
        --             ['rotation'] = nil,
        --             ['heading'] = 115.99,
        --             ['lodDistance'] = nil,
        --             ['soundOffset'] = vector3(0.0, 0.0, 1.4),
        --             ['directionOffset'] = nil,
        --             ['maxDistance'] = 32.0,
        --             ['refDistance'] = 16.0,
        --             ['rolloffFactor'] = 1.25,
        --             ['coneInnerAngle'] = 90,
        --             ['coneOuterAngle'] = 180,
        --             ['coneOuterGain'] = 0.5,
        --             ['fadeDurationMs'] = 250,
        --             ['volumeMultiplier'] = 1.0,
        --             ['lowPassGainReductionPercent'] = 15
        --         },
        --         {
        --             ['hash'] = 'ba_prop_battle_club_speaker_large',
        --             ['visible'] = true,
        --             ['position'] = vector3(-2452.67, -1171.64, 11.07),
        --             ['rotation'] = nil,
        --             ['heading'] = 326.99,
        --             ['lodDistance'] = nil,
        --             ['soundOffset'] = vector3(0.0, 0.0, 1.4),
        --             ['directionOffset'] = nil,
        --             ['maxDistance'] = 32.0,
        --             ['refDistance'] = 16.0,
        --             ['rolloffFactor'] = 1.25,
        --             ['coneInnerAngle'] = 90,
        --             ['coneOuterAngle'] = 180,
        --             ['coneOuterGain'] = 0.5,
        --             ['fadeDurationMs'] = 250,
        --             ['volumeMultiplier'] = 1.0,
        --             ['lowPassGainReductionPercent'] = 15
        --         },
        --         {
        --             ['hash'] = 'ba_prop_battle_club_speaker_large',
        --             ['visible'] = true,
        --             ['position'] = vector3(-2462.26, -1181.51, 11.44),
        --             ['rotation'] = nil,
        --             ['heading'] = 131.99,
        --             ['lodDistance'] = nil,
        --             ['soundOffset'] = vector3(0.0, 0.0, 1.4),
        --             ['directionOffset'] = nil,
        --             ['maxDistance'] = 32.0,
        --             ['refDistance'] = 16.0,
        --             ['rolloffFactor'] = 1.25,
        --             ['coneInnerAngle'] = 90,
        --             ['coneOuterAngle'] = 180,
        --             ['coneOuterGain'] = 0.5,
        --             ['fadeDurationMs'] = 250,
        --             ['volumeMultiplier'] = 1.0,
        --             ['lowPassGainReductionPercent'] = 15
        --         },
        --         {
        --             ['hash'] = 'ba_prop_battle_club_speaker_large',
        --             ['visible'] = true,
        --             ['position'] = vector3(-2453.15, -1191.78, 11.18),
        --             ['rotation'] = nil,
        --             ['heading'] = 131.99,
        --             ['lodDistance'] = nil,
        --             ['soundOffset'] = vector3(0.0, 0.0, 1.4),
        --             ['directionOffset'] = nil,
        --             ['maxDistance'] = 32.0,
        --             ['refDistance'] = 16.0,
        --             ['rolloffFactor'] = 1.25,
        --             ['coneInnerAngle'] = 90,
        --             ['coneOuterAngle'] = 180,
        --             ['coneOuterGain'] = 0.5,
        --             ['fadeDurationMs'] = 250,
        --             ['volumeMultiplier'] = 1.0,
        --             ['lowPassGainReductionPercent'] = 15
        --         },
        --         {
        --             ['hash'] = 'ba_prop_battle_club_speaker_large',
        --             ['visible'] = true,
        --             ['position'] = vector3(-2447.26, -1186.9, 15.77),
        --             ['rotation'] = nil,
        --             ['heading'] = 227.99,
        --             ['lodDistance'] = nil,
        --             ['soundOffset'] = vector3(0.0, 0.0, 1.4),
        --             ['directionOffset'] = nil,
        --             ['maxDistance'] = 32.0,
        --             ['refDistance'] = 16.0,
        --             ['rolloffFactor'] = 1.25,
        --             ['coneInnerAngle'] = 90,
        --             ['coneOuterAngle'] = 180,
        --             ['coneOuterGain'] = 0.5,
        --             ['fadeDurationMs'] = 250,
        --             ['volumeMultiplier'] = 1.0,
        --             ['lowPassGainReductionPercent'] = 15
        --         }
        --         -- {
        --         --     ['hash'] = 'ba_prop_battle_club_speaker_large',
        --         --     ['visible'] = false,
        --         --     ['position'] = vector3(-2806.8, 1435.11, 100.75),
        --         --     ['rotation'] = nil,
        --         --     ['heading'] = 109.99,
        --         --     ['lodDistance'] = nil,
        --         --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
        --         --     ['directionOffset'] = nil,
        --         --     ['maxDistance'] = 32.0,
        --         --     ['refDistance'] = 16.0,
        --         --     ['rolloffFactor'] = 1.25,
        --         --     ['coneInnerAngle'] = 90,
        --         --     ['coneOuterAngle'] = 180,
        --         --     ['coneOuterGain'] = 0.5,
        --         --     ['fadeDurationMs'] = 250,
        --         --     ['volumeMultiplier'] = 1.0,
        --         --     ['lowPassGainReductionPercent'] = 15
        --         -- },
        --         -- {
        --         --     ['hash'] = 'ba_prop_battle_club_speaker_large',
        --         --     ['visible'] = false,
        --         --     ['position'] = vector3(-2801.22, 1442.46, 100.95),
        --         --     ['rotation'] = nil,
        --         --     ['heading'] = 337.99,
        --         --     ['lodDistance'] = nil,
        --         --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
        --         --     ['directionOffset'] = nil,
        --         --     ['maxDistance'] = 32.0,
        --         --     ['refDistance'] = 16.0,
        --         --     ['rolloffFactor'] = 1.25,
        --         --     ['coneInnerAngle'] = 90,
        --         --     ['coneOuterAngle'] = 180,
        --         --     ['coneOuterGain'] = 0.5,
        --         --     ['fadeDurationMs'] = 250,
        --         --     ['volumeMultiplier'] = 1.0,
        --         --     ['lowPassGainReductionPercent'] = 15
        --         -- },
        --         -- {
        --         --     ['hash'] = 'ba_prop_battle_club_speaker_large',
        --         --     ['visible'] = false,
        --         --     ['position'] = vector3(-2791.76, 1419.69, 100.94),
        --         --     ['rotation'] = nil,
        --         --     ['heading'] = 198.99,
        --         --     ['lodDistance'] = nil,
        --         --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
        --         --     ['directionOffset'] = nil,
        --         --     ['maxDistance'] = 32.0,
        --         --     ['refDistance'] = 16.0,
        --         --     ['rolloffFactor'] = 1.25,
        --         --     ['coneInnerAngle'] = 90,
        --         --     ['coneOuterAngle'] = 180,
        --         --     ['coneOuterGain'] = 0.5,
        --         --     ['fadeDurationMs'] = 250,
        --         --     ['volumeMultiplier'] = 1.0,
        --         --     ['lowPassGainReductionPercent'] = 15
        --         -- },                
        --         -- --                

        --         -- {
        --         --     ['hash'] = 'ba_prop_battle_club_speaker_large',
        --         --     ['visible'] = false,
        --         --     ['position'] = vector3(-2786.2, 1420.32, 100.89),
        --         --     ['rotation'] = nil,
        --         --     ['heading'] = 346.99,
        --         --     ['lodDistance'] = nil,
        --         --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
        --         --     ['directionOffset'] = nil,
        --         --     ['maxDistance'] = 32.0,
        --         --     ['refDistance'] = 16.0,
        --         --     ['rolloffFactor'] = 1.25,
        --         --     ['coneInnerAngle'] = 90,
        --         --     ['coneOuterAngle'] = 180,
        --         --     ['coneOuterGain'] = 0.5,
        --         --     ['fadeDurationMs'] = 250,
        --         --     ['volumeMultiplier'] = 1.0,
        --         --     ['lowPassGainReductionPercent'] = 15
        --         -- }
        --     }
        -- },
                ['postal6190mlo'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
                        ['idleWallpaperUrl'] = 'https://tenor.googleapis.com/v2/media?id=9892890777717938929&format=optimizedgif&client_key=tenor_web&appversion=browser-r20241030-1&access_token=ya29.a0AeDClZDLwVZi7ourhD5UiQjP1MUavyq2XqKwlKcBCqT8BMg8fjFSL1vRHwPPapKt9xDGs7Mtykn2NAINYJObN38JhP8USc_K4I-jq5ZNTYEHHJv_HToVP2pRGOkYYpTxH7XudOQxmWKmZiCyo7TMIF7YSgFNWJD-qAaCgYKAaASARMSFQHGX2MiEj_80BfmYetM7NMClTw2Pg0169&key=AIzaSyC-P6_qz3FzCoXGLk6tgitZo4jEJ5mLzD8', 'https://cdn.discordapp.com/attachments/900418600270184518/1119010462873432084/logo1920x1080.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = false
                },

                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = false
                }
            },

            ['area'] = {
                ['range'] = 150.0,
                ['center'] = vector3(-821.71, 255.49, 82.79),
                ['height'] = nil,
                ['polygons'] = nil
            },

            ['disableEmitters'] = nil,
            ['scaleform'] = nil,

            ['replacers'] = {
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
            },

            ['monitors'] = {
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(-826.68, 258.75, 80.5),
                    ['rotation'] = nil,
                    ['heading'] = 348.6,
                    ['lodDistance'] = nil
                },
                {
                    ['hash'] = 'h4_prop_battle_club_screen', 
                    ['position'] = vector3(-821.5, 266.7, 88.24),
                    ['rotation'] = nil,
                    ['heading'] = 170.3,
                    ['lodDistance'] = nil
                }
            },

            ['screens'] = nil,

            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-830.87, 277.09, 91.86),
                    ['rotation'] = nil,
                    ['heading'] = 79.255199432373,
                    ['lodDistance'] = nil,
                    ['color'] = {138,43,226}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-820.46, 269.69, 88.19),
                    ['rotation'] = nil,
                    ['heading'] = 207.44,
                    ['lodDistance'] = nil,
                    ['color'] = {138,43,226}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-831.86, 268.56, 88.19),
                    ['rotation'] = nil,
                    ['heading'] = 121.44,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-806.93, 254.39, 88.19),
                    ['rotation'] = nil,
                    ['heading'] = 18.39436340332,
                    ['lodDistance'] = nil,
                    ['color'] = {138,43,226}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-816.65, 254.22, 88.19),
                    ['rotation'] = nil,
                    ['heading'] = 325.46636962891,
                    ['lodDistance'] = nil,
                    ['color'] = {255,255,255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-823.04, 256.06, 88.19),
                    ['rotation'] = nil,
                    ['heading'] = 346.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {138,43,226}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-831.59, 258.27, 88.19),
                    ['rotation'] = nil,
                    ['heading'] = 10.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                },      

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-836.19, 259.09, 88.19),
                    ['rotation'] = nil,
                    ['heading'] = 322.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {138,43,226}
                },        
                
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-839.61, 260.59, 88.19),
                    ['rotation'] = nil,
                    ['heading'] = 277.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                }, 
                                
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-837.22, 268.67, 88.19),
                    ['rotation'] = nil,
                    ['heading'] = 180.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {138,43,226}
                }, 
                --
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-839.70, 252.56, 85.64),
                    ['rotation'] = nil,
                    ['heading'] = 50.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {138,43,226}
                }, 
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-833.21, 257.44, 81.20),
                    ['rotation'] = nil,
                    ['heading'] = 355.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                }, 
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-822.76, 255.85, 81.20),
                    ['rotation'] = nil,
                    ['heading'] = 355.10606384277,
                    ['lodDistance'] = nil,
                    ['color'] = {138,43,226}
                } 
                --
                --
                -- {
                --     ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                --     ['hash'] = 'cs_prop_hall_spotlight',
                --     ['position'] = vector3(-2804.02, 1446.48, 102.84),
                --     ['rotation'] = nil,
                --     ['heading'] = 243.10606384277,
                --     ['lodDistance'] = nil,
                --     ['color'] = {255, 5, 190}
                -- }, 
                -- {
                --     ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                --     ['hash'] = 'cs_prop_hall_spotlight',
                --     ['position'] = vector3(-2800.06, 1447.43, 102.84),
                --     ['rotation'] = nil,
                --     ['heading'] = 145.10606384277,
                --     ['lodDistance'] = nil,
                --     ['color'] = {255, 5, 190}
                -- }, 
                -- {
                --     ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                --     ['hash'] = 'cs_prop_hall_spotlight',
                --     ['position'] = vector3(-2795.6, 1444.43, 102.84),
                --     ['rotation'] = nil,
                --     ['heading'] = 156.10606384277,
                --     ['lodDistance'] = nil,
                --     ['color'] = {255, 255, 0}
                -- },
                -- {
                --     ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                --     ['hash'] = 'cs_prop_hall_spotlight',
                --     ['position'] = vector3(-2793.58, 1457.56, 102.84),
                --     ['rotation'] = nil,
                --     ['heading'] = 335.10606384277,
                --     ['lodDistance'] = nil,
                --     ['color'] = {255, 255, 0}
                -- }
                -- {
                --     ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                --     ['hash'] = 'cs_prop_hall_spotlight',
                --     ['position'] = vector3(-1601.68, 745.83, 196.84),
                --     ['rotation'] = nil,
                --     ['heading'] = 176.10606384277,
                --     ['lodDistance'] = nil,
                --     ['color'] = {255, 255, 0}
                -- },
                -- --                
                -- {
                --     ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                --     ['hash'] = 'cs_prop_hall_spotlight',
                --     ['position'] = vector3(-1584.4, 767.18, 193.16),
                --     ['rotation'] = nil,
                --     ['heading'] = 292.05226135254,
                --     ['lodDistance'] = nil,
                --     ['color'] = {255, 5, 190}
                -- }
            },

            ['smokers'] = {
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-828.18, 277.42, 85.4),
                    ['rotation'] = nil,
                    ['heading'] = 90.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-817.74, 272.45, 85.2),
                    ['rotation'] = nil,
                    ['heading'] = 230.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-836.32, 258.99, 79.21),
                    ['rotation'] = nil,
                    ['heading'] = 1.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-817.35, 254.93, 78.2),
                    ['rotation'] = nil,
                    ['heading'] = 299.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-816.76, 238.11, 78.11),
                    ['rotation'] = nil,
                    ['heading'] = 224.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-839.76, 251.99, 78.24),
                    ['rotation'] = nil,
                    ['heading'] = 62.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-829.92, 239.91, 78.11),
                    ['rotation'] = nil,
                    ['heading'] = 175.95,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                }
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-825.3, 247.31, 78.11),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-822.61, 252.71, 78.11),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-836.91, 249.35, 78.11),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-828.2, 277.89, 85.41),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-817.42, 274.55, 85.34),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                },                                               
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-824.08, 268.08, 85.2),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {248, 184, 120}
                }
            },

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = true,
                    ['position'] = vector3(-828.97, 276.05, 85.35),
                    ['rotation'] = nil,
                    ['heading'] = 71.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = true,
                    ['position'] = vector3(-812.38, 271.65, 85.2),
                    ['rotation'] = nil,
                    ['heading'] = 29.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = true,
                    ['position'] = vector3(-807.1, 252.98, 81.89),
                    ['rotation'] = nil,
                    ['heading'] = 97.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = true,
                    ['position'] = vector3(-807.24, 243.54, 78.11),
                    ['rotation'] = nil,
                    ['heading'] = 13.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = true,
                    ['position'] = vector3(-815.11, 245.58, 78.2),
                    ['rotation'] = nil,
                    ['heading'] = 185.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                --
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = true,
                    ['position'] = vector3(-841.87, 248.46, 78.24),
                    ['rotation'] = nil,
                    ['heading'] = 88.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = true,
                    ['position'] = vector3(-821.32, 257.89, 78.2),
                    ['rotation'] = nil,
                    ['heading'] = 353.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = true,
                    ['position'] = vector3(-838.93, 269.27, 85.19),
                    ['rotation'] = nil,
                    ['heading'] = 120.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-823.78, 265.6, 86.2),
                    ['rotation'] = nil,
                    ['heading'] = 32.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-809.15, 256.91, 86.26),
                    ['rotation'] = nil,
                    ['heading'] = 273.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = true,
                    ['position'] = vector3(-805.93, 244.25, 85.2),
                    ['rotation'] = nil,
                    ['heading'] = 235.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-815.99, 264.09, 82.8),
                    ['rotation'] = nil,
                    ['heading'] = 55.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-831.6, 261.57, 82.81),
                    ['rotation'] = nil,
                    ['heading'] = 63.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-817.35, 265.59, 79.21),
                    ['rotation'] = nil,
                    ['heading'] = 348.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },                
                --                

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-809.99, 244.98, 79.2),
                    ['rotation'] = nil,
                    ['heading'] = 100.99,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                }
            }
        }, 
        ['postal5018mlo'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://tenor.googleapis.com/v2/media?id=9892890777717938929&format=optimizedgif&client_key=tenor_web&appversion=browser-r20241030-1&access_token=ya29.a0AeDClZDLwVZi7ourhD5UiQjP1MUavyq2XqKwlKcBCqT8BMg8fjFSL1vRHwPPapKt9xDGs7Mtykn2NAINYJObN38JhP8USc_K4I-jq5ZNTYEHHJv_HToVP2pRGOkYYpTxH7XudOQxmWKmZiCyo7TMIF7YSgFNWJD-qAaCgYKAaASARMSFQHGX2MiEj_80BfmYetM7NMClTw2Pg0169&key=AIzaSyC-P6_qz3FzCoXGLk6tgitZo4jEJ5mLzD8', 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },

                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },

            ['area'] = {
                ['range'] = 128.0,
                ['center'] = vector3(-1558.39, 824.70, 184.43),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 173.0,
                                ['max'] = 200.0
                            },
        
                            ['points'] = {
                                vector2(-1460.28, 819.91),
                                vector2(-1480.67, 809.26),
                                vector2(-1484.97, 798.49),
                                vector2(-1491.59, 793.84),
                                vector2(-1503.16, 793.57),
                                vector2(-1526.55, 783.39),
                                vector2(-1537.86, 771.988),
                                vector2(-1598.99, 743.49),
                                vector2(-1605.48, 743.23),
                                vector2(-1613.03, 746.46),
                                vector2(-1620.68, 763.38),
                                vector2(-1616.38, 776.43),
                                vector2(-1604.01, 783.13),
                                vector2(-1599.62, 792.29),
                                vector2(-1600.23, 799.83),
                                vector2(-1611.74, 826.09),
                                vector2(-1611.72, 836.04),
                                vector2(-1606.95, 843.09),
                                vector2(-1565.43, 873.88),
                                vector2(-1551.56, 891.19),
                                vector2(-1525.73, 902.56),
                                vector2(-1518.21, 909.83),
                                vector2(-1513.56, 917.37),
                                vector2(-1500.20, 918.54),
                                vector2(-1491.71, 912.71),
                                vector2(-1476.84, 889.13),
                                vector2(-1478.94, 879.86),
                                vector2(-1472.85, 878.27)
                            }
                        }
                    }
                }
            },

            ['disableEmitters'] = {
                'LOS_SANTOS_VANILLA_UNICORN_01_STAGE',
                'LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM',
                'LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM'
            },

            ['scaleform'] = nil,

            ['replacers'] = {
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector',
                ['big_screens'] = 'script_rt_big_disp'
            },

            ['monitors'] = {
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(-1577.07, 788.09, 191.89),
                    ['rotation'] = nil,
                    ['heading'] = 26.52,
                    ['lodDistance'] = nil,
                },                
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(-1533.34, 845.42, 185.57),
                    ['rotation'] = nil,
                    ['heading'] = 240.00,
                    ['lodDistance'] = nil,
                }
                
                
            },

            ['screens'] = {
                {
                    ['hash'] = 'prop_huge_display_01',
                    ['position'] = vector3(-1587.65, 749.18, 191.19),
                    ['rotation'] = nil,
                    ['heading'] = 205.00,
                    ['lodDistance'] = nil,

                    ['advance'] = {
                        ['durationMs'] = 15000,
                        ['position'] = vector3(-1587.65, 749.18, 191.19)
                    }
                }
            },

            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1599.38, 784.43, 197.99),
                    ['rotation'] = nil,
                    ['heading'] = 348.56,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 1, 1}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1601.53, 745.03, 197.02),
                    ['rotation'] = nil,
                    ['heading'] = 205.88,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1584.16, 774.56, 195.63),
                    ['rotation'] = nil,
                    ['heading'] = 292.34,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1581.25, 821.30, 191.00),
                    ['rotation'] = nil,
                    ['heading'] = 331.87,
                    ['lodDistance'] = nil,
                    ['color'] = {15, 3, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1581.41, 822.04, 190.98),
                    ['rotation'] = nil,
                    ['heading'] = 255.26,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1599.38, 784.43, 197.99),
                    ['rotation'] = nil,
                    ['heading'] = 348.56,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 1, 1}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1529.91, 840.65, 190.38),
                    ['rotation'] = nil,
                    ['heading'] = 249.07,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1530.55, 844.67, 188.76),
                    ['rotation'] = nil,
                    ['heading'] = 171.28,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1501.79, 897.86, 191.22),
                    ['rotation'] = nil,
                    ['heading'] = 332.93,
                    ['lodDistance'] = nil,
                    ['color'] = {15, 3, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1514.97, 855.31, 187.96),
                    ['rotation'] = nil,
                    ['heading'] = 169.86,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                }, 
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1507.95, 835.04, 188.18),
                    ['rotation'] = nil,
                    ['heading'] = 69.38,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 1, 1}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1493.64, 802.90, 188.37),
                    ['rotation'] = nil,
                    ['heading'] = 207.81,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1522.98, 828.25, 188.19),
                    ['rotation'] = nil,
                    ['heading'] = 52.53,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1582.45, 751.42, 195.11),
                    ['rotation'] = nil,
                    ['heading'] = 180.52,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1592.87, 746.80, 195.01),
                    ['rotation'] = nil,
                    ['heading'] = 236.43,
                    ['lodDistance'] = nil,
                    ['color'] = {15, 3, 255}
                }
            },

            ['smokers'] = {
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1603.08, 748.62, 188.19),
                    ['rotation'] = nil,
                    ['heading'] = 274.00,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 0, 255}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1600.58, 781.40, 188.19),
                    ['rotation'] = nil,
                    ['heading'] = 259.51,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 0, 255}
                }
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1598.46, 782.98, 189.19),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {175, 0, 175}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1601.65, 748.54, 189.19),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {175, 0, 175}
                },
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1593.23, 747.40, 189.19),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {175, 0, 175}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1582.52, 752.19, 189.19),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {175, 0, 175}
                }
            },

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1498.76, 856.91, 180.59),
                    ['rotation'] = nil,
                    ['heading'] = 52.5621,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1524.51, 836.66, 180.59),
                    ['rotation'] = nil,
                    ['heading'] = 70.96,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1577.17, 778.54, 188.19),
                    ['rotation'] = nil,
                    ['heading'] = 156.60,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1586.12, 770.89, 188.19),
                    ['rotation'] = nil,
                    ['heading'] = 267.25,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1618.53, 766.37, 188.24),
                    ['rotation'] = nil,
                    ['heading'] = 70.79,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1592.90, 804.53, 185.99),
                    ['rotation'] = nil,
                    ['heading'] = 163.16,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1592.46, 839.22, 183.99),
                    ['rotation'] = nil,
                    ['heading'] = 342.42,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1493.69, 800.144, 180.90),
                    ['rotation'] = nil,
                    ['heading'] = 206.20,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1486.18, 833.46, 180.59),
                    ['rotation'] = nil,
                    ['heading'] = 289.97,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },                
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1500.79, 898.52, 180.93),
                    ['rotation'] = nil,
                    ['heading'] = 336.24,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                }, 
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1548.58, 813.23, 182.50),
                    ['rotation'] = nil,
                    ['heading'] = 170.57,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                }, 
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-1554.31, 873.84, 180.64),
                    ['rotation'] = nil,
                    ['heading'] = 79.,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                }
                
                
            }
        },
        ['Car Meet'] = {
            ['enabled'] = true,
        
            ['idleWallpaperUrl'] = '',
            ['maxVolumePercent'] = 50,
            ['area'] = {
                ['range'] = 250,
                ['center'] = vector3(971.41, -2249.35, 18.21),
        
                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
        
                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 17.0,
                                ['max'] = 24.0
                            },
        
                            ['points'] = {
                                vector2(901.76, -2414.7),
                                vector2(992.84, -2415.19),
                                vector2(999.01, -2333.52),
                                vector2(1082.91, -2339.98),
                                vector2(1108.62, -2043.52),
                                vector2(859.77, -2021.52),
                                vector2(834.94, -2318.24),
                                vector2(908.83, -2325.65)
 
        
        
        
                            }
                        }
                    }
                }
            },
            
            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(835.46, -2317.33, 20.94),
                    ['heading'] = 145.81, 
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 50.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(1082.1, -2339.6, 20.96),
                    ['heading'] = 218.57,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 50.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(1107.89, -2044.41, 21.05),
                    ['heading'] = 316.68,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 50.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(861.44, -2022.38, 20.92), 
                    ['heading'] = 53.68,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 50.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(926.97, -2146.88, 20.15), 
                    ['heading'] = 43.76,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 50.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(923.25, -2144.42, 19.95), 
                    ['heading'] = 227.3,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 50.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(952.9, -2392.14, 23.29), 
                    ['heading'] = 216.99,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(982.59, -2394.81, 23.41), 
                    ['heading'] = 222.65,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(997.41, -2339.68, 21.22), 
                    ['heading'] = 315.87,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(908.82, -2332.24, 21.21), 
                    ['heading'] = 46.28,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                
            },
        
        },

        ['MLO 6068'] = {
            ['enabled'] = true,
        
            ['idleWallpaperUrl'] = 'https://i.postimg.cc/3rmP90cp/q-L0C39f.gif',
            ['maxVolumePercent'] = 50,
            ['replacers'] = {
                ['prop_tv_flat_01'] = 'script_rt_tvscreen',
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
            },
        
            ['monitors'] = {
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(-164.60, 867.33, 234.91),
                    ['heading'] = 144.00
                },       
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(-165.26, 866.54, 234.91),
                    ['heading'] = 315.16
                },
        
        
            },
        
            ['area'] = {
                ['range'] = 50,
                ['center'] = vector3(-161.98, 879.47, 233.14),
        
                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
        
                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 220.0,
                                ['max'] = 250.0
                            },
        
                            ['points'] = {
                                vector2(-152.1608, 953.5666), --vector3(-586.98, -1068.52, 22.94)
                                vector2(-131.3553, 932.7430), --vector3(-575.37, -1068.63, 23.27)
                                vector2(-124.8739, 904.6921), --vector3(-575.37, -1068.63, 23.27)
                                vector2(-123.6887, 896.6623), --vector3(-575.37, -1068.63, 23.27)
                                vector2(-122.5824, 879.7272), --vector3(-575.37, -1068.63, 23.27)
                                vector2(-121.6246, 874.2156), --vector3(-572.79, -1068.21, 23.32)
                                vector2(-119.5719, 868.3361), --vector3(-572.88, -1058.43, 23.23)
                                vector2(-119.5719, 868.3361), --vector3(-572.88, -1058.43, 23.23)
                                vector2(-130.2631, 851.7324), --vector3(-572.88, -1058.43, 23.23)
                                vector2(-144.4988, 860.4041), --vector3(-572.88, -1058.43, 23.23)
                                vector2(-148.0967, 859.9461), --vector3(-572.88, -1058.43, 23.23)
                                vector2(-168.0722, 851.8514), --vector3(-572.88, -1058.43, 23.23)
                                vector2(-183.4320, 850.6237), --vector3(-572.88, -1058.43, 23.23)
                                vector2(-202.8941, 924.5782) --vector3(-572.88, -1058.43, 23.23)
        
        
        
                            }
                        }
                    }
                }
            },
            
            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-176.41, 890.31, 233.47),
                    ['heading'] = 4.72, 
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-179.46, 878.5, 233.47),
                    ['heading'] = 171.33,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-163.7, 868.27, 232.7),
                    ['heading'] = 147.83,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-147.76, 877.11, 232.39), 
                    ['heading'] = 314.93,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-168.1, 852.7, 232.23), 
                    ['heading'] = 191.72,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-177.15, 912.02, 233.46), 
                    ['heading'] = 136.35,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-155.47, 899.22, 233.47), 
                    ['heading'] = 268.21,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-163.05, 894.02, 237.64), 
                    ['heading'] = 80.15,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-158.46, 885.85, 237.14), 
                    ['heading'] = 312.31,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(-129.93, 868.63, 233.69), 
                    ['heading'] = 285.51,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                
            },
        
            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-176.03, 899.95, 239.57),
                    ['heading'] = 356.77,
                    ['color'] = {255, 5, 190}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-165.93, 867.88, 237.2),
                    ['heading'] = 243.14,
                    ['color'] = {255, 255, 0}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-164.53, 865.86, 237.9),
                    ['heading'] = 301.22,
                    ['color'] = {3, 83, 255}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-148.42, 879.19, 237.42),
                    ['heading'] = 357.35,
                    ['color'] = {3, 83, 255}
                },
        
            },
        },
        ['MLO 5012'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = '',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 3000,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },

                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },

            ['area'] = {
                ['range'] = 128.0,
                ['center'] = vector3(-2590.51, 1898.84, 167.29),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 150.0,
                                ['max'] = 180.0
                            },
        
                            ['points'] = {
                                vector2(-2652.58, 1872.36),
                                vector2(-2642.69, 1860.04),
                                vector2(-2601.44, 1853.44),
                                vector2(-2571.28, 1857.84),
                                vector2(-2551.81, 1890.68),
                                vector2(-2536.47, 1930.24),
                                vector2(-2557.79, 1930.43),
                                vector2(-2581.21, 1943.2),
                                vector2(-2611.58, 1934.42),
                                vector2(-2643.11, 1900.77)
                            }
                        }
                    }
                }
            },

            ['disableEmitters'] = {
                'LOS_SANTOS_VANILLA_UNICORN_01_STAGE',
                'LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM',
                'LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM'
            },

            ['scaleform'] = nil,

            ['replacers'] = {
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector',
                ['big_screens'] = 'script_rt_big_disp',
                ['prop_tv_flat_01'] = 'script_rt_tvscreen',
                ['prop_wall_light_02a'] = 'cs_prop_hall_spotlight',
            },

            ['monitors'] = {
                -- {
                --     ['hash'] = 'h4_prop_battle_club_screen',
                --     ['position'] = vector3(-1577.07, 788.09, 191.89),
                --     ['rotation'] = nil,
                --     ['heading'] = 26.52,
                --     ['lodDistance'] = nil,
                -- },                
                -- {
                --     ['hash'] = 'h4_prop_battle_club_screen',
                --     ['position'] = vector3(-1533.34, 845.42, 185.57),
                --     ['rotation'] = nil,
                --     ['heading'] = 240.00,
                --     ['lodDistance'] = nil,
                -- }
                
                
            },

            ['screens'] = {
                {
                    ['hash'] = 'prop_huge_display_01',
                    ['position'] = vector3(-2640.0, 1882.43, 162.07),
                    ['rotation'] = nil,
                    ['heading'] = 40.96,
                    ['lodDistance'] = nil,

                    ['advance'] = {
                        ['durationMs'] = 15000,
                        ['position'] = vector3(-2640.0, 1882.43, 160.07)
                    }
                }
            },

            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-2644.29, 1878.31, 165.55),
                    ['rotation'] = nil,
                    ['heading'] = 341.56,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-2644.0, 1878.5, 165.55),
                    ['rotation'] = nil,
                    ['heading'] = 64.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-2635.50, 1885.8, 165.55),
                    ['rotation'] = nil,
                    ['heading'] = 20.0,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-2635.18, 1886.07, 165.55),
                    ['rotation'] = nil,
                    ['heading'] = 81.82,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-2595.95, 1876.06, 170.0),
                    ['rotation'] = nil,
                    ['heading'] = 4.12,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-2596.18, 1876.31, 170.0),
                    ['rotation'] = nil,
                    ['heading'] = 256.01,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-2600.75, 1905.55, 170.0),
                    ['rotation'] = nil,
                    ['heading'] = 324.74,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-2600.60, 1906.00, 170.0),
                    ['rotation'] = nil,
                    ['heading'] = 227.57,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-2582.18, 1877.65, 170.0),
                    ['rotation'] = nil,
                    ['heading'] = 345.43,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-2581.87, 1877.91, 170.0),
                    ['rotation'] = nil,
                    ['heading'] = 93.38,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                -- {
                --     ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                --     ['hash'] = 'cs_prop_hall_spotlight',
                --     ['position'] = vector3(-1514.97, 855.31, 187.96),
                --     ['rotation'] = nil,
                --     ['heading'] = 169.86,
                --     ['lodDistance'] = nil,
                --     ['color'] = {255, 5, 190}
                -- }, 
                -- {
                --     ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                --     ['hash'] = 'cs_prop_hall_spotlight',
                --     ['position'] = vector3(-1507.95, 835.04, 188.18),
                --     ['rotation'] = nil,
                --     ['heading'] = 69.38,
                --     ['lodDistance'] = nil,
                --     ['color'] = {255, 1, 1}
                -- },

                -- {
                --     ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                --     ['hash'] = 'cs_prop_hall_spotlight',
                --     ['position'] = vector3(-1493.64, 802.90, 188.37),
                --     ['rotation'] = nil,
                --     ['heading'] = 207.81,
                --     ['lodDistance'] = nil,
                --     ['color'] = {255, 255, 0}
                -- },

                -- {
                --     ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                --     ['hash'] = 'cs_prop_hall_spotlight',
                --     ['position'] = vector3(-1522.98, 828.25, 188.19),
                --     ['rotation'] = nil,
                --     ['heading'] = 52.53,
                --     ['lodDistance'] = nil,
                --     ['color'] = {3, 83, 255}
                -- },
                -- {
                --     ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                --     ['hash'] = 'cs_prop_hall_spotlight',
                --     ['position'] = vector3(-1582.45, 751.42, 195.11),
                --     ['rotation'] = nil,
                --     ['heading'] = 180.52,
                --     ['lodDistance'] = nil,
                --     ['color'] = {255, 5, 190}
                -- },

                -- {
                --     ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                --     ['hash'] = 'cs_prop_hall_spotlight',
                --     ['position'] = vector3(-1592.87, 746.80, 195.01),
                --     ['rotation'] = nil,
                --     ['heading'] = 236.43,
                --     ['lodDistance'] = nil,
                --     ['color'] = {15, 3, 255}
                -- }
            },

            ['smokers'] = {
                -- {
                --     ['hash'] = 'ba_prop_club_smoke_machine',
                --     ['visible'] = false,
    
                --     ['fx'] = {
                --         ['library'] = 'scr_ba_club',
                --         ['effect'] = 'scr_ba_club_smoke_machine',
                --     },

                --     ['position'] = vector3(-2645.04, 1878.15, 160.17),
                --     ['rotation'] = nil,
                --     ['heading'] = 42.79,
                --     ['lodDistance'] = nil,
                --     ['color'] = {255, 0, 255}
                -- },

                -- {
                --     ['hash'] = 'ba_prop_club_smoke_machine',
                --     ['visible'] = false,
    
                --     ['fx'] = {
                --         ['library'] = 'scr_ba_club',
                --         ['effect'] = 'scr_ba_club_smoke_machine',
                --     },

                --     ['position'] = vector3(-2634.9, 1886.96, 160.17),
                --     ['rotation'] = nil,
                --     ['heading'] = 42.79,
                --     ['lodDistance'] = nil,
                --     ['color'] = {255, 0, 255}
                -- }
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = false,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-2645.04, 1878.15, 160.17),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = false,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-2634.9, 1886.96, 160.17),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                },
                -- {
                --     ['hash'] = 'prop_cs_pour_tube',
                --     ['visible'] = true,
    
                --     ['fx'] = {
                --         ['library'] = 'scr_ih_club',
                --         ['effect'] = 'scr_ih_club_sparkler',
                --     },

                --     ['position'] = vector3(-1593.23, 747.40, 189.19),
                --     ['rotation'] = nil,
                --     ['heading'] = 0.0,
                --     ['lodDistance'] = nil,
                --     ['color'] = {175, 0, 175}
                -- },

                -- {
                --     ['hash'] = 'prop_cs_pour_tube',
                --     ['visible'] = true,
    
                --     ['fx'] = {
                --         ['library'] = 'scr_ih_club',
                --         ['effect'] = 'scr_ih_club_sparkler',
                --     },

                --     ['position'] = vector3(-1582.52, 752.19, 189.19),
                --     ['rotation'] = nil,
                --     ['heading'] = 0.0,
                --     ['lodDistance'] = nil,
                --     ['color'] = {175, 0, 175}
                -- }
            },

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = true,
                    ['position'] = vector3(-2634.74, 1886.79, 159.06),
                    ['rotation'] = nil,
                    ['heading'] = 40.96,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = true,
                    ['position'] = vector3(-2644.94, 1878.09, 159.06),
                    ['rotation'] = nil,
                    ['heading'] = 40.96,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-2594.56, 1886.27, 166.5),
                    ['rotation'] = nil,
                    ['heading'] = 188.0,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-2596.79, 1906.63, 163.35),
                    ['rotation'] = nil,
                    ['heading'] = 188.00,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-2588.59, 1873.29, 167.25),
                    ['rotation'] = nil,
                    ['heading'] = 222.00,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = true,
                    ['position'] = vector3(-2625.68, 1900.96, 162.46),
                    ['rotation'] = nil,
                    ['heading'] = 102.52,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = true,
                    ['position'] = vector3(-2600.47, 1859.38, 166.32),
                    ['rotation'] = nil,
                    ['heading'] = 221.01,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-2608.35, 1893.38, 162.46),
                    ['rotation'] = nil,
                    ['heading'] = 275.75,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(-2641.34, 1863.24, 159.13),
                    ['rotation'] = nil,
                    ['heading'] = 132.2,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                -- {
                --     ['hash'] = 'ba_prop_battle_club_speaker_large',
                --     ['visible'] = false,
                --     ['position'] = vector3(-1486.18, 833.46, 180.59),
                --     ['rotation'] = nil,
                --     ['heading'] = 289.97,
                --     ['lodDistance'] = nil,
                --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                --     ['directionOffset'] = nil,
                --     ['maxDistance'] = 32.0,
                --     ['refDistance'] = 16.0,
                --     ['rolloffFactor'] = 1.25,
                --     ['coneInnerAngle'] = 90,
                --     ['coneOuterAngle'] = 180,
                --     ['coneOuterGain'] = 0.5,
                --     ['fadeDurationMs'] = 250,
                --     ['volumeMultiplier'] = 1.0,
                --     ['lowPassGainReductionPercent'] = 15
                -- },                
                -- {
                --     ['hash'] = 'ba_prop_battle_club_speaker_large',
                --     ['visible'] = false,
                --     ['position'] = vector3(-1500.79, 898.52, 180.93),
                --     ['rotation'] = nil,
                --     ['heading'] = 336.24,
                --     ['lodDistance'] = nil,
                --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                --     ['directionOffset'] = nil,
                --     ['maxDistance'] = 32.0,
                --     ['refDistance'] = 16.0,
                --     ['rolloffFactor'] = 1.25,
                --     ['coneInnerAngle'] = 90,
                --     ['coneOuterAngle'] = 180,
                --     ['coneOuterGain'] = 0.5,
                --     ['fadeDurationMs'] = 250,
                --     ['volumeMultiplier'] = 1.0,
                --     ['lowPassGainReductionPercent'] = 15
                -- }, 
                -- {
                --     ['hash'] = 'ba_prop_battle_club_speaker_large',
                --     ['visible'] = false,
                --     ['position'] = vector3(-1548.58, 813.23, 182.50),
                --     ['rotation'] = nil,
                --     ['heading'] = 170.57,
                --     ['lodDistance'] = nil,
                --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                --     ['directionOffset'] = nil,
                --     ['maxDistance'] = 32.0,
                --     ['refDistance'] = 16.0,
                --     ['rolloffFactor'] = 1.25,
                --     ['coneInnerAngle'] = 90,
                --     ['coneOuterAngle'] = 180,
                --     ['coneOuterGain'] = 0.5,
                --     ['fadeDurationMs'] = 250,
                --     ['volumeMultiplier'] = 1.0,
                --     ['lowPassGainReductionPercent'] = 15
                -- }, 
                -- {
                --     ['hash'] = 'ba_prop_battle_club_speaker_large',
                --     ['visible'] = false,
                --     ['position'] = vector3(-1554.31, 873.84, 180.64),
                --     ['rotation'] = nil,
                --     ['heading'] = 79.,
                --     ['lodDistance'] = nil,
                --     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                --     ['directionOffset'] = nil,
                --     ['maxDistance'] = 32.0,
                --     ['refDistance'] = 16.0,
                --     ['rolloffFactor'] = 1.25,
                --     ['coneInnerAngle'] = 90,
                --     ['coneOuterAngle'] = 180,
                --     ['coneOuterGain'] = 0.5,
                --     ['fadeDurationMs'] = 250,
                --     ['volumeMultiplier'] = 1.0,
                --     ['lowPassGainReductionPercent'] = 15
                -- }
                
                
            }
        },
        
        ['MLO 6069'] = {
            ['enabled'] = true,
        
            ['idleWallpaperUrl'] = '',
            ['maxVolumePercent'] = 50,
            ['replacers'] = {
                ['prop_tv_flat_01'] = 'script_rt_tvscreen',
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector',
                ['big_screens'] = 'script_rt_big_disp',
            },
        
            ['monitors'] = {
                -- {
                --     ['hash'] = 'h4_prop_battle_club_screen',
                --     ['position'] = vec3(-205.75, 974.79, 231.53),
                --     ['heading'] = 144.00
                -- },       
                -- {
                --     ['hash'] = 'h4_prop_battle_club_screen',
                --     ['position'] = vector3(-165.26, 866.54, 234.91),
                --     ['heading'] = 315.16
                -- },
        
        
            },

            ['screens'] = {
                {
                    ['hash'] = 'prop_huge_display_01',
                    ['position'] = vec3(-205.17, 974.75, 233.53),
                    ['rotation'] = nil,
                    ['heading'] = 126.00,
                    ['lodDistance'] = nil,

                    ['advance'] = {
                        ['durationMs'] = 15000,
                        ['position'] = vec3(-205.07, 974.65, 233.53)
                    }
                }
            },
        
            ['area'] = {
                ['range'] = 60,
                ['center'] = vec3(-191.39, 988.98, 231.74),
        
                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
        
                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 220.0,
                                ['max'] = 250.0
                            },
        
                            ['points'] = {
                                vec2(-238.6, 1011.75),
                                vec2(-196.55, 949.82),
                                vec2(-177.28, 956.64),
                                vec2(-155.37, 972.85),
                                vec2(-162.29, 1026.11)       
                            }
                        }
                    }
                }
            },
            
            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-229.4, 1010.75, 232.13),
                    ['heading'] = 61.1, 
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-202.71, 1017.82, 232.13),
                    ['heading'] = 357.47,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-189.07, 1011.92, 232.13),
                    ['heading'] = 323.46,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-188.65, 984.34, 232.13), 
                    ['heading'] = 269.67,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-186.79, 965.19, 232.13), 
                    ['heading'] = 229.48,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-203.58, 964.75, 231.88), 
                    ['heading'] = 155.7,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-214.07, 979.56, 231.93), 
                    ['heading'] = 125.43,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-183.99, 985.12, 236.13), 
                    ['heading'] = 180.99,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-174.98, 996.08, 232.13), 
                    ['heading'] = 181.76,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-178.7, 957.98, 237.53), 
                    ['heading'] = 248.41,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-197.88, 1005.65, 236.13), 
                    ['heading'] = 83.8,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                
            },
        
            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(-214.96, 1000.85, 236.64),
                    ['heading'] = 100.08,
                    ['color'] = {255, 255, 255}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(-190.87, 974.24, 238.45),
                    ['heading'] = 312.43,
                    ['color'] = {255, 255, 255}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(-197.29, 1003.61, 238.45),
                    ['heading'] = 263.77,
                    ['color'] = {138,43,226}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(-183.42, 957.45, 238.45),
                    ['heading'] = 231.58,
                    ['color'] = {138,43,226}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(-215.17, 1000.69, 236.64),
                    ['heading'] = 27.41,
                    ['color'] = {138,43,226}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(-188.74, 993.34, 238.54),
                    ['heading'] = 234.19,
                    ['color'] = {255, 255, 255}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(-188.81, 984.4, 238.54),
                    ['heading'] = 307.73,
                    ['color'] = {138,43,226}
                },
        
            },
        },

        ['MLO 498'] = {
            ['enabled'] = true,
        
            ['idleWallpaperUrl'] = 'https://cdn.discordapp.com/attachments/1124964895339851856/1444659073969684541/image.png?ex=695ba79b&is=695a561b&hm=6559edcc9f481f049ffad16d5e8939221ead67d5fdc10c99361f13d2010c1700&',
            ['maxVolumePercent'] = 50,
            ['replacers'] = {
                ['prop_tv_flat_michael'] = 'script_rt_tvscreen',
                ['prop_tv_flat_01'] = 'script_rt_tvscreen',
                ['vw_prop_vw_cinema_tv_01'] = 'script_rt_tvscreen',
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector',
                ['big_screens'] = 'script_rt_big_disp',
            },
            --vw_prop_vw_cinema_tv_01
            --ch_prop_ch_arcade_big_screen
            --h4_prop_battle_club_screen
            ['monitors'] = {
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vec3(-78.97, 992.49, 239.01),
                    ['heading'] = 349.24
                },       
                {
                    ['hash'] = 'ba_prop_battle_club_screen_02',
                    ['position'] = vec3(-88.69, 934.89, 233.93),
                    ['heading'] = 169.68
                },
                -- {
                --     ['hash'] = 'vw_prop_vw_cinema_tv_01',
                --     ['position'] = vec3(-68.81, 965.79, 234.68),
                --     ['heading'] = 303.95
                -- },       
                {
                    ['hash'] = 'prop_huge_display_01',
                    ['position'] = vec3(-118.23, 948.6, 237.4),
                    ['heading'] = 128.82
                }, 
            },

            ['screens'] = {
                -- {
                --     ['hash'] = 'prop_huge_display_01',
                --     ['position'] = vec3(-205.17, 974.75, 233.53),
                --     ['rotation'] = nil,
                --     ['heading'] = 126.00,
                --     ['lodDistance'] = nil,

                --     ['advance'] = {
                --         ['durationMs'] = 15000,
                --         ['position'] = vec3(-205.07, 974.65, 233.53)
                --     }
                -- }
            },
        
            ['area'] = {
                ['range'] = 80,
                ['center'] = vec3(-85.95, 986.33, 236.33),
        
                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
        
                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 220.0,
                                ['max'] = 250.0
                            },
        
                            ['points'] = {
                                vec2(-135.42, 954.33),
                                vec2(-82.58, 905.73),
                                vec2(-25.32, 922.21),
                                vec2(-21.72, 955.92),
                                vec2(-44.3, 956.98),
                                vec2(-45.75, 996.45),
                                vec2(-76.22, 1031.22),
                                vec2(-145.07, 1033.35),
                                vec2(-156.63, 997.02),
                                vec2(-145.97, 967.32)  
                            }
                        }
                    }
                }
            },
            
            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-81.83, 994.44, 233.4),
                    ['heading'] = 337.83, 
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-75.35, 993.39, 233.4),
                    ['heading'] = 3.73,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-102.02, 986.93, 234.76),
                    ['heading'] = 59.26,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-111.94, 983.11, 235.76), 
                    ['heading'] = 288.64,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-113.77, 988.71, 235.75), 
                    ['heading'] = 288.47,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-101.49, 937.08, 232.03), 
                    ['heading'] = 170.0,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-80.75, 933.42, 232.03), 
                    ['heading'] = 173.8,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-108.38, 974.91, 234.76), 
                    ['heading'] = 326.93,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-101.22, 979.7, 234.76), 
                    ['heading'] = 20.14,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-114.69, 996.09, 235.76), 
                    ['heading'] = 193.71,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-106.57, 999.08, 235.76), 
                    ['heading'] = 186.04,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-92.38, 1004.1, 235.83), 
                    ['heading'] = 156.05,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-70.82, 1017.1, 234.4), 
                    ['heading'] = 49.83,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-58.68, 951.56, 232.2), 
                    ['heading'] = 269.95,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-68.58, 1004.4, 234.4), 
                    ['heading'] = 142.87,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-49.36, 998.32, 234.4), 
                    ['heading'] = 228.89,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-53.87, 981.1, 232.86), 
                    ['heading'] = 19.43,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-57.81, 993.85, 234.4), 
                    ['heading'] = 51.94,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-29.03, 932.39, 232.17), 
                    ['heading'] = 233.21,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-27.17, 951.77, 232.17), 
                    ['heading'] = 300.52,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-57.45, 951.07, 232.17), 
                    ['heading'] = 54.65,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-58.84, 934.7, 232.17), 
                    ['heading'] = 113.54,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-58.99, 994.89, 234.59), 
                    ['heading'] = 268.11,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-73.76, 1010.37, 233.87), 
                    ['heading'] = 348.66,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-97.54, 1015.87, 235.2), 
                    ['heading'] = 342.83,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-115.28, 995.39, 235.67), 
                    ['heading'] = 71.33,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-107.92, 976.47, 235.22), 
                    ['heading'] = 136.2,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-82.08, 995.39, 234.2), 
                    ['heading'] = 237.78,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-77.98, 995.31, 234.08), 
                    ['heading'] = 208.74,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-84.24, 1005.4, 234.0), 
                    ['heading'] = 332.21,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-127.81, 956.85, 234.39), 
                    ['heading'] = 108.0,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-79.2, 913.67, 234.17), 
                    ['heading'] = 154.77,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-79.36, 1028.43, 234.48), 
                    ['heading'] = 307.57,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-119.14, 1026.29, 236.18), 
                    ['heading'] = 1.68,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-141.45, 1028.54, 235.83), 
                    ['heading'] = 36.87,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-146.29, 997.84, 236.73), 
                    ['heading'] = 108.27,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-137.93, 975.86, 235.77), 
                    ['heading'] = 155.1,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-126.14, 969.88, 235.96), 
                    ['heading'] = 119.29,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(-94.75, 927.61, 235.09), 
                    ['heading'] = 143.28,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
            },
        
            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(-75.39, 993.67, 242.08),
                    ['heading'] = 0.34,
                    ['color'] = {242, 177, 210}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(-81.7, 994.67, 242.25),
                    ['heading'] = 343.96,
                    ['color'] = {242, 177, 210}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(-100.01, 980.53, 243.6),
                    ['heading'] = 40.25,
                    ['color'] = {242, 177, 210}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(-62.72, 978.17, 238.14),
                    ['heading'] = 323.56,
                    ['color'] = {242, 177, 210}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(-65.37, 985.35, 242.25),
                    ['heading'] = 316.08,
                    ['color'] = {255, 255, 255}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(-92.86, 990.64, 243.6),
                    ['heading'] = 20.68,
                    ['color'] = {255, 255, 255}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(-108.38, 974.91, 243.6),
                    ['heading'] = 335.21,
                    ['color'] = {255, 255, 255}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(-53.5, 981.44, 238.14),
                    ['heading'] = 66.86,
                    ['color'] = {255, 255, 255}
                },
        
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = false,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vec3(-81.82, 994.44, 234.4),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {242, 177, 210}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = false,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vec3(-75.35, 993.44, 234.4),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {242, 177, 210}
                }
            },
        },
        ['MLO 508'] = {
            ['enabled'] = true,
        
            ['idleWallpaperUrl'] = 'https://i.ibb.co/7dhQ6S1f/image.png',
            ['maxVolumePercent'] = 50,
            ['replacers'] = {
                ['prop_tv_flat_michael'] = 'script_rt_tvscreen',
                ['prop_tv_flat_01'] = 'script_rt_tvscreen',
                ['vw_prop_vw_cinema_tv_01'] = 'script_rt_tvscreen',
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector',
                ['big_screens'] = 'script_rt_big_disp',
            },
            --vw_prop_vw_cinema_tv_01
            --ch_prop_ch_arcade_big_screen
            --h4_prop_battle_club_screen
            ['monitors'] = {
                -- {
                --     ['hash'] = 'h4_prop_battle_club_screen',
                --     ['position'] = vec3(-78.97, 992.49, 239.01),
                --     ['heading'] = 349.24
                -- },       
                -- {
                --     ['hash'] = 'ba_prop_battle_club_screen_02',
                --     ['position'] = vec3(216.11, 782.58, 205.24),
                --     ['heading'] = 21.46
                -- },
                {
                    ['hash'] = 'vw_prop_vw_cinema_tv_01',
                    ['position'] = vec3(241.05, 750.98, 200.5),
                    ['heading'] = 138.12
                },       
                {
                    ['hash'] = 'prop_huge_display_01',
                    ['position'] = vec3(269.25, 763.55, 201.5),
                    ['heading'] = 254.1
                }, 
            },

            ['screens'] = {
                -- {
                --     ['hash'] = 'prop_huge_display_01',
                --     ['position'] = vec3(-205.17, 974.75, 233.53),
                --     ['rotation'] = nil,
                --     ['heading'] = 126.00,
                --     ['lodDistance'] = nil,

                --     ['advance'] = {
                --         ['durationMs'] = 15000,
                --         ['position'] = vec3(-205.07, 974.65, 233.53)
                --     }
                -- }
            },
        
            ['area'] = {
                ['range'] = 80,
                ['center'] = vec3(237.57, 764.85, 203.72),
        
                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
        
                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 190.0,
                                ['max'] = 215.0
                            },
        
                            ['points'] = {
                                vec2(193.61, 779.8),
                                vec2(206.57, 747.11),
                                vec2(229.65, 736.09),
                                vec2(252.83, 738.27),
                                vec2(270.13, 749.8),
                                vec2(274.61, 770.89),
                                vec2(268.38, 784.63),
                                vec2(253.18, 788.1),
                                vec2(226.94, 791.1)
                            }
                        }
                    }
                }
            },
            
            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(268.2, 779.72, 199.7),
                    ['heading'] = 309.87, 
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(270.88, 769.72, 199.7),
                    ['heading'] = 257.29,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                },
        
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(267.3, 757.44, 199.7),
                    ['heading'] = 259.07,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(250.59, 743.57, 199.69), 
                    ['heading'] = 150.12,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(232.77, 742.65, 203.7), 
                    ['heading'] = 148.28,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(251.86, 760.26, 203.7), 
                    ['heading'] = 257.67,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(239.99, 752.23, 200.1), 
                    ['heading'] = 85.32,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(248.99, 762.55, 200.1), 
                    ['heading'] = 71.94,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(235.9, 776.19, 200.1), 
                    ['heading'] = 102.22,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 20.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(231.82, 771.09, 204.78), 
                    ['heading'] = 237.56,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(224.98, 759.51, 204.78), 
                    ['heading'] = 235.49,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(223.97, 785.55, 204.65), 
                    ['heading'] = 344.21,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(210.59, 777.23, 204.65), 
                    ['heading'] = 73.98,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(223.34, 745.91, 203.7), 
                    ['heading'] = 59.67,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(262.37, 750.53, 199.7), 
                    ['heading'] = 201.82,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(240.1, 760.31, 200.1), 
                    ['heading'] = 329.68,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(240.3, 762.17, 200.1), 
                    ['heading'] = 154.84,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(241.18, 761.98, 200.11), 
                    ['heading'] = 109.53,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(254.71, 784.1, 199.7), 
                    ['heading'] = 16.43,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(217.84, 751.5, 204.83), 
                    ['heading'] = 195.36,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(226.64, 748.02, 203.7), 
                    ['heading'] = 151.08,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vec3(232.45, 748.68, 200.1), 
                    ['heading'] = 147.07,
                    ['soundOffset'] = vector3(0, 0, 1.0),
                    ['refDistance'] = 10.0,
                    ['lowPassGainReductionPercent'] = 0
                },
            },
        
            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(267.33, 757.88, 205.21),
                    ['heading'] = 295.37,
                    ['color'] = {255, 0, 0}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(270.62, 769.34, 205.21),
                    ['heading'] = 216.0,
                    ['color'] = {255, 0, 0}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(257.86, 755.9, 205.11),
                    ['heading'] = 165.26,
                    ['color'] = {255, 0, 0}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(253.61, 770.75, 204.65),
                    ['heading'] = 74.05,
                    ['color'] = {255, 0, 0}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(231.92, 740.01, 205.89),
                    ['heading'] = 117.05,
                    ['color'] = {255, 0, 0}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(250.0, 771.12, 205.89),
                    ['heading'] = 12.08,
                    ['color'] = {255, 0, 0}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(244.2, 776.34, 205.89),
                    ['heading'] = 103.89,
                    ['color'] = {255, 0, 0}
                },
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vec3(236.36, 751.95, 205.89),
                    ['heading'] = 79.99,
                    ['color'] = {255, 0, 0}
                },
        
            },

            -- ['sparklers'] = {
            --     {
            --         ['hash'] = 'prop_cs_pour_tube',
            --         ['visible'] = false,
    
            --         ['fx'] = {
            --             ['library'] = 'scr_ih_club',
            --             ['effect'] = 'scr_ih_club_sparkler',
            --         },

            --         ['position'] = vec3(-81.82, 994.44, 234.4),
            --         ['rotation'] = nil,
            --         ['heading'] = 0.0,
            --         ['lodDistance'] = nil,
            --         ['color'] = {242, 177, 210}
            --     },

            --     {
            --         ['hash'] = 'prop_cs_pour_tube',
            --         ['visible'] = false,
    
            --         ['fx'] = {
            --             ['library'] = 'scr_ih_club',
            --             ['effect'] = 'scr_ih_club_sparkler',
            --         },

            --         ['position'] = vec3(-75.35, 993.44, 234.4),
            --         ['rotation'] = nil,
            --         ['heading'] = 0.0,
            --         ['lodDistance'] = nil,
            --         ['color'] = {242, 177, 210}
            --     }
            -- },
        },

        -- Gabz's Vanilla Unicorn (https://www.youtube.com/watch?v=o9UV9tdLU30)
        -- If you have this interior enable it below, and disable the default "vanilla" entry.

--[[         ['gabz_vanilla_unicorn'] = {
            ['enabled'] = false,
            ['autoAdjustTime'] = false,
                        ['idleWallpaperUrl'] = 'https://tenor.googleapis.com/v2/media?id=9892890777717938929&format=optimizedgif&client_key=tenor_web&appversion=browser-r20241030-1&access_token=ya29.a0AeDClZDLwVZi7ourhD5UiQjP1MUavyq2XqKwlKcBCqT8BMg8fjFSL1vRHwPPapKt9xDGs7Mtykn2NAINYJObN38JhP8USc_K4I-jq5ZNTYEHHJv_HToVP2pRGOkYYpTxH7XudOQxmWKmZiCyo7TMIF7YSgFNWJD-qAaCgYKAaASARMSFQHGX2MiEj_80BfmYetM7NMClTw2Pg0169&key=AIzaSyC-P6_qz3FzCoXGLk6tgitZo4jEJ5mLzD8', 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },

                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },

            ['area'] = {
                ['range'] = 128.0,
                ['center'] = vector3(103.64, -1292.14, 29.2),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 27.0,
                                ['max'] = 32.0
                            },
        
                            ['points'] = {
                                vector2(119.42, -1299.34),
                                vector2(116.07, -1294.06),
                                vector2(114.62, -1292.96),
                                vector2(104.46, -1299.08),
                                vector2(97.68, -1287.27),
                                vector2(107.61, -1281.02),
                                vector2(119.01, -1279.61),
                                vector2(125.75, -1277.27),
                                vector2(128.81, -1276.93),
                                vector2(134.08, -1287.12),
                                vector2(130.99, -1289.47),
                                vector2(132.76, -1292.06),
                                vector2(134.37, -1294.44),
                                vector2(128.49, -1298.07),
                                vector2(124.62, -1300.01),
                                vector2(122.72, -1297.48)
                            }
                        }
                    }
                }
            },

            ['disableEmitters'] = {
                'LOS_SANTOS_VANILLA_UNICORN_01_STAGE',
                'LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM',
                'LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM'
            },

            ['scaleform'] = nil,

            ['replacers'] = {
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector'
            },

            ['monitors'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_screen_02',
                    ['position'] = vector3(122.83245849609, -1282.1744384766, 30.500564575195),
                    ['rotation'] = nil,
                    ['heading'] = 209.32180786133,
                    ['lodDistance'] = nil
                }
            },

            ['screens'] = {
                {
                    ['hash'] = 'h4_prop_battle_club_screen',
                    ['position'] = vector3(103.27879333496, -1292.5457763672, 33.85863571167),
                    ['rotation'] = nil,
                    ['heading'] = 120.0,
                    ['lodDistance'] = nil,

                    ['advance'] = {
                        ['durationMs'] = 15000,
                        ['position'] = vector3(103.27879333496, -1292.5457763672, 32.01610946655)
                    },
                },

                {
                    ['hash'] = 'prop_strip_pole_01',
                    ['position'] = vector3(103.27879333496, -1292.5457763672, 33.45863571167),
                    ['rotation'] = nil,
                    ['heading'] = 120.0,
                    ['lodDistance'] = nil,

                    ['advance'] = {
                        ['durationMs'] = 15000,
                        ['position'] = vector3(103.27879333496, -1292.5457763672, 31.61610946655)
                    }
                }
            },

            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(104.79130554199, -1291.6781005859, 32.583999633789),
                    ['rotation'] = nil,
                    ['heading'] = 120.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 1, 1}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(108.38147735596, -1296.1878662109, 32.080726623535),
                    ['rotation'] = nil,
                    ['heading'] = 210.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(110.11848449707, -1295.0183105469, 32.080333709717),
                    ['rotation'] = nil,
                    ['heading'] = 210.0,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(102.0936050415, -1285.4376220703, 32.090923309326),
                    ['rotation'] = nil,
                    ['heading'] = 30.0,
                    ['lodDistance'] = nil,
                    ['color'] = {15, 3, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(104.02025604248, -1284.3253173828, 32.090923309326),
                    ['rotation'] = nil,
                    ['heading'] = 30.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                }
            },

            ['smokers'] = {
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = false,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(103.99552154541, -1296.3807373047, 28.256807327271),
                    ['rotation'] = nil,
                    ['heading'] = 141.53,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 0, 255}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = false,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(100.32069396973, -1289.9753417969, 28.256807327271),
                    ['rotation'] = nil,
                    ['heading'] = 97.29,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 0, 255}
                }
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(105.01, -1289.6500244141, 28.270687103271),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {175, 0, 175}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(106.60453033447, -1292.4583740234, 28.270687103271),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {175, 0, 175}
                }
            },

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(98.9, -1287.81, 27.24342918396),
                    ['rotation'] = nil,
                    ['heading'] = 98.22,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(104.78, -1297.79, 27.24342918396),
                    ['rotation'] = nil,
                    ['heading'] = 129.74,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                }
            }
        }, ]]

        -- Breze's Medusa Nightclub (https://www.youtube.com/watch?v=WkSDHNS9UDY)
        -- If you have this interior enable it below.

--[[         ['breze_medusa_nightclub'] = {
            ['enabled'] = false,
            ['autoAdjustTime'] = false,
                        ['idleWallpaperUrl'] = 'https://tenor.googleapis.com/v2/media?id=9892890777717938929&format=optimizedgif&client_key=tenor_web&appversion=browser-r20241030-1&access_token=ya29.a0AeDClZDLwVZi7ourhD5UiQjP1MUavyq2XqKwlKcBCqT8BMg8fjFSL1vRHwPPapKt9xDGs7Mtykn2NAINYJObN38JhP8USc_K4I-jq5ZNTYEHHJv_HToVP2pRGOkYYpTxH7XudOQxmWKmZiCyo7TMIF7YSgFNWJD-qAaCgYKAaASARMSFQHGX2MiEj_80BfmYetM7NMClTw2Pg0169&key=AIzaSyC-P6_qz3FzCoXGLk6tgitZo4jEJ5mLzD8', 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = false
                },

                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = false
                }
            },

            ['area'] = {
                ['range'] = 128.0,
                ['center'] = vector3(745.37, -554.77, 28.65),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 26.0,
                                ['max'] = 32.0
                            },
        
                            ['points'] = {
                                vector2(757.49, -535.57),
                                vector2(749.46, -535.36),
                                vector2(746.87, -536.82),
                                vector2(729.46, -572.98),
                                vector2(758.1, -586.28),
                                vector2(757.7, -545.72)
                            }
                        },
                        
                        {
                            ['height'] = {
                                ['min'] = 32.0,
                                ['max'] = 36.0
                            },
        
                            ['points'] = {
                                vector2(754.14, -569.86),
                                vector2(754.17, -574.41),
                                vector2(751.19, -577.98),
                                vector2(746.51, -578.33),
                                vector2(742.82, -575.05),
                                vector2(743.16, -570.34),
                                vector2(746.01, -567.21),
                                vector2(750.68, -567.06)
                            }
                        }
                    }
                }
            },

            ['disableEmitters'] = nil,
            ['scaleform'] = nil,

            ['replacers'] = {
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv'
            },

            ['monitors'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_screen_02',
                    ['position'] = vector3(738.32971191406, -554.88000488281, 30.901714324951),
                    ['rotation'] = nil,
                    ['heading'] = 64.16,
                    ['lodDistance'] = nil
                }
            },

            ['screens'] = nil,

            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(738.67272949219, -555.03344726562, 32.444766998291),
                    ['rotation'] = nil,
                    ['heading'] = 71.46,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 1, 1}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(756.40258789062, -548.21002197266, 32.436893463135),
                    ['rotation'] = nil,
                    ['heading'] = 271.3,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(756.66101074219, -561.20684814453, 32.434928894043),
                    ['rotation'] = nil,
                    ['heading'] = 271.3,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(747.39, -561.07, 32.44),
                    ['rotation'] = nil,
                    ['heading'] = 96.2,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(747.38, -548.41, 32.44),
                    ['rotation'] = nil,
                    ['heading'] = 85.57,
                    ['lodDistance'] = nil,
                    ['color'] = {15, 3, 255}
                }
            },

            ['smokers'] = {
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(754.189453125, -558.76391601562, 27.639999389648),
                    ['rotation'] = nil,
                    ['heading'] = 299.15716552734,
                    ['lodDistance'] = nil,
                    ['color'] = {0, 255, 0}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(754.10021972656, -550.59643554688, 27.639999389648),
                    ['rotation'] = nil,
                    ['heading'] = 238.93334960938,
                    ['lodDistance'] = nil,
                    ['color'] = {0, 255, 0}
                }
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(753.32, -551.51, 27.647521972656),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {0, 255, 0}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(753.32, -557.85, 27.647521972656),
                    ['rotation'] = nil,
                    ['heading'] = 238.93334960938,
                    ['lodDistance'] = nil,
                    ['color'] = {0, 255, 0}
                }
            },

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(754.42, -557.88, 27.6),
                    ['rotation'] = nil,
                    ['heading'] = 274.2,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.7),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vector3(754.26, -551.53, 27.6),
                    ['rotation'] = nil,
                    ['heading'] = 272.5,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.7),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                }
            }
        }, ]]

        -- UncleJust's Vinewood Nightclub (https://www.youtube.com/watch?v=bwcH_KODvPI)
        -- If you have this interior enable it below.

--[[         ['unclejust_vinewood_nightclub'] = {
            ['enabled'] = false,
            ['autoAdjustTime'] = false,
                        ['idleWallpaperUrl'] = 'https://tenor.googleapis.com/v2/media?id=9892890777717938929&format=optimizedgif&client_key=tenor_web&appversion=browser-r20241030-1&access_token=ya29.a0AeDClZDLwVZi7ourhD5UiQjP1MUavyq2XqKwlKcBCqT8BMg8fjFSL1vRHwPPapKt9xDGs7Mtykn2NAINYJObN38JhP8USc_K4I-jq5ZNTYEHHJv_HToVP2pRGOkYYpTxH7XudOQxmWKmZiCyo7TMIF7YSgFNWJD-qAaCgYKAaASARMSFQHGX2MiEj_80BfmYetM7NMClTw2Pg0169&key=AIzaSyC-P6_qz3FzCoXGLk6tgitZo4jEJ5mLzD8', 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },

                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },

            ['area'] = {
                ['range'] = 36.0,
                ['center'] = vector3(372.44, 276.53, 91.19),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 90.0,
                                ['max'] = 93.0
                            },

                            ['points'] = {
                                vector2(346.24, 276.08),
                                vector2(349.61, 289.9),
                                vector2(381.23, 281.63),
                                vector2(377.56, 267.11),
                                vector2(350.76, 270.37),
                                vector2(350.36, 274.86)
                            }
                        },

                        {
                            ['height'] = {
                                ['min'] = 93.0,
                                ['max'] = 96.0
                            },

                            ['points'] = {
                                vector2(353.52, 272.84),
                                vector2(355.83, 278.45),
                                vector2(354.04, 279.21),
                                vector2(357.58, 288.01),
                                vector2(381.36, 281.72),
                                vector2(377.67, 267.05),
                                vector2(372.51, 268.12),
                                vector2(371.01, 262.22),
                                vector2(361.28, 264.88),
                                vector2(362.92, 270.56)
                            }
                        }
                    }
                }
            },

            ['disableEmitters'] = nil,
            ['scaleform'] = nil,

            ['replacers'] = {
                ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                ['ba_prop_battle_club_projector'] = 'script_rt_club_projector'
            },

            ['monitors'] = nil,
            ['screens'] = nil,

            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(363.42559814453, 276.72326660156, 92.779304504395),
                    ['rotation'] = nil,
                    ['heading'] = 76.13468170166,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(364.55303955078, 280.58059692383, 92.794158935547),
                    ['rotation'] = nil,
                    ['heading'] = 75.477386474609,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(365.38845825195, 273.95819091797, 92.779861450195),
                    ['rotation'] = nil,
                    ['heading'] = 158.18849182129,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(369.53955078125, 272.80334472656, 92.794219970703),
                    ['rotation'] = nil,
                    ['heading'] = 148.77075195312,
                    ['lodDistance'] = nil,
                    ['color'] = {15, 3, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(373.92681884766, 276.08227539062, 93.283363342285),
                    ['rotation'] = nil,
                    ['heading'] = 250.84906005859,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 1, 1}
                }
            },

            ['smokers'] = {
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = false,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(361.63854980469, 275.40472412109, 90.170631408691),
                    ['rotation'] = nil,
                    ['heading'] = 88.489730834961,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 215, 0}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = false,

                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(367.10723876953, 282.82067871094, 90.174537658691),
                    ['rotation'] = nil,
                    ['heading'] = 2.2324018478394,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 215, 0}
                }
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(373.81, 279.13, 90.178985595703),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 215, 0}
                },

                {
                    ['hash'] = 'prop_cs_pour_tube',
                    ['visible'] = true,

                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(372.41, 274.05, 90.178985595703),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 215, 0}
                }
            },

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(374.18133544922, 279.08819580078, 90.181503295898),
                    ['rotation'] = nil,
                    ['heading'] = 263.55068969727,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 28.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(372.68405151367, 273.84048461914, 90.180465698242),
                    ['rotation'] = nil,
                    ['heading'] = 257.89999389648,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.0),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 28.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 0
                }
            }
        }, ]]

        -- UncleJust's Vinewood Cinema (https://www.youtube.com/watch?v=ozpJeC7wv7k)
        -- If you have this interior enable it below.

--[[         ['unclejust_vinewood_cinema'] = {
            ['enabled'] = false,
            ['autoAdjustTime'] = true,
                        ['idleWallpaperUrl'] = 'https://tenor.googleapis.com/v2/media?id=9892890777717938929&format=optimizedgif&client_key=tenor_web&appversion=browser-r20241030-1&access_token=ya29.a0AeDClZDLwVZi7ourhD5UiQjP1MUavyq2XqKwlKcBCqT8BMg8fjFSL1vRHwPPapKt9xDGs7Mtykn2NAINYJObN38JhP8USc_K4I-jq5ZNTYEHHJv_HToVP2pRGOkYYpTxH7XudOQxmWKmZiCyo7TMIF7YSgFNWJD-qAaCgYKAaASARMSFQHGX2MiEj_80BfmYetM7NMClTw2Pg0169&key=AIzaSyC-P6_qz3FzCoXGLk6tgitZo4jEJ5mLzD8', 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = nil,

            ['area'] = {
                ['range'] = 36.0,
                ['center'] = vector3(339.75, 193.22, 103.01),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 98.0,
                                ['max'] = 118.0
                            },
        
                            ['points'] = {
                                vector2(326.45, 195.36),
                                vector2(338.11, 230.24),
                                vector2(362.55, 220.3),
                                vector2(350.45, 187.15),
                            }
                        }
                    }
                }
            },

            ['disableEmitters'] = nil,
            ['scaleform'] = nil,

            ['replacers'] = {
                ['v_ilev_cin_screen'] = 'script_rt_cinscreen'
            },

            ['monitors'] = nil,
            ['screens'] = nil,
            ['spotlights'] = nil,
            ['smokers'] = nil,
            ['sparklers'] = nil,

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(331.96, 195.93, 102.0),
                    ['rotation'] = nil,
                    ['heading'] = 154.93,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 28.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.5,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 1.0,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 90
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_small',
                    ['visible'] = false,
                    ['position'] = vector3(346.34, 190.79, 102.0),
                    ['rotation'] = nil,
                    ['heading'] = 177.34,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 28.0,
                    ['refDistance'] = 24.0,
                    ['rolloffFactor'] = 1.5,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 1.0,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 90
                }
            }
        },
 ]]
        -- Fiv3Devs' Asgard Beach Disco Club (https://www.youtube.com/watch?v=E3y30z6JAE8)
        -- If you have this interior enable it below.

--[[         ['fiv3devs_asgard'] = {
            ['enabled'] = false,
            ['autoAdjustTime'] = false,
                        ['idleWallpaperUrl'] = 'https://tenor.googleapis.com/v2/media?id=9892890777717938929&format=optimizedgif&client_key=tenor_web&appversion=browser-r20241030-1&access_token=ya29.a0AeDClZDLwVZi7ourhD5UiQjP1MUavyq2XqKwlKcBCqT8BMg8fjFSL1vRHwPPapKt9xDGs7Mtykn2NAINYJObN38JhP8USc_K4I-jq5ZNTYEHHJv_HToVP2pRGOkYYpTxH7XudOQxmWKmZiCyo7TMIF7YSgFNWJD-qAaCgYKAaASARMSFQHGX2MiEj_80BfmYetM7NMClTw2Pg0169&key=AIzaSyC-P6_qz3FzCoXGLk6tgitZo4jEJ5mLzD8', 'https://cfx-nui-' .. GetCurrentResourceName() .. '/client/dui/images/wallpaper.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['bass'] = {
                ['smoke'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                },

                ['sparklers'] = {
                    ['cooldownMs'] = 30000,
                    ['colorWithDynamicSpotlights'] = true
                }
            },

            ['area'] = {
                ['range'] = 128.0,
                ['center'] = vector3(-1733.92, -822.03, 10.24),
                ['height'] = nil,
                ['polygons'] = nil
            },

            ['disableEmitters'] = nil,
            ['scaleform'] = nil,
			
			['replacers'] = {
                ['h4_prop_battle_club_projector'] = 'script_rt_club_projector',
				['prop_tv_flat_01'] = 'script_rt_tvscreen'
            },

            ['monitors'] = {
                {
                    ['hash'] = 'prop_tv_flat_01',
                    ['position'] = vector3(-1701.12, -790.2, 15.17),
                    ['rotation'] = nil,
                    ['heading'] = 319.71,
                    ['lodDistance'] = 64
                },

                {
                    ['hash'] = '5d_asgard_schermopalco_hall',
                    ['interior'] = true,
                    ['position'] = vector3(-1743.21, -836.171, 12.43873),
                    ['rotation'] = nil,
                    ['heading'] = 49.0,
                    ['lodDistance'] = nil
                }
            },

            ['screens'] = nil,

            ['spotlights'] = {
                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1746.54300000, -831.39490000, 15.25240000),
                    ['rotation'] = vector3(0.0, 0.0, 139.0),
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {15, 3, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1745.83700000, -832.00920000, 15.25240000),
                    ['rotation'] = vector3(0.0, 0.0, 120.0),
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 0}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1745.05900000, -832.68550000, 15.25240000),
                    ['rotation'] = vector3(35.0, 0.0, 190.0),
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 1, 1}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1740.03600000, -837.05960000, 15.25240000),
                    ['rotation'] = vector3(30.0, 0.0, 40.0),
                    ['heading'] = 52.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 1, 1}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1739.25800000, -837.73610000, 15.25240000),
                    ['rotation'] = vector3(0.0, 0.0, 160.0),
                    ['heading'] = 118.0,
                    ['lodDistance'] = nil,
                    ['color'] = {3, 83, 255}
                },

                {
                    ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                    ['hash'] = 'cs_prop_hall_spotlight',
                    ['position'] = vector3(-1738.37200000, -838.50680000, 15.25240000),
                    ['rotation'] = vector3(0.0, 0.0, 139.0),
                    ['heading'] = 270.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 5, 190}
                }
            },

            ['smokers'] = {
                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1743.154, -831.4737, 10.05084),
                    ['rotation'] = nil,
                    ['heading'] = 139.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                },

                {
                    ['hash'] = 'ba_prop_club_smoke_machine',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ba_club',
                        ['effect'] = 'scr_ba_club_smoke_machine',
                    },

                    ['position'] = vector3(-1738.71, -835.3363, 10.05084),
                    ['rotation'] = nil,
                    ['heading'] = 139.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                }
            },

            ['sparklers'] = {
                {
                    ['hash'] = 'bkr_prop_coke_tube_03',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1742.3, -841.08, 10.0535641),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                },

                {
                    ['hash'] = 'bkr_prop_coke_tube_03',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1748.5, -835.87, 10.0535641),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                },
				
				{
                    ['hash'] = 'bkr_prop_coke_tube_03',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1749.44, -835.1, 10.0535641),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                },
				
				{
                    ['hash'] = 'bkr_prop_coke_tube_03',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1750.39, -834.22, 10.0535641),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                },

				{
                    ['hash'] = 'bkr_prop_coke_tube_03',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1741.26, -842.04, 10.0535641),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                },

				{
                    ['hash'] = 'bkr_prop_coke_tube_03',
                    ['visible'] = true,
    
                    ['fx'] = {
                        ['library'] = 'scr_ih_club',
                        ['effect'] = 'scr_ih_club_sparkler',
                    },

                    ['position'] = vector3(-1740.15, -843.05, 10.0535641),
                    ['rotation'] = nil,
                    ['heading'] = 0.0,
                    ['lodDistance'] = nil,
                    ['color'] = {255, 255, 255}
                }
            },

			['speakers'] = {
				{
                    ['hash'] = 'ba_prop_battle_club_speaker_array',
                    ['visible'] = true,
                    ['position'] = vector3(-1702.556, -791.5062, 13.56454),
                    ['heading'] = 0.0,
                    ['soundOffset'] = vector3(0.0, 0.0, 0.5),
                    ['maxDistance'] = 16.0,
                    ['refDistance'] = 8.0
                },

				{
                    ['hash'] = 'sf_prop_sf_speaker_stand_01a',
                    ['visible'] = true,
                    ['position'] = vector3(-1738.64, -842.54, 10.05467),
                    ['heading'] = 186.11,
                    ['soundOffset'] = vector3(0.0, 0.0, 2.0),
                    ['maxDistance'] = 48.0,
                    ['refDistance'] = 24.0,
                    ['volumeMultiplier'] = 0.75
                },

                {
                    ['hash'] = 'sf_prop_sf_speaker_stand_01a',
                    ['visible'] = true,
                    ['position'] = vector3(-1750.09, -832.6, 10.05467),
                    ['heading'] = 90.58,
                    ['soundOffset'] = vector3(0.0, 0.0, 2.0),
                    ['maxDistance'] = 48.0,
                    ['refDistance'] = 24.0,
                    ['volumeMultiplier'] = 0.75
                }
            }
        }
 ]]
        -- Below you can find a full config entry reference.

        -- ['key'] = {
        --     ['enabled'] = boolean,
        --     ['autoAdjustTime'] = boolean,
        --                 ['idleWallpaperUrl'] = 'https://tenor.googleapis.com/v2/media?id=9892890777717938929&format=optimizedgif&client_key=tenor_web&appversion=browser-r20241030-1&access_token=ya29.a0AeDClZDLwVZi7ourhD5UiQjP1MUavyq2XqKwlKcBCqT8BMg8fjFSL1vRHwPPapKt9xDGs7Mtykn2NAINYJObN38JhP8USc_K4I-jq5ZNTYEHHJv_HToVP2pRGOkYYpTxH7XudOQxmWKmZiCyo7TMIF7YSgFNWJD-qAaCgYKAaASARMSFQHGX2MiEj_80BfmYetM7NMClTw2Pg0169&key=AIzaSyC-P6_qz3FzCoXGLk6tgitZo4jEJ5mLzD8', string,
        --     ['maxVolumePercent'] = number,
        --     ['smokeFxMultiplier'] = number,
        --     ['smokeTimeoutMs'] = number,
        --     ['sparklerFxMultiplier'] = number,
        --     ['sparklerTimeoutMs'] = number,
        --     ['delayBetweenSmokeChainMs'] = number,
        --     ['delayToTriggerBassEffectsAfterPlayingMs'] = number,
        --     ['featureDelayWithControllerInterfaceClosedMs'] = number,

        --     ['bass'] = {
        --         ['smoke'] = {
        --             ['cooldownMs'] = number,
        --             ['colorWithDynamicSpotlights'] = boolean
        --         },

        --         ['sparklers'] = {
        --             ['cooldownMs'] = number,
        --             ['colorWithDynamicSpotlights'] = boolean
        --         }
        --     },

        --     ['area'] = {
        --         ['range'] = number,
        --         ['center'] = vector3(number, number, number),

        --         ['height'] = {
        --             ['min'] = number,
        --             ['max'] = number
        --         },

        --         ['polygons'] = {
        --             ['applyLowPassFilterOutside'] = boolean,
        --             ['invertLowPassApplication'] = boolean,
        --             ['hideReplacersOutside'] = boolean,

        --             ['entries'] = {
        --                 {
        --                     ['height'] = {
        --                         ['min'] = number,
        --                         ['max'] = number
        --                     },
        
        --                     ['points'] = {
        --                         vector2(number, number),
        --                         ...
        --                     ]
        --                 }
        --             ]
        --         }
        --     },

        --     ['disableEmitters'] = {string, ...},

        --     ['scaleform'] = {
        --         ['solid'] = boolean,
        --         ['flag'] = boolean,
        --         ['position'] = vector3(number, number, number),
        --         ['rotation'] = vector3(number, number, number),
        --         ['scale'] = vector3(number, number, number)
        --     },

        --     ['replacers'] = {
        --         ['key'] = value,
        --         ...
        --     },

        --     ['monitors'] = {
        --         {
        --             ['hash'] = string,
        --             ['interior'] = boolean,
        --             ['position'] = vector3(number, number, number),
        --             ['rotation'] = vector3(number, number, number),
        --             ['heading'] = number,
        --             ['lodDistance'] = number
        --         },
        --         ...
        --     },

        --     ['screens'] = {
        --         {
        --             ['hash'] = string,
        --             ['interior'] = boolean,
        --             ['position'] = vector3(number, number, number),
        --             ['rotation'] = vector3(number, number, number),
        --             ['heading'] = number,
        --             ['lodDistance'] = number,

        --             ['advance'] = {
        --                 ['durationMs'] = number,
        --                 ['position'] = vector3(number, number, numbe)]
        --             }
        --         },
        --         ...
        --     },

        --     ['spotlights'] = {
        --         {
        --             ['soundSyncType'] = SOUND_SYNC_TYPE,
        --             ['hash'] = string,
        --             ['interior'] = boolean,
        --             ['position'] = vector3(number, number, number),
        --             ['rotation'] = vector3(number, number, number),
        --             ['heading'] = number,
        --             ['lodDistance'] = number,
        --             ['color'] = {number, number, number}
        --         },
        --         ...
        --     },

        --     ['smokers'] = {
        --         {
        --             ['hash'] = string,
        --             ['interior'] = boolean,
        --             ['visible'] = boolean,
    
        --             ['fx'] = {
        --                 ['library'] = string,
        --                 ['effect'] = string,
        --             },

        --             ['position'] = vector3(number, number, number),
        --             ['rotation'] = vector3(number, number, number),
        --             ['heading'] = number,
        --             ['lodDistance'] = number,
        --             ['color'] = {number, number, number}
        --         },
        --         ...
        --     },

        --     ['sparklers'] = {
        --         {
        --             ['hash'] = string,
        --             ['interior'] = boolean,
        --             ['visible'] = boolean,
    
        --             ['fx'] = {
        --                 ['library'] = string,
        --                 ['effect'] = string,
        --             },

        --             ['position'] = vector3(number, number, number),
        --             ['rotation'] = vector3(number, number, number),
        --             ['heading'] = number,
        --             ['lodDistance'] = number,
        --             ['color'] = {number, number, number}
        --         },
        --         ...
        --     },

        --     ['speakers'] = {
        --         {
        --             ['hash'] = string,
        --             ['interior'] = boolean,
        --             ['visible'] = boolean,
        --             ['position'] = vector3(number, number, number),
        --             ['rotation'] = vector3(number, number, number),
        --             ['heading'] = number,
        --             ['lodDistance'] = number,
        --             ['soundOffset'] = vector3(number, number, number),
        --             ['directionOffset'] = vector3(number, number, number),
        --             ['maxDistance'] = number,
        --             ['refDistance'] = number,
        --             ['rolloffFactor'] = number,
        --             ['coneInnerAngle'] = number,
        --             ['coneOuterAngle'] = number,
        --             ['coneOuterGain'] = number,
        --             ['fadeDurationMs'] = number,
        --             ['volumeMultiplier'] = number,
        --             ['lowPassGainReductionPercent'] = number
        --         },
        --         ...
        --     ]
        -- }


        -- Paradise Beach Club
--         ['paradise'] = {
--             ['enabled'] = true,
--             ['autoAdjustTime'] = true,
--             ['idleWallpaperUrl'] = 'https://i.postimg.cc/6QjD1BqM/Menu.gif',
--             ['maxVolumePercent'] = 50,
--             ['smokeFxMultiplier'] = 3,
--             ['smokeTimeoutMs'] = 5000,
--             ['sparklerFxMultiplier'] = 1,
--             ['sparklerTimeoutMs'] = 1500,
--             ['delayBetweenSmokeChainMs'] = 1500,
--             ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
--             ['featureDelayWithControllerInterfaceClosedMs'] = 500,

--             ['area'] = {

--                 ['range'] = 200,
--                 ['center'] = vector3(-2062.65, -575.47, 5.08),
--                 ['polygons'] = {
--                     ['applyLowPassFilterOutside'] = true,
--                     ['invertLowPassApplication'] = false,
--                     ['hideReplacersOutside'] = true,

--                     ['entries'] = {
--                         {
--                             ['height'] = {
--                                 ['min'] = 3.0,
--                                 ['max'] = 20.0
--                             },
--                                     ['points'] = {
--                                 vector2(-2056.14, -482.3),
--                                 vector2(-2151.8, -585.56),
--                                 vector2(-2074.09, -683.69),
--                                 vector2(-1968.82, -554.51)

--                             }
--                         }
--                     }
--                 }
--             },

--             ['disableEmitters'] = nil,
--             ['scaleform'] = nil,

--             ['replacers'] = {
--                 ['xm_prop_x17_tv_ceiling_01'] = 'script_rt_x17_screens',
--                 ['h4_prop_battle_club_projector'] = 'script_rt_club_projector',
--                 ['big_screens'] = 'script_rt_big_disp'
--             },

--             ['monitors'] = {
--                 {
--                     ['hash'] = 'h4_prop_battle_club_screen',
--                     ['position'] = vector3(-2022.5, -534.11, 11.19),
--                     ['heading'] = 320.00
--                 },
--                 {
--                     ['hash'] = 'xm_prop_x17_tv_ceiling_01',
--                     ['position'] = vector3(-2098.02, -619.62, 7.71),
--                     ['heading'] = 48.73
--                 }
--             },


--                 ['screens'] = {
--                     {
--                         ['hash'] = 'prop_huge_display_02',
--                         ['position'] = vector3(-2035.01, -612.22, 5.84),
--                         ['rotation'] = nil,
--                         ['heading'] = 140.00,
--                         ['lodDistance'] = nil,
    
--                         ['advance'] = {
--                             ['durationMs'] = 15000,
--                             ['position'] = vector3(-2035.01, -612.22, 5.84),
--                         }
--                     }
--                 },

--                 ['spotlights'] = {
--                 {
--                     ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
--                     ['hash'] = 'cs_prop_hall_spotlight', --stage
--                     ['position'] = vector3(-2002.66, -563.05, 19.1),
--                     ['heading'] = 177.81,
--                     ['color'] = {255, 138, 255} --pink
--                 },
--                         {
--                     ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
--                     ['hash'] = 'cs_prop_hall_spotlight', --stage
--                     ['position'] = vector3(-2008.13, -524.4, 17.75),
--                     ['heading'] = 10.48,
--                     ['color'] = {140, 210, 255} --blue
--                 },
--                         {
--                     ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
--                     ['hash'] = 'cs_prop_hall_spotlight',
--                     ['position'] = vector3(-2012.2, -553.1, 14.99),
--                     ['heading'] = 273.64,
--                     ['color'] = {255, 138, 255} --pink
--                 },
--                         {
--                     ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
--                     ['hash'] = 'cs_prop_hall_spotlight',
--                     ['position'] = vector3(-2056.21, -545.41, 12.65),
--                     ['heading'] = 88.99,
--                     ['color'] = {140, 210, 255} --blue
--                 },
--                         {
--                     ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
--                     ['hash'] = 'cs_prop_hall_spotlight',
--                     ['position'] = vector3(-2051.12, -509.66, 18.62),
--                     ['heading'] = 51.59,
--                     ['color'] = {255, 138, 255} --pink
--                 },
--                         {
--                     ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
--                     ['hash'] = 'cs_prop_hall_spotlight',
--                     ['position'] = vector3(-2076.67, -544.93, 15.71),
--                     ['heading'] = 112.76,
--                     ['color'] = {140, 210, 255} --blue
--                 },
--                         {
--                     ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
--                     ['hash'] = 'cs_prop_hall_spotlight',
--                     ['position'] = vector3(-2076.18, -558.23, 12.4), --bar entrance
--                     ['heading'] = 319.85,
--                     ['color'] = {255, 138, 255} --pink
--                 },
--                         {
--                     ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
--                     ['hash'] = 'cs_prop_hall_spotlight',
--                     ['position'] = vector3(-2041.42, -606.66, 10.95), --bar left side
--                     ['heading'] = 268.67,
--                     ['color'] = {255, 138, 255} --pink
--                 },
--                         {
--                     ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
--                     ['hash'] = 'cs_prop_hall_spotlight',
--                     ['position'] = vector3(-2009.02, -577.69, 12.51), --entrance
--                     ['heading'] = 331.59,
--                     ['color'] = {140, 210, 255} --blue
--                 },
--                         {
--                     ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
--                     ['hash'] = 'cs_prop_hall_spotlight',
--                     ['position'] = vector3(-2014.21, -583.72, 12.42), --pole stage bar
--                     ['heading'] = 193.72,
--                     ['color'] = {140, 210, 255} --blue
--                 },
--             },
                   
-- --[[             ['smokers'] = {
--                 {
--                     ['hash'] = 'ba_prop_club_smoke_machine',
--                     ['visible'] = true,
--                             ['fx'] = {
--                         ['library'] = 'scr_ba_club',
--                         ['effect'] = 'scr_ba_club_smoke_machine',
--                     },
--                             ['position'] = vector3(-1376.32, -605.31, 30.32),
--                     ['heading'] = 250.489730834961,
--                     ['color'] = {255, 138, 255} --pink
--                 },
--                         {
--                     ['hash'] = 'ba_prop_club_smoke_machine',
--                     ['visible'] = true,
--                             ['fx'] = {
--                         ['library'] = 'scr_ba_club',
--                         ['effect'] = 'scr_ba_club_smoke_machine',
--                     },
--                             ['position'] = vector3(-1374.45, -608.31, 30.32),
--                     ['heading'] = 345.489730834961,
--                     ['color'] = {140, 210, 255} --blue
--                 },
--                         {
--                     ['hash'] = 'ba_prop_club_smoke_machine',
--                     ['visible'] = true,
--                             ['fx'] = {
--                         ['library'] = 'scr_ba_club',
--                         ['effect'] = 'scr_ba_club_smoke_machine',
--                     },
--                             ['position'] = vector3(-1382.99, -621.4, 28.90),
--                     ['heading'] = 273.489730834961,
--                     ['color'] = {255, 138, 255} --pink
--                 },
--                         {
--                     ['hash'] = 'ba_prop_club_smoke_machine',
--                     ['visible'] = true,
--                             ['fx'] = {
--                         ['library'] = 'scr_ba_club',
--                         ['effect'] = 'scr_ba_club_smoke_machine',
--                     },
--                             ['position'] = vector3(-1389.52, -626.11, 28.90),
--                     ['heading'] = 152.489730834961,
--                     ['color'] = {140, 210, 255} --blue
--                 },
--                         {
--                     ['hash'] = 'ba_prop_club_smoke_machine',
--                     ['visible'] = true,
--                             ['fx'] = {
--                         ['library'] = 'scr_ba_club',
--                         ['effect'] = 'scr_ba_club_smoke_machine',
--                     },
--                             ['position'] = vector3(-1391.71, -607.85, 28.90),
--                     ['heading'] = 330.489730834961,
--                     ['color'] = {255, 138, 255} --pink
--                 },
--                         {
--                     ['hash'] = 'ba_prop_club_smoke_machine',
--                     ['visible'] = true,
--                             ['fx'] = {
--                         ['library'] = 'scr_ba_club',
--                         ['effect'] = 'scr_ba_club_smoke_machine',
--                     },
--                             ['position'] = vector3(-1398.67, -612.04, 28.90),
--                     ['heading'] = 83.2324018478394,
--                     ['color'] = {140, 210, 255} --blue
--                 }
--             },
--  ]]                   
--             ['sparklers'] = {
--                 {
--                     ['hash'] = 'prop_cs_pour_tube',
--                     ['visible'] = true,
--                             ['fx'] = {
--                         ['library'] = 'scr_ih_club',
--                         ['effect'] = 'scr_ih_club_sparkler',
--                     },
--                             ['position'] = vector3(-2027.92, -556.96, 9.06),
--                     ['heading'] = 0.0,
--                     ['color'] = {255, 215, 0}
--                 },
--                         {
--                     ['hash'] = 'prop_cs_pour_tube',
--                     ['visible'] = true,
--                             ['fx'] = {
--                         ['library'] = 'scr_ih_club',
--                         ['effect'] = 'scr_ih_club_sparkler',
--                     },
--                             ['position'] = vector3(-2026.59, -555.35, 9.06),
--                     ['heading'] = 0.0,
--                     ['color'] = {255, 215, 0}
--                 },
--                 {
--                     ['hash'] = 'prop_cs_pour_tube',
--                     ['visible'] = true,
--                             ['fx'] = {
--                         ['library'] = 'scr_ih_club',
--                         ['effect'] = 'scr_ih_club_sparkler',
--                     },
--                             ['position'] = vector3(-1995.31, -546.02, 13.32),
--                     ['heading'] = 0.0,
--                     ['color'] = {0, 255, 255}
--                 },
--                 {
--                     ['hash'] = 'prop_cs_pour_tube',
--                     ['visible'] = true,
--                             ['fx'] = {
--                         ['library'] = 'scr_ih_club',
--                         ['effect'] = 'scr_ih_club_sparkler',
--                     },
--                             ['position'] = vector3(-1995.76, -538.15, 13.32),
--                     ['heading'] = 0.0,
--                     ['color'] = {0, 255, 255}
--                 },
--                 {
--                     ['hash'] = 'prop_cs_pour_tube',
--                     ['visible'] = true,
--                             ['fx'] = {
--                         ['library'] = 'scr_ih_club',
--                         ['effect'] = 'scr_ih_club_sparkler',
--                     },
--                             ['position'] = vector3(-2032.48, -527.08, 9.06),
--                     ['heading'] = 0.0,
--                     ['color'] = {0, 255, 255}
--                 },
--                 {
--                     ['hash'] = 'prop_cs_pour_tube',
--                     ['visible'] = true,
--                             ['fx'] = {
--                         ['library'] = 'scr_ih_club',
--                         ['effect'] = 'scr_ih_club_sparkler',
--                     },
--                             ['position'] = vector3(-2058.74, -530.32, 7.76),
--                     ['heading'] = 0.0,
--                     ['color'] = {0, 255, 255}
--                 },
--                 {
--                     ['hash'] = 'prop_cs_pour_tube',
--                     ['visible'] = true,
--                             ['fx'] = {
--                         ['library'] = 'scr_ih_club',
--                         ['effect'] = 'scr_ih_club_sparkler',
--                     },
--                             ['position'] = vector3(-2008.31, -588.43, 9.07),
--                     ['heading'] = 0.0,
--                     ['color'] = {0, 255, 255}
--                 },
--                 {
--                     ['hash'] = 'prop_cs_pour_tube',
--                     ['visible'] = true,
--                             ['fx'] = {
--                         ['library'] = 'scr_ih_club',
--                         ['effect'] = 'scr_ih_club_sparkler',
--                     },
--                             ['position'] = vector3(-2004.13, -581.91, 9.07),
--                     ['heading'] = 0.0,
--                     ['color'] = {0, 255, 255}
--                 },
--             },
                    
--             ['speakers'] = {
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = true,
--                     ['position'] = vector3(-2009.11, -588.35, 8.26),
--                     ['heading'] = 180.00,
--                     ['lodDistance'] = nil,
--                     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
--                     ['directionOffset'] = nil,
--                     ['maxDistance'] = 100.0,
--                     ['refDistance'] = 16.0,
--                     ['rolloffFactor'] = 1.25,
--                     ['coneInnerAngle'] = 90,
--                     ['coneOuterAngle'] = 180,
--                     ['coneOuterGain'] = 0.5,
--                     ['fadeDurationMs'] = 250,
--                     ['volumeMultiplier'] = 2.5,
--                     ['lowPassGainReductionPercent'] = 15
--                 },
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = true,
--                     ['position'] = vector3(-2003.79, -582.45, 8.26),
--                     ['heading'] = 270.00,
--                     ['lodDistance'] = nil,
--                     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
--                     ['directionOffset'] = nil,
--                     ['maxDistance'] = 100.0,
--                     ['refDistance'] = 16.0,
--                     ['rolloffFactor'] = 1.25,
--                     ['coneInnerAngle'] = 90,
--                     ['coneOuterAngle'] = 180,
--                     ['coneOuterGain'] = 0.5,
--                     ['fadeDurationMs'] = 250,
--                     ['volumeMultiplier'] = 2.5,
--                     ['lowPassGainReductionPercent'] = 15
--                 },
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = true,
--                     ['position'] = vector3(-2009.88, -562.88, 7.86),
--                     ['heading'] = 251.36,
--                     ['lodDistance'] = nil,
--                     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
--                     ['directionOffset'] = nil,
--                     ['maxDistance'] = 100.0,
--                     ['refDistance'] = 16.0,
--                     ['rolloffFactor'] = 1.25,
--                     ['coneInnerAngle'] = 90,
--                     ['coneOuterAngle'] = 180,
--                     ['coneOuterGain'] = 0.5,
--                     ['fadeDurationMs'] = 250,
--                     ['volumeMultiplier'] = 2.5,
--                     ['lowPassGainReductionPercent'] = 15
--                 },
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = true,
--                     ['position'] = vector3(-2014.77, -541.23, 8.06),
--                     ['heading'] = 263.78,
--                     ['lodDistance'] = nil,
--                     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
--                     ['directionOffset'] = nil,
--                     ['maxDistance'] = 100.0,
--                     ['refDistance'] = 16.0,
--                     ['rolloffFactor'] = 1.25,
--                     ['coneInnerAngle'] = 90,
--                     ['coneOuterAngle'] = 180,
--                     ['coneOuterGain'] = 0.5,
--                     ['fadeDurationMs'] = 250,
--                     ['volumeMultiplier'] = 2.5,
--                     ['lowPassGainReductionPercent'] = 15
--                 },
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = true,
--                     ['position'] = vector3(-2032.28, -526.23, 8.06),
--                     ['heading'] = 2.11,
--                     ['lodDistance'] = nil,
--                     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
--                     ['directionOffset'] = nil,
--                     ['maxDistance'] = 100.0,
--                     ['refDistance'] = 16.0,
--                     ['rolloffFactor'] = 1.25,
--                     ['coneInnerAngle'] = 90,
--                     ['coneOuterAngle'] = 180,
--                     ['coneOuterGain'] = 0.5,
--                     ['fadeDurationMs'] = 250,
--                     ['volumeMultiplier'] = 2.5,
--                     ['lowPassGainReductionPercent'] = 15
--                 },
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = true,
--                     ['position'] = vector3(-1996.21, -537.99, 12.06),
--                     ['heading'] = 286.27,
--                     ['lodDistance'] = nil,
--                     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
--                     ['directionOffset'] = nil,
--                     ['maxDistance'] = 100.0,
--                     ['refDistance'] = 16.0,
--                     ['rolloffFactor'] = 1.25,
--                     ['coneInnerAngle'] = 90,
--                     ['coneOuterAngle'] = 180,
--                     ['coneOuterGain'] = 0.5,
--                     ['fadeDurationMs'] = 250,
--                     ['volumeMultiplier'] = 2.5,
--                     ['lowPassGainReductionPercent'] = 15
--                 },
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = true,
--                     ['position'] = vector3(-1995.43, -546.45, 12.06),
--                     ['heading'] = 275.31,
--                     ['lodDistance'] = nil,
--                     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
--                     ['directionOffset'] = nil,
--                     ['maxDistance'] = 100.0,
--                     ['refDistance'] = 16.0,
--                     ['rolloffFactor'] = 1.25,
--                     ['coneInnerAngle'] = 90,
--                     ['coneOuterAngle'] = 180,
--                     ['coneOuterGain'] = 0.5,
--                     ['fadeDurationMs'] = 250,
--                     ['volumeMultiplier'] = 2.5,
--                     ['lowPassGainReductionPercent'] = 15
--                 },
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = true,
--                     ['position'] = vector3(-2011.01, -534.33, 10.56),
--                     ['heading'] = 234.64,
--                     ['lodDistance'] = nil,
--                     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
--                     ['directionOffset'] = nil,
--                     ['maxDistance'] = 100.0,
--                     ['refDistance'] = 16.0,
--                     ['rolloffFactor'] = 1.25,
--                     ['coneInnerAngle'] = 90,
--                     ['coneOuterAngle'] = 180,
--                     ['coneOuterGain'] = 0.5,
--                     ['fadeDurationMs'] = 250,
--                     ['volumeMultiplier'] = 2.5,
--                     ['lowPassGainReductionPercent'] = 15
--                 },
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = true,
--                     ['position'] = vector3(-2053.33, -527.76, 6.76),
--                     ['heading'] = 351.77,
--                     ['lodDistance'] = nil,
--                     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
--                     ['directionOffset'] = nil,
--                     ['maxDistance'] = 100.0,
--                     ['refDistance'] = 16.0,
--                     ['rolloffFactor'] = 1.25,
--                     ['coneInnerAngle'] = 90,
--                     ['coneOuterAngle'] = 180,
--                     ['coneOuterGain'] = 0.5,
--                     ['fadeDurationMs'] = 250,
--                     ['volumeMultiplier'] = 2.5,
--                     ['lowPassGainReductionPercent'] = 15
--                 },
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = true,
--                     ['position'] = vector3(-2083.27, -543.41, 6.56),
--                     ['heading'] = 58.42,
--                     ['lodDistance'] = nil,
--                     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
--                     ['directionOffset'] = nil,
--                     ['maxDistance'] = 100.0,
--                     ['refDistance'] = 16.0,
--                     ['rolloffFactor'] = 1.25,
--                     ['coneInnerAngle'] = 90,
--                     ['coneOuterAngle'] = 180,
--                     ['coneOuterGain'] = 0.5,
--                     ['fadeDurationMs'] = 250,
--                     ['volumeMultiplier'] = 2.5,
--                     ['lowPassGainReductionPercent'] = 15
--                 },
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = true,
--                     ['position'] = vector3(-2104.9, -624.28, 4.43),
--                     ['heading'] = 112.66,
--                     ['lodDistance'] = nil,
--                     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
--                     ['directionOffset'] = nil,
--                     ['maxDistance'] = 100.0,
--                     ['refDistance'] = 16.0,
--                     ['rolloffFactor'] = 1.25,
--                     ['coneInnerAngle'] = 90,
--                     ['coneOuterAngle'] = 180,
--                     ['coneOuterGain'] = 0.5,
--                     ['fadeDurationMs'] = 250,
--                     ['volumeMultiplier'] = 2.5,
--                     ['lowPassGainReductionPercent'] = 15
--                 },
--                 {
--                     ['hash'] = 'ba_prop_battle_club_speaker_large',
--                     ['visible'] = true,
--                     ['position'] = vector3(-2029.82, -563.58, 8.06),
--                     ['heading'] = 221.15,
--                     ['lodDistance'] = nil,
--                     ['soundOffset'] = vector3(0.0, 0.0, 1.4),
--                     ['directionOffset'] = nil,
--                     ['maxDistance'] = 100.0,
--                     ['refDistance'] = 16.0,
--                     ['rolloffFactor'] = 1.25,
--                     ['coneInnerAngle'] = 90,
--                     ['coneOuterAngle'] = 180,
--                     ['coneOuterGain'] = 0.5,
--                     ['fadeDurationMs'] = 250,
--                     ['volumeMultiplier'] = 2.5,
--                     ['lowPassGainReductionPercent'] = 15
--                 },
        
--             },
--         },


                -- Bahama Mamas
                ['bahama'] = {
                    ['enabled'] = true,
        
                    ['idleWallpaperUrl'] = 'https://i.postimg.cc/Fzg07kbH/BM-tv.png',
                   -- ['idleWallpaperUrl'] = 'https://cdn.discordapp.com/attachments/897679482230542407/1042451024989933708/Untitled__500__240_px___400__240_px___3__AdobeExpress.gif',
        
                    ['bass'] = {
                        ['smoke'] = {
                            ['cooldownMs'] = 30000,
                            ['colorWithDynamicSpotlights'] = true
                        },
        
                        ['sparklers'] = {
                            ['cooldownMs'] = 30000,
                            ['colorWithDynamicSpotlights'] = true
                        }
                    },
        
                    ['monitors'] = {
                        {
                            ['hash'] = 'ba_prop_battle_club_screen_02',
                            ['position'] = vector3(-1374.62, -606.27, 32.59),
                            ['heading'] = 300.32180786133
                        }
                    },
        
                    ['area'] = {
                        ['range'] = 80,
                        ['center'] = vector3(-1389.88, -616.29, 30.71),
        
                        ['polygons'] = {
                            ['applyLowPassFilterOutside'] = true,
        
                            ['entries'] = {
                                {
                                    ['height'] = {
                                        ['min'] = 28.0,
                                        ['max'] = 35.0
                                    },
        
                                    ['points'] = {
                                        vector2(-1393.2158, -591.4385),
                                        vector2(-1390.1388, -596.2726),
                                        vector2(-1393.0000, -598.7607),
                                        vector2(-1389.1501, -605.6030),
                                        vector2(-1380.9458, -600.4941),
                                        vector2(-1377.2175, -605.4868),
                                        vector2(-1376.5146, -606.7695),
                                        vector2(-1373.5714, -607.1315),
                                        vector2(-1373.6136, -606.8812),
                                        vector2(-1374.5880, -608.4337),
                                        vector2(-1371.3943, -613.6541),
                                        vector2(-1379.3060, -619.4830),
                                        vector2(-1380.2322, -619.0524),
                                        vector2(-1376.9164, -624.1046),
                                        vector2(-1379.6473, -626.1050),
                                        vector2(-1378.4934, -627.9241),
                                        vector2(-1390.3518, -635.9399),
                                        vector2(-1390.0446, -634.2211),
                                        vector2(-1393.8784, -635.1125),
                                        vector2(-1413.1132, -604.1365)
                                    }
                                }
                            }
                        }
                    },
        
                    ['replacers'] = {
                        ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                        ['ba_prop_battle_club_projector'] = 'script_rt_club_projector',
                    },
        
                    ['spotlights'] = {
                        {
                            ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                            ['hash'] = 'cs_prop_hall_spotlight', --stage
                            ['position'] = vector3(-1383.01, -630.08, 33.43),
                            ['heading'] = 210.13468170166,
                            ['color'] = {255, 138, 255} --pink
                        },
        
                        {
                            ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                            ['hash'] = 'cs_prop_hall_spotlight', --stage
                            ['position'] = vector3(-1374.81, -615.817, 33.30),
                            ['heading'] = 220.00,
                            ['color'] = {140, 210, 255} --blue
                        },
        
                        {
                            ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                            ['hash'] = 'cs_prop_hall_spotlight',
                            ['position'] = vector3(-1387.27, -604.46, 33.38),
                            ['heading'] = 355.00,
                            ['color'] = {255, 138, 255} --pink
                        },
        
                        {
                            ['soundSyncType'] = SOUND_SYNC_TYPE.MID,
                            ['hash'] = 'cs_prop_hall_spotlight',
                            ['position'] = vector3(-1377.68, -618.27, 33.38),
                            ['heading'] = 265.00,
                            ['color'] = {140, 210, 255} --blue
                        },
        
                        {
                            ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                            ['hash'] = 'cs_prop_hall_spotlight',
                            ['position'] = vector3(-1383.54, -602.27, 33.30),
                            ['heading'] = 30.00,
                            ['color'] = {255, 138, 255} --pink
                        },
        
                        {
                            ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                            ['hash'] = 'cs_prop_hall_spotlight',
                            ['position'] = vector3(-1389.845, -623.00, 33.00),
                            ['heading'] = 96.77075195312,
                            ['color'] = {140, 210, 255} --blue
                        },
        
                        {
                            ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                            ['hash'] = 'cs_prop_hall_spotlight',
                            ['position'] = vector3(-1398.417, -598.812, 32.50), --bar entrance
                            ['heading'] = 30.50,
                            ['color'] = {255, 138, 255} --pink
                        },
        
                        {
                            ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                            ['hash'] = 'cs_prop_hall_spotlight',
                            ['position'] = vector3(-1406.901, -600.901, 33.00), --bar left side
                            ['heading'] = 30.00,
                            ['color'] = {255, 138, 255} --pink
                        },
        
                        {
                            ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                            ['hash'] = 'cs_prop_hall_spotlight',
                            ['position'] = vector3(-1397.693, -599.14, 32.5), --entrance
                            ['heading'] = 135.00,
                            ['color'] = {140, 210, 255} --blue
                        },
        
                        {
                            ['soundSyncType'] = SOUND_SYNC_TYPE.TREBLE,
                            ['hash'] = 'cs_prop_hall_spotlight',
                            ['position'] = vector3(-1411.191, -603.072, 33.0), --pole stage bar
                            ['heading'] = 39.00,
                            ['color'] = {140, 210, 255} --blue
                        },
        
                        {
                            ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                            ['hash'] = 'cs_prop_hall_spotlight',
                            ['position'] = vector3(-1406.352, -608.35, 33.0), --OVER BOOTH TO POLES
                            ['heading'] = 79.00,
                            ['color'] = {255, 138, 255} --PINK
                        },
        
                        {
                            ['soundSyncType'] = SOUND_SYNC_TYPE.LOW_MID,
                            ['hash'] = 'cs_prop_hall_spotlight',
                            ['position'] = vector3(-1400.265, -617.74, 33.0), --OVER BOOTH TO POLES 2
                            ['heading'] = 115.00,
                            ['color'] = {255, 138, 255} --PINK
                        },
        
                        {
                            ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                            ['hash'] = 'cs_prop_hall_spotlight',
                            ['position'] = vector3(-1401.592, -621.248, 33.0), --OVER BENCH 1
                            ['heading'] = 115.00,
                            ['color'] = {140, 210, 255} --blue
                        },
        
                        {
                            ['soundSyncType'] = SOUND_SYNC_TYPE.HIGH_MID,
                            ['hash'] = 'cs_prop_hall_spotlight',
                            ['position'] = vector3(-1396.051, -629.868, 33.0), --OVER BENCH 2
                            ['heading'] = 150.00,
                            ['color'] = {140, 210, 255} --blue
                        },
        
                        {
                            ['soundSyncType'] = SOUND_SYNC_TYPE.BASS,
                            ['hash'] = 'cs_prop_hall_spotlight',
                            ['position'] = vector3(-1391.87, -615.83, 33.00),
                            ['heading'] = 51.84906005859,
                            ['color'] = {140, 210, 255} --blue
                        }
                    },
        
                    ['smokers'] = {
                        {
                            ['hash'] = 'ba_prop_club_smoke_machine',
                            ['visible'] = true,
        
                            ['fx'] = {
                                ['library'] = 'scr_ba_club',
                                ['effect'] = 'scr_ba_club_smoke_machine',
                            },
        
                            ['position'] = vector3(-1376.32, -605.31, 30.32),
                            ['heading'] = 250.489730834961,
                            ['color'] = {255, 138, 255} --pink
                        },
        
                        {
                            ['hash'] = 'ba_prop_club_smoke_machine',
                            ['visible'] = true,
        
                            ['fx'] = {
                                ['library'] = 'scr_ba_club',
                                ['effect'] = 'scr_ba_club_smoke_machine',
                            },
        
                            ['position'] = vector3(-1374.45, -608.31, 30.32),
                            ['heading'] = 345.489730834961,
                            ['color'] = {140, 210, 255} --blue
                        },
        
                        {
                            ['hash'] = 'ba_prop_club_smoke_machine',
                            ['visible'] = true,
        
                            ['fx'] = {
                                ['library'] = 'scr_ba_club',
                                ['effect'] = 'scr_ba_club_smoke_machine',
                            },
        
                            ['position'] = vector3(-1382.99, -621.4, 28.90),
                            ['heading'] = 273.489730834961,
                            ['color'] = {255, 138, 255} --pink
                        },
        
                        {
                            ['hash'] = 'ba_prop_club_smoke_machine',
                            ['visible'] = true,
        
                            ['fx'] = {
                                ['library'] = 'scr_ba_club',
                                ['effect'] = 'scr_ba_club_smoke_machine',
                            },
        
                            ['position'] = vector3(-1389.52, -626.11, 28.90),
                            ['heading'] = 152.489730834961,
                            ['color'] = {140, 210, 255} --blue
                        },
        
                        {
                            ['hash'] = 'ba_prop_club_smoke_machine',
                            ['visible'] = true,
        
                            ['fx'] = {
                                ['library'] = 'scr_ba_club',
                                ['effect'] = 'scr_ba_club_smoke_machine',
                            },
        
                            ['position'] = vector3(-1391.71, -607.85, 28.90),
                            ['heading'] = 330.489730834961,
                            ['color'] = {255, 138, 255} --pink
                        },
        
                        {
                            ['hash'] = 'ba_prop_club_smoke_machine',
                            ['visible'] = true,
        
                            ['fx'] = {
                                ['library'] = 'scr_ba_club',
                                ['effect'] = 'scr_ba_club_smoke_machine',
                            },
        
                            ['position'] = vector3(-1398.67, -612.04, 28.90),
                            ['heading'] = 83.2324018478394,
                            ['color'] = {140, 210, 255} --blue
                        }
                    },
        
                    ['sparklers'] = {
                        {
                            ['hash'] = 'prop_cs_pour_tube',
                            ['visible'] = true,
        
                            ['fx'] = {
                                ['library'] = 'scr_ih_club',
                                ['effect'] = 'scr_ih_club_sparkler',
                            },
        
                            ['position'] = vector3(-1394.57, -611.08, 29.74),
                            ['heading'] = 0.0,
                            ['color'] = {255, 215, 0}
                        },
        
                        {
                            ['hash'] = 'prop_cs_pour_tube',
                            ['visible'] = true,
        
                            ['fx'] = {
                                ['library'] = 'scr_ih_club',
                                ['effect'] = 'scr_ih_club_sparkler',
                            },
        
                            ['position'] = vector3(-1393.02, -613.47, 29.73),
                            ['heading'] = 0.0,
                            ['color'] = {255, 215, 0}
                        },
                        {
                            ['hash'] = 'prop_cs_pour_tube',
                            ['visible'] = true,
        
                            ['fx'] = {
                                ['library'] = 'scr_ih_club',
                                ['effect'] = 'scr_ih_club_sparkler',
                            },
        
                            ['position'] = vector3(-1391.61, -615.65, 29.73),
                            ['heading'] = 0.0,
                            ['color'] = {0, 255, 255}
                        },
                        {
                            ['hash'] = 'prop_cs_pour_tube',
                            ['visible'] = true,
        
                            ['fx'] = {
                                ['library'] = 'scr_ih_club',
                                ['effect'] = 'scr_ih_club_sparkler',
                            },
        
                            ['position'] = vector3(-1390.05, -618.04, 29.73),
                            ['heading'] = 0.0,
                            ['color'] = {0, 255, 255}
                        },
                        {
                            ['hash'] = 'prop_cs_pour_tube',
                            ['visible'] = true,
        
                            ['fx'] = {
                                ['library'] = 'scr_ih_club',
                                ['effect'] = 'scr_ih_club_sparkler',
                            },
        
                            ['position'] = vector3(-1388.64, -620.21, 29.73),
                            ['heading'] = 0.0,
                            ['color'] = {0, 255, 255}
                        },
                        {
                            ['hash'] = 'prop_cs_pour_tube',
                            ['visible'] = true,
        
                            ['fx'] = {
                                ['library'] = 'scr_ih_club',
                                ['effect'] = 'scr_ih_club_sparkler',
                            },
        
                            ['position'] = vector3(-1387.09, -622.61, 29.71),
                            ['heading'] = 0.0,
                            ['color'] = {0, 255, 255}
                        },
                        {
                            ['hash'] = 'prop_cs_pour_tube',
                            ['visible'] = true,
        
                            ['fx'] = {
                                ['library'] = 'scr_ih_club',
                                ['effect'] = 'scr_ih_club_sparkler',
                            },
        
                            ['position'] = vector3(-1374.31, -608.95, 29.92),
                            ['heading'] = 0.0,
                            ['color'] = {0, 255, 255}
                        },
                        {
                            ['hash'] = 'prop_cs_pour_tube',
                            ['visible'] = true,
        
                            ['fx'] = {
                                ['library'] = 'scr_ih_club',
                                ['effect'] = 'scr_ih_club_sparkler',
                            },
        
                            ['position'] = vector3(-1376.91, -604.9, 29.92),
                            ['heading'] = 0.0,
                            ['color'] = {0, 255, 255}
                        },
                    },
        
                    ['speakers'] = {
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = true,
                            ['position'] = vector3(-1378.71, -602.13, 30.92),
                            ['heading'] = 300.55068969727,
                            ['soundOffset'] = vector3(0, 0, 1.0),
                            ['refDistance'] = 20.0,
                            ['lowPassGainReductionPercent'] = 0
                        },
        
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = true,
                            ['position'] = vector3(-1373.01, -611.03, 30.94),
                            ['heading'] = 300.89999389648,
                            ['soundOffset'] = vector3(0, 0, 1.0),
                            ['refDistance'] = 20.0,
                            ['lowPassGainReductionPercent'] = 0
                        },
        
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = false,
                            ['position'] = vector3(-1399.42, -603.63, 30.32),
                            ['heading'] = 203.55068969727,
                            ['soundOffset'] = vector3(0, 0, 1.0),
                            ['refDistance'] = 20.0,
                            ['lowPassGainReductionPercent'] = 0
                        },
        
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = false,
                            ['position'] = vector3(-1392.01, -635.27, 30.32),
                            ['heading'] = 349.89999389648,
                            ['soundOffset'] = vector3(0, 0, 1.0),
                            ['refDistance'] = 20.0,
                            ['lowPassGainReductionPercent'] = 0
                        },
        
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = false,
                            ['position'] = vector3(-1395.83, -631.66, 30.99),
                            ['heading'] = 83.89999389648,
                            ['soundOffset'] = vector3(0, 0, 1.0),
                            ['refDistance'] = 20.0,
                            ['lowPassGainReductionPercent'] = 0
                        }
                    }
                },
                ['smallclaimscourt'] = {
                    ['enabled'] = true,
                    ['autoAdjustTime'] = false,
                    ['idleWallpaperUrl'] = 'https://cdn.discordapp.com/attachments/1380358079261970634/1444798349906542757/Department-of-Justice-Logo.png?ex=692e04d1&is=692cb351&hm=1d7cfe3ce2ebdb9034421b6d577b5fa2d47f8ae3810b2a75ff9130cf09fe2fdb&',
                    ['maxVolumePercent'] = 50,
                    ['smokeFxMultiplier'] = 3,
                    ['smokeTimeoutMs'] = 5000,
                    ['sparklerFxMultiplier'] = 1,
                    ['sparklerTimeoutMs'] = 1500,
                    ['delayBetweenSmokeChainMs'] = 1500,
                    ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
                    ['featureDelayWithControllerInterfaceClosedMs'] = 500,
         
                    ['bass'] = nil,
        
                    ['disableEmitters'] = nil,
                    ['scaleform'] = nil,
         
                    ['replacers'] = {
                        ['prop_tv_flat_01'] = 'script_rt_tvscreen',
                        ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                        ['prop_monitor_w_large'] = 'script_rt_tvscreen'
                    },
                                
                    ['area'] = {
                        ['range'] = 10,
                        ['center'] = vec3(-1572.99, 218.52, 58.85),
         
                        ['polygons'] = {
                            ['applyLowPassFilterOutside'] = true,
         
                            ['entries'] = {
                                {
                                    ['height'] = {
                                        ['min'] = 57.00,
                                        ['max'] = 62.50
                                    },
         
                                    ['points'] = {
                                        vec2(-1569.86, 227.16),
                                        vec2(-1564.34, 215.31),
                                        vec2(-1576.9, 209.0),
                                        vec2(-1582.14, 221.54)
                                    }
                                }
                            }
                        }
                    },
                    ['monitors'] = {
                        {
                            ['hash'] = 'prop_monitor_w_large',
                            ['position'] = vec3(-1568.1, 219.53, 59.49),
                            ['rotation'] = nil,
                            ['heading'] = 204.6,
                            ['lodDistance'] = nil
                        },
                        {
                            ['hash'] = 'prop_tv_flat_01',
                            ['position'] = vec3(-1568.5, 224.83, 61.81),
                            ['rotation'] = nil,
                            ['heading'] = 294.1,
                            ['lodDistance'] = nil
                        },
                        {
                            ['hash'] = 'prop_tv_flat_01',
                            ['position'] = vec3(-1569.32, 212.59, 59.5),
                            ['rotation'] = nil,
                            ['heading'] = 205.18,
                            ['lodDistance'] = nil
                        },
                          },
                    ['speakers'] = {
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = false,
                            ['position'] = vec3(-1564.3, 215.34, 58.85), 
                            ['rotation'] = nil,
                            ['heading'] = 296.5,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 35.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = false,
                            ['position'] = vec3(-1569.83, 227.27, 58.85), 
                            ['rotation'] = nil,
                            ['heading'] = 296.5,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 35.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = false,
                            ['position'] = vec3(-1582.13, 221.54, 59.66), 
                            ['rotation'] = nil,
                            ['heading'] = 116.66,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 35.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = false,
                            ['position'] = vec3(-1576.5, 209.6, 58.85), 
                            ['rotation'] = nil,
                            ['heading'] = 116.66,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 35.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                     }
                },
                ['largecourt'] = {
                    ['enabled'] = true,
                    ['autoAdjustTime'] = false,
                    ['idleWallpaperUrl'] = 'https://cdn.discordapp.com/attachments/1380358079261970634/1444798349906542757/Department-of-Justice-Logo.png?ex=692e04d1&is=692cb351&hm=1d7cfe3ce2ebdb9034421b6d577b5fa2d47f8ae3810b2a75ff9130cf09fe2fdb&',
                    ['maxVolumePercent'] = 50,
                    ['smokeFxMultiplier'] = 3,
                    ['smokeTimeoutMs'] = 5000,
                    ['sparklerFxMultiplier'] = 1,
                    ['sparklerTimeoutMs'] = 1500,
                    ['delayBetweenSmokeChainMs'] = 1500,
                    ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
                    ['featureDelayWithControllerInterfaceClosedMs'] = 500,
         
                    ['bass'] = nil,
        
                    ['disableEmitters'] = nil,
                    ['scaleform'] = nil,
         
                    ['replacers'] = {
                        ['prop_tv_flat_01'] = 'script_rt_tvscreen',
                        ['prop_monitor_w_large'] = 'script_rt_tvscreen',
                        ['ba_prop_battle_club_screen'] = 'script_rt_club_tv',
                    },
                                
                    ['area'] = {
                        ['range'] = 15,
                        ['center'] = vec3(-1587.06, 212.6, 65.25),
         
                        ['polygons'] = {
                            ['applyLowPassFilterOutside'] = true,
         
                            ['entries'] = {
                                {
                                    ['height'] = {
                                        ['min'] = 65.00,
                                        ['max'] = 72.50
                                    },
         
                                    ['points'] = {
                                        vec2(-1581.0, 223.44),
                                        vec2(-1574.5, 209.96),
                                        vec2(-1593.48, 201.32),
                                        vec2(-1599.36, 214.68)
                                    }
                                }
                            }
                        }
                    },
                    ['monitors'] = {
                        {
                            ['hash'] = 'prop_monitor_w_large',
                            ['position'] = vec3(-1594.71, 210.37, 65.89),
                            ['rotation'] = nil,
                            ['heading'] = 26.5,
                            ['lodDistance'] = nil
                        },
                        {
                            ['hash'] = 'prop_monitor_w_large',
                            ['position'] = vec3(-1584.52, 208.23, 65.15),
                            ['rotation'] = nil,
                            ['heading'] = 322.8,
                            ['lodDistance'] = nil
                        },
                        {
                            ['hash'] = 'prop_tv_flat_01',
                            ['position'] = vec3(-1580.22, 208.04, 66.95),
                            ['rotation'] = nil,
                            ['heading'] = 205.72,
                            ['lodDistance'] = nil
                        },
                        {
                            ['hash'] = 'prop_tv_flat_01',
                            ['position'] = vec3(-1586.45, 205.13, 66.95),
                            ['rotation'] = nil,
                            ['heading'] = 205.72,
                            ['lodDistance'] = nil
                        },
                        {
                            ['hash'] = 'prop_tv_flat_01',
                            ['position'] = vec3(-1586.14, 220.68, 66.95),
                            ['rotation'] = nil,
                            ['heading'] = 25.35,
                            ['lodDistance'] = nil
                        },
                          },
                    ['speakers'] = {
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = false,
                            ['position'] = vec3(-1581.17, 222.32, 66.29), 
                            ['rotation'] = nil,
                            ['heading'] = 296.5,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 35.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = false,
                            ['position'] = vec3(-1575.92, 210.9, 66.29), 
                            ['rotation'] = nil,
                            ['heading'] = 296.5,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 35.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = false,
                            ['position'] = vec3(-1593.34, 202.66, 65.25), 
                            ['rotation'] = nil,
                            ['heading'] = 116.66,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 35.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                        {
                            ['hash'] = 'ba_prop_battle_club_speaker_small',
                            ['visible'] = false,
                            ['position'] = vec3(-1598.72, 214.02, 65.25), 
                            ['rotation'] = nil,
                            ['heading'] = 116.66,
                            ['lodDistance'] = nil,
                            ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                            ['directionOffset'] = nil,
                            ['maxDistance'] = 35.0,
                            ['refDistance'] = 16.0,
                            ['rolloffFactor'] = 1.25,
                            ['coneInnerAngle'] = 90,
                            ['coneOuterAngle'] = 180,
                            ['coneOuterGain'] = 0.5,
                            ['fadeDurationMs'] = 250,
                            ['volumeMultiplier'] = 1.0,
                            ['lowPassGainReductionPercent'] = 15
                        },
                     }
                },
        ['badlands'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://i.postimg.cc/prN7nhRv/image.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['area'] = {
                ['range'] = 100,
                ['center'] = vec3(-218.77, 6229.71, 31.94),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 27.05,
                                ['max'] = 38.00
                            },
        
                            ['points'] = {
                                vec2(-168.91, 6222.94),
                                vec2(-228.49, 6163.47),
                                vec2(-274.71, 6209.43),
                                vec2(-244.56, 6242.66),
                                vec2(-262.1, 6259.94),
                                vec2(-235.31, 6288.8),
                            }
                        },
                    }
                }
            },

            ['disableEmitters'] = {
                'SE_FRANKLIN_HILLS_HOUSE_RADIO_01'
            },
            ['scaleform'] = nil,

            ['replacers'] = {
                ['vw_prop_vw_cinema_tv_01'] = 'script_rt_tvscreen',
            },

            ['monitors'] = {
                {
                    ['hash'] = 'vw_prop_vw_cinema_tv_01',
                    ['position'] = vec3(-219.82, 6213.61, 33.23),
                    ['rotation'] = nil,
                    ['heading'] = 46.62,
                    ['lodDistance'] = nil
                },
                {
                    ['hash'] = 'vw_prop_vw_cinema_tv_01',
                    ['position'] = vec3(-203.7, 6242.35, 33.4),
                    ['rotation'] = nil,
                    ['heading'] = 314.53,
                    ['lodDistance'] = nil
                }
            },


            ['screens'] = nil,

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-228.82, 6172.42, 31.92), 
                    ['rotation'] = nil,
                    ['heading'] = 185.28,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-268.29, 6215.61, 31.56),
                    ['rotation'] = nil,
                    ['heading'] = 88.62,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-257.63, 6257.24, 31.49),
                    ['rotation'] = nil,
                    ['heading'] = 89.55,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-242.77, 6242.65, 31.49),
                    ['rotation'] = nil,
                    ['heading'] = 93.1,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-231.27, 6283.5, 31.51),
                    ['rotation'] = nil,
                    ['heading'] = 5.6,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-174.44, 6226.66, 31.49),
                    ['rotation'] = nil,
                    ['heading'] = 276.03,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-197.88, 6203.06, 31.48),
                    ['rotation'] = nil,
                    ['heading'] = 223.38,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-200.03, 6252.07, 31.49),
                    ['rotation'] = nil,
                    ['heading'] = 317.83,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-252.56, 6196.82, 31.52),
                    ['rotation'] = nil,
                    ['heading'] = 133.53,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
            }
        },
        ['pdm'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://i.postimg.cc/HsRPjv4b/Premium-Deluxe-Motorsport-GTAOe-Logo-(1).webp',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['area'] = {
                ['range'] = 100,
                ['center'] = vec3(-1032.32, -1376.01, 5.56),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 3.05,
                                ['max'] = 18.00
                            },
        
                            ['points'] = {
                                vec2(-1000.7, -1359.67),
                                vec2(-1035.83, -1300.66),
                                vec2(-1058.46, -1330.87),
                                vec2(-1085.34, -1432.97),
                                vec2(-1072.68, -1465.58),
                                vec2(-1007.28, -1432.68),
                                vec2(-1016.05, -1407.1)
                            }
                        },
                    }
                }
            },

            ['disableEmitters'] = {
                'SE_FRANKLIN_HILLS_HOUSE_RADIO_01'
            },
            ['scaleform'] = nil,

            ['replacers'] = {
                ['prop_tv_flat_michael'] = 'script_rt_tvscreen',
                ['apa_mp_h_str_avunits_04'] = 'script_rt_tvscreen',
            },

            ['monitors'] = {
            },


            ['screens'] = nil,

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-1018.6, -1358.45, 6.33), 
                    ['rotation'] = nil,
                    ['heading'] = 297.18,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-1048.08, -1361.35, 5.55),
                    ['rotation'] = nil,
                    ['heading'] = 28.76,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-1040.22, -1356.51, 5.56),
                    ['rotation'] = nil,
                    ['heading'] = 76.19,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-1024.06, -1380.41, 5.66),
                    ['rotation'] = nil,
                    ['heading'] = 308.7,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-1020.01, -1380.43, 6.04),
                    ['rotation'] = nil,
                    ['heading'] = 209.08,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-1028.25, -1409.73, 5.55),
                    ['rotation'] = nil,
                    ['heading'] = 205.22,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-1039.37, -1407.04, 5.55),
                    ['rotation'] = nil,
                    ['heading'] = 140.51,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-1053.46, -1383.51, 5.55),
                    ['rotation'] = nil,
                    ['heading'] = 122.87,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-1036.45, -1388.72, 5.55),
                    ['rotation'] = nil,
                    ['heading'] = 169.95,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
            }
        },
        ['lux'] = {
            ['enabled'] = true,
            ['autoAdjustTime'] = false,
            ['idleWallpaperUrl'] = 'https://i.postimg.cc/Gpg17xnH/image.png',
            ['maxVolumePercent'] = 50,
            ['smokeFxMultiplier'] = 3,
            ['smokeTimeoutMs'] = 5000,
            ['sparklerFxMultiplier'] = 1,
            ['sparklerTimeoutMs'] = 1500,
            ['delayBetweenSmokeChainMs'] = 1500,
            ['delayToTriggerBassEffectsAfterPlayingMs'] = 2500,
            ['featureDelayWithControllerInterfaceClosedMs'] = 500,

            ['area'] = {
                ['range'] = 50,
                ['center'] = vec3(-835.03, -265.14, 38.88),
                ['height'] = nil,

                ['polygons'] = {
                    ['applyLowPassFilterOutside'] = true,
                    ['invertLowPassApplication'] = false,
                    ['hideReplacersOutside'] = true,

                    ['entries'] = {
                        {
                            ['height'] = {
                                ['min'] = 30.05,
                                ['max'] = 50.00
                            },
        
                            ['points'] = {
                                vec2(-833.34, -240.84),
                                vec2(-853.89, -252.08),
                                vec2(-854.88, -261.5),
                                vec2(-845.42, -272.12),
                                vec2(-831.02, -281.18),
                                vec2(-814.54, -285.88),
                                vec2(-813.38, -271.89)
                            }
                        },
                    }
                }
            },

            ['disableEmitters'] = {
                'SE_FRANKLIN_HILLS_HOUSE_RADIO_01'
            },
            ['scaleform'] = nil,

            ['replacers'] = {
                ['vw_prop_vw_cinema_tv_01'] = 'script_rt_tvscreen',
            },

            ['monitors'] = {
                {
                    ['hash'] = 'vw_prop_vw_cinema_tv_01',
                    ['position'] = vec3(-839.76, -255.2, 40.23),
                    ['rotation'] = nil,
                    ['heading'] = 23.02,
                    ['lodDistance'] = nil
                },
                {
                    ['hash'] = 'vw_prop_vw_cinema_tv_01',
                    ['position'] = vec3(-839.92, -254.98, 40.03),
                    ['rotation'] = nil,
                    ['heading'] = 202.89,
                    ['lodDistance'] = nil
                }
            },


            ['screens'] = nil,

            ['speakers'] = {
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-819.98, -277.16, 38.89), 
                    ['rotation'] = nil,
                    ['heading'] = 237.17,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },

                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-849.07, -250.52, 38.89),
                    ['rotation'] = nil,
                    ['heading'] = 42.23,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
                {
                    ['hash'] = 'ba_prop_battle_club_speaker_large',
                    ['visible'] = false,
                    ['position'] = vec3(-835.3, -243.07, 38.89),
                    ['rotation'] = nil,
                    ['heading'] = 6.75,
                    ['lodDistance'] = nil,
                    ['soundOffset'] = vector3(0.0, 0.0, 1.4),
                    ['directionOffset'] = nil,
                    ['maxDistance'] = 32.0,
                    ['refDistance'] = 16.0,
                    ['rolloffFactor'] = 1.25,
                    ['coneInnerAngle'] = 90,
                    ['coneOuterAngle'] = 180,
                    ['coneOuterGain'] = 0.5,
                    ['fadeDurationMs'] = 250,
                    ['volumeMultiplier'] = 1.0,
                    ['lowPassGainReductionPercent'] = 15
                },
            }
        },
    }
}
