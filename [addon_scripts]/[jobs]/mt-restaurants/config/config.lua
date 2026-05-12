Config = Config or {}

-- For more info check: https://mt-scripts-documentations.gitbook.io/mt-script-documentation/

Config.debug = false -- if true it'll print some debug on F8/console and active all zones debug
Config.framework = 'qbx' -- qb, qbx, esx (need to change the export on the Config.core)
Config.core = exports['qb-core']:GetCoreObject() -- Your core export (for qb is exports['qb-core']:GetCoreObject()) (for esx is exports.es_extended:getSharedObject()) (for qbx you can just delete this line and add '@qbx_core/modules/playerdata.lua', to the fxmanifest.lua client_scripts)
Config.target = 'ox_target' -- ox_target, qb-target, interact, ...
Config.inventory = 'ox_inventory' -- ox_inventory, qb-inventory, qb-inventory-old ... (Remember that only with ox_inventory you'll have the best usage of all script features!!)
Config.banking = 'qb-management' -- qb-banking, Renewed-Banking, (can change at server/functions.lua) ...
Config.keys = 'Renewed-Vehiclekeys' -- qb-vehiclekeys, qbx_vehiclekeys, Renewed-Vehiclekeys, ...

Config.imagesDirectory = 'nui://ox_inventory/web/images/%s.png'

Config.progressbarPos = 'middle' -- ox_lib progress bar position
Config.textuiPos = 'right-center' -- ox_lib textui position

Config.maxPreparesPerTime = 100 -- The max prepares players can do at a time

Config.useOxInventoryCraft = true -- If true it'll use the ox_inventory crafting system if false will use ox_lib context (only for ox_inventory otherwise will always use the context)

Config.toggleDutyZones = true -- If true the players duty will change on entering the restaurant zone

Config.offlineShopsUpdate = 5000 -- The interval beteween each update of the offline shops

Config.sitsGetUpKey = 38

Config.times = { -- The progress times for each action
    preparing = 2000,
    makeFood = 2000,
    eatFood = 4000,
    takeOrder = 5000,
}

Config.boxes = { -- Food boxes slots and weigth
    slots = 5,
    weigth = 50
}