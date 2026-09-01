currentTime += delta_time / 1000000;

if (currentTime % (1/oGlobalData.currentHerz) < critThresh/2 || currentTime % (1/oGlobalData.currentHerz) > 1/oGlobalData.currentHerz - critThresh/2)
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
	//show_debug_message("BEAT!!!");
}

//show_debug_message(string(currentTime % (1/oGlobalData.currentHerz)) + "       " + string(oGlobalData.isCrit));