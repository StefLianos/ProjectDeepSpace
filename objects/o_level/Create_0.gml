/// @description create level

//set grid width and height
var width = room_width div CELL_WIDTH;
var height = room_height div CELL_HEIGHT;

//create grid
grid = ds_grid_create(width,height);

//create tile_map
tile_map = layer_tilemap_create("Tiles_1",0,0,tileset1,width,height);

//fill grid with void
ds_grid_set_region(grid,0,0,width-1,height-1,VOID);

//randomize world
randomize();

//create the controller in center of grid
var cx = width div 2;
var cy = height div 2;

//add player
instance_create_layer(cx*CELL_WIDTH+16,cy*CELL_HEIGHT+16,"Instances",o_player);


//give controller a random dir
var cdir = irandom(3);

//the odds for changing dir
var odds =1;

//create level using 1000 steps
repeat(1000)
{
	//place a floor tile at the controller pos
	grid[# cx, cy] = FLOOR;
	
	//pick random dir
	if(irandom(odds) == odds)
	{
		cdir = irandom(3);
	}
	
	
	//move controller
	var xdir = lengthdir_x(1, cdir*90);
	var ydir = lengthdir_y(1, cdir*90);
	
	cx += xdir;
	cy += ydir;
	
	//clamp so we stay in grid
	cx = clamp(cx,1,width-2);
	cy = clamp(cy,1,height-2);
	
	//show dir
	show_debug_message("cx = "+string(cx)+" , cy = "+string(cy));
	
}

for (var yy = 1; yy<height-1 ; yy++)
{
	for (var xx = 1; xx<width-1; xx++)
	{
		if(grid[# xx,yy] == FLOOR)
		{
			//check to add walls
			if(grid[# xx+1, yy]!= FLOOR) grid[# xx+1, yy] = WALL;
			if(grid[# xx-1, yy]!= FLOOR) grid[# xx-1, yy] = WALL;
			if(grid[# xx, yy+1]!= FLOOR) grid[# xx, yy+1] = WALL;
			if(grid[# xx, yy-1]!= FLOOR) grid[# xx, yy-1] = WALL;
		}
	}
}

//draw level
for (var yy = 0; yy<height; yy++)
{
	for (var xx = 0; xx<width; xx++)
	{
		//draw floor
		if(grid[# xx, yy]==FLOOR)
		{
			tilemap_set(tile_map,choose(1,2,3,4,5,6),xx,yy);					
		}
		//create wall
		else if(grid[# xx, yy]==WALL)
		{
			tilemap_set(tile_map,choose(8,9,10,11,12,13,14),xx,yy);
			instance_create_layer(xx*CELL_WIDTH+16,yy*CELL_HEIGHT+16,"Instances",o_wall);
			instance_create_layer(xx*CELL_WIDTH+16,yy*CELL_HEIGHT+16,"Solids",o_solid);
		}
	}
}


//print room size
show_debug_message("width = "+string(room_width));
show_debug_message("height = "+string(room_height));
