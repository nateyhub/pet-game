//if !_draw return;
if !global.showing_dialogue return;

_dialogue_container_y = display_get_gui_height()-200
_dialogue_container_width = display_get_gui_width() - (x_padding*2)


#region draw dialogue container

draw_sprite_stretched(spr_dialogue_container,
	0,
	_dialogue_container_x,
	_dialogue_container_y,
	_dialogue_container_width,
	200)

#endregion

#region draw dialogue name holder

draw_sprite_stretched(spr_dialogue_name,
	0,
	_dialogue_container_x,
	_dialogue_container_y-39,
	sprite_get_width(spr_dialogue_name),
	sprite_get_height(spr_dialogue_name)+8
)

#endregion

#region draw speaker's name

draw_text_ext(_dialogue_container_x+x_string_padding,
	display_get_gui_height()-y_padding-46,
	_current_speaker == "Player" ? global.pet_name : _current_speaker, 
	50, 
	str_width-(x_string_padding*2))

#endregion

#region draw dialogue text

if _current_letter <= _dialogue_string_length {
	_current_string = string_concat(_current_string,string_char_at(_dialogue_string,_current_letter))
	_current_letter++
	if(_current_speaker == "Player") {
		with(obj_dog) bark();
	} else {
		if !audio_is_playing(sfx_dialogue_blip) audio_play_sound(sfx_dialogue_blip,100,false)
	}
	
} else {
	with(obj_dog) sprite_index = spr_dog_idle;
	//draw the arrow to indicate the player can move onto the next part of the dialogue
	draw_sprite(spr_dialogue_next_arrow,
		image_index,
		_dialogue_container_x + _dialogue_container_width - x_string_padding - 22, 
		display_get_gui_height()-40
	)
}

draw_set_font(fnt_dialogue)
draw_set_colour(c_navy)
draw_text_ext(_dialogue_container_x+x_string_padding,
	display_get_gui_height()-y_padding,
	_current_string, 
	50, 
	str_width-(x_string_padding*2))


#endregion


if !is_undefined(_current_choices) and array_length(_current_choices) > 0 {
	var height = string_height(_current_choices[0])
	draw_sprite_stretched(spr_dialogue_container,
		0,
		_dialogue_container_x+_dialogue_container_width-260,
		_dialogue_container_y-110,
		260,
		height * array_length(_current_choices) + 20)
		
		
	draw_sprite_stretched(
		spr_dialogue_active_choice,
		0,
		_dialogue_container_x+_dialogue_container_width+10-260,
		_dialogue_container_y+8 + (height * _selected_choice) - 110,
		240,
		height
	)
	
	
	var choice_y_gap = 0
	draw_set_colour(c_navy)
	for (var j = 0; j < array_length(_current_choices); j++) {
		draw_text(_dialogue_container_x+_dialogue_container_width+x_string_padding-260,
			_dialogue_container_y-100+choice_y_gap,
			_current_choices[j])	
		choice_y_gap += 30
	}
	

}

