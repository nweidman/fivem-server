-- DoorResource = GetResourceState('ox_doorlock') == 'started' and 'ox' or GetResourceState('qb-doorlock') == 'started' and 'qb'
-- if not DoorResource then 
--     return error('ox_doorlock/qb-doorlock must be started before ps-housing.') 
-- end

QBCore = exports['qb-core']:GetCoreObject()
-- PSCore = exports['ps-core']:GetCoreObject()

local dbloaded = false
MySQL.ready(function()
    MySQL.query('SELECT * FROM properties', {}, function(result)
        if not result then
            print("Error: No result returned from properties query.")
            return
        end
        if result.id then -- If only one result
            result = {result}
        end
        for _, v in pairs(result) do
            local id = tostring(v.property_id)
            local has_access = json.decode(v.has_access)
            local owner = v.owner_citizenid
            local propertyData = {
                property_id = tostring(id),
                owner = owner,
                street = v.street,
                region = v.region,
                description = v.description,
                has_access = has_access,
                extra_imgs = json.decode(v.extra_imgs),
                furnitures = json.decode(v.furnitures),
                for_sale = v.for_sale,
                price = v.price,
                shell = v.shell,
                apartment = v.apartment,
                door_data = json.decode(v.door_data),
                garage_data = json.decode(v.garage_data),
                zone_data = v.zone_data,
            }
            PropertiesTable[id] = Property:new(propertyData)

            -- if v.shell == 'mlo' and DoorResource == 'qb' and owner then
            --     local property = PropertiesTable[id]
            --     -- we add door access for qb doorlock
            --     property:addMloDoorsAccess(owner)
            --     if has_access and #has_access > 0 then
            --         for _, citizenId in ipairs(has_access) do
            --             property:addMloDoorsAccess(citizenId)
            --         end
            --     end
            -- end
        end

        dbloaded = true
    end, function(err)
        print("Error querying properties: " .. err)
    end)
end)

lib.callback.register("ps-housing:server:requestProperties", function()
    while not dbloaded do
        Wait(100)
    end

    return PropertiesTable
end)

local function doesIdExist(id)
    local exists1 = MySQL.scalar.await(
        'SELECT 1 FROM cd_doorlock WHERE unique_id = ? LIMIT 1',
        { id }
    )

    if exists1 then
        return true
    end

    local exists2 = MySQL.scalar.await(
        'SELECT 1 FROM cd_doorlock_locationgroups WHERE id = ? LIMIT 1',
        { id }
    )

    return exists2 ~= nil
end

local function doesDoorIdExist(id)
    local result = MySQL.scalar.await([[
        SELECT 1 
        FROM cd_doorlock 
        WHERE JSON_SEARCH(door_data, 'one', ?, NULL, '$[*].unique_id') IS NOT NULL
        LIMIT 1
    ]], { id })

    return result ~= nil
end

local function createUniqueId()
    local charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local result = {}

    for group = 1, 4 do
        local segment = {}
        for i = 1, 4 do
            local rand = math.random(1, #charset)
            segment[#segment + 1] = charset:sub(rand, rand)
        end
        result[#result + 1] = table.concat(segment)
    end

    return table.concat(result, "-")
end

local function randomDoorId()
    local charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-"
    local result = {}

    for i = 1, 20 do
        local rand = math.random(1, #charset)
        result[i] = charset:sub(rand, rand)
    end

    return table.concat(result)
end

function RegisterProperty(propertyData, preventEnter, source)
    propertyData.owner = propertyData.owner or nil
    propertyData.has_access = propertyData.has_access or {}
    propertyData.extra_imgs = propertyData.extra_imgs or {}
    propertyData.furnitures = propertyData.furnitures or {}
    propertyData.door_data = propertyData.door_data or {}
    propertyData.garage_data = propertyData.garage_data or {}
    propertyData.zone_data = propertyData.zone_data or {}
    
    local cols = "(owner_citizenid, street, region, description, has_access, extra_imgs, furnitures, for_sale, price, shell, apartment, door_data, garage_data, zone_data)"
    local vals = "(@owner_citizenid, @street, @region, @description, @has_access, @extra_imgs, @furnitures, @for_sale, @price, @shell, @apartment, @door_data, @garage_data, @zone_data)"

    local id = MySQL.insert.await("INSERT INTO properties " .. cols .. " VALUES " .. vals , {
        ["@owner_citizenid"] = propertyData.owner or nil,
        ["@street"] = propertyData.street,
        ["@region"] = propertyData.region,
        ["@description"] = propertyData.description,
        ["@has_access"] = json.encode(propertyData.has_access),
        ["@extra_imgs"] = json.encode(propertyData.extra_imgs),
        ["@furnitures"] = json.encode(propertyData.furnitures),
        ["@for_sale"] = propertyData.for_sale ~= nil and propertyData.for_sale or 1,
        ["@price"] = propertyData.price or 0,
        ["@shell"] = propertyData.shell or '',
        ["@apartment"] = propertyData.apartment,
        ["@door_data"] = json.encode(propertyData.door_data),
        ["@garage_data"] = json.encode(propertyData.garage_data),
        ["@zone_data"] = json.encode(propertyData.zone_data),
    })

    if source and propertyData.shell == 'mlo' then
        local doorGroupId
        repeat
            doorGroupId = createUniqueId() 
        until not doesIdExist(doorGroupId)
        MySQL.insert.await("INSERT INTO cd_doorlock_locationgroups " .. "(id, name)" .. " VALUES " .. "(@id, @name)" , {
            ["@id"] = doorGroupId,
            ["@name"] = "PROPERTY_"..tostring(id),
        })

        local cols2 = "(unique_id, door_name, location_group, door_type, perms, door_data, distance, default_state, state, lockpickable, keep_open)"
        local vals2 = "(@unique_id, @door_name, @location_group, @door_type, @perms, @door_data, @distance, @default_state, @state, @lockpickable, @keep_open)"
        local counter = 1
        for k, v in pairs(propertyData.door_data) do
            local doorId
            repeat
                doorId = createUniqueId() 
            until not doesIdExist(doorId)
            if not (v[1] and v[2]) then
                local uniqueID
                repeat
                    uniqueID = createUniqueId() 
                until not doesDoorIdExist(uniqueID)
                MySQL.insert.await("INSERT INTO cd_doorlock " .. cols2 .. " VALUES " .. vals2 , {
                    ["@unique_id"] = doorId,
                    ["@door_name"] = "PROPERTY_"..tostring(id).."_door"..counter,
                    ["@location_group"] = "PROPERTY_"..tostring(id),
                    ["@door_type"] = v.type,
                    ["@perms"] = json.encode({
                        job = {},
                        ace = {},
                        identifier = {propertyData.owner},
                        items = {},
                        discord = {}
                    }),
                    ["@door_data"] = json.encode({
                        {
                            model_hash = v.model,
                            unique_id = uniqueID,
                            door_coords = {
                                x = v.coords.x,
                                y = v.coords.y,
                                z = v.coords.z
                            }
                        }
                    }),
                    ["@distance"] = v.maxDistance or 2,
                    ["@default_state"] = 1,
                    ["@state"] = 1,
                    ["@lockpickable"] = 1,
                    ["@keep_open"] = 0,
                })
            else
                local uniqueID
                repeat
                    uniqueID = createUniqueId() 
                until not doesDoorIdExist(uniqueID)
                local uniqueID2
                repeat
                    uniqueID2 = createUniqueId() 
                until not doesDoorIdExist(uniqueID2)
                MySQL.insert.await("INSERT INTO cd_doorlock " .. cols2 .. " VALUES " .. vals2 , {
                    ["@unique_id"] = doorId,
                    ["@door_name"] = "PROPERTY_"..tostring(id).."_door"..counter,
                    ["@location_group"] = "PROPERTY_"..tostring(id),
                    ["@door_type"] = 'double',
                    ["@perms"] = json.encode({
                        job = {},
                        ace = {},
                        identifier = {propertyData.owner},
                        items = {},
                        discord = {}
                    }),
                    ["@door_data"] = json.encode({
                        {
                            model_hash = v[1].model,
                            unique_id = uniqueID,
                            door_coords = {
                                x = v[1].coords.x,
                                y = v[1].coords.y,
                                z = v[1].coords.z
                            }
                        },
                        {
                            model_hash = v[2].model,
                            unique_id = uniqueID2,
                            door_coords = {
                                x = v[2].coords.x,
                                y = v[2].coords.y,
                                z = v[2].coords.z
                            }
                        },
                    }),
                    ["@distance"] = v.maxDistance or 2,
                    ["@default_state"] = 1,
                    ["@state"] = 1,
                    ["@lockpickable"] = 1,
                    ["@keep_open"] = 0,
                })
            end
            counter = counter+1
        end
    end

    -- if source and propertyData.shell == 'mlo' then
        -- if DoorResource == 'ox' then
        --     TriggerClientEvent("ps-housing:client:createOxDoors", source, {
        --         id = id,
        --         doors = propertyData.door_data
        --     })
        -- else
        --     local qb_doorlock = exports['qb-doorlock']
        --     for _, v in ipairs(propertyData.door_data) do
        --         local isArray = v[1] and true
        --         local success, err = pcall(function()
        --             qb_doorlock:saveNewDoor(source, {
        --                 locked = true,
        --                 model = isArray and {v[1].model, v[2].model} or v.model,
        --                 heading = isArray and {v[1].heading, v[2].heading} or v.heading,
        --                 coords = isArray and {v[1].coords, v[2].coords} or v.coords,
        --                 distance = 2.5,
        --                 doortype = 'door',
        --                 id = ('ps_mloproperty%s_%s'):format(id, _)
        --             }, isArray)
        --         end)
        --         if not success then
        --             print("Error saving new door: " .. err)
        --         end
        --     end
        -- end
        -- propertyData.door_data = {count = #propertyData.door_data}
        -- Wait(1000)
    -- end

    id = tostring(id)
    propertyData.property_id = id
    PropertiesTable[id] = Property:new(propertyData)

    if propertyData.realtorSrc then
        local message = "**PROPERTY CREATED**\n\nProperty id: " .. tostring(id) .. "\nCreated by: " .. GetPlayerName(propertyData.realtorSrc) .. "\nPrice: " .. propertyData.price or 0 .. "\nShell: " .. propertyData.shell or ''
        TriggerEvent('qb-log:server:CreateLog', 'pshousing', 'Housing System', 'blue', message)
    end
    
    TriggerClientEvent("ps-housing:client:addProperty", -1, propertyData)

    -- This will create the stash for the apartment and migrate the items from the old apartment stash if applicable
    -- if GetResourceState('qb-inventory') == 'started' then
    --     TriggerEvent("ps-housing:server:createApartmentStash", propertyData.owner, id)
    -- else
    --     print("Error: qb-inventory is not started")
    -- end

    if propertyData.apartment and not preventEnter then
        local player = exports.qbx_core:GetPlayerByCitizenId(propertyData.owner)
        if not player then
            print("Error: Player not found for citizen ID " .. propertyData.owner)
            return
        end

        local src = player.PlayerData.source
        local property = Property.Get(id)
        if not property then
            print("Error: Property not found for ID " .. id)
            return
        end

        property:PlayerEnter(src)

        Wait(1000)

        local query = "SELECT skin FROM playerskins WHERE citizenid = ?"
        local result = MySQL.Sync.fetchAll(query, {propertyData.owner})

        

        if result and result[1] then
            Debug("Player: " .. propertyData.owner .. " skin already exists!")
        else
            local Player = exports.qbx_core:GetPlayerByCitizenId(propertyData.owner)
            local genderNum = Player.PlayerData.charinfo.gender
            local gender = 'mp_m_freemode_01'
            local defaultSkin = {
                crm_model = 'mp_m_freemode_01',
                crm_inheritance = {
                    crm_mother_face = 0,
                    crm_mother_skin = 0,
                    crm_mother_race = 0,
                    crm_father_face = 0,
                    crm_father_skin = 0,
                    crm_father_race = 0,
                    crm_mix_face = 0,
                    crm_mix_skin = 0,
                    crm_mix_race = 0,
                },
                crm_face = {
                    crm_eye_color = 0,
                    crm_no_width = 0,
                    crm_no_height = 0,
                    crm_no_size = 0,
                    crm_no_bone_height = 0,
                    crm_no_peak_height = 0,
                    crm_no_bone_twist = 0,
                    crm_ey_depth = 0,
                    crm_ey_height = 0,
                    crm_ch_bone_width = 0,
                    crm_ch_bone_height = 0,
                    crm_ch_width = 0,
                    crm_em_eyes_opening = 0,
                    crm_em_lip_thickness = 0,
                    crm_ja_width = 0,
                    crm_ja_size = 0,
                    crm_ch_lowering = 0,
                    crm_ch_length = 0,
                    crm_ch_size = 0,
                    crm_ch_hole_size = 0,
                    crm_ne_thickness = 0,
                },
                crm_skin = {
                    crm_blemishes = {crm_index = 0, crm_opacity = 0},
                    crm_ageing = {crm_index = 0, crm_opacity = 0},
                    crm_complexion = {crm_index = 0, crm_opacity = 0},
                    crm_sun_damage = {crm_index = 0, crm_opacity = 0},
                    crm_moles_freckles = {crm_index = 0, crm_opacity = 0},
                    crm_body_blemishes = {crm_index = 0, crm_opacity = 0},
                },
                crm_hair = {
                    crm_hair = {
                        crm_index = 0,
                        crm_texture = 0,
                        crm_color = 0,
                        crm_secondary_color = 0,
                    },
                    crm_facial_hair = {
                        crm_index = 0,
                        crm_opacity = 0,
                        crm_color = 0,
                    },
                    crm_chest_hair = {
                        crm_index = 0,
                        crm_opacity = 0,
                        crm_color = 0,
                    },
                    crm_eyebrows = {
                        crm_index = 0,
                        crm_opacity = 0,
                        crm_color = 0,
                    },
                },
                crm_makeup = {
                    crm_makeup = {
                        crm_index = 0,
                        crm_opacity = 0,
                        crm_color = 0,
                        crm_secondary_color = 0,
                    },
                    crm_blush = {
                        crm_index = 0,
                        crm_opacity = 0,
                        crm_color = 0,
                        crm_secondary_color = 0,
                    },
                    crm_lipstick = {
                        crm_index = 0,
                        crm_opacity = 0,
                        crm_color = 0,
                        crm_secondary_color = 0,
                    },
                },
                crm_clothing = {
                    {crm_id = 1, crm_style = 0, crm_texture = 0},
                    {crm_id = 3, crm_style = 15, crm_texture = 0},
                    {crm_id = 4, crm_style = 18, crm_texture = 0},
                    {crm_id = 5, crm_style = 0, crm_texture = 0},
                    {crm_id = 6, crm_style = 34, crm_texture = 0},
                    {crm_id = 7, crm_style = 0, crm_texture = 0},
                    {crm_id = 8, crm_style = 15, crm_texture = 0},
                    {crm_id = 9, crm_style = 0, crm_texture = 0},
                    {crm_id = 10, crm_style = 0, crm_texture = 0},
                    {crm_id = 11, crm_style = 15, crm_texture = 0},
                },
                crm_accessories = {
                    {crm_id = 0, crm_style = -1, crm_texture = 0},
                    {crm_id = 1, crm_style = -1, crm_texture = 0},
                    {crm_id = 2, crm_style = -1, crm_texture = 0},
                    {crm_id = 6, crm_style = -1, crm_texture = 0},
                    {crm_id = 7, crm_style = -1, crm_texture = 0},
                },
            } 
            if genderNum ~= 0 then 
                gender = 'mp_f_freemode_01'
                defaultSkin = {
                    crm_model = 'mp_f_freemode_01',
                    crm_inheritance = {
                        crm_mother_face = 45,
                        crm_mother_skin = 21,
                        crm_mother_race = 0,
                        crm_father_face = 20,
                        crm_father_skin = 15,
                        crm_father_race = 0,
                        crm_mix_face = 0,
                        crm_mix_skin = 0,
                        crm_mix_race = 0,
                    },
                    crm_face = {
                        crm_eye_color = 0,
                        crm_no_width = 0,
                        crm_no_height = 0,
                        crm_no_size = 0,
                        crm_no_bone_height = 0,
                        crm_no_peak_height = 0,
                        crm_no_bone_twist = 0,
                        crm_ey_depth = 0,
                        crm_ey_height = 0,
                        crm_ch_bone_width = 0,
                        crm_ch_bone_height = 0,
                        crm_ch_width = 0,
                        crm_em_eyes_opening = 0,
                        crm_em_lip_thickness = 0,
                        crm_ja_width = 0,
                        crm_ja_size = 0,
                        crm_ch_lowering = 0,
                        crm_ch_length = 0,
                        crm_ch_size = 0,
                        crm_ch_hole_size = 0,
                        crm_ne_thickness = 0,
                    },
                    crm_skin = {
                        crm_blemishes = {crm_index = 0, crm_opacity = 0},
                        crm_ageing = {crm_index = 0, crm_opacity = 0},
                        crm_complexion = {crm_index = 0, crm_opacity = 0},
                        crm_sun_damage = {crm_index = 0, crm_opacity = 0},
                        crm_moles_freckles = {crm_index = 0, crm_opacity = 0},
                        crm_body_blemishes = {crm_index = 0, crm_opacity = 0},
                    },
                    crm_hair = {
                        crm_hair = {
                            crm_index = 0,
                            crm_texture = 0,
                            crm_color = 0,
                            crm_secondary_color = 0,
                        },
                        crm_facial_hair = {
                            crm_index = 0,
                            crm_opacity = 0,
                            crm_color = 0,
                        },
                        crm_chest_hair = {
                            crm_index = 0,
                            crm_opacity = 0,
                            crm_color = 0,
                        },
                        crm_eyebrows = {
                            crm_index = 0,
                            crm_opacity = 0,
                            crm_color = 0,
                        },
                    },
                    crm_makeup = {
                        crm_makeup = {
                            crm_index = 0,
                            crm_opacity = 0,
                            crm_color = 0,
                            crm_secondary_color = 0,
                        },
                        crm_blush = {
                            crm_index = 0,
                            crm_opacity = 0,
                            crm_color = 0,
                            crm_secondary_color = 0,
                        },
                        crm_lipstick = {
                            crm_index = 0,
                            crm_opacity = 0,
                            crm_color = 0,
                            crm_secondary_color = 0,
                        },
                    },
                    crm_clothing = {
                        {crm_id = 1, crm_style = 0, crm_texture = 0},
                        {crm_id = 3, crm_style = 15, crm_texture = 0},
                        {crm_id = 4, crm_style = 15, crm_texture = 0},
                        {crm_id = 5, crm_style = 0, crm_texture = 0},
                        {crm_id = 6, crm_style = 35, crm_texture = 0},
                        {crm_id = 7, crm_style = 20, crm_texture = 0},
                        {crm_id = 8, crm_style = 15, crm_texture = 0},
                        {crm_id = 9, crm_style = 0, crm_texture = 0},
                        {crm_id = 10, crm_style = 0, crm_texture = 0},
                        {crm_id = 11, crm_style = 15, crm_texture = 0},
                    },
                    crm_accessories = {
                        {crm_id = 0, crm_style = -1, crm_texture = 0},
                        {crm_id = 1, crm_style = -1, crm_texture = 0},
                        {crm_id = 2, crm_style = -1, crm_texture = 0},
                        {crm_id = 6, crm_style = -1, crm_texture = 0},
                        {crm_id = 7, crm_style = -1, crm_texture = 0},
                    },
                }
            end
            TriggerEvent('osm-referrals:Server:MainTrigger', src)
            MySQL.insert('INSERT INTO playerskins (citizenid, model, skin, active) VALUES (?, ?, ?, ?)', {
                propertyData.owner,
                gender,
                json.encode(defaultSkin),
                1
            })
            Debug("Player: " .. propertyData.owner .. " is creating a new character!")
        end

        Framework[Config.Notify].Notify(src, "Open radial menu for furniture menu and place down your stash and clothing locker.", "info")
    end

    return id
end

local function getMainDoor(propertyId, doorIndex, isShell)
    -- ps_mloproperty is prefix, self.property_id is property unique id, 1 is main door index, cause mlo can have multiple doors

    if isShell then
        local property = Property.Get(propertyId)
        if not property then return end
        return {
            coords = property.propertyData.door_data
        }
    end
    
    local id = ('ps_mloproperty%s_%s'):format(propertyId, doorIndex)
    return DoorResource == 'ox' and exports.ox_doorlock:getDoorFromName(id) or DoorResource == 'qb' and exports['qb-doorlock']:getDoor(id)
end
exports('getMainDoor', getMainDoor)
lib.callback.register("ps-housing:cb:getMainMloDoor", function(_, propertyId, doorIndex)
    return getMainDoor(propertyId, doorIndex)
end)

-- lib.callback.register("ps-housing:cb:getMloDoors", function(propertyId)
--     print(propertyId)
--     local doors = MySQL.query.await('SELECT door_data FROM properties WHERE property_id = ?', {propertyId})
--     print(doors)
--     print(json.encode(doors))
--     return doors
-- end)

exports('registerProperty', RegisterProperty) -- triggered by realtor job
AddEventHandler("ps-housing:server:registerProperty", RegisterProperty)

lib.callback.register("ps-housing:cb:GetOwnedApartment", function(source, cid)
    Debug("ps-housing:cb:GetOwnedApartment", source, cid)
    local result
    if cid ~= nil then
        local success, err = pcall(function()
            result = MySQL.query.await('SELECT * FROM properties WHERE owner_citizenid = ? AND apartment IS NOT NULL AND apartment <> ""', { cid })
        end)
        if not success then
            print("Error querying database for owned apartment with cid: " .. cid .. " - " .. err)
            return nil
        end
    else
        local src = source
        local Player = exports.qbx_core:GetPlayer(src)
        if not Player then
            print("Error: Player not found for source: " .. src)
            return nil
        end
        local success, err = pcall(function()
            result = MySQL.query.await('SELECT * FROM properties WHERE owner_citizenid = ? AND apartment IS NOT NULL AND apartment <> ""', { Player.PlayerData.citizenid })
        end)
        if not success then
            print("Error querying database for owned apartment with citizenid: " .. Player.PlayerData.citizenid .. " - " .. err)
            return nil
        end
    end

    if result and result[1] then
        return result[1]
    else
        print("No owned apartment found for the given criteria.")
        return nil
    end
end)

lib.callback.register("ps-housing:cb:inventoryHasItems", function(source, name, isOx)
    local success, result
    if isOx then
        local items = #exports.ox_inventory:GetInventoryItems(name)
        return items and items > 0
    end

    local query = lib.checkDependency('qb-inventory', '2.0.0') and 'SELECT items FROM inventories WHERE identifier = ?' or 'SELECT items FROM stashitems WHERE stash = ?'
    
    success, result = pcall(function()
        return MySQL.query.await(query, { name })
    end)

    if not success then
        print("Error querying database for inventory items: " .. result)
        return false
    end

    if not result or not result[1] then
        print("No items found for inventory: " .. name)
        return false
    end

    return result[1].items ~= '[]'
end)

AddEventHandler("ps-housing:server:updateProperty", function(type, property_id, data)
    local property = Property.Get(property_id)
    if not property then return end

    property[type](property, data)
end)

AddEventHandler("onResourceStart", function(resourceName) -- Used for when the resource is restarted while in game
	if (GetCurrentResourceName() == resourceName) then
        while not dbloaded do
            Wait(100)
        end
        TriggerClientEvent('ps-housing:client:initialiseProperties', -1, PropertiesTable)
	end 
end)

RegisterNetEvent("ps-housing:server:createNewApartment", function(aptLabel)
    local src = source
    local citizenid = GetCitizenid(src)
    if not Config.StartingApartment then return end
    local PlayerData = GetPlayerData(src)

    local apartment = Config.Apartments[aptLabel]
    if not apartment then return end

    local propertyData = {
        owner = citizenid,
        description = string.format("This is %s's apartment in %s", PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname, apartment.label),
        for_sale = 0,
        shell = apartment.shell,
        apartment = apartment.label,
    }

    Debug("Creating new apartment for " .. GetPlayerName(src) .. " in " .. apartment.label)

    Framework[Config.Logs].SendLog("**NEW APARTMENT**\n\n**Player:** " .. GetPlayerName(src) .. "\n**Location: **" .. apartment.label, 'green')

    RegisterProperty(propertyData)
end)

-- we show the character creator if they spawn without starting appartment and doesn't have skin set
RegisterNetEvent("QBCore:Server:OnPlayerLoaded", function()
    if Config.StartingApartment then return end

    local src = source
    local citizenid = GetCitizenid(src)
    local query = "SELECT skin FROM playerskins WHERE citizenid = ?"
    
    local success, result = pcall(function()
        return MySQL.Sync.fetchAll(query, {citizenid})
    end)

    if not success then
        print("Error querying database for player skin: " .. result)
        return
    end

    if result and result[1] then
        Debug("Player: " .. citizenid .. " skin already exists!")
    else
        TriggerClientEvent("qb-clothes:client:CreateFirstCharacter", src)
        Debug("Player: " .. citizenid .. " is creating a new character!")
    end
end)

-- Creates apartment stash
-- If player has an existing apartment from qb-apartments, it will transfer the items over to the new apartment stash
RegisterNetEvent("ps-housing:server:createApartmentStash", function(citizenId, propertyId)
    local stashId = string.format("property_%s", propertyId)

    -- Check for existing apartment and corresponding stash
    local query = lib.checkDependency('qb-inventory', '2.0.0') and 'SELECT items, identifier FROM inventories WHERE identifier' or 'SELECT items, stash FROM stashitems WHERE stash'
    local success, result = pcall(function()
        return MySQL.query.await(('%s IN (SELECT name FROM apartments WHERE citizenid = ?)'):format(query), { citizenId })
    end)

    if not success then
        print("Error querying database for existing apartment stash: " .. result)
        return
    end

    local items = {}
    if result[1] ~= nil then
        items = json.decode(result[1].items)

        -- Delete the old apartment stash as it is no longer needed
        -- local deleteSuccess, deleteResult = pcall(function()
        --     MySQL.Async.execute('DELETE FROM stashitems WHERE stash = ?', { result[1].identifier or result[1].stash })
        -- end)

        -- if not deleteSuccess then
        --     print("Error deleting old apartment stash: " .. deleteResult)
        --     return
        -- end
        print(items)
    end

    -- This will create the stash for the apartment (without requiring player to have first opened and placed item in it)
    local saveSuccess, saveResult = pcall(function()
        MySQL.prepare('INSERT INTO inventories (identifier, items) VALUES (?, ?) ON DUPLICATE KEY UPDATE items = ?', { stashId, json.encode(items), json.encode(items)})
        TriggerEvent('qb-inventory:server:SaveStashItems', stashId, items)
    end)

    if not saveSuccess then
        print("Error saving new apartment stash: " .. saveResult)
    end
end)

RegisterNetEvent('qb-apartments:returnBucket', function()
    local src = source
    QBCore.Functions.SetPlayerBucket(src, 0)
end)

AddEventHandler("ps-housing:server:addTenantToApartment", function (data)
    local apartment = data.apartment
    local targetSrc = tonumber(data.targetSrc)
    local realtorSrc = data.realtorSrc
    local targetCitizenid = GetCitizenid(targetSrc, realtorSrc)

    -- id of current apartment so we can change it
    local property_id = nil

    for _, v in pairs(PropertiesTable) do
        local propertyData = v.propertyData
        if propertyData.owner == targetCitizenid then
            if propertyData.apartment == apartment then
                Framework[Config.Notify].Notify(targetSrc, "You are already in this apartment", "error")
                Framework[Config.Notify].Notify(targetSrc, "This person is already in this apartment", "error")

                return
            elseif propertyData.apartment and #propertyData.apartment > 1 then
                property_id = propertyData.property_id
                break
            end
        end
    end

    if property_id == nil then
        local newApartment = Config.Apartments[apartment]
        if not newApartment then return end

        local citizenid = GetCitizenid(targetSrc, realtorSrc)
        local targetToAdd = exports.qbx_core:GetPlayerByCitizenId(citizenid).PlayerData
        local propertyData = {
            owner = targetCitizenid,
            description = string.format("This is %s's apartment in %s", targetToAdd.charinfo.firstname .. " " .. targetToAdd.charinfo.lastname, newApartment.label),
            for_sale = 0,
            shell = newApartment.shell,
            apartment = newApartment.label,
        }

        Debug("Creating new apartment for " .. GetPlayerName(targetSrc) .. " in " .. newApartment.label)
        Framework[Config.Logs].SendLog("**NEW APARTMENT**\n\n**Player:** " .. GetPlayerName(targetSrc) .. "\n**Location: **" .. newApartment.label, 'green')
        -- Framework[Config.Logs].SendLog("Creating new apartment for " .. GetPlayerName(targetSrc) .. " in " .. newApartment.label)

        Framework[Config.Notify].Notify(targetSrc, "Your apartment is now at "..apartment, "success")
        Framework[Config.Notify].Notify(realtorSrc, "You have added ".. targetToAdd.charinfo.firstname .. " " .. targetToAdd.charinfo.lastname .. " to apartment "..apartment, "success")

        RegisterProperty(propertyData, true)

        return
    end

    local property = Property.Get(property_id)
    if not property then return end

    property:UpdateApartment(data)

    local citizenid = GetCitizenid(targetSrc, realtorSrc)
    local targetToAdd = exports.qbx_core:GetPlayerByCitizenId(citizenid)
    local targetPlayer = targetToAdd.PlayerData

    Framework[Config.Notify].Notify(targetSrc, "Your apartment is now at "..apartment, "success")
    Framework[Config.Notify].Notify(realtorSrc, "You have added ".. targetPlayer.charinfo.firstname .. " " .. targetPlayer.charinfo.lastname .. " to apartment "..apartment, "success")
end)

exports('IsOwner', function(src, property_id)
    local property = Property.Get(property_id)
    if not property then return false end

    local citizenid = GetCitizenid(src, src)
    return property:CheckForAccess(citizenid)
end)

function GetCitizenid(targetSrc, callerSrc)
    local Player = exports.qbx_core:GetPlayer(tonumber(targetSrc))
    if not Player then
        Framework[Config.Notify].Notify(callerSrc, "Player not found.", "error")
        return
    end
    local PlayerData = Player.PlayerData
    local citizenid = PlayerData.citizenid
    return citizenid
end

function GetCharName(src)
    local Player = exports.qbx_core:GetPlayer(tonumber(src))
    if not Player then return end
    local PlayerData = Player.PlayerData
    return PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname
end

function GetPlayerData(src)
    local Player = exports.qbx_core:GetPlayer(tonumber(src))
    if not Player then return end
    local PlayerData = Player.PlayerData
    return PlayerData
end

function GetPlayer(src)
    local Player = exports.qbx_core:GetPlayer(tonumber(src))
    if not Player then return end
    return Player
end