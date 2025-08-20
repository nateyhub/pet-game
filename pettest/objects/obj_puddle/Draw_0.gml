if(_alpha > 0) 
{ 
	image_alpha = _alpha
	draw_self()
} else {
	if !audio_is_playing(success) 
	{ 
		audio_play_sound(success, 100, false)
		global.pet_needs.hygiene.change_direction = needChangeDirection.NOT_CHANGING
		global.pet_needs.fun.change_direction = needChangeDirection.NOT_CHANGING
	}
	obj_mop.sprite_index = spr_mop;
	instance_destroy(self)
}