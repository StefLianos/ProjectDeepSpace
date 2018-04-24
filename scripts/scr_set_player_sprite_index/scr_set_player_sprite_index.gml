///@param h_input
///@param v_input
///@param dir


var h_input = argument0;
var v_input = argument1;
var dir = argument2;

var index;
//look up
if (dir > 60 and dir < 120)
{
	//idle
	if (h_input == 0 and v_input == 0)
	{
		index = s_player_up_idle;
	}
	else
	{
		index = s_player_up;
	}
}
//look down
else if (dir > 240 and dir < 300)
{
	//idle
	if (h_input == 0 and v_input == 0)
	{
		index = s_player_down_idle;
	}
	else
	{
		index = s_player_down;
	}
}
//look diag up
else if ((dir > 30 and dir < 60)or(dir > 120 and dir <150))
{
	//idle
	if (h_input == 0 and v_input == 0)
	{
		index = s_player_diag_up_idle;
	}
	else
	{
		index = s_player_diag_up;
	}
}
//look diag down
else if ((dir > 210 and dir < 240)or(dir > 300 and dir < 330))
{
	//idle
	if (h_input == 0 and v_input == 0)
	{
		index = s_player_diag_down_idle;
	}
	else
	{
		index = s_player_diag_down;
	}
}
else
{
	if (h_input == 0 and v_input == 0)
	{
		index = s_player_idle;
	}
	else
	{
		index = s_player_walk;
	}
}

return index;