#macro DRAIN_HEALTH_ALARM 0
#macro INCREASE_POINTS_ALARM 1

//pet needs struct (globally accessible)
global.pet_needs = {
	health:		{ value: 90, x: 178, y: 46 },
	hunger:		{ value: 3, x: 178, y: 106 },
	energy:		{ value: 4, x: 312, y: 46 },
	hygiene:	{ value: 1, x: 312, y: 106 },
	bladder:	{ value: 1, x: 446, y: 46 },
	fun:		{ value: 88, x: 446, y: 106 },
}

global.needs_critical = false

//show_debug_message("HEALTH" + string(global.pet_needs.health.value))

global.needs_keys = variable_struct_get_names(global.pet_needs)

//total points
global.points = 0

global.ultimateNeedsCount = 0



//DEBUG:
	//for (var i = 0; i < array_length(global.needs_keys); i++) {
	//	var key = global.needs_keys[i]
	//	show_debug_message(key + ": " + string(global.pet_needs[$ key].value))
	//}

//alarm[0] = game_get_speed(gamespeed_fps) * 1