/// @description Manage Player Variables

var _keyCheck = [
	(global.DEBUGMODE ? keyboard_check(vk_up) : keyboard_check(vk_up) || keyboard_check(ord("W"))),
	(global.DEBUGMODE ? keyboard_check(vk_left) : keyboard_check(vk_left) || keyboard_check(ord("A"))),
	(global.DEBUGMODE ? keyboard_check(vk_down) : keyboard_check(vk_down) || keyboard_check(ord("S"))),
	(global.DEBUGMODE ? keyboard_check(vk_right) : keyboard_check(vk_right) || keyboard_check(ord("D")))],
	_keyCheckPressed = [
	(global.DEBUGMODE ? keyboard_check_pressed(vk_up) : keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))),
	(global.DEBUGMODE ? keyboard_check_pressed(vk_left) : keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))),
	(global.DEBUGMODE ? keyboard_check_pressed(vk_down) : keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))),
	(global.DEBUGMODE ? keyboard_check_pressed(vk_right) : keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")))],
	_keyCheckReleased = [
	(global.DEBUGMODE ? keyboard_check_released(vk_up) : keyboard_check_released(vk_up) || keyboard_check_released(ord("W"))),
	(global.DEBUGMODE ? keyboard_check_released(vk_left) : keyboard_check_released(vk_left) || keyboard_check_released(ord("A"))),
	(global.DEBUGMODE ? keyboard_check_released(vk_down) : keyboard_check_released(vk_down) || keyboard_check_released(ord("S"))),
	(global.DEBUGMODE ? keyboard_check_released(vk_right) : keyboard_check_released(vk_right) || keyboard_check_released(ord("D")))];

//Player direction: -1 = Left | 0 = Idle | 1 = Right
faceDir = (new dir_key_check(global.DEBUGMODE, vkR, wasdR).down - new dir_key_check(global.DEBUGMODE, vkL, wasdL).down);

//Set isMoving variable appropriately
isMoving = (abs(faceDir) > 0);

//Reset jumps when on a solid object
if (collision_line(x + 6, y + 20, x - 6, y + 20, objCollisionParent, true, true) != noone) {
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
		alarm[0] = jumpAmount * (jumpCounter > 1 ? 0.80 : 1.0); //...until maximum jump height is reached...
	}
}

//...stop jumping when jump key is released...
if (new dir_key_check(global.DEBUGMODE, vkU, wasdU).released) {
	isJumping = false;
	jumpSlow = false;
	alarm[0] = -1;
}

//...or stop jumping when head hits object
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

//Store correct varyFrames values in temp variable, then check if they can vary
var _varyVar = variable_struct_get(varyFrames, stateStr),
	_varyState = variable_struct_get(_varyVar, stateDir),
	_canVary = (global.frameCounter % (30) == 0 ? true : false);

//Store correct pointList values in temp variables
var _pointVar = variable_struct_get(pointCoords, stateStr),
	_pointState = variable_struct_get(_pointVar, stateDir);

//Get original point coordinates
var _origPointVar = variable_struct_get(pointCoords, stateStr),
	_origPointState = variable_struct_get(_origPointVar, stateDir);

//Update pointList struct
for (var i = 0; i < array_length(struct_get_names(pointList)); i ++) {
	//Set current point name as temp string
	var _pointName = "_p" + string(i);
	
	//Set new point values as temp variables
	var _tempPointX = variable_struct_get(_origPointState, _pointName)._x,
		_tempPointY = variable_struct_get(_origPointState, _pointName)._y;
	
	//Variables to snap points based on position
	var _stickyX = _tempPointX,
		_stickyY = _tempPointY;
	
	//Apply point variance if applicable
	if ((global.frameCounter > 15 && global.frameCounter < 30 || (global.frameCounter > 45 && global.frameCounter < 60))) {
		//Set variance amount
		var _varyAmountVar = variable_struct_get(pointVary, stateStr),
			_varyAmountState = variable_struct_get(_varyAmountVar, stateDir),
			_varyAmountStatePoint = variable_struct_get(_varyAmountState, _pointName);
		
		//Adjust snap point variance
		_stickyX += _varyAmountStatePoint._x;
		_stickyY += _varyAmountStatePoint._y;
		
		//Create temp struct for x and y coordinates
		var _tempXY = {
			_x : x + _stickyX,
			_y : y + _stickyY
		}
		
		variable_struct_set(pointList, _pointName, _tempXY);
	}
	
	//Temp collision check variables
	var upperL = collision_point(x - 8, y + 20, objCollisionParent, true, true),
		upperR = collision_point(x + 8, y + 20, objCollisionParent, true, true),
		bottomL = collision_point(x - 12, y + 20, objCollisionParent, true, true),
		bottomR = collision_point(x + 12, y + 20, objCollisionParent, true, true),
		bottomLX = collision_point(x + 0, y + 20, objCollisionParent, true, true),
		bottomRX = collision_point(x - 0, y + 20, objCollisionParent, true, true);
	
	if (faceDir == 0) {
		if (!isJumping) {
			//Left side
			if (i == 0) {
				//Upper left corner
				_stickyY = (upperL == noone ? _tempPointY + 2 : _tempPointY);
			}
			if (i == 2) {
				//Bottom left corner
				_stickyY = (bottomL == noone ? 18 : _tempPointY);
				//Move point up if too far left
				_stickyY = (bottomLX == noone && bottomR != noone ? _tempPointY + 2 : _tempPointY);
			}
			//Right side
			if (i == 1) {
				//Upper right corner
				_stickyY = (upperR == noone ? _tempPointY + 2 : _tempPointY);
			}
			if (i == 3) {
				//Bottom right corner
				_stickyY = (bottomR == noone ? 18 : _tempPointY);
				//Move point up if too far right
				_stickyY = (bottomRX == noone && bottomL != noone ? _tempPointY + 2 : _tempPointY);
			}
		}
	} else if (sign(faceDir < 0)) {
		//Left edge
		if (i == 0 || i == 2) {
			_stickyX = (place_meeting(x - 4, y, objCollisionParent) ? -16 : _tempPointX);
		}
	} else if (sign(faceDir > 0)) {
		//Right edge
		if (i == 1 || i == 3) {
			_stickyX = (place_meeting(x + 4, y, objCollisionParent) ? 16 : _tempPointX);
		}
	}
	
	//Create temp struct for x and y coordinates
	var _tempXY = {
		_x : x + _stickyX,
		_y : y + _stickyY
	}
	
	//Perform tweening
	var _tweenedPoints = tween_points(variable_struct_get(pointList, _pointName), _tempXY, 0.35);
		
	//Set new points
	variable_struct_set(pointList, _pointName, _tweenedPoints);
}
