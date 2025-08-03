// assign keycodes to variables
var _right = keyboard_check(vk_right)
var _left = keyboard_check(vk_left)
var _up = keyboard_check(vk_up)
var _down = keyboard_check(vk_down)

// calculate x and y movement
var _xinput = _right - _left
var _yinput = _down - _up



//ENABLE THIS TO SEE DIRECTION:
//show_debug_message("y: " + string(_yinput) + " x: " + string(_xinput))

//if there is any x or y movement detected
if(_xinput != 0 or _yinput != 0) {
	//the player is moving
	isMoving = true
	sprite_index = dog_walk_spr
	switch(_xinput) {
		case -1:
			//player is facing left
			shadow_x1_offset = 0
			shadow_x2_offset = 0
			image_xscale = 0.5
			isMoving = true
			break
		case 1:
			//player is facing right
			image_xscale = -0.5
			shadow_x1_offset = -2
			shadow_x2_offset = -2
			isMoving = true
			break
	}
} else {
	isMoving = false
	sprite_index = dog_idle_spr
}


//show_debug_message(_xinput == 1 and _yinput == 1)
// normalise the input vector if not zero
var _length = sqrt(sqr(_xinput) + sqr(_yinput))
if(_length != 0) {
	_xinput /= _length
	_yinput /= _length
	show_debug_message("normalised:" + string(_xinput), string(_yinput))
	
}


// handle collisions against any objects that have obj_solid_parent as a parent
var collision = move_and_collide(_xinput * my_speed, _yinput * my_speed, obj_solid_parent)