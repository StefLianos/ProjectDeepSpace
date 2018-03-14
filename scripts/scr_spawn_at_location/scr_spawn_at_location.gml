var enemy = argument0;
var spawn_x = irandom_range(2, o_level_creator.width_ - 2);
var spawn_y = irandom_range(2, o_level_creator.height_ - 2);


while(o_level_creator.grid_[# spawn_x , spawn_y] != FLOOR
	or position_meeting(spawn_x*CELL_WIDTH+16,spawn_y*CELL_HEIGHT+16,o_player))
{
	randomize();
	var spawn_x = irandom_range(2, o_level_creator.width_ - 2);
	var spawn_y = irandom_range(2, o_level_creator.height_ - 2);
}

instance_create_layer(spawn_x*CELL_WIDTH+16,spawn_y*CELL_HEIGHT+16,"Instances",enemy);