-- qbx_vehiclepush/client.lua
-- Requires: ox_lib (cache/lib), ox_target
-- Fuel detection: decorator (lc_fuel / LegacyFuel style) -> statebag -> native
-- NO fuel exports are called anywhere in this file (so no GetFuel(nil) warnings).
-- Use: 3rd eye anywhere on a vehicle -> "Push Vehicle (press X to stop)". Press X to stop.

CreateThread(function()
    local config = lib.loadJson('qbx_vehiclepush.config') or {}
    config.damageNeeded   = config.damageNeeded   or 300.0   -- push if engine health <= this
    config.fuelThreshold  = config.fuelThreshold  or 5       -- push if fuel <= this (%)
    config.pushSpeed      = config.pushSpeed      or 1.0     -- SetVehicleForwardSpeed magnitude

    -- Common decorator names used by LegacyFuel/lc_fuel forks
    local fuelDecorCandidates = {
        "_FUEL_LEVEL", "FUEL_LEVEL", "fuelLevel", "Fuel_Level", "fuel"
    }

    -- Register possible fuel decorators so DecorGetFloat works reliably
    for _, name in ipairs(fuelDecorCandidates) do
        pcall(DecorRegister, name, 1) -- 1 = float
    end

    -- ========== Helpers ==========
    local function isVeh(veh)
        if type(veh) == 'string' then veh = tonumber(veh) end
        return type(veh) == 'number' and veh ~= 0 and DoesEntityExist(veh) and GetEntityType(veh) == 2
    end

    local function requestControl(ent, timeout)
        NetworkRequestControlOfEntity(ent)
        local t0, lim = GetGameTimer(), (timeout or 1500)
        while not NetworkHasControlOfEntity(ent) and (GetGameTimer() - t0) < lim do
            Wait(0); NetworkRequestControlOfEntity(ent)
        end
        return NetworkHasControlOfEntity(ent)
    end

    -- Read fuel from known decorators; fallback to statebag/native. Returns number (0-100-ish).
    local function getFuel(veh)
        if not isVeh(veh) then return 0 end

        -- decorator first
        for _, name in ipairs(fuelDecorCandidates) do
            if DecorExistOn(veh, name) then
                local v = DecorGetFloat(veh, name)
                if v ~= nil then return tonumber(v) or 0 end
            end
        end

        -- statebag fallback (some frameworks mirror fuel here)
        local sb = Entity(veh).state and Entity(veh).state.fuel
        if sb ~= nil then return tonumber(sb) or 0 end

        -- native fallback
        local lvl = GetVehicleFuelLevel(veh)
        return tonumber(lvl) or 0
    end

    -- Is ped in front of the vehicle (hood side)?
    local function pedIsInFrontOfVehicle(ped, veh)
        local vpos, ppos = GetEntityCoords(veh), GetEntityCoords(ped)
        local fwd, dir   = GetEntityForwardVector(veh), (ppos - vpos)
        return (fwd.x*dir.x + fwd.y*dir.y + fwd.z*dir.z) > 0.0
    end

    -- Front/rear bumper world position; fallback to dims if bones are missing
    local function getBumperWorld(veh, isFront)
        local bone = GetEntityBoneIndexByName(veh, isFront and 'bumper_f' or 'bumper_r')
        if bone ~= -1 then return GetWorldPositionOfEntityBone(veh, bone) end
        local minD, maxD = GetModelDimensions(GetEntityModel(veh))
        local vpos, fwd  = GetEntityCoords(veh), GetEntityForwardVector(veh)
        local halfLen = (maxD.y - minD.y) * 0.5
        return isFront and (vpos + fwd * halfLen) or (vpos - fwd * halfLen)
    end

    -- Attach + anim (collision ON; no ghosting)
    local function startAttachAndAnim(ped, veh)
        local inFront = pedIsInFrontOfVehicle(ped, veh)

        local bumper = getBumperWorld(veh, inFront)
        local fwd    = GetEntityForwardVector(veh)
        local target = inFront and (bumper + fwd * 0.35) or (bumper - fwd * 0.35)

        -- place on ground
        local groundZ = bumper.z
        local found, gz = GetGroundZFor_3dCoord(target.x, target.y, target.z + 1.0, false)
        if found then groundZ = gz end
        SetEntityCoordsNoOffset(ped, target.x, target.y, groundZ + 0.05, false, false, false)

        -- face properly: front push faces the car (+180), rear push faces forward
        local vehHeading = GetEntityHeading(veh)
        SetEntityHeading(ped, (inFront and (vehHeading + 180.0) or vehHeading) % 360.0)

        -- attach offset so ped stands where we placed them (hands ~ chest height)
        local off  = GetOffsetFromEntityGivenWorldCoords(veh, target.x, target.y, groundZ + 0.85)
        local rotZ = inFront and 180.0 or 0.0

        SetPedCanRagdoll(ped, false)
        SetEntityCollision(ped, true, true)

        local vehBone = GetEntityBoneIndexByName(veh, 'bodyshell')
        if vehBone == -1 then vehBone = GetEntityBoneIndexByName(veh, 'chassis') end
        if vehBone == -1 then vehBone = -1 end

        -- soft pin + collision ON
        AttachEntityToEntity(
            ped, veh, vehBone,
            off.x, off.y, off.z,
            0.0, 0.0, rotZ,
            false, true,   -- useSoftPinning
            true,          -- collision ON
            true, 2, true  -- isPed, vertexIndex, fixedRot
        )

        lib.requestAnimDict('missfinale_c2ig_11')
        TaskPlayAnim(ped, 'missfinale_c2ig_11', 'pushcar_offcliff_m', 2.0, -8.0, -1, 35, 0, false, false, false)

        return inFront
    end

    local function stopAttachAndAnim(ped, veh)
        DetachEntity(ped, false, false)
        StopAnimTask(ped, 'missfinale_c2ig_11', 'pushcar_offcliff_m', 2.0)
        SetPedCanRagdoll(ped, true)
        if DoesEntityExist(veh) then SetVehicleOnGroundProperly(veh) end
    end

    local pushing = false

    local function doPush(veh)
        if pushing or not isVeh(veh) then return end
        local ped = cache.ped or PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then return end
        if not requestControl(veh, 1500) then return end

        local class = GetVehicleClass(veh)
        if class == 13 or class == 14 or class == 15 or class == 16 then return end

        -- Use our no-export fuel getter here as well
        local engine   = GetVehicleEngineHealth(veh)
        local fuel     = getFuel(veh)
        local broken   = (engine >= 0 and engine <= config.damageNeeded)
        local outOfGas = (fuel <= config.fuelThreshold)
        if not (broken or outOfGas) then return end
        if not IsVehicleSeatFree(veh, -1) then return end

        pushing = true
        local inFront = startAttachAndAnim(ped, veh)

        while pushing do
            Wait(0)
            if cache.vehicle or not isVeh(veh) then break end

            -- steer with A/D
            if IsControlPressed(0, 34) then
                TaskVehicleTempAction(ped, veh, 11, 1)
            elseif IsControlPressed(0, 9) then
                TaskVehicleTempAction(ped, veh, 10, 1)
            end

            inFront = pedIsInFrontOfVehicle(ped, veh)
            SetVehicleForwardSpeed(veh, (inFront and -config.pushSpeed or config.pushSpeed))

            if HasEntityCollidedWithAnything(veh) then
                SetVehicleOnGroundProperly(veh)
            end

            -- keep validating (still no exports)
            engine   = GetVehicleEngineHealth(veh)
            fuel     = getFuel(veh)
            broken   = (engine >= 0 and engine <= config.damageNeeded)
            outOfGas = (fuel <= config.fuelThreshold)

            local pedPos, vehPos = GetEntityCoords(ped), GetEntityCoords(veh)
            if IsControlJustPressed(0, 73)          -- X to cancel
               or not IsVehicleSeatFree(veh, -1)
               or not (broken or outOfGas)
               or #(pedPos - vehPos) > 4.0 then
                break
            end
        end

        pushing = false
        stopAttachAndAnim(ped, veh)
    end

    -- ========== ox_target: anywhere on the vehicle ==========
    exports.ox_target:addGlobalVehicle({
        {
            name = 'qbx_push_vehicle_anywhere',
            icon = 'fa-solid fa-hands',
            label = 'Push Vehicle (press X to stop)',
            distance = 2.5,
            -- IMPORTANT: no exports here either; entity can be transient.
            canInteract = function(entity)
                if not isVeh(entity) then return false end
                if IsPedInAnyVehicle(PlayerPedId(), false) then return false end
                if not IsVehicleSeatFree(entity, -1) then return false end

                local class = GetVehicleClass(entity)
                if class == 13 or class == 14 or class == 15 or class == 16 then
                    return false
                end

                local engine = GetVehicleEngineHealth(entity)
                local broken = (engine >= 0 and engine <= config.damageNeeded)

                -- Fuel: read decorator -> native (no exports)
                local lvl = nil
                for _, name in ipairs(fuelDecorCandidates) do
                    if DecorExistOn(entity, name) then
                        local v = DecorGetFloat(entity, name)
                        if v ~= nil then lvl = tonumber(v) break end
                    end
                end
                if lvl == nil then
                    lvl = tonumber(GetVehicleFuelLevel(entity)) or 0
                end

                local outOfGas = (lvl <= config.fuelThreshold)
                return (broken or outOfGas) and not pushing
            end,
            onSelect = function(data)
                local veh = data.entity
                if isVeh(veh) then
                    doPush(veh)
                end
            end
        }
    })
end)

    -- /anchor

-- local SPEED_LIMIT_MS = 5.0 -- 5 m/s ≈ 11 mph

-- local function isBoat(veh)
--     if not veh or veh == 0 then return false end
--     return GetVehicleClass(veh) == 14 or IsThisModelABoat(GetEntityModel(veh))
-- end

-- local function toggleAnchor(boat, ped)
--     if GetPedInVehicleSeat(boat, -1) ~= ped then
--         lib.notify({ title = 'Anchor', description = 'You must be the driver to use the anchor.', type = 'error' })
--         return
--     end

--     local anchored = IsBoatAnchoredAndFrozen(boat)

--     if not anchored and GetEntitySpeed(boat) >= SPEED_LIMIT_MS then
--         lib.notify({ title = 'Anchor', description = 'You are going too fast!', type = 'error' })
--         return
--     end

--     local ok = lib.progressBar({
--         duration = anchored and 1500 or 2000,
--         label = anchored and 'Raising anchor...' or 'Dropping anchor...',
--         useWhileDead = false,
--         canCancel = true,
--         disable = { move = true, car = false, combat = true },
--     })
--     if not ok then return end

--     SetBoatAnchor(boat, not anchored)
--     SetBoatFrozenWhenAnchored(boat, not anchored)

--     lib.notify({
--         title = 'Anchor',
--         description = anchored and 'Anchor detached!' or 'Anchor attached!',
--         type = anchored and 'inform' or 'success'
--     })
-- end

-- RegisterCommand('anchor', function()
--     local ped = cache.ped or PlayerPedId()
--     local veh = GetVehiclePedIsIn(ped, false)

--     if veh ~= 0 and isBoat(veh) then
--         toggleAnchor(veh, ped)
--     else
--         lib.notify({ title = 'Anchor', description = 'You are not in a boat!', type = 'error' })
--     end
-- end, false)

-- lib.addKeybind({
--     name = 'anchor_toggle',
--     description = 'Toggle boat anchor',
--     defaultKey = 'J',
--     onPressed = function()
--         local ped = cache.ped or PlayerPedId()
--         local veh = GetVehiclePedIsIn(ped, false)
--         if veh ~= 0 and isBoat(veh) then
--             toggleAnchor(veh, ped)
--         end
--     end
-- })
