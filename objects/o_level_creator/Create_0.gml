///create random level
randomize();

//get tile layer id
var wall_map_id = layer_tilemap_get_id("WallTiles");

//setup grid
width_ = room_width div CELL_WIDTH;
height_ = room_height div CELL_HEIGHT;
grid_ = ds_grid_create(width_,height_);
ds_grid_set_region(grid_,0,0,width_,height_, VOID);

//create pathfinding grid
grid_path = mp_grid_create(0,0,height_,width_,CELL_WIDTH,CELL_HEIGHT);

//create controller
var controller_x = width_ div 2;
var controller_y = height_ div 2;
var controller_direction = irandom(3);
var steps = 800;

//create player
var player_start_x = controller_x * CELL_WIDTH + CELL_WIDTH/2;
var player_start_y = controller_y * CELL_HEIGHT + CELL_HEIGHT/2;
instance_create_layer(player_start_x,player_start_y, "Instances", o_player);

//the odds for changing dir
var odds = 1;

repeat (steps)
{
	//place a floor tile at the controller pos
	grid_[# controller_x, controller_y] = FLOOR;
	
	//pick random dir
	if(irandom(odds) == odds)
	{
		controller_direction = irandom(3);
	}
	
	//move controller
	var xdir = lengthdir_x(1, controller_direction*90);
	var ydir = lengthdir_y(1, controller_direction*90);
	
	controller_x += xdir;
	controller_y += ydir;
	
	//clamp so we stay in grid
	controller_x = clamp(controller_x,2,width_ -3);
	controller_y = clamp(controller_y,2,height_ -3);
}


//remove 1 by 1 voids
for (var yy = 1; yy<height_-1 ; yy++)
{
	for (var xx = 1; xx<width_-1; xx++)
	{
		if(grid_[# xx,yy] != FLOOR)
		{
			//check to add walls
			var north_tile = grid_[# xx,yy-1] == VOID;
			var west_tile = grid_[# xx-1,yy] == VOID;
			var east_tile = grid_[# xx+1,yy] == VOID;
			var south_tile = grid_[# xx,yy+1] == VOID;
			
			//bit masking
			var tile_index = NORTH*north_tile + WEST*west_tile + EAST*east_tile + SOUTH*south_tile;
			if(tile_index == 0 or tile_index == 1 or tile_index == 2 or tile_index == 4 or tile_index == 8)
			{
				grid_[# xx,yy] = FLOOR;
			}
		}
	}
}


//place walls
for (var yy = 1; yy<height_-1 ; yy++)
{
	for (var xx = 1; xx<width_-1; xx++)
	{
		if(grid_[# xx,yy] != FLOOR)
		{
			//check to add walls
			var north_tile = grid_[# xx,yy-1] == VOID;
			var west_tile = grid_[# xx-1,yy] == VOID;
			var east_tile = grid_[# xx+1,yy] == VOID;
			var south_tile = grid_[# xx,yy+1] == VOID;
			
			//bit masking
			var tile_index = NORTH*north_tile + WEST*west_tile + EAST*east_tile + SOUTH*south_tile + 1;
			tilemap_set(wall_map_id, tile_index, xx, yy);
			instance_create_layer(xx*CELL_WIDTH+16,yy*CELL_HEIGHT+16,"Instances",o_wall);
			instance_create_layer(xx*CELL_WIDTH+16,yy*CELL_HEIGHT+16,"Solids",o_solid);
			
			//add data for pathfinding
			mp_grid_add_cell(grid_path, xx, yy);
		}
	}
}