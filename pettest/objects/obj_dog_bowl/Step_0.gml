if(food_amount == 0) {
	image_index = 0
	current_tier = 0
} else if (food_amount > 0 && food_amount < 50) {
	image_index = Amount.HALF
} else {
	image_index = Amount.FULL
}
//if position_meeting(mouse_x, mouse_y, self) image_index += 3