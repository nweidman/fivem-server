# Project X K4MB1 Cash Exchange 2 Robbery

## Links

[Discord](https://discord.gg/bJNxYDAm5u)
[Store](https://www.projectx.gg)

## Dependencies

[ox_lib](https://github.com/overextended/ox_lib)
[K4MB1 Cash Exchange 2 Map](https://k4mb1maps.com/product/6769192)
[Minigames](https://drive.google.com/file/d/1u5Numi-MId-_tkYhVqhRp25BMiV4s69e/view?usp=sharing)

### Required Dependencies if you want to use the script as is

[QBCore-QBOX]
[ps-dispatch](https://github.com/Project-Sloth/ps-dispatch)

[ESX]
[linden_outlawalert](https://github.com/thelindat/linden_outlawalert)

### Installation

- Step 1: Extract the script from the zip file and place it into your scripts folder.
- Step 2: Add the minigames that are found in the zip file above into your standalone/dependencies folder (Make sure they are not in the same folder as the robbery script).
- Step 3: Add the items from below and the images from the images folder to your inventory.
- Step 4: Configure the config.lua file to work with your server by changing the Framework, Inventory, Dispatch, Target name.
- Step 5: Make sure that the Framework, ox_lib, your Target, Dispatch, Inventory, and Minigames are started before the robbery script.

### Add this to the server.cfg

```lua
  ensure ox_lib -- This should be placed under ensure qb-core in your server.cfg, if you just downloaded it
```

### Images done by Artwork Inventory

[Discord](https://discord.gg/Z2awpnXKdw) -- Use code ProjectX for 10% off!

### Should be obtained from outside of the robbery for progress

- cashexchange2key

### Items required from a shop/black market

- x_device
- x_circuittester
- bag

### The rest of the items are obtained within the robbery

-- For qb-inventory:

```lua
  ['x_device']          = {['name'] = 'x_device',           ['label'] = 'X Device',    ['weight'] = 50,   ['type'] = 'item',         ['image'] = 'x_device.png',        ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = '?????????'},
  ['bag']                  = {['name'] = 'bag',                   ['label'] = 'Bag',                ['weight'] = 400,   ['type'] = 'item',         ['image'] = 'bag.png',                ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Duffel bag'},
  ['cashexchange2key']                  = {['name'] = 'cashexchange2key',                   ['label'] = 'Cash Exchange 2 Key',                ['weight'] = 400,   ['type'] = 'item',         ['image'] = 'cashexchange2key.png',                ['unique'] = true,       ['useable'] = false,    ['shouldClose'] = false,    ['combinable'] = nil,   ['description'] = 'Cash Exchange 2 Key'},
  ['x_device_pin']            = {['name'] = 'x_device_pin',               ['label'] = 'Decrypted USB',          ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_device.png',                 ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
  ['x_circuittester']        = {['name'] = 'x_circuittester',       ['label'] = 'X Circuit Tester',      ['weight'] = 200,   ['type'] = 'item',         ['image'] = 'x_circuittester.png',       ['unique'] = false,      ['useable'] = false,    ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = "????"},
```

-- For ox_inventory:

```lua
['x_device'] = {
    label = "X Device",
    weight = 50,
    stack = false,
    close = false,
    description = "?????????",
    client = {
        image = "x_device.png",
    }
},
["x_device_pin"] = {
  label = "Decrypted Device",
  weight = 200,
  stack = false,
  close = false,
  description = "",
  client = {
   image = "x_device.png",
  }
},
['bag'] = {
    label = "Bag",
    weight = 400,
    stack = false,
    close = false,
    description = "Duffel bag",
    client = {
        image = "bag.png",
    }
},
['cashexchange2key'] = {
    label = "Cash Exchange 2 Key",
    weight = 400,
    stack = false,
    close = false,
    description = "Cash Exchange 2 Key",
    client = {
        image = "cashexchange2key.png",
    }
},
["x_circuittester"] = {
  label = "X Circuit Tester",
  weight = 125,
  stack = false,
  close = false,
  description = "?????????",
  client = {
   image = "x_circuittester.png",
  }
 },
```
