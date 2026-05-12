local RAGDOLL_WEAPON_HASH = `WEAPON_TARANTULA`
local RAGDOLL_COOLDOWN = 10000
local RAGDOLL_DURATION = 3000

local lastShot = 0

CreateThread(function()
    while true do
        Wait(0)

        local ped = PlayerPedId()
        if GetSelectedPedWeapon(ped) == RAGDOLL_WEAPON_HASH and IsPedShooting(ped) then
            local hit, target, bone = RaycastHead()

            if hit and IsPedAPlayer(target) and bone == 31086 then
                local serverId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(target))
                TriggerServerEvent("tarantula:hitPlayer", serverId)
            end
        end
    end
end)

function RaycastHead()
    local camCoords = GetGameplayCamCoord()
    local camRot = GetGameplayCamRot(2)
    local direction = RotationToDirection(camRot)
    local destination = camCoords + direction * 200.0

    local rayHandle = StartShapeTestRay(
        camCoords.x, camCoords.y, camCoords.z,
        destination.x, destination.y, destination.z,
        8, PlayerPedId(), 0
    )

    local _, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)

    if hit == 1 and IsPedAPlayer(entityHit) then
        local bone = GetPedBoneIndex(entityHit, 31086)
        local boneCoords = GetWorldPositionOfEntityBone(entityHit, bone)
        if #(endCoords - boneCoords) < 0.3 then
            return true, entityHit, 31086
        end
    end

    return false, nil, nil
end

function RotationToDirection(rot)
    local z = math.rad(rot.z)
    local x = math.rad(rot.x)
    local num = math.abs(math.cos(x))

    return vec3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
end

RegisterNetEvent('tarantula:ragdollMe', function()
    local now = GetGameTimer()
    if now - lastShot >= RAGDOLL_COOLDOWN then
        lastShot = now
        SetPedToRagdoll(PlayerPedId(), RAGDOLL_DURATION, RAGDOLL_DURATION, 0, false, false, false)
    end
end)
