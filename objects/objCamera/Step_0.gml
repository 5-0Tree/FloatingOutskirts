/// @description **DEBUG** Adjust 3D Camera Angle

if (global.DEBUGMODE) {
	//Start moving camera when pressing mouse button...
	if (mouse_check_button_pressed(mb_right)) {
		camFrom = [display_mouse_get_x(), display_mouse_get_y()];
		camMove = true;
	}
	
	//...continue to update camera angles while holding down...
	if (mouse_check_button(mb_right)) {
		camTo = [display_mouse_get_x(), display_mouse_get_y()];
		
		direction -= (camTo[X] - camFrom[X]) / 10;
		camPitch = clamp(camPitch + (camTo[Y] - camFrom[Y]) / 10, -90, 90);
		
		display_mouse_set(camFrom[X], camFrom[Y]);
	}
	
	//...and stop when mouse button is released
	if (mouse_check_button_released(mb_right)) {
		camMove = false;
	}
	
	var _u	 = keyboard_check(ord("W")),
		_l	 = keyboard_check(ord("A")),
		_d	 = keyboard_check(ord("S")),
		_r	 = keyboard_check(ord("D")),
		_run = keyboard_check(vk_shift),
		_y_u = keyboard_check(vk_space),
		_y_d = keyboard_check(vk_lcontrol);
	
	//Y-axis movement
	if (keyboard_check(vk_alt)) {
		//Special y-axis movement
		y -= camSpeed * (_run + 1) * ((_u - _d) * dsin(camPitch));
	} else {
		//Normal y-axis movement
		y += camSpeed * (_y_d - _y_u);
	}
	
	//Axes of movement
	x		-= camSpeed * (_run + 1) * ((_r - _l) * dsin(direction) - (_u - _d) * dcos(direction));
	y		+= camSpeed * (_y_d - _y_u);
	camDist += camSpeed * (_run + 1) * ((_l - _r) * dcos(direction) - (_u - _d) * dsin(direction));
} else {
	//Reset viewing angle if not in debug mode
	direction = -90;
	camPitch = 0;
}
