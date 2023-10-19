/// @description Check Declaration of Variables

if (!variable_instance_exists(self, "deathFadeFX")) {
	deathFadeFX = 1;
}

if (!variable_instance_exists(self, "deathFadeFX")) {
	deathFadePos = 0;
}

deathFrames = 6				//Total frames in death shard sprites
deathMaxDistance = 16;		//Maximum distance shards can travel from center
alarm[0] = 12;				//Time until FX fades

image_speed = 0;
image_angle = irandom(359);
image_index = irandom(image_number);

angle_2 = image_angle + 30 + irandom(1) * 60;
