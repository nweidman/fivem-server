RegisterKeyMapping("+trailerAttach", Config.Controlmessages.AttachVehicle, "keyboard", "g")
RegisterKeyMapping("+trailerInteract", Config.Controlmessages.RampInteract, "keyboard", "e")
RegisterKeyMapping("+trailerDetach", Config.Controlmessages.DetachAllVehicle, "keyboard", "h")

RegisterKeyMapping("+trailerWarp", "Get in attached vehicle", "keyboard", "f")
RegisterKeyMapping("+trailerConnect", "Connect any trailer", "keyboard", "j")

function NotiAtt() -- Attached notification
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(Config.NotiLoadMessage)
    EndTextCommandThefeedPostTicker(true, true)
end

function NotiDet() -- Detached notification
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(Config.NotiUnLoadMessage)
    EndTextCommandThefeedPostTicker(true, true)
end

-- Use this function for job locking. If the job is correct, return true.
-- Please refer to your framework's job system for how to implement, I do not support
-- job checking integration. -Theebu
function allowed()
    return true
end

--This function returns if the vehicle is locked or not when trying to get in the loaded vehicle from next to the trailer
--false = NOT locked  true == LOCKED
function IsVehicleLocked(car)

    return DecorGetInt(car, '_VEH_DOOR_LOCK_STATUS') == 2 or DecorGetInt(car, '_VEH_DOOR_LOCK_STATUS') == 10
end

--Help Text Messages
function message(lineOne, lineTwo, lineThree, duration)
    BeginTextCommandDisplayHelp("THREESTRINGS")
    AddTextComponentSubstringPlayerName(lineOne)
    AddTextComponentSubstringPlayerName(lineTwo or "")
    AddTextComponentSubstringPlayerName(lineThree or "")
  
    -- shape (always 0), loop (bool), makeSound (bool), duration (5000 max 5 sec)
    EndTextCommandDisplayHelp(0, false, false, duration or 5000)
end

if Config.UseTarget then
    --QB CORE
    if Config.Target == 'qb-target' then
        exports['qb-target']:AddTargetBone({'boot', 'chassis', "door_dside_f", "door_dside_r", "door_pside_f", "door_pside_f", "bonnet"}, {
            options = {
                {
                    icon = 'fa-solid fa-truck-ramp-box',
                    label = 'Toggle Ramp',
                    action = function(entity)
                        interactCheck(entity)
                    end,
                    canInteract = function(entity, distance, data)
                        return Config.Trailers[GetEntityModel(entity)] and allowed()
                    end,
                },
                {
                    icon = 'fa-solid fa-lock',
                    label = 'Attach load',
                    action = function(entity)
                        attachAllCheck(entity)
                    end,
                    canInteract = function(entity, distance, data)
                        return Config.Trailers[GetEntityModel(entity)] and allowed()
                    end,
                },
                {
                    icon = 'fa-solid fa-lock-open',
                    label = 'Detach load',
                    action = function(entity)
                        detachAllCheck(entity)
                    end,
                    canInteract = function(entity, distance, data)
                        return Config.Trailers[GetEntityModel(entity)] and allowed()
                    end,
                },
                {
                    icon = 'fa-solid fa-lock-open',
                    label = 'Attach/Detach Vehicle',
                    action = function(entity)
                        attachCheck2(entity)
                    end,
                    canInteract = function(entity, distance, data)
                        local vehCoords = GetEntityCoords(entity)
                        local vehicle = getVehicleInDirection(vector3(vehCoords.x, vehCoords.y, vehCoords.z + 1.0), vector3(vehCoords.x, vehCoords.y, vehCoords.z - 8.0), entity)
                        return allowed() and DoesEntityExist(vehicle) and Config.Trailers[GetEntityModel(vehicle)] and vehicle ~= entity
                    end,
                }
            },
            distance = 5.5,
        })
    elseif Config.Target == 'ox_target' then
        exports["ox_target"]:addGlobalVehicle(
            {
                {
                    icon = 'fa-solid fa-truck-ramp-box',
                    label = 'Toggle Ramp',
                    bones = {'boot', 'chassis', "door_dside_f", "door_dside_r", "door_pside_f", "door_pside_f", "bonnet"},
                    distance = 2.0,
                    canInteract = function(entity, distance, data)
                        return Config.Trailers[GetEntityModel(entity)] and allowed()
                    end,
                    onSelect = function(data)
                        interactCheck(data.entity)
                    end
                },
                {
                    icon = 'fa-solid fa-lock',
                    label = 'Attach load',
                    bones = 'boot', 'chassis', "door_dside_f", "door_dside_r", "door_pside_f", "door_pside_f", "bonnet",
                    distance = 2.0,
                    canInteract = function(entity, distance, data)
                        return Config.Trailers[GetEntityModel(entity)] and allowed()
                    end,
                    onSelect = function(data)
                        attachAllCheck(data.entity)
                    end
                },
                {
                    icon = 'fa-solid fa-lock-open',
                    label = 'Detach load',
                    bones = 'boot', 'chassis', "door_dside_f", "door_dside_r", "door_pside_f", "door_pside_f", "bonnet",
                    distance = 2.0,
                    canInteract = function(entity, distance, data)
                        return Config.Trailers[GetEntityModel(entity)] and allowed()
                    end,
                    onSelect = function(data)
                        detachAllCheck(data.entity)
                    end
                },
                {
                    icon = 'fa-solid fa-lock-open',
                    label = 'Attach/Detach Vehicle',
                    bones = 'boot', 'chassis', "door_dside_f", "door_dside_r", "door_pside_f", "door_pside_f", "bonnet",
                    distance = 2.0,
                    canInteract = function(entity, distance, data)
                        local vehCoords = GetEntityCoords(entity)
                        local vehicle = getVehicleInDirection(vector3(vehCoords.x, vehCoords.y, vehCoords.z + 1.0), vector3(vehCoords.x, vehCoords.y, vehCoords.z - 8.0), entity)
                        return allowed() and DoesEntityExist(vehicle) and Config.Trailers[GetEntityModel(vehicle)] and vehicle ~= entity
                    end,
                    onSelect = function(data)
                        attachCheck2(data.entity)
                    end
                }
            }
        )
    end
end
