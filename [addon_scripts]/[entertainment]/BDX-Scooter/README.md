# BDX-Scooter

Scooter - Perform tricks, stunts and extreme sports across Los Santos.

Part of the **BDX-Sport-Hub** collection by Bodhix Studio.

---

## ⚠️ CRITICAL - DEPENDENCY REQUIREMENT

> **BDX-Sport-Hub MUST be started BEFORE this resource!**
>
> This resource depends on `BDX-Sport-Hub` for framework integration, store management, and item registration.
> If `BDX-Sport-Hub` is not started first, **this resource will NOT work**.

### server.cfg - Correct Load Order:
```cfg
ensure BDX-Sport-Hub
ensure BDX-Scooter
```

**IMPORTANT:** Always ensure `BDX-Sport-Hub` appears BEFORE `BDX-Scooter` in your server.cfg to guarantee proper loading order.

---

## 📋 Requirements

- **BDX-Sport-Hub** (required for framework integration and store management)
- QB-Core, ESX, or vRP framework

---

## 🎒 Item Setup

The Scooter item must be added to your inventory system. The inventory image is located at:

```
assets/inventory_images/scooter.png
```

Copy this image to your inventory's image folder and add the item configuration below.

### QB-Core (qb-core/shared/items.lua)

```lua
['scooter'] = {
    ['name'] = 'scooter',
    ['label'] = 'Scooter',
    ['weight'] = 3000,
    ['type'] = 'item',
    ['image'] = 'scooter.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'A scooter for tricks and stunts'
},
```

**Image Location:** Copy `scooter.png` to `qb-inventory/html/images/`

---

### ESX (es_extended or ox_inventory)

#### Standard ESX Inventory

Add to your items database or items configuration:

```sql
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('scooter', 'Scooter', 3000, 0, 1);
```

**Image Location:** Copy `scooter.png` to your inventory resource's image folder

#### ox_inventory (data/items.lua)

```lua
['scooter'] = {
    label = 'Scooter',
    weight = 3000,
    stack = false,
    close = true,
    description = 'A scooter for tricks and stunts'
},
```

**Image Location:** Copy `scooter.png` to `ox_inventory/web/images/`

---

### qs-inventory (qs-inventory/shared/items.lua)

```lua
['scooter'] = {
    ['name'] = 'scooter',
    ['label'] = 'Scooter',
    ['weight'] = 3000,
    ['type'] = 'item',
    ['image'] = 'scooter.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'A scooter for tricks and stunts'
},
```

**Image Location:** Copy `scooter.png` to `qs-inventory/html/images/`

---

### ps-inventory (ps-inventory/shared/items.lua)

```lua
['scooter'] = {
    ['name'] = 'scooter',
    ['label'] = 'Scooter',
    ['weight'] = 3000,
    ['type'] = 'item',
    ['image'] = 'scooter.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'A scooter for tricks and stunts'
},
```

**Image Location:** Copy `scooter.png` to `ps-inventory/html/images/`

---

### Custom Inventory

If using a custom inventory system, create the item with these values:

- **Name:** `scooter`
- **Label:** `Scooter`
- **Weight:** `3000`
- **Type:** `item`
- **Image:** `scooter.png`
- **Unique:** `true`
- **Useable:** `true`
- **Should Close:** `true`
- **Description:** `A scooter for tricks and stunts`

---

## 🎮 Controls

| Action | Key (Keyboard) | Key (Controller) |
|--------|----------------|------------------|
| Pickup Scooter | E | - |
| Ride Scooter | G | - |
| Bar Spin | Left Mouse Button | RT |
| Forward | X | LT |
| Bri Flip | E | DPAD RIGHT |
| Knock | R | B |
| Inward | Q | DPAD LEFT |
| Superman | F | Y |
| Tailwhip | C | Right Stick |
| No Hander | Z | DPAD DOWN |

---

## ⚙️ Configuration (config.lua)

The configuration file is located at `BDX-Scooter/config.lua`.

### General Settings

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `Config.Debug` | boolean | `false` | Enable/disable debug messages in console |
| `Config.Framework` | string | `"esx"` | Your framework: `"qb"`, `"esx"`, `"vrp"`, or `"custom"` |
| `Config.ItemName` | string | `"scooter"` | The item name in your inventory system |
| `Config.Target` | string | `"ox"` | Target system: `"qb"`, `"ox"`, or `"none"` |
| `Config.FrameworkResourceName` | string/nil | `nil` | Custom framework resource name (only if not in default location) |
| `Config.ActiveWhitelist` | boolean | `false` | Enable whitelist system |

### Scooter Physics

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `Config.MaxSpeedKmh` | number | `40` | Maximum speed in km/h |
| `Config.maxJumpHeigh` | number | `5.0` | Maximum jump height |
| `Config.maxFallSurvival` | number | `155.0` | Maximum fall height before taking damage |
| `Config.LoseConnectionDistance` | number | `2.0` | Distance threshold for disconnection |
| `Config.MinimumSkateSpeed` | number | `2.0` | Minimum speed to maintain movement |
| `Config.MinGroundHeight` | number | `1.0` | Minimum ground detection height |
| `Config.minimumSpeed` | number | `1.0` | Minimum km/h to perform a trick |

### Control Keys

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `Config.ConnectPlayer` | number | `113` | Key to ride scooter (G key) |

### Trick Keys

| Option | Default | Key (Keyboard/Controller) |
|--------|---------|---------------------------|
| `Config.BarSpin` | `24` | Left Mouse Button / RT |
| `Config.Forward` | `252` | X / LT |
| `Config.BriFlip` | `51` | E / DPAD RIGHT |
| `Config.Knock` | `80` | R / B |
| `Config.Inward` | `52` | Q / DPAD LEFT |
| `Config.Superman` | `23` | F / Y |
| `Config.Tailwhip` | `79` | C / Right Stick |
| `Config.NoHander` | `20` | Z / DPAD DOWN |

### Language Customization

```lua
Config.Language = {
    Info = {
        ['controls'] = 'Press E to Pickup | Press G to Ride',
    },
    Scooter = {
        ['target'] = 'Save Scooter.',
        ['text'] = '[E] Save Scooter.'
    },
}
```

---

## 🛒 Store Integration

Scooters can be purchased from any Sport Hub store location. Configure store locations in:

```
BDX-Sport-Hub/config.lua
```

Add `"scooter"` to the `availableCategories` array for any store location where you want scooters to be sold.

---

## 🎨 Customization

Scooters come with **multiple designs**. Players can customize their scooter at the Sport Hub store.

Design pricing is configured in:
```
BDX-Scooter/config.lua
```

---

## 📞 Support

For support and updates, visit:
- **Discord:** https://discord.com/invite/PjN7AWqkpF
- **Tebex:** https://bodhix.tebex.io

---

## 📝 Notes

- **Framework Registration:** Item useable registration is automatically handled by BDX-Sport-Hub
- **No Duplicate Registration:** Do NOT register the useable item in this resource, it's handled centrally
- **Sport Hub Required:** This resource requires BDX-Sport-Hub to function properly

---

**Developed by Bodhix Studio**
