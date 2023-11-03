/// @description **DEBUG** - Draw Camera Bounds

if (global.DEBUGMODE) {
	if (instance_number(objCamera) == 1 && array_length(vBuff) > 3) {
		var _vx = camera_get_view_x(view_camera[0]),
			_vy = camera_get_view_y(view_camera[0]),
			_dox = camDebugO[X], //Debug origin camera X
			_doy = camDebugO[Y], //Debug origin camera Y
			_dcx = camTweenTo[X], //Debug current camera X
			_dcy = camTweenTo[Y], //Debug current camera Y
			_ddx = camDebugD[X], //Debug death camera X
			_ddy = camDebugD[Y], //Debug death camera Y
			_mat = matrix_build(_vx, _vy, 0, 0, 0, 0, 1, 1, 1),
			_do_mat = matrix_build(_dox, _doy, -1, 0, 0, 0, 1, 1, 1),
			_dc_mat = matrix_build(_dcx, _dcy, 0, 0, 0, 0, 1, 1, 1),
			_dd_mat = matrix_build(_ddx, _ddy, -1, 0, 0, 0, 1, 1, 1);
		
		//Set debug origin matrix (ORIGIN)
		matrix_set(matrix_world, _do_mat);
		
		//Draw debug origin camera vertex buffer (ORIGIN)
		vertex_submit(vBuff[0], pr_linelist, -1);
		
		//Reset view matrix (RESET)
		matrix_set(matrix_world, matrix_build_identity());
		
		if (global.playerDeaths > 0) {
			//Set debug death matrix (DEATH)
			matrix_set(matrix_world, _dd_mat);
			
			//Draw debug death camera vertex buffer (DEATH)
			vertex_submit(vBuff[1], pr_linelist, -1);
			
			//Reset view matrix (RESET)
			matrix_set(matrix_world, matrix_build_identity());
		}
		
		//Set normal camera view matrix (CURRENT)
		matrix_set(matrix_world, _dc_mat);
		
		//Draw normal camera vertex buffers (CURRENT)
		vertex_submit(vBuff[2], pr_linelist, -1);
		vertex_submit(vBuff[3], pr_linelist, -1);
		
		//Reset view matrix (RESET)
		matrix_set(matrix_world, matrix_build_identity());
	}
}
