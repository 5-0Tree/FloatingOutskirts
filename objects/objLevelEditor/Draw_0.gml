/// @description Draw Editor 3D Space

if (global.EDITOR.MODE.CREATE) {
	if (!surface_exists(global.EDITOR.GRID)) {
		global.EDITOR.GRID = surface_create(room_width + 2, room_height + 2);
	}
	
	var _surf	= global.EDITOR.GRID,
		_cw		= global.EDITOR.POS.CELL._W,
		_ch		= global.EDITOR.POS.CELL._H,
		_vw		= global.VW,
		_vh		= global.VH;
	
	surface_set_target(_surf);
	
	draw_clear_alpha(0, 0.0);
	draw_set_color(#FFFFFF);
	draw_set_alpha(0.6);
	
	//Draw editor grid
	for (var iy = 0; iy < _vh + 1; iy += _cw) {
		for (var ix = 0; ix < _vw + 1; ix += _ch) {
			draw_line_width(0, iy, _vw, iy, 4);
			draw_line_width(ix, 0, ix, _vh, 4);
		}
	}
	
	surface_reset_target();
	
	var _tx = global.EDITOR.POS.TRANSFORM.TRANSLATE._X,
		_ty = global.EDITOR.POS.TRANSFORM.TRANSLATE._Y,
		_tz = global.EDITOR.POS.TRANSFORM.TRANSLATE._Z,
		_rx = global.EDITOR.POS.TRANSFORM.ROTATE._X,
		_ry = global.EDITOR.POS.TRANSFORM.ROTATE._Y,
		_rz = global.EDITOR.POS.TRANSFORM.ROTATE._Z,
		_sx = global.EDITOR.POS.TRANSFORM.SCALE._X,
		_sy = global.EDITOR.POS.TRANSFORM.SCALE._Y,
		_sz = global.EDITOR.POS.TRANSFORM.SCALE._Z,
		_mat = matrix_build(_tx, _ty, _tz, _rx, _ry, _rz, _sx, _sy, _sz),
		_grid_mat = matrix_build(0, 0, 100, 0, 0, 0, 1, 1, 1);
	
	//Set editor transform matrix
	matrix_set(matrix_world, _mat);
	
	for (var i = 0; i < array_length(vBuff); i ++) {
		//Draw editor transform matrix
		//vertex_begin(vBuff[i], global.vFormat);
		//vertex_color(vBuff[i], gui_cols[global.EDITOR.GUI.TOOLBAR.SEL], 1.0);
		//vertex_end(vBuff[i]);
		//vertex_update_buffer_from_buffer();
		//show_message(json_stringify(vertex_format_get_info(global.vFormat), true));
		vertex_submit(vBuff[i], pr_linelist, -1);
	}
	
	//Reset matrix
	matrix_set(matrix_world, matrix_build_identity());
	
	//Set grid transform matrix
	matrix_set(matrix_world, _grid_mat);
	
	draw_surface(global.EDITOR.GRID, -1, -1);
	
	//Reset matrix
	matrix_set(matrix_world, matrix_build_identity());
}
