//var _xinput = direction
//show_debug_message("Speed" + string(path_speed))
//show_debug_message(path_get_speed(test_path,0.1))
//show_debug_message(path_position)


var _y1 = y

if(collision_rectangle(x-18,y-18-_yoffset,x+18+_xoffset,y+18,dog_city_obj,false,false)) {
	show_debug_message("Dog is here")
	path_speed = 0
} else {
	path_speed = temp_speed
}



switch(direction) {
	case 0:
		show_debug_message("going right")
		sprite_index = car_spr
		image_xscale = -1
		image_yscale = 1
		_xoffset = 6
		_yoffset = 0
		break
	case 90:
		show_debug_message("going up")
		sprite_index = car_y_spr
		image_xscale = 1
		image_yscale = -1
		_xoffset = 0
		_yoffset = 4
		break
	case 180:
		show_debug_message("going left")
		sprite_index = car_spr
		image_xscale = 1
		image_yscale = 1
		_xoffset = 0
		_yoffset = 0
		break
	case 270:
		show_debug_message("going down")
		sprite_index = car_y_spr
		image_xscale = 1
		image_yscale=1
		_xoffset = 0
		_yoffset = 0
		break
}