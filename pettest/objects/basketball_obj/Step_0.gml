image_angle += _angle

if(!_ball_hit)
{
	_time_elapsed++
}
show_debug_message(_time_elapsed)
if (_time_elapsed > 80 && !_ball_hit) {
	show_debug_message("fail")
}