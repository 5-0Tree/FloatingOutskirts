/// @description Update View Before Respawn

camTweenTo[X] = respawnPos[X];
camTweenTo[Y] = respawnPos[Y];

lookAtTo[X] = respawnLook[X];
lookAtTo[Y] = respawnLook[Y];

camera_set_view_pos(camera, x, y);
