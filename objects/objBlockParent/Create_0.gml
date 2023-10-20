/// @description Create 3D Blocks

//Inherit the parent event
event_inherited();

//Create 3D block with correct properties
instance_create_layer(x, y, "Ground3D", obj3DWall, {
	sprite_index : other.sprite_index,
	image_xscale : other.image_xscale,
	image_yscale : other.image_yscale,
	groundDepth : other.groundDepth,
	groundOffset : other.groundOffset
});

depth = groundOffset;
