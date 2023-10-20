/// @description Draw 3D Camera First

var _camW = camera_get_view_width(camera),
	_camH = camera_get_view_height(camera),
	_camX = x + _camW / 2,
	_camY = y + _camH / 2;

var _viewMat = matrix_build_lookat(_camX, _camY, camDist,
		_camX + dcos(direction),
		_camY - dsin(camPitch),
		camDist - dsin(direction), 0, 1, 0),
	_projMat = matrix_build_projection_perspective_fov(camFOV, camAsp, 1, 32000);

camera_set_view_mat(camera, _viewMat);
camera_set_proj_mat(camera, _projMat);

camera_apply(camera);
