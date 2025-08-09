

if(_isBeingDragged) {
	if(!place_empty(x,y)) { 
		layer_add_instance("top_glow_layer_red", self)
		
	} else {
		layer_add_instance("top_glow_layer", self)
	}
	move_snap(16,16)
	//if (mouse_x > 0 and mouse_y > 0) {
	//	x = (mouse_x div 8) * 8
	//	y = (mouse_y div 8) * 8
		
	//} else {
		x = mouse_x
		y = mouse_y
	//}
	move_snap(16,16)
}