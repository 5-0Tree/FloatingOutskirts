/// @description Create Death Effect

global.playerDeaths ++;

instance_create_depth(x, y, depth - 1, objPlayerDeath, {
	deathFadeFX : other.deathFadeFX,		//Opacity of death FX
	deathFadePos : other.deathFadePos		//Position of death FX
});

with (objCamera) {
	event_perform(ev_other, ev_user8);
}
