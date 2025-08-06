if speed > 0.0 { 
	speed -= 0.05
	_isMoving = true
	if (direction <= 180) image_angle += speed * 10
	else image_angle -= speed * 10
} else {
	_isMoving = false
}

if(_isBeingDragged) {
	if(!place_empty(x,y)) { 
		layer_add_instance("top_glow_layer_red", self)
		
	} else {
		layer_add_instance("top_glow_layer", self)
	}
	//move_snap(16,16)
	//if (mouse_x > 0 and mouse_y > 0) {
	//	x = (mouse_x div 8) * 8
	//	y = (mouse_y div 8) * 8
		
	//} else {
		x = mouse_x
		y = mouse_y
	//}
	move_snap(16,16)
}


//if(place_meeting(x,y,dog_obj)) 
//{ 
//	var _direction = point_direction(x,y,dog_obj.x, dog_obj.y)
//	show_debug_message(_direction)
//	direction = -_direction
//	speed = 3
//}

//var collision = move_and_collide(1 * speed, 1 * speed, obj_solid_parent)