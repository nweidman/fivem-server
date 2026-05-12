--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.CoreSettings.TargetName
local MenuName = Config.CoreSettings.MenuName
local InputName = Config.CoreSettings.InputName
local MetaDataEvent = Config.CoreSettings.MetaDataEvent
local DutyEvent = Config.CoreSettings.DutyEvent
local ClothingEvent = Config.CoreSettings.ClothingEvent
local RemoveStressEvent = Config.CoreSettings.RemoveStressEvent
local FuelEvent = Config.CoreSettings.FuelEvent
local SucceededAttempts = 0
UsageTimestamps = {}
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

--<!>-- MENU START --<!>--
local display = false
-- Open menu
RegisterNetEvent('boii-whitewidow:client:DisplayMenu', function()
    SetDisplay(not display)
end)
-- Exit callback
RegisterNUICallback('exit', function(data)
    SetDisplay(false)
    SetNuiFocus(false, false)
end)
-- Main callback
RegisterNUICallback('main', function(data)
    SetDisplay(false)
end)
-- Sets display
function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = 'ui',
        status = bool,
    })
end
-- Disable keys while menu active
CreateThread(function()
    while display do
        Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)

RegisterNetEvent('boii-whitewidow:client:HarvestStrain1', function(amount)
    HarvestStrain1(amount)
end)
-- Harvest function
function HarvestStrain1(amount)
    local player = PlayerPedId()
    local weedcrop = Config.JobSettings.Harvest.Strain1.ReturnItem['1'].name
    itemadd = Config.JobSettings.Harvest.Strain1.ReturnItem['1'].name
    -- amount = Config.JobSettings.Harvest.Strain1.ReturnItem['1'].amount
    Core.Functions.Progressbar('ww_harvestskunk', Language.Locations.Harvest['strain1harvest'], Config.JobSettings.Harvest.Strain1.Time*1000*amount, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.JobSettings.Harvest.ProgressAnimationDict,
        anim = Config.JobSettings.Harvest.ProgressAnimation,
        flags = Config.JobSettings.Harvest.ProgressFlags,
    }, {
        model = Config.JobSettings.Harvest.Prop,
        bone = Config.JobSettings.Harvest.Bone,
        coords = Config.JobSettings.Harvest.Coords,
        rotation = Config.JobSettings.Harvest.Rotation,
    }, {}, function()           
        TriggerServerEvent('boii-whitewidow:server:AddItem', itemadd, amount)
        ClearPedTasks(player)
        lib.showContext(('harvest_context_strain_%s'):format(1))
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerClientEvent('boii-whitewidow:notifications', Language.Shared['cancelled'], 'primary')
    end)  
end

RegisterNetEvent('boii-whitewidow:client:HarvestStrain2', function(amount)
    HarvestStrain2(amount)
end)
-- Harvest function
function HarvestStrain2(amount)
    local player = PlayerPedId()
    local weedcrop = Config.JobSettings.Harvest.Strain2.ReturnItem['1'].name
    itemadd = Config.JobSettings.Harvest.Strain2.ReturnItem['1'].name
    -- amount = Config.JobSettings.Harvest.Strain2.ReturnItem['1'].amount
    Core.Functions.Progressbar('ww_harvestkush', Language.Locations.Harvest['strain2harvest'], Config.JobSettings.Harvest.Strain2.Time*1000*amount, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.JobSettings.Harvest.ProgressAnimationDict,
        anim = Config.JobSettings.Harvest.ProgressAnimation,
        flags = Config.JobSettings.Harvest.ProgressFlags,
    }, {
        model = Config.JobSettings.Harvest.Prop,
        bone = Config.JobSettings.Harvest.Bone,
        coords = Config.JobSettings.Harvest.Coords,
        rotation = Config.JobSettings.Harvest.Rotation,
    }, {}, function()            
        TriggerServerEvent('boii-whitewidow:server:AddItem', itemadd, amount)
        ClearPedTasks(player)
        lib.showContext(('harvest_context_strain_%s'):format(2))
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerClientEvent('boii-whitewidow:notifications', Language.Shared['cancelled'], 'primary')
    end)  
end

RegisterNetEvent('boii-whitewidow:client:HarvestStrain3', function(amount)
    HarvestStrain3(amount)
end)
-- Harvest function
function HarvestStrain3(amount)
    local player = PlayerPedId()
    local weedcrop = Config.JobSettings.Harvest.Strain3.ReturnItem['1'].name
    itemadd = Config.JobSettings.Harvest.Strain3.ReturnItem['1'].name
    -- amount = Config.JobSettings.Harvest.Strain3.ReturnItem['1'].amount
    Core.Functions.Progressbar('ww_harvestww', Language.Locations.Harvest['strain3harvest'], Config.JobSettings.Harvest.Strain3.Time*1000*amount, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.JobSettings.Harvest.ProgressAnimationDict,
        anim = Config.JobSettings.Harvest.ProgressAnimation,
        flags = Config.JobSettings.Harvest.ProgressFlags,
    }, {
        model = Config.JobSettings.Harvest.Prop,
        bone = Config.JobSettings.Harvest.Bone,
        coords = Config.JobSettings.Harvest.Coords,
        rotation = Config.JobSettings.Harvest.Rotation,
    }, {}, function()               
        TriggerServerEvent('boii-whitewidow:server:AddItem', itemadd, amount)
        ClearPedTasks(player)
        lib.showContext(('harvest_context_strain_%s'):format(3))
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerClientEvent('boii-whitewidow:notifications', Language.Shared['cancelled'], 'primary')
    end)  
end

RegisterNetEvent('boii-whitewidow:client:HarvestStrain4', function(amount)
    HarvestStrain4(amount)
end)
-- Harvest function
function HarvestStrain4(amount)
    local player = PlayerPedId()
    local weedcrop = Config.JobSettings.Harvest.Strain4.ReturnItem['1'].name
    itemadd = Config.JobSettings.Harvest.Strain4.ReturnItem['1'].name
    -- amount = Config.JobSettings.Harvest.Strain4.ReturnItem['1'].amount
    Core.Functions.Progressbar('ww_harvestww', Language.Locations.Harvest['strain4harvest'], Config.JobSettings.Harvest.Strain4.Time*1000*amount, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.JobSettings.Harvest.ProgressAnimationDict,
        anim = Config.JobSettings.Harvest.ProgressAnimation,
        flags = Config.JobSettings.Harvest.ProgressFlags,
    }, {
        model = Config.JobSettings.Harvest.Prop,
        bone = Config.JobSettings.Harvest.Bone,
        coords = Config.JobSettings.Harvest.Coords,
        rotation = Config.JobSettings.Harvest.Rotation,
    }, {}, function()                 
        TriggerServerEvent('boii-whitewidow:server:AddItem', itemadd, amount)
        ClearPedTasks(player)
        lib.showContext(('harvest_context_strain_%s'):format(4))
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerClientEvent('boii-whitewidow:notifications', Language.Shared['cancelled'], 'primary')
    end)  
end

RegisterNetEvent('boii-whitewidow:client:HarvestStrain5', function(amount)
    HarvestStrain5(amount)
end)
-- Harvest function
function HarvestStrain5(amount)
    local player = PlayerPedId()
    local weedcrop = Config.JobSettings.Harvest.Strain5.ReturnItem['1'].name
    itemadd = Config.JobSettings.Harvest.Strain5.ReturnItem['1'].name
    -- amount = Config.JobSettings.Harvest.Strain5.ReturnItem['1'].amount
    Core.Functions.Progressbar('ww_harvestww', Language.Locations.Harvest['strain5harvest'], Config.JobSettings.Harvest.Strain5.Time*1000*amount, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.JobSettings.Harvest.ProgressAnimationDict,
        anim = Config.JobSettings.Harvest.ProgressAnimation,
        flags = Config.JobSettings.Harvest.ProgressFlags,
    }, {
        model = Config.JobSettings.Harvest.Prop,
        bone = Config.JobSettings.Harvest.Bone,
        coords = Config.JobSettings.Harvest.Coords,
        rotation = Config.JobSettings.Harvest.Rotation,
    }, {}, function()                
        TriggerServerEvent('boii-whitewidow:server:AddItem', itemadd, amount)
        ClearPedTasks(player)
        lib.showContext(('harvest_context_strain_%s'):format(5))
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerClientEvent('boii-whitewidow:notifications', Language.Shared['cancelled'], 'primary')
    end)  
end

--<!>-- TRIMMING CODE START --<!>--
RegisterNetEvent('boii-whitewidow:client:TrimWeed', function(args)
    local player = PlayerPedId()
    args = tonumber(args)
    name = '' -- Name of Progressbar
    timer = '' -- Timer for progressbar
    itemadd = '' -- Weed bag item to return
    itemremove = '' -- Baggies item to remove
    amount = '' -- Amount of baggies to remove
    ProgressAnimationDict = Config.JobSettings.Trimming.ProgressAnimationDict
    ProgressAnimation = Config.JobSettings.Trimming.ProgressAnimation
    ProgressFlags = Config.JobSettings.Trimming.ProgressFlags
    ProgressProp = Config.JobSettings.Trimming.ProgressProp
    ProgressBone = Config.JobSettings.Trimming.ProgressBone
    ProgressCoords = Config.JobSettings.Trimming.ProgressCoords
    ProgressRotation = Config.JobSettings.Trimming.ProgressRotation
    if args == 1 then
        name = 'ww_trim_s1'
        timer = Config.JobSettings.Trimming.Strain1.Time
        itemadd = Config.JobSettings.Trimming.Strain1.ReturnItem['1'].name
        itemremove = Config.JobSettings.Trimming.Strain1.RequiredItems['3'].name
        amount = Config.JobSettings.Trimming.Strain1.RequiredItems['3'].amount
    elseif args == 2 then
        name = 'ww_trim_s2'
        timer = Config.JobSettings.Trimming.Strain2.Time
        itemadd = Config.JobSettings.Trimming.Strain2.ReturnItem['1'].name
        itemremove = Config.JobSettings.Trimming.Strain2.RequiredItems['3'].name
        amount = Config.JobSettings.Trimming.Strain2.RequiredItems['3'].amount
    elseif args == 3 then
        name = 'ww_trim_s3'
        timer = Config.JobSettings.Trimming.Strain3.Time
        itemadd = Config.JobSettings.Trimming.Strain3.ReturnItem['1'].name
        itemremove = Config.JobSettings.Trimming.Strain3.RequiredItems['3'].name
        amount = Config.JobSettings.Trimming.Strain3.RequiredItems['3'].amount
    elseif args == 4 then
        name = 'ww_trim_s4'
        timer = Config.JobSettings.Trimming.Strain4.Time
        itemadd = Config.JobSettings.Trimming.Strain4.ReturnItem['1'].name
        itemremove = Config.JobSettings.Trimming.Strain4.RequiredItems['3'].name
        amount = Config.JobSettings.Trimming.Strain4.RequiredItems['3'].amount
    elseif args == 5 then
        name = 'ww_trim_s5'
        timer = Config.JobSettings.Trimming.Strain5.Time
        itemadd = Config.JobSettings.Trimming.Strain5.ReturnItem['1'].name
        itemremove = Config.JobSettings.Trimming.Strain5.RequiredItems['3'].name
        amount = Config.JobSettings.Trimming.Strain5.RequiredItems['3'].amount
    end 
    Core.Functions.Progressbar(name, Language.Locations.Trimming['trimmingweed'], timer*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = ProgressAnimationDict,
        anim = ProgressAnimation,
        flags = ProgressFlags,
    }, {
        model = ProgressProp,
        bone = ProgressBone,
        coords = ProgressCoords,
        rotation = ProgressRotation
    }, {}, function()
        TriggerServerEvent('boii-whitewidow:server:RemoveItem', itemremove, amount)
        Wait(1000)
        TriggerServerEvent('boii-whitewidow:server:AddItem', itemadd, amount)
        TriggerEvent('boii-whitewidow:notifications', Language.Locations.Trimming['trimmedweed'], 'success')
        ClearPedTasks(player)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerClientEvent('boii-whitewidow:notifications', Language.Shared['cancelled'], 'primary')
    end)  
end)
--<!>-- TRIMMING CODE END --<!>--

--<!>-- BONGS START --<!>--
RegisterNetEvent('boii-whitewidow:client:UseBong', function(args)
    local player = PlayerPedId()
    local args = tonumber(args)
    if args == 1 then
        name = 'ww_bongstrain1'
        timer = Config.DrugSettings.BongTables.Strain1.Time
        armour = Config.DrugSettings.BongTables.Strain1.Armour
        stress = Config.DrugSettings.BongTables.Strain1.Stress
    elseif args == 2 then
        name = 'ww_bongstrain2'
        timer = Config.DrugSettings.BongTables.Strain2.Time
        armour = Config.DrugSettings.BongTables.Strain2.Armour
        stress = Config.DrugSettings.BongTables.Strain2.Stress
    elseif args == 3 then
        name = 'ww_bongstrain3'
        timer = Config.DrugSettings.BongTables.Strain3.Time
        armour = Config.DrugSettings.BongTables.Strain3.Armour
        stress = Config.DrugSettings.BongTables.Strain3.Stress
    elseif args == 4 then
        name = 'ww_bongstrain4'
        timer = Config.DrugSettings.BongTables.Strain4.Time
        armour = Config.DrugSettings.BongTables.Strain4.Armour
        stress = Config.DrugSettings.BongTables.Strain4.Stress
    elseif args == 5 then
        name = 'ww_bongstrain5'
        timer = Config.DrugSettings.BongTables.Strain5.Time
        armour = Config.DrugSettings.BongTables.Strain5.Armour
        stress = Config.DrugSettings.BongTables.Strain5.Stress
    end
    Core.Functions.Progressbar(name, Language.Locations.BongTables['usebong'], timer*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.DrugSettings.BongTables.ProgressAnimationDict,
        anim = Config.DrugSettings.BongTables.ProgressAnimation,
        flags = Config.DrugSettings.BongTables.ProgressFlags,
    }, {
        model = Config.DrugSettings.BongTables.Prop,
        bone = Config.DrugSettings.BongTables.Bone,
        coords = Config.DrugSettings.BongTables.Coords,
        rotation = Config.DrugSettings.BongTables.Rotation,
    }, {}, function()
        if Config.DrugSettings.BongTables.ScreenEffects == true then
            AddArmourToPed(player, armour)
            TriggerServerEvent(RemoveStressEvent, stress)        
            ClearPedTasks(player)
            BongEffect()
        elseif Config.DrugSettings.BongTables.ScreenEffects == false then
            AddArmourToPed(player, armour)
            TriggerServerEvent(RemoveStressEvent, stress)        
            ClearPedTasks(player)
        end
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerClientEvent('boii-whitewidow:notifications', Language.Shared['cancelled'], 'primary')
    end)
end)
--<!>-- BONGS END --<!>--

--<!>-- SMOKE JOINTS START --<!>--
RegisterNetEvent('boii-whitewidow:client:SmokeJoint', function(arg)
    local ped = PlayerPedId()
    local strain = tonumber(arg) or 1

    -- resolve strain data (make locals!)
    local name, joint, timer, armour, stress
    if     strain == 1 then
        name='ww_jointstrain1'; joint=Config.JobSettings.JointRolling.Strain1.ReturnItem['1'].name
        timer=Config.DrugSettings.Joints.Strain1.Time; armour=Config.DrugSettings.Joints.Strain1.Armour; stress=Config.DrugSettings.Joints.Strain1.Stress
    elseif strain == 2 then
        name='ww_jointstrain2'; joint=Config.JobSettings.JointRolling.Strain2.ReturnItem['1'].name
        timer=Config.DrugSettings.Joints.Strain2.Time; armour=Config.DrugSettings.Joints.Strain2.Armour; stress=Config.DrugSettings.Joints.Strain2.Stress
    elseif strain == 3 then
        name='ww_jointstrain3'; joint=Config.JobSettings.JointRolling.Strain3.ReturnItem['1'].name
        timer=Config.DrugSettings.Joints.Strain3.Time; armour=Config.DrugSettings.Joints.Strain3.Armour; stress=Config.DrugSettings.Joints.Strain3.Stress
    elseif strain == 4 then
        name='ww_jointstrain4'; joint=Config.JobSettings.JointRolling.Strain4.ReturnItem['1'].name
        timer=Config.DrugSettings.Joints.Strain4.Time; armour=Config.DrugSettings.Joints.Strain4.Armour; stress=Config.DrugSettings.Joints.Strain4.Stress
    elseif strain == 5 then
        name='ww_jointstrain5'; joint=Config.JobSettings.JointRolling.Strain5.ReturnItem['1'].name
        timer=Config.DrugSettings.Joints.Strain5.Time; armour=Config.DrugSettings.Joints.Strain5.Armour; stress=Config.DrugSettings.Joints.Strain5.Stress
    end

    -- require lighter (client-side ox_inventory check is rock solid on Qbox)
    local hasLighter = (exports.ox_inventory:Search('count', Config.DrugSettings.Joints.SmokeItem) or 0) > 0
    if not hasLighter then
        return TriggerEvent('boii-whitewidow:notifications', Language.Shared['nolighter'], 'error')
    end

    -- config shortcuts
    local cfg   = Config.DrugSettings.Joints
    local model = cfg.Prop or 'prop_sh_joint_01'
    local bone  = tonumber(cfg.Bone) or 57005       -- 57005 = SKEL_R_Hand
    local off   = cfg.Coords or vector3(0.12, 0.03, -0.05)
    local rot   = cfg.Rotation or vector3(0.0, 10.0, 70.0)

    -- load anim
    local dict, clip, flags = cfg.ProgressAnimationDict, cfg.ProgressAnimation, cfg.ProgressFlags or 49
    if dict and not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do Wait(0) end
    end

    -- create + attach prop manually (Qbox-safe)
    local obj
    do
        local mhash = type(model) == 'number' and model or joaat(model)
        RequestModel(mhash)
        while not HasModelLoaded(mhash) do Wait(0) end
        obj = CreateObjectNoOffset(mhash, 0.0, 0.0, 0.0, true, true, false)
        local bidx = GetPedBoneIndex(ped, bone)
        AttachEntityToEntity(
            obj, ped, bidx,
            off.x+0.0, off.y+0.0, off.z+0.0,
            rot.x+0.0, rot.y+0.0, rot.z+0.0,
            true, true, false, true, 1, true
        )
        SetModelAsNoLongerNeeded(mhash)
    end

    -- play anim
    if dict and clip then
        TaskPlayAnim(ped, dict, clip, 4.0, -4.0, -1, flags, 0.0, false, false, false)
    end

    -- show ox_lib progress (Qbox standard)
    local ok = lib.progressCircle({
        duration = math.floor((timer or 1) * 1000),
        position = 'bottom',
        label    = Language.Joints and Language.Joints['smokejoint'] or 'Smoking..',
        useWhileDead = false,
        canCancel    = true,
        disable = { move = false, car = false, combat = true, mouse = false },
    })

    -- cleanup prop + anim
    if DoesEntityExist(obj) then
        DetachEntity(obj, true, true)
        DeleteEntity(obj)
    end
    ClearPedTasks(ped)

    if not ok then
        TriggerEvent('boii-whitewidow:notifications', Language.Shared['cancelled'], 'primary')
        return
    end

    local currentTime = GetGameTimer()
    -- Remove old timestamps (older than 10 minutes)
    for i = #UsageTimestamps, 1, -1 do
        if currentTime - UsageTimestamps[i] > 600000 then -- 10 minutes in ms
            table.remove(UsageTimestamps, i)
        end
    end

	 -- Add current timestamp
    table.insert(UsageTimestamps, currentTime)

    -- success effects
    TriggerServerEvent('boii-whitewidow:server:RemoveItem', joint, 1, 'lighter')
    if armour and armour > 0 then AddArmourToPed(ped, armour) end
    if stress then TriggerServerEvent(RemoveStressEvent, stress) end
    if cfg.ScreenEffects and #UsageTimestamps > 1 then
        if type(JointEffects) == 'function' then JointEffects() end
    end
end)
--<!>-- SMOKE JOINTS END --<!>--

RegisterNetEvent('boii-whitewidow:client:SmokeVape', function(arg)
    local ped = PlayerPedId()
    local joint = arg
    local timer = Config.DrugSettings.Joints.Strain1.Time
    local armour = Config.DrugSettings.Joints.Strain1.Armour
    local stress = Config.DrugSettings.Joints.Strain1.Stress

    -- require vape (client-side ox_inventory check is rock solid on Qbox)
    local hasVape = (exports.ox_inventory:Search('count', 'redvape') or 0) > 0 or
    (exports.ox_inventory:Search('count', 'orangevape') or 0) > 0 or (exports.ox_inventory:Search('count', 'yellowvape') or 0) > 0 or
    (exports.ox_inventory:Search('count', 'greenvape') or 0) > 0 or (exports.ox_inventory:Search('count', 'bluevape') or 0) > 0 or
    (exports.ox_inventory:Search('count', 'purplevape') or 0) > 0 or (exports.ox_inventory:Search('count', 'pinkvape') or 0) > 0 or
    (exports.ox_inventory:Search('count', 'tealvape') or 0) > 0 or (exports.ox_inventory:Search('count', 'blackvape') or 0) > 0
    if not hasVape then
        return TriggerEvent('boii-whitewidow:notifications', 'You do not have a vape', 'error')
    end

    -- config shortcuts
    local cfg   = Config.DrugSettings.Joints
    local model = `mxc_smoking_prop_vaporglow_1a`
    local bone  = tonumber(cfg.Bone) or 57005       -- 57005 = SKEL_R_Hand
    local off   = vector3(0.10, 0.03, -0.04)
    local rot   = vector3(-70.0, 160.0, 50.0)

    -- load anim
    local dict, clip, flags = cfg.ProgressAnimationDict, cfg.ProgressAnimation, cfg.ProgressFlags or 49
    if dict and not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do Wait(0) end
    end

    -- create + attach prop manually (Qbox-safe)
    local obj
    do
        local mhash = type(model) == 'number' and model or joaat(model)
        RequestModel(mhash)
        while not HasModelLoaded(mhash) do Wait(0) end
        obj = CreateObjectNoOffset(mhash, 0.0, 0.0, 0.0, true, true, false)
        local bidx = GetPedBoneIndex(ped, bone)
        AttachEntityToEntity(
            obj, ped, bidx,
            off.x+0.0, off.y+0.0, off.z+0.0,
            rot.x+0.0, rot.y+0.0, rot.z+0.0,
            true, true, false, true, 1, true
        )
        SetModelAsNoLongerNeeded(mhash)
    end

    -- play anim
    if dict and clip then
        TaskPlayAnim(ped, dict, clip, 4.0, -4.0, -1, flags, 0.0, false, false, false)
    end

    -- show ox_lib progress (Qbox standard)
    local ok = lib.progressCircle({
        duration = math.floor((timer or 1) * 1000),
        position = 'bottom',
        label    = 'Smoking a vape..',
        useWhileDead = false,
        canCancel    = true,
        disable = { move = false, car = false, combat = true, mouse = false },
    })

    -- cleanup prop + anim
    if DoesEntityExist(obj) then
        DetachEntity(obj, true, true)
        DeleteEntity(obj)
    end
    ClearPedTasks(ped)

    if not ok then
        TriggerEvent('boii-whitewidow:notifications', Language.Shared['cancelled'], 'primary')
        return
    end

    local currentTime = GetGameTimer()
    -- Remove old timestamps (older than 10 minutes)
    for i = #UsageTimestamps, 1, -1 do
        if currentTime - UsageTimestamps[i] > 600000 then -- 10 minutes in ms
            table.remove(UsageTimestamps, i)
        end
    end

	 -- Add current timestamp
    table.insert(UsageTimestamps, currentTime)

    -- success effects
    TriggerServerEvent('boii-whitewidow:server:RemoveItem', joint, 1, 'vape')
    if armour and armour > 0 then AddArmourToPed(ped, armour) end
    if stress then TriggerServerEvent(RemoveStressEvent, stress) end
    if cfg.ScreenEffects and #UsageTimestamps > 1 then
        if type(JointEffects) == 'function' then JointEffects() end
    end
end)

--<!>-- JOINTS START --<!>--
RegisterNetEvent('boii-whitewidow:client:RollJoints', function(args)
    local player = PlayerPedId()
    args = tonumber(args)
    name = '' -- Name of progressbar
    weedbag = '' -- Name of weed weedbag
    bagamount = '' -- Amount of bags to remove
    joint = '' -- Name of joints
    jointamount = '' -- Amount of joints to reward
    timer = '' -- Progressbar timer
    papersitem = '' -- Name of rolling papers
    papersamount = '' -- Amount of rolling papers to remove
    if args == 1 then
        name = 'ww_rollstrain1'
        weedbag = Config.JobSettings.Trimming.Strain1.ReturnItem['1'].name
        bagamount = Config.JobSettings.JointRolling.Strain1.RemoveAmount
        joint = Config.JobSettings.JointRolling.Strain1.ReturnItem['1'].name
        jointamount = Config.JobSettings.JointRolling.Strain1.ReturnItem['1'].amount
        timer = Config.JobSettings.JointRolling.Strain1.Time
        papersitem = Config.JobSettings.JointRolling.Strain1.RequiredItems['2'].name
        papersamount = Config.JobSettings.JointRolling.Strain1.RequiredItems['2'].amount
    elseif args == 2 then
        name = 'ww_rollstrain2'
        weedbag = Config.JobSettings.Trimming.Strain2.ReturnItem['1'].name
        bagamount = Config.JobSettings.JointRolling.Strain2.RemoveAmount
        joint = Config.JobSettings.JointRolling.Strain2.ReturnItem['1'].name
        jointamount = Config.JobSettings.JointRolling.Strain2.ReturnItem['1'].amount
        timer = Config.JobSettings.JointRolling.Strain2.Time
        papersitem = Config.JobSettings.JointRolling.Strain2.RequiredItems['2'].name
        papersamount = Config.JobSettings.JointRolling.Strain2.RequiredItems['2'].amount
    elseif args == 3 then
        name = 'ww_rollstrain3'
        weedbag = Config.JobSettings.Trimming.Strain3.ReturnItem['1'].name
        bagamount = Config.JobSettings.JointRolling.Strain3.RemoveAmount
        joint = Config.JobSettings.JointRolling.Strain3.ReturnItem['1'].name
        jointamount = Config.JobSettings.JointRolling.Strain3.ReturnItem['1'].amount
        timer = Config.JobSettings.JointRolling.Strain3.Time
        papersitem = Config.JobSettings.JointRolling.Strain3.RequiredItems['2'].name
        papersamount = Config.JobSettings.JointRolling.Strain3.RequiredItems['2'].amount
    elseif args == 4 then
        name = 'ww_rollstrain4'
        weedbag = Config.JobSettings.Trimming.Strain4.ReturnItem['1'].name
        bagamount = Config.JobSettings.JointRolling.Strain4.RemoveAmount
        joint = Config.JobSettings.JointRolling.Strain4.ReturnItem['1'].name
        jointamount = Config.JobSettings.JointRolling.Strain4.ReturnItem['1'].amount
        timer = Config.JobSettings.JointRolling.Strain4.Time
        papersitem = Config.JobSettings.JointRolling.Strain4.RequiredItems['2'].name
        papersamount = Config.JobSettings.JointRolling.Strain4.RequiredItems['2'].amount
    elseif args == 5 then
        name = 'ww_rollstrain5'
        weedbag = Config.JobSettings.Trimming.Strain5.ReturnItem['1'].name
        bagamount = Config.JobSettings.JointRolling.Strain5.RemoveAmount
        joint = Config.JobSettings.JointRolling.Strain5.ReturnItem['1'].name
        jointamount = Config.JobSettings.JointRolling.Strain5.ReturnItem['1'].amount
        timer = Config.JobSettings.JointRolling.Strain5.Time
        papersitem = Config.JobSettings.JointRolling.Strain5.RequiredItems['2'].name
        papersamount = Config.JobSettings.JointRolling.Strain5.RequiredItems['2'].amount
    end 
    Core.Functions.Progressbar(name, Language.Locations.JointRolling['rollingjoints'], timer*1000, false, true,{
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.JobSettings.JointRolling.ProgressAnimationDict,
        anim = Config.JobSettings.JointRolling.ProgressAnimation,
        flags = Config.JobSettings.JointRolling.ProgressFlags,
    }, {
        model = Config.JobSettings.JointRolling.Prop,
        bone = Config.JobSettings.JointRolling.Bone,
        coords = Config.JobSettings.JointRolling.Coords,
        rotation = Config.JobSettings.JointRolling.Rotation,
    }, {}, function()
        TriggerServerEvent('boii-whitewidow:server:RemoveItem', papersitem, papersamount)
        TriggerServerEvent('boii-whitewidow:server:RemoveItem', weedbag, bagamount)
        Wait(1000)
        TriggerServerEvent('boii-whitewidow:server:AddItem', joint, jointamount)
        TriggerEvent('boii-whitewidow:notifications', Language.Locations.JointRolling['rolledjoints'], 'success')
        ClearPedTasks(player)
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
        TriggerClientEvent('boii-whitewidow:notifications', Language.Shared['cancelled'], 'primary')
    end)  
end)
--<!>-- ROLLING JOINTS END --<!>--

--<!>-- ANIMATIONS CODE START --<!>--
-- Loads bong
function loadModel(model)
    while not HasModelLoaded(model) do Wait(0) RequestModel(model) end
    return model
end
-- Animations
function playAnim(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do 
      Wait(0) 
    end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end
--<!>-- ANIMATIONS CODE END --<!>--

--<!>-- CLOSE MENU START --<!>--
-- Event to close qb-menu
RegisterNetEvent('boii-whitewidow:client:StopMenu', function()
    ClearPedTasks(PlayerPedId())
end)
--<!>-- CLOSE MENU END --<!>--

--<!>-- DRUG EFFECT START --<!>--
function JointEffects()
    local ped = PlayerPedId()
    Wait(2000)
    SetTimecycleModifier("Barry1_Stoned")
    SetPedMotionBlur(ped, true)           
    Wait(Config.DrugSettings.Joints.EffectTime*30000)
    ClearTimecycleModifier()
    SetPedMotionBlur(ped, false)
end
function EdiblesEffect()
    local ped = PlayerPedId()
    Wait(2000)
    SetTimecycleModifier("spectator8")
    SetPedMotionBlur(ped, true)           
    Wait(Config.DrugSettings.Edibles.EffectTime*45000)
    ClearTimecycleModifier()
    SetPedMotionBlur(ped, false)
end
function BongEffect()
    local ped = PlayerPedId()
    Wait(2000)
    SetTimecycleModifier("spectator8")
    SetPedMotionBlur(ped, true)           
    Wait(Config.DrugSettings.BongTables.EffectTime*30000)
    ClearTimecycleModifier()
    SetPedMotionBlur(ped, false)
end
--<!>-- DRUG EFFECT END --<!>--

