/// @description Snap Camera Rotation and Position

//Zoom threshold:	true = Too far OR too close	| false = Safe distance
var _z_t = (camDist < global.camDistance * 1.1 || camDist > global.camDistance * 0.9);

//Camera rotation threshold:	true = Too much rotation	| false = Safe rotation
var _rot_t = (abs(direction - 270) > 2 || abs(camPitch) > 2);

//Camera coordinate difference initial value
var _cam_diff = max(abs(x - camDebugC[X]), abs(y - camDebugC[Y]));

if (!_z_t) {
	if (keyboard_check(ord("W")) || keyboard_check(ord("A")) || keyboard_check(ord("S")) || keyboard_check(ord("D"))) {
		camDebugC[X] = floor(lerp(camDebugC[X], camTweenTo[X], 0.25));
		camDebugC[Y] = floor(lerp(camDebugC[Y], camTweenTo[Y], 0.25));
		
		//snapView = false;
	} else {
		//Reset camera position
		if (_cam_diff < 64) {
			x = floor(lerp(x, camTweenTo[X], 0.25));
			y = floor(lerp(y, camTweenTo[Y], 0.25));
			
			camDebugC[X] = floor(lerp(camDebugC[X], camTweenTo[X], 0.25));
			camDebugC[Y] = floor(lerp(camDebugC[Y], camTweenTo[Y], 0.25));
			
			//Reset camera distance
			if (!_rot_t) {
				distReset = scrollChk;
			}
			
			//Reset camera rotation
			if (!_rot_t && !mouse_check_button(mb_right)) {
				direction = lerp(direction, 270, 0.25);
				camPitch = lerp(camPitch, 0, 0.25);
			}
			
			//snapView = true;
		} else {
			camDebugC[X] = floor(lerp(camDebugC[X], camTweenTo[X], 0.25));
			camDebugC[Y] = floor(lerp(camDebugC[Y], camTweenTo[Y], 0.25));
			
			//snapView = false;
		}
	}
}
