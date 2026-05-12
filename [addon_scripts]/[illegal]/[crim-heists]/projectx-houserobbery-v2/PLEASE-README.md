# Project X House Robbery V2

## Links

[Discord](https://discord.gg/bJNxYDAm5u)
[Store](https://www.projectx.gg)
[Documentation](https://docs.projectx.gg/)

## Dependencies

[ox_lib](https://github.com/overextended/ox_lib)

## Required Dependencies if you want to use the script as is

[K4MB1-Starter-Shells](https://k4mb1maps.com/product/5015840) -- Free resource by K4MBI for default shells, if you don't have it, you need to download it, otherwise you cant use the preset houses done on them
[LevLevLev-Shell](https://github.com/levdevlev/lev-apartments/archive/refs/heads/main.zip)
[Project-X-Burner](https://www.projectx.gg/category/3011102) -- Free resource by Project X
[Project-X-Tasks](https://www.projectx.gg/category/3011102) -- Free resource by Project X
[bl_dialog] - We added this into the minigame zip below because we did some changes to accommodate our contracts system

[QBCore-QBOX]
[ps-dispatch](https://github.com/Project-Sloth/ps-dispatch)

[ESX]
[linden_outlawalert](https://github.com/thelindat/linden_outlawalert)

[Minigames](https://drive.google.com/file/d/1xS4MTkhajGBTj2B2Cl_6wE0uZwGLiZrx/view?usp=sharing) (Download and place in your standalone or minigames folder)

### Installation

- Step 1: Extract the script from the zip file and place it into your scripts folder.
- Step 2: Add the minigames and other dependencies that are found in the zip file above into your standalone/dependencies folder (Make sure they are not in the same folder as the robbery script).
- Step 3: Add the items from below and the images from the images folder to your inventory.
- Step 4: Configure the config.lua file to work with your server by changing the Framework, Inventory, Dispatch, Target name.
- Step 5: Make sure that the Framework, ox_lib, your Target, Dispatch, Inventory, and Minigames are started before the robbery script.

### Add this to server.cfg

```lua
  ensure ox_lib -- This should be placed under ensure qb-core in your server.cfg, if you just downloaded it
  ensure Your Skill System -- If you installed a skill system
  ensure projectx-houserobbery
```

### Images done by Artwork Inventory

[Discord](https://discord.gg/Z2awpnXKdw) -- Use code ProjectX for 10% off!

### Items required from a shop/black market

- advancedlockpick
- x_burner (if you enabled it in the config)
- x_tablet (if you enabled it in the config)
- x_device
- x_stethoscope
- glass_cutter
- bag

### The rest of the items are obtained within the robbery

#### qb inventory items

```lua
["house_key"]     = {["name"] = "house_key",       ["label"] = "House Key",       ["weight"] = 100,  ["type"] = "item",   ["image"] = "house_key.png",   ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "To unlock the front door"},
["x_burner"]     = {["name"] = "x_burner",       ["label"] = "Burner Phone",       ["weight"] = 100,  ["type"] = "item",   ["image"] = "x_burner.png",   ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "To receive anonymous calls"},
['x_tablet']          = {['name'] = 'x_tablet',           ['label'] = 'X Tablet',    ['weight'] = 100,   ['type'] = 'item',         ['image'] = 'x_tablet.png',        ['unique'] = true,       ['useable'] = true,     ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Nothing suspicious about this tablet..'},
['bag']                  = {['name'] = 'bag',                   ['label'] = 'Bag',                ['weight'] = 400,   ['type'] = 'item',         ['image'] = 'bag.png',                ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Duffel bag'},
['x_stethoscope']        = {['name'] = 'x_stethoscope',       ['label'] = 'X Stethoscope',      ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_stethoscope.png',       ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "click click"},
['x_device']          = {['name'] = 'x_device',           ['label'] = 'X Device',    ['weight'] = 50,   ['type'] = 'item',         ['image'] = 'x_device.png',        ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = '?????????'},
['glass_cutter']         = {['name'] = 'glass_cutter',         ['label'] = 'Glass Cutter',    ['weight'] = 1000,   ['type'] = 'item',   ['image'] = 'glass_cutter.png',         ['unique'] = false,     ['useable'] = false,  ['shouldClose'] = false,  ['combinable'] = nil,   ['description'] = ""}, 
['advancedlockpick']                = {['name'] = 'advancedlockpick',                  ['label'] = 'Advanced Lockpick',         ['weight'] = 500,          ['type'] = 'item',         ['image'] = 'advancedlockpick.png',        ['unique'] = false,         ['useable'] = true,      ['shouldClose'] = true,      ['combinable'] = nil,   ['description'] = 'If you lose your keys a lot this is very useful... Also useful to open your beers'},
["x_microwave"]        = {["name"] = "microwave",         ["label"] = "Microwave",     ["weight"] = 5000,  ["type"] = "item",   ["image"] = "x_microwave.png",      ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Heats things up"},
["x_coffeemaker"]      = {["name"] = "x_coffeemaker",      ["label"] = "Coffee Machine",    ["weight"] = 5000,  ["type"] = "item",   ["image"] = "x_coffeemaker.png",  ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Makes a delicious expresso"},
["x_painting"]     = {["name"] = "x_painting",       ["label"] = "Painting",        ["weight"] = 3000,  ["type"] = "item",   ["image"] = "x_painting.png",      ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Just a work of art,"},
["x_plush"]       = {["name"] = "x_plush",         ["label"] = "Plush Toy",      ["weight"] = 100,  ["type"] = "item",   ["image"] = "x_plush.png",        ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "So cute!"},
["x_toaster"]     = {["name"] = "x_toaster",       ["label"] = "Toaster",        ["weight"] = 1000,  ["type"] = "item",   ["image"] = "x_toaster.png",      ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Toasts bread"},
["laptop"]       = {["name"] = "laptop",         ["label"] = "Laptop",        ["weight"] = 500,  ["type"] = "item",   ["image"] = "laptop.png",        ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A high-end laptop"},
["x_printer"]     = {["name"] = "x_printer",       ["label"] = "Printer",        ["weight"] = 5000,  ["type"] = "item",   ["image"] = "x_printer.png",      ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A color printer"},
["emerald_necklace"] = {["name"] = "emerald_necklace", ["label"] = "Emerald Necklace", ["weight"] = 200,   ["type"] = "item",   ["image"] = "emerald_necklace.png", ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
['x_goldenknife']           = {['name'] = 'x_goldenknife',               ['label'] = 'X Golden Knife',        ['weight'] = 50,     ['type'] = 'item',          ['image'] = 'x_goldenknife.png',           ['unique'] = true,          ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = '?????????'},
["x_television"]     = {["name"] = "x_television",       ["label"] = "X Television",        ["weight"] = 10000,  ["type"] = "item",   ["image"] = "x_television.png",      ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A high-definition television"},\
["x_watch"]       = {["name"] = "x_watch",      ["label"] = "Watch",   ["weight"] = 100,  ["type"] = "item",   ["image"] = "x_watch.png",    ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Wrist watch"},
["x_bananatrophy"]       = {["name"] = "x_bananatrophy",      ["label"] = "Banana Trophy",   ["weight"] = 1000,  ["type"] = "item",   ["image"] = "x_bananatrophy.png",    ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Don't ask.."},
["x_electricguitar"]       = {["name"] = "x_electricguitar",      ["label"] = "Electric Guitar",   ["weight"] = 1000,  ["type"] = "item",   ["image"] = "x_electricguitar.png",    ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Rock on!"},
["giant_gem"]       = {["name"] = "giant_gem",      ["label"] = "Giant Gem",   ["weight"] = 500,  ["type"] = "item",   ["image"] = "giant_gem.png",    ["unique"] = true,   ["useable"] = false,  ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A huge sparkling gem"},
```

### ox_Inventory items

```lua
["house_key"] = {
    label = "House Key",
    weight = 100,
    stack = false,
    close = false,
    description = "To unlock the front door",
},
["x_burner"] = {
    label = "Burner Phone",
    weight = 100,
    stack = false,
    close = false,
    description = "Nothing suspicious about this phone..",
},
["x_tablet"] = {
    label = "X Tablet",
    weight = 100,
    stack = false,
    close = false,
    description = "Nothing suspicious about this tablet..",
},
["bag"] = {
    label = "Bag",
    weight = 400,
    stack = false,
    close = false,
    description = "Duffel bag",
},
["x_stethoscope"] = {
    label = "X Stethoscope",
    weight = 200,
    stack = false,
    close = false,
    description = "click click",
},
["x_device"] = {
    label = "X Device",
    weight = 50,
    stack = false,
    close = false,
    description = "?????????",
},
["glass_cutter"] = {
    label = "Glass Cutter",
    weight = 1000,
    stack = false,
    close = false,
    description = "",
},
["advancedlockpick"] = {
    label = "Advanced Lockpick",
    weight = 500,
    stack = true,
    close = true,
    description = "If you lose your keys a lot this is very useful... Also useful to open your beers",
},
["x_coffeemaker"] = {
    label = "Coffee Maker",
    weight = 5000,
    stack = true,
    close = false,
    description = "To make that perfect cup of Joe!",
 },
["x_microwave"] = {
    label = "Microwave",
    weight = 5000,
    stack = true,
    close = false,
    description = "A microwave - for heating things up!",
},
["x_painting"] = {
    label = "Painting",
    weight = 3000,
    stack = true,
    close = false,
    description = "A beautiful painting - worth a lot!",
},
["x_plush"] = {
    label = "Plush Toy",
    weight = 100,
    stack = true,
    close = false,
    description = "A cute plush toy",
},
["x_toaster"] = {
    label = "Toaster",
    weight = 1000,
    stack = true,
    close = false,
    description = "A kitchen toaster",
},
["laptop"] = {
    label = "Laptop",
    weight = 500,
    stack = true,
    close = false,
    description = "A high-end laptop",
},
["x_printer"] = {
    label = "Printer",
    weight = 5000,
    stack = true,
    close = false,
    description = "A color printer",
},
["emerald_necklace"] = {
    label = "Emerald Necklace",
    weight = 200,
    stack = true,
    close = false,
    description = "",
},
['x_goldenknife'] = {
    label = "X Golden Knife",
    weight = 300,
    stack = false,
    close = false,
    description = "?????????",
},
['x_television'] = {
    label = "X Television",
    weight = 10000,
    stack = false,
    close = false,
    description = "A high-definition television",
},
["x_watch"] = {
    label = "Watch",
    weight = 100,
    stack = true,
    close = false,
    description = "Wrist watch",
},
["x_bananatrophy"] = {
    label = "Banana Trophy",
    weight = 1000,
    stack = false,
    close = false,
    description = "Don't ask..",
},
["x_electricguitar"] = {
    label = "Electric Guitar",
    weight = 1000,
    stack = false,
    close = false,
    description = "Rock on!",
},
["giant_gem"] = {
    label = "Giant Gem",
    weight = 500,
    stack = false,
    close = false,
    description = "A huge sparkling gem",
},
```
