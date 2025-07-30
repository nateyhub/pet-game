if(keyboard_check_released(vk_space)) {
	var dog_bite_amount = 20
	
	if(dog_bowl_obj.food_amount >= dog_bite_amount) {
		if(hunger + dog_bowl_obj.hunger_increase >= 100 && hunger < 100) {
			hunger = 100
			dog_bowl_obj.food_amount -= dog_bite_amount
			show_message("Dog is now full")
		} 
		else if (hunger == 100) {
			show_message("Dog is too full to eat")
		}
		else {
			hunger += dog_bowl_obj.hunger_increase
			dog_bowl_obj.food_amount -= dog_bite_amount
			show_debug_message("Dog has eaten")
		}
	} else {
		show_message("Need to buy more food")
	}
	show_debug_message("Amount of food left: " + string(dog_bowl_obj.food_amount))
}