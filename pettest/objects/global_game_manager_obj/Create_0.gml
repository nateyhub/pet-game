//check every second if any of the needs are critically low - if yes, drain health
setAlarmInSeconds(DRAIN_HEALTH_ALARM, 1)
setAlarmInSeconds(INCREASE_POINTS_ALARM, 2)


_game_speed = game_get_speed(gamespeed_fps)