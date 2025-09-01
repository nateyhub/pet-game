//can't drain health if the dog is sleeping
if obj_dog.isSleeping or global.showing_dialogue
{ 
	setAlarmInSeconds(DRAIN_HEALTH_ALARM, 1)
	return;
}
//otherwise
if global.needs_critical {
	global.pet_needs.health.value -= 0.8
	global.pet_needs.health.change_direction = needChangeDirection.DECREASING_LOW
	show_debug_message("Draining health! New value:" + string(global.pet_needs.health))
} else {
	if (!obj_dog.isSleeping and !obj_dog.isEating) global.pet_needs.health.change_direction = needChangeDirection.NOT_CHANGING
}
setAlarmInSeconds(DRAIN_HEALTH_ALARM, 1)