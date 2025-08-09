if(keyboard_check_released(vk_space)) {
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
			show_message("Dog is too full to eat")
			playErrorSound()
		}
	} else {
		playErrorSound()
		show_debug_message("You need to buy more food")
	}
	show_debug_message("Amount of food left: " + string(obj_dog_bowl.food_amount))
}