//layer_depth("Instances",-900)
//layer_depth("bedroom_floor",-800)
//layer_depth("bedroom_walls",-700)
//layer_set_visible("dark_walkway",false)


//var _fx_tint = fx_create("_filter_tintfilter")
//										rgba values expressed as a percentage of 1 e.g. if green = 80 then 80/255 = 0.314
//fx_set_parameter(_fx_tint, "g_TintCol", [0.42,0.31,1,1]);
//layer_set_fx("walkway_floor",_fx_tint)
//layer_set_fx("living_room_walls",_fx_tint)

//effect_create_layer("living_room_walls", ef, 0,0,camera_get_view_width(0),c_blue)
//layer_set_fx("living_room_floor",_fx_tint)


//show_debug_message(layer_get_effect("dark_walkway"),0)


//if fx {
//	var fx_params = fx_get_parameters(fx)
//	show_debug_message(fx_params)
//	layer_clear_fx("bedroom_floor")
//} else {
//	if !layer_get_fx("living_room_floor") layer_set_fx("living_room_floor", _night_fx);
//}

//fx_set_single_layer(_fx_tint, true)
//layer_set_fx("living_room_floor",fx)



//effect_create_layer("a",ef_colour_tint,0,0,0,c_blue)