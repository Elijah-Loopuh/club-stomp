
event_inherited();

//enemy movement stats
regularGrip = 1.0*8; //regular grip
regularSpeedCap = 30*8;
dragStatic = 0.5*8; //drag when no buttons held
dragDynamic = 0; //drag when movement buttons are held
vectPos = [x, y];

//enemy fighting stats
hp = 100;
shotgunData = //weapon stats for the enemy
{
	spread : 20,
	angle : 0, 
	vectVelocity : [15*8, 0], 
	tag : "enemy", 
	damage: 4
}

//ai control variables
standoff = 2*512; //distance the cycler will hold from player
tolerance = 4*512; //distance from standoff where the enemy won't correct it's distance
attackCooldownMaster = 60*3; //frames between attacks
attackCooldown = attackCooldownMaster;

//ai seeing variables
target = oBody;
range = 20*512; //sight range of 10 tiles
vectPosTarget = vectPos; //point Ai will move & shoot towards. pre filled to remove bugs

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
	if (canSee(target, range)) //only update target location if it can see the player
	{
		vectPosTarget = target.vectPosTarget;
	}
}

updateVectorMoveInput = function() //ai control
{
	vectMoveInput = oGlobalData.vectSum(oGlobalData.vectInvert(vectPos), vectPosTarget); //create vector pointing from enemy to target
	
	
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

doFireControl = function() //handles enemy attacks. shoots player when at a very close range
{
	if (attackCooldown > 0)
	{
		attackCooldown -= 1;
	}
	else if (canSee(target, standoff + tolerance)) //only shoot if player is visible
	{
		shotgunData.angle = -oGlobalData.vectAngle(oGlobalData.vectSum(oGlobalData.vectInvert(vectPos), vectPosTarget)); //vect pointing to player
		attackCooldown = attackCooldownMaster;
		instance_create_layer(x, y, "Instances", oShotGunShell, shotgunData); //shoots two shells
		instance_create_layer(x, y, "Instances", oShotGunShell, shotgunData);
	}
}