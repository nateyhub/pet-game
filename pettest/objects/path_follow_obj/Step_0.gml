//var _xinput = direction
//show_debug_message("Speed" + string(path_speed))
//show_debug_message(path_get_speed(test_path,0.1))
//show_debug_message(path_position)


var collision_radius = 12
if(collision_circle(x,y,collision_radius,dog_obj,false,false)) {
	show_debug_message("Dog is here")
	path_speed = 0
} else {
	show_debug_message("Bath is not here")
	path_speed = temp_speed
}



switch(direction) {
	case 0:
		show_debug_message("going right")
		break
	case 90:
		show_debug_message("going up")
		break
	case 180:
		show_debug_message("going left")
		break
	case 270:
		show_debug_message("going down")
		break
}