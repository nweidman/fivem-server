function canOpenDJBooth(source)
    if Config.permissions.defaultPlayer.enabled then
        for k, v in pairs(Config.permissions.defaultPlayer.ace or {}) do
            if IsPlayerAceAllowed(source, v) then
                return true
            end
        end
        return false
    end
    return true
end

function canOpenSpeaker(source)
    if Config.permissions.speaker.enabled then
        for k, v in pairs(Config.permissions.speaker.ace or {}) do
            if IsPlayerAceAllowed(source, v) then
                return true
            end
        end
        return false
    end
    return true
end

function canOpenVehicleMusicPlayer(source)
    if Config.permissions.vehiclePlayer.enabled then
        for k, v in pairs(Config.permissions.vehiclePlayer.ace or {}) do
            if IsPlayerAceAllowed(source, v) then
                return true
            end
        end
        return false
    end
    return true
end


Citizen.CreateThread(function()
    Wait(2000)
    for k, v in pairs(Config.defaultPlayers) do
        exports.nass_musicplayer:getSongData(v.url, function(thumbnail, author, title, videoId, duration)
            v.thumbnail = thumbnail
            v.author = author
            v.title = title
            v.url = videoId ~= nil and videoId or v.url
            v.duration = duration
            if v.loop and v.url == "" then
                v.loop = false
            end
            handle = exports.nass_musicplayer:startByCoords(v.position.x, v.position.y, v.position.z, v)
        end)
    end
    if Config.item.enabled and Config.item.usableItem then
        nass.registerItem(Config.item.name,function(source, remove, item) 
            TriggerClientEvent("nass_musicplayer:openVehicleMusicPlayer", source)
        end)
    end
    if Config.install.enabled then
        nass.registerItem(Config.install.name,function(source, remove, item) 
            local jobData = nass.getPlayerJob(source)
            local jobName, jobGrade = jobData.name, jobData.grade
            if type(jobGrade) == "table" then
                jobGrade = jobGrade.level
            end

            if (#Config.install.job == 0) or (Config.install.job[jobName] ~= nil and Config.install.job[jobName] <= jobGrade) then
                local ped = GetPlayerPed(source)
                local vehicle = GetVehiclePedIsIn(ped, false)

                if vehicle == nil or vehicle == 0 then
                    nass.notify(source, Config.locale["must_be_in_veh"], Config.locale["notif_error"], Config.locale["notif_error_title"], 5000)
                else
                    MySQL.query('SELECT * FROM `nass_musicplayer_installed` WHERE plate = ?', {GetVehicleNumberPlateText(vehicle)}, function(installedRadios)
                        if not installedRadios[1] then 
                            FreezeEntityPosition(vehicle, true)
                            TriggerClientEvent("nass_musicplayer:installRadio", source)
                            Wait(3000)
                            FreezeEntityPosition(vehicle, false)
                            nass.removeItem(source, Config.install.name, 1)
                            MySQL.insert.await('INSERT INTO `nass_musicplayer_installed` (plate, installed) VALUES (?, ?)', {GetVehicleNumberPlateText(vehicle), 1}) 
                        end
                    end)
                end
            end
        end)
    end
    for k, v in pairs(Config.speakers) do
        if v.usableItem then
            nass.registerItem(k,function(source, remove, item) 
                local ped = GetPlayerPed(source)
                local position_ = GetEntityCoords(ped) - vector3(0.0, 0.0, 1.0)
                position_ = ((nass.getCoordsInDirection(position_, (GetEntityHeading(ped)+90), 1.0)) + v.posOffset)

                v.position = position_
                v.frozen = true
                v.speakerType = k
                v.placer = source
                v.isItem = true
                v.heading = GetEntityHeading(ped) + v.rotOffset

                local vehicle = GetVehiclePedIsIn(ped, false)
                if vehicle and vehicle ~= 0 then
                    nass.notify(source, Config.locale["cannot_in_car"], Config.locale["notif_error"], Config.locale["notif_error_title"], 5000)
                    return
                end

                TriggerClientEvent("nass_musicplayer:createSpeaker", source, v)
                nass.removeItem(source, k, 1)
            end)
        end
        if v.command then
            RegisterCommand(k, function(source)
                local ped = GetPlayerPed(source)
                local position_ = GetEntityCoords(ped) - vector3(0.0, 0.0, 1.0)
                position_ = ((nass.getCoordsInDirection(position_, (GetEntityHeading(ped)+90), 1.0)) + v.posOffset)

                v.position = position_
                v.frozen = true
                v.speakerType = k
                v.placer = source
                v.isItem = false
                v.heading = GetEntityHeading(ped) + v.rotOffset

                local vehicle = GetVehiclePedIsIn(ped, false)
                if vehicle and vehicle ~= 0 then
                    nass.notify(source, Config.locale["cannot_in_car"], Config.locale["notif_error"], Config.locale["notif_error_title"], 5000)
                    return
                end

                TriggerClientEvent("nass_musicplayer:createSpeaker", source, v)
            end)
        end
    end
end)

RegisterNetEvent("nass_musicmanager:pickupSpeaker")
AddEventHandler("nass_musicmanager:pickupSpeaker", function(speakerType, amount)
	if not Config.speakers[speakerType] or amount ~= 1 then
        print("Player ".. source .." has tried exploiting the pickup speaker event.")
        --Add your ban event here
        --DropPlayer(source)
    end
    nass.addItem(source, speakerType, 1)
end)

function openMusicPlayer(source , data, cb)
    local function getPlaylistsAndRecents(data)
        local playlists_, recents_
        
        local playlists = MySQL.query.await('SELECT * FROM `nass_musicplayer_playlists` WHERE identifier = ?', {nass.getPlayerIdentifier(source)})
        local recentSongs = MySQL.query.await('SELECT * FROM `nass_musicplayer_recentlyplayed` WHERE identifier = ?', {nass.getPlayerIdentifier(source)})

        if playlists and playlists[1] then 
            for k, v in pairs(playlists) do
                v.data = json.decode(v.data)
            end
            playlists_ = playlists
        end

        if recentSongs and recentSongs[1] then 
            recentSongs[1].data = json.decode(recentSongs[1].data)
            recents_ = recentSongs
        else
            MySQL.insert.await('INSERT INTO `nass_musicplayer_recentlyplayed` (data, identifier) VALUES (?, ?)', {json.encode({}), nass.getPlayerIdentifier(source)}) 
        end

        return playlists_, recents_
    end

    if Config.install.enabled and not data.needsInstall then 
        if not canOpenVehicleMusicPlayer(source) then
            nass.notify(source, Config.locale["not_allowed"], Config.locale["notif_error"], Config.locale["notif_error_title"], 5000)
            return
        end
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(source), false)
        MySQL.query('SELECT * FROM `nass_musicplayer_installed` WHERE plate = ?', {GetVehicleNumberPlateText(vehicle)}, function(installedRadios)
            if installedRadios and installedRadios[1] and installedRadios[1].installed == 1 then 
                cb(getPlaylistsAndRecents(data))
            else
                nass.notify(source, Config.locale["vehicle_is_not_whitelisted"], Config.locale["notif_error"], Config.locale["notif_error_title"], 5000)
            end
        end)
    else
        if data.isSpeaker then
            if not canOpenSpeaker(source) then
                nass.notify(source, Config.locale["not_allowed"], Config.locale["notif_error"], Config.locale["notif_error_title"], 5000)
                return
            end
        else
            if not canOpenDJBooth(source) then
                nass.notify(source, Config.locale["not_allowed"], Config.locale["notif_error"], Config.locale["notif_error_title"], 5000)
                return
            end
        end
        cb(getPlaylistsAndRecents(data))
    end
end


nass.versionCheck(GetCurrentResourceName())

local function initializeDatabase()
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS `nass_musicplayer_likedsongs` (
            `identifier` varchar(60) NOT NULL,
            `data` longtext NOT NULL,
            PRIMARY KEY (`identifier`) USING BTREE
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    ]], {}, function(result)
        if result.warningStatus == 0 then
            print("^2[nass_musicplayer] Likedsongs table initialized^0")
        end
    end)
    
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS `nass_musicplayer_playlists` (
            `id` int(11) NOT NULL AUTO_INCREMENT,
            `identifier` varchar(60) DEFAULT NULL,
            `data` longtext NOT NULL,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
    ]], {}, function(result)
        if result.warningStatus == 0 then
            print("^2[nass_musicplayer] Playlists table initialized^0")
        end
    end)
    
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS `nass_musicplayer_recentlyplayed` (
            `identifier` varchar(60) NOT NULL,
            `data` longtext NOT NULL,
            PRIMARY KEY (`identifier`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    ]], {}, function(result)
        if result.warningStatus == 0 then
            print("^2[nass_musicplayer] Recentlyplayed table initialized^0")
        end
    end)
    
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS `nass_musicplayer_installed` (
            `plate` varchar(50) NOT NULL,
            `installed` int(11) NOT NULL DEFAULT 1,
            PRIMARY KEY (`plate`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
    ]], {}, function(result)
        if result.warningStatus == 0 then
            print("^2[nass_musicplayer] Installed table initialized^0")
        end
    end)

    local emojiFixes = {
        [[ALTER TABLE `nass_musicplayer_likedsongs` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;]],
        [[ALTER TABLE `nass_musicplayer_playlists` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;]],
        [[ALTER TABLE `nass_musicplayer_recentlyplayed` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;]]
    }
    for k, v in pairs(emojiFixes) do
        MySQL.query(v, {})
    end
end

-- Wait for MySQL to be ready, then initialize the database
MySQL.ready(function()
    initializeDatabase()
end)
