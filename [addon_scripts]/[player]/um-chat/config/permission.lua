--[[
    These perms are only for um-chat and have ``! nothing to do with your perms in server.cfg``
    You can only think of it as tags that will appear next to you in the general chat
    Color hex: https://tailwindcss.com/docs/customizing-colors
]]

return {

    identifier = 'discord', -- steam or license or discord

    permissions = {
        ['admin'] = {
            prefix = 'Admin',
            color = "#a671fe",
            permissions = {
                '1025962135014092810',
            }
        },
        ['staff'] = {
            prefix = 'Staff',
            color = "#a671fe",
            permissions = {
                -- 'discordid',
            }
        },
        ['Owner'] = {
            prefix = 'Owner',
            color = "#a671fe",
            permissions = {
                '210242805581348876',
            }
        },
        ['streamer'] = {
            prefix = 'Streamer',
            color = "#a671fe",
            permissions = {
                -- 'discordid',
            }
        },
    }
}
