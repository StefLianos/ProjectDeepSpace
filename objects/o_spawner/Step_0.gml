/// @description main spawning code

//add a point every second
if(alarm[0]<=0)
{
	points_ += 1;
	alarm[0] = 60;
	
}

//if can afford spawn
if(pickedcard_cost_<= points_ && repeat_==0 && alarm[2]<=0)
{
	points_ -= pickedcard_cost_;
	
	scr_spawn_at_location(pickedcard_);
	
	
	if(pickedcard_ == o_monster_log.names[0])
	{
		enemy1num +=1;
	}
	else
	{
		enemy2num +=1;
	}
}

//if can afford anotherone wait 1/4 sec and spawn up to 4
if(pickedcard_cost_ <= points_ && repeat_ <= 4 && alarm[1] <=0 && alarm[2]<=0)
{
	
	//spawn copy
	points_ -= pickedcard_cost_;
	repeat_ +=1;
	
	scr_spawn_at_location(pickedcard_);
	
	//modify counters
	if(pickedcard_ ==  o_monster_log.names[0])
	{
		enemy1num +=1;
	}
	else
	{
		enemy2num +=1;
	}	
	
	
	alarm[1]= room_speed/2;
}
if(repeat_ == 4)
{
	repeat_ = 0;
	
	picked_index_ = choose(0,1);
	pickedcard_ = o_monster_log.names[picked_index_];
	pickedcard_cost = o_monster_log.cost[picked_index_];
}
	
	
//if no more points wait 15 seconds and pick new card
if(points_ == 0 && alarm[2]<=0)
{	

	picked_index_ = choose(0,1);
	pickedcard_ = o_monster_log.names[picked_index_];
	pickedcard_cost = o_monster_log.cost[picked_index_];
	
	alarm[2] = 15 * room_speed;
		
}



