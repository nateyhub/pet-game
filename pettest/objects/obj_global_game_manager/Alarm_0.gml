if global.needs_critical and !obj_dog.isSleeping {
	global.pet_needs.health.value--
	global.pet_needs.health.change_direction = needChangeDirection.DECREASING_LOW
	show_debug_message("Draining health! New value:" + string(global.pet_needs.health))
}
setAlarmInSeconds(DRAIN_HEALTH_ALARM, 1)