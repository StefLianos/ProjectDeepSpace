/// @description update depth
depth = -y;

if(HP == 0)
{
	instance_destroy(self);
	o_game.score_ += 5;
}