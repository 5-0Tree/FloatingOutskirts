/// @description Init Variables

//Create empty buffer array
vBuff = [];

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
global.camAsp = camera_get_view_width(view_camera[0]) / camera_get_view_height(view_camera[0]);
global.camDistance = -545;

//Create camera object if there are none
if (instance_number(objCamera) == 0) {
	instance_create_layer(0, 0, "Control", objCamera);
}
