show_debug_message("obj_floater_controller: checking for changes...")
setAlarmInSeconds(0,0.5)
if !global.needs_are_changing {
	//setAlarmInSeconds(0,0.5)
	return;
}


if global.pet_needs.health.change_direction != needChangeDirection.NOT_CHANGING {
	if !instance_exists(obj_health_change_floater) instance_create_layer(obj_dog.x,obj_dog.y-8,"tips",obj_health_change_floater, {
		change_direction: global.pet_needs.health.change_direction
	})
}

