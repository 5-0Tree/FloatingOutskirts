/// @description Init Variables

//Camera
camera		 = view_camera[0];
camTweenFrom = [0, 0];
camTweenTo	 = [0, 0];
screenTrans	 = false;

//3D camera properties
camDist	= -300;
camFOV	= 90;
camAsp	= camera_get_view_width(camera) / camera_get_view_height(camera);

//3D camera movement axes
direction = -90;
x = 0;
y = 0;
camMove	 = false;
camPitch = 0;
camFrom	 = [0, 0];
camTo	 = [0, 0];
camSpeed = 4;

gpu_set_ztestenable(true);
gpu_set_alphatestenable(true);
gpu_set_alphatestref(128);
gpu_set_texrepeat(true);
