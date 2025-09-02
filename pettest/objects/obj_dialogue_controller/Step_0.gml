if is_undefined(_current_choices) or array_length(_current_choices) == 0 return;

if (keyboard_check_pressed(vk_up)) 
{
	_selected_choice = max(0, _selected_choice - 1)
	if !audio_is_playing(sfx_change_choice) audio_play_sound(sfx_dialogue_blip,100,false)
	show_debug_message(_current_choices[_selected_choice])
}
else if (keyboard_check_pressed(vk_down)) 
{ 
	_selected_choice = min(array_length(_current_choices)-1, _selected_choice + 1)
	if !audio_is_playing(sfx_change_choice) audio_play_sound(sfx_dialogue_blip,100,false)
	show_debug_message(_current_choices[_selected_choice])
}
else if (keyboard_check_pressed(vk_enter)) {
	show_debug_message("Chosen: {0}", _current_choices[_selected_choice])
	
	//TODO: improve this
	if _current_choices[_selected_choice] == "Not right now" {
		exit_dialogue()
	} else {
		_current_choices = []
		event_perform(ev_keyrelease, ord("E"))
	}
}
