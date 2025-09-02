if global.showing_dialogue return;

_ww = window_get_width()
_wh = window_get_height()
_draw_tip = undefined

//if (_ww >= 2560 or _wh >= 1440) {
//	//if display_get_gui_width() != 1366 display_set_gui_size(1366,768)	
//	if display_get_gui_width() != 1280 display_set_gui_size(1280,720)	
//	//if display_get_gui_width() != 1366 display_set_gui_size(2560,1440)	
//	_x = display_get_gui_width() / 2 - (sprite_get_width(spr_inv_slot) + 100) + 200
//} else {
//	if display_get_gui_width() != 1920 display_set_gui_size(1920,1080)
//	_x = display_get_gui_width() / 2 - (sprite_get_width(spr_inv_slot) * 1.5 + 100)
//}

_x = display_get_gui_width() / 2 - (sprite_get_width(spr_inv_slot) * 1.5 + 50)
_y = display_get_gui_height() - 100


#region draw brightness according to the time of day

//var brightness = (cos(0.26 * global.day_current_hour)  + 0.8)/2
//var dim_amount =  max(0,brightness)
////var dim_amount = 0.5

////show_debug_message(global.day_current_hour)
//if (global.day_current_hour > 12 and global.day_current_hour < 20) {
//	draw_set_colour(make_color_rgb(160,60,50))
//	//if !layer_get_visible("sunset") layer_set_visible("sunset", true)
//	dim_amount *= .4
//} else if (global.day_current_hour >= 20 and global.day_current_hour < 22) {
//	//8pm or later
//	//if layer_get_visible("sunset") layer_set_visible("sunset", false)
//	//if !layer_get_visible("early_night") layer_set_visible("early_night", true)
//	dim_amount *= .5
//	draw_set_colour(make_color_rgb(7,8,30))
//} else if (global.day_current_hour >= 22 and global.day_current_hour < 24) or (global.day_current_hour >= 0 and global.day_current_hour <= 8) {
//	draw_set_colour(make_color_rgb(7,8,30))
//	//if !layer_get_visible("late_night") layer_set_visible("late_night", true)
//	//if layer_get_visible("early_night") layer_set_visible("early_night", false)
//	//dim_amount = 0
//	dim_amount *= .7
//} else {
//	//if layer_get_visible("late_night") layer_set_visible("late_night", false)
	
//	dim_amount *= .8
//	draw_set_colour(make_color_rgb(7,8,30))
//}

//draw_set_alpha(dim_amount)
//draw_rectangle(0,0,view_get_wport(0),view_get_hport(0),false)
//draw_set_alpha(1)
//draw_set_colour(c_white)
//layer_background_blend(layer_background_get_id(layer_get_id("Background")),c_aqua)

#endregion

//portrait and gui in bottom left
draw_sprite_stretched(spr_new_gui_holder,0,0,display_get_gui_height()-124+ _slide_y_offset,514,140)
draw_sprite_stretched(spr_new_gui_holder,0,0,display_get_gui_height()-124+_slide_y_offset,514,140)

//TODO: scale up entire interface for 2K resolution?
//if window_get_width() >= 2560 and window_get_height() >= 1440 { 
//	show_debug_message("drawing new portrait")
	
//	//display_set_gui_size(1920,1080)
//	draw_circle(200,200,200,false)
	
//	draw_sprite_stretched(spr_new_gui_holder,0,0,display_get_gui_height()-(124*1.25)+ _slide_y_offset,514*1.25,140*1.25)
//	draw_sprite_stretched(spr_new_gui_portrait,0,-10,display_get_gui_height()-212+_slide_y_offset, sprite_get_width(spr_new_gui_portrait)+20, sprite_get_height(spr_new_gui_portrait)+20)
//	draw_sprite_ext(spr_new_gui_portrait,0,-10,display_get_gui_height()-240+ _slide_y_offset,1.25,1.25,0,c_white,1)
//}
//else { 
//	//draw_sprite_stretched(spr_new_gui_portrait,0,-10,camera_get_view_height(0)-212, sprite_get_width(spr_new_gui_portrait)+20, sprite_get_height(spr_new_gui_portrait)+20)

//}
	draw_sprite_stretched(spr_new_gui_portrait,0,-10,display_get_gui_height()-212+_slide_y_offset, sprite_get_width(spr_new_gui_portrait)+20, sprite_get_height(spr_new_gui_portrait)+20)



//draw calendar and day
draw_sprite_stretched(spr_calendar,0,display_get_gui_width()-200,10,180,180)
draw_set_color(c_black)
draw_set_halign(fa_center)
draw_set_font(fnt_calendar_day_text)
draw_text(display_get_gui_width()-110, 56, string("Day"))

draw_set_color(c_ltgray)
draw_set_font(fnt_calendar_day_number)
draw_text(display_get_gui_width()-104, 86, string("{0}", global.current_game_day))

draw_set_color(c_black)
draw_text(display_get_gui_width()-108, 82, string("{0}", global.current_game_day))

//draw clock and time
draw_set_font(fnt_clock)
draw_set_halign(fa_center)
draw_sprite_stretched(spr_clock_and_points,0,display_get_gui_width()-200,180,180,64)
draw_text(display_get_gui_width()-110, 196, global.current_time_string)
draw_set_color(c_white)
draw_set_font(fnt_gui)
draw_set_halign(fa_left)

//draw the number of points the player has
draw_sprite_stretched(spr_clock_and_points,0,display_get_gui_width()-200,230,180,64)
draw_sprite(spr_coin, 0, display_get_gui_width()-188,248)
draw_set_colour(_colours.text)
draw_set_font(fnt_clock)
draw_text(display_get_gui_width()-150,246,string(global.points))

//draw the current number of needs that are at an Ultimate level
if global.ultimateNeedsCount > 0 draw_text(display_get_gui_width()-64,246,string("+{0}", global.ultimateNeedsCount))


// draw grey background
//draw_set_colour(_colours.background.main_colour)
//draw_rectangle(20,20,550,140,false)

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
	var _bar_outline = bar_outline.NORMAL
	if current_need.value > 0 {
		draw_rectangle(
			current_need.x+4,
			display_get_gui_height() - current_need.y + _slide_y_offset,
			current_need.x+4 + (current_need.value),
			display_get_gui_height() - current_need.y + _need_bar_height_px-1 + _slide_y_offset,
			false
		)
		
		draw_set_colour(_current_shade_colour)
	
		// draw shading bar
		draw_rectangle(
			current_need.x+4,
			display_get_gui_height() - current_need.y + (_need_bar_shading_px) + 2 + _slide_y_offset,
			current_need.x+4 + (current_need.value),
			display_get_gui_height() - current_need.y + _need_bar_height_px-1 + _slide_y_offset,
			false
		)
		
		//if mouse is hovering over a need, show the need's name and value
		if(device_mouse_x_to_gui(0) >= current_need.x and device_mouse_x_to_gui(0) <= current_need.x + sprite_get_width(spr_need_bar))
		{
			if device_mouse_y_to_gui(0) >= display_get_gui_height() - current_need.y and device_mouse_y_to_gui(0) <= display_get_gui_height() - current_need.y + sprite_get_height(spr_need_bar) {
				_draw_tip = {
					_x: current_need.x,
					_y: current_need.y,
					_key: key,
					_value: current_need.value
				}
			}
		}
		
		var stripes_ind = spr_decrease
		var draw_stripes = false
		
		switch(current_need.change_direction) {
			case needChangeDirection.DECREASING_LOW:
				//draw decreasing need animation
				stripes_ind = spr_decrease_low
				draw_stripes = true
				_bar_outline = bar_outline.DECREASING
				//draw_sprite(spr_decrease_low,image_index/2,current_need.x, camera_get_view_height(0)-current_need.y+2)
				break
			case needChangeDirection.DECREASING:
				//draw decreasing need animation
				stripes_ind = spr_decrease
				draw_stripes = true
				_bar_outline = bar_outline.DECREASING
				//draw_sprite(spr_decrease,image_index/2,current_need.x, camera_get_view_height(0)-current_need.y+2)
				break
			case needChangeDirection.INCREASING_LOW:
				//draw increasing need animation
				stripes_ind = spr_increase_low
				draw_stripes = true
				_bar_outline = bar_outline.INCREASING
				//draw_sprite(spr_increase_low,image_index/2,current_need.x, camera_get_view_height(0)-current_need.y+2)
				break
			case needChangeDirection.INCREASING:
				//draw increasing need animation
				stripes_ind = spr_increase
				draw_stripes = true
				_bar_outline = bar_outline.INCREASING
				//draw_sprite(spr_increase,image_index/2,current_need.x, camera_get_view_height(0)-current_need.y+2)
				break
		}
	
		//if the INCREASING/DECREASING stripes should be drawn
		if draw_stripes 
		{ 
			draw_sprite(stripes_ind,image_index/2,current_need.x, display_get_gui_height()-current_need.y+4)
		}
	} else {
		_bar_outline = bar_outline.DECREASING
	}
	
	//draw the need bar
	//draw_sprite(spr_need_bar,_bar_outline,current_need.x,camera_get_view_height(0)-current_need.y)
	draw_sprite(spr_need_bar,0,current_need.x,	display_get_gui_height()-current_need.y+_slide_y_offset)
	
	//draw the icon for the current need (e.g. health = heart icon) to the left of the bar
	//draw_sprite(spr_all_needs_icons, current_need.icon_subimage,current_need.x-28,camera_get_view_height(0)-current_need.y-1)
	draw_sprite(spr_all_needs_icons, current_need.icon_subimage, current_need.x-28,display_get_gui_height()-current_need.y-1+_slide_y_offset)
	
	//TODO: maybe enlarge the icons?
	//draw_sprite_ext(spr_all_needs_icons, current_need.icon_subimage, current_need.x-28,camera_get_view_height(0)-current_need.y-1+_slide_y_offset, 1.5, 1.5, 0, c_white, 1)
}
#endregion


//draw the pet name
//draw_sprite(spr_dog_bone_1, 0, 134, camera_get_view_height(0)-183)
draw_sprite_stretched(spr_dog_bone_1, 0, 152, display_get_gui_height()-170, sprite_get_width(spr_dog_bone)+(global.pet_name_length*12)+10, sprite_get_height(spr_dog_bone)+18)
draw_set_colour(_colours.text)
draw_set_font(fnt_nametag)
draw_text(220,display_get_gui_height()-162,global.pet_name)

#region HANDLE INVENTORY SLOTS

for(var i = 0; i < 3; i++) 
{
	draw_sprite_stretched(spr_inv_slot,UNSELECTED,_x,_y,80,80)
	if global.inventory.slotContainsItem(i)
	{
		//get the slot item
		var _item = global.inventory.getItemInSlot(i)
		
		if(device_mouse_x_to_gui(MOUSE) >= _x and device_mouse_x_to_gui(MOUSE) <= _x+70 and device_mouse_y_to_gui(MOUSE) >= _y and device_mouse_y_to_gui(MOUSE) <= _y+70) 
		{
			//draw the second (index 1) frame of the inventory slot to show it's being hovered over
			draw_sprite_stretched(spr_inv_slot,SELECTED,_x,_y,80,80)
			
		}
		
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
			//draw_sprite_stretched(spr_inv_slot,SELECTED,_x,_y,80,80)
			
			//if the user clicks on the slot
			if(device_mouse_check_button_pressed(MOUSE, mb_left)) 
			{
				//if the user isn't already holding an item
				if(global.holdingAnItem == false) 
				{						
					audio_play_sound(sfx_click,100,false)
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
	_x += 120
}

#endregion

_slide_y_offset = _slide_y_offset > 0 ? _slide_y_offset - 6 : 0

//if the player is hovering over a need bar, draw the need and its current value (e.g. "Hunger: 100")
if !is_undefined(_draw_tip) {
	draw_sprite_stretched(spr_hint, 0, _draw_tip._x, display_get_gui_height() - _draw_tip._y - 24, sprite_get_width(spr_need_bar), sprite_get_height(spr_hint))
	draw_set_color(c_white)
	draw_set_font(fnt_hint)
	draw_set_halign(fa_center)
	draw_text(_draw_tip._x + (sprite_get_width(spr_need_bar) / 2),display_get_gui_height() - _draw_tip._y - 25, string("{0}: {1}", _draw_tip._key, round(_draw_tip._value)))
	draw_set_halign(fa_left)
}