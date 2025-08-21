_x = 24
_y = 284

#region draw brightness according to the time of day

var brightness = (cos(0.26 * global.day_current_hour)  + 0.8)/2
var dim_amount =  max(0,brightness)
//var dim_amount = 0.5

//show_debug_message(global.day_current_hour)
if (global.day_current_hour > 12 and global.day_current_hour < 20) {
	draw_set_colour(make_color_rgb(160,60,50))
	//if !layer_get_visible("sunset") layer_set_visible("sunset", true)
	dim_amount *= .4
} else if (global.day_current_hour >= 20 and global.day_current_hour < 22) {
	//8pm or later
	//if layer_get_visible("sunset") layer_set_visible("sunset", false)
	//if !layer_get_visible("early_night") layer_set_visible("early_night", true)
	dim_amount *= .5
	draw_set_colour(make_color_rgb(7,8,30))
} else if (global.day_current_hour >= 22 and global.day_current_hour < 24) or (global.day_current_hour >= 0 and global.day_current_hour <= 8) {
	draw_set_colour(make_color_rgb(7,8,30))
	//if !layer_get_visible("late_night") layer_set_visible("late_night", true)
	//if layer_get_visible("early_night") layer_set_visible("early_night", false)
	//dim_amount = 0
	dim_amount *= .7
} else {
	//if layer_get_visible("late_night") layer_set_visible("late_night", false)
	
	dim_amount *= .8
	draw_set_colour(make_color_rgb(7,8,30))
}

draw_set_alpha(dim_amount)
draw_rectangle(0,0,view_get_wport(0),view_get_hport(0),false)
draw_set_alpha(1)
draw_set_colour(c_white)
//layer_background_blend(layer_background_get_id(layer_get_id("Background")),c_aqua)

#endregion

//portrait and gui in bottom left
draw_sprite(spr_new_gui_holder,0,0,camera_get_view_height(0)-112)
draw_sprite(spr_new_gui_portrait,0,-10,camera_get_view_height(0)-192)




//draw calendar and day
draw_sprite_stretched(spr_calendar,0,camera_get_view_width(0)-140,10,138,134)
draw_set_halign(fa_center)

draw_set_font(fnt_calendar_day_text)
draw_set_color(c_black)
draw_text(camera_get_view_width(0)-70, 52, string("Day"))
draw_set_font(fnt_calendar_day_number)
draw_text(camera_get_view_width(0)-70, 68, string("{0}", global.current_game_day))
draw_set_font(fnt_clock)

//draw time
draw_set_halign(fa_center)
draw_sprite_stretched(spr_clock,0,camera_get_view_width(0)-140,130,138,58)
draw_text(camera_get_view_width(0)-70, 146, global.current_time_string)
draw_set_color(c_white)
draw_set_font(fnt_gui)

draw_set_halign(fa_left)

// draw grey background
draw_set_colour(_colours.background.main_colour)
draw_rectangle(20,20,550,140,false)

//draw_sprite_stretched(spr_coin,0,200,400,32,32)

#region DRAW A BAR REPRESENTING THE VALUE OF EACH NEED (HEALTH, HUNGER ETC)
for (var i = 0; i < 6; i++) {
	// get each key (eg health)
	var key = global.needs_keys[i]
	var current_need = global.pet_needs[$ key]

	
	// set the colour of the bar according to the current value of this need (eg low value = red)
	if (current_need.value < 15) {
		_current_main_colour = _colours.very_low.main_colour
		_current_shade_colour = _colours.very_low.shade_colour
	} else if (current_need.value >= 15 and current_need.value < 30) {
		_current_main_colour = _colours.low.main_colour
		_current_shade_colour = _colours.low.shade_colour
	} else if (current_need.value >= 30 and current_need.value < 65) {
		_current_main_colour = _colours.medium.main_colour
		_current_shade_colour = _colours.medium.shade_colour
	} else if (current_need.value >= 65 and current_need.value < 90) {
		_current_main_colour = _colours.high.main_colour
		_current_shade_colour = _colours.high.shade_colour
	} else {
		_current_main_colour = _colours.ultimate.main_colour
		_current_shade_colour = _colours.ultimate.shade_colour
	}
	
	draw_set_colour(_current_main_colour)
	
	// draw a rectangle using the need's given x & y coords and current value (out of 100)
	draw_rectangle(
		current_need.x,
		current_need.y,
		current_need.x + (current_need.value),
		current_need.y + _need_bar_height_px,
		false
	)
	
	draw_set_colour(_current_shade_colour)
	
	// draw shading bar
	draw_rectangle(
		current_need.x,
		current_need.y + (_need_bar_shading_px),
		current_need.x + (current_need.value),
		current_need.y + _need_bar_height_px,
		false
	)
	
		
	switch(current_need.change_direction) {
		case needChangeDirection.DECREASING_LOW:
			//draw decreasing need animation
			draw_sprite(spr_decrease_low,image_index/2,global.pet_needs[$ key].x,global.pet_needs[$ key].y+2)
			break
		case needChangeDirection.DECREASING:
			//draw decreasing need animation
			draw_sprite(spr_decrease,image_index/2,global.pet_needs[$ key].x,global.pet_needs[$ key].y+2)
			break
		case needChangeDirection.INCREASING_LOW:
			//draw increasing need animation
			draw_sprite(spr_increase_low,image_index/2,global.pet_needs[$ key].x,global.pet_needs[$ key].y+2)
			break
		case needChangeDirection.INCREASING:
			//draw increasing need animation
			draw_sprite(spr_increase,image_index/2,global.pet_needs[$ key].x,global.pet_needs[$ key].y+2)
			break
	}
}
#endregion


// draw the main GUI element on top of the bars
draw_sprite(spr_gui,0,0,0)




//draw the number of points the player has
draw_set_colour(_colours.text)
draw_set_font(fnt_gui)
draw_text(52,160,string(global.points))

//draw the current number of needs that are at an Ultimate level
if global.ultimateNeedsCount > 0 draw_text(94,160,string("+{0}", global.ultimateNeedsCount))

#region HANDLE INVENTORY SLOTS

for(var i = 0; i < 3; i++) 
{
	draw_sprite_stretched(spr_inv_slot,UNSELECTED,_x,_y,80,80)
	if global.inventory.slotContainsItem(i)
	{
		//get the slot item
		var _item = global.inventory.getItemInSlot(i)
		
		//draw the item sprite in the slot
		if(is_instanceof(_item, TieredItem)) {
			draw_sprite_stretched(_item.spr_index, _item.item_tier, _x+8,_y+8, 66,66)
		} else {
			draw_sprite_stretched(_item.spr_index, 0, _x+8,_y+8, 66,66)
		}
		
		
		//if the mouse is hovering over this slot
		if(device_mouse_x_to_gui(MOUSE) >= _x and device_mouse_x_to_gui(MOUSE) <= _x+70 and device_mouse_y_to_gui(MOUSE) >= _y and device_mouse_y_to_gui(MOUSE) <= _y+70) 
		{
			//draw the second (index 1) frame of the inventory slot to show it's being hovered over
			draw_sprite_stretched(spr_inv_slot,SELECTED,_x,_y,80,80)
			
			//if the user clicks on the slot
			if(device_mouse_check_button_pressed(MOUSE, mb_left)) 
			{
				//if the user isn't already holding an item
				if(global.holdingAnItem == false) 
				{						
					//remove item from the inventory slot
					global.inventory.removeItemInSlot(i)
					//make the user currently hold the item
					show_debug_message(string("Item properties: {0}", _item))
					
					
					var _inst_data = {
						_isBeingDragged: true,
						name: _item.name,
						need_effect: _item.need_effect,
						room_layer: _item.room_layer,
						obj_index: _item.obj_index,
						spr_index: _item.spr_index
					}
					//if the item is a TieredItem, set its tier
					if(is_instanceof(_item, TieredItem)) _inst_data.item_tier = _item.item_tier
					
					var item_object = instance_create_layer(mouse_x,mouse_y,_item.room_layer, _item.obj_index, _inst_data)
					
					
					global.holdingAnItem = true
					global.selectedItem = item_object
					show_debug_message(global.inventory)
				} 
				else
				{
					playErrorSound()
					show_debug_message("Already holding an item!")
				}
			} 
		}
	} else {
		if global.holdingAnItem and (device_mouse_x_to_gui(MOUSE) >= _x and device_mouse_x_to_gui(MOUSE) <= _x+70 and device_mouse_y_to_gui(MOUSE) >= _y and device_mouse_y_to_gui(MOUSE) <= _y+70)
		{
			//draw the second (index 1) frame of the inventory slot to show it's being hovered over
			draw_sprite_stretched(spr_inv_slot,SELECTED,_x,_y,80,80)
			
			if (device_mouse_check_button_pressed(MOUSE, mb_left)) {
				//add item to empty slot
				show_debug_message(string("Selected item: {0}", global.selectedItem.item_details))
				global.inventory.putItemInSlot(i, global.selectedItem.item_details)
			
				//destroy the instance
				instance_destroy(global.selectedItem)
				global.selectedItem = noone
				global.holdingAnItem = false
				show_debug_message(global.inventory)
			}
		}
	}
	_y += 100
}

#endregion