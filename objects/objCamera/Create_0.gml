/// @description Init Variables

//Basic camera variables
camera		 = view_camera[0];
camTweenTo	 = [0, 0];
camDebugO	 = [0, 0];
camDebugV	 = [0, 0];
lookAt		 = [0, 0];
lookAtTo	 = [0, 0];
respawnPos	 = [0, 0];
respawnLook	 = [0, 0];
screenTrans	 = false;

//3D camera properties
camDist	= global.cameraDistance;
camFOV	= 90;
camAsp	= camera_get_view_width(camera) / camera_get_view_height(camera);

//3D camera movement axes
direction = 270;
x = 0;
y = 0;
camMove	 = false;
camPitch = 0;
camFrom	 = [0, 0]; //Mouse source coordinates
camTo	 = [0, 0]; //Mouse destination coordinates
camSpeed = 4;

//Enable rendering capabilities
gpu_set_ztestenable(true);
gpu_set_alphatestenable(true);
gpu_set_alphatestref(128);
gpu_set_texrepeat(true);
