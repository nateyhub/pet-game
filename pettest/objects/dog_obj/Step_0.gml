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

if(_xinput != 0 or _yinput != 0) {
	//show_debug_message("DOG IS NOW MOVING")
	isMoving = true
	switch(_xinput) {
	case -1:
		image_xscale = 1
		isMoving = true
		break
	case 1:
		image_xscale = -1
		isMoving = true
		break
	}
} else {
	isMoving = false
}





// handle collisions against any objects that have obj_solid_parent as a parent
var collision = move_and_collide(_xinput * my_speed, _yinput * my_speed, obj_solid_parent)