//if the ball isn't already moving or being dragged by the player
if(!other._isMoving and !other._isBeingDragged)
{
	if !audio_is_playing(sfx_ball_toy) audio_play_sound(sfx_ball_toy, 100, false)
	drainNeed("energy", 2)
	improveNeed("fun",10)
	if(obj_dog.x < other.x) {
		//if dog is above (coming from top-left)
		if(other.y > obj_dog.y) {
			other.direction = 315
		} else {
			//dog is below
			other.direction = 45
		}
	} else {
		//if dog is above (coming from top-right)
		if(other.y > obj_dog.y) {
			other.direction = 235
		} else {
			//dog is below (coming from bottom-right)
			other.direction = 115
		}
	}

	other.speed = 4
	other.image_speed = 4
}