if (frameCounter < power(2, 32)) //count up frames with overflow protection
{
	frameCounter += 1;
}
else
{
	frameCounter = 0;
}


if keyboard_check( ord("T") )
{
	for (var i = 0; i < 3000; i ++)
	{
		instance_create_layer(x, y, "Instances", oCritGlitter);
	}
}