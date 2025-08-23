if(global.pet_needs.bladder.value < 100)
{
	improveNeed("bladder", 5)
	drainNeed("hygiene",0.1)
	drainNeed("mood",0.1)
	
	setAlarmInSeconds(actionAlarms.EMPTY_BLADDER,0.1)
} else {
	isEmptyingBladder = false
	sprite_index = spr_dog_idle
	global.pet_needs.bladder.change_direction = needChangeDirection.NOT_CHANGING
	global.pet_needs.hygiene.change_direction = needChangeDirection.NOT_CHANGING
	global.pet_needs.mood.change_direction = needChangeDirection.NOT_CHANGING
	
	//health may have been decreasing if bladder was == 0
	global.pet_needs.health.change_direction = needChangeDirection.NOT_CHANGING
}