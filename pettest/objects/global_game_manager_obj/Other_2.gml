#macro DRAIN_HEALTH_ALARM 0
#macro INCREASE_POINTS_ALARM 1

//pet needs struct (globally accessible)
global.pet_needs = {
	health:		{ value: 90, x: 178, y: 46 },
	hunger:		{ value: 93, x: 178, y: 106 },
	energy:		{ value: 24, x: 312, y: 46 },
	hygiene:	{ value: 91, x: 312, y: 106 },
	bladder:	{ value: 91, x: 446, y: 46 },
	fun:		{ value: 88, x: 446, y: 106 },
}

global.needs_critical = false

//show_debug_message("HEALTH" + string(global.pet_needs.health.value))

global.needs_keys = variable_struct_get_names(global.pet_needs)

//total points
global.points = 0

global.ultimateNeedsCount = 0


//DEBUG: Testing Inventory
global.inventory = new Inventory()

_item = new TieredItem("Dog food", 5, dog_food_obj, "Instances", tier.CHEAP) 
global.inventory.addItem(_item)
_retrieved_item = global.inventory.getItem("Dog food")
_dogfood = instance_create_layer(mouse_x, mouse_y, _retrieved_item.room_layer, _retrieved_item.obj_index)
_dogfood._isBeingDragged = true

show_debug_message(global.inventory)




//DEBUG:
	//for (var i = 0; i < array_length(global.needs_keys); i++) {
	//	var key = global.needs_keys[i]
	//	show_debug_message(key + ": " + string(global.pet_needs[$ key].value))
	//}

//alarm[0] = game_get_speed(gamespeed_fps) * 1