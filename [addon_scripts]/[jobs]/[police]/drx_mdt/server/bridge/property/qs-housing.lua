if GetResourceState('qs-housing') ~= 'started' then return end
if GetResourceState('0r-apartment-v2') ~= 'started' then return end
---@class Property
---@field coords vector3
---@field name string
---@field label string

Property = {

  ---@param identifier string The player framework identifier
  ---@return table<Property>
  getPropertiesByIdentifier = function(identifier)
    local apartments = MySQL.query.await("SELECT * FROM `0resmon_apartment_rooms` WHERE `owner` = ?", { identifier })
    local properties = {}

    ApartmentInfo = {
      [1] = {
        label = "Integrity Apartments",
        coords = { enter = vec4(269.49, -640.68, 42.02, 249.19) },
      },
      [2] = {
          label = "Elgin Motel",
          coords = { enter = vec4(-70.99, 142.24, 81.71, 36.89) },
      },
      [3] = {
          label = "Tinsel Towers Apartments",
          coords = { enter = vec4(-614.59, 46.03, 43.59, 182.40) },
      },
      [4] = {
          label = "Weazel Plaza Apartments",
          coords = { enter = vec4(-906.85, -452.05, 39.60, 115.93) },
      },
      [5] = {
          label = "Opium Nights Hotel",
          coords = { enter = vec4(-703.14, -2276.07, 13.45, 223.20) },
      },
      [6] = {
          label = "Eclipse Apartments",
          coords = { enter = vec4(-310.18, 221.53, 87.93, 192.72) },
      },
      [7] = {
          label = "Beach Side Apartments",
          coords = { enter = vec4(-1237.5055, -859.0568, 13.1062, 215.8765) },
      },
      [8] = {
          label = "Vespucci Apartments",
          coords = { enter = vec4(58.09, -1005.74, 29.62, 217.8207) }, 
      },
      [9] = {
          label = "Strawberry Apartments",
          coords = { enter = vec4(184.44, -1079.28, 29.68, 356.7) },  
      },
      [10] = {
          label = "Pink Cage Motel",
          coords = { enter = vec4(325.12, -229.57, 54.22, 342.02) },  
      },
      [11] = {
          label = "Dream View Motel",
          coords = { enter = vec4(-96.79, 6324.07, 31.58, 134.93) },
      },
      [12] = {
          label = "Perrera Beach Motel",
          coords = { enter = vec4(-1477.16, -674.52, 29.04, 219.23) },
      },
    }

    -- 0resomn apartments
    for i, apartment in ipairs(apartments) do 
      print("x")
      properties[#properties + 1] = {
        coords = ApartmentInfo[apartment.apartment_id].coords.enter,
        name = ApartmentInfo[apartment.apartment_id].label.. ' #' .. apartment.room_id,
        label = ApartmentInfo[apartment.apartment_id].label.. ' #' .. apartment.room_id
      } 
    end

    -- qs-housing houses
    local houses = MySQL.query.await("SELECT * FROM `player_houses` WHERE `owner` = ?", { identifier })
    for i, house in ipairs(houses) do 
      local houseInfo = MySQL.query.await("SELECT * FROM `houselocations` WHERE `name` = ?", { house.house })
      local coords = json.decode(houseInfo[1].coords).enter
      properties[#properties + 1] = {
        coords = vec3(coords.x, coords.y, coords.z),
        name = houseInfo[1].name,
        label = houseInfo[1].label
      } 
    end

    return properties
  end,

  Locations = {}
}

local file = LoadResourceFile('0r-apartment-v2', 'config.lua')
if file then
  load(file)()
  if next(Apartments.Locations) then
    for k, v in pairs(Apartments.Locations) do
      Property.Locations[k] = v.enter
    end
  end
end