/// @description Adjust 3D Camera Movement

//Keyboard variables shorthand
var _u	 = mouse_wheel_up() * 4,
	_l	 = keyboard_check(ord("A")),
	_d	 = mouse_wheel_down() * 4,
	_r	 = keyboard_check(ord("D")),
	_run = keyboard_check(vk_shift),
	_y_u = keyboard_check(ord("W")),
	_y_d = keyboard_check(ord("S"));

if (global.DEBUGMODE) {
	//Start moving camera when pressing mouse button...
	if (mouse_check_button_pressed(mb_right)) {
		//Camera angle source
		camFrom = [display_mouse_get_x(), display_mouse_get_y()];
		camMove = true;
	}
	
	//...continue to update camera angles while holding down...
	if (mouse_check_button(mb_right)) {
		//Camera angle destination
		camTo = [display_mouse_get_x(), display_mouse_get_y()];
		
		//Use mouse to look around
		direction -= (camTo[X] - camFrom[X]) / 10;
		camPitch = clamp(camPitch + (camTo[Y] - camFrom[Y]) / 10, -90, 90);
		
		//Lock mouse to position
		display_mouse_set(camFrom[X], camFrom[Y]);
		
		//Invisible cursor
		window_set_cursor(cr_none);
	}
	
	//...and stop when mouse button is released
	if (mouse_check_button_released(mb_right)) {
		camMove = false;
		
		//Visible cursor
		window_set_cursor(cr_default);
	}
	
	//Y-axis movement
	if (keyboard_check(vk_rcontrol)) {
		//Special y-axis movement
		y -= camSpeed * (_run + 1) * ((_u - _d) * dsin(camPitch));
	} else {
		//Normal y-axis movement
		y += camSpeed * (_y_d - _y_u);
	}
	
	//Axes of movement
	x		+= camSpeed * (_run + 1) * ((_l - _r) * dsin(direction) + (_u - _d) * dcos(direction));
	y		+= camSpeed * (_y_d - _y_u);
	camDist += camSpeed * (_run + 1) * ((_l - _r) * dcos(direction) - (_u - _d) * dsin(direction));
	
	//Update scroll wheel checker
	if (_u || _d) {
		alarm[2] = 15;
		scrollChk = false;
	}
} else {
	//Constrain camera angles
	direction = clamp(direction, 265, 275);
	camPitch  = clamp(camPitch, -5, 5);
	
	//Reset debug camera origin view
	camDebugO[X] = camTweenTo[X];
	camDebugO[Y] = camTweenTo[Y];
	
	//Reset debug camera current view
	//camDebugC[X] = camTweenTo[X];
	//camDebugC[Y] = camTweenTo[Y];
}

x = clamp(x, -global.VW / 2, global.RW);
y = clamp(y, -global.VH / 2, global.RH);

camDebugC[X] = clamp(camDebugC[X], -global.VW / 2, global.RW);
camDebugC[Y] = clamp(camDebugC[Y], -global.VH / 2, global.RH);
