if (numGrenades > 0)
{
	instance_create_layer(oBody.vectPosTarget[0], oBody.vectPosTarget[1], "instances", oFlakShell, {spread : 180, angle : 0, vectVelocity : vectVelocity, tag : tag, damage : damage});
	numGrenades -= 1;
	alarm[0] = delay;
}
else
{
	instance_destroy();
}