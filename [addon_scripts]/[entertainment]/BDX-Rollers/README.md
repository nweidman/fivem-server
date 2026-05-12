# BDX-Rollers

Roller Skates - Perform tricks, stunts and cruise across Los Santos.

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
ensure BDX-Rollers
```

**IMPORTANT:** Always ensure `BDX-Sport-Hub` appears BEFORE `BDX-Rollers` in your server.cfg to guarantee proper loading order.

---

## 📋 Requirements

- **BDX-Sport-Hub** (required for framework integration and store management)
- QB-Core, ESX, or vRP framework

---

## 🎒 Item Setup

The Rollers item must be added to your inventory system. The inventory image is located at:

```
assets/inventory_images/rollers.png
```

Copy this image to your inventory's image folder and add the item configuration below.

### QB-Core (qb-core/shared/items.lua)

```lua
['rollers'] = {
    ['name'] = 'rollers',
    ['label'] = 'Rollers',
    ['weight'] = 3000,
    ['type'] = 'item',
    ['image'] = 'rollers.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'Roller skates for tricks and stunts'
},
```

**Image Location:** Copy `rollers.png` to `qb-inventory/html/images/`

---

### ESX (es_extended or ox_inventory)

#### Standard ESX Inventory

Add to your items database or items configuration:

```sql
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('rollers', 'Rollers', 3000, 0, 1);
```

**Image Location:** Copy `rollers.png` to your inventory resource's image folder

#### ox_inventory (data/items.lua)

```lua
['rollers'] = {
    label = 'Rollers',
    weight = 3000,
    stack = false,
    close = true,
    description = 'Roller skates for tricks and stunts'
},
```

**Image Location:** Copy `rollers.png` to `ox_inventory/web/images/`

---

### qs-inventory (qs-inventory/shared/items.lua)

```lua
['rollers'] = {
    ['name'] = 'rollers',
    ['label'] = 'Rollers',
    ['weight'] = 3000,
    ['type'] = 'item',
    ['image'] = 'rollers.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'Roller skates for tricks and stunts'
},
```

**Image Location:** Copy `rollers.png` to `qs-inventory/html/images/`

---

### ps-inventory (ps-inventory/shared/items.lua)

```lua
['rollers'] = {
    ['name'] = 'rollers',
    ['label'] = 'Rollers',
    ['weight'] = 3000,
    ['type'] = 'item',
    ['image'] = 'rollers.png',
    ['unique'] = true,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'Roller skates for tricks and stunts'
},
```

**Image Location:** Copy `rollers.png` to `ps-inventory/html/images/`

---

### Custom Inventory

If using a custom inventory system, create the item with these values:

- **Name:** `rollers`
- **Label:** `Rollers`
- **Weight:** `3000`
- **Type:** `item`
- **Image:** `rollers.png`
- **Unique:** `true`
- **Useable:** `true`
- **Should Close:** `true`
- **Description:** `Roller skates for tricks and stunts`

---

## 🎮 Controls

| Action | Key (Keyboard) | Key (Controller) |
|--------|----------------|------------------|
| Pickup Rollers | E | - |
| Ride Rollers | G | - |
| Stick Trick | X | LT |
| Cross Trick | R | B |
| Butterfly Trick | Q | DPAD LEFT |
| Rest Trick | F | Y |

---

## ⚙️ Configuration (config.lua)

The configuration file is located at `BDX-Rollers/config.lua`.

### General Settings

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `Config.Debug` | boolean | `false` | Enable/disable debug messages in console |
| `Config.Framework` | string | `"esx"` | Your framework: `"qb"`, `"esx"`, `"vrp"`, or `"custom"` |
| `Config.ItemName` | string | `"rollers"` | The item name in your inventory system |
| `Config.Target` | string | `"ox"` | Target system: `"qb"`, `"ox"`, or `"none"` |
| `Config.FrameworkResourceName` | string/nil | `nil` | Custom framework resource name (only if not in default location) |
| `Config.ActiveWhitelist` | boolean | `false` | Enable whitelist system (see Whitelist.lua) |

### Roller Physics

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `Config.MaxSpeedKmh` | number | `40` | Maximum speed in km/h |
| `Config.maxJumpHeigh` | number | `5.0` | Maximum jump height |
| `Config.maxFallSurvival` | number | `155.0` | Maximum fall height before taking damage |
| `Config.LoseConnectionDistance` | number | `2.0` | Distance threshold for disconnection |
| `Config.MinimumSkateSpeed` | number | `2.0` | Minimum speed to maintain skating |
| `Config.MinGroundHeight` | number | `1.0` | Minimum ground detection height |
| `Config.minimumSpeed` | number | `1.0` | Minimum km/h to perform a trick |

### Control Keys

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `Config.ConnectPlayer` | number | `113` | Key to ride rollers (G key) |

### Trick Keys

| Option | Default | Key (Keyboard/Controller) |
|--------|---------|---------------------------|
| `Config.Stick` | `252` | X / LT |
| `Config.Cross` | `80` | R / B |
| `Config.Butterfly` | `52` | Q / DPAD LEFT |
| `Config.Rest` | `23` | F / Y |

### Language Customization

```lua
Config.Language = {
    Info = {
        ['controls'] = 'Press E to Pickup | Press G to Ride',
    },
    Roller = {
        ['target'] = 'Save Rollers.',
        ['text'] = '[E] Save Rollers.'
    },
}
```

---

## 🛒 Store Integration

Rollers can be purchased from any Sport Hub store location. Configure store locations in:

```
BDX-Sport-Hub/config.lua
```

Add `"rollers"` to the `availableCategories` array for any store location where you want rollers to be sold.

---

## 🎨 Customization

Rollers come with **multiple designs**. Players can customize their rollers at the Sport Hub store.

Design pricing is configured in:
```
BDX-Rollers/config.lua
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
