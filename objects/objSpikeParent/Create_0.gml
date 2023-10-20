/// @description Configure 3D Spikes

//Inherit the parent event
event_inherited();

//Sprite and texture values
image_index = spikeAngle;			//Spike texture
edgeSprite	= sprSpikeEdges;		//Sprite for edges

//Sprite corresponding to angle
angleSprite = [sprSpikeUp, sprSpikeLeft, sprSpikeDown, sprSpikeRight];

//Make sure initial angle variable exists
if (!variable_instance_exists(self, "init_angle")) {
	init_angle = 0;
}

//Offset sprite according to angle
//x -= lengthdir_x(sprite_width / 2, init_angle);
//y -= lengthdir_y(sprite_height / 2, init_angle);

//Create 3D block with correct properties
instance_create_layer(x, y, "Ground3D", obj3DSpike, {
	sprite_index : other.sprite_index,
	image_xscale : other.image_xscale,
	image_yscale : other.image_yscale,
	image_index : other.image_index,
	image_angle : other.init_angle,
	groundDepth : other.groundDepth,
	groundOffset : other.groundOffset
});

depth = groundOffset;
