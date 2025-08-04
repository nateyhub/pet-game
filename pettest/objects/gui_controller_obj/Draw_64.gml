// dim if dog is sleeping
if (dog_obj.isSleeping) {
	draw_set_colour(c_black)
	draw_set_alpha(0.5)
	draw_rectangle(0,0,10000,room_height,false)
	draw_set_alpha(1)
}

// draw grey background
draw_set_colour(_colours.background.main_colour)
draw_rectangle(20,20,550,140,false)

// draw a bar representing the value of each need (health, hunger etc.)
for (var i = 0; i < array_length(global.needs_keys); i++) {
	// get each key (eg health)
	var key = global.needs_keys[i]
	
	// set the colour of the bar according to the current value of this need (eg low value = red)
	if (global.pet_needs[$ key].value <= 14) {
		draw_set_colour(_colours.very_low.main_colour)
	} else if (global.pet_needs[$ key].value >= 15 and global.pet_needs[$ key].value <= 29) {
		draw_set_colour(_colours.low.main_colour)
	} else if (global.pet_needs[$ key].value >= 29 and global.pet_needs[$ key].value <= 64) {
		draw_set_colour(_colours.medium.main_colour)
	} else if (global.pet_needs[$ key].value >= 65 and global.pet_needs[$ key].value <= 89) {
		draw_set_colour(_colours.high.main_colour)
	} else {
		draw_set_colour(_colours.ultimate.main_colour)
	}
	
	// draw a rectangle using the need's given x & y coords and current value (out of 100)
	draw_rectangle(
		global.pet_needs[$ key].x,
		global.pet_needs[$ key].y,
		global.pet_needs[$ key].x + (global.pet_needs[$ key].value),
		global.pet_needs[$ key].y + _need_bar_height_px,
		false
	)
	
	// set the colour of the bar according to the current value of this need (eg low value = red)
	if (global.pet_needs[$ key].value <= 14) {
		draw_set_colour(_colours.very_low.shade_colour)
	} else if (global.pet_needs[$ key].value >= 15 and global.pet_needs[$ key].value <= 29) {
		draw_set_colour(_colours.low.shade_colour)
	} else if (global.pet_needs[$ key].value >= 29 and global.pet_needs[$ key].value <= 64) {
		draw_set_colour(_colours.medium.shade_colour)
	} else if (global.pet_needs[$ key].value >= 65 and global.pet_needs[$ key].value <= 89) {
		draw_set_colour(_colours.high.shade_colour)
	} else {
		draw_set_colour(_colours.ultimate.shade_colour)
	}
	
	// draw shading bar
	draw_rectangle(
		global.pet_needs[$ key].x,
		global.pet_needs[$ key].y + (_need_bar_shading_px),
		global.pet_needs[$ key].x + (global.pet_needs[$ key].value),
		global.pet_needs[$ key].y + _need_bar_height_px,
		false
	)
}



// draw the main GUI element on top of the bars
draw_sprite(gui_spr,0,0,0)


//draw the number of points the player has
draw_set_colour(_colours.text)
draw_text(52,160,string(global.points))

//draw the current number of needs that are at an Ultimate level
if global.ultimateNeedsCount > 0 draw_text(100,159,string("+{0}", global.ultimateNeedsCount))