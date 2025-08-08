if(!isBathing) 
{
	//draw a shadow behind the dog
	draw_set_alpha(0.3)
	draw_ellipse_colour(x-12+shadow_x1_offset,y+8,x+12+shadow_x2_offset,y+16,c_black,c_black,false)
	draw_set_alpha(1)
	//then draw the dog sprite
	draw_self()
}
