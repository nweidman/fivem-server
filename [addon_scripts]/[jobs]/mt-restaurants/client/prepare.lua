openPrepare = function(id, ingredients, label, anim)
    if Config.inventory == 'ox_inventory' and Config.useOxInventoryCraft then
        exports.ox_inventory:openInventory('crafting', { id = id })
    else
        local menu = { id = id, title = label, options = {} }
        for k, v in pairs(ingredients) do
            if v.needCut then
                local neededItems = ''
                local disabled = true
                local items = 0
                local nItems = {}

                if not itemData(tostring(v.item)) then
                    lib.print.error("The item "..tostring(v.item).." is missing on your inventory items.lua!!")
                    goto ingredientItemMissing
                end

                for a, b in pairs(v.neededItems) do
                    if not itemData(tostring(a)) then
                        lib.print.error("The item "..tostring(a).." is missing on your inventory items.lua!!")
                        goto neededItemMissing
                    end    
                    nItems[#nItems+1] = { item = tostring(a), count = tonumber(b) }
                    :: neededItemMissing ::
                end

                for a, b in pairs(nItems) do
                    if itemData(tostring(b.item)) then
                        if getItemCount(tostring(b.item)) >= tonumber(b.count) then
                            neededItems = neededItems..locale('menu_prepare_needed_item_format_check', itemData(tostring(b.item)).label, tonumber(b.count))
                            items += 1
                        else
                            neededItems = neededItems..locale('menu_prepare_needed_item_format_error', itemData(tostring(b.item)).label, tonumber(b.count))
                        end
                    else
                        if Config.debug then print('^1Needed item: '..tostring(b.item)..' is not created!') end
                    end
                end

                if items == #nItems then disabled = false end

                menu.options[#menu.options+1] = { disabled = disabled, title = locale('menu_prepare_title', itemData(v.item).label), description = neededItems, icon = string.format(Config.imagesDirectory, v.item), onSelect = function() prepareItem(id, ingredients, label, anim, v.item, v.count, v.neededItems) end }
            end
            :: ingredientItemMissing ::
        end
        lib.registerContext(menu)
        lib.showContext(menu.id)
    end
end

prepareItem = function(id, ingredients, label, anim, item, count, neededItems)
    local input = lib.inputDialog(label, {
        { type = 'number', label = locale('input_prepare_quantity'), required = true, min = 1, max = Config.maxPreparesPerTime },
    })
    if input then
        local counter = 1
        :: redo ::
        local canCraft = lib.callback.await('mt-restaurants:server:canCraftItem', false, neededItems)
        if canCraft then
            counter += 1
            if progressBar(locale('progress_preparing_ingredient', itemData(item).label), Config.times.preparing, { car = true, move = true }, anim, {}) then
                lib.callback.await('mt-restaurants:server:craftItem', false, item, count, neededItems)
            else return openPrepare(id, ingredients, label, anim) end
            if counter <= input[1] then goto redo end
        else
            notify(locale('notify_error_no_needed_items'), 'error')
        end
    end
    openPrepare(id, ingredients, label, anim)
end