if(_alpha > 0) 
{ 
	image_alpha = _alpha
	draw_self()
} else {
	audio_play_sound(success, 100, false)
	instance_destroy(self)
}