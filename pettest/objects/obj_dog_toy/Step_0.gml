//if the ball is moving
if speed > 0.0 { 
	//gradually slow the ball down
	speed -= 0.05
	_isMoving = true
	image_speed -= 0.05
	
	//horizontal bounce handling off specific collision objects
	if(place_meeting(x + hspeed, y, [obj_collision, obj_ball_collision, obj_solid_interactable]))
	    direction = -direction + 180;

	//horizontal bounce handling off specific collision objects
	if(place_meeting(x, y + vspeed, [obj_collision, obj_ball_collision, obj_solid_interactable]))
	    direction = -direction;
		
	
	show_debug_message(direction)
	//if rolling to the right
	if (direction <= 90 or direction >= 270) 
	{ 
		show_debug_message("Rolling right")
		image_xscale = 1
	}
	else {
		show_debug_message("Rolling left")
		image_xscale = -1
	}
} else {
	image_speed = 0
	_isMoving = false
	_hasBeenHit = false
}

//if the player has picked up the ball
if(_isBeingDragged) {
	//if the ball is being held over an area it cannot be placed down at
	if(!place_empty(x,y)) { 
		layer_add_instance("top_glow_layer_red", self)
	} else {
		layer_add_instance("top_glow_layer", self)
	}

	//have the ball be attached to the player's mouse
	x = mouse_x
	y = mouse_y

	//ensure that the ball's position is snapped to the 16x16 grid
	move_snap(16,16)
}