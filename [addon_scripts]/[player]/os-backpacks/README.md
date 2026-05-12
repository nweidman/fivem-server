# Hello! Thank you for buying our script!
# This script was developed by the AceStudios Team
# If you need any help please contact us through our main discord (https://discord.gg/Hrgny6jNSw)


# Installation: 

- Images can be found in "ace_advanced_multipacks/[Inventory-images]" add these to your inventory images, which commonly is found in "ox_inventory\web\images"\
- You need to copy the contents of "inv-data.txt" into your inventory items data, which commonly is found in "ox_inventory\data\items.lua"
- (Optional) If you want to add the packs to a shop You need to copy the contents of "shop-data.txt" into your inventory 1 of your shops data, which commonly is found in "ox_inventory\data\shops.lua"

- This script requires Ox-Inventory (https://overextended.dev/ox_inventory)
- Because of the how ox-inv works our script needs to be started after the ox_lib resource but before ox_inventory

start ox_lib
start ace_advanced_multipacks
start ox_inventory



# Adding Your Own Backpacks (Our advanced multipacks has the option to generate your items.lua automaticaly) ['ExportItemList']
- 1st Add your new bag/s to config.lua

## Template:
    ['backpack'] = {
        label = 'Backpack Name', -- The name of the backpack.
        slots = 10, -- The number of slots the backpack has. (5 slots = 1 row)
        weight = 4000, -- The weight of the backpack.
        component = { componentid = 5, drawable = 1, texture = 0 } -- The component data for the backpack.
    },
- 2nd step is to make sure 'ExportItemList' is set to true in 'ace_advanced_multipacks/config.lua'

- 3rd step is to restart the resource

- 4th step check your server console for '✅ Items.lua data exported'

- 5th step copy the contents of "ace_advanced_multipacks/inv-data.txt" into "ox_inventory/data/items.lua"

- 6th restart your server and enjoy!




# Other Info

-  If the bag model doesnt show up on your characters bag try running the command /fixbag in game