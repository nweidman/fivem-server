local function GetRandItemFromTable(table)
	-- debugPrint("^5Debug^7: ^2Picking random item from table^7")
	::start::
	local randNum = math.random(1, 100)
	local items = {}
	for _, item in ipairs(table) do
		if randNum <= tonumber(item.rarity) then
			items[#items+1] = item.item
		end
	end
	if #items == 0 then
		goto start
	end
	local rand = math.random(1, #items)
	local selectedItem = items[rand]
	-- debugPrint("^5Debug^7: ^2Selected item ^7'^3"..selectedItem.."^7' - ^2rand^7: "..rand.." ^2length^7: "..#items)
	return selectedItem
end

lib.addCommand('mininglevel', {
    help = 'Check your mining level.',
    restricted = false,
}, function(source)
	local Player = exports.qbx_core:GetPlayer(source)
	local mininglevel = Player.PlayerData.metadata["mining"].level
	local miningxp = Player.PlayerData.metadata["mining"].xp
	if mininglevel <3 then
    	exports.qbx_core:Notify(source, 'Your mining level is '..mininglevel.." ("..miningxp..'/'..Config.Levels[mininglevel+1]..')')
	else
		exports.qbx_core:Notify(source, 'Your mining level is '..mininglevel.." (Max Level)")
	end
end)

local function InitializeMiningMeta(Player)
    local mining = Player.PlayerData.metadata["mining"]

    if mining == nil or type(mining) ~= "table" then
        mining = { level = 0, xp = 0 }
        Player.Functions.SetMetaData("mining", mining)
    end

    -- Safety checks
    mining.level = mining.level or 0
    mining.xp = mining.xp or 0

    return mining
end

lib.callback.register('drool-mining:getMiningData', function(source)
    local Player = exports.qbx_core:GetPlayer(source)
    if not Player then return { level = 0, xp = 0 } end

    return InitializeMiningMeta(Player)
end)

RegisterNetEvent("drool-mining:addMiningXP", function(amount)
    local src = source
    local Player = exports.qbx_core:GetPlayer(src)
    if not Player then return end

    local mining = InitializeMiningMeta(Player)

    -- Add XP
    mining.xp = mining.xp + amount

    -- Leveling logic
    if Config.Levels[mining.level+1] and mining.xp >= Config.Levels[mining.level+1] then
        mining.level += 1
        exports.qbx_core:Notify( src, ("Mining level increased to %s!"):format(mining.level), "success")
    end

    Player.Functions.SetMetaData("mining", mining)
end)

RegisterServerEvent(getScript()..":Reward", function(data)
	local src = source
	local Player = exports.qbx_core:GetPlayer(src)
	local mining = InitializeMiningMeta(Player)
	local amount = 1

	if data.mine then

		local amount = GetTiming(Config.PoolAmounts.Mining.AmountPerSuccess)
		if mining.level == 3 then amount = amount + 1 end
		local carryCheck = canCarry({ [data.setReward] = amount }, src)

		if carryCheck[data.setReward] then
			addItem(data.setReward, amount,  nil, src)
		else
			triggerNotify(nil, locale("error", "full"), "error", src)
		end

	elseif data.crack then
		for i=1, data.cost do
			local selectedItem = GetRandItemFromTable(Config.CrackPool)
			amount = GetTiming(Config.PoolAmounts.Cracking.AmountPerSuccess)

			local canCarryCheck = canCarry({ [selectedItem] = amount }, src)

			if selectedItem and canCarryCheck[selectedItem] then
				addItem(selectedItem, amount, nil, src)
			else
				triggerNotify(nil, locale("error", "full"), "error", src)
			end
		end
		removeItem("stone", data.cost, src)

	elseif data.wash then
		local rewards = {}
		local cost = tonumber(data.cost) or 1

		-- Build rewards for each stone being washed
		for wash = 1, cost do
			for i = 1, GetTiming(Config.PoolAmounts.Washing.Successes) do
				local selectedItem = GetRandItemFromTable(Config.WashPool)
				local amount = GetTiming(Config.PoolAmounts.Washing.AmountPerSuccess)

				if selectedItem then
					rewards[selectedItem] = (rewards[selectedItem] or 0) + amount
				end
			end
		end

		-- Check if player can carry all rewards
		local canCarryCheck = canCarry(rewards, src)

		local canCarryAll = true
		for item, _ in pairs(rewards) do
			if not canCarryCheck[item] then
				canCarryAll = false
				break
			end
		end

		-- Give rewards only if they can carry everything
		if canCarryAll then
			removeItem("stone", cost, src)

			for item, amount in pairs(rewards) do
				addItem(item, amount, nil, src)
			end
		else
			triggerNotify(nil, locale("error", "full"), "error", src)
		end

		local stoneAmount = exports.ox_inventory:GetItem(src, 'stone', nil, true)
		if stoneAmount > 0 then
			TriggerClientEvent('washing:client:MenuPopUp', src)
		end

	elseif data.pan then

		for i = 1, GetTiming(Config.PoolAmounts.Panning.Successes) do

			local selectedItem = GetRandItemFromTable(Config.PanPool)
			amount = GetTiming(Config.PoolAmounts.Panning.AmountPerSuccess)

			local canCarryCheck = canCarry({ [selectedItem] = amount }, src)

			if selectedItem and canCarryCheck[selectedItem] then
				addItem(selectedItem, amount, nil, src)
			else
				triggerNotify(nil, locale("error", "full"), "error", src)
			end
		end
		local goldpan = exports.ox_inventory:GetItem(src, 'goldpan', nil, true)
		if goldpan > 0 then
			TriggerClientEvent('jim-mining:PanningMenu', src)
		end
	end
	exports['drool_skills']:addXP(src, 1)
end)


onResourceStart(function()
	Wait(1000)
	for k, v in pairs(Locations["Mines"]) do
		for l, b in pairs(v) do
			if l == "Store" then
				for i = 1, #b do
					registerShop("miningShop", Config.Items.label, Config.Items.items, nil, b[i].coords.xyz)
				end
			end
		end
	end

	--registerShop("miningShop", Config.Items.label, Config.Items.items)

	for k in pairs(Selling) do
		if Selling[k].Items then
			for b in pairs(Selling[k].Items) do
				if not Items[b] then print("Selling: Missing Item from Items: '"..b.."'") end
			end
		else
			for l in pairs(Selling[k]) do
				if l ~= "Header" then
					for b in pairs(Selling[k][l].Items) do
						if not Items[b] then print("Selling: Missing Item from Items: '"..b.."'") end
					end
				end
			end
		end
	end
	for i = 1, #Config.CrackPool do if not Items[Config.CrackPool[i].item] then print("CrackPool: Missing Item from Items: '"..Config.CrackPool[i].item.."'") end end
	for i = 1, #Config.WashPool do if not Items[Config.WashPool[i].item] then print("WashPool: Missing Item from Items: '"..Config.WashPool[i].item.."'") end end
	for i = 1, #Config.PanPool do if not Items[Config.PanPool[i].item] then print("PanPool: Missing Item from Items: '"..Config.PanPool[i].item.."'") end end
	for i = 1, #Config.Items.items do if not Items[Config.Items.items[i].name] then print("Shop: Missing Item from Items: '"..Config.Items.items[i].name.."'") end end
	local itemcheck = {}
	for _, v in pairs(Crafting) do
		if type(v) == "table" then
			for _, b in pairs(v.Recipes) do
				for k, l in pairs(b) do
					if k ~= "amount" then
						itemcheck[k] = {}
						for j in pairs(l) do
							itemcheck[j] = {}
						end
					end
				end
			end
		end
	end
	for k in pairs(itemcheck) do
		if not Items[k] then print("Crafting recipe couldn't find item '"..k.."' in the shared") end
	end
end, true)