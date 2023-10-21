/// @description Fade Limit

if (deathFadeFX < 0.2) {
	deathFadeFX = 0;
	alarm[1] = 20; //Time until reset
} else {
	deathFadeFX -= 0.1;
	alarm[0] = 1; //Repeat this alarm
}
