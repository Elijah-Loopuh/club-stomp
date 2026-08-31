for (var j = 0; j < 12; j ++) //spawn a bunch of flak
{
	instance_create_layer(x, y, "PlayerThings", oMiddleBullet, {spread : 180, angle : 0, vectVelocity : [20*8, 0], tag : tag, damage : damage})
}

instance_destroy(id);

