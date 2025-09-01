if !_draw return;


#region draw dialogue container

draw_sprite_stretched(spr_dialogue_container,
	0,
	_dialogue_container_x,
	_dialogue_container_y,
	_dialogue_container_width,
	200)

#endregion

#region draw dialogue text

if _current_letter <= _dialogue_string_length {
	_current_string = string_concat(_current_string,string_char_at(_dialogue_string,_current_letter))
	_current_letter++
	if !audio_is_playing(sfx_dialogue_blip) audio_play_sound(sfx_dialogue_blip,100,false)
} else {
	//draw the arrow to indicate the player can move onto the next part of the dialogue
	draw_sprite_stretched(spr_dialogue_next_arrow,
		image_index/16,
		_dialogue_container_x + _dialogue_container_width - x_string_padding - 18, 
		display_get_gui_height()-48,
		32,
		32)
}

draw_set_font(fnt_dialogue)
draw_set_colour(c_navy)
draw_text_ext(_dialogue_container_x+x_string_padding,
	display_get_gui_height()-y_padding,
	_current_string, 
	50, 
	str_width-(x_string_padding*2))


#endregion