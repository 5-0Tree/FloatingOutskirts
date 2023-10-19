/// @description Draw Block Faces Above

with (objObjectParent) {
	if (object_index != objPlayer && visible && isVisible) {
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
		
		//Draw the faces, depending on object type
		if (object_get_parent(object_index) != objPanelParent && object_get_parent(object_index) != objSpikeParent) {
			//Draw the front face sprite
			draw_sprite_pos(spriteFace, 0, topLeft[1, X], topLeft[1, Y], topRight[1, X], topRight[1, Y], bottomRight[1, X], bottomRight[1, Y], bottomLeft[1, X], bottomLeft[1, Y], 1);
		}
	}
}
