function useBath() {
	global.tipsContainer.removeTip("Take a bath")

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

function goOutside() {
	audio_stop_all()
	audio_play_sound(sfx_door,100,false,2 )
	global.tipsContainer.clearAllTips()
	room = rm_preset_paths_test
}

function eatFromBowl() {
	global.tipsContainer.removeTip("Eat")
	var dog_bite_amount = 10
	if(obj_dog_bowl.food_amount >= dog_bite_amount) {
		if(global.pet_needs.hunger.value < 100) {
			isEating = true
			improveNeed("hunger", obj_dog_bowl.hunger_increase)
			improveNeed("energy", 8)
			show_debug_message(string("CURRENT FOOD TIER: {0}", obj_dog_bowl.current_tier))
			if(obj_dog_bowl.current_tier == tier.GOOD) improveNeed("fun", 5)
			if(obj_dog_bowl.current_tier == tier.ULTIMATE) improveNeed("fun", 10)
			//global.pet_needs.hunger.value = 100
			obj_dog_bowl.food_amount -= dog_bite_amount
			audio_play_sound(sfx_eat_food,100,false, 2)
			show_debug_message("Dog has eaten")
			sprite_index = spr_dog_eat
			x = obj_dog_bowl.x
			y = obj_dog_bowl.y-10
			drainNeed("bladder", 5) //decrease bladder
			//restrict movement for 1 second
			setAlarmInSeconds(actionAlarms.EAT,1)
		} 
		else {
			show_debug_message("Dog is too full to eat")
			playErrorSound()
		}
	} else {
		playErrorSound()
		show_debug_message("You need to buy more food")
	}
	show_debug_message("Amount of food left: " + string(obj_dog_bowl.food_amount))
}

function useBed() {
	global.tipsContainer.removeTip("Sleep")
	
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