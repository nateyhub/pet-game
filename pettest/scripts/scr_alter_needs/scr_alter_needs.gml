/// @function drainNeed
/// @description Drains the given need by the given amount
/// @param {string} needName The name of the need in lowercase (e.g. "bladder")
/// @param {real} drainAmount The amount to decrease the need's value by (e.g. 5)
function drainNeed(needName, drainAmount) {
	global.pet_needs[$ needName].value = max(0, global.pet_needs[$ needName].value - drainAmount)
}

/// @function improveNeed
/// @description Increases the given need value by the given amount
/// @param {string} needName The name of the need in lowercase (e.g. "bladder")
/// @param {real} improveAmount The amount to increase the need's value by (e.g. 5)
function improveNeed(needName, improveAmount) {
	global.pet_needs[$ needName].value = min(global.pet_needs[$ needName].value + improveAmount, 100)
}