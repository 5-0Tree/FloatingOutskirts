/// @description Manage Player Variables

//Player direction: -1 = Left | 0 = Idle | 1 = Right
faceDir = (new dir_key_check(global.DEBUGMODE, vkR, wasdR).down - new dir_key_check(global.DEBUGMODE, vkL, wasdL).down);

//Set isMoving variable appropriately
isMoving = (abs(faceDir) > 0);

//Reset jumps when on a solid object
if (collision_line(x + 10, y + 20, x - 10, y + 20, objCollisionParent, true, true) != noone) {
	jumpCounter = 0;
	dJumpTrigger = false;
}

//Set isJumping variable when jump key is pressed...
if (new dir_key_check(global.DEBUGMODE, vkU, wasdU).pressed) {
	if (jumpCounter < availableJumps) {
		if (place_meeting(x, y + 4, objCollisionParent)) {
			jumpCounter ++;
		} else /*if (TODO: Jump crystals...)*/ {
			jumpCounter = maxJumps;
		}
		
		isJumping = true;
		alarm[0] = jumpAmount * (jumpCounter > 1 ? 0.8 : 1.0); //...until maximum jump height is reached...
	}
}

//...and stop jumping when jump key is released...
if (new dir_key_check(global.DEBUGMODE, vkU, wasdU).released) {
	isJumping = false;
	jumpSlow = false;
	alarm[0] = -1;
}

//...or stop jumping when player head hits another object
if (!jumpSlow) {
	if (collision_line(x + 6, y - 18, x - 6, y - 18, objCollisionParent, true, true) != noone) {
		jumpSlow = true;
		jumpAccel = 0.5;
		alarm[0] = 1;
	}
}

//Update player direction string
stateDir = (faceDir < 0 ? "Left" : (faceDir > 0 ? "Right" : "Neutral"));
stateStr = (isJumping ? "Jumping" : (isFalling ? "Falling" : (isMoving ? "Moving" : "Idle")));

event_perform(ev_other, ev_user0);
