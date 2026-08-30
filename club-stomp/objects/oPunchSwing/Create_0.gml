checkCollision = function(substeps) //use more substeps for faster projectiles
{
	for (var i = 0; i <= substeps; i ++)
	{
		if (place_meeting(x + vectVelocity[0]*i/substeps, y + vectVelocity[1]*i/substeps, oGlobalData.enemyList) && tag == "friendly") //if hitting enemy
		{
			collided = instance_place(x + vectVelocity[0]*i/substeps, y + vectVelocity[1]*i/substeps, oGlobalData.enemyList);
			collided.push(vectVelocity);
			collided.takeDamage(damage); //deal damage
			mask_index = sNullSprite;
		}
		if (place_meeting(x + vectVelocity[0]*i/substeps, y + vectVelocity[1]*i/substeps, oGlobalData.playerList) && tag == "enemy") //if hitting enemy
		{
			oBody.takeDamage(damage);
			mask_index = sNullSprite;
		}
	}
}

nSteps = 1;

setupBullet = function()
{
	image_angle = angle; //face aimed angle
	id.depth = 475;
	image_angle += random_range(-spread, spread); //spread
	vectVelocity = oGlobalData.vectRotate(vectVelocity, -image_angle); //setup vector for direction
	//vectVelocity = oGlobalData.vectSum(vectVelocity, oLegs.vectVelocity); //add player velocity to bullet velocity
}

setupBullet();

alarm[0] = 60*0.25;

show_debug_message(vectVelocity);