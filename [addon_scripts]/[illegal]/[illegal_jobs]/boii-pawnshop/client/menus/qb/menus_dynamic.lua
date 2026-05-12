----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

-- Unified ox_lib menus for Pawnshop / Techshop / Fence
-- Reads directly from Config.* and optional Config.*.MenuExtras

-- ========== UTIL ==========
local function isOpen(times)
    if not times or not times.Use then return true end
    local h = GetClockHours()
    local open, close = tonumber(times.Open) or 0, tonumber(times.Close) or 24
    if open == close then return true end
    if open < close then
        return h >= open and h < close
    else
        return h >= open or h < close
    end
end

local function openContext(id, title, options)
    lib.registerContext({ id = id, title = title, options = options })
    lib.showContext(id)
end

-- pick correct Language node for a shop
local function getLangForShop(shopKey)
    if shopKey == 'Pawnshop' then return Language.Pawnshop
    elseif shopKey == 'Techshop' then return Language.Techshop
    elseif shopKey == 'Fence' then return Language.Fence
    else return Language.Pawnshop end
end

local function getShopCfg(shopKey)
    return Config[shopKey]
end

-- ========== BUILDERS ==========
local function buildBuyListFromSection(storeName, section, itemIcon)
    local opts = {}
    for _, def in pairs(section or {}) do
        local priceDisplay = math.ceil((def.price or 0) * (def.buymultiplier or 1))
        opts[#opts+1] = {
            title = def.label,
            description = ('Price: $%d'):format(priceDisplay),
            icon = itemIcon,
            onSelect = function()
                TriggerEvent('boii-pawnshop:cl:BuyItems', {
                    store = storeName,
                    item = def.item,
                    label = def.label,
                    price = def.price,
                    buymultiplier = def.buymultiplier
                })
            end
        }
    end
    return opts
end

local function buildSellListFromSection(storeName, section, itemIcon)
    local opts = {}
    for _, def in pairs(section or {}) do
        opts[#opts+1] = {
            title = def.label,
            description = ('Price: $%d'):format(def.price or 0),
            icon = itemIcon,
            disabled = exports.ox_inventory:Search('count', def.item) <=0,
            onSelect = function()
                TriggerServerEvent('boii-pawnshop:sv:SellItems', {
                    store = storeName,
                    item  = def.item,
                    label = def.label,
                    price = def.price
                })
            end
        }
    end
    return opts
end

-- Build submenu for a specific category (e.g., Materials/Gems/Jewellery/Electronics)
local function buildCategoryMenu(shopKey, mode, catKey)
    local cfg = getShopCfg(shopKey)
    local lang = getLangForShop(shopKey)

    local itemsByCat = (cfg.Items or {})[catKey] or {}
    local headerTxt, textTxt, iconKey

    if mode == 'buy' then
        headerTxt = (lang.Buy[catKey] and lang.Buy[catKey].header) or (lang.Buy.header .. ' - ' .. catKey)
        textTxt   = (lang.Buy[catKey] and lang.Buy[catKey].text)   or ''
        iconKey   = (lang.Buy[catKey] and lang.Buy[catKey].icon)   or (lang.Buy.icon)
    else
        headerTxt = (lang.Sell[catKey] and lang.Sell[catKey].header) or (lang.Sell.header .. ' - ' .. catKey)
        textTxt   = (lang.Sell[catKey] and lang.Sell[catKey].text)   or ''
        iconKey   = (lang.Sell[catKey] and lang.Sell[catKey].icon)   or (lang.Sell.icon)
    end

    local opts = {
        { title = headerTxt, description = textTxt, icon = iconKey, disabled = true }
    }

    local entries
    if mode == 'buy' then
        entries = buildBuyListFromSection(shopKey, itemsByCat, iconKey)
    else
        entries = buildSellListFromSection(shopKey, itemsByCat, iconKey)
    end
    for _, o in ipairs(entries) do opts[#opts+1] = o end

    opts[#opts+1] = {
        title = Language.Shared.returnmenu,
        icon = Language.Shared.returnmenuicon,
        onSelect = function()
            TriggerEvent(('boii-pawnshop:cl:%sMenus'):format(shopKey), { menu = mode })
        end
    }

    local id = ('boii_%s_%s_%s'):format(shopKey:lower(), mode, catKey:lower())
    openContext(id, headerTxt, opts)
end

-- Build the "BUY" root (lists categories that exist)
local function buildBuyRoot(shopKey)
    local cfg = getShopCfg(shopKey)
    local lang = getLangForShop(shopKey)

    local opts = {
        { title = lang.Buy.header, description = lang.Buy.text, icon = lang.Buy.icon, disabled = true }
    }

    for catKey, _ in pairs(cfg.Items or {}) do
        local prettyHeader = (lang.Buy[catKey] and lang.Buy[catKey].header) or catKey
        local prettyText   = (lang.Buy[catKey] and lang.Buy[catKey].text)   or ''
        local prettyIcon   = (lang.Buy[catKey] and lang.Buy[catKey].icon)   or lang.Buy.icon

        opts[#opts+1] = {
            title = prettyHeader,
            description = prettyText,
            icon = prettyIcon,
            onSelect = function()
                buildCategoryMenu(shopKey, 'buy', catKey)
            end
        }
    end

    opts[#opts+1] = {
        title = Language.Shared.returnmenu,
        icon = Language.Shared.returnmenuicon,
        onSelect = function()
            TriggerEvent(('boii-pawnshop:cl:%sMenu'):format(shopKey))
        end
    }

    openContext(('boii_%s_buy_root'):format(shopKey:lower()), lang.Buy.header, opts)
end

-- Build the "SELL" root (lists categories that exist)
local function buildSellRoot(shopKey)
    local cfg = getShopCfg(shopKey)
    local lang = getLangForShop(shopKey)

    local opts = {
        { title = lang.Sell.header, description = lang.Sell.text, icon = lang.Sell.icon, disabled = true }
    }

    for catKey, _ in pairs(cfg.Items or {}) do
        local prettyHeader = (lang.Sell[catKey] and lang.Sell[catKey].header) or catKey
        local prettyText   = (lang.Sell[catKey] and lang.Sell[catKey].text)   or ''
        local prettyIcon   = (lang.Sell[catKey] and lang.Sell[catKey].icon)   or lang.Sell.icon

        opts[#opts+1] = {
            title = prettyHeader,
            description = prettyText,
            icon = prettyIcon,
            onSelect = function()
                buildCategoryMenu(shopKey, 'sell', catKey)
            end
        }
    end

    opts[#opts+1] = {
        title = Language.Shared.returnmenu,
        icon = Language.Shared.returnmenuicon,
        onSelect = function()
            TriggerEvent(('boii-pawnshop:cl:%sMenu'):format(shopKey))
        end
    }

    openContext(('boii_%s_sell_root'):format(shopKey:lower()), lang.Sell.header, opts)
end

-- Root menu (Main) per shop
local function buildMain(shopKey)
    local cfg = getShopCfg(shopKey)
    local lang = getLangForShop(shopKey)

    local opts = {
        { title = lang.Main.header, description = lang.Main.text, icon = lang.Main.icon, disabled = true }
    }

    -- If SQL enabled, show BUY (stock); otherwise only SELL + STORE (matches your original behavior)
    if Config.UseSQL then
        opts[#opts+1] = {
            title = lang.Buy.header,
            description = lang.Buy.text,
            icon = lang.Buy.icon,
            onSelect = function()
                TriggerEvent(('boii-pawnshop:cl:%sMenus'):format(shopKey), { menu = 'buy' })
            end
        }
    end

    opts[#opts+1] = {
        title = lang.Sell.header,
        description = lang.Sell.text,
        icon = lang.Sell.icon,
        onSelect = function()
            TriggerEvent(('boii-pawnshop:cl:%sMenus'):format(shopKey), { menu = 'sell' })
        end
    }

    -- STORE (fixed items list)
    if cfg.Store and cfg.Store.Items and next(cfg.Store.Items) ~= nil then
        opts[#opts+1] = {
            title = lang.Store.header,
            description = lang.Store.text,
            icon = lang.Store.icon,
            onSelect = function()
                TriggerEvent('boii-pawnshop:cl:OpenStore', {
                    label = (shopKey == 'Pawnshop' and 'Pawn Shop') or (shopKey == 'Techshop' and 'Tech Shop') or shopKey,
                    items = cfg.Store.Items
                })
            end
        }
    end

    -- Optional extras (your new menu entries): Config.<Shop>.MenuExtras = { {title, description, icon, event, args} }
    for _, extra in ipairs(cfg.MenuExtras or {}) do
        opts[#opts+1] = {
            title = extra.title or 'Extra',
            description = extra.description or '',
            icon = extra.icon or 'fa-solid fa-angles-right',
            onSelect = function()
                if extra.client then
                    TriggerEvent(extra.event, extra.args)
                else
                    TriggerServerEvent(extra.event, extra.args)
                end
            end
        }
    end

    -- Exit
    opts[#opts+1] = {
        title = Language.Shared.exitmenu,
        icon = Language.Shared.exitmenuicon,
        onSelect = function() TriggerEvent('boii-pawnshop:cl:StopMenu') end
    }

    openContext(('boii_%s_main'):format(shopKey:lower()), lang.Main.header, opts)
end

-- ========== EVENT REGISTRATION ==========
local function registerShop(shopKey)
    -- Main entry
    RegisterNetEvent(('boii-pawnshop:cl:%sMenu'):format(shopKey), function()
        local cfg = getShopCfg(shopKey)
        if cfg.Times and cfg.Times.Use and not isOpen(cfg.Times) then
            local lang = getLangForShop(shopKey)
            TriggerEvent('boii-pawnshop:notify', lang.timer or Language.Shared.timer or 'Closed', 'error')
            return
        end
        buildMain(shopKey)
    end)

    -- Sub roots
    RegisterNetEvent(('boii-pawnshop:cl:%sMenus'):format(shopKey), function(args)
        if args and args.menu == 'buy' then
            buildBuyRoot(shopKey)
        elseif args and args.menu == 'sell' then
            buildSellRoot(shopKey)
        end
    end)

    -- Category drilldowns (dynamic):
    -- We listen on generic events so you can call them manually if needed:
    RegisterNetEvent(('boii-pawnshop:cl:%sBuyMenus'):format(shopKey), function(args)
        if args and args.menu then
            buildCategoryMenu(shopKey, 'buy', args.menu)
        end
    end)
    RegisterNetEvent(('boii-pawnshop:cl:%sSellMenus'):format(shopKey), function(args)
        if args and args.menu then
            buildCategoryMenu(shopKey, 'sell', args.menu)
        end
    end)
end

-- Register all 3 shops (present in your Config)
registerShop('Pawnshop')
registerShop('Techshop')
registerShop('Fence')
