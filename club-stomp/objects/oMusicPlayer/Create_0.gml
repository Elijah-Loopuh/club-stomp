/*
	handles music playing from oGlobalData's linked song struct, and handles crit timing
*/

currentTime = 0; //uses delta time to always tick at 120 bpm
critThresh = 0.2; //length of time in seconds that you can crit per beat. centered on beat

id.depth = 16001; //too deep to be drawn