/// @description enemies in level test

draw_set_halign(fa_center);
draw_set_color(c_yellow);


draw_text(view_xport[0] + 50 , view_yport[0] + 25, "points "+ string(points_));
draw_text(view_xport[0] + 50 , view_yport[0] + 45, "saurus "+ string(enemy1num));
draw_text(view_xport[0] + 50 , view_yport[0] + 65, "alien "+ string(enemy2num));

draw_set_color(make_color_rgb(33,31,53));
