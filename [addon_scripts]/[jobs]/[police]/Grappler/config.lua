-- Please read our documentation found at https://docs.londonstudios.net

main = {
    frameRotation = 115,
    rotationRate = 2.0, -- This is a multiplier, therefore, 1.0 = base speed, 2.0 = double speed, 0.5 = half speed etc...
    burstTyre = true,
    burstTyreLevel = 700,
    developerMode = false,
    rope = {
        defaultLength = 10.0,
        maxLength = 12.0,
        type = 2,
    },
    forceHandbrake = {
        enabled = true,
        timeToForceHandbrake = 2,
        maxSpeedAfterHandbrake = 10 -- IN MPH
    },
    disableVehicleOnGrapple = false,
    radiusToAttachToVehicle = 2, -- Set this higher if issues with connecting to back tyre
    checkForUndeletedObjects = false, -- Experimental, please leave this disabled unless advised otherwise by a member of our staff
    checkDistance = 100.0,
    grapplerInstallDistance = 10.0,
    enableEvents = true, -- This enables events to allow integration with third party resources, seen in cl_utils.lua
}

-- This is the configuration section for vehicles which the grappler can be setup and deployed on
-- The name is a description of the vehicle and is mainly used for logging purposes
vehicles = {
    [`onx_polscout`] = { -- LSPD Vapid Scout
        name = "LSPD Vapid Scout",
        boneName = "engine",
        offSet = {0.0, 1.02, -0.4},
        rotation = {0.0, 0.0, 0.0},
    },
    [`onx_polbuff`] = { -- LSPD Buffalo
        name = "LSPD Buffalo",
        boneName = "engine",
        offSet = {0.0, 1.05, -0.4},
        rotation = {0.0, 0.0, 0.0},
    },
    [`onx_poltulip`] = { -- LSPD Tulip M-100
        name = "LSPD Tulip M-100",
        boneName = "engine",
        offSet = {0.0, 0.85, -0.1},
        rotation = {0.0, 0.0, 0.0},
    },
    [`onx_polregent`] = { -- LSPD Regent
        name = "LSPD Regent SSV",
        boneName = "engine",
        offSet = {0.0, 1.07, -0.45},
        rotation = {0.0, 0.0, 0.0},
    },
    [`onx_polbison4`] = { -- LSPD Bravado Bison Transport
        name = "LSPD Bravado Bison Transport",
        boneName = "engine",
        offSet = {0.0, 1.1, -0.25},
        rotation = {0.0, 0.0, 0.0},
    },
    [`onx_polbison3`] = { -- LSPD Bravado Bison
        name = "LSPD Bravado Bison",
        boneName = "engine",
        offSet = {0.0, 1.1, -0.25},
        rotation = {0.0, 0.0, 0.0},
    },
    [`onx_polterm`] = { -- LSPD Canis Terminus
        name = "LSPD Canis Terminus",
        boneName = "engine",
        offSet = {0.0, 0.85, -0.4},
        rotation = {0.0, 0.0, 0.0},
    },
    [`onx_polbuffhf`] = { -- LSPD Buffalo Hellfire
        name = "LSPD Buffalo Hellfire",
        boneName = "engine",
        offSet = {0.0, 1.05, -0.4},
        rotation = {0.0, 0.0, 0.0},
    },
    [`onx_polsandxl`] = { -- LSPD Vapid Sandstorm XL
        name = "LSPD Vapid Sandstorm XL",
        boneName = "engine",
        offSet = {0.0, 1.2, -0.4},
        rotation = {0.0, 0.0, 0.0},
    },
    [`onx_poldorado2`] = { -- LSPD Bravado Dorado
        name = "LSPD Bravado Dorado",
        boneName = "engine",
        offSet = {0.0, 1.05, -0.5},
        rotation = {0.0, 0.0, 0.0},
    },
}

-- This is the configuration section for the /grappler command
-- Uses: /grappler install, /grappler deploy, /grappler remove and /grappler remove
grapplerCommand = {
    enabled = false,
    commandName = "grappler",
    install = "install",
    deploy = "deploy",
    remove = "remove",
    reset = "reset",
}

Inventory = {
    itemName = "grappler",
    oxInventory = true,
    quasarInventory = false,
    coreInventory = false,
    ESX = false,
    vRP = false,
    qbCore = false,
}

Notifications = {
    Enabled = true,
    Framework = {
        QBCore = false, 
        QBX = true,
        ESX = false,
        vRP = false, 
        okok = false, -- https://okok.tebex.io/package/4724993
    }
}

Permissions = {
    EnablePermissions = false,
    AcePermissions = {
        Enabled = false,
        -- This enables ace permissions on the grappler command
    },
    -- We've added ESX integration. All you need to do is enable it below and configure which jobs can use the command
    ESX = {
        Enabled = false,
        CheckJob = {
            Enabled = false, -- Enable this to use ESX job check
            Jobs = {"police"} -- A user can have any of the following jobs, allowing you to add multiple
        }
    },
    -- We've added vRP integration. All you need to do is enable it below. Then, configure if you wish to check for groups or permissions, or even both
    vRP = {
        Enabled = false,
        CheckGroup = {
            Enabled = false, -- Enable this to use vRP group check
            Groups = {"police"}, -- A user can have any of the following groups, meaning you can add different jobs
        },
        CheckPermission = {
            Enabled = false, -- Enable this to use vRP permission check
            Permissions = {"police"} -- A user can have any of the following permissions, allowing you to add multiple
        },
    },
    -- We've added QBCore integration. All you need to do is enable it below. Then, configure if you wish to check for jobs or permissions, or even both
    QBCore = {
        Enabled = false,
        CheckJob = {
            Enabled = true, -- Enable this to use QBCore job check
            Jobs = {"police"}, -- A user can have any of the following jobs, meaning you can add different jobs
        },
        CheckPermission = {
            Enabled = true, -- Enable this to use QBCore permission check
            Permissions = {"police"}, -- A user can have any of the following permissions, allowing you to add multiple
        },
    },
    QBX = {
        Enabled = true,
        CheckJob = {
            Enabled = true, -- Enable this to use QBX job check
            Jobs = {"police"}, -- A user can have any of the following jobs, meaning you can add different jobs
        }
    },
}

-- https://docs.fivem.net/docs/game-references/controls/
useGrapplerDeployKey = true
deployGrapplerKey = {0, 246} -- By default this is set to Y
-- The first number is the control group and the second is the control

grapplerSound = { -- https://pastebin.com/DCeRiaLJ
    enabled = true,
    soundName = "Activate_Trap",
    soundDict = "DLC_AW_Trap_Controller_Sounds",
}

-- This allows you to enable Discord logging for the grappler
-- You must add your webhook in sv_utils.lua
logging = {
    enabled = true,
    displayName = "Grappler",
    colour = 31487,
    title = "**New Log**",
    icon = "https://i.imgur.com/n3n7JNW.png",
    footerIcon = "https://i.imgur.com/n3n7JNW.png",
    dateFormat = "%d-%m-%Y %H:%M:%S", -- Day-Month-Year Hour-Minute-Second
}

-- This section allows you to translate the resource into another language
translations = {
    noPermission = "You do not have permission to access this command.",
    invalidGrapplerArguments = "Invalid command arguments.",
    inVehicle = "You must not be in a vehicle.",
    noVehicleFound = "No vehicle found.",
    vehicleNotAllowed = "This vehicle does not support grapplers.",
    cannotPerformAction = "You are unable to perform that action.",
    drivingVehicle = "You must be driving a vehicle to deploy.",
    installedGrappler = "Installed Grappler",
    deployedGrappler = "Deployed Grappler",
    removedGrappler = "Removed Grappler",
    usedGrappler = "Used Grappler on Vehicle",
    vehicle = "Vehicle: ",
    grapplerCommandHelp = "Install and Deploy a Police Grappler",
    grapplerCommandParameterOne = "Action",
    grapplerCommandParameterOneHelp = "install/deploy/reset/remove",
    installed = "Grappler installed.",
    removed = "Grappler removed.",
    deployed = "Grappler deployed.",
    reset = "Grappler reset.",
    noItem = "You must have the item",
}

animation = {
    enabled = true,
    dict = "mini@repair",
    name = "fixing_a_ped"
}

-- This section allows you to configure vehicle wheel bones that the grappler will deploy onto
wheelBones = {
    ["wheel_lr"] = {
        offSet = {0.0, 0.0, 0.0},
        rotation = {0.0, 0.0, 0.0},
    },
    ["wheel_rr"] = {
        offSet = {0.0, 0.0, 0.0},
        rotation = {0.0, 0.0, 0.0},
    },
}

-- These are the props used by the resource.
-- We do not recommend editing this section
props = {
    bumperClosed = `bv_bumper_closed`,
    bumperReady = `bv_bumper_a`,
    bumperDeployed = `bv_bumper_b`,
    frameReady = `bv_frame_a`,
    frameDeployed = `bv_frame_b`,
    wheelBlock = `bv_wheelblock`,
}