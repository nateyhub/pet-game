enum needAlarms {
	NEEDS = 0,
}

enum actionAlarms {
	EAT = 1,
	SLEEP = 2,
	EMPTY_BLADDER = 3,
	TAKE_BATH = 4,
	BARK = 5,
	PLAY = 6
}

enum dogColours {
	DEFAULT = 0,
	BLACK = 1,
	PINK = 2
}

#macro FACING_LEFT -1
#macro FACING_RIGHT 1


//PALETTE MANAGEMENT
//global.current_pal = dogColours.DEFAULT;
application_surface_draw_enable(false);

_drainHealthCounter = 0 
_drainEnergyCounter = 0
_drainHygieneCounter = 0
_drainHungerAndBladderCounter = 0
_drainFunCounter = 0

//drain needs alarm
setAlarmInSeconds(needAlarms.NEEDS, 1)

my_speed = 3

shadow_x1_offset = 0
shadow_x2_offset = 0

_movement_counter = 0

collision_radius = 18

_nearby_interactable = collision_circle(x,y,collision_radius,obj_interactable_parent,false,false)

_xinput = 0
_yinput = 0


_dog_bite_amount = 10
_bites_remaining = 10
_food_consumed = 0


function emptyBladder(_voluntary) {
	isEmptyingBladder = true
	
	audio_play_sound(sfx_empty_bladder, 100, false)
	instance_create_layer(x,y+16,"bottom_layer",obj_puddle)
	sprite_index = spr_dog_emptying_bladder
	
	//if bladder was emptied due to bladder level being 0, impact health
	if(!_voluntary) {
		drainNeed("health", 2.5);
		global.pet_needs.health.change_direction = needChangeDirection.DECREASING_LOW
	}
	
	global.pet_needs.bladder.change_direction = needChangeDirection.INCREASING
	global.pet_needs.hygiene.change_direction = needChangeDirection.DECREASING_LOW
	global.pet_needs.fun.change_direction = needChangeDirection.DECREASING_LOW
	
	show_debug_message("BLADDER {0} HYGIENE {1} FUN {2}", global.pet_needs.bladder.change_direction,
	global.pet_needs.hygiene.change_direction,
	global.pet_needs.fun.change_direction)
	
	//execute alarm
	setAlarmInSeconds(actionAlarms.EMPTY_BLADDER, 0.1)
}


function passOut() {
	//start sleeping
	isSleeping = true
	isPassedOut = true
	sprite_index = spr_dog_sleep
	audio_play_sound(sleep, 100, false, 2)
	
	global.pet_needs.energy.change_direction = needChangeDirection.INCREASING
	global.pet_needs.health.change_direction = needChangeDirection.DECREASING_LOW
	global.pet_needs.fun.change_direction = needChangeDirection.DECREASING_LOW
	global.pet_needs.hygiene.change_direction = needChangeDirection.DECREASING_LOW
	global.pet_needs.hunger.change_direction = needChangeDirection.DECREASING_LOW
	global.pet_needs.bladder.change_direction = needChangeDirection.DECREASING_LOW
	
		
	//get the current energy level to set as an initial value
	_initial_energy_amount = global.pet_needs.energy.value
	//execute the SLEEP alarm
	event_perform(ev_alarm, actionAlarms.SLEEP)
}

_initial_energy_amount = 0
_initial_hygiene_amount = 0

_wait_to_empty_bladder = false
_wait_to_sleep = false


//TODO: put this in bath_obj
_bathe_amount = 30

