/// @description ini player
depth = -1000;
speed_ = [0,0];
max_speed_ = 3;
acceleration_ = 0.5;
friction_ = .3;

instance_create_layer(x,y,"Instances", o_camera);

//keybinding
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("D"), vk_right);