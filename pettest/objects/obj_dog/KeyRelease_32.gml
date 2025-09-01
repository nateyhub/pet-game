//if the dog is colliding with the mop
if(place_meeting(x,y,obj_mop)) {	
	if(global.new_tc.tipIsShowing(tip_indices.PUT_DOWN_MOP)) {
		show_debug_message("Putting down mop")
		isUsingMop = false
		global.new_tc.hideTip(tip_indices.MOP_FLOOR)
		global.new_tc.hideTip(tip_indices.PUT_DOWN_MOP)
	} else if !isUsingMop {
		show_debug_message("picking up mop")
		isUsingMop = true
		global.new_tc.hideTip(tip_indices.PICK_UP)
		global.new_tc.showTip(tip_indices.MOP_FLOOR)
		global.new_tc.showTip(tip_indices.PUT_DOWN_MOP)
	}
}