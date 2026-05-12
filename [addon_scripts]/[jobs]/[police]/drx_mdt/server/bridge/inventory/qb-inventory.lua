if GetResourceState('qb-inventory') ~= 'started' then return end

Inventory = {
  name = 'drx_evidence_',

  ---@param id number The inventory identifier
  GetStashItems = function(id)
    local items = {}
    local result = MySQL.scalar.await('SELECT items FROM stashitems WHERE stash = ?', { id })
    if not result then return items end

    local stashItems = json.decode(result)
    if not stashItems then return items end

    for _, item in pairs(stashItems) do
      local itemInfo = QBCore.Shared.Items[item.name:lower()]
      if itemInfo then
        items[item.slot] = {
          name = itemInfo["name"],
          amount = tonumber(item.amount),
          info = item.info or "",
          label = itemInfo["label"],
          description = itemInfo["description"] or "",
          weight = itemInfo["weight"],
          type = itemInfo["type"],
          unique = itemInfo["unique"],
          useable = itemInfo["useable"],
          image = itemInfo["image"],
          slot = item.slot,
        }
      end
    end

    return items
  end,

  ---@param id number The inventory identifier
  ---@param label string The inventory label
  RegisterStash = function(id, label)
    MySQL.insert.await('INSERT IGNORE INTO stashitems (`stash`, items) VALUES (?, ?)', {
      id, json.encode({})
    })
  end,

  ---@param src number The player server id
  ---@param id number The inventory identifier
  OpenInventory = function(src, id)
    exports['qb-inventory']:OpenInventory('stash', Inventory.name .. id, nil, src)
    TriggerClientEvent("inventory:client:SetCurrentStash", src, Inventory.name .. id)
  end,
}