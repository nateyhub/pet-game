_drainEnergyCounter++
_drainHungerAndBladderCounter++
_drainFunCounter++
_drainHygieneCounter++


//drain ENERGY every 5 seconds
if _drainEnergyCounter >= 5 {
	if !isSleeping drainNeed("energy", 1)
	_drainEnergyCounter = 0
}

// drain HUNGER and BLADDER every 4 seconds
if _drainHungerAndBladderCounter >= 4 {
	if !isEating drainNeed("hunger", 1)
	if !isEmptyingBladder drainNeed("bladder", 1)
	_drainHungerAndBladderCounter = 0
}

// drain FUN every 3 seconds
if _drainFunCounter >= 3 {
	drainNeed("fun", 1)
	_drainFunCounter = 0
}

// drain HYGIENE every 6 seconds
if (_drainHygieneCounter >= 5 and !isBathing) {
	drainNeed("hygiene", 1)
	_drainHygieneCounter = 0
}

//if the dog is sprinting, drain energy each second
if(isSprinting) drainNeed("energy", 1)

//reset the alarm
setAlarmInSeconds(needAlarms.NEEDS, 1)