cfg = {}

cfg.debug = false -- debug version to check some stuff [prints]
cfg.framework = "qbcore" --esx_legacy,esx,qbcore,qbox,ndcore,vrp,vrpex,nunoradioman,standalone
cfg.interaction = "qbtarget" --qbtarget,qtarget,oxtarget,interact,oxlib,gtav
cfg.dispatch = "cd_dispatch" --default,ps_dispatch,cd_dispatch,core_dispatch,qs_dispatch,outlawalert

cfg.police = {
	groups = {"police","sheriff"}, -- police groups
	amount = 0, -- police amount
}
cfg.global = {
    status = false, -- If true this robbery will use a global cooldown shared between all robberies
    cooldown = 120, -- Time added to the global cooldown | Time is in minutes
}
cfg.timers = {
	reset_timer = 240, -- This Timer is in Minutes
	npc_timer = 240*60 -- This Timer is in Seconds
}
cfg.notification = {
    selected = "gtav", -- esx_legacy,esx,qbcore,qbox,oxlib,gtav
    notifications = {
        noitem = "You dont have the item needed for this action.", -- message
        nopolice = "Not enough cops online.", -- message
        globalcooldown = "This is on cooldown.", -- message
    },
}