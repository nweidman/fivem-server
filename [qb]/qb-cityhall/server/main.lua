local QBCore = exports['qb-core']:GetCoreObject()
local availableJobs = {
    ["taxi"] = "Taxi",
    ["garbage"] = "Garbage Collector",
    ["bus"] = "Bus Driver"
}

-- Functions

local function generateItemMetadata(item, playerdata, url)
    if not playerdata then return end

    local item_metadata = {}
    local citizenid = playerdata.citizenid
    local charinfo = playerdata.charinfo
	local curtime = os.time(os.date("!*t"))
	local diftime = curtime + 2629746

    if item == "id_card" then
        item_metadata.cardtype = 'identification'
        item_metadata.type = 'Identification'
    elseif item == "driver_license" then
        item_metadata.cardtype = 'driver_license'
        item_metadata.type = 'Driver License'

        if playerdata.metadata['licences']['driver'] then
			item_metadata.driver = 'Class D'
		end
		if playerdata.metadata['licences']['bike'] then
			item_metadata.bike = "Class M"
		end
		if playerdata.metadata['licences']['cdl'] then
			item_metadata.cdl = "Class A"
		end
    elseif item == 'weaponlicense' then
        item_metadata.cardtype = 'firearms_license'
        item_metadata.type = 'Weapon License'

        if playerdata.metadata['licences']['weapon'] then
			item_metadata.weapon = 'Class One Weapon License'
		end
		if playerdata.metadata['licences']['weapon2'] then
			item_metadata.weapon2 = 'Class II'
		end
    elseif item == "fishinglicense" then
        item_metadata.cardtype = 'fishing_license'
        item_metadata.type = 'Deep Sea Fishing License'
    elseif item == 'waterslicense' then
        item_metadata.cardtype = 'waters_license'
        item_metadata.type = 'Waters License'
    elseif item == 'huntinglicense' then
        item_metadata.cardtype = 'hunting_license'
        item_metadata.type = 'Hunting License'

        if playerdata.metadata['licences']['hunting'] then
			item_metadata.hunting = 'Hunting & Fishing License'
		end
    end

    item_metadata.citizenid = citizenid
    item_metadata.firstname = charinfo.firstname
    item_metadata.lastname = charinfo.lastname
    item_metadata.dateofbirth = charinfo.birthdate
    item_metadata.sex = charinfo.gender == 1 and "F" or "M"
    item_metadata.nationality = charinfo.nationality
    item_metadata.mugshoturl = url or (charinfo.gender == 1 and 'assets/images/female.png' or 'assets/images/male.png')
    item_metadata.issuedon = os.date('%m / %d / %Y',curtime)
	item_metadata.expireson = os.date('%m / %d / %Y', diftime)

    return item_metadata
end

local function giveStarterItems()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    for _, v in pairs(QBCore.Shared.StarterItems) do
        local info = {}
        if v.item == "id_card" then
            info = generateItemMetadata(v.item, Player.PlayerData)
        elseif v.item == "driver_license" then
            info = generateItemMetadata(v.item, Player.PlayerData)
        end

        exports['qb-inventory']:AddItem(Player.PlayerData.source, v.item, 1, info)
    end
end

-- Callbacks

QBCore.Functions.CreateCallback('qb-cityhall:server:receiveJobs', function(_, cb)
    cb(availableJobs)
end)

-- Events

RegisterNetEvent('qb-cityhall:server:requestId', function(item, hall, mugshotURL)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local itemInfo = Config.Cityhalls[hall].licenses[item]
    if not Player.Functions.RemoveMoney("cash", itemInfo.cost, 'purchased city hall license') then return TriggerClientEvent('QBCore:Notify', src, ('You don\'t have enough money on you, you need %s cash'):format(itemInfo.cost), 'error') end
    local info = {}
    if item == "id_card" then
        info = exports['qbx_idcard'].CreateMetaLicense(src, src, item)
    elseif item == "driver_license" then
        info = exports['qbx_idcard'].CreateMetaLicense(src, src, item)
    elseif item == "weaponlicense" then
        info = exports['qbx_idcard'].CreateMetaLicense(src, src, item)
    elseif item == "huntinglicense" then
        info = exports['qbx_idcard'].CreateMetaLicense(src, src, item)
    elseif item == "fishinglicense" then
        info = exports['qbx_idcard'].CreateMetaLicense(src, src, item)
    elseif item == "waterslicense" then
        info = exports['qbx_idcard'].CreateMetaLicense(src, src, item)
    else
        return DropPlayer(src, 'Attempted exploit abuse')
    end
    -- if not Player.Functions.AddItem(item, 1, nil, info) then return end
    TriggerClientEvent('QBCore:Notify', src, ('You have received your %s for $%s'):format(itemInfo.label, itemInfo.cost), 'success', 3500)
    -- TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
end)

RegisterNetEvent('qb-cityhall:server:ApplyJob', function(job, cityhallCoords)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local ped = GetPlayerPed(src)
    local pedCoords = GetEntityCoords(ped)
    local JobInfo = QBCore.Shared.Jobs[job]
    if #(pedCoords - cityhallCoords) >= 20.0 or not availableJobs[job] then
        return DropPlayer(source, "Attempted exploit abuse")
    end
    Player.Functions.SetJob(job, 0)
    TriggerClientEvent('QBCore:Notify', src, Lang:t('info.new_job', {job = JobInfo.label}))
end)

RegisterNetEvent('qb-cityhall:server:getIDs', giveStarterItems)
