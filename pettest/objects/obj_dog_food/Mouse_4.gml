if (!_isBeingDragged)
{
	_isBeingDragged = true
	global.selectedItem = self
} else {
	if(place_meeting(x,y, obj_dog_bowl)) 
	{
		if(obj_dog_bowl.food_amount > 0) show_message("Bowl needs to be empty")
		else {
			show_debug_message("Filling bowl")
			audio_play_sound(sfx_pour_dog_food, 100, false, 1.5)
			obj_dog_bowl.food_amount = 100
			instance_destroy(self)
			global.holdingAnItem = false
			global.selectedItem = noone
		}
	}
	else {
		if(place_empty(x,y)) 
		{ 
			_isBeingDragged = false
			global.holdingAnItem = false
			global.selectedItem = noone
		}
		else playErrorSound()
	}
}