//if the current amount of food consumed by the dog is less than what's allowed by the dog bowl
if(_food_consumed < obj_dog_bowl.hunger_increase) {
	//improve and drain needs accordingly
	improveNeed("energy", 0.5)
	improveNeed("health", 0.1)
	drainNeed("bladder", 0.5)
	
	//repeatedly play sound if not already playing
	if !audio_is_playing(sfx_eat_food) audio_play_sound(sfx_eat_food,100,false, 2)
	
	//reflect these changes in the GUI
	global.pet_needs.hunger.change_direction = needChangeDirection.INCREASING
	global.pet_needs.energy.change_direction = needChangeDirection.INCREASING_LOW
	global.pet_needs.health.change_direction = needChangeDirection.INCREASING_LOW
	global.pet_needs.bladder.change_direction = needChangeDirection.DECREASING_LOW
	
	//if the Tier of the dog food is better than average, also improve the dog's mood
	if(obj_dog_bowl.current_tier == tier.GOOD) {
		improveNeed("mood", 0.25)
		improveNeed("hunger", 2)
		_food_consumed += 2
		global.pet_needs.mood.change_direction = needChangeDirection.INCREASING_LOW
	} else if (obj_dog_bowl.current_tier == tier.ULTIMATE) {
		improveNeed("mood", 0.4)
		improveNeed("hunger", 3)
		_food_consumed += 3
		global.pet_needs.mood.change_direction = needChangeDirection.INCREASING_LOW
	} else {
		improveNeed("hunger", 1)
		_food_consumed++
	}
	
	//decrease the amount of food left in the bowl
	obj_dog_bowl.food_amount -= 0.25
	
	
	//repeat the alarm
	setAlarmInSeconds(actionAlarms.EAT, 0.1)
} else {
	//if the dog has finished eating, is allowed to move again
	isEating = false
	sprite_index = spr_dog_idle
	_wait_to_empty_bladder = false
	_wait_to_sleep = false
	
	show_debug_message("Dog has finished eating")
	
	//needs are no longer changing
	global.pet_needs.hunger.change_direction = needChangeDirection.NOT_CHANGING
	global.pet_needs.energy.change_direction = needChangeDirection.NOT_CHANGING
	global.pet_needs.health.change_direction = needChangeDirection.NOT_CHANGING
	global.pet_needs.bladder.change_direction = needChangeDirection.NOT_CHANGING
	global.pet_needs.mood.change_direction = needChangeDirection.NOT_CHANGING
	
	//reset food consumed
	_food_consumed = 0
}

