return {
    RestoreHealth = false,           -- you already have this
    Health = 155,                   -- KO health threshold (your existing setting)
    KnockoutTime = 10,              -- seconds (your existing setting)

    -- NEW: fist damage settings
    FistDamage = {
        enabled = true,
        multiplier = 0.30,          -- 1.0 = default. 1.25 = +25% damage, 0.75 = -25%
        disableWhileKnockedOut = false
    }
}
