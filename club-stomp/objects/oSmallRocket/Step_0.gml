event_inherited(); //move and collide

doTracking();

for (var i = 0; i < 5; i ++)
{
	instance_create_layer(x, y, "playerThings", oSmokeParticle);
}