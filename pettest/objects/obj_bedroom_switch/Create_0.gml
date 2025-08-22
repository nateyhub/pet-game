_night_fx = fx_create("_filter_tintfilter")
fx_set_parameter(_night_fx, "g_TintCol", [0.4,0.3,1,1])
fx_set_single_layer(_night_fx,true)
//show_debug_message("AUGH {0}", layer_get_fx("living_room_floor"))