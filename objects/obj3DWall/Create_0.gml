/// @description Init Variables

z = depth + groundOffset;

//Vertex coordinates shorthand
var xx = x + sprite_width,
	yy = y + sprite_height,
	zz = z + groundDepth;

//Top vertex buffer
vBuffTop = vertex_create_buffer();
textureTop = sprite_get_texture(sprite_index, 0);

vertex_begin(vBuffTop, global.vFormat);

vertex_create_face(vBuffTop,
	new Vec3(x,  y, zz),
	new Vec3(xx, y, zz),
	new Vec3(xx, y, z ),
	new Vec3(x,  y, z ),
	-1, 1, sprite_width, groundDepth);

vertex_end(vBuffTop);
vertex_freeze(vBuffTop);

//Sides vertex buffer
vBuffSides = vertex_create_buffer();
textureSides = sprite_get_texture(sprite_index, 0);

vertex_begin(vBuffSides, global.vFormat);

//Left face
vertex_create_face(vBuffSides,
	new Vec3(x,  y,  zz),
	new Vec3(x,  y,  z ),
	new Vec3(x,  yy, z ),
	new Vec3(x,  yy, zz),
	c_ltgray, 1, groundDepth, sprite_height);

//Right face
vertex_create_face(vBuffSides,
	new Vec3(xx, y,  zz),
	new Vec3(xx, y,  z ),
	new Vec3(xx, yy, z ),
	new Vec3(xx, yy, z + groundDepth),
	c_ltgray, 1, groundDepth, sprite_height);

vertex_end(vBuffSides);
vertex_freeze(vBuffSides);

//Bottom vertex buffer
vBuffBottom = vertex_create_buffer();
textureBottom = sprite_get_texture(sprite_index, 0);

vertex_begin(vBuffBottom, global.vFormat);

vertex_create_face(vBuffBottom,
	new Vec3(x,  yy, zz),
	new Vec3(xx, yy, zz),
	new Vec3(xx, yy, z ),
	new Vec3(x,  yy, z ),
	c_gray, 1, sprite_width, groundDepth);

vertex_end(vBuffBottom);
vertex_freeze(vBuffBottom);
