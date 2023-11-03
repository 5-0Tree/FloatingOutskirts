/// @description Update Editor Surface

//Get camera values
var cam_x = camera_get_view_x(view_camera[0]),
	cam_y = camera_get_view_y(view_camera[0]),
	cam_z = global.camDistance,
	cam_w = global.VW,
	cam_h = global.VH,
	view_mat = undefined,
	proj_mat = undefined;

//Get values from camera object
if (instance_number(objCamera) == 1) {
	global.EDITOR.POS.ANGLE = objCamera.direction;
	global.EDITOR.POS.PITCH = objCamera.camPitch;
	global.EDITOR.POS.ZOOM = objCamera.camDist / cam_z;
	cam_x = objCamera.x;
	cam_y = objCamera.y;
	cam_z = objCamera.camDist;
	view_mat = camera_get_view_mat(view_camera[0]);
	proj_mat = camera_get_proj_mat(view_camera[0]);
}

var camCenter;
camCenter[X] = cam_x + cam_w / 2;
camCenter[Y] = cam_y + cam_h / 2;

//Mouse position
var __mx__ = window_mouse_get_x(),
	__my__ = cam_h - window_mouse_get_y();

//Default mouse raycast variable
var mouse_ray = [0, 0, 0, 0, 0, 0];

//Mouse position on grid plane
if (view_mat != undefined && proj_mat != undefined) {
	mouse_ray = screen_to_world(__mx__, __my__, view_mat, proj_mat);
}

//Editor variables shorthand
var _cw		= global.EDITOR.POS.CELL._W,
	_ch		= global.EDITOR.POS.CELL._H,
	_angle	= global.EDITOR.POS.ANGLE,
	_pitch	= global.EDITOR.POS.PITCH,
	_zoom	= global.EDITOR.POS.ZOOM;

//Editor cell values
var cell_mx	= floor(__mx__ / _cw) * _cw,
	cell_my	= floor(__my__ / _ch) * _ch,
	cell_x	= floor(cam_x / _cw) * _cw,
	cell_y	= floor(cam_y / _ch) * _ch;

//show_debug_message("view_mat = " + string(view_mat));
//show_debug_message("proj_mat = " + string(proj_mat));
//show_debug_message("mouse_ray = " + string(mouse_ray));

//Cell position
var _pos;
_pos[X] = -mouse_ray[0] * cam_z / mouse_ray[2] + mouse_ray[3];
_pos[Y] = -mouse_ray[1] * cam_z / mouse_ray[2] + mouse_ray[4];
_pos[Z] = -64;

global.EDITOR.POS.TRANSFORM.TRANSLATE._X = floor(_pos[X] / _cw) * _cw;
global.EDITOR.POS.TRANSFORM.TRANSLATE._Y = floor(_pos[Y] / _ch) * _ch;
global.EDITOR.POS.TRANSFORM.TRANSLATE._Z = _pos[Z];

show_debug_message(global.EDITOR.POS.TRANSFORM);
