if(position_meeting(mouse_x, mouse_y, self)) 
{
	draw_healthbar(x-12,y+14,x+12,y+18, food_amount, c_black, c_red, c_green, 0, true, false)
}

//draw the back of the food bowl in its current colour (eg purple)
draw_sprite(spr_dogbowl_back,current_colour,x,y)
//draw the current amount of food in the bowl (1 of 3 states)

switch(current_tier) {
	case tier.CHEAP:
		draw_sprite(spr_dog_cheap_food_level,food_level,x,y)
		break
	case tier.GOOD:
		draw_sprite(spr_dog_good_food_level,food_level,x,y)
		break
	case tier.ULTIMATE:
		draw_sprite(spr_dog_ultimate_food_level,food_level,x,y)
}


//draw the front of the bowl on top
draw_sprite(spr_dogbowl_front,current_colour,x,y)