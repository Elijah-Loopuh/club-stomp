event_inherited();

vectVelocity = oGlobalData.vectRotate(vectVelocity, random_range(-spread, spread));

image_angle = -oGlobalData.vectAngle(vectVelocity);



if (alarm[0] % 10 == 0)
{
	instance_create_layer(x, y, "PlayerThings", oSmokeParticle);
}