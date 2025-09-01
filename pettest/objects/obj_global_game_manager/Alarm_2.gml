//speed up the passage of time when the dog is asleep or passed out
if obj_dog.isSleeping or obj_dog.isPassedOut global.current_minutes += 4
else global.current_minutes += 2 //else, increase time by 2 minutes

//if the current number of minutes reaches the max number in a day, reset the counter
if global.current_minutes >= global.minutes_in_a_day  {
	global.current_minutes = 0
	//start a new day
	global.current_game_day++
}

global.day_current_hour = floor(global.current_minutes / 60)

//show_debug_message(string("Percentage of day {0} passed: {1}", global.current_game_day , global.current_minutes/global.minutes_in_a_day))
//show_debug_message("Hours passed: {0}", global.day_current_hour)

global.current_time_string = string("{0}:{1}{2} {3}", 
	global.day_current_hour mod 12 == 0 ? "12" : string(global.day_current_hour mod 12), 
	global.current_minutes mod 60 < 10 ? "0" : "",
	global.current_minutes mod 60,
	global.current_minutes < 720 ? "AM" : "PM"
)


if(obj_dog.isSleeping or obj_dog.isPassedOut) setAlarmInSeconds(INCREASE_TIME_ALARM,0.1)
else setAlarmInSeconds(INCREASE_TIME_ALARM, 1)