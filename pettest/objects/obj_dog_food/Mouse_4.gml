show_debug_message("Dog food: Left pressed. Is being dragged: ", _isBeingDragged)
if (!_isBeingDragged)
{
	_isBeingDragged = true
	global.selectedItem = self
	global.holdingAnItem = true
} else {
	//if the player is holding the dog food while clicking on the dog bowl, attempt to fill the bowl
	if(place_meeting(x,y, obj_dog_bowl)) 
	{
		//bowl needs to be empty before refilling
		if(obj_dog_bowl.food_amount > 0) show_debug_message("Bowl needs to be empty")
		else {
			//refill the bowl
			show_debug_message("Filling bowl")
			audio_play_sound(sfx_pour_dog_food, 100, false, 1.5)
			switch(item_tier) {
				case tier.CHEAP:
					obj_dog_bowl.hunger_increase = 40
					obj_dog_bowl.food_amount = 80
					break
				case tier.GOOD:
					obj_dog_bowl.hunger_increase = 60
					obj_dog_bowl.food_amount = 100
					break
				case tier.ULTIMATE:
					obj_dog_bowl.hunger_increase = 80
					obj_dog_bowl.food_amount = 120
					break
			}
			//set the current tier of dog food in the bowl to the item's tier
			obj_dog_bowl.current_tier = item_tier
			
			//destroy the dog food bag
			instance_destroy(self)
			global.holdingAnItem = false
			global.selectedItem = noone
		}
	}
	else {
		//otherwise if the player is hovering over an inventory slot with the dog food
		if(place_empty(x,y)) and (device_mouse_x_to_gui(MOUSE) < obj_gui_controller._x or device_mouse_x_to_gui(MOUSE) > obj_gui_controller._x+70) and (device_mouse_y_to_gui(MOUSE) < obj_gui_controller._y or device_mouse_y_to_gui(MOUSE) > obj_gui_controller._y+70) {
			//store the dog food in the slot
			_isBeingDragged = false
			global.holdingAnItem = false
			global.selectedItem = noone
		}
		else if (device_mouse_x_to_gui(MOUSE) < obj_gui_controller._x or device_mouse_x_to_gui(MOUSE) > obj_gui_controller._x+70) and (device_mouse_y_to_gui(MOUSE) < obj_gui_controller._y or device_mouse_y_to_gui(MOUSE) > obj_gui_controller._y+70) {
			//finally, player is attempting to put dog food down in an area it is not allowed
			playErrorSound()
		}
	}
}