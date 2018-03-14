/// @description shadow step

// Always check that they haven't been destroyed 
if (surface_exists(surf)) 
{
    surface_set_target(surf);

    // The following three lines set the 'dark' overlay
    draw_set_color(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(0, 0, room_width, room_height, 0);

    // Setting the blend mode to 'subtract' is what allows us to "cut holes" out of the overlay
    gpu_set_blendmode(bm_subtract);	
    draw_set_color(c_white);
    
    
    // draw player fov       
    with (o_player)
		var gun_dir = point_direction(o_player.x,o_player.y-sprite_height/2,mouse_x,mouse_y);
        draw_sprite_ext(s_light,0,o_player.x,o_player.y,0.5,0.5,gun_dir + random_range(-1, 1),c_white,.5);
    		
	//draw shadow primitives
	with (o_wall)
	#region
		if(distance_to_point(o_player.x,o_player.y) < o_wall.radius)
		{
			//set corect shadows
			gpu_set_blendmode(bm_normal);	
			draw_set_color(c_black);
			draw_set_alpha(1);
	
			//draw shadow
			draw_primitive_begin(pr_trianglestrip);
	
			draw_vertex(x1,y1); //sets point of shadows
			draw_vertex(x11,y11);
	
			draw_vertex(x2,y2);
			draw_vertex(x21,y21);
	
			draw_vertex(x3,y3);
			draw_vertex(x31,y31);
	
			draw_vertex(x4,y4);
			draw_vertex(x41,y41);
	
			draw_vertex(x1,y1); //repeat to close shape
			draw_vertex(x11,y11);
	
			draw_primitive_end();
		}
		#endregion
	
	//draw wall highlights and lights
	gpu_set_blendmode(bm_subtract);	
    draw_set_color(c_white);
	with (o_wall)
		draw_rectangle(x-16,y-16,x+15,y+15,false)
	
	with (o_lantern)
        draw_circle(x + random_range(-1, 1), y + random_range(-1, 1), 30 + random_range(-1, 1), false);
	
	
    // Reset all of your draw stuff
    gpu_set_blendmode(bm_normal);
    draw_set_alpha(1);
    surface_reset_target();
} 
else 
{
    // Create a new one if there were issues
    surf = surface_create(room_width, room_height);
    surface_set_target(surf);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}
