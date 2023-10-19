/// @description Assign Angle and Subimage

//Inherit the parent event
event_inherited();

image_index = 0;		//Spike design
spikeAngle = 3; 		//Spike rotation		0 = Up	| 1 = Left	| 2 = Down	| 3 = Right

var _aa = 0;			//Offset angle			90 = Up		| 180 = Left	| 270 = Down	| 0 = Right

//Offset sprite according to angle
x += lengthdir_x(sprite_width / 2, _aa);
y += lengthdir_y(sprite_height / 2, _aa);
