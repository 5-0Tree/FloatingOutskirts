/// @description Clear Buffers

for (var i = 0; i < array_length(vBuff); i ++) {
	vertex_delete_buffer(vBuff[i]);
}
