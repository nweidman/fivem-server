Config = {}
Config.Weapons = {}

Config.CheckVersion = false --Checks if you are running the latest version of the script. Prits on console and logs it in Master Logs.

Config.Framework = "QBCORE" --Set this to your framework. "ESX" - "QBCORE" - "QBOX - "NONE"

Config.Debug = false --Enables/Disables debug mode

Config.AimingCheckType = "flag" -- "default" or "flag", default still shows crosshair while no ammo, flag hides crosshair while no ammo
--If the system doesn't work with "default" revert to "flag" (This happens only in rare case servers where animations have been blocked)

Config.Crosshair = {
    Enabled = true, --Enables/Disables crosshair
    UseCrosshairCommand = true, --Enables/Disables crosshair command
    CrosshairCommand = "crosshair", --Command to toggle crosshair
    UseResetCrosshairCommand = false, --Enables/Disables reset crosshair command
    ResetCrosshairCommand = "resetcrosshair", --Command to reset crosshair
    UseCopyCrosshairCommand = false, --Enables/Disables copy crosshair command
    CopyCrosshairCommand = "copycrosshair", --Command to copy crosshair
    EnableCrosshairEditor = true, --Enables/Disables crosshair editor
    DisableOnFootFirstPerson = false, --Disables crosshair when in first person on foot
    DisableOnVehicleFirstPerson = false, --Disables crosshair when in first person inside a vehicle
    Presets = {
        {
            Name = "Preset 2",
            OuterLineOffset = 8,
            CenterDotSize = 2,
            CenterDotType = "dot",
            OuterLineThickness = 2,
            OutlineOpacity = 1,
            ShowOuterLines = true,
            ShowOutline = true,
            RecoilCompensationEnabled = true,
            OutlineThickness = 1,
            CrosshairColor = "#01f92a",
            OutlineColor = "#000000",
            ShowCenterDot = true,
            CrosshairOpacity = 1,
            OuterLineLength = 4,
            LineType = '3'
        },
        {
            Name = "Preset 1",
            OuterLineOffset = 8,
            CenterDotSize = 3,
            CenterDotType = "dot",
            OuterLineThickness = 1,
            OutlineOpacity = 1,
            ShowOuterLines = false,
            ShowOutline = true,
            RecoilCompensationEnabled = false,
            OutlineThickness = 1,
            CrosshairColor = "#FFFFFF",
            OutlineColor = "#030303",
            ShowCenterDot = true,
            CrosshairOpacity = 1,
            OuterLineLength = 1,
            LineType = '4'
        },
        {
            Name = "Preset 3",
            OuterLineOffset = 17,
            CenterDotSize = 2,
            CenterDotType = "square",
            OuterLineThickness = 2,
            OutlineOpacity = 1,
            ShowOuterLines = true,
            ShowOutline = true,
            RecoilCompensationEnabled = true,
            OutlineThickness = 1,
            CrosshairColor = "#ccda07",
            OutlineColor = "#000000",
            ShowCenterDot = true,
            CrosshairOpacity = 1,
            OuterLineLength = 6,
            LineType = '4'
        },
        {
            Name = "Preset 4",
            OuterLineOffset = 6,
            CenterDotSize = 3,
            CenterDotType = "square",
            OuterLineThickness = 2,
            OutlineOpacity = 1,
            ShowOuterLines = true,
            ShowOutline = true,
            RecoilCompensationEnabled = true,
            OutlineThickness = 1,
            CrosshairColor = "#f344cd",
            OutlineColor = "#000000",
            ShowCenterDot = false,
            CrosshairOpacity = 1,
            OuterLineLength = 4,
            LineType = '4'
        },
        {
            Name = "Preset 5",
            OuterLineOffset = 12,
            CenterDotSize = 3,
            CenterDotType = "dot",
            OuterLineThickness = 2,
            OutlineOpacity = 1,
            ShowOuterLines = false,
            ShowOutline = true,
            RecoilCompensationEnabled = true,
            OutlineThickness = 2,
            CrosshairColor = "#01f92a",
            OutlineColor = "#f2f2f2",
            ShowCenterDot = true,
            CrosshairOpacity = 0,
            OuterLineLength = 6,
            LineType = '4'
        }
    }
}

Config.JumpSpamPrevention = {
    Enabled = true, --Enables/Disables jump spam prevention
    TimeBetweenJumps = 1250, --Time between jumps in milliseconds
}

Config.RemoveWhipping = false --Removes the whipping animation when aiming with a weapon

Config.RemoveHeadShots = false --Removes headshots

Config.RollPrevention = false --Enables/Disables roll prevention

Config.MeleeOneShotPrevention = {
    Enabled = false, --Enables/Disables melee one shot prevention / REQUIRES Config.AimingCheckType = "flag"!
    UseSmartDetectionMethod = false, --Enables/Disables smart one shot prevention. THIS CAN POSSIBLY STOP AIMING CHECKS FOR OTHER RESOURCES!
    UseReviveMethod = false, --Enables/Disables revive method (requires framework. Also check frameworks.lua)
}

Config.ViewCamForcer = {
    EnabledFoot = false, --Enables/Disables view cam on foot
    DefaultViewCamOnFoot = 0, --0 Third Person, 4 = First Person
    FirstPersonShooting = false, --Enables/Disables forced first person shooting
    RestoreViewCamOnAimStop = false, --Restores view cam when aiming stops
    EnabledVehicle = false, --Enables/Disables view cam
    EnabledFirstPersonVehicleShooting = false, --Enables/Disables forced first person shooting
    RestoreVehicleViewCamOnAimStop = true, --Restores view cam when aiming stops
}

Config.WeaponSettings = {
    RecoilSystem = {
        Enabled = true, --Enables/Disables recoil system
        UseRightLeftRecoil = true, --Enables/Disables right left recoil
        UseVehicleRecoil = true, --Enables/Disables vehicle recoil
        UseScreenExplosions = false, --Enables/Disables screen explosions
        ScreenExplosionsMultiplier = 1.0, --Screen explosions multiplier
        UseGripMultipliers = true, --Enables/Disables grip multiplier
        UseSuppressorMultipliers = true, --Enables/Disables suppressor multiplier
        UseFirstPersonRecoilMultiplier = true, --Enables/Disables first person recoil multiplier
        FirstPersonRecoilMultiplier = 0.8 --Recoil multiplier for first person
    },

    TemperatureSystem = {
        Enabled = false, --Enables/Disables temperature system
        UseSmokeEffects = false, --Enables/Disables smoke effects   
    },
    
    UseJammingSystem = false, --Enables/Disables jamming system
    UseCustomWeaponDamages = true, --Enables/Disables custom weapon damages
}

Config.Triggerbot = {
    Enabled = false, --Enables/Disables triggerbot, this only allows the code to be registered and usable.
    EnabledOnStart = false, --Enables triggerbot on resource start
    MaxRange = 100.0, --Max range for triggerbot
    RefreshRate = 0, --Refresh rate for triggerbot
    UseTriggerbotToggleCommand = false, --Enables/Disables triggerbot command
    TriggerbotCommand = "triggerbot", --Command to toggle triggerbot
}