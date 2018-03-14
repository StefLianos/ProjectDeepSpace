///@param x
///@param y
///@param HP
///@param MAX_HP
///@param sprite_h

var xx = argument0;
var yy = argument1;
var HP = argument2;
var MAX_HP = argument3;
var sprite_h = argument4;

//draw health bar

//draw bg
draw_sprite_ext(s_health_back,0,xx,y-sprite_h-3,1,1,0,c_white,1);

//draw inner
if(HP <= MAX_HP/3)
{
	draw_sprite_ext(s_health_low,0,xx-7,yy-sprite_h-5,(HP/MAX_HP),1,0,c_white,1);
}
else{draw_sprite_ext(s_health_inside,0,xx-7,yy-sprite_h-5,(HP/MAX_HP),1,0,c_white,1);}

//draw border
draw_sprite_ext(s_health_border,0,xx,yy-sprite_h-3,1,1,0,c_white,1);