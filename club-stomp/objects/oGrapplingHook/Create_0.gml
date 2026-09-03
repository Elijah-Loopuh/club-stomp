
chainSpacing = 512;

setupBullet = function()
{
	image_angle = angle; //face aimed angle
	id.depth = 475;
	image_angle += random_range(-spread, spread); //spread
	vectVelocity = oGlobalData.vectRotate(vectVelocity, -image_angle); //setup vector for direction
	//vectVelocity = oGlobalData.vectSum(vectVelocity, oLegs.vectVelocity); //add player velocity to bullet velocity
}

setupBullet();
//common substep collision checker for fast movement
checkCollision = function(substeps) //use more substeps for faster projectiles
{
	for (var i = 0; i <= substeps; i ++)
	{
		if (place_meeting(x + vectVelocity[0]*i/substeps, y + vectVelocity[1]*i/substeps, oGlobalData.collisionList)) //if going to hit a wall
		{
			//snap to target
			x += vectVelocity[0] * i/substeps;
			y += vectVelocity[1] * i/substeps;
			vectVelocity = [0, 0];
			vectPos = [x, y];
			
			//drag player to target
			vectDisplacement = oGlobalData.vectSum(oGlobalData.vectInvert(oLegs.vectPos), vectPos);
			if (oGlobalData.vectLength(vectDisplacement)  < 2048) //stop grappling when too close
			{
				instance_destroy(); 
			}
			
			oLegs.push(oGlobalData.vectClamp(vectDisplacement), 75*8);
		}
		if (place_meeting(x + vectVelocity[0]*i/substeps, y + vectVelocity[1]*i/substeps, oGlobalData.enemyList)) //if hitting enemy
		{		

			
			//drag player to target
			collided = instance_place(x + vectVelocity[0]*i/substeps, y + vectVelocity[1]*i/substeps, oGlobalData.enemyList);
			
			//snap to target
			vectVelocity = [0, 0];
			x = collided.x;
			y = collided.y;
			
			vectDisplacement = oGlobalData.vectSum(oLegs.vectPos, oGlobalData.vectInvert(collided.vectPos));
			if (oGlobalData.vectLength(vectDisplacement) < 512) //stop grappling when too close
			{
				collided.takeDamage(damage);
				oBody.takeDamage(-damage);
				
				instance_destroy(); 
			}
			
			collided.push(oGlobalData.vectClamp(vectDisplacement, 50*8));
		}
	}
}

//will always detect a hit on a grid square with this many steps
nSteps = round(oGlobalData.vectLength(vectVelocity)/512 + 0.5);