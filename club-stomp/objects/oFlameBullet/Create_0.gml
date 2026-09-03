setupBullet = function()
{
	//image_angle = angle; //face aimed angle
	id.depth = 475;
	vectVelocity = oGlobalData.vectScramble(vectVelocity,oGlobalData.vectLength(vectVelocity)/2); //setup vector for direction
}
event_inherited();
setupBullet();

alarm[0] = 60*random_range(1.2, 1.6);

