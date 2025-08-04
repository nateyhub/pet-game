if(place_meeting(x,y,mop_obj) and keyboard_check(ord("E")))
{ 
	_alpha -= 0.01
	drainNeed("hygiene",0.05)
	if (!audio_is_playing(mop)) 
	{	
		audio_play_sound(mop, 100, false, 5)
	}
	mop_obj.sprite_index = mopping_animation_Spr;
}
else {
	mop_obj.sprite_index = mop_spr;
}