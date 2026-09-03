setupBullet = function()
{
	image_angle = angle; //face aimed angle
	id.depth = 475;
	image_angle += random_range(-spread, spread); //spread
	vectVelocity = oGlobalData.vectRotate(vectVelocity, -image_angle); //setup vector for direction
	//vectVelocity = oGlobalData.vectSum(vectVelocity, oLegs.vectVelocity); //add player velocity to bullet velocity
}

event_inherited();

setupBullet();

alarm[0] = 60*1.5;

for(var i = 0; i < 3; i ++)
{
	instance_create_layer(x, y, "PlayerThings", oFlameBullet, {spread : spread, angle : angle, vectVelocity : vectVelocity, tag : tag, damage: damage});
}