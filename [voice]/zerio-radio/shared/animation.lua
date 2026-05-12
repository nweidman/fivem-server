Shared = Shared or {}

-- A list of bones can be found here: https://wiki.rage.mp/index.php?title=Bones
-- Further information about this can be found here: https://docs.zerio-scripts.com/radio/faq#animations--props

Shared.Animation = Shared.Animation or {
	OpenProp = {
		Model = GetHashKey("zerio_radio"),
		Bone = 28422,
		Offset = vector3(0.0, 0.0, 0.0),
		Rotation = vector3(90.0, 90.0, 0.0),
	},

	TalkProp = {
		Model = GetHashKey('prop_cs_hand_radio'),
		Bone = 28422,
		Offset = vector3(0.05, 0.0, -0.025),
		Rotation = vector3(-90.0, 90.0, 40.0),
	},

	OpenAnimation = {
		Normal = {
			Dictionary = "cellphone@",
			Name = "cellphone_text_in"
		},
		InCar = {
			Dictionary = "cellphone@in_car@ds",
			Name = "cellphone_text_in"
		}
	},

	-- If you're using pma-voice, make sure you've disabled pma-voice's default animation
	TalkAnimation = {
		Name = "holding_radio_clip",
		Dictionary = "anim@male@holding_radio"
	}
}
