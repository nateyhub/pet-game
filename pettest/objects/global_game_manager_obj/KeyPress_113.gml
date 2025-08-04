//DEBUG FUNCTION: sets all needs to max value
for(var i = 0; i < array_length(global.needs_keys); i++) {
	var key = global.needs_keys[i]
	global.pet_needs[$ key].value = 100
}