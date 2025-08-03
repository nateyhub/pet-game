show_debug_message("Running Alarm 1")
setAlarmInSeconds(INCREASE_POINTS_ALARM, 2)

global.ultimateNeedsCount = 0

for (var i = 0; i < array_length(global.needs_keys); i++) {
	var key = global.needs_keys[i]
    if (global.pet_needs[$ key].value >= 90 and key != "health" and key != "bladder") { //excluding health & bladder - might choose to add later
		show_debug_message(string("{0} is at ultimate level! Increasing points", key))
		global.points++
		global.ultimateNeedsCount++
	}
}

