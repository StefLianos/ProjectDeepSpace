/// @description follow player
//if no player do nothing
if not instance_exists(target) exit;

//get closer to player
x = lerp(x, target.x, .1);
y = lerp(y, target.y, .1);

//clamp to room
x = clamp(x, width_/2 + CELL_WIDTH, room_width-width_/2 - CELL_WIDTH);
y = clamp(y, height_/2 + CELL_HEIGHT, room_height-height_/2 - CELL_HEIGHT);

camera_set_view_pos(view_camera[0], x-width_/2 ,y-height_/2);