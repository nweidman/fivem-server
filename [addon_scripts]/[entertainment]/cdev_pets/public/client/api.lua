---@type CLIBClient
clib = exports.cdev_lib:Get()
loc = clib.localizer.get


PetClientAPI = {}

PetClientAPI.OpenShop = function(shop)
    OpenShop(shop)
end

PetClientAPI.GetBalanceForShop = function()
    return clib.api.Character.GetCash()
end

PetClientAPI.isDead = function()
    return clib.api.Character.IsDead()
end

PetClientAPI.lockWeaponUsageTick = function()
    SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
end

if PublicSharedPetsConfig.PedShop.WantPedShop then
    local pedCoords = PublicSharedPetsConfig.PedShop.PedCoords
    local pedModel = PublicSharedPetsConfig.PedShop.PedModel

    CreateThread(function()
        clib.wrappers.LoadModel(pedModel)

        local finalZ = pedCoords.z

        local ped = CreatePed(4, pedModel, pedCoords.x, pedCoords.y, finalZ, pedCoords.w, false, true)

        Wait(500)

        SetEntityCoordsNoOffset(ped, pedCoords.x, pedCoords.y, finalZ, false, false, false)

        clib.wrappers.UnloadModel(pedModel)

        local blip = AddBlipForCoord(pedCoords.x, pedCoords.y, finalZ)
        SetBlipSprite(blip, 442)
        SetBlipScale(blip, 0.6)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Pet Shop")
        EndTextCommandSetBlipName(blip)

        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetPedRagdollOnCollision(ped, false)

        if not PublicSharedPetsConfig.PedShop.UseDrawTextForPedShop then
            clib.api.ThirdEye.AddEntityInteraction({
                entity = ped,
                event = 'cdev_pets:loadShop',
                faIcon = 'fa-solid fa-dog',
                label = "Open Pet Shop",
            })
        else
            local control = PublicSharedPetsConfig.PedShop.PedShopControl or 38
            local drawTextDistance = PublicSharedPetsConfig.PedShop.DrawTextDistance or 3.0
            local textCoords = vector3(pedCoords.x, pedCoords.y, finalZ + 1.0)
            local textToShow = loc("PedShop_drawtext") or "[E] - Pet Shop"

            CreateThread(function()
                PedShopThreadActive = true
                local sleep = 1000

                while PedShopThreadActive do
                    local playerPed = PlayerPedId()
                    local playerCoords = GetEntityCoords(playerPed)
                    local pedVec = vector3(pedCoords.x, pedCoords.y, finalZ)
                    local distance = #(playerCoords - pedVec)

                    if distance < 60 then
                        if distance < drawTextDistance then
                            sleep = 5
                            clib.wrappers.DrawText3D(textToShow, textCoords, 0.6, { 255, 255, 255, 255 }, true, 4)

                            if IsControlJustPressed(0, control) then
                                TriggerEvent('cdev_pets:loadShop')
                            end
                        else
                            sleep = 100
                        end
                    else
                        sleep = 1000
                    end

                    Wait(sleep)
                end
            end)
        end
    end)
end
