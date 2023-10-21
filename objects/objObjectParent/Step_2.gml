/// @description Adjust Visibility

if (importance >= 0) {
	var cam_x = camera_get_view_x(view_camera[0]),
		cam_y = camera_get_view_y(view_camera[0]),
		cam_w = global.VW,
		cam_h = global.VH;
	
	var camCenter;
	camCenter[X] = cam_x + cam_w / 2;
	camCenter[Y] = cam_y + cam_h / 2;
	
	///**DEBUG** - Detect object under mouse cursor (TODO)
	if (global.DEBUGMODE) {
		var _mx = window_mouse_get_x() + cam_x,
			_my = window_mouse_get_y() + cam_y,
			_spr = sprite_index;
		
		//Override object visibility
		visible = true;
	} else {
		//Set object visibility
		visible = visible_radius(x, y);
	}
}
