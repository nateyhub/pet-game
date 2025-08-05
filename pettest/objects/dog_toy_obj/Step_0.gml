if speed > 0.0 { 
	speed -= 0.05
	_isMoving = true
	if (direction <= 180) image_angle += speed * 10
	else image_angle -= speed * 10
} else {
	_isMoving = false
}


//if(place_meeting(x,y,dog_obj)) 
//{ 
//	var _direction = point_direction(x,y,dog_obj.x, dog_obj.y)
//	show_debug_message(_direction)
//	direction = -_direction
//	speed = 3
//}

//var collision = move_and_collide(1 * speed, 1 * speed, obj_solid_parent)