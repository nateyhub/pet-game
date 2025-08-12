_drainEnergyCounter++
_drainHungerAndBladderCounter++
_drainFunCounter++
_drainHygieneCounter++


//drain ENERGY every 5 seconds
if _drainEnergyCounter >= 5 {
	if !isSleeping drainNeed("energy", 1)
	_drainEnergyCounter = 0
}

// drain HUNGER and BLADDER every 3 seconds
if _drainHungerAndBladderCounter >= 3 {
	if !isEating drainNeed("hunger", 1)
	if !isEmptyingBladder drainNeed("bladder", 1)
	_drainHungerAndBladderCounter = 0
}

// drain FUN every 2 seconds
if _drainFunCounter >= 2 {
	drainNeed("fun", 1)
	_drainFunCounter = 0
}

// drain HYGIENE every 5 seconds
if (_drainHygieneCounter >= 5 and !isBathing) {
	drainNeed("hygiene", 1)
	_drainHygieneCounter = 0
}

if(isSprinting) drainNeed("energy", 1)






setAlarmInSeconds(needAlarms.NEEDS, 1)