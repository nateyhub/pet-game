if (global.needs_critical) {
	global.pet_needs.health.value--
	show_debug_message("Draining health! New value:" + string(global.pet_needs.health))
}
setAlarmInSeconds(DRAIN_HEALTH_ALARM, 1)
