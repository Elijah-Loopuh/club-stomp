event_inherited();

//vectVelocity = oGlobalData.vectRotate(vectVelocity, random_range(-spread, spread));

vectVelocity = oGlobalData.vectSum(vectVelocity, oGlobalData.vectClamp(vectVelocity, -2))

//image_angle = -oGlobalData.vectAngle(vectVelocity);