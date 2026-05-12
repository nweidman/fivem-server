Settings = {} -- don't touch this

Settings.Debug = false -- This will print debug messages to the console.
Settings.DebugPrint = function(...)
    print("[ak4y DEBUG]:", ...)
end

Settings.Framework = "qb" -- "esx" or "qb"
Settings.Mysql = "oxmysql" -- "mysql-async" or "oxmysql" or "ghmattimysql"

Settings.Phone = "qb-phone" -- "qb-phone" or "gksphone" or "gcphone"
Settings.PhoneCustomElse = false -- Read the text under, if you make it true you should follow those steps. Otherwise it should remain false
-- If you have a problem with phone number customization, check the query on utils > server.lua [line 238] and edit it to your liking.


Settings.openWithCommand = true -- This will open the menu with a command. If you want to open the menu with a command set this to true.
Settings.openCommand = "" -- This is the command that will open the menu. If you have openWithCommand set to true, you can change this to whatever you want. 

Settings.CashOrBank = "bank" -- "cash" or "bank" 

Settings.VehicleStored = 0 -- JUST FOR ESX 

-- item types should be same as your database table names
Settings.SqlVehicleType = "vehicle" -- This is the table name in your database for vehicles. If you want to change the table name, you can change this to whatever you want.
Settings.SqlAirType = "air" -- This is the table name in your database for aircraft. If you want to change the table name, you can change this to whatever you want.
Settings.SqlBoatType = "boat" -- This is the table name in your database for boats. If you want to change the table name, you can change this to whatever you want.

Settings.testDriveBlip = true -- This will show a blip on the map for the test drive location. If you want to show a blip set this to true.
Settings.testDriveBlipText = "Test Drive" -- This is the text that will be displayed on the blip. If you have testDriveBlip set to true, you can change this to whatever you want.
Settings.testDriveDrawText = "You can start the test drive from the menu. Vehicles drive slower at the airport" -- This is the text that will be displayed when the player is near the test drive location. If you want to change the test drive text, you can change this to whatever you want.
Settings.testDriveTime = 90 -- This is the time in second that the player will have to test drive the vehicle. If you want to change the test drive time, you can change this to whatever you want.
Settings.testDriveCoord = vector3(-1287.94, -3390.70, 13.94) -- This is the coordinates that the player will be teleported to when they test drive the vehicle. If you want to change the test drive coordinates, you can change this to whatever you want.
Settings.testDriveCarSpawn = vector4(-1271.59, -3399.87, 13.94, 328.87) -- This is the coordinates that the player will be teleported to when they test drive the vehicle. If you want to change the test drive coordinates, you can change this to whatever you want.

Settings.GiveAddKeys = true -- This will give the player keys when they buy a vehicle. If you want to give keys set this to true.
Settings.GiveAddKeysFunction = function(newPlate)
    -- This is the function that will give the player keys. If you have GiveAddKeys set to true, you can change this to whatever you want.
    TriggerEvent("vehiclekeys:client:SetOwner", newPlate)
end