if(_alpha > 0) 
{ 
	image_alpha = _alpha
	draw_self()
} else {
	if !audio_is_playing(success) audio_play_sound(success, 100, false)
	obj_mop.sprite_index = spr_mop;
	instance_destroy(self)
}