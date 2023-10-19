/// @description Init Variables

z = depth + groundOffset;

//Top vertex buffer
vBuffTop = vertex_create_buffer();
textureTop = sprite_get_texture(sprBlock, 0);

vertex_begin(vBuffTop, global.vFormat);

vertex_create_face(vBuffTop,
	new Vec3(x, y, z + groundDepth),
	new Vec3(x + sprite_width, y, z + groundDepth),
	new Vec3(x + sprite_width, y, z),
	new Vec3(x, y, z),
	-1, 1, sprite_width, groundDepth);

vertex_end(vBuffTop);
vertex_freeze(vBuffTop);
