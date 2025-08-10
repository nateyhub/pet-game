var collision_radius = 24
// if the bath is nearby
if(collision_circle(x,y,collision_radius,obj_bath,false,false)) {
	show_debug_message("Bath is here")

	if(global.pet_needs.hygiene.value <= 90) {
		//move pet towards the bath
		x = obj_bath.x
		y = obj_bath.y
		//start taking bath
		isBathing = true
		obj_bath.sprite_index = spr_bathtub_active
		_initial_hygiene_amount = global.pet_needs.hygiene.value
		event_perform(ev_alarm, actionAlarms.TAKE_BATH)
		audio_play_sound(sfx_bath_running, 100, false, 3)
	} else {
		//hygiene level is too high for a bath
		playErrorSound()
		show_debug_message("Too clean for a bath")
	}
}

// if the bed is nearby
if(collision_circle(x,y,collision_radius,obj_dog_bed,false,false)) {
	show_debug_message("Bed is here")
	//move to the bed
	x = obj_dog_bed.x
	y = obj_dog_bed.y

	
	//only sleep if the pet is tired enough
	if(global.pet_needs.energy.value <= 30) {
		//start sleeping
		isSleeping = true
		sprite_index = spr_dog_sleep
		audio_play_sound(sleep, 100, false, 2)
		
		//get the current energy level to set as an initial value
		_initial_energy_amount = global.pet_needs.energy.value
		//execute the SLEEP alarm
		event_perform(ev_alarm, actionAlarms.SLEEP)
	} else {
		//too much energy to sleep
		playErrorSound()
		show_debug_message(string("Too much energy to sleep: {0}", global.pet_needs.energy.value))
	}
}

//if(isUsingMop) 
//{
//	show_debug_message("Letting go of mop")
//	isUsingMop = false
//}

show_debug_message(fps)