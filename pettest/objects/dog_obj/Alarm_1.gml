// drain HUNGER and BLADDER every 3 seconds
drainNeed("hunger", 1)
drainNeed("bladder", 1)
setAlarmBySeconds(needAlarms.HUNGER_AND_BLADDER, 3)