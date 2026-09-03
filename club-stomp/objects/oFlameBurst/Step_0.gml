event_inherited();


if (oGlobalData.frameCounter % 4 == 0)
{
	instance_create_layer(x, y, "PlayerThings", oFlameBullet, {spread : spread, angle : angle, vectVelocity : vectVelocity, tag : tag, damage: damage});
}