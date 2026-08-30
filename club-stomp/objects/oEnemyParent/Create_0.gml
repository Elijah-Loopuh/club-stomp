event_inherited();
id.depth = 800;
push = function(vectInput) //pushes velocity with the input vector, useful for recoil or bullet push
{
	vectVelocity = oGlobalData.vectSum(vectVelocity, vectInput);
}