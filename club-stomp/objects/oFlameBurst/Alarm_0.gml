for(var i = 0; i < 3; i ++)
{
	instance_create_layer(x, y, "PlayerThings", oFlameBullet, {spread : spread, angle : angle, vectVelocity : vectVelocity, tag : tag, damage: damage});
}

instance_destroy();