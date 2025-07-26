// assign keycodes to variables
var _right = keyboard_check(vk_right)
var _left = keyboard_check(vk_left)
var _up = keyboard_check(vk_up)
var _down = keyboard_check(vk_down)

// calculate x and y movement
var _xinput = _right - _left
var _yinput = _down - _up

//ENABLE THIS TO SEE X DIRECTION show_debug_message(_xinput)
switch(_xinput) {
	case -1:
		image_xscale = 1
		break
	case 1:
		image_xscale = -1
		break
}

// handle collisions against any objects that have obj_solid_parent as a parent
var collision = move_and_collide(_xinput * my_speed, _yinput * my_speed, obj_solid_parent)