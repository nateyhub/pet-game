
_x = 24
_y = 284

#region dim if dog is sleeping
if (obj_dog.isSleeping) {
	draw_set_colour(c_black)
	draw_set_alpha(0.5)
	draw_rectangle(0,0,view_get_wport(0),view_get_hport(0),false)
	draw_set_alpha(1)
}
#endregion

// draw grey background
draw_set_colour(_colours.background.main_colour)
draw_rectangle(20,20,550,140,false)

draw_sprite_stretched(spr_coin,0,200,400,32,32)

#region DRAW A BAR REPRESENTING THE VALUE OF EACH NEED (HEALTH, HUNGER ETC)
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
#endregion

// draw the main GUI element on top of the bars
draw_sprite(spr_gui,0,0,0)

draw_sprite( spr_need_increase,0,284,100)


//draw the number of points the player has
draw_set_colour(_colours.text)
draw_text(52,160,string(global.points))

//draw the current number of needs that are at an Ultimate level
if global.ultimateNeedsCount > 0 draw_text(100,159,string("+{0}", global.ultimateNeedsCount))

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
					show_debug_message("Already holding an item!")
				}
			} 
		}
	} else {
		if global.holdingAnItem and (device_mouse_x_to_gui(MOUSE) >= _x and device_mouse_x_to_gui(MOUSE) <= _x+70 and device_mouse_y_to_gui(MOUSE) >= _y and device_mouse_y_to_gui(MOUSE) <= _y+70) 
		and (device_mouse_check_button_pressed(MOUSE, mb_left)) {
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
	_y += 100
}

#endregion