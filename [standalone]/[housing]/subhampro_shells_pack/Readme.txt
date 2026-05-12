# 🎉 Thank you for purchasing the Shell!

> Clean • Tested • Ready-to-use

---

## 🔖 Overview

This package contains the Shell in both **Furnished** and **Unfurnished** versions. Both versions are included at the same cost — use whichever fits your project.

Everything included has been tested for compatibility. Follow the steps below for a smooth install and quick troubleshooting tips.

---

## 🚀 Quick Start

1. Choose the version you want (Furnished or Unfurnished).
2. Place the shell folder into your resource directory.
3. **Important:** Do **not** rename any of the following files — if you rename them the shell will not work:

   * `*.ydr`
   * `*.ycd`
   * `*.ytyp`
   * `*.ytd`
4. Add the shell's `ytyp` entry to your `fxmanifest.lua` (example below).
5. Start the resource in your server configuration.

---

## 🧩 Example — Add `ytyp` to `fxmanifest.lua`

Open your `fxmanifest.lua` file and add the ytyp like this:

```lua
-- fxmanifest.lua (example)

fx_version 'cerulean'

game 'gta5'

-- resource manifest

author 'SubhamPRO'

description 'SubhamPRO Store Modern Shells (Furnished & Unfurnished)'

files {
    'stream/*.ydr',
    'stream/*.ycd',
    'stream/*.ytyp',
    'stream/*.ytd'
}

data_file 'DLC_ITYP_REQUEST' 'stream/<your-shell>.ytyp'

-- replace <your-shell> with the real filename (do NOT rename files)
```

> Tip: Keep your stream folder organized (e.g. `stream/subhampro_shell/`) and reference the correct filename in `data_file`.

---

## ⚠️ Troubleshooting

**Light flickering or water inside the shell:**

* If you experience light flickering and find water inside the shell, remove the house and place it in a different location on the map. This often resolves the issue.

**Shell not appearing or textures missing:**

* Double-check that no files were renamed.
* Ensure all listed files are present in the `stream` folder and referenced in `fxmanifest.lua`.
* Restart the resource and clear cached files on the client if necessary.

---

## 📝 Notes & Best Practices

* Both Furnished and Unfurnished versions are included at the same price — swap between them freely depending on your use case.
* Keep the original filenames intact to avoid breaking internal references.
* Keep a backup of the original folder before making manual edits.

---

## 🔧 Compatibility

* Tested on standard FiveM setups. If you are using a heavily-modded map or custom map resources, test the shell in an isolated environment first.

---

## 💬 Support & Updates

Join our Discord for support, updates, and announcements:

[https://discord.gg/Vzd7eTwN](https://discord.gg/Vzd7eTwN)

We provide support and will post updates there — join the server to stay informed.

---

## 📜 License & Credits

* Author: **SubhamPRO**
* Redistribution or resale without permission is **not allowed**. Contact us via Discord for licensing inquiries.

---

## 🙏 Thank you!

We appreciate your purchase and hope the SubhamPRO Shell makes your project shine. If you want a custom version or additional edits, message us on Discord and we’ll help you out.

---

*SubhamPRO — Clean assets, fast support.*
