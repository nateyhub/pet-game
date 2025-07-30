//if the dog enters the park zone
if(place_meeting(x,y,dog_city_obj)) {
	//
	if(!pause)
	{
		//show_debug_message("Dog is at the park")
		audio_sound_gain(park_ambience,1,1000)
		audio_sound_gain(city_ambience,0,1000)
	}
	pause = true
} else {
	if(pause)
	{
		show_debug_message("Dog has left the park")
		audio_sound_gain(park_ambience,0,1000)
		audio_sound_gain(city_ambience,1.2,1000)
		pause = false	
	}
}