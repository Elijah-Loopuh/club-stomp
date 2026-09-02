draw_self();

vectPos = [x, y];
vectToPlayer = oGlobalData.vectSum(oGlobalData.vectInvert(vectPos), oGlobalData.vectSum(oLegs.vectPos, oLegs.vectVelocity));

for (var i = 0; i < oGlobalData.vectLength(vectToPlayer) / chainSpacing; i ++)
{
	draw_sprite_ext(sGrappleChain, 0, x + (oGlobalData.vectClamp(vectToPlayer, chainSpacing)[0]) * i, y + (oGlobalData.vectClamp(vectToPlayer, chainSpacing)[1]) * i, 1, 1, -oGlobalData.vectAngle(vectToPlayer), c_white, 1.0);
}