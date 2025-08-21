//show_debug_message("Running Alarm 1")
setAlarmInSeconds(INCREASE_POINTS_ALARM, 2)

global.ultimateNeedsCount = 0

// if none of the needs are in a critical state
if(!global.needs_critical) {
	// go through each need's current value
	for (var i = 0; i < array_length(global.needs_keys); i++) {
		var key = global.needs_keys[i]
		// for each need, if the current value is above 90, reward the player with points
		if (global.pet_needs[$ key].value >= 90 and key != "health") { //excluding health - might choose to add later
			show_debug_message(string("{0} is at ultimate level! Increasing points", key))
			global.points++
			//increment the count to display on the GUI (eg "+2" means plus 2 points for 2 needs being ultimate)
			global.ultimateNeedsCount++
		}
	}
}


