//DEBUG FUNCTION: sets all needs to low value
for(var i = 0; i < array_length(global.needs_keys); i++) {
	var key = global.needs_keys[i]
	if key != "bladder" global.pet_needs[$ key].value = 10
}