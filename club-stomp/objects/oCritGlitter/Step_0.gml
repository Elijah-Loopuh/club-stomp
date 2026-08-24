
if (oGlobalData.frameCounter % 6 == 0) 
{
	vectPos = oGlobalData.vectScramble(oLegs.vectPos, 1000);
	image_alpha = irandom(1);
	x = vectPos[0];
	y = vectPos[1];
}

