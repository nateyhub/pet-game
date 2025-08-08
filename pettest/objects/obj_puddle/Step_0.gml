if(place_meeting(x,y,obj_mop) and keyboard_check(ord("E")))
{ 
	_alpha -= 0.01
	drainNeed("hygiene",0.05)
	if (!audio_is_playing(sfx_mop)) 
	{	
		audio_play_sound(sfx_mop, 100, false, 5)
	}
	obj_mop.sprite_index = spr_mopping_animation;
}
else {
	obj_mop.sprite_index = spr_mop;
}