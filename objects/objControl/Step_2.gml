/// @description Update Camera Bounds

var cam = view_camera[0],
	_newx = camera_get_view_x(cam),
	_newy = camera_get_view_y(cam),
	_vx = camera_get_view_x(cam),
	_vy = camera_get_view_y(cam),
	_vw = global.VW,
	_vh = global.VH,
	_px = 0,
	_py = 0;

if (instance_exists(objPlayer)) {
	
	with (objPlayer) {
		if (x < _vx) {
			_newx -= _vw;
			instance_activate_region(_vx - 64, _vy - 64, _vx + _vw + 64, _vy + _vh + 64, true);
		} else if (x > _vx + _vw) {
			_newx += _vw;
			instance_activate_region(_vx - 64, _vy - 64, _vx + _vw + 64, _vy + _vh + 64, true);
		}
		
		if (y < _vy) {
			_newy -= _vh;
			instance_activate_region(_vx - 64, _vy - 64, _vx + _vw + 64, _vy + _vh + 64, true);
		} else if (y > _vy + _vh) {
			_newy += _vh;
			instance_activate_region(_vx - 64, _vy - 64, _vx + _vw + 64, _vy + _vh + 64, true);
		}
		
		_px = x;
		_py = y;
	}
}

with (objObjectParent) {
	if (point_distance(x, y, _px, _py) > 2048) {
		//instance_deactivate_object(self);
	}
}

camera_set_view_pos(cam, _newx, _newy);
