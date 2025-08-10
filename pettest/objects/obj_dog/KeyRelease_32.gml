//if the dog is colliding with the mop
if(place_meeting(x,y,obj_mop)) {
	//handle picking up the mop
	if (!isUsingMop and !isPuttingDownMop) {
		isUsingMop = true
		obj_press_e.image_alpha = 1
		show_debug_message("picking up mop")
	} else if(isUsingMop) {
		//handle starting to put down the mop
		isUsingMop = false
		isPuttingDownMop = true
		obj_press_e.image_alpha = 0
	} else {
		//handle finishing putting down the mop
		isPuttingDownMop = false
		obj_press_e.image_alpha = 0
	}
}