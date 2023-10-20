/// @description Draw Object Depth

draw_self();

/*
//Vertex arrays
var topLeft, topRight, bottomLeft, bottomRight;

//Calculate vertices of the base rectangle (1)
topLeft[1, X] = x - w / 2;
topLeft[1, Y] = y - h / 2;

topRight[1, X] = x + w / 2;
topRight[1, Y] = y - h / 2;

bottomRight[1, X] = x + w / 2;
bottomRight[1, Y] = y + h / 2;

bottomLeft[1, X] = x - w / 2;
bottomLeft[1, Y] = y + h / 2;

//Distance to camera center
var cam_x = camera_get_view_x(view_camera[0]),
	cam_y = camera_get_view_y(view_camera[0]),
	cam_w = global.VW,
	cam_h = global.VH;

var camCenter;
camCenter[X] = cam_x + cam_w / 2;
camCenter[Y] = cam_y + cam_h / 2;

//Calculate offset to camera center
var camOffset;
camOffset[X] = x - camCenter[X];
camOffset[Y] = y - camCenter[Y];

//Set center point of the bigger rectangle
var topPos;
topPos[X] = x - (camOffset[X] * d);
topPos[Y] = y - (camOffset[Y] * d);

//Calculate vertices of the smaller rectangle (0)
topLeft[0, X] = topPos[X] - top_w / 2;
topLeft[0, Y] = topPos[Y] - top_h / 2;

topRight[0, X] = topPos[X] + top_w / 2;
topRight[0, Y] = topPos[Y] - top_h / 2;

bottomRight[0, X] = topPos[X] + top_w / 2;
bottomRight[0, Y] = topPos[Y] + top_h / 2;

bottomLeft[0, X] = topPos[X] - top_w / 2;
bottomLeft[0, Y] = topPos[Y] + top_h / 2;

//Determine which faces are visible
var topVisible = topLeft[1, Y] > topLeft[0, Y],
	rightVisible = topRight[1, X] < topRight[0, X],
	bottomVisible = bottomLeft[1, Y] < bottomLeft[0, Y],
	leftVisible = topLeft[1, X] > topLeft[0, X];

if (isVisible) {
	//Draw the faces, depending on object type
	if (object_get_parent(object_index) == objSpikeParent) {
		//Draw the back face sprite
		draw_sprite_pos(angleSprite[spikeAngle], image_index, topLeft[0, X], topLeft[0, Y], topRight[0, X], topRight[0, Y], bottomRight[0, X], bottomRight[0, Y], bottomLeft[0, X], bottomLeft[0, Y], 1);
		
		//Draw the sides
		if (spikeAngle == 0) {
			//Left 0 deg
			draw_sprite_pos(edgeSprite, 0, topRight[1, X], topRight[1, Y], topRight[0, X], topRight[0, Y], bottomLeft[0, X], bottomLeft[0, Y], bottomLeft[1, X], bottomLeft[1, Y], 1);
			
			//Right 0 deg
			draw_sprite_pos(edgeSprite, 0, topLeft[1, X], topLeft[1, Y], topLeft[0, X], topLeft[0, Y], bottomRight[0, X], bottomRight[0, Y], bottomRight[1, X], bottomRight[1, Y], 1);
			
			//Bottom
			draw_sprite_pos(edgeSprite, 2, bottomLeft[0, X], bottomLeft[0, Y], bottomRight[0, X], bottomRight[0, Y], bottomRight[1, X], bottomRight[1, Y], bottomLeft[1, X], bottomLeft[1, Y], bottomVisible);
		} else if (spikeAngle == 1) {
			//Left 90 deg
			draw_sprite_pos(edgeSprite, 1, topRight[1, X], topRight[1, Y], topRight[0, X], topRight[0, Y], bottomLeft[0, X], bottomLeft[0, Y], bottomLeft[1, X], bottomLeft[1, Y], 1);
			
			//Right 90 deg
			draw_sprite_pos(edgeSprite, 0, topLeft[1, X], topLeft[1, Y], topLeft[0, X], topLeft[0, Y], bottomRight[0, X], bottomRight[0, Y], bottomRight[1, X], bottomRight[1, Y], 1);
			
			//Right
			draw_sprite_pos(edgeSprite, 2, topRight[0, X], topRight[0, Y], topRight[1, X], topRight[1, Y], bottomRight[1, X], bottomRight[1, Y], bottomRight[0, X], bottomRight[0, Y], rightVisible);
		} else if (spikeAngle == 2) {
			//Left 180 deg
			draw_sprite_pos(edgeSprite, 1, topRight[1, X], topRight[1, Y], topRight[0, X], topRight[0, Y], bottomLeft[0, X], bottomLeft[0, Y], bottomLeft[1, X], bottomLeft[1, Y], 1);
			
			//Right 180 deg
			draw_sprite_pos(edgeSprite, 1, topLeft[1, X], topLeft[1, Y], topLeft[0, X], topLeft[0, Y], bottomRight[0, X], bottomRight[0, Y], bottomRight[1, X], bottomRight[1, Y], 1);
			
			//Top
			draw_sprite_pos(edgeSprite, 2, topLeft[1, X], topLeft[1, Y], topRight[1, X], topRight[1, Y], topRight[0, X], topRight[0, Y], topLeft[0, X], topLeft[0, Y], topVisible);
		} else if (spikeAngle == 3) {
			//Left -90 deg
			draw_sprite_pos(edgeSprite, 0, topRight[1, X], topRight[1, Y], topRight[0, X], topRight[0, Y], bottomLeft[0, X], bottomLeft[0, Y], bottomLeft[1, X], bottomLeft[1, Y], 1);
			
			//Right -90 deg
			draw_sprite_pos(edgeSprite, 1, topLeft[1, X], topLeft[1, Y], topLeft[0, X], topLeft[0, Y], bottomRight[0, X], bottomRight[0, Y], bottomRight[1, X], bottomRight[1, Y], 1);
			
			//Left
			draw_sprite_pos(edgeSprite, 2, topLeft[1, X], topLeft[1, Y], topLeft[0, X], topLeft[0, Y], bottomLeft[0, X], bottomLeft[0, Y], bottomLeft[1, X], bottomLeft[1, Y], leftVisible);
		}
		
		//Draw the front face sprite
		draw_sprite_pos(angleSprite[spikeAngle], image_index, topLeft[1, X], topLeft[1, Y], topRight[1, X], topRight[1, Y], bottomRight[1, X], bottomRight[1, Y], bottomLeft[1, X], bottomLeft[1, Y], 1);
	} else if (object_get_parent(object_index) != objPanelParent) {
		//Draw the back face sprite
		draw_sprite_pos(spriteFace, 0, topLeft[0, X], topLeft[0, Y], topRight[0, X], topRight[0, Y], bottomRight[0, X], bottomRight[0, Y], bottomLeft[0, X], bottomLeft[0, Y], 1);
		
		//Top
		draw_sprite_pos(spriteFace, 0, topLeft[1, X], topLeft[1, Y], topRight[1, X], topRight[1, Y], topRight[0, X], topRight[0, Y], topLeft[0, X], topLeft[0, Y], topVisible);
		
		//Right
		draw_sprite_pos(spriteFace, 0, topRight[0, X], topRight[0, Y], topRight[1, X], topRight[1, Y], bottomRight[1, X], bottomRight[1, Y], bottomRight[0, X], bottomRight[0, Y], rightVisible);
		
		//Bottom
		draw_sprite_pos(spriteFace, 0, bottomLeft[0, X], bottomLeft[0, Y], bottomRight[0, X], bottomRight[0, Y], bottomRight[1, X], bottomRight[1, Y], bottomLeft[1, X], bottomLeft[1, Y], bottomVisible);
		
		//Left
		draw_sprite_pos(spriteFace, 0, topLeft[1, X], topLeft[1, Y], topLeft[0, X], topLeft[0, Y], bottomLeft[0, X], bottomLeft[0, Y], bottomLeft[1, X], bottomLeft[1, Y], leftVisible);
		
		//Draw the front face sprite
		draw_sprite_pos(spriteFace, 0, topLeft[1, X], topLeft[1, Y], topRight[1, X], topRight[1, Y], bottomRight[1, X], bottomRight[1, Y], bottomLeft[1, X], bottomLeft[1, Y], 1);
	} else {
		//Draw the panel face sprite
		draw_sprite_pos(spriteFace, 0, topLeft[0, X], topLeft[0, Y], topRight[0, X], topRight[0, Y], bottomRight[0, X], bottomRight[0, Y], bottomLeft[0, X], bottomLeft[0, Y], 1);
	}
}
