cfg = {}

cfg.debug = false -- debug version to check some stuff [prints]
cfg.framework = "qbox" --esx_legacy,esx,qbcore,qbox,ndcore,vrp,vrpex,nunoradioman,standalone
cfg.interaction = "oxtarget" --qbtarget,qtarget,oxtarget,interact,oxlib,default
cfg.dispatch = "cd_dispatch" --default,ps_dispatch,cd_dispatch,core_dispatch,qs_dispatch,outlawalert

cfg.police = {
	groups = {"cop","police"}, -- police groups
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
    selected = "oxlib", -- esx_legacy,esx,qbcore,qbox,oxlib,gtav
    notifications = {
        noitem = "You dont have the item needed for this action.", -- message
        nopolice = "Not enough cops online.", -- message
        globalcooldown = "You cannot start the robbery.", -- message
    },
}