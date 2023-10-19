/// @description Insert description here

//Inherit the parent event
event_inherited();

//Sprite angle and subimage values
image_index = 0;				//Spike design
spriteFace = sprite_index;		//Spike sprite
spikeAngle = 0;					//Spike rotation		0 = Up	| 1 = Left	| 2 = Down	| 3 = Right
edgeSprite = sprSpikeEdges;		//Sprite for edges

//Sprite corresponding to angle
angleSprite = [sprSpikeUp, sprSpikeLeft, sprSpikeDown, sprSpikeRight];
