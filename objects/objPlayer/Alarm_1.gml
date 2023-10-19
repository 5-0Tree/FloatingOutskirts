/// @description Double-Jump Effect Trigger

if (jumpFadeFX > -1) {
	jumpFadeFX -= 0.1;
	alarm[1] = 1;
} else {
	jumpFadeFX = -1;
}
