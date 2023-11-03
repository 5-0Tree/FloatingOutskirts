/// @description Init Variables

//Basic camera variables
camera		= view_camera[0];
camTweenTo	= [x, y];
camDebugO	= [x, y];	//Debug origin
camDebugC	= [x, y];	//Debug current
camDebugD	= [x, y];	//Debug death
lookAt		= [0, 0];
lookAtTo	= [0, 0];
respawnPos	= [0, 0];
respawnLook	= [0, 0];
screenTrans	= false;

//3D camera properties
camDist		= global.camDistance;
camFOV		= 60;
distReset	= false;	//Reset zoom variable
scrollChk	= false;	//Scroll wheel checker variable
snapView	= false;	//Snap zoom variable

//3D camera movement axes
direction	= 270;
camPitch	= 0;
camMove		= false;
camFrom		= [0, 0];	 //Mouse source coordinates
camTo		= [0, 0];	 //Mouse destination coordinates
camSpeed	= 4;

//Enable rendering capabilities
gpu_set_ztestenable(true);
gpu_set_alphatestenable(true);
gpu_set_alphatestref(0);
gpu_set_texrepeat(true);

#region Vertex Buffers

///Vertex buffers for camera overlay:
//Vertex coordinates shorthand
var x1 = 0,
	y1 = 0,
	z1 = -1,
	x2 = camera_get_view_width(view_camera[0]),
	y2 = camera_get_view_height(view_camera[0]),
	z2 = global.camDistance,
	xc = x2 / 2,
	yc = y2 / 2,
	hb = global.blockSize * global.camAsp / 2,
	vb = global.blockSize / global.camAsp;

//Debug origin view base rectangle
vBuff[0] = vertex_create_buffer();
vertex_begin(vBuff[0], global.vFormat);

vertex_create_outline(vBuff[0],
	c_blue, 0.6,
	new Vec3(x1, y1, z1),
	new Vec3(x2, y1, z1),
	new Vec3(x2, y2, z1),
	new Vec3(x1, y2, z1),
	new Vec3(x1, y1, z1));

vertex_end(vBuff[0]);
vertex_freeze(vBuff[0]);

//Debug death view base rectangle
vBuff[1] = vertex_create_buffer();
vertex_begin(vBuff[1], global.vFormat);

z1 --;

vertex_create_outline(vBuff[1],
	c_red, 0.6,
	new Vec3(x1, y1, z1),
	new Vec3(x2, y1, z1),
	new Vec3(x2, y2, z1),
	new Vec3(x1, y2, z1),
	new Vec3(x1, y1, z1));

vertex_end(vBuff[1]);
vertex_freeze(vBuff[1]);

//Debug current view base rectangle
vBuff[2] = vertex_create_buffer();
vertex_begin(vBuff[2], global.vFormat);

z1 --;

vertex_create_outline(vBuff[2],
	c_yellow, 0.6,
	new Vec3(x1, y1, z1),
	new Vec3(x2, y1, z1),
	new Vec3(x2, y2, z1),
	new Vec3(x1, y2, z1),
	new Vec3(x1, y1, z1));

vertex_end(vBuff[2]);
vertex_freeze(vBuff[2]);

//Debug current view angled parts
vBuff[3] = vertex_create_buffer();
vertex_begin(vBuff[3], global.vFormat);

//Top region
vertex_create_outline(vBuff[3],
	c_yellow, 0.6,
	new Vec3(x1, y1, z1),
	new Vec3(xc - hb, yc - vb, z2),
	new Vec3(xc + hb, yc - vb, z2),
	new Vec3(x2, y1, z1),
	new Vec3(xc + hb, yc - vb, z2),
	new Vec3(xc + hb, yc + vb, z2),
	new Vec3(x2, y2, z1),
	new Vec3(xc + hb, yc + vb, z2),
	new Vec3(xc - hb, yc + vb, z2),
	new Vec3(x1, y2, z1),
	new Vec3(xc - hb, yc + vb, z2),
	new Vec3(xc - hb, yc - vb, z2));

vertex_end(vBuff[3]);
vertex_freeze(vBuff[3]);

#endregion
