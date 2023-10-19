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

//Set up camera
view_enabled = true;
view_camera[0] = camera_create_view(0, 0, global.VW, global.VH);
view_set_visible(0, true);

gpu_set_ztestenable(true);
gpu_set_alphatestenable(true);
gpu_set_texrepeat(true);

//**DEBUG MODE**
global.DEBUGMODE = false;
