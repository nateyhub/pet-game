if(visible) {
	draw_self()
	image_alpha = 1
	sprite_index = current_key.spr_index
	draw_set_font(fnt_tip)
	draw_text(x+sprite_width+current_key.margin_left,y+1,text)
}