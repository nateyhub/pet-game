show_debug_message("Checking if dog is moving...")
if(isMoving) {
	show_debug_message("Dog is still moving - draining energy")
	energy -= 1
	alarm[2] = 150
} else {
	show_debug_message("Dog has stopped moving")
	energy += 0
	alarm[2] = -1
	isMoving = false
}
