enum needAlarms {
	ENERGY,
	HUNGER_AND_BLADDER,
	FUN,
	HYGIENE
}

//drain ENERGY after 5 seconds
setAlarmBySeconds(needAlarms.ENERGY, 5)
//drain HUNGER and BLADDER after 3 seconds
setAlarmBySeconds(needAlarms.HUNGER_AND_BLADDER, 3)
//drain FUN after 2 seconds
setAlarmBySeconds(needAlarms.FUN, 2)
//drain HYGIENE after 10 seconds
setAlarmBySeconds(needAlarms.HYGIENE, 10)

my_speed = 2.5

shadow_x1_offset = 0
shadow_x2_offset = 0

_movement_counter = 0

//takes needName as a lowercase string eg "fun"
function drainNeed(needName, drainAmount) {
	show_debug_message("Draining " + needName + "("
		+ "current value: " + string(global.pet_needs[$ needName].value) + 
		") by " + string(drainAmount))
	if(global.pet_needs[$ needName].value > 1) {
		global.pet_needs[$ needName].value--
	} else {
		global.pet_needs[$ needName].value  = 0
	}
}

//set the given alarm to go off in the given number of seconds
function setAlarmBySeconds(alarmNumber, seconds) {
	alarm[alarmNumber] = game_get_speed(gamespeed_fps) * seconds
}