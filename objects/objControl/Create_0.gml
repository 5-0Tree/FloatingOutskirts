/// @description Init Vars

//Make sure the game is randomized
randomize();

//Frame counter
global.frameCounter = 0;	//Current frame
global.maxFrames = 60;		//Reset frame

//Game elements
global.blockSize = 64;		//Pixel width & height for game blocks
global.gameScale = 1;		//Visual scaling multiplier

//Set up graphics
gpu_set_texfilter(true);

//Set up viewport variables
WIDTHINBLOCKS = 19;
HEIGHTINBLOCKS = 10;
global.VW = WIDTHINBLOCKS * global.blockSize;
global.VH = HEIGHTINBLOCKS * global.blockSize;
global.RW = global.VW * 10;
global.RH = global.VH * 10;
room_width = global.RW;
room_height = global.RH;

global.cameraDistance = -300;

//Create camera object
instance_create_layer(0, 0, "Control", objCamera);

//**DEBUG MODE**
global.DEBUGMODE = false;

///Vertex buffers for camera overlay
//Vertex coordinates shorthand
var x1 = 0,
	y1 = 0,
	z1 = -1,
	x2 = camera_get_view_width(view_camera[0]),
	y2 = camera_get_view_height(view_camera[0]),
	z2 = global.cameraDistance,
	xc = x2 / 2,
	yc = y2 / 2,
	hb = global.blockSize / 4;

///Camera visualizer vertex buffers

//Debug origin (when debug is initially enabled) base rectangle
vBuffBaseO = vertex_create_buffer();
vertex_begin(vBuffBaseO, global.vFormat);

vertex_create_outline(vBuffBaseO,
	c_lime, 0.8,
	new Vec3(x1, y1, z1),
	new Vec3(x2, y1, z1),
	new Vec3(x2, y2, z1),
	new Vec3(x1, y2, z1),
	new Vec3(x1, y1, z1));

vertex_end(vBuffBaseO);
vertex_freeze(vBuffBaseO);

//Current view (where the view would be) base rectangle
vBuffBaseV = vertex_create_buffer();
vertex_begin(vBuffBaseV, global.vFormat);

vertex_create_outline(vBuffBaseV,
	c_red, 0.8,
	new Vec3(x1, y1, z1),
	new Vec3(x2, y1, z1),
	new Vec3(x2, y2, z1),
	new Vec3(x1, y2, z1),
	new Vec3(x1, y1, z1));

vertex_end(vBuffBaseV);
vertex_freeze(vBuffBaseV);

//Debug camera base rectangle
vBuffBase = vertex_create_buffer();
vertex_begin(vBuffBase, global.vFormat);

vertex_create_outline(vBuffBase,
	c_yellow, 0.7,
	new Vec3(x1, y1, z1),
	new Vec3(x2, y1, z1),
	new Vec3(x2, y2, z1),
	new Vec3(x1, y2, z1),
	new Vec3(x1, y1, z1));

vertex_end(vBuffBase);
vertex_freeze(vBuffBase);

//Top region
vBuffTop = vertex_create_buffer();
vertex_begin(vBuffTop, global.vFormat);

vertex_create_outline(vBuffTop,
	c_yellow, 0.7,
	new Vec3(x1, y1, z1),
	new Vec3(xc - hb, yc - hb, z2),
	new Vec3(xc + hb, yc - hb, z2),
	new Vec3(x2, y1, z1));

vertex_end(vBuffTop);
vertex_freeze(vBuffTop);

//Left region
vBuffLeft = vertex_create_buffer();
vertex_begin(vBuffLeft, global.vFormat);

vertex_create_outline(vBuffLeft,
	c_yellow, 0.7,
	new Vec3(x1, y1, z1),
	new Vec3(xc - hb, yc - hb, z2),
	new Vec3(xc - hb, yc + hb, z2),
	new Vec3(x1, y2, z1));

vertex_end(vBuffLeft);
vertex_freeze(vBuffLeft);

//Bottom region
vBuffBottom = vertex_create_buffer();
vertex_begin(vBuffBottom, global.vFormat);

vertex_create_outline(vBuffBottom,
	c_yellow, 0.7,
	new Vec3(x1, y2, z1),
	new Vec3(xc - hb, yc + hb, z2),
	new Vec3(xc + hb, yc + hb, z2),
	new Vec3(x2, y2, z1));

vertex_end(vBuffBottom);
vertex_freeze(vBuffBottom);

//Right region
vBuffRight = vertex_create_buffer();
vertex_begin(vBuffRight, global.vFormat);

vertex_create_outline(vBuffRight,
	c_yellow, 0.7,
	new Vec3(x2, y1, z1),
	new Vec3(xc + hb, yc - hb, z2),
	new Vec3(xc + hb, yc + hb, z2),
	new Vec3(x2, y2, z1));

vertex_end(vBuffRight);
vertex_freeze(vBuffRight);
