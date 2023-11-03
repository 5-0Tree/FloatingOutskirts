/// @description Draw 3D Faces

var _camW = camera_get_view_width(view_camera[0]),
	_camH = camera_get_view_height(view_camera[0]),
	_camX = camera_get_view_x(view_camera[0]),
	_camY = camera_get_view_y(view_camera[0]);

//Angle shorthand
var _a = image_angle;

//Draw object (rotated)
for (var i = 0; i < array_length(vBuff); i ++) {
	//Create matrix (TODO...)
	var _mat = matrix_build(x, y, z, 0, 0, _a - 90, 1, 1, 1);

	//Set matrix transformations
	matrix_set(matrix_world, _mat);
	
	//Draw object
	vertex_submit(vBuff[i], pr_trianglelist, texture[i]);
	
	//Reset view matrix
	matrix_set(matrix_world, matrix_build_identity());
}
