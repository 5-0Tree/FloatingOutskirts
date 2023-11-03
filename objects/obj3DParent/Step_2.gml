/// @description Update Visibility

//Set object angle
if (anglePrev != image_angle) {
	isTransforming = true;
	anglePrev = image_angle;
} else {
	isTransforming = false;
}

//Set object visibility
visible = visible_radius(x, y);
