createdMusicPlayers, isBusy = {}, false

if Config.command then
    RegisterCommand(Config.command, function()
        openCarMusicPlayer()
    end)
end

function openCarMusicPlayer()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle ~= 0 then
        if Config.onlyDriver and GetPedInVehicleSeat(vehicle, -1) ~= ped then
            nass.notify(Config.locale["must_be_driver"], Config.locale["notif_error"], Config.locale["notif_error_title"], 5000)
            return 
        end
        if not Config.allowedClasses[GetVehicleClass(vehicle)] then
            nass.notify(Config.locale["class_not_allowed"], Config.locale["notif_error"], Config.locale["notif_error_title"], 5000)
            return
        end
        if Config.specifyVehiclesType == "blacklist" then
            if Config.specifyVehicles[GetEntityModel(vehicle)] then
                nass.notify(Config.locale["vehicle_is_blacklisted"], Config.locale["notif_error"], Config.locale["notif_error_title"], 5000)
                return
            end
        elseif Config.specifyVehiclesType == "whitelist" then
            if not Config.specifyVehicles[GetEntityModel(vehicle)] then
                nass.notify(Config.locale["vehicle_is_not_whitelisted"], Config.locale["notif_error"], Config.locale["notif_error_title"], 5000)
                return
            end
        end
        if Config.item.enabled then
            nass.triggerCallback('nass_musicplayer:callback', function(hasItem, playlists_, recents_)
                if hasItem > 0 then
                    openMusicPlayer(VehToNet(vehicle), {playlists = playlists_, recents = recents_})
                else
                    nass.notify(Config.locale["missing_item"], Config.locale["notif_error"], Config.locale["notif_error_title"], 5000)
                end
            end, {event="hasItem",item=Config.item.name})
        else
            openMusicPlayer(VehToNet(vehicle))
        end
    else
        nass.notify(Config.locale["must_be_in_veh"], Config.locale["notif_error"], Config.locale["notif_error_title"], 5000)
    end
end

local hasSpeakerInHand = false

Citizen.CreateThread(function()
    for k, v in pairs(Config.defaultPlayers) do
        local handle = exports.nass_musicplayer:GetHandleFromCoords(v.position)
        if Config.target then
            nass.target.addBoxZone(v.position.xyz, 0.0, {x=2,y=2,z=2}, 2.0, {
                {
                    label = Config.locale["open_player"],
                    --icon = Config.target.icon,
                    event = "nass_musicplayer:openMusicPlayer",
                    handle = handle,
                    groups = v.job,
                }
            })
        end
        v.handle = handle
        createdMusicPlayers[handle] = v
    end
    
    while not Config.target do
        local sleep = 2000
        if not hasSpeakerInHand then
            for k, v in pairs(createdMusicPlayers) do
                local ped = PlayerPedId()
                if #(GetEntityCoords(ped) - vec3(v.position.x,v.position.y,v.position.z)) < 10 then
                    sleep = 500
                    if #(GetEntityCoords(ped) - vec3(v.position.x,v.position.y,v.position.z)) < 1.9 then
                        sleep = 0
                        if not isBusy then
                            local helpStr = Config.locale["press_open_player"]
                            if v.speakerType ~= nil and GetPlayerServerId(PlayerId()) == v.placer then
                                helpStr = helpStr .."\n"..Config.locale["press_pickup_speaker"]
                            end
                            if v.speakerType ~= nil and GetPlayerServerId(PlayerId()) == v.placer then
                                helpStr = helpStr .."\n"..Config.locale["press_move_player"]
                            end
                            nass.showHelpNotification(helpStr)
                            if IsControlJustReleased(0, 38) then
                                isBusy = true
                                v.speaker = true
                                TriggerEvent("nass_musicplayer:openMusicPlayer", v)
                            elseif IsControlJustReleased(0, 58) and v.speakerType ~= nil and GetPlayerServerId(PlayerId()) == v.placer then
                                isBusy = true
                                TriggerEvent("nass_musicplayer:pickupSpeaker", v)
                            elseif IsControlJustReleased(0, 74) and v.speakerType ~= nil and GetPlayerServerId(PlayerId()) == v.placer then
                                isBusy = true
                                TriggerEvent("nass_musicplayer:moveSpeaker", v)
                            end
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

AddEventHandler('nass_musicplayer:pickupSpeaker', function(data)
    if data.anim.enabled then
        nass.requestAnimDict(data.anim.dict)
        while not HasAnimDictLoaded(data.anim.dict) do
            RequestAnimDict(data.anim.dict)
            Wait(10)
        end
        local ped = PlayerPedId()
        TaskPlayAnim(ped, data.anim.dict, data.anim.anim, 8.0, 8.0, -1, 50, 0, false, false, false)
        Wait(1500)
        ClearPedTasks(ped)
    end
    exports.nass_musicplayer:deleteMediaPlayer((data.entity or NetToEnt(data?.netEnt)), data.coordsHandle)

    if data.isItem then
        if DoesEntityExist(data.entity or NetToEnt(data?.netEnt)) then
            DeleteObject(data.entity or NetToEnt(data?.netEnt))
        end
        Wait(100)
        if not DoesEntityExist((data.entity or NetToEnt(data?.netEnt))) then
            TriggerServerEvent("nass_musicmanager:pickupSpeaker", data.speakerType, 1)
        end
    end
    
    isBusy = false
end)

AddEventHandler('nass_musicplayer:moveSpeaker', function(data)
    if hasSpeakerInHand then return end
    local ped = PlayerPedId()
    hasSpeakerInHand = true

    if data.anim.enabled then
        nass.requestAnimDict(data.anim.dict)
        while not HasAnimDictLoaded(data.anim.dict) do
            RequestAnimDict(data.anim.dict)
            Wait(10)
        end
        
        TaskPlayAnim(ped, data.anim.dict, data.anim.anim, 8.0, 8.0, -1, 50, 0, false, false, false)
        Wait(1500)
        ClearPedTasks(ped)
    end

    local speakerEnt = data.entity ~= nil and data.entity or NetToEnt(data.netEnt)

    local boneIndex = GetPedBoneIndex(ped, 57005)
    AttachEntityToEntity(speakerEnt, ped, boneIndex, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
    Wait(100)
    isBusy = false
    Citizen.CreateThread(function()
        while hasSpeakerInHand do
            if not isBusy then
                nass.showHelpNotification(Config.locale["press_place_player"])
                if IsControlJustReleased(0, 38) then
                    isBusy = true
                    if data.anim.enabled then
                        nass.requestAnimDict(data.anim.dict)
                        while not HasAnimDictLoaded(data.anim.dict) do
                            RequestAnimDict(data.anim.dict)
                            Wait(10)
                        end
                        
                        TaskPlayAnim(ped, data.anim.dict, data.anim.anim, 8.0, 8.0, -1, 50, 0, false, false, false)
                        Wait(1500)
                        ClearPedTasks(ped)
                    end
                    
                    local position_ = GetEntityCoords(ped) - vector3(0.0, 0.0, 1.0)
                    position_ = ((nass.getCoordsInDirection(position_, (GetEntityHeading(ped)+90), 1.0)) + Config.speakers[data.speakerType].posOffset)
                    local heading_ = GetEntityHeading(ped) + Config.speakers[data.speakerType].rotOffset

                    DetachEntity(speakerEnt)

                    SetEntityCoords(speakerEnt, position_.x ,position_.y, position_.z)
                    SetEntityHeading(speakerEnt, heading_)
                    hasSpeakerInHand = false

                    TriggerServerEvent("nass_musicmanager:updateSpeakerCoords", speakerEnt, {x=position_.x, y=position_.y, z=position_.z})
                    
                end
            end
            Wait(0)
        end
        isBusy = false
    end)
end)

RegisterNetEvent("nass_musicmanager:updateCreatedPlayers")
AddEventHandler('nass_musicmanager:updateCreatedPlayers', function(handle, newCoords)
    if createdMusicPlayers == nil or createdMusicPlayers[handle] == nil or createdMusicPlayers[handle].position == nil then return end
    createdMusicPlayers[handle].position = newCoords
end)

RegisterNetEvent("nass_musicplayer:createSpeaker")
AddEventHandler('nass_musicplayer:createSpeaker', function(data)
    local ped = PlayerPedId()

    if data.anim.enabled then
        nass.requestAnimDict(data.anim.dict)
        while not HasAnimDictLoaded(data.anim.dict) do
            RequestAnimDict(data.anim.dict)
            Wait(10)
        end
        TaskPlayAnim(ped, data.anim.dict, data.anim.anim, 8.0, 8.0, -1, 50, 0, false, false, false)
        Wait(1500)
        ClearPedTasks(ped)
    end
    local entity = exports.nass_musicplayer:createMediaPlayer(data)
    TriggerServerEvent("nass_musicmanager:speakerCreated", ObjToNet(entity), data)
end)

RegisterNetEvent("nass_musicplayer:openVehicleMusicPlayer")
AddEventHandler('nass_musicplayer:openVehicleMusicPlayer', function()
    openCarMusicPlayer()
end)

RegisterNUICallback('saveKVP', function(data)
    DeleteResourceKvp(data.event)
    Wait(500)
    SetResourceKvp(data.event, json.encode(data.data))
end)

RegisterNUICallback('getKVP', function(data, cb)
    local data = GetResourceKvpString(data.event)
    local sendingData = json.decode(data)
    cb(sendingData)
end)

RegisterNetEvent("nass_musicplayer:installRadio")
AddEventHandler('nass_musicplayer:installRadio', function()
    local playerPed = PlayerPedId()

    if Config.install.anim.enabled then
        FreezeEntityPosition(playerPed, true)
        nass.requestAnimDict(Config.install.anim.dict)
        while not HasAnimDictLoaded(Config.install.anim.dict) do
            RequestAnimDict(Config.install.anim.dict)
            Wait(10)
        end
        TaskPlayAnim(playerPed, Config.install.anim.dict, Config.install.anim.anim, 3.0, 3.0, -1, 50, 0, false, false, false)

        Wait(3000)
        nass.notify(Config.locale["radio_installed"], "checkmark", Config.locale["player"], 5000)

        ClearPedTasks(playerPed)
        FreezeEntityPosition(playerPed, false)
    end
end)
