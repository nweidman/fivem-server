DependantResources = {
    ['cd_dispatch3d'] = true,
    ['cd_doorlock'] = true,
    ['cd_eventcalendar'] = true,
    ['cd_garage'] = true,
    ['cd_mechanic'] = true,
    ['cd_vipshop'] = true,
}

local ConfigBeforeAutoDetect = {
    Framework = Cfg.Framework,
    Database = Cfg.Database,
    Banking = Cfg.Banking,
    Billing = Cfg.Billing,
    Dispatch = Cfg.Dispatch,
    DrawTextUI = Cfg.DrawTextUI,
    Duty = Cfg.Duty,
    Gang = Cfg.Gang,
    Inventory = Cfg.Inventory,
    Mechanic = Cfg.Mechanic,
    Notification = Cfg.Notification,
    PersistentVehicles = Cfg.PersistentVehicles,
    Phone = Cfg.Phone,
    Society = Cfg.Society,
    Target = Cfg.Target,
    TimeWeather = Cfg.TimeWeather,
    VehicleFuel = Cfg.VehicleFuel,
    VehicleKeys = Cfg.VehicleKeys,
    Cfg.VehicleShop
}

CurrentResourceName = GetCurrentResourceName()

local function running(res)
    return GetResourceState(res) == 'started' or GetResourceState(res) == 'starting'
end

local function detect(list, fallback)
    for _, res in ipairs(list) do
        if running(res) then
            return res
        end
    end
    return fallback
end

function RunAutoDetect()
    if Cfg.Framework == 'auto_detect' then
        if running('es_extended') then
            Cfg.Framework = 'esx'
        elseif running('qbx_core') then
            Cfg.Framework = 'qbox'
        elseif running('qb-core') then
            Cfg.Framework = 'qbcore'
        elseif running('vRP') then
            Cfg.Framework = 'vrp'
        else
            Cfg.Framework = 'standalone'
            if Cfg.BridgeDebug then
                Citizen.Trace(string.format('^1[cd_bridge INFO]^7 No supported framework detected — defaulting to %s.\n'), Cfg.Framework)
            end
        end
    end

    if Cfg.Database == 'auto_detect' then
        Cfg.Database = detect({
            'oxmysql',
            'ghmattimysql'
        }, 'none')
    end

    if Cfg.Banking == 'auto_detect' then
        local banking = detect({
            'esx_banking',
            'fd_banking',
            'okokBankingV2',
            'omes_banking',
            'p_banking',
            'ps-banking',
            'qb-banking',
            'Renewed-Banking',
            'RxBanking',
            'tgg-banking',
            'tgiann-bank'
        }, nil)
        if banking then
            Cfg.Banking = banking
        else
            if Cfg.Framework == 'esx' then
                Cfg.Banking = 'esx'
            elseif Cfg.Framework == 'qbcore' then
                Cfg.Banking = 'qbcore'
            else
                Cfg.Banking = 'none'
            end
            if Cfg.BridgeDebug then
                Citizen.Trace(string.format('^1[cd_bridge INFO]^7 No supported banking detected, defaulting to %s.\n', Cfg.Banking))
            end
        end
    end

    if Cfg.Billing == 'auto_detect' then
        Cfg.Billing = detect({
            'codem_billing',
            'esx_billing',
            'okokBilling'
        }, 'none')
    end

    if Cfg.Dispatch == 'auto_detect' then
        Cfg.Dispatch = detect({
            'cd_dispatch',
            'cd_dispatch3d',
            'codem-dispatch',
            'core_dispatch',
            'emergencydispatch',
            'lb-tablet',
            'origen_police',
            'ps-dispatch',
            'qs-dispatch',
            'rcore_dispatch',
            'tk_dispatch'
        }, 'none')
    end

    if Cfg.DrawTextUI == 'auto_detect' then
        Cfg.DrawTextUI = detect({
            'cd_drawtextui',
            'jg-textui',
            'ox_lib',
            'okokTextUI',
            'ps-ui',
            'tgiann-core',
            'vms_notifyv2',
            'ZSX_UIV2',
            'qb-core'
        }, 'none')
    end

    if Cfg.Duty == 'auto_detect' then
        Cfg.Duty = detect({
            'jobs_creator',
            'origen_police'
        }, 'none')
    end

    if Cfg.Gang == 'auto_detect' then
        Cfg.Gang = detect({
            'av_gangs',
            'rcore_gangs'
        }, 'none')
    end

    if Cfg.Hud == 'auto_detect' then
        Cfg.Hud = detect({
            'cd_playerhud',
            'Codem-BlackHUDV2',
            'esx_hud',
            'izzy-hudv5',
            'izzy-hudv6',
            'izzy-hudv7',
            'jg-hud',
            'mHud',
            'tgiann-lumihud',
            'vms_hud',
            'wais-hudv6',
            '0r-hud-v3',
            '17mov_Hud',
        }, 'none')
    end

    if Cfg.Inventory == 'auto_detect' then
        local inventory = detect({
            'ak47_inventory',
            'ak47_qb_inventory',
            'chezza-inventory',
            'codem-inventory',
            'core_inventory',
            'esx_inventory',
            'jaksam_inventory',
            'origen_inventory',
            'ox_inventory',
            'qs-inventory',
            'qb-inventory',
            'tgiann-inventory'
        }, nil)

        if inventory then
            Cfg.Inventory = inventory
            if Cfg.Inventory == 'chezza-inventory' then
                Cfg.Inventory = 'esx_inventory'
            end
            if Cfg.Inventory == 'ak47_qb_inventory' then
                Cfg.Inventory = 'ak47_inventory'
            end
        else
            if Cfg.Framework == 'esx' then
                Cfg.Inventory = 'esx_inventory'
            elseif Cfg.Framework == 'qbcore' then
                Cfg.Inventory = 'qb-inventory'
            elseif Cfg.Framework == 'qbox' then
                Cfg.Inventory = 'ox_inventory'
            else
                Cfg.Inventory = 'none'
            end
            if Cfg.BridgeDebug then
                Citizen.Trace(string.format('^1[cd_bridge INFO]^7 No supported inventory detected, defaulting to %s.\n', Cfg.Inventory))
            end
        end
    end

    if Cfg.Mechanic == 'auto_detect' then
        Cfg.Mechanic = detect({
            'cd_mechanic',
        }, 'none')
    end

    if Cfg.Notification == 'auto_detect' then
        local notif = detect({
            'cd_notifications',
            'codem-notification',
            'codem-supreme-notification',
            'mythic_notify',
            'okokNotify',
            'origen_notify',
            'ox_lib',
            'pNotify',
            'ps-ui',
            'rtx_notify',
            'tgiann-lumihud',
            'vms_notifyv2',
            'ZSX_UI',
            'ZSX_UIV2',
            '17mov_Hud',
        }, nil)

        if notif then
            Cfg.Notification = notif
        else
            if Cfg.Framework == 'esx' or Cfg.Framework == 'qbcore' or Cfg.Framework == 'qbox' then
                Cfg.Notification = Cfg.Framework
            else
                Cfg.Notification = 'chat'
            end
            if Cfg.BridgeDebug then
                Citizen.Trace(string.format('^1[cd_bridge INFO]^7 No supported notification detected — defaulting to %s.\n', Cfg.Notification))
            end
        end
    end

    if Cfg.PersistentVehicles == 'auto_detect' then
        Cfg.PersistentVehicles = detect({
            'cd_garage',
            'AdvancedParking'
        }, 'none')
    end

    if Cfg.Phone == 'auto_detect' then
        Cfg.Phone = detect({
            'esx_phone',
            'gcphone',
            'gksphone',
            'high-phone',
            'lb-phone',
            'npwd',
            'okokPhone',
            'qb-phone',
            'qbx_npwd',
            'qs-smartphone',
            'qs-smartphone-pro',
            'roadphone',
            'yseries',
            '17mov_Phone'
        }, 'none')
    end

    if Cfg.Society == 'auto_detect' then
        Cfg.Society = detect({
            'esx_society',
            'fd_banking',
            'okokBankingV2',
            'p_banking',
            'qb-banking',
            'Renewed-Banking',
            'RxBanking',
            'tgg-banking',
            'tgiann-bank'
        }, 'none')
    end

    if Cfg.Target == 'auto_detect' then
        Cfg.Target = detect({
            'ox_target',
            'qb-target'
        }, 'none')
    end

    if Cfg.TimeWeather == 'auto_detect' then
        Cfg.TimeWeather = detect({
            'cd_easytime',
            'vsync',
            'qb-weathersync'
        }, 'none')
    end

    if Cfg.VehicleFuel == 'auto_detect' then
        Cfg.VehicleFuel = detect({
            'BigDaddy-Fuel',
            'cdn-fuel',
            'esx-sna-fuel',
            'FRFuel',
            'lc_fuel',
            'LegacyFuel',
            'lj-fuel',
            'lyre_fuel',
            'mnr_fuel',
            'myFuel',
            'ND_Fuel',
            'okokGasStation',
            'ox_fuel',
            'ps-fuel',
            'qb-sna-fuel',
            'qs-fuelstations',
            'rcore_fuel',
            'Renewed-Fuel',
            'ti_fuel',
            'x-fuel',
            'qb-fuel',
        }, 'none')
    end

    if Cfg.VehicleKeys == 'auto_detect' then
        Cfg.VehicleKeys = detect({
            'ak47_qb_vehiclekeys',
            'ak47_vehiclekeys',
            'fast-vehiclekeys',
            'F_RealCarKeysSystem',
            'fivecode_carkeys',
            'is_vehiclekeys',
            'jc_vehiclekeys',
            'loaf_keysystem',
            'mk_vehiclekeys',
            'mm_carkeys',
            'MrNewbVehicleKeys',
            'mx_carkeys',
            'qs-vehiclekeys',
            'Renewed-Vehiclekeys',
            'stasiek_vehiclekeys',
            't1ger_keys',
            'tgiann-hotwire',
            'ti_vehicleKeys',
            'vehicles_keys',
            'wasabi_carlock',
            'xd_locksystem',
            'qbx_vehiclekeys',
            'qb-vehiclekeys',
        }, 'none')
    end

    if Cfg.VehicleShop == 'auto_detect' then
        Cfg.VehicleShop = detect({
            'cd_vehicleshop',
            'esx_vehicleshop',
            'jg-dealerships',
            'okokVehicleShop',
            'qb-vehicleshop',
            'qbx-vehicleshop',
            'qs-vehicleshop',
            'vms_vehicleshopv2',
        }, 'none')
    end

    -- Framework specific SQL table configurations
    if Cfg.Framework == 'esx' then
        Cfg.FrameworkSQLtables = {
            vehicle_table = 'owned_vehicles',
            vehicle_identifier = 'owner',
            vehicle_props = 'vehicle',
            users_table = 'users',
            users_identifier = 'identifier',
        }
    elseif Cfg.Framework == 'qbcore' then
        Cfg.FrameworkSQLtables = {
            vehicle_table = 'player_vehicles',
            vehicle_identifier = 'citizenid',
            vehicle_props = 'mods',
            users_table = 'players',
            users_identifier = 'citizenid',
        }
    elseif Cfg.Framework == 'qbox' then
        Cfg.FrameworkSQLtables = {
            vehicle_table = 'player_vehicles',
            vehicle_identifier = 'citizenid',
            vehicle_props = 'mods',
            users_table = 'players',
            users_identifier = 'citizenid',
        }
    elseif Cfg.Framework == 'other' then
        Cfg.FrameworkSQLtables = {
            vehicle_table = 'owned_vehicles',
            vehicle_identifier = 'owner',
            vehicle_props = 'vehicle',
            users_table = 'users',
            users_identifier = 'identifier',
        }
    end
    FW = Cfg.FrameworkSQLtables
end

local function DetectResourceStart(resourceName)
    if resourceName == 'cd_garage' then
        while GetResourceState('cd_garage') ~= 'started' do
            Wait(100)
        end
        local ok, config = pcall(function()
            return exports['cd_garage']:GetConfig()
        end)
        if ok and config ~= nil then
            if config.VehicleKeys.ENABLE then
                Cfg.VehicleKeys = 'cd_garage'
            end
            if config.PersistentVehicles.ENABLE then
                Cfg.PersistentVehicles = 'cd_garage'
            end
        end

    elseif resourceName == 'cd_dispatch' then
        Cfg.Dispatch = 'cd_dispatch'

    elseif resourceName == 'cd_dispatch3d' then
        Cfg.Dispatch = 'cd_dispatch3d'

    elseif resourceName == 'cd_mechanic' then
        Cfg.Mechanic = 'cd_mechanic'
    end
end

if IsDuplicityVersion() then
    AddEventHandler('onResourceStart', function(resourceName)
        DetectResourceStart(resourceName)
    end)
else
    AddEventHandler('onClientResourceStart', function(resourceName)
        DetectResourceStart(resourceName)
    end)
end

RunAutoDetect()

if ResourceName == 'cd_bridge' then
    local function redetectForResource(resName)
        local needsRedetect = false

        for key, value in pairs(Cfg) do
            if value == 'none' and ConfigBeforeAutoDetect and ConfigBeforeAutoDetect[key] ~= 'none' then
                needsRedetect = true
                break
            end
        end

        if not needsRedetect then return end

        if Cfg.BridgeDebug then
            ERROR('6754', 'Late resource detected: '..resName..' — re-running auto detect')
        end

        RunAutoDetect()
    end

    local function getConfigValuesForResource(resName)
        for key, value in pairs(Cfg) do
            if value == 'none' and ConfigBeforeAutoDetect and ConfigBeforeAutoDetect[key] == resName then
                return true
            end
        end
        return false
    end

    AddEventHandler('onResourceStart', function(resName)
        if resName == ResourceName then return end
        if DependantResources[resName] then return end

        if getConfigValuesForResource(resName) then
            CreateThread(function()
                Wait(1000)
                redetectForResource(resName)
            end)
        end
    end)
end

function Locale(locale_key, ...)
    if not locale_key then
        ERROR('0080', 'Locale key is nil')
        return ''
    end

    local preferred = tostring(Cfg.Language):upper()

    local function getFromOneTable(tbl, langKey)
        if not tbl then return nil end
        if tbl[langKey] and tbl[langKey][locale_key] then
            return tbl[langKey][locale_key]
        end
        return nil
    end

    local function findMessage(langKey)
        return getFromOneTable(LocalesTable, langKey) or getFromOneTable(Locales, langKey) or getFromOneTable(BridgeLocalesTable, langKey)
    end

    local message = findMessage(preferred)
    if not message and preferred ~= 'EN' then
        message = findMessage('EN')
    end

    if not message then
        ERROR('0081', 'Locale not found: ' .. tostring(locale_key) .. ' (lang tried: ' .. preferred .. ' -> EN)')
        return tostring(locale_key)
    end

    if select('#', ...) == 0 then
        return message
    end

    local ok, formatted = pcall(string.format, message, ...)
    if ok then
        return formatted
    end

    ERROR('0082', ('String format failed for locale key: %s | Args: %s'):format(tostring(locale_key), json.encode({ ... })))
    return message
end