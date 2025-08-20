_drainEnergyCounter++
_drainHungerAndBladderCounter++
_drainFunCounter++
_drainHygieneCounter++

// if something is putting a lock on draining needs, exit out of this alarm
if (!global.needs_can_be_drained) {
	setAlarmInSeconds(needAlarms.NEEDS, 1)
	return
}

//otherwise, drain needs
//drain ENERGY every 10 seconds
if _drainEnergyCounter >= 10 {
	if !isSleeping drainNeed("energy", 1)
	_drainEnergyCounter = 0
}

// drain HUNGER and BLADDER every 4 seconds
if _drainHungerAndBladderCounter >= 4 {
	if !isEating drainNeed("hunger", 2)
	if !isEmptyingBladder drainNeed("bladder", 2)
	_drainHungerAndBladderCounter = 0
}

// drain FUN every 3 seconds
if _drainFunCounter >= 3 {
	drainNeed("fun", 2)
	_drainFunCounter = 0
}

// drain HYGIENE every 5 seconds
if (_drainHygieneCounter >= 10 and !isBathing) {
	drainNeed("hygiene", 1)
	_drainHygieneCounter = 0
}

//if the dog is sprinting, drain energy each second
if(isSprinting and (_xinput != 0 or _yinput != 0)) {
	drainNeed("energy", 1)
	global.pet_needs.energy.change_direction = needChangeDirection.DECREASING_LOW
}

//drain hygiene if standing in a puddle
if(place_meeting(x,y,obj_puddle)) drainNeed("hygiene", 1)

//reset the alarm
setAlarmInSeconds(needAlarms.NEEDS, 1)