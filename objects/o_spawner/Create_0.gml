/// @description Create Spawner
points_ = 0;
repeat_ = 0;
enemy1num = 0;
enemy2num = 0;

//initialise potential enemies


//Enemies[0] = o_saurus;
//Enemies[1] = o_enemy; 

picked_index_ = choose(0,1);
pickedcard_ = o_monster_log.names[picked_index_];
pickedcard_cost_ = o_monster_log.cost[picked_index_];

alarm[0]=room_speed;
alarm[1]=room_speed/4;
alarm[2]=room_speed*15;


