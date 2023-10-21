/// @description Update Camera Bounds

//Camera original position
var _c_pos;
_c_pos[X] = (global.DEBUGMODE ? camDebugV[X] : camTweenTo[X]);
_c_pos[Y] = (global.DEBUGMODE ? camDebugV[Y] : camTweenTo[Y]);

//Camera updating position values
var _cx = _c_pos[X],
	_cy = _c_pos[Y],
	_vw = global.VW,
	_vh = global.VH;

//Camera position (in rounded chunk-form)
var _rcf_c;
_rcf_c[X] = round(_cx / _vw - 0.5);
_rcf_c[Y] = round(_cy / _vh - 0.5);

//Look-at target position (in rounded chunk-form)
var _rcf_t = _rcf_c;

//Debug zoom threshold
var _d_z = (global.DEBUGMODE && camDist > global.cameraDistance * 1.5);

//Original camera position
var _vc_ox = camera_get_view_x(view_camera[0]),
	_vc_oy = camera_get_view_y(view_camera[0]);

//Keep camera within current screen
if (instance_exists(objPlayer)) {
	with (objPlayer) {
		if (!other.screenTrans) {
			_rcf_t[X] = round(x / _vw - 0.5);
			_rcf_t[Y] = round(y / _vh - 0.5);
		}
		
		_cx = _rcf_c[X] * _vw;
		_cy = _rcf_c[Y] * _vh;
		
		other.lookAtTo[X] =  (x - other.x - _vw / 2) / 4;
		other.lookAtTo[Y] = -(y - other.y - _vh / 2) / 4;
	}
	
	camTweenTo[X] = _cx;
	camTweenTo[Y] = _cy;
} else {
	with (objSpawnPoint) {
		if (active) {
			_rcf_t[X] = round(x / _vw - 0.5);
			_rcf_t[Y] = round(y / _vh - 0.5);
			
			other.respawnLook[X] = respawnLook[X];
			other.respawnLook[Y] = respawnLook[Y];
			
			other.respawnPos[X] = respawnPos[X];
			other.respawnPos[Y] = respawnPos[Y];
			
			if (other.alarm[1] == -1) {
				other.alarm[1] = 15;
			}
		}
	}
}

////TODO: Work on debug camera and its offset...

///**DEBUG** - Camera offset
//Debug distance & direction
var _d_dist = point_distance(camDebugV[X], camDebugV[Y], camTweenTo[X], camTweenTo[Y]),
	_d_dir	= point_direction(camDebugV[X], camDebugV[Y], camTweenTo[X], camTweenTo[Y]);

//Camera coordinate differences
var _cam_diff;
_cam_diff[X] = lengthdir_x(_d_dist, _d_dir);
_cam_diff[Y] = lengthdir_y(_d_dist, _d_dir);

//Horizontal offset correction
if (abs(_cam_diff[X]) > 128) {
	show_debug_message("Cam X before: " + string(camTweenTo[X]));
	camTweenTo[X] += _d_z * sign(_cam_diff[X]) * (_cam_diff[X] < 128 ? _vw : 0);
	show_debug_message("Cam X after: " + string(camTweenTo[X]));
}						 
						 
//Vertical offset correction
if (abs(_cam_diff[Y]) > 128) {
	show_debug_message("Cam Y before: " + string(camTweenTo[Y]));
	camTweenTo[Y] += _d_z * sign(_cam_diff[Y]) * (_cam_diff[Y] < 128 ? _vh : 0);
	show_debug_message("Cam Y after: " + string(camTweenTo[Y]));
}

if (global.DEBUGMODE) {
	camDebugV[X] = round(lerp(camDebugV[X], camTweenTo[X], 0.25));
	camDebugV[Y] = round(lerp(camDebugV[Y], camTweenTo[Y], 0.25));
	
	camera_set_view_pos(camera, camDebugV[X], camDebugV[Y]);
} else {
	x = round(lerp(x, camTweenTo[X], 0.25));
	y = round(lerp(y, camTweenTo[Y], 0.25));
	
	lookAt[X] = round(lerp(lookAt[X], lookAtTo[X], 0.1));
	lookAt[Y] = round(lerp(lookAt[Y], lookAtTo[Y], 0.1));
	
	camera_set_view_pos(camera, x, y);
}
