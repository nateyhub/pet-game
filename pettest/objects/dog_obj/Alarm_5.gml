//TWO CONDITIONS:
// 1. if the current energy value is less than the initial value + whatever energy increase the bath gives
// 2. AND if the current energy value is less than 100 (the max value that energy can be)
if global.pet_needs.energy.value < _initial_energy_amount + _sleep_amount and global.pet_needs.energy.value < 100 
{
	global.pet_needs.energy.value++
	setAlarmInSeconds(actionAlarms.SLEEP,0.05)
} else {
	isSleeping = false
	//if the dog reached a full bladder during the bath, now the dog can empty it
	_wait_to_empty_bladder = false
}