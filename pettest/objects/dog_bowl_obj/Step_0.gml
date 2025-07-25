if(food_amount == 0) {
	sprite_index = dog_bowl_empty_spr
} else if (food_amount > 0 && food_amount < 50) {
	sprite_index = dog_bowl_level_2_spr
} else {
	sprite_index = dog_bowl_spr
}