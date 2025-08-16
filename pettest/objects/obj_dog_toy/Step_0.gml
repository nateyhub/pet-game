//if the ball is moving
if speed > 0.0 { 
	speed -= 0.05
	_isMoving = true
	var collidingObject = collision_circle(x,y,sprite_width/2,all,false,true)
	if(collidingObject and collidingObject != obj_dog.id and _hasBeenHit) 
	{
		show_debug_message("Bouncing")
		move_bounce_all(false)
	}
	
	
	//if (direction <= 180) image_angle += speed * 10
	//else image_angle -= speed * 10
} else {
	_isMoving = false
	_hasBeenHit = false
}

if(_isBeingDragged) {
	if(!place_empty(x,y)) { 
		layer_add_instance("top_glow_layer_red", self)
		
	} else {
		layer_add_instance("top_glow_layer", self)
	}

	x = mouse_x
	y = mouse_y

	move_snap(16,16)
}