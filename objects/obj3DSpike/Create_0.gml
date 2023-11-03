/// @description Init Variables

//Inherit parent event
event_inherited();

//Vertex coordinates shorthand
var hx = sprite_width / 2,
	hy = sprite_height / 2,
	x1 = -hx,
	y1 = -hy,
	x2 = hx,
	y2 = hy,
	zz = groundDepth;

//Bottom vertex buffer
vBuff[0] = vertex_create_buffer();
texture[0] = sprite_get_texture(sprSpikeEdges, 1);

vertex_begin(vBuff[0], global.vFormat);

vertex_create_face(vBuff[0],
	new Vec3(x1, y2, zz),
	new Vec3(x2, y2, zz),
	new Vec3(x2, y2, 0 ),
	new Vec3(x1, y2, 0 ),
	c_ltgray, 1, sprite_width, groundDepth);

vertex_end(vBuff[0]);
vertex_freeze(vBuff[0]);

//Sides vertex buffer
vBuff[1] = vertex_create_buffer();
texture[1] = sprite_get_texture(sprSpikeEdges, 0);

vertex_begin(vBuff[1], global.vFormat);

vertex_create_face(vBuff[1],
	new Vec3(x1, y2, zz),
	new Vec3(0,  0,  zz),
	new Vec3(0,  0,  0 ),
	new Vec3(x1, y2, 0 ),
	-1, 1, sprite_width, groundDepth);
vertex_create_face(vBuff[1],
	new Vec3(x2, y2, zz),
	new Vec3(0,  0,  zz),
	new Vec3(0,  0,  0 ),
	new Vec3(x2, y2, 0 ),
	-1, 1, sprite_width, groundDepth);

vertex_end(vBuff[1]);
vertex_freeze(vBuff[1]);

/*Old buffers:
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
		-1, 1, sprite_width, groundDepth);
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
		-1, 1, sprite_width, groundDepth);
	break;
	case 270 :	//Pointing down
	vertex_create_face(vBuffSides,
		new Vec3(hx, hy, z ),
		new Vec3(xx, y,  z ),
		new Vec3(xx, y,  zz),
		new Vec3(hx, hy, zz),
		-1, 1, sprite_width, groundDepth);
	vertex_create_face(vBuffSides,
		new Vec3(hx, hy, z ),
		new Vec3(x,  y,  z ),
		new Vec3(x,  y,  zz),
		new Vec3(hx, hy, zz),
		-1, 1, sprite_width, groundDepth);
	break;
	case 0 :	//Pointing right
	vertex_create_face(vBuffSides,
		new Vec3(x,  yy, zz),
		new Vec3(hx, hy, zz),
		new Vec3(hx, hy, z ),
		new Vec3(x,  yy, z ),
		-1, 1, sprite_width, groundDepth);
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
		c_ltgray, 1, sprite_width, groundDepth);
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
		c_ltgray, 1, sprite_width, groundDepth);
	break;
	case 0 :	//Left base (pointing right)
	vertex_create_face(vBuffBase,
		new Vec3(x,  y,  zz),
		new Vec3(x,  y,  z ),
		new Vec3(x,  yy, z ),
		new Vec3(x,  yy, zz),
		c_ltgray, 1, groundDepth, sprite_height);
	break;
}

vertex_end(vBuffBase);
vertex_freeze(vBuffBase);
