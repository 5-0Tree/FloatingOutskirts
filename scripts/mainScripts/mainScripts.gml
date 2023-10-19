//Macros
#macro X 0
#macro Y 1

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
		var aa = angle + 360 / num * i,
			xx = x_pos + lengthdir_x(dist, aa) / 2 * scale,
			yy = y_pos + lengthdir_y(dist, aa) / 2 * scale;
		
		draw_sprite_ext(sprite, num + i, xx, yy, scale, scale, aa, color, alpha);
	}
}

//3D rendering
function Vec3(_x, _y, _z) constructor {
	x = _x;
	y = _y;
	z = _z;
}
