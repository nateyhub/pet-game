alpha_counter = 0.0
fade_in = true
speed = 0.6
direction = 90
fade_factor = 0.02
alpha = 0

switch(change_direction)  {
	case needChangeDirection.INCREASING:
		image_index = 0
		break
	case needChangeDirection.DECREASING:
		image_index = 1
		break
}