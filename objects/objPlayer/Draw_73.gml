/// @description Draw Player

//Draw player coordinates using point list
draw_primitive_begin(pr_trianglestrip);
for (var i = 0; i < array_length(struct_get_names(pointList)); i ++) {
	draw_vertex(variable_struct_get(pointList, "_p" + string(i))._x, variable_struct_get(pointList, "_p" + string(i))._y);
}
draw_primitive_end();

//Store prior alpha value to revert to later
var _prevAlpha = draw_get_alpha();

//Draw double-jump FX ring
if (jumpFadeFX > 0) {
	draw_sprite_ext(sprJumpRing, 0, lastJump[X], lastJump[Y], 1, 1, lastJumpDir * 12, #FFFFFF, jumpFadeFX);
}
