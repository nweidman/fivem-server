local config = lib.loadJson('qbx_noshuff.config')

---Disables auto seat switching
---@param seatIndex number
local function disableAutoShuffle(seatIndex)
    SetPedConfigFlag(cache.ped, 184, true)

    if cache.vehicle and not cache.seat then
        SetPedIntoVehicle(cache.ped, cache.vehicle, seatIndex)
    end
end

lib.onCache('seat', disableAutoShuffle)

---Makes the player ped shuffle to the next vehicle seat. 
local function shuffleSeat(self)
    if QBX.PlayerData.metadata.ishandcuffed then
        return exports.qbx_core:Notify(locale('error.is_handcuffed'), 'error')
    end

    if LocalPlayer.state.seatbelt then
        return exports.qbx_core:Notify(locale('error.is_fastened'), 'error')
    end

    self:disable(true)
    if cache.vehicle and cache.seat then
        TaskShuffleToNextVehicleSeat(cache.ped, cache.vehicle)
        repeat
            Wait(0)
        until not GetIsTaskActive(cache.ped, 165)
    end
    self:disable(false)
end

lib.addKeybind({
    name = 'shuffleSeat',
    description = locale('info.shuffleSeat'),
    defaultKey = config.shuffleSeatKey,
    onPressed = shuffleSeat
})

RegisterNetEvent('QBCore:Client:EnteredVehicle', function(data)
    Citizen.CreateThread(function()
        local ped = PlayerPedId()
        local dogPed = GetEntityModel(ped)--[[ Get your spawned dog ped here ]]
        local isDog = false
        local isDogSmall = false
        BigDogs = {
            "a_c_chop",
            "a_c_husky",
            "a_c_retriever",
            "a_c_shepherd",
            "a_c_rottweiler",
            "ft-aushep",
            "ft-bloodhound",
            "ft-groe",
            "ft-pterrier",
            "ft-pandags",
            "ft-amakita",
            "ft_dshepherd",
            "bughusky",
            "ft-dobermanv2",
            "bugdoberman",
            "a_c_dalmatian",
            "golden_r",
            "bugk9"
        }
        SmallDogs = {
            "a_c_aussiepup",
        }
            for _, model in ipairs(BigDogs) do
                if dogPed == GetHashKey(model) then
                    isDog = true
                    break
                end
            end

            if not isDog then
                for _, model in ipairs(SmallDogs) do
                if dogPed == GetHashKey(model) then
                    isDogSmall = true
                    break
                end
            end
            end
        if not isDog and not isDogSmall then return end
        RequestAnimDict("creatures@rottweiler@incar@")
        if isDog then
            while not HasAnimDictLoaded("creatures@rottweiler@incar@") do
                Citizen.Wait(10)
            end
            while IsPedInAnyVehicle(ped, false) do
                -- Play the sitting animation
                TaskPlayAnim(ped, "creatures@rottweiler@incar@", "sit", 5.0, -5.0, -1, 0, 0, false, false, false)
                Wait(1000)
            end
            ClearPedTasksImmediately(ped)
        elseif isDogSmall then
            while not HasAnimDictLoaded("creatures@pug@amb@world_dog_sitting@idle_a") do
                Citizen.Wait(10)
            end
            while IsPedInAnyVehicle(ped, false) do
                -- Play the sitting animation
                TaskPlayAnim(ped, "creatures@pug@amb@world_dog_sitting@idle_a", "idle_b", 5.0, -5.0, -1, 0, 0, false, false, false)
                Wait(1000)
            end
            ClearPedTasksImmediately(ped)
        end
    end)
    local sleep
    local ped = PlayerPedId()
    while IsPedInAnyVehicle(ped, false) do
        sleep = 100
        if IsPedInAnyVehicle(ped, false) and disableShuffle then
            if GetPedInVehicleSeat(data.vehicle, 0) == ped then
                if GetIsTaskActive(ped, 165) then
                    sleep = 0
                    SetPedIntoVehicle(ped, data.vehicle, 0)
                    SetPedConfigFlag(ped, 184, true)
                end
            end
        end
        Wait(sleep)
    end
end)