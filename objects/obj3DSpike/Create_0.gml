/// @description Init Variables

image_speed = 0;

z = depth + groundOffset;

//Vertex coordinates shorthand
var xx = x + sprite_width,
	yy = y + sprite_height,
	zz = z + groundDepth,
	hx = x + sprite_width / 2,
	hy = y + sprite_height / 2,
	hz = z + groundDepth / 2;

//Sides vertex buffer
vBuffSides = vertex_create_buffer();
textureSides = sprite_get_texture(sprSpikeEdges, 0);

vertex_begin(vBuffSides, global.vFormat);

switch (image_angle) {
	case 90 :	//Pointing up
	vertex_create_face(vBuffSides,
		new Vec3(x,  yy, zz),
		new Vec3(hx, hy, zz),
		new Vec3(hx, hy, z ),
		new Vec3(x,  yy, z ),
		-1, 1, sprite_width, groundDepth);
	vertex_create_face(vBuffSides,
		new Vec3(xx, yy, zz),
		new Vec3(hx, hy, zz),
		new Vec3(hx, hy, z ),
		new Vec3(xx, yy, z ),
		c_ltgray, 1, sprite_width, groundDepth);
	break;
	case 180 :	//Pointing left
	vertex_create_face(vBuffSides,
		new Vec3(xx, y,  zz),
		new Vec3(hx, hy, zz),
		new Vec3(hx, hy, z ),
		new Vec3(xx, y,  z ),
		-1, 1, sprite_width, groundDepth);
	vertex_create_face(vBuffSides,
		new Vec3(xx, yy, zz),
		new Vec3(hx, hy, zz),
		new Vec3(hx, hy, z ),
		new Vec3(xx, yy, z ),
		c_gray, 1, sprite_width, groundDepth);
	break;
	case 270 :	//Pointing down
	vertex_create_face(vBuffSides,
		new Vec3(xx, y, zz),
		new Vec3(hx, hy, zz),
		new Vec3(hx, hy, z ),
		new Vec3(xx, y, z ),
		-1, 1, sprite_width, groundDepth);
	vertex_create_face(vBuffSides,
		new Vec3(x,  y,  zz),
		new Vec3(hx, hy, zz),
		new Vec3(hx, hy, z ),
		new Vec3(x,  y,  z ),
		c_ltgray, 1, sprite_width, groundDepth);
	break;
	case 0 :	//Pointing right
	vertex_create_face(vBuffSides,
		new Vec3(x,  yy, zz),
		new Vec3(hx, hy, zz),
		new Vec3(hx, hy, z ),
		new Vec3(x,  yy, z ),
		c_gray, 1, sprite_width, groundDepth);
	vertex_create_face(vBuffSides,
		new Vec3(x,  y,  zz),
		new Vec3(hx, hy, zz),
		new Vec3(hx, hy, z ),
		new Vec3(x,  y,  z ),
		-1, 1, sprite_width, groundDepth);
	break;
}


vertex_end(vBuffSides);
vertex_freeze(vBuffSides);

//Bottom vertex buffer
vBuffBase = vertex_create_buffer();
textureBase = sprite_get_texture(sprSpikeEdges, 2);

vertex_begin(vBuffBase, global.vFormat);

switch (image_angle) {
	case 90 :	//Bottom base (pointing up)
	vertex_create_face(vBuffBase,
		new Vec3(x,  yy, zz),
		new Vec3(xx, yy, zz),
		new Vec3(xx, yy, z ),
		new Vec3(x,  yy, z ),
		c_gray, 1, sprite_width, groundDepth);
	break;
	case 180 :	//Right base (pointing left)
	vertex_create_face(vBuffBase,
		new Vec3(xx, y,  zz),
		new Vec3(xx, y,  z ),
		new Vec3(xx, yy, z ),
		new Vec3(xx, yy, zz),
		c_ltgray, 1, groundDepth, sprite_height);
	break;
	case 270 :	//Top base (pointing down)
	vertex_create_face(vBuffBase,
		new Vec3(x,  y, zz),
		new Vec3(xx, y, zz),
		new Vec3(xx, y, z ),
		new Vec3(x,  y, z ),
		-1, 1, sprite_width, groundDepth);
	break;
	case 0 :	//Left base (pointing right)
	vertex_create_face(vBuffBase,
		new Vec3(x,  y,  zz),
		new Vec3(x,  y,  z ),
		new Vec3(x,  yy, z ),
		new Vec3(x,  yy, zz),
		c_gray, 1, groundDepth, sprite_height);
	break;
}

vertex_end(vBuffBase);
vertex_freeze(vBuffBase);

//Face vertex buffer
//vBuffFace = vertex_create_buffer();
//textureFace = sprite_get_texture(sprite_index, 0);
//
//vertex_begin(vBuffFace, global.vFormat);
//
//switch (image_angle) {
//	case 90 :	//Pointing up
//	vertex_create_triangle(vBuffFace,
//		new Vec3(x,  yy, z ),
//		new Vec3(hx, hy, z ),
//		new Vec3(xx, yy, z ),
//		-1, 1, sprite_width, groundDepth);
//	break;
//	case 180 :	//Pointing left
//	vertex_create_triangle(vBuffFace,
//		new Vec3(xx, yy, z ),
//		new Vec3(hx, hy, z ),
//		new Vec3(xx, y,  z ),
//		-1, 1, groundDepth, sprite_height);
//	break;
//	case 270 :	//Pointing down
//	vertex_create_triangle(vBuffFace,
//		new Vec3(x,  y,  z ),
//		new Vec3(hx, hy, z ),
//		new Vec3(xx, y,  z ),
//		-1, 1, sprite_width, groundDepth);
//	break;
//	case 0 :	//Pointing right
//	vertex_create_triangle(vBuffFace,
//		new Vec3(x,  y,  z ),
//		new Vec3(hx, hy, z ),
//		new Vec3(x,  yy, z ),
//		-1, 1, groundDepth, sprite_height);
//	break;
//}
//
//vertex_end(vBuffFace);
//vertex_freeze(vBuffFace);
