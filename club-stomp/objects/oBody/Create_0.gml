id.depth = 500;
sprite_index = sprite;

vectPos = [0, 0]; //tracks real position and velocity, used to do animations and such
vectVelocity = [0, 0];

vectPosTarget = [0, 0]; //used by enemies to target the player
vectVelocityTarget = [0, 0];

hp = hpMax;
//function definitions

	faceToMouse = function() //points to mouse
	{
		vectMouse = [mouse_x, mouse_y];
		image_angle = - oGlobalData.vectAngle(oGlobalData.vectSum(oGlobalData.vectInvert(vectPos),vectMouse));
	}
		
	updatePosition = function()
	{
		x = oLegs.x;
		y = oLegs.y;

		vectPosTarget = oLegs.vectPos;
		vectVelocityTarget = oLegs.vectVelocity;
		
		vectPos = [x, y]; //used to point at target
	}
	
	
	if (gimmick == "tough")
	{
		takeDamage = function(ammount)
		{
			if (irandom(9) != 0) //1 in 10 chance (0-9) to not take damage when hit
			{
				hp -= ammount;
				if (hp <= 0)
				{
					show_message("You Are Dead :)");
				}
			}
			else
			{
				show_debug_message("PARRIED!");
			}
		}
	}
	else
	{
		takeDamage = function(ammount)
		{
			hp -= ammount;
			if (hp <= 0)
			{
				show_message("You Are Dead :)");
			}
		}
	}
	
	if (gimmick == "punch")
	{
		gunData = 
		{
				fireDelayMaster : 0.5 * 60, //frames between shots = 1 / (RPM / 60)
				projectile : oPunchSwing, //single bullet projectile
				projectileOffest : [0, 0], //pixel offset from sprite origin
				spread : 0, //spread in degrees
				sprite : sNullSprite, 
				mountOffset : [0, 0], //filled in when gun is assigned to a slot. placeholder
				vectVelocity : [100, 0], //projectile velocity
				tag : "friendly", //used by bullets to decide who to hurt
				damage : 8, 
				critMultiplier : 2, 
				fireKey : mb_right, 
		}
		instance_create_layer(x, y, "Instances", oGun, gunData)
	}