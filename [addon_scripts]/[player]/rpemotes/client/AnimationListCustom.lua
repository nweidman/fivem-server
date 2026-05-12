-- Addon Emote Loader Framework
-- Drop .lua files into custom_emotes/ directory to auto-load custom animations.
--
-- Each file should have an ENABLED flag at the top:
--   local ENABLED = true  -- set to false to disable this pack
--   if not ENABLED then return end

---@type AnimationListConfig[]
--local AddonEmotesList = {}

-- Emotes you add in the file will automatically be added to AnimationList.lua
-- If you have multiple custom list files they MUST be added between AnimationList.lua and Emote.lua in fxmanifest.lua!
-- Don't change 'CustomDP' it is local to this file!

local CustomDP = {}

CustomDP.Expressions = {}
CustomDP.Walks = {}
CustomDP.Shared = {
    ["pmotoraa"] = {
        "pazeee@motoraa@animations",
        "pazeee@motoraa@clip",
        "Motor A Driver",
        "pmotora",
        AnimationOptions = {
        }
    },
    ["pmotora"] = {
        "pazeee@motora@animations",
        "pazeee@motora@clip",
        "Motor A Passenger",
        "pmotoraa",
        AnimationOptions = {
            EmoteLoop = true,
            Attachto = true,
            bone = 11816,
            xPos = 0.5500,
            yPos = 0.1500,
            zPos = -0.1200,
            xRot = 0.000,
            yRot = 0.000,
            zRot = -14.000
        }
    },
    ["pmotorb"] = {
        "pazeee@motorb@animations",
        "pazeee@motorb@clip",
        "Motor B",
        "pmotorc",
        AnimationOptions = {
			EmoteLoop = true,
			EmoteMoving = true
        }
    },
    ["pmotorc"] = {
        "pazeee@motorc@animations",
        "pazeee@motorc@clip",
        "Motor C",
        "pmotorb",
        AnimationOptions = {
            EmoteLoop = true,
            Attachto = true,
            bone = 24818,
            xPos = 0.3200,
            yPos = -0.1300,
            zPos = -0.2800,
            xRot = 0.000,
            yRot = 0.000,
            zRot = -28.000
        }
    },
    ["pholdlega"] = {
        "pazeee@holdlega@animations",
        "pazeee@holdlega@clip",
        "Hold Leg A",
        "pholdlegb",
        AnimationOptions = {
			Flag = 33
        }
    },
    ["pholdlegb"] = {
        "pazeee@holdlegb@animations",
        "pazeee@holdlegb@clip",
        "Hold Leg B",
        "pholdlega",
        AnimationOptions = {
            EmoteLoop = true,
            Attachto = true,
            bone = 52301,
            xPos = -0.4100,
            yPos = -0.1700,
            zPos = 1.1300,
            xRot = 0.000,
            yRot = 0.000,
            zRot = 0.000
        }
    },
    ["pstucklega"] = {
        "pazeee@stucklega@animations",
        "pazeee@stucklega@clip",
        "Stuck Leg A",
        "pstucklegb",
        AnimationOptions = {
			EmoteLoop = true
        }
    },
    ["pstucklegb"] = {
        "pazeee@stucklegb@animations",
        "pazeee@stucklegb@clip",
        "Stuck Leg B",
        "pstucklega",
        AnimationOptions = {
            EmoteLoop = true,
            Attachto = true,
            bone = 16335,
            xPos = 0.4100,
            yPos = -0.1700,
            zPos = 0.1300,
            xRot = 0.000,
            yRot = 0.000,
            zRot = 0.000
        }
    },
    ["pcartcementb"] = {
        "pazeee@cartcementb@animations",
        "pazeee@cartcementb@clip",
        "Cart Cement B",
        "pcartcementc",
        AnimationOptions = {
            Prop = 'prop_wheelbarrow01a',
            PropBone = 28422,
            PropPlacement = {
                0.8500, 0.62, 0.0,
                -36.633, -51.309, 60.93
			},
			Flag = 33
        }
    },
    ["pcartcementc"] = {
        "pazeee@cartcementc@animations",
        "pazeee@cartcementc@clip",
        "Cart Cement C",
        "pcartcementb",
        AnimationOptions = {
            EmoteLoop = true,
            Attachto = true,
            bone = 28422,
            xPos = 0.1800,
            yPos = 0.7100,
            zPos = -0.0500,
            xRot = 0.000,
            yRot = 0.000,
            zRot = -10.000
        }
    },
    ["pfunnypuncha"] = {
        "pazeee@funnypuncha@animations",
        "pazeee@funnypuncha@clip",
        "Funny Punch A",
        "pfunnypunchb",
        AnimationOptions = {
            SyncOffsetFront = 1.35,
            SyncOffsetSide = -0.15,
            EmoteLoop = true
        }
    },
    ["pfunnypunchb"] = {
        "pazeee@funnypunchb@animations",
        "pazeee@funnypunchb@clip",
        "Funny Punch B",
        "pfunnypuncha",
        AnimationOptions = {
            SyncOffsetFront = 1.35,
            SyncOffsetSide = -0.15,
            EmoteLoop = true
        }
    },
--[[ ["couple5f"] = {"anim@female_couple_05", "f_couple_05_clip", "Couple 1 F", "couple5m", AnimationOptions = {
        EmoteMoving = false,
        EmoteLoop = true
    }
},
["couple5m"] = { "anim@male_couple_05", "m_couple_05_clip", "Couple 1 M", "couple5f", AnimationOptions = {
        EmoteMoving = false,
        EmoteLoop = true,
        Attachto = true,
    }
},
["couple6f"] = { "anim@female_couple_06", "f_couple_06_clip", "Couple 2 F", "couple6m", AnimationOptions = {
        EmoteMoving = false,
        EmoteLoop = true
    }
},
["couple6m"] = { "anim@male_couple_06", "m_couple_06_clip", "Couple 2 M", "couple6f", AnimationOptions = {
        EmoteMoving = false,
        EmoteLoop = true,
        Attachto = true,
    }

},
["couple7f"] = { "anim@female_couple_07", "f_couple_07_clip", "Couple 3 F", "couple7m", AnimationOptions = {
        EmoteMoving = false,
        EmoteLoop = true
    }
},
["couple7m"] = { "anim@male_couple_07", "m_couple_07_clip", "Couple 1 M", "couple6f", AnimationOptions = {
        EmoteMoving = false,
        EmoteLoop = true,
        Attachto = true,
    }
},
["couple2f"] = {"mrwitt@shared_moments_f", "mrwitt", "Couple 2 F", "couple2m", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true
}
},
["couple2m"] = {"mrwitt@shared_moments_m", "mrwitt", "Couple 2 M", "couple2f", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true,
    Attachto = true,
}
},
["couple3f"] = {"mrwitt@stylish_sunset_dance_female", "mrwitt", "Couple 3 F", "couple3m", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true
}
},
["couple3m"] = {"mrwitt@stylish_sunset_dance_male", "mrwitt", "Couple 3 M", "couple3f", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true,
    Attachto = true,
}
},
["couple4f"] = {"mrwitt@tender_hand_grasp_female", "mrwitt", "Couple 4 F", "couple4m", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true
}
},
["couple4m"] = {"mrwitt@tender_hand_grasp_male", "mrwitt", "Couple 4 M", "couple4f", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true,
    Attachto = true,
}
},
["couple8f"] = {"mrwitt@togetherness_in_front_of_car_female", "mrwitt", "Couple 8 F", "couple8m", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true
}
},
["couple8m"] = {"mrwitt@togetherness_in_front_of_car_male", "mrwitt", "Couple 8 M", "couple8f", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true,
    Attachto = true,
}
},
["couple9f"] = {"mrwitt@heart_warmth_f", "mrwitt", "Couple 9 F", "couple9m", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true
}
},
["couple9m"] = {"mrwitt@heart_warmth_m", "mrwitt", "Couple 9 M", "couple9f", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true,
    Attachto = true,
}
},
["couple10f"] = {"mrwitt@intimate_breast_caress_f", "mrwitt", "Couple 10 F", "couple10m", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true
}
},
["couple10m"] = {"mrwitt@intimate_breast_caress_m", "mrwitt", "Couple 10 M", "couple10f", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true,
    Attachto = true,
}
},
["couple11f"] = {"mrwitt@kiss_in_sunset_f", "mrwitt", "Couple 11 F", "couple11m", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true
}
},
["couple11m"] = {"mrwitt@kiss_in_sunset_m", "mrwitt", "Couple 11 M", "couple11f", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true,
    Attachto = true,
}
},
["couple12f"] = {"mrwitt@kiss_in_wet_element_female", "mrwitt", "Couple 12 F", "couple12m", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true
}
},
["couple12m"] = {"mrwitt@kiss_in_wet_element_male", "mrwitt", "Couple 12 M", "couple12f", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true,
    Attachto = true,
}
},
["couple13f"] = {"mrwitt@kisses_at_dusk_f", "mrwitt", "Couple 13 F", "couple13m", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true
}
},
["couple13m"] = {"mrwitt@kisses_at_dusk_m", "mrwitt", "Couple 13 M", "couple13f", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true,
    Attachto = true,
}
},
["couple14f"] = {"mrwitt@kissing_at_ocean_beach_female", "mrwitt", "Couple 14 F", "couple14m", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true
}
},
["couple14m"] = {"mrwitt@kissing_at_ocean_beach_male", "mrwitt", "Couple 14 M", "couple14f", AnimationOptions = {
    EmoteMoving = false,
    EmoteLoop = true,
    Attachto = true,
}
},
--]]
["couple127f"] = {"smo@couple_127", "couple_127_a_clip", "Couple Pose 127 F", AnimationOptions = {
	EmoteLoop = true,
	EmoteMoving = false,
}},

["couple127m"] = {"smo@couple_127", "couple_127_b_clip", "Couple Pose 127 M", AnimationOptions = {
	EmoteLoop = true,
	EmoteMoving = false,
}},

["couple128f"] = {"smo@couple_128", "couple_128_a_clip", "Couple Pose 128 F", AnimationOptions = {
	EmoteLoop = true,
	EmoteMoving = false,
}},

["couple128m"] = {"smo@couple_128", "couple_128_b_clip", "Couple Pose 128 M", AnimationOptions = {
	EmoteLoop = true,
	EmoteMoving = false,
}},

["couple129f"] = {"smo@couple_129", "couple_129_a_clip", "Couple Pose 129 F", AnimationOptions = {
	EmoteLoop = true,
	EmoteMoving = false,
}},

["couple129m"] = {"smo@couple_129", "couple_129_b_clip", "Couple Pose 129 M", AnimationOptions = {
	EmoteLoop = true,
	EmoteMoving = false,
}},

["couple130f"] = {"smo@couple_130", "couple_130_a_clip", "Couple Pose 130 F", AnimationOptions = {
	EmoteLoop = true,
	EmoteMoving = false,
}},

["couple130m"] = {"smo@couple_130", "couple_130_b_clip", "Couple Pose 130 M", AnimationOptions = {
	EmoteLoop = true,
	EmoteMoving = false,
}},
}

CustomDP.Dances = {
    ["chatwerk1"] = {"divined@drpackv3@new", "chatwerk1", "Twerk Cha Cha #1", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["chatwerk2"] = {"divined@drpackv3@new", "chatwerk2", "Twerk Cha Cha #2", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["ctwerk1"] = {"divined@drpackv3@new", "ctwerk1", "Twerk Low #1", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["ctwerk2"] = {"divined@drpackv3@new", "ctwerk2", "Twerk Low #2", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["cuffit"] = {"divined@drpackv3@new", "cuffit", "Cuff It", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["finesse"] = {"divined@drpackv3@new", "finesse", "Drill Finesse", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["footballgriddy"] = {"divined@drpackv3@new", "footballgriddy", "Griddy (Football Dance)", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["industrybaby"] = {"divined@drpackv3@new", "industrybaby", "Industry Baby (Nas X)", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["kaisturdy"] = {"divined@drpackv3@new", "kaisturdy", "Get Sturdy", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["ohnana"] = {"divined@drpackv3@new", "ohnana", "Oh Na Na", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["poppin"] = {"divined@drpackv3@new", "poppin", "Poppin (Harlow)", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["streetgriddy"] = {"divined@drpackv3@new", "streetgriddy", "Griddy (Street Style)", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["yeahyeahnudy"] = {"divined@drpackv3@new", "yeahyeahnudy", "Yeah Nudy", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["Heart"] = {"divined@rpack@new", "alchemy", "Heart", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["badmood"] = {"divined@rpack@new", "badmood", "Bad Mood", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["bunnyhop"] = {"divined@rpack@new", "bunnyhop", "Bunnyhop", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["burpee"] = {"divined@rpack@new", "burpee", "Burpee", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["callme"] = {"divined@rpack@new", "callme", "Call Me", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["coronet"] = {"divined@rpack@new", "coronet", "Coronet", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dcry"] = {"divined@rpack@new", "dcry", "Cry", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["hailcab"] = {"divined@rpack@new", "hailcab", "Hailcab", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["kepler"] = {"divined@rpack@new", "kepler", "King Of The Jungle", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["uproar"] = {"divined@rpack@new", "uproar", "Uproar", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["yeet"] = {"divined@rpack@new", "yeet", "Yeet", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dbdance1"] = {"divined@fndances@new", "dbdance1", "Mdance", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dbdance2"] = {"divined@fndances@new", "dbdance2", "A1 Dance", AnimationOptions = {
        EmoteLoop = true,
    }},
    ["dbdance3"] = {"divined@fndances@new", "dbdance3", "Boogie Down", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dbdance4"] = {"divined@fndances@new", "dbdance4", "Break Boy", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dbdance5"] = {"divined@fndances@new", "dbdance5", "Breakfast Coffee Dance", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dbdance6"] = {"divined@fndances@new", "dbdance6", "Candy Dance", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dbdance7"] = {"divined@fndances@new", "dbdance7", "Cheerleader Dance", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dbdance8"] = {"divined@fndances@new", "dbdance8", "Crab Dance", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dbdance9"] = {"divined@fndances@new", "dbdance9", "Eastern Blocc", AnimationOptions =
    {
        EmoteLoop = true,
    }},
       ["dbdance10"] = {"divined@fndances@new", "dbdance10", "Electro Swing", AnimationOptions =
    {
        EmoteLoop = true,
    }},
       ["dbdance11"] = {"divined@fndances@new", "dbdance11", "Electro Shuffle", AnimationOptions =
    {
        EmoteLoop = true,
    }},
       ["dbdance12"] = {"divined@fndances@new", "dbdance12", "Floss", AnimationOptions =
    {
        EmoteLoop = true,
    }},
       ["dbdance13"] = {"divined@fndances@new", "dbdance13", "Grooving Jam", AnimationOptions =
    {
        EmoteLoop = true,
    }},
       ["dbdance14"] = {"divined@fndances@new", "dbdance14", "Hillbilly Shuffle", AnimationOptions =
    {
        EmoteLoop = true,
    }},
       ["dbdance15"] = {"divined@fndances@new", "dbdance15", "Laser Dance", AnimationOptions =
    {
        EmoteLoop = true,
    }},
       ["dbdance16"] = {"divined@fndances@new", "dbdance16", "Ribbon Dance", AnimationOptions =
    {
        EmoteLoop = true,
    }},
       ["dbdance17"] = {"divined@fndances@new", "dbdance17", "Running Man", AnimationOptions =
    {
        EmoteLoop = true,
    }},
       ["dbdance18"] = {"divined@fndances@new", "dbdance18", "Step Breakdance", AnimationOptions =
    {
        EmoteLoop = true,
    }},
       ["dbdance19"] = {"divined@fndances@new", "dbdance19", "Cowboy Dance", AnimationOptions =
    {
        EmoteLoop = true,
    }},
       ["dbdance20"] = {"divined@fndances@new", "dbdance20", "Egyptian Dance", AnimationOptions =
    {
        EmoteLoop = true,
    }},
          ["dbdance21"] = {"divined@fndances@new", "dbdance21", "Swipe It", AnimationOptions =
    {
        EmoteLoop = true,
    }},
    ["dsit1"] = {"divined@dsposes@new", "dsit1", "Sit Down #1", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dsit2"] = {"divined@dsposes@new", "dsit2", "Sit Down #2", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dsit3"] = {"divined@dsposes@new", "dsit3", "Sit Down #3", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dfsit1"] = {"divined@dsposes@new", "dfsit1", "Sit Down #1 (Feminine)", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dfsit2"] = {"divined@dsposes@new", "dfsit2", "Sit Down #2 (Feminine)", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dfsit3"] = {"divined@dsposes@new", "dfsit3", "Sit Down #3 (Feminine)", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dfsit4"] = {"divined@dsposes@new", "dfsit4", "Sit Down #4 (Feminin)", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dfsit5"] = {"divined@dsposes@new", "dfsit5", "Sit Down #5 (Feminine)", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dsitg1"] = {"divined@dsposes@new", "dsitg1", "Sit Down (Male)", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dlookright1"] = {"divined@dsposes@new", "dlookright1", "Look Right", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dlookaround"] = {"divined@dsposes@new", "dlookleft1", "Look Around", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dstand1"] = {"divined@dsposes@new", "dstand1", "Stand 1", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dstand2"] = {"divined@dsposes@new", "dstand2", "Stand 2", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["dsitground"] = {"divined@dsposes@new", "dsitground", "Sit Ground 1", AnimationOptions =
    {
        EmoteLoop = true
    }},

-- AR EMOTES ADDITIONS

    ["ddance1"] = {"divined@dances@new", "ddance1", "Divined Dance 1", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance2"] = {"divined@dances@new", "ddance2", "Divined Dance 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance3"] = {"divined@dances@new", "ddance3", "Divined Dance 3", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance4"] = {"divined@dances@new", "ddance4", "Divined Dance 4", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance5"] = {"divined@dances@new", "ddance5", "Divined Dance 5", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance6"] = {"divined@dances@new", "ddance6", "Divined Dance 6", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance7"] = {"divined@dances@new", "ddance7", "Divined Dance 7", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance8"] = {"divined@dances@new", "ddance8", "Divined Dance 8", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance9"] = {"divined@dances@new", "ddance9", "Divined Dance 9", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance10"] = {"divined@dances@new", "ddance10", "Divined Dance 10", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance11"] = {"divined@dances@new", "ddance11", "Divined Dance 11", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance12"] = {"divined@dances@new", "ddance12", "Divined Dance 12", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["ddance13"] = {"divined@dances@new", "ddance13", "Divined Dance 13", AnimationOptions =
   {
      EmoteLoop = true
   }},

   -- Version Two
   ["divdance1"] = {"divined@dancesv2@new", "divdance1", "Divined Dance 1", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance2"] = {"divined@dancesv2@new", "divdance2", "Divined Dance 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance3"] = {"divined@dancesv2@new", "divdance3", "Divined Dance 3", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance4"] = {"divined@dancesv2@new", "divdance4", "Divined Dance 4", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance5"] = {"divined@dancesv2@new", "divdance5", "Divined Dance 5", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance6"] = {"divined@dancesv2@new", "divdance6", "Divined Dance 6", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance7"] = {"divined@dancesv2@new", "divdance7", "Divined Dance 7", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance8"] = {"divined@dancesv2@new", "divdance8", "Divined Dance 8", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance9"] = {"divined@dancesv2@new", "divdance9", "Divined Dance 9", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance10"] = {"divined@dancesv2@new", "divdance10", "Divined Dance 10", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance11"] = {"divined@dancesv2@new", "divdance11", "Divined Dance 11", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance12"] = {"divined@dancesv2@new", "divdance12", "Divined Dance 12", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance13"] = {"divined@dancesv2@new", "divdance13", "Divined Dance 13", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divdance14"] = {"divined@dancesv2@new", "divdance14", "Divined Dance 14", AnimationOptions =
   {
      EmoteLoop = true
   }},
   -- Divine Breakdance
   ["divbdance1"] = {"divined@breakdances@new", "divbdance1", "Divined Break Dance 1", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance2"] = {"divined@breakdances@new", "divbdance2", "Divined Break Dance 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance3"] = {"divined@breakdances@new", "divbdance3", "Divined Break Dance 3", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance4"] = {"divined@breakdances@new", "divbdance4", "Divined Break Dance 4", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance5"] = {"divined@breakdances@new", "divbdance5", "Divined Break Dance 5", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance6"] = {"divined@breakdances@new", "divbdance6", "Divined Break Dance 6", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance7"] = {"divined@breakdances@new", "divbdance7", "Divined Break Dance 7", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance8"] = {"divined@breakdances@new", "divbdance8", "Divined Break Dance 8", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance9"] = {"divined@breakdances@new", "divbdance9", "Divined Break Dance 9", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance10"] = {"divined@breakdances@new", "divbdance10", "Divined Break Dance 10", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance11"] = {"divined@breakdances@new", "divbdance11", "Divined Break Dance 11", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance12"] = {"divined@breakdances@new", "divbdance12", "Divined Break Dance 12", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance13"] = {"divined@breakdances@new", "divbdance13", "Divined Break Dance 13", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance14"] = {"divined@breakdances@new", "divbdance14", "Divined Break Dance 14", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["divbdance15"] = {"divined@breakdances@new", "divbdance14", "Divined Break Dance 15", AnimationOptions =
   {
      EmoteLoop = true
   }},

   -- Divine Breakdance v3
   ["dbrdance1"] = {"divined@brdancesv2@new", "dbrdance1", "Divined Dance 1", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance2"] = {"divined@brdancesv2@new", "dbrdance2", "Divined Dance 2", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance3"] = {"divined@brdancesv2@new", "dbrdance3", "Divined Dance 3", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance4"] = {"divined@brdancesv2@new", "dbrdance4", "Divined Dance 4", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance5"] = {"divined@brdancesv2@new", "dbrdance5", "Divined Dance 5", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance6"] = {"divined@brdancesv2@new", "dbrdance6", "Divined Dance 6", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance7"] = {"divined@brdancesv2@new", "dbrdance7", "Divined Dance 7", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance8"] = {"divined@brdancesv2@new", "dbrdance8", "Divined Dance 8", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance9"] = {"divined@brdancesv2@new", "dbrdance9", "Divined Dance 9", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance10"] = {"divined@brdancesv2@new", "dbrdance10", "Divined Dance 10", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance11"] = {"divined@brdancesv2@new", "dbrdance11", "Divined Dance 11", AnimationOptions =
   {
      EmoteLoop = true
   }},
   ["dbrdance12"] = {"divined@brdancesv2@new", "dbrdance12", "Divined Dance 12", AnimationOptions =
   {
      EmoteLoop = true
   }},

   ["femaledance1"] = {"femaledancesbygoldiemods30@animation", "femaledancesbygoldiemods30_clip", "Club Girl 1", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance2"] = {"femaledancesbygoldiemods31@animation", "femaledancesbygoldiemods31_clip", "Club Girl 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance3"] = {"femaledancesbygoldiemods39@animation", "femaledancesbygoldiemods39_clip", "Club Girl 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance4"] = {"femaledancesbygoldiemods49@animation", "femaledancesbygoldiemods49_clip", "Club Girl 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance5"] = {"femaledancesbygoldiemods40@animation", "femaledancesbygoldiemods40_clip", "Club Girl 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance6"] = {"femaledancesbygoldiemods52@animation", "femaledancesbygoldiemods52_clip", "Club Girl 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance7"] = {"femaledancesbygoldiemods11@animation", "femaledancesbygoldiemods11_clip", "Club Girl 7", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance8"] = {"femaledancesbygoldiemods13@animation", "femaledancesbygoldiemods13_clip", "Club Girl 8", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance9"] = {"femaledancesbygoldiemods15@animation", "femaledancesbygoldiemods15_clip", "Club Girl 9", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance10"] = {"femaledancesbygoldiemods18@animation", "femaledancesbygoldiemods18_clip", "Club Girl 10", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance11"] = {"femaledancesbygoldiemods21@animation", "femaledancesbygoldiemods21_clip", "Club Girl 11", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance12"] = {"femaledancesbygoldiemods24@animation", "femaledancesbygoldiemods24_clip", "Club Girl 12", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["femaledance13"] = {"femaledancesbygoldiemods27@animation", "femaledancesbygoldiemods27_clip", "Club Girl 13", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["zztwerking3"] = {"divined@drillb2@new", "twerkmocap2", "Twerking #3", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["zztwerking2"] = {"divined@drillb2@new", "splitstwerk2", "Twerking #2", AnimationOptions =
    {
        EmoteLoop = true
    }},
    ["zztwerking"] = {"divined@drillb2@new", "twerking", "Twerking #1", AnimationOptions =
    {
        EmoteLoop = true
    }},

   
}

CustomDP.AnimalEmotes = {}
CustomDP.Exits = {}
CustomDP.Emotes = {
      --PD Emotes
   ["pd1"] = {"export@attention", "attentions", "PD Attention", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pd2"] = {"export@fingers_up", "fingers_up", "PD Fingers Up", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pd3"] = {"export@hand_pocket", "hands_pocket", "PD Hands in Pocket", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pd4"] = {"export@hold_pose", "hold_pose", "PD Hold Pose", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pd5"] = {"export@hold_pose2", "hold_pose2", "PD Hold Pose 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pd6"] = {"export@holding_mouth", "holding_mouthh", "PD Hold Mouth", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pd7"] = {"holding@vest", "holding_vest.001", "PD Hold Vest", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pd8"] = {"export@police_crossarms", "police_crossarms", "PD Crossarms", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pd9"] = {"export@police_direction", "police_direction", "PD Direction", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pd10"] = {"holding@vest2", "holding_vest22", "PD Hold Vest 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   -- ["pd11"] = {"export@wanker", "head_000_r", "PD Talking", AnimationOptions =
   -- {
   --     EmoteLoop = true,
   --     EmoteMoving = true,
   -- }},
   ["pd12"] = {"export@taser_draw", "taser_draw", "PD Taser Draw", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pd13"] = {"anim@male@holding_vest_siege", "holding_vest_siege_clip", "Vest 1", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["pd14"] = {"anim@male@holding_vest", "holding_vest_clip", "Vest 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsign005"] = {"qpacc@nygang1", "nygang1_clip", "Gang 1", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign006"] = {"qpacc@nygang2", "nygang2_clip", "Gang 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign007"] = {"qpacc@nygang3", "nygang3_clip", "Gang 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign008"] = {"qpacc@nygang4", "nygang4_clip", "Gang 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign009"] = {"qpacc@nygang5", "nygang5_clip", "Gang 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign010"] = {"qpacc@nygang6", "nygang6_clip", "Gang 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign011"] = {"qpacc@nygang7", "nygang7_clip", "Gang 7", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign012"] = {"qpacc@nygang8", "nygang8_clip", "Gang 8", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign013"] = {"qpacc@nygang9", "nygang9_clip", "Gang 9", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign014"] = {"qpacc@nygang10", "nygang10_clip", "Gang 10", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign015"] = {"qpacc@nygang11", "nygang11_clip", "Gang 11", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign016"] = {"qpacc@nygang12", "nygang12_clip", "Gang 12", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign017"] = {"qpacc@nygang13", "nygang13_clip", "Gang 13", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign018"] = {"qpacc@nygang14", "nygang14_clip", "Gang 14", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign019"] = {"qpacc@nygang15", "nygang15_clip", "Gang 15", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign020"] = {"qpacc@nygang16", "nygang16_clip", "Gang 16", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign021"] = {"qpacc@nygang17", "nygang17_clip", "Gang 17", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign022"] = {"qpacc@nygang18", "nygang18_clip", "Gang 18", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign023"] = {"qpacc@nygang19", "nygang19_clip", "Gang 19", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign024"] = {"qpacc@nygang20", "nygang20_clip", "Gang 20", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign025"] = {"qpacc@nygang21", "nygang21_clip", "Gang 21", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign026"] = {"qpacc@nygang22", "nygang22_clip", "Gang 22", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign027"] = {"qpacc@nygang23", "nygang23_clip", "Gang 23", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign028"] = {"qpacc@nygang24", "nygang24_clip", "Gang 24", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign029"] = {"qpacc@nygang25", "nygang25_clip", "Gang 25", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign030"] = {"qpacc@nygang26", "nygang26_clip", "Gang 26", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign031"] = {"qpacc@nygang27", "nygang27_clip", "Gang 27", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign032"] = {"qpacc@nygang28", "nygang28_clip", "Gang 28", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign033"] = {"qpacc@nygang29", "nygang29_clip", "Gang 29", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign034"] = {"qpacc@nygang30", "nygang30_clip", "Gang 30", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign035"] = {"qpacc@nygang31", "nygang31_clip", "Gang 31", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign036"] = {"qpacc@nygang32", "nygang32_clip", "Gang 32", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign037"] = {"qpacc@nygang33", "nygang33_clip", "Gang 33", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign038"] = {"qpacc@regularstance1", "regularstance1_clip", "Regular Stance 1", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign039"] = {"qpacc@regularstance2", "regularstance2_clip", "Regular Stance 2", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign040"] = {"qpacc@regularstance3", "regularstance3_clip", "Regular Stance 3", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign041"] = {"qpacc@regularstance4", "regularstance4_clip", "Regular Stance 4", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign042"] = {"qpacc@regularstance5", "regularstance5_clip", "Regular Stance 5", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign043"] = {"qpacc@regularstance6", "regularstance6_clip", "Regular Stance 6", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign045"] = {"qpacc@regularstance8", "regularstance8_clip", "Regular Stance 8", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign046"] = {"qpacc@regularstance9", "regularstance9_clip", "Regular Stance 9", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign047"] = {"qpacc@regularstance10", "regularstance10_clip", "Regular Stance 10 ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign048"] = {"qpacc@regularstance11", "regularstance11_clip", "Regular Stance 11", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign049"] = {"qpacc@regularstance12", "regularstance12_clip", "Regular Stance 12", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign050"] = {"qpacc@regularstance13", "regularstance13_clip", "Regular Stance 13", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign051"] = {"qpacc@regularstance14", "regularstance14_clip", "Regular Stance 14", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign0408"] = {"qpacc@regularstance15", "regularstance15_clip", "Regular Stance 15 ", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign409"] = {"qpacc@regularstance16", "regularstance16_clip", "Regular Stance 16", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign410"] = {"qpacc@regularstance17", "regularstance17_clip", "Regular Stance 17", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign411"] = {"qpacc@regularstance18", "regularstance18_clip", "Regular Stance 18", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign412"] = {"qpacc@regularstance19", "regularstance19_clip", "Regular Stance 19", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign413"] = {"qpacc@regularstance20", "regularstance20_clip", "Regular Stance 20", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign052"] = {"qpacc@regularstance21", "regularstance21_clip", "Regular Stance 21", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign053"] = {"qpacc@regularstance22", "regularstance22_clip", "Regular Stance 22", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign054"] = {"qpacc@regularstance23", "regularstance23_clip", "Regular Stance 23", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign055"] = {"qpacc@regularstance24", "regularstance24_clip", "Regular Stance 24", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign056"] = {"qpacc@regularstance25", "regularstance25_clip", "Regular Stance 25", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign057"] = {"qpacc@regularstance26", "regularstance26_clip", "Regular Stance 26", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign058"] = {"qpacc@regularstance27", "regularstance27_clip", "Regular Stance 27", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign059"] = {"qpacc@regularstance28", "regularstance28_clip", "Regular Stance 28", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign060"] = {"qpacc@regularstance29", "regularstance29_clip", "Regular Stance 29", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign061"] = {"qpacc@regularstance30", "regularstance30_clip", "Regular Stance 30", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign062"] = {"qpacc@regularstance31", "regularstance31_clip", "Regular Stance 31", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign063"] = {"qpacc@regularstance32", "regularstance32_clip", "Regular Stance 32", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign064"] = {"qpacc@regularstance33", "regularstance33_clip", "Regular Stance 33", AnimationOptions =
   {
    Prop = 'bkr_prop_cutter_moneypage',
    PropBone = 64096,
    PropPlacement = {0.0900, 0.0160, -0.0300, 0.2461856, 0.7872477, 0.0023882 },
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign065"] = {"qpacc@regularstance34", "regularstance34_clip", "Regular Stance 34", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   --["gsign066"] = {"qpacc@regularstance35", "regularstance35_clip", "Regular Stance 35", AnimationOptions =
   -- { 
   --     EmoteLoop = true,
   --     EmoteMoving = false,
   -- }}, 
   ["gsign066"] = {"qpacc@regularstance36", "regularstance36_clip", "Regular Stance 36", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign067"] = {"qpacc@regularstance37", "regularstance37_clip", "Regular Stance 37", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign069"] = {"qpacc@regularstance39", "regularstance39_clip", "Regular Stance 39", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign070"] = {"qpacc@regularstance40", "regularstance40_clip", "Regular Stance 40", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign071"] = {"qpacc@regularstance41", "regularstance41_clip", "Regular Stance 41", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign072"] = {"qpacc@regularstance42", "regularstance42_clip", "Regular Stance 42", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign073"] = {"qpacc@regularstance43", "regularstance43_clip", "Regular Stance 43", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign074"] = {"qpacc@regularstance44", "regularstance44_clip", "Regular Stance 44", AnimationOptions =
   {
    Prop = 'bkr_prop_money_unsorted_01',
    PropBone = 4090,
    PropPlacement = {0.0000, -0.0390, -0.0290, 2.2304, 58.3771, 31.8549},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign075"] = {"qpacc@regularstance45", "regularstance45_clip", "Regular Stance 45", AnimationOptions =
   {
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign076"] = {"qpacc@regularstance46", "regularstance46_clip", "Regular Stance 46", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign077"] = {"qpacc@regularstance47", "regularstance47_clip", "Regular Stance 47", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign078"] = {"qpacc@regularstance48", "regularstance48_clip", "Regular Stance 48", AnimationOptions =
   {
    Prop = 'bkr_prop_money_unsorted_01',
    PropBone = 64017,
    PropPlacement = {0.0110, -0.0450, -0.0040, 7.4405, -67.5842, -2.3618},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign079"] = {"qpacc@regularstance49", "regularstance49_clip", "Regular Stance 49", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign080"] = {"qpacc@regularstance50", "regularstance50_clip", "Regular Stance 50", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign081"] = {"qpacc@regularstance51", "regularstance51_clip", "Regular Stance 51", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign082"] = {"qpacc@regularstance52", "regularstance52_clip", "Regular Stance 52", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign083"] = {"qpacc@regularstance53", "regularstance53_clip", "Regular Stance 53", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign084"] = {"qpacc@regularstance54", "regularstance54_clip", "Regular Stance 54", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign085"] = {"qpacc@regularstance55", "regularstance55_clip", "Regular Stance 55", AnimationOptions =
   {
    Prop = 'prop_cs_ciggy_01',
    PropBone = 4090,
    PropPlacement = {0.0280, -0.0020, 0.0150, -7.0345092, 67.9037057, -17.6946468 },
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign086"] = {"qpacc@regularstance56", "regularstance56_clip", "Regular Stance 56", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign087"] = {"qpacc@regularstance57", "regularstance57_clip", "Regular Stance 57", AnimationOptions =
   {
    Prop = 'prop_amb_phone',
    PropBone = 26611,
    PropPlacement = {0.0450, -0.0280, 0.0010, -3.3698368, 30.0689668, 3.8289125 },
    SecondProp = 'v_res_fa_book01',
    SecondPropBone = 64017,
    SecondPropPlacement = {0.0350, -0.0320, 0.0040, 8.0000, 0.0000, 0.0000},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign089"] = {"qpacc@regularstance58", "regularstance58_clip", "Regular Stance 58", AnimationOptions =
   {
    Prop = 'prop_plastic_cup_02',
    PropBone = 4089,
    PropPlacement = {0.0410, -0.0120, -0.0150, -170.0000008, 0.00000, -30.000},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign090"] = {"qpacc@regularstance59", "regularstance59_clip", "Regular Stance 59", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign091"] = {"qpacc@regularstance60", "regularstance60_clip", "Regular Stance 60", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign092"] = {"qpacc@regularstance61", "regularstance61_clip", "Regular Stance 61", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign093"] = {"qpacc@regularstance62", "regularstance62_clip", "Regular Stance 62", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign094"] = {"qpacc@regularstance63", "regularstance63_clip", "Regular Stance 63", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign095"] = {"qpacc@regularstance64", "regularstance64_clip", "Regular Stance 64", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign096"] = {"qpacc@regularstance65", "regularstance65_clip", "Regular Stance 65", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign097"] = {"qpacc@regularstance66", "regularstance66_clip", "Regular Stance 66", AnimationOptions =
   {
       Prop = 'prop_anim_cash_note_b',
       PropBone = 4089,
       PropPlacement = {0.0480, 0.0580, -0.0150, -4.5620378, 8.0600729, -42.7619593},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign098"] = {"qpacc@regularstance67", "regularstance67_clip", "Regular Stance 67", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign099"] = {"qpacc@regularstance68", "regularstance68_clip", "Regular Stance 68", AnimationOptions =
   {
    Prop = 'bkr_prop_cutter_moneypage',
    PropBone = 64097,
    PropPlacement = {0.0100, 0.0150, -0.0260, 11.8467003, 96.6172508, 15.8535182},
    SecondProp = 'prop_cs_ciggy_01',
    SecondPropBone = 4090,
    SecondPropPlacement = {0.0720,-0.0390,-0.0270,0.0000,-100.0000,0.0000},
    EmoteLoop = true,
    EmoteMoving = false,
}},
   ["gsign0100"] = {"qpacc@regularstance69", "regularstance69_clip", "Regular Stance 69", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},

   ["gsign195"] = {"94glockymovin@animation", "movin_clip", "Gang Sign 195", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsign197"] = {"94glockychoowook@animation", "choowook_clip", "Gang Sign 197", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign198"] = {"94glockypocket@animation", "pocket_clip", "Gang Sign 198", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsign199"] = {"94glockycrips3@animation", "crips3_clip", "Gang Sign 199", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsign200"] = {"pose1@94glocky", "94glockypose1_clip", "Gang Sign 200", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign201"] = {"oyogzk@94glocky", "94glockyoyogzk_clip", "Gang Sign 201", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign202"] = {"pose2@94glocky", "94glockypose2_clip", "Gang Sign 202", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign203"] = {"94glockydoaogzk@animation", "doaogzk_clip", "Gang Sign 203", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign204"] = {"pose3@94glocky", "94glockypose3_clip", "Gang Sign 204", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign205"] = {"ygz@94glocky", "ygz_clip", "Gang Sign 205", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign206"] = {"pose4@94glocky", "94glockypose4_clip", "Gang Sign 206", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign207"] = {"handspocket3@94glocky", "handspocket3_clip", "Gang Sign 207", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsign208"] = {"gunpose1@94glocky", "gunpose1_clip", "Gang Sign 208", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign209"] = {"2fuck@94glocky", "2fuck_clip", "Gang Sign 209", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign210"] = {"pose8@94glocky", "94glockypose8_clip", "Gang Sign 210", AnimationOptions =
   {   
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64097,
        PropPlacement = {0.0130, 0.0120, -0.0080, 27.3209, -45.5643, 30.4325},
        EmoteLoop = true,
        EmoteMoving = false, 
   }},
   ["gsign211"] = {"wook@94glocky", "wook_clip", "Gang Sign 211", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign212"] = {"wook2@94glocky", "wook2_clip", "Gang Sign 212", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign213"] = {"pose9@94glocky", "94glockypose9_clip", "Gang Sign 213", AnimationOptions =
   {
       Prop = 'p_amb_coffeecup_01',
       PropBone = 4170,
       PropPlacement = {0.0170,-0.0590,0.0100,0.0000,0.0000,0.0000},
       SecondProp = 'p_watch_04',
       SecondPropBone = 35502,
       SecondPropPlacement = {-0.1800,-0.0010,0.0300,0.0000,0.0000,0.0000},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign214"] = {"gd@94glocky", "gd_clip", "Gang Sign 214", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign215"] = {"choocripsk@94glocky", "choocripsk_clip", "Gang Sign 215", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign216"] = {"41@94glocky", "41_clip", "Gang Sign 216", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign217"] = {"ogzk@94glocky", "ogzk_clip", "Gang Sign 217", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign218"] = {"gunpose2@94glocky", "gunpose2_clip", "Gang Sign 218", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign219"] = {"6wild@94glocky", "6wild_clip", "Gang Sign 219", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign220"] = {"nottiboppin@94glocky", "nottiboppin_clip", "Gang Sign 220", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsign221"] = {"pose10@94glocky", "pose10_clip", "Gang Sign 221", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign222"] = {"3ni@94glocky", "3ni_clip", "Gang Sign 222", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign223"] = {"3ni2@94glocky", "3ni2_clip", "Gang Sign 223", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign224"] = {"mbk@94glocky", "mbk_clip", "Gang Sign 224", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign225"] = {"3nik@94glocky", "3nik_clip", "Gang Sign 225", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign226"] = {"movink@94glocky", "movink_clip", "Gang Sign 226", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign227"] = {"doak@94glocky", "doak_clip", "Gang Sign 227", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign228"] = {"ygzkdoa@94glocky", "ygzkdoa_clip", "Gang Sign 228", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsign230"] = {"doa@94glocky", "doa_clip", "Gang Sign 230", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign231"] = {"gunpose8kf@94glocky", "gunpose8kf_clip", "Gang Sign 231", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign232"] = {"makkballa@94glocky@kenzoballa", "makkballakenzo_clip", "Gang Sign 232", AnimationOptions =
   {
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 64080,
        PropPlacement = {0.0330,0.0430,0.0400,-80.4744,-71.9308, 7.1861},
        EmoteLoop = true,
        EmoteMoving = false,
   }},
   ["gsign233"] = {"kflockpose@94glocky", "kflockpose_clip", "Gang Sign 233", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign234"] = {"gsc@94glocky", "gsc_clip", "Gang Sign 234", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign235"] = {"r30k@94glocky", "r30k_clip", "Gang Sign 235", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign236"] = {"gunpose9@94glocky", "gunpose9_clip", "Gang Sign 236", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign237"] = {"crips@pose1@94glocky", "crips194glocky_clip", "Gang Sign 237", AnimationOptions =
   {    
       Prop = 'prop_cs_ciggy_01',
       PropBone = 4169,
       PropPlacement = {0.0410, -0.0320, 0.0010, 0.0000, -99.0, -11.0},
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign238"] = {"nhck@94glocky", "nhck_clip", "Gang Sign 238", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign239"] = {"ygz@1@94glocky", "ygz1_clip", "Gang Sign 239", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign240"] = {"gdk@1@94glocky", "gdk1_clip", "Gang Sign 240", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign242"] = {"lbic@1@94glocky", "lbic1_clip", "Gang Sign 242", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign243"] = {"smm@1@94glocky", "smm1_clip", "Gang Sign 243", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   -- ["gsign244"] = {"slime@kr@94glocky", "slimekylerich_clip", "Gang Sign 244", AnimationOptions =
   -- {
   --  Prop = 'prop_paper_box_05',
   --  PropBone = 4169,
   --  PropPlacement = {0.0980,0.0290,-0.0240,-163.6197,-153.2180,40.0483},
   --  EmoteLoop = true,
   --  EmoteMoving = false,
   -- }},
   ["gsign245"] = {"pose@kr41@94glocky", "pose41kr_clip", "Gang Sign 245", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign246"] = {"pose@kayflock1@94glocky", "posekf1_clip", "Gang Sign 246", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign247"] = {"pose@drilly@94glocky", "posedrilly1_clip", "Gang Sign 247", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
      ["gsign248"] = {"smokecup@pose@94glocky", "smokecup1_clip", "Gang Sign 248", AnimationOptions =
      {
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64017,
        PropPlacement = {0.0450,0.0030,0.0000,61.9707,-67.7540,-1.0330},
        SecondProp = 'p_amb_coffeecup_01',
        SecondPropBone = 4185,
        SecondPropPlacement = {0.0220,-0.0600,0.0000,0.0000,0.0000,0.0000},
        EmoteLoop = true,
        EmoteMoving = false,  
    }},
   ["gsign249"] = {"slime@gunpose@94glocky", "slimegp1_clip", "Gang Sign 249", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign250"] = {"ok@2@94glocky", "ok2_clip", "Gang Sign 250", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign251"] = {"gdk@2@94glocky", "gdk2_clip", "Gang Sign 251", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign252"] = {"posesmoke@1@94glocky", "posesmoke1_clip", "Gang Sign 252", AnimationOptions =
   {    
       Prop = 'prop_cs_ciggy_01',
       PropBone = 64017,
       PropPlacement = {0.0370, -0.0090, 0.0000, 0.0000, 315.0, 0.0000},
       EmoteLoop = true,
       EmoteMoving = false,
       
   }},
   ["gsign253"] = {"smelly@1@94glocky", "smelly1_clip", "Gang Sign 253", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign254"] = {"smelly@2@94glocky", "smelly2_clip", "Gang Sign 254", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign255"] = {"mitchel@1@94glocky", "mitchel1_clip", "Gang Sign 255", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign256"] = {"gunpose@rifle@94glocky", "gunposerifle_clip", "Gang Sign 256", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign257"] = {"ygzk@1@94glocky", "1ygzk_clip", "Gang Sign 257", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
      ["gsign258"] = {"6blockcity@1@94glocky", "6bc1_clip", "Gang Sign 258", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign259"] = {"6blockcity@2@94glocky", "26bc_clip", "Gang Sign 259", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   --["gsign261"] = {"slime@94glocky@slime", "slimslim_clip", "Gang Sign 261", AnimationOptions = 
   --{
   --   Prop = 'v_res_investbook01',
   --    PropBone = 4090,
   --    PropPlacement = {0.0540,-0.0090,0.0000,-27.9559,-20.4167,41.3180},
   --    EmoteLoop = true,
   --    EmoteMoving = false,
   --}},
   ["gsign262"] = {"props@pose@1@94glocky", "pp194_clip", "Gang Sign 262 ~b~Cyan Flag", AnimationOptions =
   {
   Prop = 'vw_prop_casino_art_bottle_01a',
   PropBone = 58868,
   PropPlacement = {0.1400,0.2600,0.0400,0.0000,0.0000,0.0000},
   SecondProp = 'prop_cs_ciggy_01',
   SecondPropBone = 4090,
   SecondPropPlacement = {0.0350,-0.0120,0.0000,76.0858,101.2346,30.4004},
   EmoteLoop = true,
   EmoteMoving = false,
   }},
   ["gsign2621"] = {"props@pose@1@94glocky", "pp194_clip", "Gang Sign 262 ~b~Red Flag", AnimationOptions =
   {
   Prop = 'ex_office_swag_jewelwatch',
   PropBone = 58868,
   PropPlacement = {0.1400,0.2600,0.0400,0.0000,0.0000,0.0000},
   SecondProp = 'prop_cs_ciggy_01',
   SecondPropBone = 4090,
   SecondPropPlacement = {0.0350,-0.0120,0.0000,76.0858,101.2346,30.4004},
   EmoteLoop = true,
   EmoteMoving = false,
   }},
   ["gsign2622"] = {"props@pose@1@94glocky", "pp194_clip", "Gang Sign 262 ~b~Blue Flag", AnimationOptions =
   {
   Prop = 'ng_proc_sodacup_03c',
   PropBone = 58868,
   PropPlacement = {0.1400,0.2600,0.0400,0.0000,0.0000,0.0000},
   SecondProp = 'prop_cs_ciggy_01',
   SecondPropBone = 4090,
   SecondPropPlacement = {0.0350,-0.0120,0.0000,76.0858,101.2346,30.4004},
   EmoteLoop = true,
   EmoteMoving = false,
   }},
   ---["gsign263"] = {"pose@smokecup@94glocky", "posesmokecup_clip", "Gang Sign 263", AnimationOptions =
   ---{    
   --- Prop = 'prop_energy_drink',
   --- PropBone = 4186,
   --- PropPlacement = {0.0210,-0.0510,0.0790,0.0000,0.0000,0.0000},
   --- SecondProp = 'prop_cs_ciggy_01',
   --- SecondPropBone = 64017,
   --- SecondPropPlacement = {0.0360,-0.0120,0.0090,32.7324,-57.2675,24.4044},
   --- EmoteLoop = true,
   --- EmoteMoving = false,
   ---}},
   ["gsign264"] = {"props@blunt@1@94glocky", "pb194_clip", "Gang Sign 264", AnimationOptions =
   {    
       Prop = 'prop_cs_ciggy_01',
       PropBone = 64017,
       PropPlacement = {0.0310,-0.0100,0.0200,0.0000,-100.0000, 0.0000},
       SecondProp = 'p_cs_lighter_01',
       SecondPropBone = 4186,
       SecondPropPlacement = {0.0300,-0.0170,0.0190,168.3079,164.6601, 48.9735391 },
       EmoteLoop = true,
       EmoteMoving = true,
   }},
   ["gsign2641"] = {"props@blunt@1@94glocky", "pb194_clip", "Gang Sign 264", AnimationOptions =
   {    
       Prop = 'prop_cs_ciggy_01',
       PropBone = 64017,
       PropPlacement = {0.0310,-0.0100,0.0200,0.0000,-100.0000, 0.0000},
       SecondProp = 'p_cs_lighter_01',
       SecondPropBone = 4186,
       SecondPropPlacement = {0.0300,-0.0170,0.0190,168.3079,164.6601, 48.9735391 },
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign265"] = {"pose@hands@94glocky", "posehands1_clip", "Gang Sign 265", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign266"] = {"oyk@tata@94glocky", "tataoyk_clip", "Gang Sign 266", AnimationOptions =
   {    
    Prop = 'bkr_prop_money_unsorted_01',
    PropBone = 58867,
    PropPlacement = {-0.0010,0.0570,-0.0010,-1.3643,-51.0451, -14.0412},
    SecondProp = 'bkr_prop_money_wrapped_01',
    SecondPropBone = 58867,
    SecondPropPlacement = {0.0260,0.0600,-0.0410,-0.7251,-51.0595,-14.8071},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign267"] = {"ygz@4sev@94glocky", "4sevygz_clip", "Gang Sign 267", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign268"] = {"gunpose@blunt@94glocky", "gunposeblunt_clip", "Gang Sign 268", AnimationOptions =
   {  
        Prop = 'prop_cs_ciggy_01',
        PropBone = 4090,
        PropPlacement = {0.0340, -0.0040, -0.0210, 180.0000, 90.0000, 40.0000},
        EmoteLoop = true,
        EmoteMoving = false,
   }},
    ["gsign269"] = {"th@94glocky", "th_94glocky_clip", "Gang Sign 269", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign270"] = {"mbk@2@94glocky", "mbk2_clip", "Gang Sign 270", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign271"] = {"slatteryboyz@1@94glocky", "sb1_clip", "Gang Sign 271", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign272"] = {"m8v3nok@94glocky", "m8v3ok_clip", "Gang Sign 272", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign273"] = {"slime@kf@94glocky", "slimekf_clip", "Gang Sign 273", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign274"] = {"twoshotz@94glocky", "twoshotz_clip", "Gang Sign 274", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign275"] = {"twoshotz@2@94glocky", "twoshotz2_clip", "Gang Sign 275", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign276"] = {"doak@2@94glocky", "doak2_clip", "Gang Sign 276", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign277"] = {"oyk@2@94glocky", "oyk2_clip", "Gang Sign 277", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign278"] = {"smm@mbf@94glocky", "smm_mbf_clip", "Gang Sign 278", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign279"] = {"gsb@1@94glocky", "gsb1_clip", "Gang Sign 279", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign280"] = {"slime@kf2@from94", "slimekf2_clip", "Gang Sign 280", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign281"] = {"smmmbfk@from94", "smmmbfk_clip", "Gang Sign 281", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign282"] = {"slime@oyk@from94", "slimeoyk_clip", "Gang Sign 282", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
    ["gsign283"] = {"gunpose@from94", "gunposefrom94_clip", "Gang Sign 283", AnimationOptions =
    {    
        Prop = 'prop_amb_phone',
        PropBone = 26611,
        PropPlacement = {0.0510, -0.0330, 0.0000, 0.0000, 0.0000, 0.0000},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign284"] = {"o@from94", "ofrom94_clip", "Gang Sign 284", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["gsign285"] = {"gunpose4@94glocky", "gunpose4_clip", "Gang Sign 285", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["gsign407"] = {"gunpose5@94glocky", "gunpose5_clip", "Gang Sign 286", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["gsign286"] = {"doa@makkballa@from94", "doamakkballa_clip", "Gang Sign 287", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["gsign291"] = {"bigdoa@from94", "bigdoa_clip", "Gang Sign 291", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["gsign293"] = {"oyk@from94", "oyk_clip", "Gang Sign 293", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["gsign296"] = {"ygz@from94", "ygzfrom94_clip", "Gang Sign 296", AnimationOptions =
    {
       EmoteLoop = true,
       EmoteMoving = false,
    }},
    ["gsign299"] = {"gunpose@slime@from94", "gunposeslime_clip", "Gang Sign 299", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign300"] = {"gunpose@4@from94", "gunpose4_clip", "Gang Sign 300", AnimationOptions =
   {
    Prop = 'prop_amb_phone',
    PropBone = 26611,
    PropPlacement = {0.0500, -0.0520, -0.0100, -20.0000, 0.0000, -30.0000},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign301"] = {"dthanggz@from94", "dthanggz_clip", "Gang Sign 301", AnimationOptions =
   {
    Prop = 'prop_amb_phone',
    PropBone = 26612,
    PropPlacement = {0.0520, -0.0360, -0.0060, -19.9999, 0.0000, -11.9999},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign302"] = {"chook2@from94", "chook2_clip", "Gang Sign 302", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign303"] = {"movin@from94", "movinfrom94_clip", "Gang Sign 303", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign305"] = {"4sevkygzk@from94", "4sevkygzk_clip", "Gang Sign 304", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign306"] = {"smelly@3@from94", "smelly3_clip", "Gang Sign 305", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign307"] = {"nhc@from94", "nhcfrom94_clip", "Gang Sign 306", AnimationOptions =
   {
       EmoteLoop = true,
       EmoteMoving = false,
   }},
   ["gsign308"] = {"gunclip@from94", "gunclip94_clip", "Gang Sign 307", AnimationOptions =
   {    
    Prop = 'w_pi_appistol',
    PropBone = 64097,
    PropPlacement = {0.0100, 0.0280, -0.0200, 3.6164416, 10.6275841, -19.6834981},
    SecondProp = 'w_pi_appistol_mag2',
    SecondPropBone = 64096,
    SecondPropPlacement = {-0.0300, 0.0400, -0.0020, 4.9728141, -7.2560318, 15.5126862 },
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign309"] = {"pillspose@from94", "pillspose_clip", "Gang Sign 308 ~b~Pills Pose Props ", AnimationOptions =
   {    
     Prop = 'ba_prop_club_water_bottle',
     PropBone = 4170,
     PropPlacement = {0.0176, -0.0400, -0.0080, -180.0000, -180.0000, 10.0000},
     EmoteLoop = true,
     EmoteMoving = false,
    }},
   -- ["gsign310"] = {"backpack@from94", "backpack_clip", "Gang Sign 309 ~b~BackPack Pose Props ", AnimationOptions =
   -- {    
   -- Prop = 'vw_prop_vw_backpack_01a',
   -- PropBone = 58868,
   --  PropPlacement = {0.4900,0.2100,-0.1700,18.8817,-71.1182, 6.7177},
   --  SecondProp = 'prop_coffee_cup_trailer',
   --  SecondPropBone = 26612,
   -- SecondPropPlacement = {0.2030,-0.0500,-0.1000,-1.1160,-61.5482,22.2421},
   --  EmoteLoop = true,
   --  EmoteMoving = false,
   -- }},
   -- ["gsign311"] = {"cuppose@from94", "cuppose_clip", "Gang Sign 310 ~b~Cup Pose Props ", AnimationOptions =
   -- {    
    -- Prop = 'p_watch_06',
   --  PropBone = 64097,
   --  PropPlacement = {0.0390, 0.0550, 0.0250, 6.4836, -1.1054, 25.8912},
   --  EmoteLoop = true,
    -- EmoteMoving = false,
   -- }},
   -- ["gsign312"] = {"settybpose@from94", "settybpose_clip", "Gang Sign 311 ~b~Smoke Bottle Props ", AnimationOptions =
   -- { 
   -- Prop = 'prop_cs_ciggy_01',
   -- PropBone = 64064,
   -- PropPlacement = {0.0051,-0.0380,0.0481,0.0000,0.0000, 0.0000},
   -- SecondProp = 'prop_energy_drink',
   -- SecondPropBone = 58867,
   -- SecondPropPlacement = {-0.0080,0.0570,-0.0210,17.4952,28.4812,9.8465},
   -- EmoteLoop = true,
   -- EmoteMoving = false,
  -- }},
  ["gsign313"] = {"doa@k@from94", "doakk_clip", "Gang Sign 312", AnimationOptions =
  { 
  EmoteLoop = true,
  EmoteMoving = false,
  }},
  ["gsign314"] = {"gunpose@5@from94", "gunpose5_clip", "Gang Sign 313", AnimationOptions =
  {    
    Prop = 'w_pi_appistol',
    PropBone = 64096,
    PropPlacement = {0.0321, 0.0100, 0.0030, -4.6293, -11.0096, -24.5947},
    EmoteLoop = true,
    EmoteMoving = false,
   }},
   ["gsign315"] = {"ygz@smoke@from94", "ygzsmoke_clip", "Gang Sign 314", AnimationOptions =
   {    
    Prop = 'prop_cs_ciggy_01',
    PropBone = 4170,
    PropPlacement = {0.0270, -0.0050, 0.0210, -45.6102, -111.1178, 23.2374},
    EmoteLoop = true,
    EmoteMoving = false,
    }},
    --["gsign316"] = {"dthanggz@2@from94", "dthanggz2_clip", "Gang Sign 315", AnimationOptions =
    --{    
    --Prop = 'ba_prop_battle_whiskey_bottle_2_s',
    --PropBone = 64081,
    --PropPlacement = {-0.0520, 0.0380,-0.0200, -8.8909, -8.8909, 1.4022},
    --SecondProp = 'prop_cs_ciggy_01',
    --SecondPropBone = 4090,
    --SecondPropPlacement = {0.0450,-0.0310,0.0190,136.7808,-133.2191,62.0091},
    --EmoteLoop = true,
    --EmoteMoving = false,
    --}},
    ["gsign317"] = {"bhb@from94", "bhb_clip", "Gang Sign 316", AnimationOptions =
    {    
    EmoteLoop = true,
    EmoteMoving = false,
    }},
    ["gsign323"] = {"dababy@from94", "dababy_clip", "Gang Sign 322", AnimationOptions =
    {    

        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign324"] = {"smokefuck@from94", "smokefuck_clip", "Gang Sign 323", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64017,
        PropPlacement = {0.0330,-0.0100,0.0080, -9.4921, -72.3347, 34.9029},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign325"] = {"syrupcup@from94", "syrupcup_clip", "Gang Sign 324", AnimationOptions =
    {    
        Prop = 'prop_cs_whiskey_bot_stop',
        PropBone = 64016,
        PropPlacement = {0.0240, -0.1270,-0.0460, -3.0970, -10.2106, -11.6415},
        SecondProp = 'p_amb_coffeecup_01',
        SecondPropBone = 26611,
        SecondPropPlacement = {0.0240,-0.0620,-0.0070,-19.7197,9.4080,-3.4048},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign326"] = {"hound@from94", "hound_clip", "Gang Sign 325", AnimationOptions =
    {    
        Prop = 'prop_amb_phone',
        PropBone = 4169,
        PropPlacement = {0.0240,-0.0220,-0.0020, -26.9999, 0.0000, 0.0000},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign327"] = {"5tothesevk@from94", "5tothesevk_clip", "Gang Sign 326", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    -- ["gsign328"] = {"graaa@from94", "graaa_clip", "Gang Sign 327", AnimationOptions =
    -- {    
    --    Prop = 'prop_energy_drink',
    --    PropBone = 26613,
    --    PropPlacement = {0.0270, -0.0490,0.0000, -31.6844, -20.8117, -26.0134},
    --    SecondProp = 'prop_cs_ciggy_01',
    --    SecondPropBone = 4186,
    --    SecondPropPlacement = {0.0130,-0.0090,0.0150,0.0000,0.0000,-79.9999},
    --    EmoteLoop = true,
    --    EmoteMoving = false,
    --}},
    ["gsign329"] = {"notti@from94", "notti_clip", "Gang Sign 328", AnimationOptions =
    {    
        Prop = 'prop_cs_cashenvelope',
        PropBone = 26612,
        PropPlacement = {0.0180, -0.0630,0.0020, 21.0587, -79.8030, 26.2084},
        SecondProp = 'prop_cs_cashenvelope',
        SecondPropBone = 26612,
        SecondPropPlacement = {-0.0300,-0.1100,0.0100,9.9731,-76.8506,26.6466},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign330"] = {"smm2@from94", "smm2_clip", "Gang Sign 329", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign331"] = {"ygzgunpose@from94", "ygzgunpose@clip", "Gang Sign 330", AnimationOptions =
    {    
        Prop = 'w_pi_appistol',
        PropBone = 4169,
        PropPlacement = {0.0270, -0.0640,0.0140, -7.6768, 2.9894, -6.4092},
        SecondProp = 'w_pi_combatpistol',
        SecondPropBone = 4169,
        SecondPropPlacement = {-0.0130,-0.0270,0.0140,-7.9468,0.9917,-3.1387},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    -- ["gsign332"] = {"fooddrink@from94", "fooddrink_clip", "Gang Sign 331", AnimationOptions =
    -- { 
    -- Prop = 'v_res_harddrive',
    -- PropBone = 26612,
    -- PropPlacement = {0.0390,-0.0620,-0.0730, -159.4290, 163.3733, 68.6586},
    -- SecondProp = 'v_res_pestle',
    -- SecondPropBone = 58867,
    -- SecondPropPlacement = {0.1300,0.0500,-0.0200,-119.3149,-171.4364,-11.2093},
    -- EmoteLoop = true,
    -- EmoteMoving = false,
    -- }},
    ["gsign333"] = {"ygzk@3@from94", "ygzk3_clip", "Gang Sign 329", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign334"] = {"makkballa@from94", "makkballa_clip", "Gang Sign 330", AnimationOptions =
    {    
        Prop = 'prop_amb_phone',
        PropBone = 4169,
        PropPlacement = {0.0310,-0.0070,0.0260, -29.9999, 0.0000, 10.0000},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign335"] = {"trendy@from94", "trendy_clip", "Gang Sign 331", AnimationOptions =
    { 
        Prop = 'prop_cs_ciggy_01',
        PropBone = 4170,
        PropPlacement = {0.0330,-0.0130,0.0150, -28.6668, -93.8271, 13.5870},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    -- ["gsign336"] = {"hound2@from94", "hound2_clip", "Gang Sign 332", AnimationOptions =
    -- {    
     --    Prop = 'v_res_harddrive',
     --    PropBone = 26611,
     --    PropPlacement = {0.0420,-0.0920,-0.1200, -118.0253, 112.2639, 68.3662},
     --    EmoteLoop = true,
     --    EmoteMoving = false,
    -- }},
    ["gsign337"] = {"houndk@from94", "houndk_clip", "Gang Sign 333", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign338"] = {"houndk2@from94", "houndk2_clip", "Gang Sign 334", AnimationOptions =
    {    
        Prop = 'prop_amb_phone',
        PropBone = 4169,
        PropPlacement = {0.0310,-0.0070,0.0260, -29.9999, 0.0000, 10.0000},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    -- ["gsign339"] = {"custompose@from94", "custompose_clip", "Gang Sign 335", AnimationOptions =
    -- {    
     --    Prop = 'prop_energy_drink',
     --    PropBone = 4138,
     --    PropPlacement = {0.0200,-0.0480,0.0110, -3.0000, 0.0000, 0.0000},
     --    EmoteLoop = true,
     --    EmoteMoving = false,
    -- }},
    ["gsign340"] = {"bandomoney@from94", "bandomoney_clip", "Gang Sign 336", AnimationOptions =
    {    
        Prop = 'prop_anim_cash_note_b',
        PropBone = 18905,
        PropPlacement = {0.1320,0.0590,0.0310, -21.4501, -64.0298, -27.4011},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign341"] = {"dthangmoney@from94", "dthangmoney_clip", "Gang Sign 337", AnimationOptions =
    { 
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 4186,
        PropPlacement = {0.0310,-0.0470,-0.0020, -69.5285, -85.1123, 15.6198},
        SecondProp = 'bkr_prop_money_unsorted_01',
        SecondPropBone = 64113,
        SecondPropPlacement = {0.0220,0.0520,-0.0010,107.9773,80.5700,6.4065},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign342"] = {"showgun@from94", "showgun_clip", "Gang Sign 338", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign343"] = {"duopose7@nicocsanim", "duopose7_clip", "Gang Sign 339", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign344"] = {"duopose8@nicocsanim", "duopose8_clip", "Gang Sign 340", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign345"] = {"duopose9@nicocsanim", "duopose9_clip", "Gang Sign 341", AnimationOptions = 
    {    
        Prop = 'prop_amb_phone',
        PropBone = 58867,
        PropPlacement = {0.0400,0.0290,0.0000, 176.7299304, -163.8222109, -10.301716 },
        SecondProp = 'prop_cs_ciggy_01',
        SecondPropBone = 4186,
        SecondPropPlacement = {0.0000,-0.0100,0.0150,15.9899995,0.0000,-70.9999961},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign346"] = {"duopose10@nicocsanim", "duopose10_clip", "Gang Sign 342", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign347"] = {"duopose11@nicocsanim", "duopose11_clip", "Gang Sign 343", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign348"] = {"duopose12@nicocsanim", "duopose12_clip", "Gang Sign 344", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64016,
        PropPlacement = {0.0960,-0.0750,0.0000, -6.9325499, 83.0674501, 21.2145097  },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign349"] = {"showdat@bhary", "showdat_clip", "Gang Sign 345", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 4090,
        PropPlacement = {0.0390,0.0190,-0.0220, -7.3327677, -158.4091822, 13.2704441 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign350"] = {"facepalm@bhary", "facepalm_clip", "Gang Sign 346", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 4089,
        PropPlacement = {0.0690,-0.0180,-0.0050, 100.1510818, -178.2462165, -9.8465523 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign351"] = {"couch@bhary", "couch_clip", "Gang Sign 347", AnimationOptions =
    {    
        Prop = 'prop_amb_phone',
        PropBone = 64096,
        PropPlacement = {-0.0020,0.0270,-0.0050, -177.7501419, -158.6730351, 22.1605531 },
        SecondProp = 'w_pi_sns_pistol',
        SecondPropBone = 4169,
        SecondPropPlacement = {0.0390, -0.0340, 0.0010, -21.9353525, -7.4185966, 1.9968561 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    --["gsign352"] = {"drankface@bhary", "drankface_clip", "Gang Sign 348", AnimationOptions =
    --{    
     --   Prop = 'v_res_harddrive',
     --   PropBone = 4090,
     --   PropPlacement = {-0.0100, 0.0270, 0.2100, 37.4313292, -150.361315, -54.6694121},
     --   SecondProp = 'prop_cs_ciggy_01',
     --   SecondPropBone = 4090,
     --   SecondPropPlacement = {0.0200, 0.0000, -0.0200, 30.0000001, 180.0000, -40.0000019 },
     --   EmoteLoop = true,
     --   EmoteMoving = false,
    --}},
    -- ["gsign353"] = {"rollin@from94", "rollin_clip", "Gang Sign 349", AnimationOptions =
    --{    
    --    Prop = 'vw_prop_vw_backpack_01a',
     --   PropBone = 4090,
    --    PropPlacement = {0.5270, -0.1050, 0.0130, -17.0459, -106.5831, -62.8211},
     --   EmoteLoop = true,
     --   EmoteMoving = false,
    --}},
    -- ["gsign354"] = {"dthanggz@3@from94", "dthanggz3_clip", "Gang Sign 350 ~b~YGz Dthang ~r~New", AnimationOptions =
    -- {    
     --    Prop = 'v_res_harddrive',
     --    PropBone = 26611,
     --    PropPlacement = {0.0170, -0.0810, -0.0550, -32.1847, 30.2632, 45.3858056 },
      --   EmoteLoop = true,
     --    EmoteMoving = false,
    -- }},
    ["gsign355"] = {"dthanggz@4@from94", "dthanggz4_clip", "Gang Sign 350", AnimationOptions =
    {    
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 64016,
        PropPlacement = {0.0700, -0.0530, 0.0470, 106.4081246, -86.9139257, 14.4164295},
        SecondProp = 'bkr_prop_money_unsorted_01',
        SecondPropBone = 64016,
        SecondPropPlacement = {0.0380, -0.0220, 0.0000, 67.3136993, 87.4270622, -14.0831107 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign356"] = {"dthanggz@5@from94", "dthanggz5_clip", "Gang Sign 350", AnimationOptions =
    {    
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 64016,
        PropPlacement = {0.0570, -0.0590, 0.0410, 106.4081246, -86.9139257, 14.4164295},
        SecondProp = 'bkr_prop_money_unsorted_01',
        SecondPropBone = 64016,
        SecondPropPlacement = {0.0250, -0.0200, 0.0130, 67.3136993, 87.4270622, -14.0831107 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign357"] = {"nasgpgfuck@from94", "nasgpg_clip", "Gang Sign 351", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64017,
        PropPlacement = {0.0400, -0.0500, 0.0400, 17.4952407, 118.4812386, 9.8465523 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign358"] = {"smokestance@from94", "smokestance_clip", "Gang Sign 352", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64017,
        PropPlacement = {0.0380, 0.0280, 0.0310, 4.110867, -147.9458892, 56.0750666},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign359"] = {"dthanggz6@from94", "dthanggz6_clip", "Gang Sign 353", AnimationOptions =
    {    
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 4090,
        PropPlacement = {0.0000, -0.0380, -0.0170, -104.385204, -96.3561214,-45.7930341}, 
        SecondProp = 'bkr_prop_money_unsorted_01',
        SecondPropBone = 4090,
        SecondPropPlacement = {0.0000, -0.0900, -0.0400, -109.6567906, -108.0964678, -39.960719},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign360"] = {"ot9@from94", "ot9_clip", "Gang Sign 354", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 4090,
        PropPlacement = {0.0280, 0.0040, -0.0170, 105.3398139, 78.3079235, 48.9735391 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign361"] = {"grinder@from94", "grinder_clip", "Gang Sign 355", AnimationOptions =
    {    
        Prop = 'ex_office_swag_booze_cigs2',
        PropBone = 64064,
        PropPlacement = {-0.0300, 0.0360, 0.0160, -95.9616729, -58.4004469,-5.6920067 }, 
        SecondProp = 'ex_office_swag_booze_cigs',
        SecondPropBone = 4090,
        SecondPropPlacement = {0.0290, -0.0070, -0.0260, -105.3398139, -11.6920765, -48.9735391 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign362"] = {"sitwith2gun@from94", "sitwith2gun_clip", "Gang Sign 356", AnimationOptions =
    {    
        Prop = 'w_pi_pistol',
        PropBone = 26611,
        PropPlacement = {0.0700,-0.0200, 0.0100, -0.7168147, 0.0000,3.0000}, 
        SecondProp = 'w_pi_pistol',
        SecondPropBone = 58869,
        SecondPropPlacement = {0.0800, 0.0160, 0.0700, -0.9226431, -4.1048612, -12.9677798},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign363"] = {"ck@from94", "ck_clip", "Gang Sign 357", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign364"] = {"balla@from94", "balla_clip", "Gang Sign 358", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    -- ["gsign365"] = {"fanta@from94", "fanta_clip", "Gang Sign 359", AnimationOptions =
   --  {    
    --     Prop = 'ex_office_swag_furcoats2',
    --     PropBone = 4170,
    --     PropPlacement = {0.0220,-0.0580, 0.0280, -10.2777536,10.5251825,61.506782 }, 
    --     SecondProp = 'prop_cs_ciggy_01',
     --    SecondPropBone = 4170,
     --    SecondPropPlacement = {0.0200, -0.0080, -0.0090, 0.0000, 0.0000, -59.0000},
     --    EmoteLoop = true,
     --    EmoteMoving = false,
    -- }},
    ["gsign367"] = {"chilliman@animation", "chilliman_clip", "Regular Stances 360", AnimationOptions =
    {    
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 64065,
        PropPlacement = {0.0320, 0.0660, 0.0000, -79.9999997, -90.0000, 0.0000 }, 
        SecondProp = 'bkr_prop_money_unsorted_01',
        SecondPropBone = 64113,
        SecondPropPlacement = {0.0400, 0.0200, 0.0000, -90.0000, -92.9999999, -20.0000007},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign368"] = {"downassnigga@animation", "downassnigga_clip", "Regular Stances 361", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    -- ["gsign369"] = {"drizzlin@animation", "drizzlin_clip", "Regular Stances 362 ~b~ Cherry Syrup ~r~New", AnimationOptions =
    -- {    
     --    Prop = 'p_watch_04',
      --   PropBone = 64080,
     --    PropPlacement = {0.0830, 0.1680, 0.0640, 65.9959021, -86.1338459, -6.0967766 }, 
    --     SecondProp = 'prop_amb_phone',
      --   SecondPropBone = 26611,
     --    SecondPropPlacement = {0.0400, -0.0350, -0.0200, -14.6175514, -5.1172459, -17.8057133},
     --    EmoteLoop = true,
     --    EmoteMoving = false,
    --}},
    ["gsign370"] = {"imbusysippin@animation", "imbusysippin_clip", "Regular Stances 363", AnimationOptions =
    {    
        Prop = 'p_watch_06',
        PropBone = 58867,
        PropPlacement = {0.0450, 0.0750, 0.0000, 21.9458874, -15.984012, 3.87516 }, 
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign371"] = {"lookatmygun@animation", "lookatmygun_clip", "Regular Stances 364", AnimationOptions =
    {    
        Prop = 'w_pi_sns_pistol',
        PropBone = 64065,
        PropPlacement = {0.0900, 0.0300, 0.0400, 0.0000, -49.9999987, 0.0000 }, 
        SecondProp = 'w_pi_sns_pistol_mag2',
        SecondPropBone = 64065,
        SecondPropPlacement = {0.0200, 0.0300, 0.0200, 179.4187473, 150.9580431, -3.1083054 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign372"] = {"lookatmygunspt2@animation", "lookatmygunspt2_clip", "Regular Stances 365", AnimationOptions =
    {    
        Prop = 'w_pi_ceramic_pistol',
        PropBone = 26611,
        PropPlacement = {0.0700, -0.0500, 0.0000, -4.7730419, 5.0448853, 8.6173279 }, 
        SecondProp = 'w_pi_vintage_pistol',
        SecondPropBone = 58867,
        SecondPropPlacement = {0.0700, 0.0200, 0.0000, 21.3567215, 9.4518568, -6.460671},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign376"] = {"onlyaboutchilli@animation", "onlyaboutchilli_clip", "Regular Stances 366", AnimationOptions =
    {    
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 4185,
        PropPlacement = {0.0250, -0.0420, 0.0140, -5.7251053, 78.4916069, -29.4987035}, 
        EmoteLoop = true,
        EmoteMoving = false,
    }},
   -- ["gsign377"] = {"wockboy@animation", "wockboy_clip", "Regular Stances 367", AnimationOptions =
    -- {    
    --    Prop = 'p_watch_06',
    --    PropBone = 64064,
    --    PropPlacement = {0.0300, 0.0600, 0.0000, -3.0000, 0.0000, 0.0000 }, 
     --   SecondProp = 'p_watch_04',
     --   SecondPropBone = 4090,
     --   SecondPropPlacement = {0.0400, -0.0200, 0.1600, -1.0000, -180.0000, -30.0000},
     --   EmoteLoop = true,
     --   EmoteMoving = false,
    --}},
    ["gsign380"] = {"spazzpose3@animation", "spazz_clip", "Regular Stances 368", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64097,
        PropPlacement = {0.0070, 0.0220, 0.0020, 48.2367014, -103.1678276, -15.1889236 }, 
        SecondProp = 'prop_plastic_cup_02',
        SecondPropBone = 4138,
        SecondPropPlacement = {0.0190, -0.0460, 0.0690, 0.0000, 0.0000, 0.0000  },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    -- ["gsign381"] = {"spazzpose4@animation", "spazz_clip", "Regular Stances 369", AnimationOptions =
    -- {    
     --    Prop = 'p_watch_06',
     --    PropBone = 26613,
     --    PropPlacement = {0.0440, -0.0470, 0.0790, -25.5970058,18.2528474, 56.9076561}, 
      --   SecondProp = 'vw_prop_vw_backpack_01a',
     --    SecondPropBone = 64065,
      --   SecondPropPlacement = {-0.5020, 0.1920, 0.1300, 160.2802535, -80.5919563, -3.4048673  },
      --   EmoteLoop = true,
      --   EmoteMoving = false,
   -- }},
    ["gsign382"] = {"qpacc@regularstance93", "regularstance93_clip", "Regular Stances 370", AnimationOptions =
    {    
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 4090,
        PropPlacement = {-0.0040, -0.0380, 0.0380, -6.2056164, -96.2056164, 14.8687239 }, 
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign383"] = {"qpacc@regularstance94", "regularstance94_clip", "Regular Stances 371", AnimationOptions =
    {    
        Prop = 'w_ar_carbinerifle',
        PropBone = 58867,
        PropPlacement = {-0.0580, 0.1580, -0.2370, -19.295343, -70.704657, -30.4319789}, 
        SecondProp = 'prop_cs_ciggy_01',
        SecondPropBone = 4090,
        SecondPropPlacement = {0.0710, -0.0370, -0.0310, 3.4511785, -110.2835598, 9.3912858 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign384"] = {"qpacc@regularstance95", "regularstance95_clip", "Regular Stances 372", AnimationOptions =
    {    
        Prop = 'p_amb_coffeecup_01',
        PropBone = 64017,
        PropPlacement = {-0.0020, -0.0470, -0.0650, 3.9611968, 7.9807643, 0.556249 }, 
        SecondProp = 'w_ar_carbinerifle',
        SecondPropBone = 26614,
        SecondPropPlacement = {0.0300, -0.0180, 0.1680, -9.723207, -39.7754439, -2.2968618 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign385"] = {"qpacc@regularstance96", "regularstance96_clip", "Regular Stances 373", AnimationOptions =
    {    
        Prop = 'p_amb_coffeecup_01',
        PropBone = 64016,
        PropPlacement = {0.0010, -0.0060, -0.0960, 24.3248861,36.3937686,-57.0011521}, 
        SecondProp = 'w_ar_carbinerifle',
        SecondPropBone = 4186,
        SecondPropPlacement = {-0.0100, -0.0300, 0.0600, -10.0000001, 0.0000, 11.9999997},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign386"] = {"obk@from94", "obk_clip", "Gang Sign 374", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign387"] = {"ballak@from94", "ballak_clip", "Gang Sign 376", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign388"] = {"customoyogz@from94", "oyogzcustom_clip", "Gang Sign 377", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign389"] = {"jayhound@from94", "jayhound_clip", "Gang Sign 378", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign390"] = {"jaydohitz@from94", "jaydohitz_clip", "Gang Sign 379", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    -- ["gsign391"] = {"ygzcupsmoke@from94", "ygzcupsmoke_clip", "Gang Sign 380", AnimationOptions =
    -- {    
    --    Prop = 'prop_cs_ciggy_01',
     --   PropBone = 64065,
      --   PropPlacement = {-0.0200, -0.0300, 0.0500, 0.0000 , 0.0000, 0.0000}, 
     --   SecondProp = 'v_res_harddrive',
     --   SecondPropBone = 64016,
      --  SecondPropPlacement = {0.0470, -0.0570, -0.0770, -8.3550282, 8.2786576, 15.9986359},
      --  EmoteLoop = true,
     --   EmoteMoving = false,
    --}},
    ["gsign391"] = {"sdotgopose@from94", "sdot_clip", "Gang Sign 380", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign392"] = {"mbmb@from94", "mbmb_clip", "Gang Sign 381", AnimationOptions =
    {    
        Prop = 'p_watch_06',
        PropBone = 26611,
        PropPlacement = {0.0320, -0.0560, 0.0700, 0.0000 , -10.0000003, 0.0000}, 
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign393"] = {"gelo@slausongirl", "slausongirl_clip", "Gang Sign 382", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign394"] = {"gelo@redd", "redd_clip", "Gang Sign 383", AnimationOptions =
    {   
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign395"] = {"gelo@rackedupshawty", "rackedup_clip", "Gang Sign 384", AnimationOptions =
    { 
    Prop = 'bkr_prop_money_unsorted_01',
    PropBone = 58870,
    PropPlacement = {0.0200, 0.0500, 0.0800, 0.00000, -85.0000, 0.0000}, 
    EmoteLoop = true,
    EmoteMoving = false,
    }},
    ["gsign397"] = {"gelo@nocameras", "nocameras_clip", "Gang Sign 385", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign399"] = {"snot_grimey@animation", "snot_grimey_clip", "Gang Sign 386", AnimationOptions =
    {   
        Prop = 'prop_plastic_cup_02',
        PropBone = 26611,
        PropPlacement = {0.0300,-0.0700,-0.0200,-74.6900248,-11.6695648,48.9775869}, 
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign401"] = {"standing_smoking2@animation", "standing_smoking2_clip", "Gang Sign 387", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 64017,
        PropPlacement = {0.0340, 0.0000, 0.0100, 90.0000, -59.9999996, 59.9999982 }, 
        SecondProp = 'prop_amb_phone',
        SecondPropBone = 26614,
        SecondPropPlacement = {0.0570, -0.0490, 0.0300, 0.0000, 0.0000, -40.0000019},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign403"] = {"snot_wawg@animation", "snot_wawg_clip", "Gang Sign 388", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign415"] = {"rundown@from94", "rundown_clip", "Gang Sign 389", AnimationOptions =
    {    
        Prop = 'w_ar_assaultrifle',
        PropBone = 64096,
        PropPlacement = {0.0100, 0.0300, 0.0000, 1.7537835, 10.1510818, -9.8465523}, 
        SecondProp = 'prop_cs_ciggy_01',
        SecondPropBone = 4090,
        SecondPropPlacement = {0.0400, -0.0100, 0.0000, -11.8371427, 160.9765143, -37.4361423},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign416"] = {"fuckcupsmoke@from94", "fuckcupsmoke_clip", "Gang Sign 390", AnimationOptions =
    {    
        Prop = 'p_amb_coffeecup_01',
        PropBone = 26613,
        PropPlacement = {0.0890, -0.1510, -0.0210,-47.4053252,-77.2705853, -14.2237612}, 
        SecondProp = 'prop_cs_ciggy_01',
        SecondPropBone = 4170,
        SecondPropPlacement = {0.0100, -0.0040, -0.0100, -71.0000004, 0.0000,-79.9999923},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign417"] = {"femalepose@from94", "femalepose_clip", "Gang Sign 391", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign419"] = {"pologpose@from94", "pologpose_clip", "Gang Sign 392", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign420"] = {"posesit@from94", "posesit_clip", "Gang Sign 393", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},    
    ["gsign421"] = {"spotemmoneypose@from94", "spotemmoneypose_clip", "Gang Sign 394", AnimationOptions =
    {    
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 4138,
        PropPlacement = {0.0520, -0.0690, 0.0100, 110.2835598, -86.5488215, -9.3912858}, 
        SecondProp = 'bkr_prop_money_unsorted_01',
        SecondPropBone = 4138,
        SecondPropPlacement = {0.0430, -0.0440, 0.0210, -69.3531027, -84.7638107, -14.0760953},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign422"] = {"fucksmokecup@from94", "fsc_clip", "Gang Sign 395", AnimationOptions =
    {    
        Prop = 'prop_cs_ciggy_01',
        PropBone = 4169,
        PropPlacement = {0.0400, -0.0100, -0.0100, -18.747238, -7.0959699, -68.8271678}, 
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign423"] = {"femalepose2@from94", "femalepose2_clip", "Gang Sign 396", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},  
    ["gsign434"] = {"poohpose@dd", "poohpose_clip", "Gang Sign 397", AnimationOptions =
    {    
        Prop = 'bkr_prop_cutter_moneypage',
        PropBone = 58869,
        PropPlacement = {0.1380, 0.0550, 0.0130, 12.8959689, -15.9443881, 8.8034293}, 
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign438"] = {"onehands@from94", "onehands_clip", "Gang Sign 398", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["gsign439"] = {"justslime@from94", "justslime_clip", "Gang Sign 399", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign440"] = {"slimegdk@from94", "slimegdk_clip", "Gang Sign 400", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign441"] = {"nbafuck@from94", "nbafuck_clip", "Gang Sign 401", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    -- ["gsign442"] = {"cupandbottle@from94", "cupandbottle_clip", "Gang Sign 402", AnimationOptions =
    --{    
     --   Prop = 'v_res_harddrive',
     --   PropBone = 4090,
     --   PropPlacement = {0.0300, -0.0700, -0.2500, -168.8430382, 166.4708958, 48.0412793},
     --   SecondProp = 'p_watch_06',
     --   SecondPropBone = 4090,
     --   SecondPropPlacement = {0.0400, -0.0230, 0.0950, -8.9958125, 27.0857648, 6.6471686 },
      --  EmoteLoop = true,
      --  EmoteMoving = false,
    --}}, 
    ["gsign444"] = {"moneyspread@from94", "moneyspread_clip", "Gang Sign 403", AnimationOptions =
    {    
        Prop = 'v_res_ipoddock',
        PropBone = 4090,
        PropPlacement = {-0.1830, 0.0980, -0.2070, 54.8383608, -107.1371147, 8.85103 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign445"] = {"moneyspread2@from94", "moneyspread2_clip", "Gang Sign 404", AnimationOptions =
    {    
        Prop = 'v_res_ipoddock',
        PropBone = 26611,
        PropPlacement = {-0.0050, 0.1600, -0.1740, 41.4285761, -179.1342383, -29.3411091 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign446"] = {"scooterfuck@from94", "scooterfuck_clip", "Gang Sign 405", AnimationOptions =
    {    
        Prop = 'prop_tumbler_01b',
        PropBone = 64113,
        PropPlacement = {0.4540, -0.9820, 0.2000, -90.0000, 0.00000, 20.0000 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign447"] = {"drakopose@from94", "drakopose_clip", "Gang Sign 406", AnimationOptions =
    {    
        Prop = 'w_ar_assaultrifle_mag2',
        PropBone = 26611,
        PropPlacement = {-0.0280, -0.0380, -0.0060, -24.0000006, 0.0000, 0.0000},
        SecondProp = 'w_ar_assaultrifle',
        SecondPropBone = 26613,
        SecondPropPlacement = {-0.0250, -0.0730, -0.0900, 25.6621914, -45.7382796, 26.180082  },
        EmoteLoop = true,
        EmoteMoving = false,
    }}, 
    ["gsign448"] = {"pose94@from94", "pose94_clip", "Gang Sign 407", AnimationOptions =
    {    
        Prop = 'bkr_prop_money_unsorted_01',
        PropBone = 4186,
        PropPlacement = {0.0100, -0.0600, 0.0100, -61.1245223, -74.4640596, 13.3562105 },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign449"] = {"backmoney@from94", "backmoney_clip", "Gang Sign 408", AnimationOptions =
    {    
        Prop = 'prop_anim_cash_note_b',
        PropBone = 64017,
        PropPlacement = {0.0310, -0.0010, 0.0410, 59.6237443, 45.9202947, -4.1967536  },
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign450"] = {"oyoy@from94", "oyoy_clip", "Gang Sign 409", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign451"] = {"drinksmoke@from94", "drinksmoke_clip", "Gang Sign 410", AnimationOptions =
    {    
        Prop = 'p_watch_06',
        PropBone = 58870,
        PropPlacement = {0.0360, 0.0620, 0.0800, 8.9663098, -4.938748, -0.7812041},
        SecondProp = 'prop_cs_ciggy_01',
        SecondPropBone = 4170,
        SecondPropPlacement = {0.0200, -0.0200, 0.0100, -5.1608082, -100.364092, -29.5935632},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign452"] = {"houndkphone@from94", "houndkphone_clip", "Gang Sign 411", AnimationOptions =
    {    
        Prop = 'prop_amb_phone',
        PropBone = 26611,
        PropPlacement = {0.0400, -0.0450, -0.0020, 1.4205163, 23.9960445, 1.7269448},
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["gsign453"] = {"carljohnsongsfcustom1@from94", "carljohnsongsfcustom1_clip", "Gang Sign 412", AnimationOptions =
    {    
        EmoteLoop = true,
        EmoteMoving = false,
    }},
    ["mmodel154"] = {"smo@male_model_154", "m_model_154_clip", "Male Model Pose 154", AnimationOptions =
{
	EmoteLoop = true,
	EmoteMoving = false,
}},

["mmodel155"] = {"smo@male_model_155", "m_model_155_clip", "Male Model Pose 155", AnimationOptions =
{
	EmoteLoop = true,
	EmoteMoving = false,
}},

["mmodel156"] = {"smo@male_model_156", "m_model_156_clip", "Male Model Pose 156", AnimationOptions =
{
	EmoteLoop = true,
	EmoteMoving = false,
}},

["mselfie115"] = {"smo@male_selfie_115", "m_selfie_115_clip", "Male Selfie Pose 115", AnimationOptions =
{
	EmoteLoop = true,
	EmoteMoving = false,
}},

["mselfie116"] = {"smo@male_selfie_116", "m_selfie_116_clip", "Male Selfie Pose 116", AnimationOptions =
{
	EmoteLoop = true,
	EmoteMoving = false,
}},

["mselfie117"] = {"smo@male_selfie_117", "m_selfie_117_clip", "Male Selfie Pose 117", AnimationOptions =
{
	EmoteLoop = true,
	EmoteMoving = false,
}},

["baddie1"] = {"41animpeacebaddie@animation", "41animpeacebaddie_clip", "Baddie Pose 1", AnimationOptions =
    {
    EmoteLoop = true,
    EmoteMoving = false,
    }},

["baddie2"] = {"bendova@animation", "bendova_clip", "Baddie Pose 2", AnimationOptions =
    {
    EmoteLoop = true,
    EmoteMoving = false,
    }},

["baddie3"] = {"nailpose@animation", "nailpose_clip", "Baddie Pose 3", AnimationOptions =
    {
    EmoteLoop = true,
    EmoteMoving = false,
    }},

["baddie4"] = {"stonerbabe@animation", "stonerbabe_clip", "Baddie Pose 4", AnimationOptions =
    {
    EmoteLoop = true,
    EmoteMoving = false,
    }},

["baddie5"] = {"baddiegyat", "baddiegyat_clip", "Baddie Pose 5", AnimationOptions =
    {
    EmoteLoop = true,
    EmoteMoving = false,
    }},

["baddie_glasses"] = {"baddie_glasses@vanessssi", "baddie_glasses_clip", "Baddie Glasses Pose", AnimationOptions =
    {
    EmoteLoop = true,
    EmoteMoving = false,
    }},

["kennybch"] = {"kennybch@rareluv", "kennybch_clip", "Beach Pose", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["beachstand"] = {"beachstand@rareluv", "beachstand_clip", "Beach Stand Pose", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["car_chill"] = {"car_chill@vansen", "car_chill_clip", "Car Pose 1", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["car_pew"] = {"car_pew@vansen", "car_pew_clip", "Car Pose 2", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["carsit"] = {"carsit@rareluv", "carsit_clip", "Car Pose 4", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["kljcarstand"] = {"kljcarstand@rareluv", "kljcarstand_clip", "Car Stand Pose", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["chair_leg_up"] = {"perlenfuchs@chair_leg_up", "chair_leg_up_clip", "Chair Leg Pose", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female1"] = {"female1@rareluv", "female1_clip", "RL FPose 1", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female2"] = {"female2@rareluv", "female2_clip", "RL FPose 9", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female3"] = {"female3@rareluv", "female3_clip", "RL FPose 19", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female4"] = {"female4@rareluv", "female4_clip", "RL FPose 23", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female5"] = {"female5@rareluv", "female5_clip", "RL FPose 32", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female6"] = {"female6@rareluv", "female6_clip", "RL FPose 33", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female7"] = {"female7@rareluv", "female7_clip", "RL FPose 34", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female8"] = {"female8@rareluv", "female8_clip", "RL FPose 35", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female13"] = {"female13@rareluv", "rareluv13_clip", "RL FPose 2", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female14"] = {"female14@rareluv", "rareluv14_clip", "RL FPose 3", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female15"] = {"female15@rareluv", "female15_clip", "RL FPose 4", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female16"] = {"female16@rareluv", "female16_clip", "RL FPose 5", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},
["female17"] = {"female17@rareluv", "female17_clip", "RL FPose 6", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female18"] = {"female18@rareluv", "female18_clip", "RL FPose 7", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female19"] = {"female19@rareluv", "female19_clip", "RL FPose 8", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female20"] = {"female20@rareluv", "female20_clip", "RL FPose 10", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female21"] = {"female21@rareluv", "female21_clip", "RL FPose 11", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female22"] = {"female22@rareluv", "female22_clip", "RL FPose 12", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female23"] = {"female23@rareluv", "female23_clip", "RL FPose 13", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female24"] = {"female24@rareluv", "female24_clip", "RL FPose 14", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female25"] = {"female25@rareluv", "female25_clip", "RL FPose 15", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female26"] = {"female26@rareluv", "female26_clip", "RL FPose 16", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female27"] = {"female27@rareluv", "female27_clip", "RL FPose 17", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female28"] = {"female28@rareluv", "female28_clip", "RL FPose 18", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female30"] = {"female30@rareluv", "female30_clip", "RL FPose 29", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female31"] = {"female31@rareluv", "female31_clip", "RL FPose 20", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female32"] = {"female32@rareluv", "female32_clip", "RL FPose 21", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female33"] = {"female33@rareluv", "female33_clip", "RL FPose 22", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female40"] = {"female40@rareluv", "female40_clip", "RL FPose 24", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female41"] = {"female41@rareluv", "female41_clip", "RL FPose 25", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},
["female42"] = {"female42@rareluv", "female42_clip", "RL FPose 26", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},
["female43"] = {"female43@rareluv", "female43_clip", "RL FPose 27", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female46"] = {"female46@rareluv", "female46_clip", "RL FPose 28", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female47"] = {"female47@rareluv", "female47_clip", "RL FPose 29", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female48"] = {"female48@rareluv", "female48_clip", "RL FPose 30", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["female49"] = {"female49@rareluv", "female49_clip", "RL FPose 31", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dti"] = {"lunyxco@dresstoimpress", "chic", "DTI Pose ", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dti2"] = {"lunyxco@dresstoimpress", "deathdrop", "Death Drop", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dit3"] = {"lunyxco@dresstoimpress", "magica", "DTI Pose 3", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dti4"] = {"lunyxco@dresstoimpress", "pose5", "DTI Pose 4", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},
["dti5"] = {"lunyxco@dresstoimpress", "pose8", "DTI Pose 5", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},
["dti6"] = {"lunyxco@dresstoimpress", "pose20", "DTI Pose 6", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dti7"] = {"lunyxco@dresstoimpress", "pose28", "DTI Pose 7", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dti8"] = {"lunyxco@dresstoimpress", "runoutofposes", "DTI Pose 8", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dti9"] = {"lunyxco@dresstoimpress", "split", "DTI Pose 9", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["badrichgirl"] = {"badrichgirl@queensisters", "badrichgirl_clip", "Rich Girl Pose", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["handonhippose"] = {"handonhippose@queensisters", "handonhip_clip", "Hips Pose", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["handonwindow"] = {"handonwindow@queensisters", "handonwindow_clip", "Window Pose", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["fuckfingerlips"] = {"fuckfingerlips@queensisters", "fuckfingerlips_clip", "F Finger Pose", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["standing_wall2"] = {"perlenfuchs@standing_wall2", "standing_wall2_clip", "Standing Wall Pose", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["sit_stairs1"] = {"perlenfuchs@sit_stairs1", "sit_stairs1_clip", "Sit Stairs Pose", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["sit_cute7"] = {"perlenfuchs@sit_cute7", "sit_cute7_clip", "Sit Cute 3 Pose", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["sit_cute3"] = {"perlenfuchs@sit_cute3", "sit_cute3_clip", "Sit Cute Pose", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["zbrstand"] = {"zbrstand@rareluv", "zbrstand_clip", "Stand Pose", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["pose_poledance_001"] = {"frabi@femalepose@solo@firstpoledance", "pose_poledance_001", "VU Pole Pose 1", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["pose_poledance_002"] = {"frabi@femalepose@solo@firstpoledance", "pose_poledance_002", "VU Pole Pose 2", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["pose_poledance_003"] = {"frabi@femalepose@solo@firstpoledance", "pose_poledance_003", "VU Pole Pose 3", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["pose_poledance_004"] = {"frabi@femalepose@solo@firstpoledance", "pose_poledance_004", "VU Pole Pose 4", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["pose_poledance_005"] = {"frabi@femalepose@solo@firstpoledance", "pose_poledance_005", "VU Pole Pose 5", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["pose_poledance_006"] = {"frabi@femalepose@solo@secondpoledance", "pose_poledance_001", "VU Pole Pose 6", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["pose_poledance_007"] = {"frabi@femalepose@solo@secondpoledance", "pose_poledance_002", "VU Pole Pose 7", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["pose_poledance_008"] = {"frabi@femalepose@solo@secondpoledance", "pose_poledance_003", "VU Pole Pose 8", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["pose_poledance_009"] = {"frabi@femalepose@solo@secondpoledance", "pose_poledance_004", "VU Pole Pose 9", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["pose_poledance_010"] = {"frabi@femalepose@solo@secondpoledance", "pose_poledance_005", "VU Pole Pose 10", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["y2kpose2"] = {"y2kpose2@corbs", "y2kpose2_clip", "Y2K Pose", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["model1"] = {"model1@corbs", "model1_clip", "Model Pose 4", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["sitpretty"] = {"sitpretty@corbs", "sitpretty_clip", "Sit Pretty Pose", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["nkshowoff"] = {"nkshowoff@animation", "nkshowoff_clip", "NL Pose 4", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["nklegup"] = {"nklegup@animation", "nklegup_clip", "NL Pose 3", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["nallieshit"] = {"nallieshit@animation", "nallieshit_clip", "NL Pose 2", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["kassanim"] = {"kassanim@animation", "kassanim_clip", "NL Pose 1", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dsit1"] = {"divined@dsposes@new", "dsit1", "Sit Down #1", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dsit2"] = {"divined@dsposes@new", "dsit2", "Sit Down #2", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dsit3"] = {"divined@dsposes@new", "dsit3", "Sit Down #3", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dfsit1"] = {"divined@dsposes@new", "dfsit1", "Sit Down #1 (Feminine)", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dfsit2"] = {"divined@dsposes@new", "dfsit2", "Sit Down #2 (Feminine)", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dfsit3"] = {"divined@dsposes@new", "dfsit3", "Sit Down #3 (Feminine)", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dfsit4"] = {"divined@dsposes@new", "dfsit4", "Sit Down #4 (Feminin)", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dfsit5"] = {"divined@dsposes@new", "dfsit5", "Sit Down #5 (Feminine)", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dsitg1"] = {"divined@dsposes@new", "dsitg1", "Sit Down (Male)", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dlookright1"] = {"divined@dsposes@new", "dlookright1", "Look Right", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dlookaround"] = {"divined@dsposes@new", "dlookleft1", "Look Around", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dstand1"] = {"divined@dsposes@new", "dstand1", "Stand 1", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dstand2"] = {"divined@dsposes@new", "dstand2", "Stand 2", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

["dsitground"] = {"divined@dsposes@new", "dsitground", "Sit Ground 1", AnimationOptions =
{
    EmoteLoop = true,
    EmoteMoving = false,
}},

}


CustomDP.PropEmotes = {
    ["flag"] = {
        'rcmnigel1d',
        'base_club_shoulder',
        'Flag - United States',
        AnimationOptions = {
            Prop = 'itsroberflag',
            PropBone = 18905,
            PropPlacement = {
                0.0800,
                -0.2090,
                0.0900,
                -82.6677,
                -141.2988,
                12.3308
            },
            EmoteLoop = true,
            EmoteMoving = true
        }
    },
    ["cbsoda"] = {"mp_player_intdrink", "loop_bottle", "CBCoke", AnimationOptions =
    {    Prop = "prop_food_cb_juice01", PropBone = 18905, PropPlacement = {0.04, -0.10, 0.10, 240.0, -60.0},
         EmoteMoving = true, EmoteLoop = true, }},
    ["cbcoffee"] = {"mp_player_intdrink", "loop_bottle", "CBCoffee", AnimationOptions =
    {    Prop = "prop_food_cb_coffee", PropBone = 18905, PropPlacement = {0.08, -0.10, 0.10, 240.0, -60.0},
         EmoteMoving = true, EmoteLoop = true, }},
    ["cbburger"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "ChickenBurger", AnimationOptions =
    {    Prop = "prop_food_cb_burg01", PropBone = 18905, PropPlacement = {0.10, -0.07, 0.091, 15.0, 135.0},
         EmoteMoving = true, EmoteLoop = true, }},
    ["cbfries"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "CBFries", AnimationOptions =
    {    Prop = "prop_food_cb_chips", PropBone = 18905, PropPlacement = {0.09, -0.06, 0.05, 300.0, 150.0},
         EmoteMoving = true, EmoteLoop = true, }},
    -- DUPLICATE: also defined in AnimationList.lua at line 11297
    ["donut3"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut3", AnimationOptions =
    {   Prop = 'prop_food_cb_donuts', PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 100.0, 270.0},
        EmoteMoving = true, EmoteLoop = true, }},
     ["cbnuggets"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Cnuggets", AnimationOptions =
     {   Prop = 'prop_food_cb_nugets', PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 100.0, 270.0}, 
     EmoteMoving = true, EmoteLoop = true,}},
     ["cbtoy"] = {"mp_arresting", "a_uncuff", "CBToy", AnimationOptions =
     {   Prop = 'jixel_prop_cluckinbox', PropBone = 18905, PropPlacement = { 0.1, 0.1, 0.0, 0.0, 100.0, 90.0},
        EmoteMoving = true, EmoteLoop = true, }},  
    ["stab"] = {"melee@hatchet@streamed_core_fps", "plyr_front_takedown_b", "Stab", AnimationOptions =
    {   Prop = 'prop_knife', PropBone = 57005, PropPlacement = {0.1, 0.10, 0.10, 240.0, -60.0},
        EmoteMoving = true, EmoteLoop = true, }},
    -- DUPLICATE: also defined in AnimationList.lua at line 23047
    ["milk"] = {"mp_player_intdrink", "loop_bottle", "Milk", AnimationOptions =
    {    Prop = "v_res_tt_milk", PropBone = 18905, PropPlacement = {0.10, 0.008, 0.07, 240.0, -60.0},
         EmoteMoving = true, EmoteLoop = true, }},
    -- DUPLICATE: also defined in AnimationList.lua at line 23050
    ["bscoke"] = {"mp_player_intdrink", "loop_bottle", "BS Coke", AnimationOptions =
    {    Prop = "prop_food_bs_juice01", PropBone = 18905, PropPlacement = {0.04, -0.10, 0.10, 240.0, -60.0},
         EmoteMoving = true, EmoteLoop = true, }},
    -- DUPLICATE: also defined in AnimationList.lua at line 23053
    ["bscoffee"] = {"mp_player_intdrink", "loop_bottle", "BS Coffee", AnimationOptions =
    {    Prop = "prop_food_bs_coffee", PropBone = 18905, PropPlacement = {0.08, -0.10, 0.10, 240.0, -60.0},
         EmoteMoving = true, EmoteLoop = true, }},
    -- DUPLICATE: also defined in AnimationList.lua at line 23056
    ["glass"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Tall Glass", AnimationOptions =
    {   Prop = 'prop_wheat_grass_glass', PropBone = 28422, PropPlacement = {0.0, 0.0, -0.1, 0.0, 0.0, 0.0},
        EmoteLoop = true, EmoteMoving = true, }},
    
    -- DUPLICATE: also defined in AnimationList.lua at line 23060
    ["torpedo"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Torpedo", AnimationOptions =
    {    Prop = "prop_food_bs_burger2", PropBone = 18905, PropPlacement = {0.10, -0.07, 0.091, 15.0, 135.0},
         EmoteMoving = true, EmoteLoop = true, }},
    -- DUPLICATE: also defined in AnimationList.lua at line 23063
    ["bsfries"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Fries", AnimationOptions =
    {    Prop = "prop_food_bs_chips", PropBone = 18905, PropPlacement = {0.09, -0.06, 0.05, 300.0, 150.0},
         EmoteMoving = true, EmoteLoop = true, }},
    -- DUPLICATE: also defined in AnimationList.lua at line 23066
    ["donut2"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut2", AnimationOptions =
    {   Prop = 'prop_donut_02', PropBone = 18905, PropPlacement = {0.13, 0.05, 0.02, -50.0, 100.0, 270.0},
        EmoteMoving = true, EmoteLoop = true, }},
    -- 	["uwu1"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
	-- { Prop = 'uwu_sml_drink', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
	-- 	EmoteLoop = true, EmoteMoving = true, }},
	-- ["uwu2"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
	-- { Prop = 'uwu_lrg_drink', PropBone = 28422, PropPlacement = {0.03, 0.0, -0.08, 0.0, 0.0, 130.0},
	-- 	EmoteLoop = true, EmoteMoving = true, }},
	-- ["uwu3"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
	-- { Prop = 'uwu_cup_straw', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
	-- 	EmoteLoop = true, EmoteMoving = true, }},
	-- ["uwu4"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
	-- { Prop = 'uwu_mug', PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
	-- 	EmoteLoop = true, EmoteMoving = true, }},
	-- ["uwu5"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions =
	-- { Prop = 'uwu_pastry', PropBone = 18905, PropPlacement = {0.16, 0.06, -0.03, -50.0, 16.0, 60.0},
	-- 	EmoteMoving = true, }},
	-- ["uwu6"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions =
	-- { Prop = 'uwu_cookie', PropBone = 18905, PropPlacement = {0.16, 0.08, -0.01, -225.0, 20.0, 60.0},
	-- 	EmoteMoving = true, }},
	-- ["uwu7"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions =
	-- { Prop = 'uwu_sushi', PropBone = 18905, PropPlacement = {0.18, 0.03, 0.02, -50.0, 16.0, 60.0},
	-- 	EmoteMoving = true, }},
	-- ["uwu8"] = {"amb@world_human_seat_wall_eating@male@both_hands@idle_a", "idle_c", "", AnimationOptions =
	-- { Prop = 'uwu_eggroll', PropBone = 60309, PropPlacement = {0.10, 0.03, 0.08, -95.0, 60.0, 0.0},
	-- 	EmoteMoving = true, }},
	-- ["uwu9"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "", AnimationOptions =
	-- { Prop = "uwu_salad_bowl", PropBone = 60309, PropPlacement = {0.0, 0.0300, 0.0100, 0.0, 0.0, 0.0},
	-- 	SecondProp = 'uwu_salad_spoon', SecondPropBone = 28422, SecondPropPlacement = {0.0, 0.0 ,0.0, 0.0, 0.0, 0.0},
	-- 	EmoteLoop = true, EmoteMoving = true, }},
	-- ["uwu10"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions =
	-- { Prop = 'uwu_sandy', PropBone = 18905, PropPlacement = {0.16, 0.08, 0.05, -225.0, 20.0, 60.0},
	-- 	EmoteMoving = true, }},
	-- ["uwu11"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
	-- { Prop = 'uwu_cupcake', PropBone = 28422, PropPlacement = {0.0, 0.0, -0.03, 0.0, 0.0, 130.0},
	-- 	EmoteLoop = true, EmoteMoving = true, }},
	-- ["uwu12"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions =
	-- { Prop = 'uwu_btea', PropBone = 28422, PropPlacement = {0.02, 0.0, -0.05, 0.0, 0.0, 130.0},
	-- 	EmoteLoop = true, EmoteMoving = true, }},
	-- ["uwu13"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "", AnimationOptions =
	-- { Prop = 'uwu_gdasik', PropBone = 18905, PropPlacement = {0.16, 0.08, 0.02, -225.0, 20.0, 60.0},
	-- 	EmoteMoving = true, }},

    	--Jixel-pearls
    -- DUPLICATE: also defined in AnimationList.lua at line 10883
    ["whiskeyb"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Whiskey Bottle", AnimationOptions =
	{    Prop = "prop_cs_whiskey_bottle", PropBone = 60309, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0},
		EmoteMoving = true, EmoteLoop = true }},
    -- DUPLICATE: also defined in AnimationList.lua at line 23071
    ["rumb"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Rum Bottle", AnimationOptions =
	{    Prop = "prop_rum_bottle", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true }},
    -- DUPLICATE: also defined in AnimationList.lua at line 23074
    ["icream"] = {"mp_player_intdrink", "loop_bottle", "Irish Cream Bottle", AnimationOptions =
	{    Prop = "prop_bottle_brandy", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true }},
    -- DUPLICATE: also defined in AnimationList.lua at line 23077
    ["ginb"] =  {"mp_player_intdrink", "loop_bottle", "(Don't Use) Gin Bottle", AnimationOptions =
	{    Prop = "prop_tequila_bottle", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true }},
    -- DUPLICATE: also defined in AnimationList.lua at line 23080
    ["vodkab"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle", AnimationOptions =
	{   Prop = 'prop_vodka_bottle', PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true }},
    -- DUPLICATE: also defined in AnimationList.lua at line 23084
    ["crisps"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Chrisps", AnimationOptions =
	{   Prop = 'v_ret_ml_chips2', PropBone = 28422, PropPlacement = {0.01, -0.05, -0.1, 0.0, 0.0, 90.0},
		EmoteLoop = true, EmoteMoving = true, }},
    -- DUPLICATE: also defined in AnimationList.lua at line 23087
    ["beer1"] = {"mp_player_intdrink", "loop_bottle", "Dusche", AnimationOptions =
	{    Prop = "prop_beerdusche", PropBone = 18905, PropPlacement = {0.04, -0.14, 0.10, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true, }},
    -- DUPLICATE: also defined in AnimationList.lua at line 10921
    ["beer2"] = {"mp_player_intdrink", "loop_bottle", "Logger", AnimationOptions =
	{    Prop = "prop_beer_logopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true, }},
    -- DUPLICATE: also defined in AnimationList.lua at line 10940
    ["beer3"] = {"mp_player_intdrink", "loop_bottle", "AM Beer", AnimationOptions =
	{    Prop = "prop_beer_amopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true, }},
    -- DUPLICATE: also defined in AnimationList.lua at line 10959
    ["beer4"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser1", AnimationOptions =
	{    Prop = "prop_beer_pissh", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true, }},
    -- DUPLICATE: also defined in AnimationList.lua at line 10978
    ["beer5"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser2", AnimationOptions =
	{    Prop = "prop_amb_beer_bottle", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true, }},
    -- DUPLICATE: also defined in AnimationList.lua at line 10997
    ["beer6"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser3", AnimationOptions =
	{    Prop = "prop_cs_beer_bot_02", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true, }},
    -- DUPLICATE: also defined in AnimationList.lua at line 23105
    ["ecola"] = {"mp_player_intdrink", "loop_bottle", "E-cola", AnimationOptions =
	{    Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true, }},
	["sprunk"] = {"mp_player_intdrink", "loop_bottle", "Sprunk", AnimationOptions =
	{    Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
		EmoteMoving = true, EmoteLoop = true, }},


    
	--Jim-Henhouse
	-- ["browncup"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Brown Cup", AnimationOptions =
	-- 	{ Prop = 'v_serv_bs_mug', PropBone = 28422, PropPlacement = {0.03, -0.02, 0.0, 0.0, 0.0, 0.0},
	-- 		EmoteLoop = true, EmoteMoving = true, }},
	-- ["whiskeyb"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Whiskey Bottle", AnimationOptions =
	-- 	{ Prop = "prop_cs_whiskey_bottle", PropBone = 60309, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0},
	-- 		EmoteMoving = true, EmoteLoop = true }},
	-- ["rumb"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Rum Bottle", AnimationOptions =
	-- 	{ Prop = "prop_rum_bottle", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
	-- 		EmoteMoving = true, EmoteLoop = true }},
	-- ["icream"] = {"mp_player_intdrink", "loop_bottle", "Irish Cream Bottle", AnimationOptions =
	-- 	{ Prop = "prop_bottle_brandy", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
	-- 		EmoteMoving = true, EmoteLoop = true }},
	-- ["ginb"] =  {"mp_player_intdrink", "loop_bottle", "(Don't Use) Gin Bottle", AnimationOptions =
	-- 	{ Prop = "prop_tequila_bottle", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
	-- 		EmoteMoving = true, EmoteLoop = true }},
	-- ["vodkab"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle", AnimationOptions =
	-- 	{ Prop = 'prop_vodka_bottle', PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
	-- 		EmoteMoving = true, EmoteLoop = true }},
	-- ["crisps"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Chrisps", AnimationOptions =
	-- 	{ Prop = 'v_ret_ml_chips2', PropBone = 28422, PropPlacement = {0.01, -0.05, -0.1, 0.0, 0.0, 90.0},
	-- 		EmoteLoop = true, EmoteMoving = true, }},
	-- ["beer1"] = {"mp_player_intdrink", "loop_bottle", "Dusche", AnimationOptions =
	-- 	{ Prop = "prop_beerdusche", PropBone = 18905, PropPlacement = {0.04, -0.14, 0.10, 240.0, -60.0},
	-- 		EmoteMoving = true, EmoteLoop = true, }},
	-- ["beer2"] = {"mp_player_intdrink", "loop_bottle", "Logger", AnimationOptions =
	-- 	{ Prop = "prop_beer_logopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
	-- 		EmoteMoving = true, EmoteLoop = true, }},
	-- ["beer3"] = {"mp_player_intdrink", "loop_bottle", "AM Beer", AnimationOptions =
	-- 	{ Prop = "prop_beer_amopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
	-- 		EmoteMoving = true, EmoteLoop = true, }},
	-- ["beer4"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser1", AnimationOptions =
	-- 	{ Prop = "prop_beer_pissh", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
	-- 		EmoteMoving = true, EmoteLoop = true, }},
	-- ["beer5"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser2", AnimationOptions =
	-- 	{ Prop = "prop_amb_beer_bottle", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
	-- 		EmoteMoving = true, EmoteLoop = true, }},
	-- ["beer6"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser3", AnimationOptions =
	-- 	{ Prop = "prop_cs_beer_bot_02", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
	-- 		EmoteMoving = true, EmoteLoop = true, }},
	-- ["ecola"] = {"mp_player_intdrink", "loop_bottle", "E-cola", AnimationOptions =
	-- 	{ Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
	-- 		EmoteMoving = true, EmoteLoop = true, }},
	-- ["sprunk"] = {"mp_player_intdrink", "loop_bottle", "Sprunk", AnimationOptions =
	-- 	{ Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
	-- 		EmoteMoving = true, EmoteLoop = true, }},
        -- ["whiskeyb"] = {"anim@amb@nightclub@mini@drinking@drinking_shots@ped_b@normal@", "glass_hold", "Whiskey Bottle", AnimationOptions =
        -- {    Prop = "prop_cs_whiskey_bottle", PropBone = 60309, PropPlacement = {0.08, 0.0, 0.05, 240.0, -60.0}, 
        --     EmoteMoving = true, EmoteLoop = true }}, 
        -- ["rumb"] = {"anim@amb@nightclub@mini@drinking@drinking_shots@ped_b@normal@", "glass_hold", "Rum Bottle", AnimationOptions =
        -- {    Prop = "prop_rum_bottle", PropBone = 60309, PropPlacement = {-0.04, -0.18, 0.12, 240.0, -60.0}, 
        --     EmoteMoving = true, EmoteLoop = true }}, 
        -- ["icream"] = {"anim@amb@nightclub@mini@drinking@drinking_shots@ped_b@normal@", "glass_hold", "Irish Cream Bottle", AnimationOptions =
        -- {    Prop = "prop_bottle_brandy", PropBone = 60309, PropPlacement = {-0.04, -0.18, 0.12, 240.0, -60.0}, 
        --     EmoteMoving = true, EmoteLoop = true }}, 
        -- ["ginb"] =  {"anim@amb@nightclub@mini@drinking@drinking_shots@ped_b@normal@", "glass_hold", "Gin Bottle", AnimationOptions =
        -- {    Prop = "prop_tequila_bottle", PropBone = 60309, PropPlacement = {-0.04, -0.18, 0.12, 240.0, -60.0}, 
        --     EmoteMoving = true, EmoteLoop = true }}, 
        -- ["vodkab"] = {"anim@amb@nightclub@mini@drinking@drinking_shots@ped_b@normal@", "glass_hold", "Vodka Bottle", AnimationOptions =
        -- {   Prop = 'prop_vodka_bottle', PropBone = 60309, PropPlacement = {-0.04, -0.18, 0.12, 240.0, -60.0}, 
        --     EmoteMoving = true, EmoteLoop = true }},      
        -- ["crisps"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Chrisps", AnimationOptions =
        -- {   Prop = 'v_ret_ml_chips2', PropBone = 28422, PropPlacement = {0.01, -0.05, -0.1, 0.0, 0.0, 90.0},
        --     EmoteLoop = true, EmoteMoving = true, }}, 
        -- ["beer1"] = {"mp_player_intdrink", "loop_bottle", "Dusche", AnimationOptions =
        -- {    Prop = "prop_beerdusche", PropBone = 18905, PropPlacement = {0.04, -0.14, 0.10, 240.0, -60.0},
        --      EmoteMoving = true, EmoteLoop = true, }},
        -- ["beer2"] = {"mp_player_intdrink", "loop_bottle", "Logger", AnimationOptions =
        -- {    Prop = "prop_beer_logopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
        --      EmoteMoving = true, EmoteLoop = true, }},   
        -- ["beer3"] = {"mp_player_intdrink", "loop_bottle", "AM Beer", AnimationOptions =
        -- {    Prop = "prop_beer_amopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
        --      EmoteMoving = true, EmoteLoop = true, }},   
        -- ["beer4"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser1", AnimationOptions =
        -- {    Prop = "prop_beer_pissh", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
        --      EmoteMoving = true, EmoteLoop = true, }},
        -- ["beer5"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser2", AnimationOptions =
        -- {    Prop = "prop_amb_beer_bottle", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        --      EmoteMoving = true, EmoteLoop = true, }},  
        -- ["beer6"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser3", AnimationOptions =
        -- {    Prop = "prop_cs_beer_bot_02", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        --      EmoteMoving = true, EmoteLoop = true, }},   
        -- ["ecola"] = {"mp_player_intdrink", "loop_bottle", "E-cola", AnimationOptions =
        -- {    Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        --      EmoteMoving = true, EmoteLoop = true, }},   
        -- ["sprunk"] = {"mp_player_intdrink", "loop_bottle", "Sprunk", AnimationOptions =
        -- {    Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
        --      EmoteMoving = true, EmoteLoop = true, }},
             ["redwine"] = {"mp_player_intdrink", "loop_bottle", "Red Wine Bottle", AnimationOptions =
             {    Prop = "prop_wine_rose", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
                  EmoteMoving = true, EmoteLoop = true, }},
             ["whitewine"] = {"mp_player_intdrink", "loop_bottle", "White Wine Bottle", AnimationOptions =
             {    Prop = "prop_wine_white", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
                  EmoteMoving = true, EmoteLoop = true, }},
            --  ["beer1"] = {"mp_player_intdrink", "loop_bottle", "Dusche", AnimationOptions =
            --  {    Prop = "prop_beerdusche", PropBone = 18905, PropPlacement = {0.04, -0.14, 0.10, 240.0, -60.0},
            --       EmoteMoving = true, EmoteLoop = true, }},
            --  ["beer2"] = {"mp_player_intdrink", "loop_bottle", "Logger", AnimationOptions =
            --  {    Prop = "prop_beer_logopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
            --       EmoteMoving = true, EmoteLoop = true, }},
            --  ["beer3"] = {"mp_player_intdrink", "loop_bottle", "AM Beer", AnimationOptions =
            --  {    Prop = "prop_beer_amopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
            --       EmoteMoving = true, EmoteLoop = true, }},
            --  ["beer4"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser1", AnimationOptions =
            --  {    Prop = "prop_beer_pissh", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
            --       EmoteMoving = true, EmoteLoop = true, }},
            --  ["beer5"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser2", AnimationOptions =
            --  {    Prop = "prop_amb_beer_bottle", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
            --       EmoteMoving = true, EmoteLoop = true, }},
            --  ["beer6"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser3", AnimationOptions =
            --  {    Prop = "prop_cs_beer_bot_02", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
            --       EmoteMoving = true, EmoteLoop = true, }},
            --  ["ecola"] = {"mp_player_intdrink", "loop_bottle", "e-cola", AnimationOptions =
            --  {    Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
            --       EmoteMoving = true, EmoteLoop = true, }},
            --  ["sprunk"] = {"mp_player_intdrink", "loop_bottle", "sprunk", AnimationOptions =
            --  {    Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
            --       EmoteMoving = true, EmoteLoop = true, }},
             ["pizza"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Pizza", AnimationOptions =
             {    Prop = "v_res_tt_pizzaplate", PropBone = 18905, PropPlacement = {0.20, 0.038, 0.051, 15.0, 155.0},
                  EmoteMoving = true, EmoteLoop = true, }},
             ["bowl"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "bowl", AnimationOptions =
             {    Prop = "h4_prop_h4_coke_plasticbowl_01", PropBone = 28422, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
                  EmoteMoving = true, EmoteLoop = true, }},
             ["pineapple"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger_fp", "Pizza", AnimationOptions =
             {    Prop = "prop_pineapple", PropBone = 18905, PropPlacement = {0.10, 0.038, 0.03, 15.0, 50.0},
                  EmoteMoving = true, EmoteLoop = true, }},
             ["foodbowl"] = {"anim@scripted@island@special_peds@pavel@hs4_pavel_ig5_caviar_p1", "base_idle", "bowl", AnimationOptions =
             {    Prop = "prop_cs_bowl_01", PropBone = 60309, PropPlacement = {0.0, 0.0300, 0.0100, 0.0, 0.0, 0.0},
                  EmoteMoving = true, EmoteLoop = true, }},
                --   ["whiskeyb"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Whiskey Bottle", AnimationOptions =
                --   {    Prop = "prop_cs_whiskey_bottle", PropBone = 60309, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0},
                --       EmoteMoving = true, EmoteLoop = true }},
                --   ["rumb"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Rum Bottle", AnimationOptions =
                --   {    Prop = "prop_rum_bottle", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
                --       EmoteMoving = true, EmoteLoop = true }},
                --   ["icream"] = {"mp_player_intdrink", "loop_bottle", "Irish Cream Bottle", AnimationOptions =
                --   {    Prop = "prop_bottle_brandy", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
                --       EmoteMoving = true, EmoteLoop = true }},
                --   ["ginb"] =  {"mp_player_intdrink", "loop_bottle", "(Don't Use) Gin Bottle", AnimationOptions =
                --   {    Prop = "prop_tequila_bottle", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
                --       EmoteMoving = true, EmoteLoop = true }},
                --   ["vodkab"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle", AnimationOptions =
                --   {   Prop = 'prop_vodka_bottle', PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
                --       EmoteMoving = true, EmoteLoop = true }},
              
    --              ["crisps"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Chrisps", AnimationOptions =
    --              {   Prop = 'v_ret_ml_chips2', PropBone = 28422, PropPlacement = {0.01, -0.05, -0.1, 0.0, 0.0, 90.0},
    --                  EmoteLoop = true, EmoteMoving = true, }},
    --              ["beer1"] = {"mp_player_intdrink", "loop_bottle", "Dusche", AnimationOptions =
    --              {    Prop = "prop_beerdusche", PropBone = 18905, PropPlacement = {0.04, -0.14, 0.10, 240.0, -60.0},
    --                   EmoteMoving = true, EmoteLoop = true, }},
    --              ["beer2"] = {"mp_player_intdrink", "loop_bottle", "Logger", AnimationOptions =
    --              {    Prop = "prop_beer_logopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
    --                   EmoteMoving = true, EmoteLoop = true, }},
    --              ["beer3"] = {"mp_player_intdrink", "loop_bottle", "AM Beer", AnimationOptions =
    --              {    Prop = "prop_beer_amopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
    --                   EmoteMoving = true, EmoteLoop = true, }},
    --              ["beer4"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser1", AnimationOptions =
    --              {    Prop = "prop_beer_pissh", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
    --                   EmoteMoving = true, EmoteLoop = true, }},
    --              ["beer5"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser2", AnimationOptions =
    --              {    Prop = "prop_amb_beer_bottle", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
    --                   EmoteMoving = true, EmoteLoop = true, }},
    --              ["beer6"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser3", AnimationOptions =
    --              {    Prop = "prop_cs_beer_bot_02", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
    --                   EmoteMoving = true, EmoteLoop = true, }},
    --              ["ecola"] = {"mp_player_intdrink", "loop_bottle", "E-cola", AnimationOptions =
    --              {    Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
    --                   EmoteMoving = true, EmoteLoop = true, }},
    --              ["sprunk"] = {"mp_player_intdrink", "loop_bottle", "Sprunk", AnimationOptions =
    --              {    Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
    --                   EmoteMoving = true, EmoteLoop = true, }},
    --                   ["browncup"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Brown Cup", AnimationOptions =
    --                   { Prop = 'v_serv_bs_mug', PropBone = 28422, PropPlacement = {0.03, -0.02, 0.0, 0.0, 0.0, 0.0},
    --                       EmoteLoop = true, EmoteMoving = true, }},
    --               ["whiskeyb"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Whiskey Bottle", AnimationOptions =
    --                   { Prop = "prop_cs_whiskey_bottle", PropBone = 60309, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0},
    --                       EmoteMoving = true, EmoteLoop = true }},
    --               ["rumb"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Rum Bottle", AnimationOptions =
    --                   { Prop = "prop_rum_bottle", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
    --                       EmoteMoving = true, EmoteLoop = true }},
    --               ["icream"] = {"mp_player_intdrink", "loop_bottle", "Irish Cream Bottle", AnimationOptions =
    --                   { Prop = "prop_bottle_brandy", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
    --                       EmoteMoving = true, EmoteLoop = true }},
    --               ["ginb"] =  {"mp_player_intdrink", "loop_bottle", "(Don't Use) Gin Bottle", AnimationOptions =
    --                   { Prop = "prop_tequila_bottle", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
    --                       EmoteMoving = true, EmoteLoop = true }},
    --               ["vodkab"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle", AnimationOptions =
    --                   { Prop = 'prop_vodka_bottle', PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
    --                       EmoteMoving = true, EmoteLoop = true }},
    --               ["crisps"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Chrisps", AnimationOptions =
    --                   { Prop = 'v_ret_ml_chips2', PropBone = 28422, PropPlacement = {0.01, -0.05, -0.1, 0.0, 0.0, 90.0},
    --                       EmoteLoop = true, EmoteMoving = true, }},
    --               ["beer1"] = {"mp_player_intdrink", "loop_bottle", "Dusche", AnimationOptions =
    --                   { Prop = "prop_beerdusche", PropBone = 18905, PropPlacement = {0.04, -0.14, 0.10, 240.0, -60.0},
    --                       EmoteMoving = true, EmoteLoop = true, }},
    --               ["beer2"] = {"mp_player_intdrink", "loop_bottle", "Logger", AnimationOptions =
    --                   { Prop = "prop_beer_logopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
    --                       EmoteMoving = true, EmoteLoop = true, }},
    --               ["beer3"] = {"mp_player_intdrink", "loop_bottle", "AM Beer", AnimationOptions =
    --                   { Prop = "prop_beer_amopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
    --                       EmoteMoving = true, EmoteLoop = true, }},
    --               ["beer4"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser1", AnimationOptions =
    --                   { Prop = "prop_beer_pissh", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
    --                       EmoteMoving = true, EmoteLoop = true, }},
    --               ["beer5"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser2", AnimationOptions =
    --                   { Prop = "prop_amb_beer_bottle", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
    --                       EmoteMoving = true, EmoteLoop = true, }},
    --               ["beer6"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser3", AnimationOptions =
    --                   { Prop = "prop_cs_beer_bot_02", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
    --                       EmoteMoving = true, EmoteLoop = true, }},
    --               ["ecola"] = {"mp_player_intdrink", "loop_bottle", "E-cola", AnimationOptions =
    --                   { Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
    --                       EmoteMoving = true, EmoteLoop = true, }},
    --               ["sprunk"] = {"mp_player_intdrink", "loop_bottle", "Sprunk", AnimationOptions =
    --                   { Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
    --                       EmoteMoving = true, EmoteLoop = true, }},
    --     	["whiskeyb"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Whiskey Bottle", AnimationOptions =
	-- {    Prop = "prop_cs_whiskey_bottle", PropBone = 60309, PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0},
	-- 	EmoteMoving = true, EmoteLoop = true }},
	-- ["rumb"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Rum Bottle", AnimationOptions =
	-- {    Prop = "prop_rum_bottle", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
	-- 	EmoteMoving = true, EmoteLoop = true }},
	-- ["icream"] = {"mp_player_intdrink", "loop_bottle", "Irish Cream Bottle", AnimationOptions =
	-- {    Prop = "prop_bottle_brandy", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
	-- 	EmoteMoving = true, EmoteLoop = true }},
	-- ["ginb"] =  {"mp_player_intdrink", "loop_bottle", "(Don't Use) Gin Bottle", AnimationOptions =
	-- {    Prop = "prop_tequila_bottle", PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
	-- 	EmoteMoving = true, EmoteLoop = true }},
	-- ["vodkab"] = {"mp_player_intdrink", "loop_bottle", "(Don't Use) Vodka Bottle", AnimationOptions =
	-- {   Prop = 'prop_vodka_bottle', PropBone = 18905, PropPlacement = {0.00, -0.26, 0.10, 240.0, -60.0},
	-- 	EmoteMoving = true, EmoteLoop = true }},
	-- ["crisps"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Chrisps", AnimationOptions =
	-- {   Prop = 'v_ret_ml_chips2', PropBone = 28422, PropPlacement = {0.01, -0.05, -0.1, 0.0, 0.0, 90.0},
	-- 	EmoteLoop = true, EmoteMoving = true, }},
	-- ["beer1"] = {"mp_player_intdrink", "loop_bottle", "Dusche", AnimationOptions =
	-- {    Prop = "prop_beerdusche", PropBone = 18905, PropPlacement = {0.04, -0.14, 0.10, 240.0, -60.0},
	-- 	EmoteMoving = true, EmoteLoop = true, }},
	-- ["beer2"] = {"mp_player_intdrink", "loop_bottle", "Logger", AnimationOptions =
	-- {    Prop = "prop_beer_logopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
	-- 	EmoteMoving = true, EmoteLoop = true, }},
	-- ["beer3"] = {"mp_player_intdrink", "loop_bottle", "AM Beer", AnimationOptions =
	-- {    Prop = "prop_beer_amopen", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
	-- 	EmoteMoving = true, EmoteLoop = true, }},
	-- ["beer4"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser1", AnimationOptions =
	-- {    Prop = "prop_beer_pissh", PropBone = 18905, PropPlacement = {0.03, -0.18, 0.10, 240.0, -60.0},
	-- 	EmoteMoving = true, EmoteLoop = true, }},
	-- ["beer5"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser2", AnimationOptions =
	-- {    Prop = "prop_amb_beer_bottle", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
	-- 	EmoteMoving = true, EmoteLoop = true, }},
	-- ["beer6"] = {"mp_player_intdrink", "loop_bottle", "Pisswasser3", AnimationOptions =
	-- {    Prop = "prop_cs_beer_bot_02", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
	-- 	EmoteMoving = true, EmoteLoop = true, }},
	-- ["ecola"] = {"mp_player_intdrink", "loop_bottle", "E-cola", AnimationOptions =
	-- {    Prop = "prop_ecola_can", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
	-- 	EmoteMoving = true, EmoteLoop = true, }},
	-- ["sprunk"] = {"mp_player_intdrink", "loop_bottle", "Sprunk", AnimationOptions =
	-- {    Prop = "v_res_tt_can03", PropBone = 18905, PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0},
	-- 	EmoteMoving = true, EmoteLoop = true, }},
    ["atomdrink"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = 
        { Prop = 'ng_proc_sodacup_01c', 
        PropBone = 28422, 
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, 
        EmoteLoop = true, 
        EmoteMoving = true, }},
	["atomhotdog"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = 
        { Prop = 'prop_food_bs_burger2', 
        PropBone = 28422, 
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, 
        EmoteLoop = true, 
        EmoteMoving = true, }},
	["atomfries"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "", AnimationOptions = 
        { Prop = 'prop_food_chips', 
        PropBone = 28422, 
        PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0}, 
        EmoteLoop = true, 
        EmoteMoving = true, }},
	["breadslice"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Bread Slice", AnimationOptions = 
        { Prop = 'v_res_fa_bread03',  
        PropBone = 18905,  
        PropPlacement = {0.16, 0.08, -0.01, -225.0, -10.0, 0.0}, 
        EmoteLoop = true, 
        EmoteMoving = true, }},
	["ecola"] = {"mp_player_intdrink", "loop_bottle", "e-cola", AnimationOptions = 
        { Prop = "prop_ecola_can", 
        PropBone = 18905, 
        PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, 
        EmoteMoving = true, 
        EmoteLoop = true, }},
	["sprunk"] = {"mp_player_intdrink", "loop_bottle", "sprunk", AnimationOptions = 
        { Prop = "v_res_tt_can03", 
        PropBone = 18905, 
        PropPlacement = {0.12, 0.008, 0.03, 240.0, -60.0}, 
        EmoteMoving = true, 
        EmoteLoop = true, }},
}

-----------------------------------------------------------------------------------------
--| I don't think you should change the code below unless you know what you are doing |--
-----------------------------------------------------------------------------------------

-- Add the custom emotes to RPEmotes main array
for arrayName, array in pairs(CustomDP) do
    if RP[arrayName] then
        for emoteName, emoteData in pairs(array) do
            -- Skip any emote keys that already exist in the main RP tables
            if not RP[arrayName][emoteName] then
                RP[arrayName][emoteName] = emoteData
            end
        end
    end
    -- Free memory
    CustomDP[arrayName] = nil
end
-- Free memory
CustomDP = nil

