/// @description Create Death Effect

instance_create_depth(x, y, depth, objPlayerDeath, {
	deathFadeFX : other.deathFadeFX,		//Opacity of death FX
	deathFadePos : other.deathFadePos		//Position of death FX
});
