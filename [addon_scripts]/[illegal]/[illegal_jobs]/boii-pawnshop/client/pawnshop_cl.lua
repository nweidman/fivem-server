----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------
-- qb-core + ox_target + ox_lib (no bridge)

local QBCore = exports['qb-core']:GetCoreObject()
local issmelting = false

-- ========== UTILS ==========
local function isWithinHours(open, close, hourNow)
    local h = tonumber(hourNow) or GetClockHours()
    open  = tonumber(open)  or 0
    close = tonumber(close) or 24
    if open == close then return true end                     -- 24/7
    if open < close then return h >= open and h <= close end  -- inclusive window
    return (h >= open) or (h <= close)                        -- overnight, inclusive
end

-- ========== NOTIFY ==========
RegisterNetEvent('boii-pawnshop:notify', function(msg, type)
    QBCore.Functions.Notify(msg or 'Notification', type or 'inform')
end)

-- ========== BLIPS ==========
CreateThread(function()
    for _, v in pairs(Config.Blips or {}) do
        if v.useblip then
            local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
            SetBlipSprite(blip, v.id)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, v.scale or 0.6)
            SetBlipColour(blip, v.colour or 0)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.title or 'Shop')
            EndTextCommandSetBlipName(blip)
        end
    end
end)

-- ========== PEDS + ox_target ==========
local spawnedPeds = {}

local function requestModelOnce(model, timeout)
    lib.requestModel(model, timeout or 5000)
end

local function spawnShopPed(p)
    requestModelOnce(p.model)
    local ped = CreatePed(0, p.model, p.coords.x, p.coords.y, p.coords.z - 1.0, p.coords.w, false, false)
    SetEntityAsMissionEntity(ped, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    if p.scenario then TaskStartScenarioInPlace(ped, p.scenario, 0, true) end

    exports.ox_target:addLocalEntity(ped, {
        {
            name = ('pshop_ped_%s'):format(p.name or ped),
            icon = p.icon or 'fa-solid fa-shop',
            label = p.label or 'Open',
            distance = p.distance or 2.0,
            canInteract = function(entity)
                if IsPedDeadOrDying(entity, true) then return false end
                if IsPedAPlayer(entity) then return false end
                if IsPedInAnyVehicle(PlayerPedId()) then return false end
                return true
            end,
            onSelect = function()
                if p.event then
                    TriggerEvent(p.event)
                end
            end
        }
    })

    SetModelAsNoLongerNeeded(p.model)
    return ped
end

CreateThread(function()
    for _, v in ipairs(Config.Peds or {}) do
        spawnedPeds[#spawnedPeds+1] = spawnShopPed(v)
    end
end)

AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() then return end
    for _, ped in ipairs(spawnedPeds) do
        if DoesEntityExist(ped) then DeleteEntity(ped) end
    end
end)

-- ========== SMELTING TARGET (ox_target addBoxZone) ==========
local function centerZ(minZ, maxZ) return (minZ + maxZ) / 2.0 end
local function heightZ(minZ, maxZ) return math.abs(maxZ - minZ) end

CreateThread(function()
    for _, v in pairs((Config.Smelting and Config.Smelting.Location) or {}) do
        local coords = vec3(v.coords.x, v.coords.y, centerZ(v.minZ, v.maxZ))
        local size   = vec3(v.length, v.width, heightZ(v.minZ, v.maxZ))
        exports.ox_target:addBoxZone({
            coords = coords,
            size = size,
            rotation = v.heading or 0.0,
            debug = v.debugPoly or false,
            options = {
                {
                    name = 'pawnshop_smelt',
                    icon = v.icon or 'fas fa-fire-alt',
                    label = v.label or 'Smelt',
                    distance = v.distance or 2.5,
                    onSelect = function()
                        TriggerEvent(v.event or 'boii-pawnshop:cl:SmeltingMenu')
                    end
                }
            }
        })
    end
end)

-- ========== BUY ITEMS (ox_lib input) ==========
RegisterNetEvent('boii-pawnshop:cl:BuyItems', function(args)
    local container = args and args.args or args or {}
    local header         = container.label or 'Purchase'
    local store          = container.store
    local item           = container.item
    local price          = tonumber(container.price) or 0
    local buy_multiplier = tonumber(container.buymultiplier) or 1

    if not store or not item or price <= 0 then
        return TriggerEvent('boii-pawnshop:notify', 'Invalid purchase data', 'error')
    end

    local input = lib.inputDialog(header, {
        { type = 'number', label = 'Amount', min = 1, default = 1, required = true }
    })
    if not input then return end
    local amount = math.floor(tonumber(input[1] or 0))
    if amount <= 0 then return end

    TriggerServerEvent('boii-pawnshop:sv:BuyItems', store, item, price, buy_multiplier, amount)
end)

-- ========== OPEN STORE (ox_lib context) ==========
RegisterNetEvent('boii-pawnshop:cl:OpenStore', function(args)
    local container = args and args.args or args or {}
    local label = container.label or 'Store'
    local item_list = container.items or {}

    local opts = {}
    for _, it in ipairs(item_list) do
        local name  = it.name or it.item or 'unknown'
        local price = tonumber(it.price) or 0
        local stock = tonumber(it.amount) or 999

        opts[#opts+1] = {
            title = name,
            description = ('Price: $%d | Stock: %d'):format(price, stock),
            icon = 'fa-solid fa-basket-shopping',
            onSelect = function()
                local input = lib.inputDialog(('Buy %s'):format(name), {
                    { type = 'number', label = 'Amount', min = 1, max = stock, default = 1, required = true }
                })
                if not input then return end
                local amount = math.floor(tonumber(input[1] or 0))
                if amount <= 0 then return end
                TriggerServerEvent('boii-pawnshop:sv:BuyItems', label, name, price, 1, amount)
            end
        }
    end

    lib.registerContext({
        id = 'boii_open_store_ctx',
        title = label,
        options = (#opts > 0) and opts or {
            { title = 'No items', icon = 'fa-regular fa-circle-xmark', disabled = true }
        }
    })
    lib.showContext('boii_open_store_ctx')
end)

-- ========== SMELT ITEMS (ox_lib progressCircle) ==========
RegisterNetEvent('boii-pawnshop:cl:SmeltItems', function(timer, item, amount, returnitem, returnamount)
    if issmelting then
        TriggerEvent('boii-pawnshop:notify', 'Smelter is busy', 'inform')
        return
    end
    if not item or not returnitem or (timer or 0) <= 0 then
        TriggerEvent('boii-pawnshop:notify', 'Invalid smelt request', 'error')
        return
    end

    issmelting = true
    local ped = (cache and cache.ped) or PlayerPedId()

    local dict  = (Config.Smelting.Animations and Config.Smelting.Animations.Dict) or 'amb@prop_human_movie_bulb@base'
    local anim  = (Config.Smelting.Animations and Config.Smelting.Animations.Anim) or 'base'
    local flags = (Config.Smelting.Animations and Config.Smelting.Animations.Flags) or 49

    lib.requestAnimDict(dict)
    TaskPlayAnim(ped, dict, anim, 2.0, 2.0, timer * 1000, flags, 0.0, false, false, false)

    local done = lib.progressCircle({
        duration = timer * 1000,
        label = 'Smelting...',
        useWhileDead = false,
        canCancel = true,
        position = 'bottom',
        disable = { move = true, car = true, combat = true }
    })

    ClearPedTasks(ped)

    if not done then
        TriggerEvent('boii-pawnshop:notify', 'Cancelled', 'inform')
        issmelting = false
        return
    end

    -- Swap items via server (matches your original flow)
    TriggerServerEvent('boii-pawnshop:sv:RemoveItem', item, amount)
    TriggerServerEvent('boii-pawnshop:sv:AddItem', returnitem, returnamount)
    TriggerEvent('boii-pawnshop:notify', 'Smelted!', 'success')

    issmelting = false
end)

-- ========= OX_LIB SMELTING MENU (called by target zone/ped) =========
local function smelt_isOpen(times)
    if not times or not times.Use then return true end
    return isWithinHours(times.Open, times.Close, GetClockHours())
end

local function smelt_openContext(id, title, options)
    lib.registerContext({ id = id, title = title, options = options })
    lib.showContext(id)
end

RegisterNetEvent('boii-pawnshop:cl:SmeltingMenu', function()
    if Config.Smelting and Config.Smelting.Times and Config.Smelting.Times.Use and not smelt_isOpen(Config.Smelting.Times) then
        local tmsg = (Language.Smelting and Language.Smelting.timer) or 'Smelter is closed right now'
        TriggerEvent('boii-pawnshop:notify', tmsg, 'error')
        return
    end

    local langMain  = (Language.Smelting and Language.Smelting.Main)  or { header = 'Smelting', text = 'Melt items into bars', icon = 'fa-solid fa-fire-burner' }
    local langSmelt = (Language.Smelting and Language.Smelting.Smelt) or { icon = 'fa-solid fa-fire-burner' }

    local opts = {
        { title = langMain.header, description = langMain.text, icon = langMain.icon, disabled = true }
    }

    for _, r in pairs((Config.Smelting and Config.Smelting.Items) or {}) do
        opts[#opts+1] = {
            title = r.label or r.item,
            description = ('Required: %d'):format(tonumber(r.amount or 0)),
            icon = langSmelt.icon,
            onSelect = function()
                -- IMPORTANT: send GTA hour so server uses game time (not system time)
                TriggerServerEvent('boii-pawnshop:sv:SmeltItems', {
                    item         = r.item,
                    amount       = r.amount,
                    returnitem   = r.returnitem,
                    returnamount = r.returnamount,
                    time         = r.time,
                    gameHour     = GetClockHours(),
                })
            end
        }
    end

    opts[#opts+1] = {
        title = (Language.Shared and Language.Shared.exitmenu) or 'Close',
        icon  = (Language.Shared and Language.Shared.exitmenuicon) or 'fa-regular fa-circle-xmark',
        onSelect = function() TriggerEvent('boii-pawnshop:cl:StopMenu') end
    }

    smelt_openContext('boii_smelting_main', langMain.header or 'Smelting', opts)
end)

-- ========== STOP MENU ==========
RegisterNetEvent('boii-pawnshop:cl:StopMenu', function()
    ClearPedTasks(PlayerPedId())
end)
