/// @description Adjust Player Movement

event_inherited();

//Move player in direction facing
move_and_collide(moveSpeed * faceDir, 0, objCollisionParent);

if (jumpCounter > 1) {
	if (!dJumpTrigger) {
		dJumpTrigger = true;
		jumpFadeFX = 1;
		lastJump = [x, y];
		lastJumpDir = -faceDir;
		alarm[1] = 2;
	}
}

//Deal with hazards
if (place_meeting(x, y, objHazardParent)) {
	instance_destroy();
}
