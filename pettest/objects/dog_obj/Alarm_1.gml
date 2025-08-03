// drain HUNGER and BLADDER every 3 seconds
if(!isEating) drainNeed("hunger", 1)
drainNeed("bladder", 1)
setAlarmInSeconds(needAlarms.HUNGER_AND_BLADDER, 3)