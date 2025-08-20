if(keyboard_check_released(vk_space)) {
	var dog_bite_amount = 20
	
	if(obj_dog_bowl.food_amount >= dog_bite_amount) {
		if(hunger + obj_dog_bowl.hunger_increase >= 100 && hunger < 100) {
			hunger = 100
			obj_dog_bowl.food_amount -= dog_bite_amount
			show_debug_message("Dog is now full")
		} 
		else if (hunger == 100) {
			show_debug_message("Dog is too full to eat")
		}
		else {
			hunger += obj_dog_bowl.hunger_increase
			obj_dog_bowl.food_amount -= dog_bite_amount
			show_debug_message("Dog has eaten")
		}
	} else {
		playErrorSound()
		show_debug_message("Need to buy more food")
	}
	show_debug_message("Amount of food left: " + string(obj_dog_bowl.food_amount))
}