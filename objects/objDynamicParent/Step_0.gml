/// @description Apply Game Physics

//Falling physics
if (!isJumping) {
	move_and_collide(0, fallSpeed * fallAccel, objCollisionParent);
}

//Set isFalling variable appropriately
isFalling = (y > yprevious);

//Jumping Physics
if (isJumping) {
	move_and_collide(0, -jumpSpeed * jumpAccel, objCollisionParent);
}

//Adjust move acceleration
if (isMoving) {
	moveAccel = min(maxMoveAccel, moveAccel + 0.1);
} else {
	moveAccel = defMoveAccel;
}

//Adjust jump acceleration
if (!jumpSlow) {
	if (isJumping) {
		jumpAccel = min(maxJumpAccel, jumpAccel + 0.1);
	} else {
		jumpAccel = defJumpAccel;
	}
}

//Adjust fall acceleration
if (isFalling) {
	fallAccel = min(maxFallAccel, fallAccel + 0.1);
} else {
	fallAccel = defFallAccel;
}
