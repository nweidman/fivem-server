Script is Drag & Drop. Enjoy!

# DEPENDENCIES:
- oxmysql
- ox_lib
- ox_target, qb-target, or qtarget (configure your own in the bridge).

You can make customizations in the bridge/client.lua and bridge/server.lua files.

Be sure to read the comments in the config and set allowed users if Config.UsePerms is true. This will restrict use of the script to those you give access to in the AllowedUsers table of the bridge/server.lua.

# CHANGELOG: 9/15/2025 - v1.3
- Fixed issue with target and light settings not being applied after a server restart or if a prop is 
placed and the other players are out of the culling radius.
- Added server/webhook.lua. Be sure to add your discord webhook url, or leave as '' to disable.

# CHANGELOG: 8/17/2025 - v1.2
- Added auto database saving and removal of light settings for persistent light settings.
- Optimized client and server code and fixed a race condition with the propId and netId.


# CHANGELOG: 8/17/2025 - v1.1
- Fixed Radius, Inner and Outer Cone for Spot Light Settings.
- Moved the default light settings to the config.lua.