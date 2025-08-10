show_debug_message("obj_DEBUG_MANAGER MESSAGE: KEY '2' PRESSED" )
if(obj_dog_bowl.food_amount < 120) obj_dog_bowl.food_amount += 20

if(obj_dog_bowl.current_colour < BowlColour.PINK) obj_dog_bowl.current_colour++
else obj_dog_bowl.current_colour = BowlColour.RED