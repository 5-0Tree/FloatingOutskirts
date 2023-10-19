/// @description Jump Limit

if (jumpAccel < 0.2) {
	isJumping = false;
	jumpSlow = false;
} else {
	jumpAccel -= 0.1;
	jumpSlow = true;
	alarm[0] = 1;
}
