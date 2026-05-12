-- Editable functions for RAT / NEEDLE EFFECTS

function CustomDispatch(coords) -- NEW -- Easier method to handling Exclusive Item Zones Reports
if GetResourceState("ps-dispatch") == "started" then
        exports["ps-dispatch"]:CustomAlert({
            coords = vector3(coords.x, coords.y, coords.z),
            message = "Trash Theft",
            dispatchCode = "10-4 Rubber Ducky",
            description = "Trash Theft",
            radius = 0,
            sprite = 480,
            color = 1,
            scale = 1.0,
            length = 3,
        })
    end
    -- Add your custom dispatch code here
end

function TriggerDirtyNeedlesEffect()
    if Framework.HasItem("hobo_gloves", 1) then
        Framework.Notify(Config.Lang['dirty_needles_stopped'], "success", 5000)
        return
    end
    drugged = true
    local healthLoss = Config.Fails.DirtyNeedlesHealthLoss 
    if not healthLoss then
        DebugPrint("Error: healthLoss is not defined in Config")
        return
    end
    Framework.LoadAnimDict(Config.DirtyNeedlesFailAnim.dict)
    TaskPlayAnim(cache.ped, Config.DirtyNeedlesFailAnim.dict, Config.DirtyNeedlesFailAnim.anim, 8.0, 8.0, -1, 49, 0, false, false, false)
    local animTime = GetAnimDuration(Config.DirtyNeedlesFailAnim.dict, Config.DirtyNeedlesFailAnim.anim) * 1000
    if animTime < 2000 then
        animTime = math.random(2700, 4000)
    end
    Wait(animTime - 500)
    ClearPedTasks(cache.ped)
    local currentHealth = GetEntityHealth(cache.ped)
    local newHealth = currentHealth - healthLoss
    newHealth = math.max(newHealth, 1) 

    SetEntityHealth(cache.ped, newHealth)
    AnimpostfxPlay("DrugsMichaelAliensFight", 0, true)
    ApplyPedBlood(cache.ped, 0, 0.0, 0.0, 0.0, "wound_sheet")
    RequestAnimSet("MOVE_M@DRUNK@MODERATEDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@MODERATEDRUNK") do
        Wait(0)  
    end

    SetPedMovementClipset(cache.ped, "MOVE_M@DRUNK@MODERATEDRUNK", 0.0)
    Framework.Notify(Config.Lang["needles"], "error", 5000)
    Wait(Config.Fails.DirtyNeedlesEffectTime * 1000)
    drugged = false
    AnimpostfxStop("DrugsMichaelAliensFight")
    ResetPedMovementClipset(cache.ped, 0)
end

function TriggerRatEffect()
    local isRacoon = math.random(1, 100) <= (Config.Fails.RacoonChancePercent or 65) -- 65% chance to be a racoon
    if not isRacoon and Framework.HasItem("rat_treats", 1) then
        TriggerServerEvent('envi-dumpsters:server:UseRatTreats')
        Framework.Notify(Config.Lang['rat_treats'], "success", 5000)
    elseif not isRacoon then
        local healthLoss = Config.Fails.RatHealthLoss 
        if not healthLoss then
            DebugPrint("Error: healthLoss is not defined in Config")
            return
        end
        SetEntityHealth(cache.ped, GetEntityHealth(cache.ped) - healthLoss)
        local currentHealth = GetEntityHealth(cache.ped)
        local newHealth = currentHealth - healthLoss
        newHealth = math.max(newHealth, 1) 
        Framework.LoadAnimDict(Config.RatFailAnim.dict)
        TaskPlayAnim(cache.ped, Config.RatFailAnim.dict, Config.RatFailAnim.anim, 8.0, 8.0, -1, 49, 0, false, false, false)
        Framework.LoadModel(`a_c_rat`)
        local coords = GetEntityCoords(cache.ped)
        local rat = CreatePed(4, `a_c_rat`, coords.x, coords.y, coords.z, 0.0, true, false)
        TaskSmartFleePed(rat, cache.ped, 50.0, -1, false, false)
        local animTime = GetAnimDuration(Config.RatFailAnim.dict, Config.RatFailAnim.anim) * 1000
        if animTime < 2000 then
            animTime = math.random(2700, 4000)
        end
        Wait(animTime - 500)
        ClearPedTasks(cache.ped)
        Framework.Notify(Config.Lang['rat'], "error", 5000)
    elseif isRacoon then
        local healthLoss = Config.Fails.RacoonHealthLoss or 50
        SetEntityHealth(cache.ped, GetEntityHealth(cache.ped) - healthLoss)
        local currentHealth = GetEntityHealth(cache.ped)
        local newHealth = currentHealth - healthLoss
        newHealth = math.max(newHealth, 1) 
        Framework.LoadAnimDict(Config.RatFailAnim.dict)
        TaskPlayAnim(cache.ped, Config.RatFailAnim.dict, Config.RatFailAnim.anim, 8.0, 8.0, -1, 49, 0, false, false, false)
        Framework.Notify(Config.Lang['racoon'], "error", 5000)
        Framework.LoadModel(`enviraccoon`)
        local coords = GetEntityCoords(cache.ped)
        local forward = GetEntityForwardVector(cache.ped)
        local racoon = CreatePed(4, `enviraccoon`, coords.x + forward.x * 0.02, coords.y + forward.y * 0.02, coords.z+0.4, 0.0, true, false)
        SetEntityAsMissionEntity(racoon, true, true)
        RacoonExit(racoon)
        TaskSmartFleePed(racoon, cache.ped, 100.0, -1, false, false)
        local animTime = GetAnimDuration(Config.RatFailAnim.dict, Config.RatFailAnim.anim) * 1000
        if animTime < 2000 then
            animTime = math.random(2700, 4000)
        end
        Wait(animTime - 1000)
        ClearPedTasks(cache.ped)
        SetTimeout(30000, function()
            TaskWanderStandard(racoon, 10.0, 10)
            Wait(60000)
            SetPedAsNoLongerNeeded(racoon)
        end)
    end
end

if Config.DebugMode then
    RegisterCommand('spawnraccoon', function()
        local coords = GetEntityCoords(cache.ped)
        local forward = GetEntityForwardVector(cache.ped)
        Framework.LoadModel(`enviraccoon`)
        local racoon = CreatePed(4, `enviraccoon`, coords.x + forward.x * 0.02, coords.y + forward.y * 0.02, coords.z+0.4, 0.0, true, false)
        SetEntityAsMissionEntity(racoon, true, true)
        TaskWanderStandard(racoon, 10.0, 10)
    end, false)
end

RegisterNetEvent('envi-dumpsters:snitchReport', function(coords, jobs)
    for _, job in ipairs(jobs) do
        local playerJob = Framework.Player.Job.Name
        if playerJob == job then
            Framework.Notify(Config.Lang['snitch'], "error", 8000)
            PlaySoundFromEntity(-1, "SELECT", cache.ped, "HUD_LIQUOR_STORE_SOUNDSET", 0, 0)
            local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
            SetBlipSprite(blip, 408)
            SetBlipColour(blip, 1)
            SetBlipScale(blip, 0.8)
            SetBlipAsShortRange(blip, false)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.Lang['snitchBlip'])
            EndTextCommandSetBlipName(blip)
            Wait(90000)
            RemoveBlip(blip)
        end
    end
end)

RegisterNetEvent('envi-dumpsters:client:DrinkBottleBadEffect', function()   -- effect when drinking hobo_bottle when not a hobo
    local health = GetEntityHealth(cache.ped)
    SetEntityHealth(cache.ped, health - 10)
end)

RegisterNetEvent('envi-dumpsters:client:DrinkBottleGoodEffect', function()   -- effect when drinking hobo_bottle when you are a hobo
    local health = GetEntityHealth(cache.ped)
    SetEntityHealth(cache.ped, health + 10)
end)

local function getVectorInFrontOfPlayer()
    local playerCoords = GetEntityCoords(cache.ped)
    local forwardVector = GetEntityForwardVector(cache.ped)
    return playerCoords + forwardVector
end

local function spawnCart(model)
    local spawnCoords = getVectorInFrontOfPlayer()

    local retval, newZCoords = GetGroundZFor_3dCoord(spawnCoords.x, spawnCoords.y, spawnCoords.z, false)
    if retval then
        spawnCoords = vector3(spawnCoords.x, spawnCoords.y, newZCoords)
    end

    local cart = CreateObject(model, spawnCoords.x, spawnCoords.y, spawnCoords.z, true, true, true)
    SetEntityHeading(cart, GetEntityHeading(cache.ped) - 180)
    SetEntityAsMissionEntity(cart, true, false)

    SetModelAsNoLongerNeeded(model)

    LocalPlayer.state.shoppingCart = cart
end

local function trySpawnCart(model)
    if not Framework.HasItem('portable_shopping_cart', 1) then
        return false
    end

    Framework.LoadModel(model)
    spawnCart(model)
end

lib.registerContext({
    id = 'envi-dumpsters.pick_shopping_cart',
    title = 'Select a Cart',
    options = {
        {
            title = 'Cart 1',
            image = 'https://gta-objects.xyz/gallery/objects/prop_rub_trolley01a.jpg',
            onSelect = function()
                trySpawnCart(`prop_rub_trolley01a`)
            end
        },
        {
            title = 'Cart 2',
            image = 'https://gta-objects.xyz/gallery/objects/prop_rub_trolley02a.jpg',
            onSelect = function()
                trySpawnCart(`prop_rub_trolley02a`)
            end
        },
        {
            title = 'Skid 1',
            image = 'https://gta-objects.xyz/gallery/objects/prop_skid_trolley_1.jpg',
            onSelect = function()
                trySpawnCart(`prop_skid_trolley_1`)
            end
        },
        {
            title = 'Skid 2',
            image = 'https://gta-objects.xyz/gallery/objects/prop_skid_trolley_2.jpg',
            onSelect = function()
                trySpawnCart(`prop_skid_trolley_2`)
            end
        },
    }
})

RegisterNetEvent('envi-dumpsters:client:usePortableShoppingCart', function()
    if not Framework.HasItem('portable_shopping_cart', 1) then
        print('no portable shopping cart item found')
        return
    end

    if LocalPlayer.state.shoppingCart then
        SetEntityAsNoLongerNeeded(LocalPlayer.state.shoppingCart)
        SetEntityAsMissionEntity(LocalPlayer.state.shoppingCart, false, false)
        DeleteEntity(LocalPlayer.state.shoppingCart)
        Framework.Notify('Packed up shopping cart')
        LocalPlayer.state.shoppingCart = nil
        return
    end

    lib.showContext('envi-dumpsters.pick_shopping_cart')

end)