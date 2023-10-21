/// @description Adjust Player Points

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
			switch (i) {
				//Top left corner (0)
				case 0 :
					_stickyY = (upperL == noone ? _tempPointY + 2 : _tempPointY);
				break;
				//Top right corner (1)
				case 1 :
					_stickyY = (upperR == noone ? _tempPointY + 2 : _tempPointY);
				break;
				//Bottom left corner (2)
				case 2 :
					_stickyY = (bottomL == noone ? 20 : _tempPointY);
					//Move point down if too far left
					_stickyY = (bottomLX == noone && bottomR != noone ? _tempPointY + 4 : _tempPointY);
				break;
				//Bottom right corner (3)
				case 3 : 
					_stickyY = (bottomR == noone ? 20 : _tempPointY);
					//Move point down if too far right
					_stickyY = (bottomRX == noone && bottomL != noone ? _tempPointY + 4 : _tempPointY);
				break;
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
	var _tweenedPoints = tween_points(variable_struct_get(pointList, _pointName), _tempXY, 0.5);
		
	//Set new points
	variable_struct_set(pointList, _pointName, _tweenedPoints);
}

