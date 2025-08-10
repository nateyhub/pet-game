//TWO CONDITIONS:
// 1. if the current hygiene value is less than the initial value + whatever hygiene increase the bath gives
// 2. AND if the current hygiene value is less than 100 (the max value that hygiene can be)
if global.pet_needs.hygiene.value < _initial_hygiene_amount + _bathe_amount and global.pet_needs.hygiene.value < 100 
{
	global.pet_needs.hygiene.value++
	drainNeed("energy",0.15)
	improveNeed("fun",0.1)
	setAlarmInSeconds(actionAlarms.TAKE_BATH,0.05)
} else {
	//finished bathing
	isBathing = false
	//move the dog out of the tub
	y = obj_bath.y+64
	//change the tub's sprite back to the original empty state
	obj_bath.sprite_index = spr_bathtub
	//change the dog's sprite back
	self.sprite_index = spr_dog_idle
	//if the dog reached a full bladder during the bath, now the dog can empty it
	_wait_to_empty_bladder = false
}