currentTime += delta_time / 1000000;

if (currentTime % (1/oGlobalData.currentHerz) < .15)
{
	oGlobalData.isCrit = true;
}
else
{
	oGlobalData.isCrit = false;
}

if (currentTime % (1/oGlobalData.currentHerz) < 0.02)
{
	audio_play_sound(mClick, 100, false);
}