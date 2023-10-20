/// @description Draw 3D Faces

if (visible) {
	vertex_submit(vBuffTop, pr_trianglelist, textureTop);
	vertex_submit(vBuffSides, pr_trianglelist, textureSides);
	vertex_submit(vBuffBottom, pr_trianglelist, textureBottom);
}
