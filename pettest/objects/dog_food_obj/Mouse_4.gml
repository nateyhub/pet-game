if (!_isBeingDragged)
{
	_isBeingDragged = true
} else {
	if(place_meeting(x,y, dog_bowl_obj)) 
	{
		if(dog_bowl_obj.food_amount == 100) show_message("Bowl is full")
		else {
			show_debug_message("Filling bowl")
			audio_play_sound(pour_dog_food, 100, false, 1.5)
			dog_bowl_obj.food_amount = 100
			instance_destroy(self)
		}
	}
	else {
		if(place_empty(x,y)) _isBeingDragged = false
		else playErrorSound()
	}
}