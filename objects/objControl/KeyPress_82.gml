/// @description **DEBUG** - Restart Room/Game

if (global.DEBUGMODE) {
	if (keyboard_check(vk_shift)) {
		game_restart();
	} else {
		room_restart();
	}
}
