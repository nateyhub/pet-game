if(global.pet_needs.bladder.value < 100)
{
	show_debug_message("BLADDER {0} HYGIENE {1} FUN {2}", global.pet_needs.bladder.change_direction,
		global.pet_needs.hygiene.change_direction,
		global.pet_needs.fun.change_direction)
	
	improveNeed("bladder", 5)
	drainNeed("hygiene",0.1)
	drainNeed("fun",0.1)
	
	setAlarmInSeconds(actionAlarms.EMPTY_BLADDER,0.1)
} else {
	isEmptyingBladder = false
	sprite_index = spr_dog_idle
	global.pet_needs.bladder.change_direction = needChangeDirection.NOT_CHANGING
	global.pet_needs.hygiene.change_direction = needChangeDirection.NOT_CHANGING
	global.pet_needs.fun.change_direction = needChangeDirection.NOT_CHANGING
}