# Project X K4MB1 Paleto Bank Robbery

Project X K4MB1 Paleto Bank Robbery - Project X

## Links

[Discord](https://discord.gg/bJNxYDAm5u)
[Tebex](https://www.projectx.gg)

## Dependencies

[ox_lib](https://github.com/overextended/ox_lib)
[K4MB1 Paleto Map](https://www.k4mb1maps.com/package/4881060)
[Minigame Zip File](https://drive.google.com/file/d/1Z9ZSLaOXaaq2Grw9kOij1XUkrdALA4Mc/view?usp=sharing)


### Required Dependencies if you want to use the script as is

[ps-dispatch](https://github.com/Project-Sloth/ps-dispatch) (QBCore Only) (For the pre-configured dispatch)

## Installation

### Add this to the server.cfg

```lua
  ensure ox_lib -- This should be placed under ensure qb-core in your server.cfg, if you just downloaded it
  ensure projectx-paletobankrobbery-k4mb1
```

-- For qb-inventory:

```lua
['paletocardone']             = {['name'] = 'paletocardone',                ['label'] = 'Paleto Card A',          ['weight'] = 0,     ['type'] = 'item',          ['image'] = 'paletocardone.png',      ['unique'] = true,          ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'A security card for Paleto Bank'},
['paletocardtwo']             = {['name'] = 'paletocardtwo',             ['label'] = 'Paleto Card B',          ['weight'] = 0,     ['type'] = 'item',          ['image'] = 'paletocardtwo.png',      ['unique'] = true,          ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'A security card for Paleto Bank'},
['pliers']                = {['name'] = 'pliers',                ['label'] = 'Pliers',          ['weight'] = 200,    ['type'] = 'item',          ['image'] = 'pliers.png',         ['unique'] = false,         ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Pliers..?'},
['paleto_key']               = {['name'] = 'paleto_key',               ['label'] = 'Paleto Key',        ['weight'] = 50,     ['type'] = 'item',          ['image'] = 'paleto_key.png',           ['unique'] = true,          ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Key!'},
['x_device']          = {['name'] = 'x_device',           ['label'] = 'Flapper Hero',    ['weight'] = 50,   ['type'] = 'item',         ['image'] = 'x_device.png',        ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = '?????????'},
['bag']                  = {['name'] = 'bag',                   ['label'] = 'Duffel bag',                ['weight'] = 400,   ['type'] = 'item',         ['image'] = 'bag.png',                ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Duffel bag'},
['hackcard']         = {['name'] = 'hackcard',                ['label'] = 'Hackcard',            ['weight'] = 50,     ['type'] = 'item',          ['image'] = 'hackcard.png',        ['unique'] = true,          ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Hack card'},
['decryptor']         = {['name'] = 'decryptor',                ['label'] = 'decryptor',        ['weight'] = 750,    ['type'] = 'item',          ['image'] = 'decryptomatic.png',          ['unique'] = true,          ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = 'Decyrptomatic'},
['x_phone']        			= {['name'] = 'x_phone',         			   ['label'] = 'X Phone',     			['weight'] = 50,   		['type'] = 'item',   	      ['image'] = 'x_phone.png',    		  ['unique'] = true,         ['useable'] = false,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = '?????????'},
```

-- For ox_inventory:

```lua
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
  ["paletocardone"] = {
  label = "Paleto Card A",
  weight = 0,
  stack = false,
  close = false,
  description = "A security card for Paleto Bank",
  client = {
   image = "paletocardone.png",
  }
 },

 ["paletocardtwo"] = {
  label = "Paleto Card B",
  weight = 0,
  stack = false,
  close = false,
  description = "A security card for Paleto Bank",
  client = {
   image = "paletocardtwo.png",
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

 
  ["x_device"] = {
  label = "X Device",
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

 ["paleto_key"] = {
  label = "Paleto Bank Key",
  weight = 100,
  stack = false,
  close = false,
  description = "Paleto Bank Key",
  client = {
   image = "paleto_key.png",
  }
 },
```
