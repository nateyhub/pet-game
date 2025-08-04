if(_alpha > 0) 
{ 
	image_alpha = _alpha
	draw_self()
} else {
	audio_play_sound(success, 100, false)
	mop_obj.sprite_index = mop_spr;
	instance_destroy(self)
}