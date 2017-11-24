/// @description ini player
depth = -1000;
speed_ = [0,0];
max_speed_ = 4;
acceleration_ = 1;
friction_ = .3;

//keybinding
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("D"), vk_right);