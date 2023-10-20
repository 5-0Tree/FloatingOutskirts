
vertex_format_begin();

vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_color();

global.vFormat = vertex_format_end();

function vertex_create_face(_vBuff, _p1, _p2, _p3, _p4, _color, _alpha, _width, _height) {
	static _texSize = 64;
	var _texW = _width / _texSize,
		_texH = _height / _texSize;
	
	//First triangle
	vertex_position_3d(_vBuff, _p1.x, _p1.y, _p1.z);
	vertex_texcoord(_vBuff, 0, 0);
	vertex_color(_vBuff, _color, _alpha);
	
	vertex_position_3d(_vBuff, _p2.x, _p2.y, _p2.z);
	vertex_texcoord(_vBuff, _texW, 0);
	vertex_color(_vBuff, _color, _alpha);
	
	vertex_position_3d(_vBuff, _p3.x, _p3.y, _p3.z);
	vertex_texcoord(_vBuff, _texW, _texH);
	vertex_color(_vBuff, _color, _alpha);
	
	//Second triangle
	vertex_position_3d(_vBuff, _p1.x, _p1.y, _p1.z);
	vertex_texcoord(_vBuff, 0, 0);
	vertex_color(_vBuff, _color, _alpha);
	
	vertex_position_3d(_vBuff, _p3.x, _p3.y, _p3.z);
	vertex_texcoord(_vBuff, _texW, _texH);
	vertex_color(_vBuff, _color, _alpha);
	
	vertex_position_3d(_vBuff, _p4.x, _p4.y, _p4.z);
	vertex_texcoord(_vBuff, 0, _texH);
	vertex_color(_vBuff, _color, _alpha);
}

function vertex_create_triangle(_vBuff, _p1, _p2, _p3, _color, _alpha, _width, _height) {
	static _texSize = 64;
	var _texW = _width / _texSize,
		_texH = _height / _texSize;
	
	//First triangle
	vertex_position_3d(_vBuff, _p1.x, _p1.y, _p1.z);
	vertex_texcoord(_vBuff, 0, 0);
	vertex_color(_vBuff, _color, _alpha);
	
	vertex_position_3d(_vBuff, _p2.x, _p2.y, _p2.z);
	vertex_texcoord(_vBuff, _texW, 0);
	vertex_color(_vBuff, _color, _alpha);
	
	vertex_position_3d(_vBuff, _p3.x, _p3.y, _p3.z);
	vertex_texcoord(_vBuff, _texW, _texH);
	vertex_color(_vBuff, _color, _alpha);
	
}
