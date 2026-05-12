if GetResourceState('ps-housing') ~= 'started' then return end

---@class Property
---@field coords vector3
---@field name string
---@field label string

Property = {

  ---@param identifier string The player framework identifier
  ---@return table<Property>
  getPropertiesByIdentifier = function(identifier)
    local houses = MySQL.query.await("SELECT * FROM `properties` WHERE `owner_citizenid` = ?", { identifier })
    local properties = {}

    for i, house in ipairs(houses) do
        
        if house.apartment then
            properties[#properties + 1] = {
            coords = Property.Locations[house.apartment],
            name = house.apartment.. ' #' .. house.property_id,
            label = house.apartment.. ' #' .. house.property_id
            }
        else
            local location, x, y, z
            if house.shell == "mlo" then
                location = json.decode(house.garage_data)
                x = location.x
                y = location.y
                z = location.z
            else
                location = json.decode(house.door_data)
                x = location.x
                y = location.y
                z = location.z
            end
            properties[#properties + 1] = {
                coords = vector3(x,y,z),
                name = house.street .. ' #' .. house.property_id,
                label = house.street .. ' #' .. house.property_id
            }
        end
    end
    return properties
  end,

  Locations = {
    ["Integrity Way"] = vector3(269.73, -640.75, 54.74),
    ["Fantastic Plaza"] = vector3(291.52, -1078.67, 83.76),
    ["Morningwood Blvd"] = vector3(-1288.52, -430.51, 39.47),
    ["South Rockford Drive"] = vector3(-667.02, -1105.24, 58.36),
    ["Tinsel Towers"] = vector3(-620.97, 46.58, 59.64),
  }
}

local file = LoadResourceFile('ps-housing', 'config.lua')
if file then
  load(file)()
  if next(houses.Locations) then
    for k, v in pairs(houses.Locations) do
      Property.Locations[k] = v.coords.enter
    end
  end
end