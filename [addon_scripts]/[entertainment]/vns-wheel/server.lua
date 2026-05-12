math.randomseed(os.time())
isRoll = false
local car = Config.Cars[math.random(#Config.Cars)]

if Config.DailySpin then
	Citizen.CreateThread(function()
		while true do
		Citizen.Wait(1000*60)
			if os.date('%H:%M') == Config.ResetSpin then
				MySQL.Async.execute('UPDATE players SET wheel = 0')
			end
		end
	end)
end

QBCore.Functions.CreateCallback('vns_cs_wheel:getcar', function(source, cb)
	cb(car)
end)

-- Discord Roles --
function canSpin(source)
	local discord = false

	for k,v in pairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("discord:")) == "discord:" then
			discord = v
			break
		end
	end

	if discord then
		local roles = exports.Badger_Discord_API:GetDiscordRoles(source)
		if not roles then return false end
		local canspin = false

		for i=1, #roles do
			for j=1, #Config.SpinRoles do
				if exports.Badger_Discord_API:CheckEqual(roles[i], Config.SpinRoles[j]) then
					canspin = true
					break
				end
			end
		end

		return canspin
	else 
		return false 
	end
end

RegisterServerEvent('vns_cs_wheel:getwheel')
AddEventHandler('vns_cs_wheel:getwheel', function()
    local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)
	if Player then
		if not isRoll then
			if Config.DailySpin == true then
				if Config.UseCitizenID then
					local result = MySQL.Sync.fetchAll('SELECT wheel FROM players WHERE citizenid = @citizenid', { ['@citizenid'] = Player.PlayerData.citizenid })

					if canSpin(_source) then
						if tonumber(result[1].wheel) < 1 then
							TriggerEvent("vns_cs_wheel:startwheel", Player, _source)
						else
							TriggerClientEvent('QBCore:Notify', _source, 'You have already spun the wheel today, please wait 24 hours before spinning again!', 'error')
						end
					else
						TriggerClientEvent('QBCore:Notify', _source, "You don't have permissions to spin the wheel!", "error")
					end
				else
					local result = MySQL.Sync.fetchAll('SELECT wheel FROM players WHERE license = @identifier', { ['@identifier'] = Player.PlayerData.license })

					if canSpin(_source) then
						if tonumber(result[1].wheel) < 1 then
							TriggerEvent("vns_cs_wheel:startwheel", Player, _source)
						else
							TriggerClientEvent('QBCore:Notify', _source, 'You have already spun the wheel today, please wait 24 hours before spinning again!', 'error')
						end
					else
						TriggerClientEvent('QBCore:Notify', _source, "You don't have permissions to spin the wheel!", "error")
					end
				end
			elseif Config.DailySpin == false then
				if Player.Functions.GetMoney('cash') >= Config.SpinMoney then
					TriggerEvent("vns_cs_wheel:startwheel", Player, _source)
					Player.Functions.RemoveMoney('cash', Config.SpinMoney)
				else
					TriggerClientEvent('QBCore:Notify', _source, 'You do not have money to spin')
				end
			end
		end
	end
end)	
	
	

RegisterServerEvent('vns_cs_wheel:startwheel')
AddEventHandler('vns_cs_wheel:startwheel', function(Player, source)
    local _source = source
    if not isRoll then
		if Config.DailySpin == true then
			if Config.UseCitizenID then
				MySQL.Async.execute('UPDATE players SET wheel = wheel + 1 WHERE citizenid = @citizenid', {
					['@citizenid'] = Player.PlayerData.citizenid,
				}, function(changedRows)
					if changedRows then
						isRoll = true
						local rnd = math.random(1, 1000)
						local price = 0
						local priceIndex = 0
						for k,v in pairs(Config.Prices) do
							if (rnd > v.probability.a) and (rnd <= v.probability.b) then
								price = v
								priceIndex = k
								break
							end
						end
						TriggerClientEvent("vns_cs_wheel:syncanim", _source, priceIndex)
						TriggerClientEvent("vns_cs_wheel:startroll", -1, _source, priceIndex, price)
					end
				end)
			else
				MySQL.Async.execute('UPDATE players SET wheel = wheel + 1 WHERE license = @identifier', {
					['@identifier'] = Player.PlayerData.license,
				}, function(changedRows)
					if changedRows then
						isRoll = true
						local rnd = math.random(1, 1000)
						local price = 0
						local priceIndex = 0
						for k,v in pairs(Config.Prices) do
							if (rnd > v.probability.a) and (rnd <= v.probability.b) then
								price = v
								priceIndex = k
								break
							end
						end
						TriggerClientEvent("vns_cs_wheel:syncanim", _source, priceIndex)
						TriggerClientEvent("vns_cs_wheel:startroll", -1, _source, priceIndex, price)
					end
				end)
			end
		else
			isRoll = true
			local rnd = math.random(1, 1000)
			local price = 0
			local priceIndex = 0
			for k,v in pairs(Config.Prices) do
				if (rnd > v.probability.a) and (rnd <= v.probability.b) then
					price = v
					priceIndex = k
					break
				end
			end
			TriggerClientEvent("vns_cs_wheel:syncanim", _source, priceIndex)
			TriggerClientEvent("vns_cs_wheel:startroll", -1, _source, priceIndex, price)
		end
	end
end)

RegisterServerEvent('vns_cs_wheel:give')
AddEventHandler('vns_cs_wheel:give', function(s, price)
    local _s = s
	local Player = QBCore.Functions.GetPlayer(_s)
	isRoll = false
	if price.type == 'car' then
		TriggerClientEvent('QBCore:Notify', _s, 'You won the car')
		local logMsg = ('**PLAYER**\n**Name:** %s\n**Character Name:** %s\n**Citizen ID:** %s\n**License:** %s\n\n**REWARD**\n**Vehicle: **%s'):format(GetPlayerName(source), Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname, Player.PlayerData.citizenid, QBCore.Functions.GetIdentifier(source, 'license'), car)
        TriggerEvent('qb-log:server:CreateLog', 'societies', 'Supporter Wheel Spin Reward', 'green', logMsg)
		local plate = GeneratePlate()
		MySQL.Sync.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (@license, @citizenid, @vehicle, @hash, @mods, @plate, @state)', {
            ['@license'] = Player.PlayerData.license,
            ['@citizenid'] = Player.PlayerData.citizenid,
            ['@vehicle'] = car,
            ['@hash'] = GetHashKey(car),
            ['@mods'] = '{}',
            ['@plate'] = plate,
            ['@state'] = 0,
        })
		TriggerClientEvent("vns_cs_wheel:winCar", _s, car, plate)
	
	
	elseif price.type == 'item' then
		if QBCore.Shared.Items[price.name] then
			Player.Functions.AddItem(price.name, price.count)
			local logMsg = ('**PLAYER**\n**Name:** %s\n**Character Name:** %s\n**Citizen ID:** %s\n**License:** %s\n\n**REWARD**\n**Name: **%s\n**Amount: **%s'):format(GetPlayerName(source), Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname, Player.PlayerData.citizenid, QBCore.Functions.GetIdentifier(source, 'license'), price.name, price.count)
        	TriggerEvent('qb-log:server:CreateLog', 'societies', 'Supporter Wheel Spin Reward', 'green', logMsg)
			TriggerClientEvent('QBCore:Notify', _s, 'You won '..price.count..'x '..QBCore.Shared.Items[price.name]["label"])
			TriggerClientEvent('qb-inventory:client:ItemBox', _s, QBCore.Shared.Items[price.name], "add", price.count)
		else
			TriggerClientEvent('QBCore:Notify', _s, 'This item does not exist, contact server owner! | Item: '..price.name)
		end
	
	
	elseif price.type == 'money' then
		Player.Functions.AddMoney('bank', price.count, 'supporter wheel')
		local logMsg = ('**PLAYER**\n**Name:** %s\n**Character Name:** %s\n**Citizen ID:** %s\n**License:** %s\n\n**REWARD**\n**Money: **%s'):format(GetPlayerName(source), Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname, Player.PlayerData.citizenid, QBCore.Functions.GetIdentifier(source, 'license'), price.count)
        TriggerEvent('qb-log:server:CreateLog', 'societies', 'Supporter Wheel Spin Reward', 'green', logMsg)
		TriggerClientEvent('QBCore:Notify', _s, 'You won '..price.count..'$')
	
	
	end
	TriggerClientEvent("vns_cs_wheel:rollFinished", -1)
end)

RegisterServerEvent('vns_cs_wheel:stoproll')
AddEventHandler('vns_cs_wheel:stoproll', function()
	isRoll = false
end)









local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
    local plate = tostring(GetRandomLetter(4)) ..'' .. tostring(GetRandomNumber(4))
    local result = MySQL.Sync.fetchScalar('SELECT plate FROM player_vehicles WHERE plate=@plate', {['@plate'] = plate})
    if result then
        plate = tostring(GetRandomLetter(4)) ..'' .. tostring(GetRandomNumber(4))
    end
    return plate:upper()
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end