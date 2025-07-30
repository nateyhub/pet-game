// draw grey background
draw_set_colour(_need_colour_empty)
draw_rectangle(20,20,550,140,false)

// draw a bar representing the value of each need (health, hunger etc.)
for (var i = 0; i < array_length(global.needs_keys); i++) {
	// get each key (eg health)
	var key = global.needs_keys[i]
	
	// set the colour of the bar according to the current value of this need (eg low value = red)
	if (global.pet_needs[$ key].value <= 35) {
		draw_set_colour(_need_colour_low)
	} else if (global.pet_needs[$ key].value > 35 and global.pet_needs[$ key].value <= 75) {
		draw_set_colour(_need_colour_medium)
	} else {
		draw_set_colour(_need_colour_high)
	}
	
	// draw a rectangle using the need's given x & y coords and current value (out of 100)
	draw_rectangle(
		global.pet_needs[$ key].x,
		global.pet_needs[$ key].y,
		global.pet_needs[$ key].x + (global.pet_needs[$ key].value),
		global.pet_needs[$ key].y + _need_bar_height_px,
		false
	)
}


// draw the main GUI element on top of the bars
draw_sprite(gui_spr,0,0,0)

//draw the number of points the player has
draw_text(52,160,string(global.points))

