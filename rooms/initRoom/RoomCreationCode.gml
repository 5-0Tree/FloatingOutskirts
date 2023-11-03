//Create control object
instance_create_layer(0, 0, "Control", objControl);

//Manage room order
if (room == room_first) {
	global.playerDeaths = 0;
	
	room_goto_next();
}
