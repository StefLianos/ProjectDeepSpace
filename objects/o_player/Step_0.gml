/// @description

//1 if right //0 if both // -1 if left
var h_input = keyboard_check(vk_right) - keyboard_check(vk_left);

if(h_input != 0)
{
	speed_[h] += h_input*acceleration_;
	speed_[h] = clamp(speed_[h], -max_speed_, max_speed_);
}
else
{
	speed_[h] = lerp(speed_[h],0,friction_);
}

//1 if right //0 if both // -1 if left
var v_input = keyboard_check(vk_down) - keyboard_check(vk_up);

if(v_input != 0)
{
	speed_[v] += v_input*acceleration_;
	speed_[v] = clamp(speed_[v], -max_speed_, max_speed_);
}
else
{
	speed_[v] = lerp(speed_[v],0,friction_);
	
}

scr_move(speed_);
