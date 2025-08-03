//drain ENERGY every 5 seconds
if(!isSleeping) {
	drainNeed("energy", 1)
	setAlarmInSeconds(needAlarms.ENERGY, 5)
}