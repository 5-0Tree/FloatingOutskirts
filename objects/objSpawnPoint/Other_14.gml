/// @description Spawn Player

if (active) {
	if (!instance_exists(objPlayer)) {
		instance_create_layer(x, y, "Instances", objPlayer);
	}
}
