enum needAlarms {
	ENERGY,
	HUNGER_AND_BLADDER,
	FUN,
	HYGIENE
}

#macro FACING_LEFT -1
#macro FACING_RIGHT 1

//drain ENERGY after 5 seconds
setAlarmInSeconds(needAlarms.ENERGY, 5)
//drain HUNGER and BLADDER after 3 seconds
setAlarmInSeconds(needAlarms.HUNGER_AND_BLADDER, 3)
//drain FUN after 2 seconds
setAlarmInSeconds(needAlarms.FUN, 2)
//drain HYGIENE after 10 seconds
setAlarmInSeconds(needAlarms.HYGIENE, 10)

my_speed = 3

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

