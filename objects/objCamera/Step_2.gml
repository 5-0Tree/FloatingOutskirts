/// @description Update Camera Bounds

//Camera original position
//var _c_pos;
//_c_pos[X] = (camTweenTo[X]);
//_c_pos[Y] = (camTweenTo[Y]);

//Camera updating position values
var _cx = camTweenTo[X],
	_cy = camTweenTo[Y],
	_vw = global.VW,
	_vh = global.VH;

//Camera position (in rounded chunk-form)
var _rcf_c;
_rcf_c[X] = floor(_cx / _vw);
_rcf_c[Y] = floor(_cy / _vh);

//Original camera position
var _vc_ox = camera_get_view_x(view_camera[0]),
	_vc_oy = camera_get_view_y(view_camera[0]);

//Keep camera within current screen
if (instance_exists(objPlayer)) {
	with (objPlayer) {
		if (!other.screenTrans) {
			_rcf_c[X] = floor(x / _vw);
			_rcf_c[Y] = floor(y / _vh);
		}
		
		other.lookAtTo[X] =  (x - other.x - _vw / 2) / 4;
		other.lookAtTo[Y] = -(y - other.y - _vh / 2) / 3;
	}
	
	_cx = _rcf_c[X] * _vw;
	_cy = _rcf_c[Y] * _vh;
	
	camTweenTo[X] = _cx;
	camTweenTo[Y] = _cy;
} else {
	//If there is no player object, reset camera to last respawn point screen
	with (objSpawnPoint) {
		if (active) {
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

lookAt[X] = floor(lerp(lookAt[X], lookAtTo[X] * !global.DEBUGMODE, 0.1));
lookAt[Y] = floor(lerp(lookAt[Y], lookAtTo[Y] * !global.DEBUGMODE, 0.1));

////TODO: Work on debug camera and its offset...

///**DEBUG** - Camera offset
if (global.DEBUGMODE) {
	event_perform(ev_other, ev_user9);
	
	if (distReset) {
		camDist = lerp(camDist, global.camDistance, 0.25);
	}
	
	camera_set_view_pos(camera, camDebugC[X], camDebugC[Y]);
} else {
	x = floor(lerp(x, camTweenTo[X], 0.25));
	y = floor(lerp(y, camTweenTo[Y], 0.25));
	
	camera_set_view_pos(camera, x, y);
}
