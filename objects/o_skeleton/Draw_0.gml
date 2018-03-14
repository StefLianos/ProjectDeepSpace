/// @description Insert description here//draw shadow
draw_sprite_ext(s_player_shadow, 0, x, y+1, 1, -.75, 0, c_white, 0.5);

if(direction > 45 and direction < 135)
{
	if(path_speed == 0)
	{
		sprite_index = s_skeleton_idle_up;
	}
	else
	{
		sprite_index = s_skeleton_up
	}
}
else
{
	if(path_speed == 0)
	{
		sprite_index = s_skeleton_idle;
	}
	else
	{
		sprite_index = s_skeleton_walk;
	}
}

var flip = 0;

if(direction > 90 and direction <270)
{
	flip = -1;
}
else
{
	flip = 1;
}

//draw
draw_sprite_ext(sprite_index, image_index, x, y, flip*image_xscale , image_yscale, 0, c_white, 1);

//draw health
scr_draw_health(x,y,HP,MAX_HP,sprite_height);

