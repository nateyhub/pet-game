//if the ball is moving
if speed > 0.0 { 
	_isMoving = true
	//gradually slow the ball down
	speed -= 0.05
	image_speed -= 0.05
	
	//handling horizontal bounce off specific collision objects
	if(place_meeting(x + hspeed, y, [obj_collision, obj_ball_collision, obj_solid_interactable]))
	    direction = -direction + 180;

	//handling vertical bounce off specific collision objects
	if(place_meeting(x, y + vspeed, [obj_collision, obj_ball_collision, obj_solid_interactable]))
	    direction = -direction;
		
	//if rolling to the right
	if (direction <= 90 or direction >= 270) 
	{ 
		image_xscale = 1
	}
	else {
		image_xscale = -1
	}
} else {
	image_speed = 0
	_isMoving = false
}

//if the player has picked up the ball
if(_isBeingDragged) {
	handleDragging(0,0,16,16)
}