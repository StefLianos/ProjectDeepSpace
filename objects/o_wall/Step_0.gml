/// @description shadow code
if(instance_exists(o_player))
{
	if(distance_to_point(o_player.x,o_player.y) < radius)
	{
		x1= x - bwx/2
		y1= y - bwy/2
		x2= x - bwx/2
		y2= y + bwy/2
		x3= x + bwx/2
		y3= y + bwy/2
		x4= x + bwx/2
		y4= y - bwy/2
	
		//point x1y1
		dirc = point_direction(o_player.x,o_player.y,x1,y1); //direction between mouse and edge of wall
		x11 = x1+lengthdir_x(2000,dirc); //set length of shadow to 500
		y11 = y1+lengthdir_y(2000,dirc);
	
		//point x2y2
		dirc = point_direction(o_player.x,o_player.y,x2,y2); //direction between mouse and edge of wall
		x21 = x2+lengthdir_x(2000,dirc); //set length of shadow to 500
		y21 = y2+lengthdir_y(2000,dirc);
	
		//point x3y3
		dirc = point_direction(o_player.x,o_player.y,x3,y3); //direction between mouse and edge of wall
		x31 = x3+lengthdir_x(2000,dirc); //set length of shadow to 500
		y31 = y3+lengthdir_y(2000,dirc);
	
		//point x4y4
		dirc = point_direction(o_player.x,o_player.y,x4,y4); //direction between mouse and edge of wall
		x41 = x4+lengthdir_x(2000,dirc); //set length of shadow to 500
		y41 = y4+lengthdir_y(2000,dirc);
	
	}
}