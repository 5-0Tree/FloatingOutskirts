/// @description Draw Editor Interface

//Editor variables shorthand
var	_create	= global.EDITOR.MODE.CREATE,
	_test	= global.EDITOR.MODE.TEST,
	_pause	= global.EDITOR.MODE.PAUSE,
	_gui	= global.EDITOR.GUI,
	_tool	= _gui.TOOLBAR,
	_side	= _gui.SIDEBAR;

//Mouse position
var _mx = window_mouse_get_x(),
	_my = window_mouse_get_y();

surface_set_target(_gui.SURF);
surf_set();

///CREATE Interface 
if (_create) {
	#region Panels
	
	//Shadow
	draw_set_color(#000000);
	draw_set_alpha(0.5);
	draw_rectangle(_side._W + 9, 0, _tool._W, _tool._H + 8, false);
	draw_rectangle(0, 0, _side._W + 8, _side._H, false);
	
	//Panels
	draw_set_color(#FFFFFF);
	draw_set_alpha(1.0);
	draw_rectangle(0, 0, _tool._W, _tool._H, false);
	draw_rectangle(0, 0, _side._W, _side._H, false);
	
	#endregion
	
	#region Toolbar
	
	surf_set(_tool.SURF);
	draw_set_color(#000000);
	
	draw_set_font(fontGUI);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	var _str_w	= 0,
		_margin	= 3;
	
	for (var i = 0; i < array_length(_tool.CAT); i ++) {
		//Position of buttons + text
		var _is = _tool.CAT[i],
			_iw = string_width(_is),
			_ih = string_height(_is),
			_ix = gui_padding + _str_w,
			_iy = gui_padding * 2,
			__p = {
				x1 : _side._W + _ix - _margin,
				y1 : gui_padding + _margin,
				x2 : _side._W + _ix + _iw + _margin,
				y2 : _ih + gui_padding - _margin
			};
		
		//Colors of buttons + text
		var _sel		= _tool.SEL,
			_hover		= point_in_rectangle(_mx, _my, __p.x1, __p.y1, __p.x2, __p.y2),
			_button_c	= (i == _sel ? merge_color(gui_cols[i], GUI_COL_BUTTON_SEL, 0.50) : merge_color(gui_cols[i], GUI_COL_BUTTON_TOP, 0.25)),
			_text_c		= (i == _sel ? merge_color(GUI_COL_TEXT, GUI_COL_BUTTON_BOT, 0.25) : merge_color(GUI_COL_TEXT, GUI_COL_BUTTON_BOT, 0.10)),
			_col		= [(_hover ? merge_color(_button_c, GUI_COL_BUTTON_TOP, 0.50) : merge_color(_button_c, GUI_COL_BUTTON_TOP, 0.25)),
						   (_hover ? merge_color(_button_c, GUI_COL_BUTTON_TOP, 0.25) : merge_color(_button_c, GUI_COL_BUTTON_TOP, 0.10)),
						   (_hover ? merge_color(_text_c, GUI_COL_BUTTON_TOP, 0.10) : _text_c),
						   (_hover ? merge_color(_text_c, GUI_COL_BUTTON_BOT, 0.10) : _text_c)];
		
		//Draw buttons + text
		draw_rectangle_color(__p.x1, __p.y1, __p.x2, __p.y2, _col[0], _col[0], _col[1], _col[1], false);
		draw_rectangle_color(__p.x1, __p.y1, __p.x2, __p.y2, _col[1], _col[1], _col[0], _col[0], true);
		draw_text_color(_side._W + _ix, _iy, _is, _col[2], _col[2], _col[3], _col[3], 1.0);
		
		//Draw selection underline
		if (i == _sel) {
			draw_line_width_color(__p.x1 - _margin, __p.y2 + _margin * 2, __p.x2 + _margin, __p.y2 + _margin * 2, 3, gui_cols[i], gui_cols[i]);
		}
		
		//Select button if clicked
		if (_hover) {
			if (mouse_check_button_pressed(mb_left)) {
				global.EDITOR.GUI.TOOLBAR.SEL = i;
			}
		}
		
		_str_w += gui_padding + _iw;
	}
	
	#endregion
}

#region PAUSE Interface



#endregion

#region TEST Interface



#endregion

surface_reset_target();

draw_surface_ext(_gui.SURF, 0, 0, 1, 1, 0, #FFFFFF, 0.8);
draw_surface(_tool.SURF, 0, 0);
draw_surface(_side.SURF, gui_padding, _tool._H + gui_padding);
