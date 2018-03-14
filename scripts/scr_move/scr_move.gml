///@param speed_ array
var speed_ = argument0;

//collision detection
if place_meeting(x+speed_[h],y, o_solid)
{
	while !place_meeting(x+sign(speed_[h]),y,o_solid)
	{
		x += sign(speed_[h]);
	}
	
	speed_[@ h] = 0;
}

//update speed
x += speed_[h];

if place_meeting(x,y+speed_[v], o_solid)
{
	while !place_meeting(x,y+sign(speed_[v]),o_solid)
	{
		y += sign(speed_[v]);
	}
	
	speed_[@ v] = 0;
}

//update speed
y += speed_[v];