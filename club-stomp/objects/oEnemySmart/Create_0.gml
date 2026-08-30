// Inherit the parent event
event_inherited();

shotgunData = //weapon stats for the enemy
{
	spread : 10,
	angle : 0, 
	vectVelocity : [25*8, 0], 
	tag : "enemy", 
	damage: 2
}


//enemy movement stats
regularGrip = 0.5*8; //regular grip
regularSpeedCap = 20*8;
dragStatic = 10*8; //drag when no buttons held
dragDynamic = 0.0; //drag when movement buttons are held
hp = 100;

//ai control variables
standoff = 1000*8; //distance the cycler will hold from player
tolerance = 100*8; //distance from standoff where the enemy won't correct it's distance
attackCooldownMaster = 60*1.5; //frames between attacks
attackCooldown = attackCooldownMaster;

//utility variable defaults
grip = regularGrip; //rate of change of vectVelocity axis under normal conditions
speedCap = regularSpeedCap; //tracks current speed cap
drag = dragStatic; //fraction d/1 of speed lost every 
animationSpeed = 1/45; //multiplier from vectVelocity scale to animation fps

updateVars = function() //updates variables
{
	speedCap = regularSpeedCap;
	underSpeed = oGlobalData.vectLength(vectVelocity) <= speedCap; //tracks if player has control of the mech
	keyMove = (oGlobalData.vectLength(vectMoveInput) > 0);
	vectPos = [x, y];
}

updateVectorMoveInput = function() //ai control
{
	vectMoveInput = oGlobalData.vectSum(oGlobalData.vectInvert(vectPos), oBody.vectPosTarget); //create vector pointing from enemy to target
	
	
	if (oGlobalData.vectLength(vectMoveInput) > standoff + tolerance) //if too far, approach
	{
		//do nothing, vector is already set up to approach
	}
	if (oGlobalData.vectLength(vectMoveInput) < standoff - tolerance)
	{
		vectMoveInput = oGlobalData.vectScale(vectMoveInput, -1); //if too close, back off from player.
	}
	if (abs(oGlobalData.vectLength(vectMoveInput) - standoff) < tolerance) //if in tolerance range of standoff distance
	{
		vectMoveInput = oGlobalData.vectZero;
	}
	
	vectMoveInput = oGlobalData.vectClamp(vectMoveInput);
}

doFireControl = function() //handles enemy attacks
{
	if (attackCooldown > 0)
	{
		attackCooldown -= 1;
	}
	else
	{
		shotgunData.angle = -oGlobalData.vectAngle(oGlobalData.vectSum(oGlobalData.vectInvert(vectPos), oBody.vectPosTarget)); //vect pointing to player
		attackCooldown = attackCooldownMaster;
		instance_create_layer(x, y, "Instances", oShotGunShell, shotgunData)
	}
}