# This file includes update instructions and changelogs for new versions

**Current version 1.2.0**

## Update from 1.1.0 to 1.2.0

### Changes

- Added configurable sync time to fix mismatched crash values

### How to update

- Replace the source/ folder
- Add to Config.Game:
```lua
    -- Interval in seconds for how frequently the frontend should sync with the backend.
    -- Syncing is only necessary if the crash values at the end do not match the values in the game.
    -- If there is a mismatch, set a sync interval. Keep the interval as large as possible to minimize performance impact.
    -- Note: If your server performance is already optimized, syncing should not be needed.
    -- Ensure server performance is stable before relying on sync, as it can potentially degrade performance further.
    syncEachSeconds = 0,
```


## Update from 1.0 to 1.1.0

### Changes

- Added cooldowns to prevent spaming (spaming can result in high ms)

### How to update

- Replace the source/ folder