//if the dog is colliding with the mop
if(place_meeting(x,y,mop_obj)) {
	//handle picking up the mop
	if (!isUsingMop and !isPuttingDownMop) {
		isUsingMop = true
		press_e_obj.image_alpha = 1
		show_debug_message("picking up mop")
	} else if(isUsingMop) {
		//handle starting to put down the mop
		isUsingMop = false
		isPuttingDownMop = true
		press_e_obj.image_alpha = 0
	} else {
		//handle finishing putting down the mop
		isPuttingDownMop = false
		press_e_obj.image_alpha = 0
	}
}