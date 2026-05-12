Config = {}

-- Ped settings (you can add more locations later if you want multiple doctors)
Config.Ped = {
    model   = "mp_f_meth_01",               -- string is OK
    coords  = vec3(955.7090, -1144.6442, 26.5007),
    heading = 83.8158,
    scenario = 'WORLD_HUMAN_CLIPBOARD',
    targetLabel = 'Open Treatment Menu',
    targetIcon  = 'fa-solid fa-briefcase-medical',
    targetDist  = 2.2
}

Config.UseDoctorCoords = true

-- Distance for the "Treat nearby patient" option (meters)
Config.SearchRadius = 5.0

-- Seconds for the healing progress (also used to delay the revive call)
Config.HealWaitTime = 6

-- Allow self-revive when downed
Config.AllowSelfRevive = true

-- Money & payout settings
Config.Economy = {
    moneyType = 'cash',     -- 'cash' or 'bank'
    payDoctor = false,       -- give the doctor (caller) a cut of the fee
    doctorCut = 1.0,        -- 1.0 = 100%, 0.5 = 50%, etc.
}

-- Cost configuration
Config.PayAmount = {
    Self          = 2500,  -- when self-reviving
    Isdead        = 2000,  -- when patient status == isDead
    IsInlaststand = 1500,  -- when patient status == isInlaststand
}

-- Which client event actually revives the player (change for your setup)
Config.ReviveEvent = 'hospital:client:Revive'

-- Strings
Config.Lang = {
    DR_RECOVERING = 'Recovering...',
    NO_PLAYERS_NEED_HEAL = 'No players need healing right now.',
    COST = 'Cost',
    HEAL_PLAYERS = 'Treatable patients',
    PAID_FAIL = 'Patient cannot afford treatment.',
    PAID_OK = 'Treatment paid. Begin recovering...',
    YOU_PAID = 'You paid for treatment.',
    YOU_EARNED = 'You received payment for treatment.',
    NOT_DOWN = 'Patient is not down anymore.',
}
