//var _xinput = direction
//show_debug_message("Speed" + string(path_speed))
//show_debug_message(path_get_speed(test_path,0.1))
//show_debug_message(path_position)

var _y1 = y

//if(collision_rectangle(x-18,y-18-_yoffset,x+28+_xoffset,y+18,dog_city_obj,false,false)) {
//	show_debug_message("Dog is here")
//	path_speed = 0
//} else {
//	path_speed = temp_speed
//}

if(floor(x) == obj_intersection_top_left.x) {
	//random_set_seed(floor(power((dog_city_obj.x + dog_city_obj.y), 2)))

	show_debug_message("x:" + string(floor(x)) + " " + "x2:" + string(obj_intersection_top_left.x))
	show_debug_message(_direction)
	//show_debug_message("Random num: "+ string(round(random(4))))
	//show_debug_message(round(random(3)))
}





switch(direction) {
	case 0:
		//show_debug_message("going right")
		sprite_index = spr_newcar_x
		image_xscale = 1
		image_yscale = 1
		_direction = "right"
		if (collision_rectangle(x-28,y-18,x+36,y+16,obj_dog_city, false,false)) {
			show_debug_message("Dog is here")
			path_speed = 0
		} else {
			path_speed = temp_speed
		}
		break
	case 90:
		//show_debug_message("going up")
		sprite_index = spr_newcar_y
		image_xscale = 1
		image_yscale = 1
		_direction = "up"
		if (collision_rectangle(x-18,y-36,x+18,y+26,obj_dog_city, false,false)) {
			show_debug_message("Dog is here")
			path_speed = 0
		} else {
			path_speed = temp_speed
		}
		break
	case 180:
		//show_debug_message("going left")
		sprite_index = spr_newcar_x
		image_xscale = -1
		image_yscale = 1
		_direction = "left"
		if (collision_rectangle(x-36,y-18,x+28,y+16,obj_dog_city, false,false)) {
			show_debug_message("Dog is here")
			path_speed = 0
		} else {
			path_speed = temp_speed
		}

		break
	case 270:
		//show_debug_message("going down")
		sprite_index = spr_newcar_y
		image_xscale = 1
		image_yscale= -1
		if (collision_rectangle(x-18,y-26,x+18,y+36,obj_dog_city, false,false)) {
			show_debug_message("Dog is here")
			path_speed = 0
		} else {
			path_speed = temp_speed
		}
		_direction = "down"
		break
}

//show_debug_message("Car direction:" + _direction)