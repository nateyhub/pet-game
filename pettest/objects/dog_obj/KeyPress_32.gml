var collision_radius = 24
if(collision_circle(x,y,collision_radius,bath_obj,false,false)) {
	show_debug_message("Bath is here")
} else {
	show_debug_message("Bath is not here")
}
if(collision_circle(x,y,collision_radius,dog_bed_obj,false,false)) {
	show_debug_message("Bed is here")
	//move to the bed
	x = dog_bed_obj.x
	y = dog_bed_obj.y

	
	//only sleep if the pet is tired enough
	if(global.pet_needs.energy.value <= 15) {
		//start sleeping
		isSleeping = true
		sprite_index = dog_sleep_spr
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

show_debug_message(fps)