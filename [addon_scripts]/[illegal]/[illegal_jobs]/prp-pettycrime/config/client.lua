Config = {}

Config.PickPocket = {
    targetDistance = 10.0
}

Config.ParkingMeters = {
    targetDistance = 3.0
}

Config.LetterBoxes = {
    targetDistance = 3.0
}

Config.PostBoxes = {
    targetDistance = 3.0
}

Config.GlitterBomb = {
    disarming = {
        -- is job checking enabled for disarming a glitter bomb
        jobRequired = true,
        jobs = {
            {
                id = "police",
                -- does job checking include the jobs duty status
                duty = true,
                -- the minigum grade required in order to do the job
                minGrade = 0
            }
        }
    },
}
