///TODO: rollback_define_input()

//Macros
#macro X 0
#macro Y 1
#macro Z 2
#macro vkU vk_up
#macro vkL vk_left
#macro vkD vk_down
#macro vkR vk_right
#macro wasdU ord("W")
#macro wasdL ord("A")
#macro wasdD ord("S")
#macro wasdR ord("D")

//Editor-specific macros
#macro GUI_EXPANDED true
#macro GUI_COLLAPSED false
#macro GUI_COL_PLACE #00FF00
#macro GUI_COL_DELETE #FF0000
#macro GUI_COL_SELECT #0080FF
#macro GUI_COL_PROP #FF8000
#macro GUI_COL_BUTTON_SEL #FFFFFF
#macro GUI_COL_BUTTON_TOP #EDEDED
#macro GUI_COL_BUTTON_BOT #101010
#macro GUI_COL_TEXT #0A0A0A

//**DEBUG MODE**
global.DEBUGMODE = false;

//Initial death count
global.playerDeaths = 0;

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
	return (point_distance(_x, _y, camCenter[X], camCenter[Y]) > max(cam_w * 2 + 64, cam_h * 2 + 64) ? false : true);
}

function screen_to_world(_x, _y, V, P) {
	var mx	 = 2 * (_x / window_get_width() - 0.5) / P[0],
		my	 = 2 * (_y / window_get_height() - 0.5) / P[5],
		camX = -(V[12] * V[0] + V[13] * V[1] + V[14] * V[2]),
		camY = -(V[12] * V[4] + V[13] * V[5] + V[14] * V[6]),
		camZ = -(V[12] * V[8] + V[13] * V[9] + V[14] * V[10]);
	
	if (P[15] == 0) {
		//This is a perspective projection
	    return [V[2]  + mx * V[0] + my * V[1],
				V[6]  + mx * V[4] + my * V[5],
				V[10] + mx * V[8] + my * V[9],
				camX,
				camY,
				camZ];
	} else {
		//This is an ortho projection
	    return [V[2],
				V[6],
				V[10],
				camX + mx * V[0] + my * V[1],
				camY + mx * V[4] + my * V[5],
				camZ + mx * V[8] + my * V[9]];
	}
}

//Clear surface with alpha* and color*:		([alpha (*default = 1.0)], [color (*default = white)])
// AND/OR option to set new surface target:	([surf], [alpha (*default = 1.0)], [color (*default = white)])
function surf_set() {
	switch (argument_count) {
		case 0 :
			draw_clear_alpha(#FFFFFF, 0.0);
			draw_set_color(#FFFFFF);
			draw_set_alpha(1.0);
		break;
		case 1 :
			if (typeof(argument[0]) == "ref") {
				surface_reset_target();
				surface_set_target(argument[0]);
				
				draw_clear_alpha(#FFFFFF, 0.0);
				draw_set_color(#FFFFFF);
				draw_set_alpha(1.0);
			} else {
				draw_clear_alpha(#FFFFFF, 0.0);
				draw_set_color(#FFFFFF);
				draw_set_alpha(argument[0]);
			}
		break;
		case 2 :
			if (typeof(argument[0]) == "ref") {
				surface_reset_target();
				surface_set_target(argument[0]);
				
				draw_clear_alpha(#FFFFFF, 0.0);
				draw_set_color(#FFFFFF);
				draw_set_alpha(argument[1]);
			} else {
				draw_clear_alpha(#FFFFFF, 0.0);
				draw_set_color(argument[1]);
				draw_set_alpha(argument[0]);
			}
		break;
		 case 3 :
			if (typeof(argument[0]) == "ref") {
				surface_reset_target();
				surface_set_target(argument[0]);
				
				draw_clear_alpha(#FFFFFF, 0.0);
				draw_set_color(argument[2]);
				draw_set_alpha(argument[1]);
			}
		break;
	}
}