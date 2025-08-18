_game_speed = game_get_speed(gamespeed_fps)
gpu_set_tex_filter(false);

//check every second if any of the needs are critically low - if yes, drain health
setAlarmInSeconds(DRAIN_HEALTH_ALARM, 1)
setAlarmInSeconds(INCREASE_POINTS_ALARM, 2)
setAlarmInSeconds(INCREASE_TIME_ALARM, 1)


