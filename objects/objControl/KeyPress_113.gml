/// @description **DEBUG** - Toggle Debug Mode 

global.DEBUGMODE = !global.DEBUGMODE;

with (objCamera) {
	camDebugO[X] = camTweenTo[X];
	camDebugO[Y] = camTweenTo[Y];
	camDebugC[X] = camTweenTo[X];
	camDebugC[Y] = camTweenTo[Y];
	direction	 = 270;
	camPitch	 = 0;
	camDist		 = global.camDistance;
}
