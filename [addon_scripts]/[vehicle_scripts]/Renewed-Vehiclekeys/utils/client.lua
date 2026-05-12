local utils = {}
local vehicleKeys = {}

local vehicleClasses = {
    [0] = "Compact Car",
    [1] = "Sedan",
    [2] = "SUV",
    [3] = "Coupe",
    [4] = "Muscle Car",
    [5] = "Sports Car",
    [6] = "Sports Car",
    [7] = "Super Car",
    [8] = "Motorcycle",
    [9] = "Off-road Vehicle",
    [10] = "Industrial Vehicle",
    [11] = "Utility Vehicle",
    [12] = "Van",
    [13] = "Bicycle",
    [14] = "Boat",
    [15] = "Helicopter",
    [16] = "Plane",
    [17] = "Service Vehicle",
    [18] = "Emergency Vehicle",
    [19] = "Military Vehicle",
    [20] = "Commercial Vehicle",
    [21] = "Train"
}

vehicleColors = {
    [0] = "Black",
    [12] = "Black",
    [147] = "Black", 
    [1] = "Black", 
    [11] = "Black", 
    [2] = "Dark Gray", 
    [3] = "Dark Gray",
    [4] = "Silver",
    [5] = "Silver", 
    [6] = "Silver", 
    [7] = "Silver", 
    [8] = "Silver", 
    [9] = "Silver", 
    [10] = "Silver",
    [13] = "Gray",
    [14] = "Light Gray",
    [27] = "Red", 
    [28] = "Red", 
    [29] = "Red", 
    [150] = "Red", 
    [30] = "Red", 
    [31] = "Dark Red", 
    [32] = "Dark Red", 
    [33] = "Dark Red", 
    [34] = "Dark Red", 
    [39] = "Red",
    [40] = "Dark Red",
    [143] = "Wine Red", 
    [35] = "Red", 
    [135] = "Pink", 
    [137] = "Pink", 
    [136] = "Pink", 
    [36] = "Orange",
    [38] = "Orange",
    [41] = "Orange",
    [138] = "Orange", 
    [99] = "Gold", 
    [90] = "Bronze",
    [88] = "Yellow",
    [42] = "Yellow", 
    [89] = "Yellow",
    [91] = "Lime", 
    [128] = "Green",
    [49] = "Dark Green", 
    [50] = "Dark Green",
    [51] = "Sea Green",
    [52] = "Olive Green", 
    [53] = "Green", 
    [54] = "Cyan", 
    [92] = "Green", 
    [55] = "Green",
    [151] = "Dark Green",
    [152] = "Olive",
    [141] = "Dark Blue",
    [84] = "Dark Blue",
    [61] = "Dark Blue",
    [62] = "Dark Blue", 
    [63] = "Blue",
    [64] = "Blue",
    [83] = "Blue",
    [65] = "Blue", 
    [66] = "Blue", 
    [67] = "Light Blue",
    [68] = "Blue", 
    [69] = "Blue",
    [73] = "Blue", 
    [70] = "Blue", 
    [74] = "Blue", 
    [82] = "Dark Blue",
    [96] = "Brown",
    [101] = "Brown",
    [95] = "Brown",
    [94] = "Brown",
    [97] = "Brown",
    [103] = "Brown",
    [104] = "Brown",
    [98] = "Brown",
    [100] = "Moss Green",
    [102] = "Tan",
    [99] = "Tan",
    [105] = "Tan",
    [106] = "Tan",
    [71] = "Purple",
    [148] = "Purple",
    [72] = "Purple",
    [142] = "Purple",
    [149] = "Dark Purple",
    [145] = "Purple",
    [154] = "Desert Tan",
    [155] = "Dark Earth",
    [107] = "Cream",
    [111] = "Ice White",
    [131] = "Ice White",
    [112] = "Frost White",
    [117] = "Silver",
    [118] = "Silver",
    [119] = "Silver",
    [158] = "Gold",
    [159] = "Gold",
    [161] ="Anodized Red",
	[162] ="Anodized Wine",
	[163] ="Anodized Purple",
	[164] ="Anodized Blue", 
	[165] ="Anodized Green",
	[166] ="Anodized Lime",
	[167] ="Anodized Copper",
	[168] ="Anodized Bronze",
	[169] ="Anodized Champagne",
	[170] ="Anodized Gold", 
	[171] ="Green/Blue Flip",
	[172] ="Green/Red Flip", 
	[173] ="Green/Brown Flip",
	[174] ="Green/Turqoise Flip", 
	[175] ="Green/Purple Flip",
	[176] ="Teal/Purple Flip", 
	[177] ="Turqoise/Red Flip", 
	[178] ="Turqoise/Purple Flip",
	[179] ="Cyan/Purple Flip", 
	[180] ="Blue/Pink Flip", 
	[181] ="Blue/Green Flip", 
	[182] ="Purple/Red Flip", 
	[183] ="Pruple/Green Flip", 
	[184] ="Magenta/Green Flip", 
	[185] ="Magenta/Yellow Flip", 
	[186] ="Burgundy/Green Flip", 
	[187] ="Magenta/Cyan Flip", 
	[188] ="Copper/Purple Flip", 
	[189] ="Magenta/Orange Flip",
	[190] ="Red/Orange Flip", 
	[191] ="Orange/Purple Flip",
	[192] ="Orange/Blue Flip", 
	[193] ="White/Purple Flip",
	[194] ="Red/Rainbow Flip", 
	[195] ="Blue/Rainbow Flip",
	[196] ="Dark Green Pearl", 
	[197] ="Dark Teal Pearl",
	[198] ="Dark Blue Pearl", 
	[199] ="Dark Purple Pearl",
	[200] ="Oil Slick Pearl", 
	[201] ="Light Green Pearl", 
	[202] ="Light Blue Pearl", 
	[203] ="Light Purple Pearl",
	[204] ="Light Pink Pearl", 
	[205] ="Off White Pearl", 
	[206] ="Pink Pearl", 
	[207] ="Yellow Pearl", 
	[208] ="Green Pearl", 
	[209] ="Blue Pearl", 
	[210] ="Cream Pearl", 
	[211] ="White Prismatic", 
	[212] ="Graphite Prismatic", 
	[213] ="Dark Blue Prismatic", 
	[214] ="Dark Purple Prismatic", 
	[215] ="Hot Pink Prismatic", 
	[216] ="Dark Red Prismatic", 
	[217] ="Dark Green Prismatic", 
	[218] ="Black Prismatic", 
	[219] ="Black Oil Spill", 
	[220] ="Black Rainbow", 
	[221] ="Black Holographic", 
	[222] ="White Holographic", 
	[223] ="Monochrome",
	[224] ="Night / Day", 
	[225] ="Verlierer 2", 
	[226] ="Sprunk Extreme", 
	[227] ="Vice City",
	[228] ="Synthwave", 
	[229] ="Four Seasons", 
	[230] ="Maisonette 9 Throwback",
	[231] ="Bubblegum", 
	[232] ="Full Rainbow",
	[233] ="Sunsets", 
	[234] ="The Seven", 
	[235] ="Kamen Rider", 
	[236] ="Chrome Abberation",
	[237] ="Its Christmas",
	[238] ="Temperature", 
	[239] ="Haos Special Works",
	[240] ="Electro",
	[241] ="Monika", 
	[242] ="Fubuki",
    [15] ="Black",
    [16] ="Black",
    [17] ="Gray",
    [18] ="Silver",
    [19] ="Dark blue",
    [20] ="Blue",
    [21] ="Black",
    [22] ="Black",
    [23] ="Gray",
    [24] ="Silver",
    [25] ="Blue",
    [26] ="Blue",
    [37] ="Tan",
    [43] ="Red",
    [44] ="Red",
    [45] ="Red",
    [46] ="Red",
    [47] ="Red/Orange",
    [48] ="Dark Red",
    [56] ="Green",
    [57] ="Green",
    [58] ="Green",
    [59] ="Green",
    [60] ="Teal",
    [75] ="Blue",
    [76] ="Blue",
    [77] ="Blue",
    [78] ="Blue",
    [79] ="Blue",
    [80] ="Blue",
    [81] ="Blue",
    [85] ="Blue",
    [86] ="Blue",
    [87] ="Blue",
    [93] ="Gray",
    [108] ="Brown",
    [109] ="Brown",
    [110] ="Tan",
    [113] ="Gray",
    [114] ="Brown",
    [115] ="Black",
    [116] ="Brown",
    [120] ="Silver",
    [121] ="White",
    [122] ="White",
    [123] ="Orange",
    [124] ="Orange",
    [125] ="Green",
    [126] ="Yellow",
    [127] ="Blue",
    [129] ="Brown",
    [130] ="Orange",
    [132] ="White",
    [134] ="White",
    [139] ="Green",
    [140] ="Blue",
    [146] ="Black",
    [153] ="Brown",
    [156] ="Silver",
    [157] ="Blue",
    [160] ="Yellow",
}

local Config = require 'data'

function utils.formatPlate(plate)
    local plateType = type(plate)

    if plateType == 'string' then
        return plate:gsub('%s', ''):upper()
    elseif plateType == 'number' then
        if DoesEntityExist(plate) then
            return utils.formatPlate(GetVehicleNumberPlateText(plate))
        else
            lib.print.error(('Recived entity %s but does not exsist'):format(plate))
        end
    end
end


local keyRing = GetConvarInt('vehiclekeys_keyring', 0) == 1

--- Returns the entity from a netId
---@param plate string
---@return boolean
function utils.hasKey(plate)
    plate = utils.formatPlate(plate)


    if Config.useKeyItem then
        if keyRing then
            return lib.callback.await('Renewed-Vehiclekeys:server:hasKey', false, plate)
        else
            return exports.ox_inventory:GetItemCount('vehiclekey', { plate = plate }, true) > 0
        end
    end

    return vehicleKeys[plate]
end exports('hasKey', utils.hasKey)

function utils.setKeys(Keys)
    if not Config.useKeyItem and Keys and next(Keys) then
        vehicleKeys = Keys
    end
end

--- Sets the engine status of a vehicle and returns the new status
---@param vehicle number
---@return boolean
function utils.setEngineStatus(vehicle)
    if not vehicle then return false end

    local engineStatus = GetIsVehicleEngineRunning(vehicle)

    SetVehicleUndriveable(vehicle, not engineStatus)
    SetVehicleNeedsToBeHotwired(vehicle, false)

    if GetPedInVehicleSeat(vehicle, -1) > 0 then
        SetVehicleEngineOn(vehicle, engineStatus, false, true)
    else
        SetVehicleEngineOn(vehicle, engineStatus, true, true)
    end

    return engineStatus
end

--- Returns weather or not the player is allowed to lockpick this vehicle
---@param vehicle number
---@return boolean
function utils.canLockpick(vehicle)
    return true
end

--- Get the amount of peds inside of a vehicle
---@param vehicle number
---@return table
function utils.getPedsInCar(vehicle)
    local Peds = {}
    local pedAmt = 0

    if vehicle then
        for seat = -1, GetVehicleModelNumberOfSeats(GetEntityModel(vehicle)) - 2 do
            local pedInSeat = GetPedInVehicleSeat(vehicle, seat)

            if pedInSeat > 0 and not IsPedAPlayer(pedInSeat) then
                pedAmt += 1
                Peds[pedAmt] = pedInSeat
            end
        end
    end

    return Peds
end

function utils.getClosestKeyCar()
    local vehicles = lib.getNearbyVehicles(GetEntityCoords(cache.ped), 15)

    local closestKeyCar
    local closestKeyCoords = 15

    if not cache.vehicle then
        for i = 1, #vehicles do
            local vehicle = vehicles[i]
            local plate = GetVehicleNumberPlateText(vehicle.vehicle)
            local dist = #(GetEntityCoords(cache.ped) - GetEntityCoords(vehicle.vehicle))
            local class = GetVehicleClass(vehicle.vehicle)

            if not Config.vehicles[class].noLocks and dist <= closestKeyCoords then
                if HasEntityClearLosToEntityInFront(cache.ped, vehicle.vehicle) then
                    if utils.hasKey(plate) then
                        closestKeyCar = vehicle.vehicle
                        closestKeyCoords = dist
                    end
                end
            end
        end
    end

    return closestKeyCar
end

--- Makes allt he ped flee within that vehicle
---@param vehicle number
function utils.pedFlee(vehicle)
    local peds, amount = utils.getPedsInCar(vehicle)

    if amount == 0 then return end

    for i = 1, #peds do
        local pedInSeat = peds[i]
        TaskLeaveVehicle(pedInSeat, vehicle, 0)
        PlayPain(pedInSeat, 6, 0)
        Wait(1000)
        ClearPedTasksImmediately(pedInSeat)
        PlayPain(pedInSeat, math.random(7, 8), 0)
        SetPedFleeAttributes(pedInSeat, 0, 0)
        TaskReactAndFleePed(pedInSeat, cache.ped)
    end
end

---Displays TextUI on the players screen
---@param text string
function utils.textUi(text)
    lib.showTextUI(text, {
        position = 'left-center',
    })
end

function utils.hideTextUi()
    lib.hideTextUI()
end

function utils.notify(message, type)
    -- lib.notify({
    --     description = message,
    --     type = type
    -- })
    TriggerEvent('QBCore:Notify', message, type, 5000)
end


--- Returns true/false depending if the player completed the skillcheck
---@param circles number
---@param time number
---@return boolean?
function utils.lockpickGame(circles, time)
    local game = {}

    for i = 1, circles do
        game[i] = {areaSize = math.random(time, math.ceil(time * 1.5)), speedMultiplier = 1}
    end

    return lib.skillCheck(game, Config.keys)
end

--- Returns true/false depending if the player completed the skillcheck
---@param circles number
---@param time number
---@return boolean?
function utils.hotwireMinigame(circles, time)
    local game = {}

    for i = 1, circles do
        game[i] = {areaSize = math.random(time, math.ceil(time * 1.5)), speedMultiplier = 1}
    end

    return lib.skillCheck(game, Config.keys)
end

function utils.stateBagWrapper(keyFilter, cb)
    return AddStateBagChangeHandler(keyFilter, '', function(bagName, _, value, _, replicated)
        local netId = tonumber(bagName:gsub('entity:', ''), 10)

        local loaded = netId and lib.waitFor(function()
            if NetworkDoesEntityExistWithNetworkId(netId) then return true end
        end, 'Timeout while waiting for entity to exist', 3500)

        local entity = loaded and NetToVeh(netId)

        if entity and not replicated then
            cb(entity, value)
        end
    end)
end

---Alerts the police that the player is stealing or lockpicking a vehicle
---@param vehicle number EntityId
local function IsInNoDispatchVehicleZone(coords)
    local blockedZones = {
        { coords = vector3(4994.1411, -5113.1938, 2.5342), radius = 1500.0}, -- CAYO
    }

    for i = 1, #blockedZones do
        local zone = blockedZones[i]
        if #(coords - zone.coords) <= zone.radius then
            return true
        end
    end

    return false
end

function utils.alertLockpick(vehicle)
    if cache.seat == -1 then 
        local data = exports['cd_dispatch']:GetPlayerInfo()
        if not data or not data.coords then return end

        if IsInNoDispatchVehicleZone(data.coords) then
            return
        end

        local vehicleClass = GetVehicleClass(vehicle)
        local primaryColor, secondaryColor = GetVehicleColours(vehicle)
        
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police', 'sheriff'}, 
            coords = data.coords,
            title = '10-16 - Vehicle Robbery',
            message = 'A '..data.sex..' is stealing a '..tostring(vehicleColors[primaryColor])..' '..tostring(vehicleClasses[vehicleClass])..' ('..GetVehicleNumberPlateText(vehicle)..') at '..data.street, 
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 326, 
                scale = 1.2, 
                colour = 6,
                flashes = false, 
                text = '911 - Vehicle Robbery',
                time = 2,
                radius = 0,
            }
        })
    else
        -- Alert the police they are lockpicking a vehicle door
    end
end

---Alerts the police that the player is hotwiring a vehicle
---@param vehicle number EntityId
function utils.alertHotwire(vehicle)
    -- Alert the police that im hotwiring a vehicle
    local data = exports['cd_dispatch']:GetPlayerInfo()
        local vehicleClass = GetVehicleClass(vehicle)
        local primaryColor, secondaryColor = GetVehicleColours(vehicle)
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police', 'sheriff'}, 
            coords = data.coords,
            title = '10-16 - Vehicle Robbery',
            message = 'A '..data.sex..' is stealing a '..tostring(vehicleColors[primaryColor])..' '..tostring(vehicleClasses[vehicleClass])..' ('..GetVehicleNumberPlateText(vehicle)..') at '..data.street, 
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 326, 
                scale = 1.2, 
                colour = 6,
                flashes = false, 
                text = '911 - Vehicle Robbery',
                time = 2,
                radius = 0,
            }
        })
end

---Alerts the police that the player is stealing a vehicle
---@param vehicle number EntityId
---@param ped number EntityId of the ped thats getting stolen from
function utils.alertVehicleTheft(vehicle, ped)
    -- print(vehicle, ped)
    -- Alert the police that im stealing a vehicle
    local data = exports['cd_dispatch']:GetPlayerInfo()
        local vehicleClass = GetVehicleClass(vehicle)
        local primaryColor, secondaryColor = GetVehicleColours(vehicle)
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police', 'sheriff'}, 
            coords = data.coords,
            title = '10-16 - Vehicle Robbery',
            message = 'A '..data.sex..' is stealing a '..tostring(vehicleColors[primaryColor])..' '..tostring(vehicleClasses[vehicleClass])..' ('..GetVehicleNumberPlateText(vehicle)..') at '..data.street, 
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 326, 
                scale = 1.2, 
                colour = 6,
                flashes = false, 
                text = '911 - Vehicle Robbery',
                time = 2,
                radius = 0,
            }
        })
end

return utils