if (!keyboard_check(vk_left) && !keyboard_check(vk_right) && !keyboard_check(vk_up) && !keyboard_check(vk_down))  {
	direction = 0
	speed = 0
	isMoving = false
	alarm[2] = -1
}
else {
	if (keyboard_check(vk_left)) {
		direction = 180
		speed = 5
		image_xscale = 1
	}
	else if (keyboard_check(vk_right)) {
		direction = 0
		speed = 5
		image_xscale = -1
	}
	else if (keyboard_check(vk_up)) {
		direction = 90
		speed = 5
	}
	else if (keyboard_check(vk_down)) {
		direction = 270
		speed = 5
	}

	if (keyboard_check(vk_left) && keyboard_check(vk_up)) {
		direction = 135
		speed = 5
	}
	if (keyboard_check(vk_right) && keyboard_check(vk_up)) {
		direction = 45
		speed = 5
	}
	if (keyboard_check(vk_left) && keyboard_check(vk_down)) {
		direction = 225
		speed = 5
	}
	if (keyboard_check(vk_right) && keyboard_check(vk_down)) {
		direction = 315
		speed = 5
	}
}
