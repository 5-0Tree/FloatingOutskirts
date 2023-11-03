/// @description Create Player

depth = 8;

active = true;

respawnPos	= [0, 0];
respawnLook = [0, 0];

if (instance_number(objCamera) == 1) {
	with (objCamera) {
		other.respawnPos[X] = respawnPos[X];
		other.respawnPos[Y] = respawnPos[Y];
		
		other.respawnLook[X] = respawnLook[X];
		other.respawnLook[Y] = respawnLook[Y];
	}
}

event_perform(ev_other, ev_user4);
