if(!isBathing) 
{
	//draw a shadow behind the dog
	if(image_xscale == -1) draw_sprite_stretched(spr_dog_shadow,0,x-12,y+8,22,10)
	else draw_sprite_stretched(spr_dog_shadow,0,x-10,y+8,22,10)
	//draw_set_alpha(0.3)
	//draw_ellipse_colour(x-12+shadow_x1_offset,y+8,x+12+shadow_x2_offset,y+16,c_black,c_black,false)
	//draw_set_alpha(1)
	//then draw the dog sprite
	draw_self()
}
