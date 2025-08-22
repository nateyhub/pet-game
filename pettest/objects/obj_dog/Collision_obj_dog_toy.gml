//if the ball isn't already moving or being dragged by the player
if(!other._isMoving and !other._isBeingDragged)
{
	with (other) {
		if !audio_is_playing(sfx_ball_toy) audio_play_sound(sfx_ball_toy, 100, false)
		if(obj_dog.x < x) {
			//if dog is above (coming from top-left)
			if(y > obj_dog.y) {
				direction = 315
			} else {
				//dog is below
				direction = 45
			}
		} else {
			//if dog is above (coming from top-right)
			if(y > obj_dog.y) {
				direction = 235
			} else {
				//dog is below (coming from bottom-right)
				direction = 115
			}
		}
		speed = 4
		image_speed = 4
	}
	
	setAlarmInSeconds(actionAlarms.PLAY,1)
	improveNeed("fun",10)
	drainNeed("energy", 1)
	global.pet_needs.fun.change_direction = needChangeDirection.INCREASING
	global.pet_needs.energy.change_direction = needChangeDirection.DECREASING_LOW
	
}