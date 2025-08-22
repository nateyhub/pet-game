// ACTION ALARM: SLEEP
//TWO CONDITIONS:
// 1. if the current energy value (which starts at 0; pet only passes out in this instance) is less than the energy increase the nap gives
// 2. AND if the current energy value is less than 100 (the max value that energy can be)
var nap_energy_gain = 24


//if !isSleeping return; 
if isSleeping and ((isPassedOut and global.pet_needs.energy.value < nap_energy_gain) or (!isPassedOut and global.pet_needs.energy.value < obj_dog_bed.increaseEnergyTo and global.pet_needs.energy.value < 100))
{
	global.new_tc.showTip(tip_indices.WAKE_UP)
	improveNeed("energy", 1)
	drainNeed("hunger",1)
	drainNeed("bladder",0.8)
	if(isPassedOut) {
		//passed out; more impact on hygiene and fun, and negative impact on health
		drainNeed("hygiene",0.6)
		drainNeed("fun",0.6)
		drainNeed("health",0.1)
	} else {
		//sleeping normally in a bed; less impact on hygiene/fun, improves health
		show_debug_message(obj_dog_bed.increaseEnergyTo)
		drainNeed("hygiene",0.5)
		drainNeed("fun",0.5)
		improveNeed("health",0.1)		
	}
	setAlarmInSeconds(actionAlarms.SLEEP,0.2)
}
else {
	isSleeping = false
	isPassedOut = false
	//if the dog reached a full bladder during sleep, now the dog can empty it
	_wait_to_empty_bladder = false
	global.needs_are_changing = false
	
	global.new_tc.hideTip(tip_indices.WAKE_UP)
		
	global.pet_needs.hunger.change_direction = needChangeDirection.NOT_CHANGING
	global.pet_needs.bladder.change_direction = needChangeDirection.NOT_CHANGING
	global.pet_needs.hygiene.change_direction = needChangeDirection.NOT_CHANGING
	global.pet_needs.fun.change_direction = needChangeDirection.NOT_CHANGING
	global.pet_needs.energy.change_direction = needChangeDirection.NOT_CHANGING
	global.pet_needs.health.change_direction = needChangeDirection.NOT_CHANGING	
}