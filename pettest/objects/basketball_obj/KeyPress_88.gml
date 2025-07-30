if(_time_elapsed > _timing_window_start and _time_elapsed < _timing_window_end) {
	_ball_hit = true
	_angle = -2
	path_end()
	path_start(bball_success, 2, path_action_stop,false)
	alarm[0] = 80
}
