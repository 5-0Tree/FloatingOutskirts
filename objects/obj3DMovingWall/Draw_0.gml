/// @description Draw 3D Faces

if (visible) {
	for (var i = 0; i < array_length(vBuff); i ++) {
		vertex_submit(vBuff[i], pr_trianglelist, texture[i]);
	}
}
