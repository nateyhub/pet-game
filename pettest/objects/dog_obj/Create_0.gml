enum needAlarms {
	ENERGY = 0,
	HUNGER_AND_BLADDER = 1,
	FUN = 2,
	HYGIENE = 3,
}

enum actionAlarms {
	EAT = 4,
	SLEEP = 5,
	EMPTY_BLADDER = 6,
	TAKE_BATH = 7,
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

function emptyBladder() {
	isEmptyingBladder = true
	global.pet_needs.bladder.value = 100
	audio_play_sound(empty_bladder, 100, false)
	instance_create_layer(x,y+16,"Instances",puddle_obj)
	sprite_index = dog_emptying_bladder_spr
	setAlarmInSeconds(actionAlarms.EMPTY_BLADDER, 1)
		
	//lower hygiene and fun
	drainNeed("hygiene", 25)
	drainNeed("fun", 20)
}

function passOut() {
	//start sleeping
	isSleeping = true
	sprite_index = dog_sleep_spr
	audio_play_sound(sleep, 100, false, 2)
		
	//get the current energy level to set as an initial value
	_initial_energy_amount = global.pet_needs.energy.value
	//execute the SLEEP alarm
	event_perform(ev_alarm, actionAlarms.SLEEP)
}

function improveNeed(needName, improveAmount) {
	show_debug_message("Improving " + needName + "("
		+ "current value: " + string(global.pet_needs[$ needName].value) + 
		") by " + string(improveAmount))
	global.pet_needs[$ needName].value += improveAmount
	//set to maximum if overflow
	if global.pet_needs[$ needName].value > 100 global.pet_needs[$ needName].value = 100
}

_initial_energy_amount = 0
_initial_hygiene_amount = 0

_wait_to_empty_bladder = false
_wait_to_sleep = false


//TODO: put this in bed obj
_sleep_amount = 40

//TODO: put this in bath_obj
_bathe_amount = 30