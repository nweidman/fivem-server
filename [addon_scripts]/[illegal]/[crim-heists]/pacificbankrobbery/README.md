# Project X K4MB1 Pacific Bank Robbery

K4MB1 Pacific Bank Robbery - Project X

## Links

[Discord]([Discord](https://discord.gg/bJNxYDAm5u))
[Tebex](https://www.projectx.gg)

## Dependencies

[ox_lib](https://github.com/overextended/ox_lib)
[K4MB1 Pacific Map](https://www.k4mb1maps.com/package/4692112)
[Minigames-zip](https://drive.google.com/file/d/16waPVC_5hEAEph1OgtUgT9DuhIpNxiNf/view?usp=sharing)

### Required Dependencies if you want to use the script as is

[ps-dispatch](https://github.com/Project-Sloth/ps-dispatch) (QBCore Only) (For the pre-configured dispatch)

## Installation

### Add this to the server.cfg

```lua
  ensure ox_lib -- This should be placed under ensure qb-core in your server.cfg, if you just downloaded it
  ensure projectx-pacificbankrobbery-k4mb1
```

-- For qb-inventory:

```lua
    ['pacific_key']               = {['name'] = 'pacific_key',               ['label'] = 'Pacific Key',        ['weight'] = 50,     ['type'] = 'item',          ['image'] = 'pacific_key.png',           ['unique'] = true,          ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Key!'},
    ['x_phone']           = {['name'] = 'x_phone',               ['label'] = 'X Phone',        ['weight'] = 50,     ['type'] = 'item',          ['image'] = 'x_phone.png',           ['unique'] = true,          ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = '?????????'},
    ['pacificcard']                     = {['name'] = 'pacificcard',                  ['label'] = 'Pacific Keycard',           ['weight'] = 25,        ['type'] = 'item',          ['image'] = 'pacificcard.png',               ['unique'] = false,         ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'A Security card for Pacific Bank'},
    ['x_device']          = {['name'] = 'x_device',           ['label'] = 'X Device',    ['weight'] = 50,   ['type'] = 'item',         ['image'] = 'x_device.png',        ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = '?????????'},
    ['bag']                  = {['name'] = 'bag',                   ['label'] = 'Bag',                ['weight'] = 400,   ['type'] = 'item',         ['image'] = 'bag.png',                ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Duffel bag'},
    ['x_laptop']          = {['name'] = 'x_laptop',           ['label'] = 'X Laptop',    ['weight'] = 50,   ['type'] = 'item',         ['image'] = 'x_laptop.png',        ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = '?????????'},
    ['pliers']                = {['name'] = 'pliers',                ['label'] = 'Pliers',          ['weight'] = 200,    ['type'] = 'item',          ['image'] = 'pliers.png',         ['unique'] = false,         ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Pliers..?'},
    ['hackcard']         = {['name'] = 'hackcard',                ['label'] = 'hackcard',            ['weight'] = 50,     ['type'] = 'item',          ['image'] = 'hackcard.png',        ['unique'] = true,          ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Hack card'},
    ['decryptor']         = {['name'] = 'decryptor',                ['label'] = 'decryptor',        ['weight'] = 750,    ['type'] = 'item',          ['image'] = 'decryptomatic.png',          ['unique'] = true,          ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Decyrptomatic'}, 
    ["laserdrill"]           = {["name"] = "laserdrill",             ["label"] = "Laser Drill",     ["weight"] = 7500,      ["type"] = "item",     ["image"] = "laserdrill.png",     ["unique"] = true,    ["useable"] = true,    ["shouldClose"] = true,      ["combinable"] = nil,   ["description"] = "Laser Drill" },
    ['x_stethoscope']        = {['name'] = 'x_stethoscope',       ['label'] = 'X Stethoscope',      ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_stethoscope.png',       ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "click click"},
    ['glass_cutter']         = {['name'] = 'glass_cutter',         ['label'] = 'Glass Cutter',    ['weight'] = 1000,   ['type'] = 'item',   ['image'] = 'glass_cutter.png',         ['unique'] = false,     ['useable'] = false,  ['shouldClose'] = false,  ['combinable'] = nil,   ['description'] = ""}, 
```

-- For ox_inventory:

```lua
 ["laserdrill"] = {
  label = "Laser Drill",
  weight = 1000,
  stack = false,
  close = false,
  description = "",
  client = {
   image = "laserdrill.png",
  }
 },

  ["x_device"] = {
  label = "Flapper Hero",
  weight = 125,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "x_device.png",
  }
 },
    
 ["bag"] = {
  label = "Duffel Bag",
  weight = 250,
  stack = false,
  close = false,
  description = "Duffel bag",
  client = {
   image = "bag.png",
  }
 },
   
 ["hackcard"] = {
  label = "Hackcard",
  weight = 50,
  stack = false,
  close = false,
  description = "Hack card",
  client = {
   image = "hackcard.png",
  }
 },
   
 ["decryptor"] = {
  label = "Decrypt-o-matic",
  weight = 300,
  stack = false,
  close = false,
  description = "Decrypt PIN based encryptions",
  client = {
   image = "decryptomatic.png",
  }
 },
   
 ["pliers"] = {
  label = "Pliers",
  weight = 125,
  stack = false,
  close = false,
  description = "A pair of pliers",
  client = {
   image = "pliers.png",
  }
 },

 ["x_laptop"] = {
  label = "Hackcard",
  weight = 50,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "x_laptop.png",
  }
 },

  ["x_phone"] = {
  label = "x Phone",
  weight = 300,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "x_phone.png",
  }
 },
   
 ["pacific_key"] = {
  label = "Pacific Key",
  weight = 125,
  stack = false,
  close = false,
  description = "Key!",
  client = {
   image = "pacific_key.png",
  }
 },

 ["pacificcard"] = {
  label = "Pacific Keycard",
  weight = 50,
  stack = false,
  close = false,
  description = "A Security card for Pacific Bank",
  client = {
   image = "pacificcard.png",
  }
 },

  ["x_stethoscope"] = {
  label = "X Stethoscope",
  weight = 150,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "x_stethoscope.png",
  }
 },

 ["glass_cutter"] = {
  label = "Glass Cutter",
  weight = 1000,
  stack = false,
  close = false,
  description = "",
  client = {
   image = "glass_cutter.png",
  }
},
```