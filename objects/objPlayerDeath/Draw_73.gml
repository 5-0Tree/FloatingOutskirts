/// @description Draw Shards

//Main shards
draw_death_shards(sprPlayerShardsBig, deathFrames, x, y, image_angle, deathFadePos, image_blend, 1, deathFadeFX);

//Smaller shards
draw_death_shards(sprPlayerShardsSmall, deathFrames, x, y, angle_2, deathFadePos * 1.5, image_blend, 0.8, deathFadeFX);
