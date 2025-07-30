//set the given alarm to be executed after the given number of seconds have passed
function setAlarmInSeconds(alarmNumber, seconds) {
	alarm[alarmNumber] = game_get_speed(gamespeed_fps) * seconds
}