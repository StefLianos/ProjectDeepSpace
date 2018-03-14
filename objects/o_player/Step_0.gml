/// @description

//1 if right //0 if both // -1 if left
var h_input = keyboard_check(vk_right) - keyboard_check(vk_left);

//1 if down //0 if both // -1 if up
var v_input = keyboard_check(vk_down) - keyboard_check(vk_up);


//horizontal movement
if(h_input != 0)
{
	speed_[h] += h_input*acceleration_;
	if(v_input != 0)
	{
		//reduce diagonal speed
		speed_[h] = clamp(speed_[h], -max_speed_/1.5, max_speed_/1.5);
	}
	else
	{
		speed_[h] = clamp(speed_[h], -max_speed_, max_speed_);
	}
}
else
{
	speed_[h] = lerp(speed_[h],0,friction_);
}


//vertical movement
if(v_input != 0)
{
	speed_[v] += v_input*acceleration_;
	if(h_input != 0)
	{
		//reduce diagonal speed
		speed_[v] = clamp(speed_[v], -max_speed_/1.5, max_speed_/1.5);
	}
	else
	{
		speed_[v] = clamp(speed_[v], -max_speed_, max_speed_);
	}
}
else
{
	speed_[v] = lerp(speed_[v],0,friction_);
	
}

scr_move(speed_);


//get mouse dir
var dir = point_direction(o_player.x,o_player.y-sprite_height/2,mouse_x,mouse_y);
//set sprite speed and index depending on speed

//look down
if (dir > 45 and dir < 135)
{
	//idle
	if (h_input == 0 and v_input == 0)
	{
		sprite_index = s_player_up_idle;
	}
	else
	{
		sprite_index = s_player_up;
	}
}
else
{
	if (h_input == 0 and v_input == 0)
	{
		sprite_index = s_player_idle;
	}
	else
	{
		sprite_index = s_player_walk;
	}
}