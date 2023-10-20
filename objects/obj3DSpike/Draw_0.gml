/// @description Draw 3D Faces

if (visible) {
	vertex_submit(vBuffBase, pr_trianglelist, textureBase);
	vertex_submit(vBuffSides, pr_trianglelist, textureSides);
	//vertex_submit(vBuffFace, pr_trianglelist, textureFace);
}
