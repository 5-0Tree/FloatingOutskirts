/// @description **DEBUG** - Draw Camera Bounds

if (global.DEBUGMODE) {
	if (instance_number(objCamera) == 1) {
		var _vx = camera_get_view_x(view_camera[0]),
			_vy = camera_get_view_y(view_camera[0]),
			_dx = objCamera.camDebugO[X],
			_dy = objCamera.camDebugO[Y],
			_mat = matrix_build(_vx, _vy, 0, 0, 0, 0, 1, 1, 1),
			_d_mat = matrix_build(_dx, _dy, -1, 0, 0, 0, 1, 1, 1);
		
		//Set debug view matrix
		matrix_set(matrix_world, _d_mat);
		
		//Draw debug camera vertex buffer
		vertex_submit(vBuffBaseO, pr_linelist, -1);
		
		//Reset view matrix
		matrix_set(matrix_world, matrix_build_identity());
		
		//Set normal view matrix
		matrix_set(matrix_world, _mat);
		
		//Draw normal camera vertex buffers
		vertex_submit(vBuffBase, pr_linelist, -1);
		vertex_submit(vBuffTop, pr_linelist, -1);
		vertex_submit(vBuffLeft, pr_linelist, -1);
		vertex_submit(vBuffBottom, pr_linelist, -1);
		vertex_submit(vBuffRight, pr_linelist, -1);
		
		//Reset view matrix
		matrix_set(matrix_world, matrix_build_identity());
	}
}
