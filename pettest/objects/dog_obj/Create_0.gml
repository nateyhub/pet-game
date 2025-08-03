enum needAlarms {
	ENERGY = 0,
	HUNGER_AND_BLADDER = 1,
	FUN = 2,
	HYGIENE = 3,
}

enum actionAlarms {
	EAT = 4,
	SLEEP = 5,
	EMPTY_BLADDER = 6
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

/// @function drainNeed
/// @description Drains the given need by the given amount
/// @param {string} needName The name of the need in lowercase (e.g. "bladder")
/// @param {real} drainAmount The amount to decrease the need's value by (e.g. 5)
function drainNeed(needName, drainAmount) {
	show_debug_message("Draining " + needName + "("
		+ "current value: " + string(global.pet_needs[$ needName].value) + 
		") by " + string(drainAmount))
	if(global.pet_needs[$ needName].value - drainAmount >= 0) {
		global.pet_needs[$ needName].value -= drainAmount
	} else {
		global.pet_needs[$ needName].value  = 0
	}
}

_initial_energy_amount = 0
