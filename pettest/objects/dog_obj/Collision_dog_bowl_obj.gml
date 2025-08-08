if(keyboard_check_released(vk_space)) {
	var dog_bite_amount = 20
	if(dog_bowl_obj.food_amount >= dog_bite_amount) {
		isEating = true
		
		drainNeed("bladder", 5) //decrease bladder
		
		//restrict movement for 1 second
		setAlarmInSeconds(actionAlarms.EAT,1)
		
		if(global.pet_needs.hunger.value < 100) {
			improveNeed("hunger", dog_bowl_obj.hunger_increase)
			improveNeed("energy", 8)
			//global.pet_needs.hunger.value = 100
			dog_bowl_obj.food_amount -= dog_bite_amount
			audio_play_sound(eat_food,100,false, 2)
			show_debug_message("Dog has eaten")
			sprite_index = dog_eat_spr
			x = dog_bowl_obj.x
			y = dog_bowl_obj.y-10
		} 
		else {
			show_message("Dog is too full to eat")
			playErrorSound()
		}
	} else {
		playErrorSound()
		show_debug_message("You need to buy more food")
	}
	show_debug_message("Amount of food left: " + string(dog_bowl_obj.food_amount))
}