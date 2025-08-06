/// @function drainNeed
/// @description Drains the given need by the given amount
/// @param {string} needName The name of the need in lowercase (e.g. "bladder")
/// @param {real} drainAmount The amount to decrease the need's value by (e.g. 5)
function drainNeed(needName, drainAmount) {
	show_debug_message("Draining " + needName + "(" + string(global.pet_needs[$ needName].value) + 
		" => " + string(global.pet_needs[$ needName].value - drainAmount) + ")")
	if(global.pet_needs[$ needName].value - drainAmount >= 0) {
		global.pet_needs[$ needName].value -= drainAmount
	} else {
		global.pet_needs[$ needName].value  = 0
	}
}