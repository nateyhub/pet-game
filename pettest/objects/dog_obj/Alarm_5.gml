if(global.pet_needs.energy.value < _initial_energy_amount + 40)
{
	global.pet_needs.energy.value++
	if global.pet_needs.energy.value > 100 global.pet_needs.energy.value = 100
	setAlarmInSeconds(actionAlarms.SLEEP,0.05)
} else {
	isSleeping = false
}