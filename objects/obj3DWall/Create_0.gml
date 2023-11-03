/// @description Init Variables

//Inherit parent event
event_inherited();

isRotating = false;
anglePrev = 0;

image_speed = 0;

//Vertex coordinates shorthand
var xx = x + sprite_width,
	yy = y + sprite_height,
	zz = z + groundDepth;

//Top vertex buffer
vBuff[0] = vertex_create_buffer();
texture[0] = sprite_get_texture(sprite_index, 0);

vertex_begin(vBuff[0], global.vFormat);

vertex_create_face(vBuff[0],
	new Vec3(x,  y, zz),
	new Vec3(xx, y, zz),
	new Vec3(xx, y, z ),
	new Vec3(x,  y, z ),
	-1, 1, sprite_width, groundDepth);

vertex_end(vBuff[0]);
vertex_freeze(vBuff[0]);

//Sides vertex buffer
vBuff[1] = vertex_create_buffer();
texture[1] = sprite_get_texture(sprite_index, 0);

vertex_begin(vBuff[1], global.vFormat);

//Left face
vertex_create_face(vBuff[1],
	new Vec3(x,  y,  zz),
	new Vec3(x,  y,  z ),
	new Vec3(x,  yy, z ),
	new Vec3(x,  yy, zz),
	c_ltgray, 1, groundDepth, sprite_height);

//Right face
vertex_create_face(vBuff[1],
	new Vec3(xx, y,  zz),
	new Vec3(xx, y,  z ),
	new Vec3(xx, yy, z ),
	new Vec3(xx, yy, z + groundDepth),
	c_ltgray, 1, groundDepth, sprite_height);

vertex_end(vBuff[1]);
vertex_freeze(vBuff[1]);

//Bottom vertex buffer
vBuff[2] = vertex_create_buffer();
texture[2] = sprite_get_texture(sprite_index, 0);

vertex_begin(vBuff[2], global.vFormat);

vertex_create_face(vBuff[2],
	new Vec3(x,  yy, zz),
	new Vec3(xx, yy, zz),
	new Vec3(xx, yy, z ),
	new Vec3(x,  yy, z ),
	c_gray, 1, sprite_width, groundDepth);

vertex_end(vBuff[2]);
vertex_freeze(vBuff[2]);
