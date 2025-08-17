// ACTION ALARM: SLEEP
//TWO CONDITIONS:
// 1. if the current energy value is less than the initial value + whatever energy increase the bath gives
// 2. AND if the current energy value is less than 100 (the max value that energy can be)
var nap_energy_gain = 24
if isPassedOut {
	if(global.pet_needs.energy.value < _initial_energy_amount + nap_energy_gain) {
		global.pet_needs.energy.value++
		drainNeed("hunger",0.5)
		drainNeed("bladder",0.4)
		drainNeed("hygiene",0.6)
		drainNeed("fun",0.5)
		setAlarmInSeconds(actionAlarms.SLEEP,0.05)
	} else {
		isSleeping = false
		isPassedOut = false
		//if the dog reached a full bladder during sleep, now the dog can empty it
		_wait_to_empty_bladder = false
	}

} else {
	if global.pet_needs.energy.value < obj_dog_bed.increaseEnergyTo and global.pet_needs.energy.value < 100 
	{
		global.pet_needs.energy.value++
		drainNeed("hunger",0.5)
		drainNeed("bladder",0.4)
		drainNeed("hygiene",0.4)
		drainNeed("fun",0.3)
		improveNeed("health",0.1)
		setAlarmInSeconds(actionAlarms.SLEEP,0.05)
	} else {
		isSleeping = false
		isPassedOut = false
		//if the dog reached a full bladder during sleep, now the dog can empty it
		_wait_to_empty_bladder = false
	}
	
}

