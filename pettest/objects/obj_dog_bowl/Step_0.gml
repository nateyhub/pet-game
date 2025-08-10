if(food_amount == 0) {
	food_level = Amount.EMPTY
	current_tier = 0
} else if (food_amount > 0 && food_amount <= 50) {
	food_level = Amount.HALF
} else {
	food_level = Amount.FULL
}