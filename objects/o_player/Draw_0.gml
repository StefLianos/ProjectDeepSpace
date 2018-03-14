/// @description draw shadow
draw_sprite_ext(s_player_shadow, 0, x, y+1, 1, -.75, 0, c_white, 0.5);

var flip = 1;
var dir = point_direction(o_player.x,o_player.y-sprite_height/2,mouse_x,mouse_y);

if(dir > 90 and dir <270)
{
	flip = -1;
}
else
{
	flip = 1;
}
//draw player
draw_sprite_ext(sprite_index, image_index, x, y, flip*image_xscale , image_yscale, 0, c_white, 1);

