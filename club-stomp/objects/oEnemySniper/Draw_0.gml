draw_self();

if (attackCooldown > attackWarning && canSee(target, range)) //draw laser if can see target, turn off if about to shoot bullet
{
	vectToTarget = oGlobalData.vectSum(oGlobalData.vectInvert(vectPos), vectPosTarget);
	for (var i = 0; i < oGlobalData.vectLength(vectToTarget) / laserPointerSpacing; i ++)
	{
		draw_sprite_ext(sGrappleChain, 0, x + (oGlobalData.vectClamp(vectToTarget, laserPointerSpacing)[0]) * i, y + (oGlobalData.vectClamp(vectToTarget, laserPointerSpacing)[1]) * i, 1, 1, -oGlobalData.vectAngle(vectToTarget), c_white, 1.0);
	}
}