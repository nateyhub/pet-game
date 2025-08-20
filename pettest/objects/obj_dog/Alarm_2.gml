// ACTION ALARM: SLEEP
//TWO CONDITIONS:
// 1. if the current energy value is less than the initial value + whatever energy increase the bath gives
// 2. AND if the current energy value is less than 100 (the max value that energy can be)
var nap_energy_gain = 24
if isPassedOut {
	if(global.pet_needs.energy.value < _initial_energy_amount + nap_energy_gain) {
		improveNeed("energy", 1)
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
		global.needs_are_changing = false
		
		global.pet_needs.hunger.change_direction = needChangeDirection.NOT_CHANGING
		global.pet_needs.bladder.change_direction = needChangeDirection.NOT_CHANGING
		global.pet_needs.hygiene.change_direction = needChangeDirection.NOT_CHANGING
		global.pet_needs.fun.change_direction = needChangeDirection.NOT_CHANGING
		global.pet_needs.energy.change_direction = needChangeDirection.NOT_CHANGING
		global.pet_needs.health.change_direction = needChangeDirection.NOT_CHANGING	
	}

} else {
	if global.pet_needs.energy.value < obj_dog_bed.increaseEnergyTo and global.pet_needs.energy.value < 100 
	{
		improveNeed("energy", 1)
		drainNeed("hunger",0.6)
		drainNeed("bladder",0.6)
		drainNeed("hygiene",0.5)
		drainNeed("fun",0.5)
		improveNeed("health",0.1)
		setAlarmInSeconds(actionAlarms.SLEEP,0.05)
	} else {
		isSleeping = false
		isPassedOut = false
		//if the dog reached a full bladder during sleep, now the dog can empty it
		_wait_to_empty_bladder = false
		global.needs_are_changing = false
		global.pet_needs.hunger.change_direction = needChangeDirection.NOT_CHANGING
		global.pet_needs.bladder.change_direction = needChangeDirection.NOT_CHANGING
		global.pet_needs.hygiene.change_direction = needChangeDirection.NOT_CHANGING
		global.pet_needs.fun.change_direction = needChangeDirection.NOT_CHANGING
		global.pet_needs.energy.change_direction = needChangeDirection.NOT_CHANGING
		global.pet_needs.health.change_direction = needChangeDirection.NOT_CHANGING	
	}
	
}

