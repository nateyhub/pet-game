if(visible) {
	//draw_self()
	var padding_right = current_key.key_str_length
	draw_sprite_stretched(sprite_index,-1,x,y,sprite_width-6+(current_key.key_str_length*6),sprite_height)
	
	image_alpha = 1
	sprite_index = current_key.spr_index
	draw_set_font(fnt_tip)
	draw_set_colour(c_white)
	draw_text(x+sprite_width-6+(current_key.key_str_length*6)+current_key.margin_left, y+2, text)
	
	//draw_rectangle(x,y,x+key_str_length,y+20,false)
	
	if image_index < 1.0 
	{	
		draw_set_colour(make_color_rgb(105,91,89))
		draw_text(x+5,y,current_key.key_str)
	}
	else 
	{
		draw_set_colour(make_color_rgb(105,91,89))
		draw_text(x+5,y+2,current_key.key_str)
	}
	
}