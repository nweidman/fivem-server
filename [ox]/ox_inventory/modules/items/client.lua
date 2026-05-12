if not lib then return end

local Items = require 'modules.items.shared' --[[@as table<string, OxClientItem>]]

local function sendDisplayMetadata(data)
    SendNUIMessage({
		action = 'displayMetadata',
		data = data
	})
end

--- use array of single key value pairs to dictate order
---@param metadata string | table<string, string> | table<string, string>[]
---@param value? string
local function displayMetadata(metadata, value)
	local data = {}

	if type(metadata) == 'string' then
        if not value then return end

        data = { { metadata = metadata, value = value } }
	elseif table.type(metadata) == 'array' then
		for i = 1, #metadata do
			for k, v in pairs(metadata[i]) do
				data[i] = {
					metadata = k,
					value = v,
				}
			end
		end
	else
		for k, v in pairs(metadata) do
			data[#data + 1] = {
				metadata = k,
				value = v,
			}
		end
	end

    if client.uiLoaded then
        return sendDisplayMetadata(data)
    end

    CreateThread(function()
        repeat Wait(100) until client.uiLoaded

        sendDisplayMetadata(data)
    end)
end

exports('displayMetadata', displayMetadata)

---@param _ table?
---@param name string?
---@return table?
local function getItem(_, name)
    if not name then return Items end

	if type(name) ~= 'string' then return end

    name = name:lower()

    if name:sub(0, 7) == 'weapon_' then
        name = name:upper()
    end

    return Items[name]
end

setmetatable(Items --[[@as table]], {
	__call = getItem
})

---@cast Items +fun(itemName: string): OxClientItem
---@cast Items +fun(): table<string, OxClientItem>

local function Item(name, cb)
	local item = Items[name]
	if item then
		if not item.client?.export and not item.client?.event then
			item.effect = cb
		end
	end
end

local ox_inventory = exports[shared.resource]
-----------------------------------------------------------------------------------------------
-- Clientside item use functions
-----------------------------------------------------------------------------------------------

-- Item('bandage', function(data, slot)
-- 	local maxHealth = GetEntityMaxHealth(cache.ped)
-- 	local health = GetEntityHealth(cache.ped)
-- 	ox_inventory:useItem(data, function(data)
-- 		if data then
-- 			if lib.progressBar({
-- 				duration = 5000,
-- 				label = 'Applying a bandage...',
-- 				useWhileDead = false,
-- 				canCancel = true,
-- 				disable = {
-- 					move = false,
-- 					car = false,
-- 					mouse = false,
-- 					combat = true
-- 				},
-- 				anim = {
-- 					clip = 'try_shirt_positive_d',
-- 					dict = 'clothingshirt',
-- 				},
-- 			}) then -- if completed
-- 				SetEntityHealth(cache.ped, math.min(maxHealth, math.floor(health + maxHealth / 16)))
-- 				lib.notify({ description = 'You feel better already' })
-- 			else -- if canceled
					
-- 			end
-- 		end
-- 	end)
-- end)

-- Item('armour', function(data, slot)
-- 	if GetPedArmour(cache.ped) < 100 then
-- 		ox_inventory:useItem(data, function(data)
-- 			if data then
-- 				SetPlayerMaxArmour(PlayerData.id, 100)
-- 				SetPedArmour(cache.ped, 100)
-- 			end
-- 		end)
-- 	end
-- end)

client.parachute = false
Item('parachute', function(data, slot)
	if not client.parachute then
		ox_inventory:useItem(data, function(data)
			if data then
				if lib.progressBar({
					duration = 5000,
					label = 'Putting on parachute...',
					useWhileDead = false,
					canCancel = true,
					disable = {
						move = false,
						car = false,
						mouse = false,
						combat = true
					},
					anim = {
						clip = 'try_shirt_positive_d',
						dict = 'clothingshirt',
					},
				}) then -- if completed
					local ped = PlayerPedId()
					GiveWeaponToPed(ped, `GADGET_PARACHUTE`, 1, false, false)
					SetPedComponentVariation(ped, 5, 7, 0, 0) -- 5 = Bags & Parachutes, 7 = Drawable ID
					CreateThread(function()
						while GetPedParachuteState(ped) == -1 do
							Wait(2000)
						end
						while GetPedParachuteState(ped) ~= -1 do
							Wait(2000)
						end
						SetPedComponentVariation(ped, 5, 0, 0, 0)
						client.parachute = false
					end)
				else -- if canceled
					
				end
			end
		end)
	end
end)

Item('phone', function(data, slot)
	local success, result = pcall(function()
		return exports.npwd:isPhoneVisible()
	end)

	if success then
		exports.npwd:setPhoneVisible(not result)
	end
end)

Item('clothing', function(data, slot)
	local metadata = slot.metadata

	if not metadata.drawable then return print('Clothing is missing drawable in metadata') end
	if not metadata.texture then return print('Clothing is missing texture in metadata') end

	if metadata.prop then
		if not SetPedPreloadPropData(cache.ped, metadata.prop, metadata.drawable, metadata.texture) then
			return print('Clothing has invalid prop for this ped')
		end
	elseif metadata.component then
		if not IsPedComponentVariationValid(cache.ped, metadata.component, metadata.drawable, metadata.texture) then
			return print('Clothing has invalid component for this ped')
		end
	else
		return print('Clothing is missing prop/component id in metadata')
	end

	ox_inventory:useItem(data, function(data)
		if data then
			metadata = data.metadata

			if metadata.prop then
				local prop = GetPedPropIndex(cache.ped, metadata.prop)
				local texture = GetPedPropTextureIndex(cache.ped, metadata.prop)

				if metadata.drawable == prop and metadata.texture == texture then
					return ClearPedProp(cache.ped, metadata.prop)
				end

				-- { prop = 0, drawable = 2, texture = 1 } = grey beanie
				SetPedPropIndex(cache.ped, metadata.prop, metadata.drawable, metadata.texture, false);
			elseif metadata.component then
				local drawable = GetPedDrawableVariation(cache.ped, metadata.component)
				local texture = GetPedTextureVariation(cache.ped, metadata.component)

				if metadata.drawable == drawable and metadata.texture == texture then
					return -- item matches (setup defaults so we can strip?)
				end

				-- { component = 4, drawable = 4, texture = 1 } = jeans w/ belt
				SetPedComponentVariation(cache.ped, metadata.component, metadata.drawable, metadata.texture, 0);
			end
		end
	end)
end)

-----------------------------------------------------------------------------------------------

exports('Items', function(item) return getItem(nil, item) end)
exports('ItemList', function(item) return getItem(nil, item) end)

return Items
