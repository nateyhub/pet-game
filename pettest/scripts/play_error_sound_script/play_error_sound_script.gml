function playErrorSound(){
	if !audio_is_playing(wrong_move) audio_play_sound(wrong_move, 100, false, 3)
}