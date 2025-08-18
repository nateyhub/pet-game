if(food_amount == 0) {
	food_level = Amount.EMPTY
	current_tier = 0
} else if (food_amount > 0 && food_amount <= 50) {
	food_level = Amount.HALF
} else {
	food_level = Amount.FULL
}

//if the player has picked up the bowl
if(_isBeingDragged) {
	handleDragging(0,-8,8,8)
}