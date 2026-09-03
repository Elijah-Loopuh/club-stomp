event_inherited();

//physical movement variables
regularGrip = 0.75*8; //regular grip
regularSpeedCap = 15*8;
dragStatic = 2*8; //drag when no buttons held
dragDynamic = 0.0; //drag when movement buttons are held
vectPos = [x, y];

//fighting variables
hp = 100;

//ai movement control variables
standoff = 9*512; //distance the cycler will hold from player
tolerance = 2*512; //distance from standoff where the enemy won't correct it's distance
twitch = 25; //angle offset the enemy will use when getting back to standoff
rotationDirection = 1; //can be set to +1 or -1 to control direction of rotation

//ai seeing variables
target = oBody;
range = 15*512; //sight range of 10 tiles
vectPosTarget = vectPos; //point Ai will move & shoot towards. pre filled to remove bugs

//variable assigning
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
	if (canSee(target, range)) //update target position only if there is line of sight to player
	{
		vectPosTarget = target.vectPosTarget; //fill the target position with the body's apparent position
	}
}

updateVectorMoveInput = function() //ai movement coding
{
	vectMoveInput = oGlobalData.vectSum(oGlobalData.vectInvert(vectPos), vectPosTarget); //create vector pointing from enemy to target
	
	vectMoveInput = oGlobalData.vectRotate(vectMoveInput, 75 * rotationDirection); //rotate vector to circle player
	
	if (oGlobalData.vectLength(vectMoveInput) > standoff + tolerance)
	{
		vectMoveInput = oGlobalData.vectRotate(vectMoveInput, (0 - twitch * rotationDirection)); //roate vector to close in on player
	}
	if (oGlobalData.vectLength(vectMoveInput) < standoff - tolerance)
	{
		vectMoveInput = oGlobalData.vectRotate(vectMoveInput, (0 + twitch * rotationDirection)); //roate vector to back off from player
	}
	
	vectMoveInput = oGlobalData.vectClamp(vectMoveInput);
	
	if (checkCollision() != 0) //reverse direction when hitting a wall
	{
		rotationDirection *= -1;
	}
}