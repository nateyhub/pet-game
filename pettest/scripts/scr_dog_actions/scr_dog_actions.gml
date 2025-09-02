function bark() {
	if !isBarking {
		sprite_index = spr_dog_bark_idle
		instance_create_depth(x,y-8,depth - 1,obj_dog_bark)
		isBarking = true
		setAlarmInSeconds(actionAlarms.BARK, 0.25)
	}
}