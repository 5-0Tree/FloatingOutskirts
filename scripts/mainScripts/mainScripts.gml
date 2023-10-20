//Macros
#macro X 0
#macro Y 1
#macro vkU vk_up
#macro vkL vk_left
#macro vkD vk_down
#macro vkR vk_right
#macro wasdU ord("W")
#macro wasdL ord("A")
#macro wasdD ord("S")
#macro wasdR ord("D")

//Perform tweening events for player points
function tween_points(from_struct, to_struct, amount) {
	var _tempStruct = {
		_x : lerp(from_struct._x, to_struct._x, amount),
		_y : lerp(from_struct._y, to_struct._y, amount)
	}
	
	return _tempStruct;
}

//Draw death effect shards
function draw_death_shards(sprite, num, x_pos, y_pos, angle, dist, color, scale, alpha) {
	for (var i = 0; i < num; i ++) {
		var _aa = angle + 360 / num * i,
			_xx = x_pos + lengthdir_x(dist, _aa) / 2 * scale,
			_yy = y_pos + lengthdir_y(dist, _aa) / 2 * scale;
		
		draw_sprite_ext(sprite, num + i, _xx, _yy, scale, scale, _aa, color, alpha);
	}
}

//3D vector
function Vec3(_x, _y, _z) constructor {
	x = _x;
	y = _y;
	z = _z;
}

//Shorthand for directional keys
function dir_key_check(_limit_mod, _key_primary) constructor {
	var _is_secodary = (argument[2] != undefined ? true : false),
		_key_secondary = (_is_secodary ? argument[2] : -1);
	
	down = (keyboard_check(_key_primary) * _limit_mod || (_is_secodary ? keyboard_check(_key_secondary) || keyboard_check(_key_primary) : -1) * !_limit_mod);
	pressed = (keyboard_check_pressed(_key_primary) * _limit_mod || (_is_secodary ? keyboard_check_pressed(_key_secondary) || keyboard_check_pressed(_key_primary) : -1) * !_limit_mod);
	released = (keyboard_check_released(_key_primary) * _limit_mod || (_is_secodary ? keyboard_check_released(_key_secondary) || keyboard_check_released(_key_primary) : -1) * !_limit_mod);
}

//Visibility region
function visible_radius(_x, _y) {
	//Set temporary camera variables
	var cam_x = camera_get_view_x(view_camera[0]),
		cam_y = camera_get_view_y(view_camera[0]),
		cam_w = global.VW,
		cam_h = global.VH;

	var camCenter;
	camCenter[X] = cam_x + cam_w / 2;
	camCenter[Y] = cam_y + cam_h / 2;
	
	//Make object visible only within camera radius
	return (point_distance(_x, _y, camCenter[X], camCenter[Y]) > max(global.VW + 64, global.VH + 64) ? false : true);
}
