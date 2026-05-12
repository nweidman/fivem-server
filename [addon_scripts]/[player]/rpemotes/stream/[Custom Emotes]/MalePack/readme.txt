Don't forget to read the readme for the favoriteAnims.xml line. It's necessary to add.

Place this line into FavoriteAnims.xml in your menyooStuff folder.

	<Anim dict="smo@male_model_154" name="m_model_154_clip" />
	<Anim dict="smo@male_model_155" name="m_model_155_clip" />
	<Anim dict="smo@male_model_156" name="m_model_156_clip" />
	<Anim dict="smo@male_selfie_115" name="m_selfie_115_clip" />
	<Anim dict="smo@male_selfie_116" name="m_selfie_116_clip" />
	<Anim dict="smo@male_selfie_117" name="m_selfie_117_clip" />

Install using Jennie's Custom Anims mod. Get it here:
https://www.gta5-mods.com/misc/custom-animations-add-on-customanims

Make sure you follow their guidelines on how to install that mod properly and how to install animations using it.



FOR DPEMOTES USERS ON FIVEM: 

NOTE: FOR PROP PLACEMENT, FOLLOW THIS TUTORIAL:
https://forum.cfx.re/t/how-to-menyoo-to-dpemotes-conversion-streaming-custom-add-on-props/4775018

Place the ycd file into this folder:

resources/dpemotes-master/streams

Then copy this line into your AnimationList.lua


["mmodel154"] = {"smo@male_model_154", "m_model_154_clip", "Male Model Pose 154 (Smos)", AnimationOptions =
{
	EmoteLoop = true,
	EmoteMoving = false,
}},

["mmodel155"] = {"smo@male_model_155", "m_model_155_clip", "Male Model Pose 155 (Smos)", AnimationOptions =
{
	EmoteLoop = true,
	EmoteMoving = false,
}},

["mmodel156"] = {"smo@male_model_156", "m_model_156_clip", "Male Model Pose 156 (Smos)", AnimationOptions =
{
	EmoteLoop = true,
	EmoteMoving = false,
}},

["mselfie115"] = {"smo@male_selfie_115", "m_selfie_115_clip", "Male Selfie Pose 115 (Smos)", AnimationOptions =
{
	EmoteLoop = true,
	EmoteMoving = false,
}},

["mselfie116"] = {"smo@male_selfie_116", "m_selfie_116_clip", "Male Selfie Pose 116 (Smos)", AnimationOptions =
{
	EmoteLoop = true,
	EmoteMoving = false,
}},

["mselfie117"] = {"smo@male_selfie_117", "m_selfie_117_clip", "Male Selfie Pose 117 (Smos)", AnimationOptions =
{
	EmoteLoop = true,
	EmoteMoving = false,
}},