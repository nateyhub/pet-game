//if the dog is colliding with the mop
if(place_meeting(x,y,obj_mop)) {
	//handle picking up the mop
	if (!isUsingMop and !isPuttingDownMop) {
		isUsingMop = true

		global.tipsContainer.createTip("E", "Hold: mop floor")
		global.tipsContainer.createTip("Space", "Put down mop")
	
		show_debug_message("picking up mop")
	} else if(isUsingMop) {
		//handle starting to put down the mop
		isUsingMop = false
		isPuttingDownMop = true
		
		global.tipsContainer.removeTip("Hold: mop")
		global.tipsContainer.removeTip("Put down mop")
		
	} else {
		//handle finishing putting down the mop
		isPuttingDownMop = false
	}
}