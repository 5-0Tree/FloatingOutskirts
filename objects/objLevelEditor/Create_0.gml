/// @description Init Variables

gui_padding = 16;
gui_content = 48;
gui_w		= window_get_width();
gui_h		= window_get_height();
gui_cols	= [GUI_COL_PLACE, GUI_COL_DELETE, GUI_COL_SELECT, GUI_COL_PROP];

global.DEBUGMODE = true;
global.EDITOR = {
	MODE : {
		TEST : false,
		PAUSE : false,
		CREATE : true
	},
	POS : {
		TRANSFORM : {
			TRANSLATE : {
				_X : 0,
				_Y : 0,
				_Z : 0
			},
			ROTATE : {
				_X : 0,
				_Y : 0,
				_Z : 0
			},
			SCALE : {
				_X : 1,
				_Y : 1,
				_Z : 1
			},
		},
		CELL : {
			_W : 64,
			_H : 64,
		},
		DEPTH : 0,
		ANGLE : 270,
		PITCH : 0,
		ZOOM : 1
	},
	LAYER : 0,
	GRID : surface_create(room_width + 2, room_height + 2),
	SELECTED : ds_list_create(),
	HISTORY : ds_list_create(), //TODO: Undo + Redo
	GUI : {
		SURF : surface_create(gui_w, gui_h),
		TOOLBAR : {
			_W : gui_w,
			_H : gui_content + gui_padding,
			STATE : GUI_EXPANDED,
			SURF : surface_create(gui_w, gui_content + gui_padding),
			CAT : ["Place", "Delete", "Select", "Properties"],
			SEL : 0
		},
		SIDEBAR : {
			_W : gui_content * 4 + gui_padding * 2,
			_H : gui_h,
			STATE : GUI_EXPANDED,
			SURF : surface_create(gui_content * 4, gui_h),
			OPTIONS : {
				CAT : ["Player", "Blocks", "Panels", "Hazards", "Barriers"],
				SEL : 0
			},
			CONTENT : {
				CAT : {
					"Player" : [
						objSpawnPoint
					],
					"Blocks" : [
						objBlockLevel1_1x1
					],
					"Panels" : [
						objPanelLevel1
					],
					"Hazards" : [
						objSpikeUp,
						objSpikeLeft,
						objSpikeDown,
						objSpikeRight
					],
					"Barriers" : [
						objInvisibleBarrier,
						objDeathBarrier
					]
				},
				SEL : {
					"Player" : 0,
					"Blocks" : 0,
					"Panels" : 0,
					"Hazards" : 0,
					"Barriers" : 0
				}
			}
		}
	}
}

#region Vertex Buffers

//Vertex coordinates shorthand
var x1 = -1,
	y1 = -1,
	z1 = -1,
	x2 = 65,
	y2 = 65,
	z2 = 65,
	xc = x2 / 2,
	yc = y2 / 2;

//Top buffer
vBuff[0] = vertex_create_buffer();
vertex_begin(vBuff[0], global.vFormat);

vertex_create_outline(vBuff[0],
	#FFFFFF, 0.6,
	new Vec3(x1, y1, z2),
	new Vec3(x2, y1, z2),
	new Vec3(x2, y1, z1),
	new Vec3(x1, y1, z1),
	new Vec3(x1, y1, z2));

vertex_end(vBuff[0]);

//Bottom buffer
vBuff[1] = vertex_create_buffer();
vertex_begin(vBuff[1], global.vFormat);

vertex_create_outline(vBuff[1],
	#FFFFFF, 0.6,
	new Vec3(x1, y2, z2),
	new Vec3(x2, y2, z2),
	new Vec3(x2, y2, z1),
	new Vec3(x1, y2, z1),
	new Vec3(x1, y2, z2));

vertex_end(vBuff[1]);

//Left buffer
vBuff[2] = vertex_create_buffer();
vertex_begin(vBuff[2], global.vFormat);

vertex_create_outline(vBuff[2],
	#FFFFFF, 0.6,
	new Vec3(x1, y1, z2),
	new Vec3(x1, y1, z1),
	new Vec3(x1, y2, z1),
	new Vec3(x1, y2, z2),
	new Vec3(x1, y1, z2));

vertex_end(vBuff[2]);

//Right buffer
vBuff[3] = vertex_create_buffer();
vertex_begin(vBuff[3], global.vFormat);

vertex_create_outline(vBuff[3],
	#FFFFFF, 0.6,
	new Vec3(x2, y1, z2),
	new Vec3(x2, y1, z1),
	new Vec3(x2, y2, z1),
	new Vec3(x2, y2, z2),
	new Vec3(x2, y1, z2));

vertex_end(vBuff[3]);

#endregion
