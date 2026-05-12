--[[
    All script settings are found and edited in this file.
    Make sure to configure everything properly before running the script.
]]

Config = {}

---[[ The images folder path of your inventory script ]]
--- So that item names and images will match your inventory - images only PNG !
Config.InventoryImagesFolder = 'ox_inventory/web/images/'

--[[ Level ]]
-- Level requirement for crafting, if set to false, everything can now be crafted.
Config.LevelSystem = true
-- Experience experience for each level. You can adjust or expand as needed.
Config.Levels = { 0, 100, 205, 315, 430, 550, 680, 815, 955, 1100, 1260, 1420, 1590, 1770, 1960, 2160, 2365, 2580, 2810, 3050, 3305, 3570, 3850, 4140, 4450, 4770, 5110, 
5465, 5840, 6230, 6640, 7070, 7525, 8000, 8500, 9030, 9580, 10160, 10765, 11405, 12075, 12780, 13515, 14290, 15105, 15960, 16860, 17805, 18795, 19835, 20925, 22070, 
23275, 24540, 25865, 27260, 28720, 30260, 31870, 33565, 35345, 37210, 39170, 41230, 43390, 45660, 48045, 50545, 53170, 55930, 58825, 61870, 65060, 68415, 71935, 75635, 
79515, 83590, 87870, 92365, 97080, 102035, 107240, 112705, 118445, 124470, 130805, 137455, 144440, 151780, 159485, 167580, 176080, 184995, 194350, 204165, 214470, 225285, 
236640, 248565}

---[[ Money Configuration ]]
Config.Money = {
    isItem = false,        -- If set to true, money will be treated as an item.
    itemName = 'cash',    -- The name of the money item (if isItem is true).
    accountName = 'bank', -- The account name used for money.
}

--[[ Debug Mode ]]
Config.debug = false -- Enable (true) or disable (false) debug mode for development/testing.
