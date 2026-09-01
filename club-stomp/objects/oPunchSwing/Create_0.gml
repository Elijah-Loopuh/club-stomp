
hasHit = [];

checkCollision = function(substeps) //use more substeps for faster projectiles
{
	for (var i = 0; i <= substeps; i ++)
	{
		if (place_meeting(x + vectVelocity[0]*i/substeps, y + vectVelocity[1]*i/substeps, oGlobalData.enemyList) && tag == "friendly") //if hitting enemy
		{
			collided = instance_place(x + vectVelocity[0]*i/substeps, y + vectVelocity[1]*i/substeps, oGlobalData.enemyList);
			if (!array_contains(hasHit, collided)) //only allow each enemy to be hit once
			{
				collided.push(vectVelocity);
				collided.takeDamage(damage); //deal damage
				hasHit[array_length(hasHit)] = collided; //add enemy to list of already hit enemies
			}
		}
		if (place_meeting(x + vectVelocity[0]*i/substeps, y + vectVelocity[1]*i/substeps, oGlobalData.playerList) && tag == "enemy") //if hitting enemy
		{
			oBody.takeDamage(damage);
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

alarm[0] = 60*0.25; //duration the punch exists for 