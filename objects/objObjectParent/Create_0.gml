/// @description Init General Values

//General object local variables
importance = 0;			//Object importance level:		-1 = Most		| 0 = Low			| 1 = Mid			| 2 = High 
faceDir = 0;			//Object direction value:		-1 = Left		| 0 = Neutral		| 1 = Right
isMoving = false;		//Is the object moving:			false = Idle	| true = Moving
isJumping = false;		//Is the object jumping:		false = No		| true = Yes
isFalling = false;		//Is the object falling:		false = No		| true = Yes
isHazard = false;		//Is the object hazardous:		false = No		| true = Yes
isVisible = true;		//Is the object visible:		false = No		| true = Yes
encumbered = false;		//Is the object heavier:		false = No		| true = Yes
buoyant = false;		//Is the object lighter:		false = No		| true = Yes
onPlatform = false;		//Is the object on a platform:	false = No		| true = Yes
jumpSlow = false;		//Is the jump peaking:			false = No		| true = Yes
stateStr = "Idle";		//Object state string
stateDir = "Neutral";	//Object direction string
jumpAmount = 4;			//Object jump timing
moveSpeed = 6;			//Object max move speed
jumpSpeed = 8;			//Object max jump speed
fallSpeed = 10;			//Object max fall speed
defMoveAccel = 0.2;		//Default move acceleration
defJumpAccel = 1.0;		//Default jump acceleration
defFallAccel = 0.2;		//Default fall acceleration
moveAccel = 0.2;		//Object move acceleration
jumpAccel = 1.0;		//Object jump acceleration
fallAccel = 0.2;		//Object fall acceleration
maxMoveAccel = 1.2;		//Maximum move acceleration
maxJumpAccel = 1.5;		//Maximum jump acceleration
maxFallAccel = 1.4;		//Maximum fall acceleration

//3D perspective local variables
d = 0.1;
w = sprite_width;
h = sprite_height;

top_w = w * (1 - d);
top_h = h * (1 - d);

image_speed = 0;
spriteFace = sprite_index;
spikeAngle = 0;
edgeSprite = spriteFace;

angleSprite = [spriteFace, spriteFace, spriteFace, spriteFace];
