currentTime += delta_time / 1000000;

if (currentTime % (1/oGlobalData.currentHerz) < .15)
{
	oGlobalData.isCrit = true;
}
else
{
	oGlobalData.isCrit = false;
}

