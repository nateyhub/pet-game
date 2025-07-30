//pet needs struct (globally accessible)
global.pet_needs = {
	health:		{ value: 50, x: 178, y: 46 },
	hunger:		{ value: 10, x: 178, y: 106 },
	energy:		{ value: 74, x: 310, y: 46 },
	hygiene:	{ value: 62, x: 310, y: 106 },
	bladder:	{ value: 18, x: 444, y: 46 },
	fun:		{ value: 88, x: 444, y: 106 },
}

//show_debug_message("HEALTH" + string(global.pet_needs.health.value))

global.needs_keys = variable_struct_get_names(global.pet_needs)

//total points
global.points = 2352

//DEBUG:
	//for (var i = 0; i < array_length(global.needs_keys); i++) {
	//	var key = global.needs_keys[i]
	//	show_debug_message(key + ": " + string(global.pet_needs[$ key].value))
	//}

//alarm[0] = game_get_speed(gamespeed_fps) * 1