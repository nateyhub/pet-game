if (!_isBeingDragged)
{
	audio_play_sound(click,100,false)
	_isBeingDragged = true
} else {
	if(place_empty(x,y)) 
	{ 
		_isBeingDragged = false
		audio_play_sound(put_down,100,false)
	}
	else playErrorSound()
}