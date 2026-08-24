//common substep collision checker for fast movement
checkCollision = function(substeps) //use more substeps for faster projectiles
{
	for (var i = 0; i <= substeps; i ++)
	{
		if (place_meeting(x + vectVelocity[0]*i/substeps, y + vectVelocity[1]*i/substeps, oGlobalData.collisionList)) //if going to hit a wall
		{
			instance_destroy(); //destroy if you hit a wall
		}
		if (place_meeting(x + vectVelocity[0]*i/substeps, y + vectVelocity[1]*i/substeps, oGlobalData.enemyList) && tag == "friendly") //if hitting enemy
		{
			collided = instance_place(x + vectVelocity[0]*i/substeps, y + vectVelocity[1]*i/substeps, oGlobalData.enemyList);
			collided.takeDamage(damage); //deal damage
			instance_destroy();
		}
		if (place_meeting(x + vectVelocity[0]*i/substeps, y + vectVelocity[1]*i/substeps, oGlobalData.playerList) && tag == "enemy") //if hitting enemy
		{
			oBody.takeDamage(damage);
			instance_destroy();
		}
	}
}

//will always detect a hit on a grid square with this many steps
nSteps = round(oGlobalData.vectLength(vectVelocity)/512 + 0.5);