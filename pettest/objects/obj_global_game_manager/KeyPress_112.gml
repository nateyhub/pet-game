//DEBUG FUNCTION: sets all needs to half value
for(var i = 0; i < array_length(global.needs_keys); i++) {
	var key = global.needs_keys[i]
	global.pet_needs[$ key].value = 50
}