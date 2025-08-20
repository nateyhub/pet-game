image_alpha = alpha_counter
//show_debug_message(alpha_counter)
if alpha_counter <= 1 and fade_in { 
	alpha_counter += fade_factor
}
else if (alpha_counter >= 1 and fade_in) {
	fade_in = false
}
else 
{
	alpha_counter -= fade_factor
	if alpha_counter <= 0.0 {
		show_debug_message(global.pet_needs.health.change_direction)
		show_debug_message(needChangeDirection.NOT_CHANGING)
		if(global.pet_needs.health.change_direction != needChangeDirection.NOT_CHANGING) {
			y = obj_dog.y-8
			alpha_counter = 0.01
			fade_in = true
		} else {
			instance_destroy(self)
		}
	}
}

draw_self()