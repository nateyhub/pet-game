if (keyboard_check(vk_left) || keyboard_check(vk_right) || keyboard_check(vk_up) || keyboard_check(vk_down))  {
	isMoving = true
	alarm[2] = 150
}
else {
	show_debug_message("Key has been pressed but not one to move the dog (ie not arrow keys)")
}