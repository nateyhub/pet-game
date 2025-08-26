if(!_ball_scored) {
	show_debug_message("Score!")
	audio_play_sound(success,100,false)
	global.pet_needs.mood.value++
	_ball_scored = true
}