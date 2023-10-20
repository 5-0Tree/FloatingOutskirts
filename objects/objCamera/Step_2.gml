/// @description Update Camera Bounds

var _vx = camTweenFrom[X],
	_vy = camTweenFrom[Y],
	_cx = camTweenTo[X],
	_cy = camTweenTo[Y],
	_vw = global.VW,
	_vh = global.VH;

//Keep camera within current screen
if (instance_exists(objPlayer) && !screenTrans) {
	with (objPlayer) {
		if (x < _vx) {
			_cx -= _vw;
			other.screenTrans = true;
			other.alarm[0] = 15;
		} else if (x > _vx + _vw) {
			_cx += _vw;
			other.screenTrans = true;
			other.alarm[0] = 15;
		}
		
		if (y < _vy) {
			_cy -= _vh;
			other.screenTrans = true;
			other.alarm[0] = 15;
		} else if (y > _vy + _vh) {
			_cy += _vh;
			other.screenTrans = true;
			other.alarm[0] = 15;
		}
	}
	
	camTweenTo[X] = _cx;
	camTweenTo[Y] = _cy;
}

x = lerp(x, camTweenTo[X], 0.25);
y = lerp(y, camTweenTo[Y], 0.25);

camera_set_view_pos(camera, x, y);
