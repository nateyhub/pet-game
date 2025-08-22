//if the dog is in the bedroom
if place_meeting(x,y,obj_dog) {
	if !layer_get_fx("living_room_floor") 
	{ 
		layer_set_fx("living_room_floor", _night_fx);
		layer_set_fx("living_room_walls", _night_fx);
		layer_clear_fx("bedroom_floor")
		layer_clear_fx("bedroom_walls")
		layer_clear_fx("walkway")
	}
} else {
	//if the dog has left the bedroom
	if !layer_get_fx("bedroom_floor") 
	{ 
		layer_set_fx("bedroom_floor", _night_fx);
		layer_set_fx("bedroom_walls", _night_fx);
		layer_set_fx("walkway", _night_fx);
		layer_clear_fx("living_room_floor")
		layer_clear_fx("living_room_walls")
	}
}