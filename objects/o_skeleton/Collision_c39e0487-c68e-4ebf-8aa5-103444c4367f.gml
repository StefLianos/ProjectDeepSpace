/// @description don't stack
var speed_ = [0,0];

//exeption for perfect stack
if(x == other.x and y == other.y)
{
	speed_[h] = sign(sign(other.id-id));
	speed_[v] = 0;
	scr_move(speed_);
}

var dir = point_direction(other.x, other.y, x, y);
speed_[h] = lengthdir_x(.5, dir);
speed_[v] = lengthdir_y(.5,dir);

scr_move(speed_);