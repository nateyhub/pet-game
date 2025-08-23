//break out of step event if the current time is between 7:01am and 7:59pm
if global.day_current_hour > 6 and global.day_current_hour < 20
{
	if layer_get_fx("living_room_floor") {
		show_debug_message("a")
		
		layer_clear_fx("living_room_floor")
		layer_clear_fx("living_room_stairs")
		layer_clear_fx("living_room_walls")
		layer_clear_fx("living_room_instances")
		layer_clear_fx("carpet")
	}
	if layer_get_fx("bedroom_floor") {
		show_debug_message("b")
		layer_clear_fx("bedroom_walls")
		layer_clear_fx("bedroom_floor")
		layer_clear_fx("bedroom_instances")
		layer_clear_fx("walkway")
	}
	
	return;
}
//if the dog is in the BEDROOM
if place_meeting(x,y,obj_dog) {
	//show_debug_message("In the bedroom")
	if !layer_get_fx("living_room_floor") {
		show_debug_message("Switching")
		
		//clear the dark effect in the bedroom layers (turn on bedroom lights)
		layer_clear_fx("bedroom_walls")
		layer_clear_fx("bedroom_floor")
		layer_clear_fx("bedroom_instances")
		layer_clear_fx("walkway")
		
		//set dark effect in the living room layers	
		layer_set_fx("living_room_floor", _night_fx)
		layer_set_fx("living_room_stairs", _night_fx)
		layer_set_fx("living_room_walls", _night_fx)
		layer_set_fx("living_room_instances", _night_fx)
		layer_set_fx("carpet", _night_fx)
	}
} else {
	//if the dog has in the LIVING ROOM
	if layer_get_fx("living_room_floor") {
		//clear the dark effect in the living room layers (turn on living room lights)
		layer_clear_fx("living_room_floor")
		layer_clear_fx("living_room_stairs")
		layer_clear_fx("living_room_walls")
		layer_clear_fx("living_room_instances")
		layer_clear_fx("carpet")
		
		//set dark effect in the bedroom layers
		layer_set_fx("walkway", _night_fx)
		layer_set_fx("bedroom_walls", _night_fx)
		layer_set_fx("bedroom_floor", _night_fx)
		layer_set_fx("bedroom_instances", _night_fx)
	} else if !layer_get_fx("bedroom_floor") {
		//set dark effect in the bedroom layers
		layer_set_fx("walkway", _night_fx)
		layer_set_fx("bedroom_walls", _night_fx)
		layer_set_fx("bedroom_floor", _night_fx)
		layer_set_fx("bedroom_instances", _night_fx)
	}
}