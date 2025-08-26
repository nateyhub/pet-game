if(_isBeingDragged) {
	//if the user is attempting to drop the dog food in a place where it can't go
	if(!place_empty(x,y) and !place_meeting(x,y,obj_dog_bowl)) { 
		layer_add_instance("top_glow_layer_red", self)
	} else {
		layer_add_instance("top_glow_layer", self)
	}

	//move dog food obj to the cursor's current position
	x = mouse_x
	y = mouse_y

	//snap position to 16x16 grid spaces
	move_snap(16,16)
}

//depth = obj_dog_bowl.depth - 1