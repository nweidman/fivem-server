local ghosts = {}
local ghostZones = {}
local RES = GetCurrentResourceName()

local function requestModel(model)
    lib.requestModel(model)
end

local function removeGhostZone(cid)
    if ghostZones[cid] then
        exports.ox_target:removeZone(ghostZones[cid])
        ghostZones[cid] = nil
    end
end

local function syncMyCrmAppearance()
    if GetResourceState('crm-appearance') ~= 'started' then return end

    local ped = PlayerPedId()
    if ped == 0 then return end

    local ok, appearance = pcall(function()
        return exports['crm-appearance']:crm_get_ped_appearance(ped)
    end)

    if ok and type(appearance) == 'table' then
        TriggerServerEvent('combatghost:server:updateAppearance', appearance)
    end
end

RegisterNetEvent('crm-appearance:load-player-skin', function()
    Wait(800)
    syncMyCrmAppearance()
end)

AddEventHandler('onResourceStart', function(res)
    if res == RES then
        Wait(3000)
        syncMyCrmAppearance()
    end
end)

RegisterCommand('syncappearance', function()
    syncMyCrmAppearance()
    lib.notify({
        title = 'Appearance',
        description = 'crm-appearance synced for ghost cloning.',
        type = 'success'
    })
end, false)

RegisterNetEvent('combatghost:client:appearanceSaved', function()
    Wait(300)
    syncMyCrmAppearance()
end)

AddEventHandler('crm-appearance:appearanceSaved', function()
    Wait(300)
    syncMyCrmAppearance()
end)

local function makeGhost(ped)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedCanRagdoll(ped, false)
    SetEntityCollision(ped, false, false)
    SetEntityAlpha(ped, Config.GhostAlpha or 180, false)
end

local function applyCrmAppearance(ped, appearance)
    if GetResourceState('crm-appearance') ~= 'started' then return end
    if not appearance then return end

    local skin = appearance
    if type(skin) == 'string' then
        local ok, decoded = pcall(json.decode, skin)
        if ok and type(decoded) == 'table' then
            skin = decoded
        end
    end
    if type(skin) ~= 'table' then return end

    pcall(function()
        exports['crm-appearance']:crm_set_ped_appearance(ped, skin)
    end)
end

local function playGhostAnim(ped)
    local dict = 'pazeee@sadb@animations'
    local tries = { 'clip', 'pazeee@sadb@clip' }

    lib.requestAnimDict(dict)

    for i = 1, #tries do
        TaskPlayAnim(
            ped,
            dict,
            tries[i],
            5.0,
            5.0,
            -1,
            2,
            0.0,
            false,
            false,
            false
        )

        Wait(300)

        if IsEntityPlayingAnim(ped, dict, tries[i], 3) then
            return
        end

        ClearPedTasks(ped)
    end
end

local function showGhostInfo(data)
    lib.registerContext({
        id = ('combatghost_info_%s'):format(data.cid),
        title = 'Ghost Info',
        options = {
            {
                title = data.name,
                description = ('CID: %s'):format(data.cid),
                icon = 'id-card'
            },
            {
                title = 'Disconnect Type',
                description = data.dropType or 'Unknown',
                icon = 'triangle-exclamation'
            }
        }
    })

    lib.showContext(('combatghost_info_%s'):format(data.cid))
end

local function addTarget(ped, data)
    local coords = GetEntityCoords(ped)

    local zoneId = exports.ox_target:addSphereZone({
        coords = vec3(coords.x, coords.y, coords.z + 0.55),
        radius = 1.75,
        debug = false,
        drawSprite = false,
        options = {
            {
                name = ('ghost_info_%s'):format(data.cid),
                label = 'View Ghost Info',
                icon = 'fa-solid fa-eye',
                distance = Config.TargetDistance or 2.0,
                onSelect = function()
                    showGhostInfo(data)
                end
            },
            {
                name = ('ghost_copy_%s'):format(data.cid),
                label = ('Copy Name + CID (%s)'):format(data.dropType or 'Unknown'),
                icon = 'fa-solid fa-copy',
                distance = Config.TargetDistance or 2.0,
                onSelect = function()
                    local text = ('%s | CID: %s | %s'):format(
                        data.name or 'Unknown',
                        data.cid or 'Unknown',
                        data.dropType or 'Unknown'
                    )

                    lib.setClipboard(text)
                    lib.notify({
                        title = 'Copied',
                        description = text,
                        type = 'success'
                    })
                end
            }
        }
    })

    ghostZones[data.cid] = zoneId
end

local function drawText3D(coords, text)
    local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)
    if not onScreen then return end

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextCentre(true)
    SetTextOutline()

    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(x, y)
end

CreateThread(function()
    while true do
        Wait(0)

        if not Config.Show3DLabel then
            Wait(500)
        else
            local myCoords = GetEntityCoords(PlayerPedId())

            for _, entry in pairs(ghosts) do
                if entry.ped and DoesEntityExist(entry.ped) then
                    local pcoords = GetEntityCoords(entry.ped)
                    if #(myCoords - pcoords) < 15.0 then
                        drawText3D(
                            vec3(pcoords.x, pcoords.y, pcoords.z + (Config.LabelHeight or 1.05)),
                            ('%s\nCID: %s\n%s'):format(
                                entry.data.name,
                                entry.data.cid,
                                entry.data.dropType
                            )
                        )
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('combatghost:client:spawnGhost', function(data)
    if not data or not data.cid then return end
    if ghosts[data.cid] then return end

    requestModel(data.model)

    local ped = CreatePed(
        0,
        data.model,
        data.coords.x,
        data.coords.y,
        data.coords.z - 1.0,
        data.heading or 0.0,
        false,
        true
    )

    SetEntityAsMissionEntity(ped, true, true)

    if data.appearance then
        CreateThread(function()
            Wait(250)
            for _ = 1, 6 do
                applyCrmAppearance(ped, data.appearance)
                Wait(250)
            end
        end)
    end

    playGhostAnim(ped)
    Wait(100)
    makeGhost(ped)
    addTarget(ped, data)

    ghosts[data.cid] = {
        ped = ped,
        data = data
    }
end)

RegisterNetEvent('combatghost:client:removeGhost', function(cid)
    local entry = ghosts[cid]
    if not entry then return end

    removeGhostZone(cid)

    if entry.ped and DoesEntityExist(entry.ped) then
        DeleteEntity(entry.ped)
    end

    ghosts[cid] = nil
end)

RegisterNetEvent('combatghost:client:removeAllGhosts', function()
    for cid in pairs(ghosts) do
        TriggerEvent('combatghost:client:removeGhost', cid)
    end
end)

AddEventHandler('onResourceStop', function(res)
    if res ~= RES then return end

    for cid in pairs(ghostZones) do
        removeGhostZone(cid)
    end
end)