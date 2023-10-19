/// @description Fix Perspective Depth

if (object_index != objPlayer) {
	var cam_x = camera_get_view_x(view_camera[0]),
		cam_y = camera_get_view_y(view_camera[0]),
		cam_w = global.VW,
		cam_h = global.VH;

	var camCenter;
	camCenter[X] = cam_x + cam_w / 2;
	camCenter[Y] = cam_y + cam_h / 2;
	
	//Adjust depth by distance from center of camera
	depth = point_distance(x, y, camCenter[X], camCenter[Y]) - (object_get_parent(object_index) == objPanelParent ? 1000 : 2000);
	
	//**DEBUG MODE STUFF**
	if (global.DEBUGMODE) {
		var _mx = window_mouse_get_x() + cam_x,
			_my = window_mouse_get_y() + cam_y,
			_spr = sprite_index;
		
		if (point_in_rectangle(_mx, _my, x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2)) {
			spriteFace = sprPlayerColMask;
			show_debug_message(depth);
		} else {
			spriteFace = _spr;
		}
	}
	
	//Make object visible only within camera radius
	if (object_get_parent(object_index))
	visible = (point_distance(x, y, camCenter[X], camCenter[Y]) > max(global.VW + 64, global.VH + 64) ? false : true);
}
