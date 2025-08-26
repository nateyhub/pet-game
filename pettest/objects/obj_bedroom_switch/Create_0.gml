_dimmed_room_fx = fx_create("_filter_tintfilter")
_sunset_fx = fx_create("_filter_tintfilter")
_night_fx = fx_create("_filter_tintfilter")
_late_night_fx = fx_create("_filter_tintfilter")

//sunset								   %R  %B %G %A
//										Actual RGB value is 102, 77, 255
//										% = percentage of 255 for each colour value Red, Green, Blue & Alpha
//										So RED = 0.4 = 40% of 255 = 102 
//										   GREEN = 0.3 = 30% of 255 = 77
//										   BLUE = 1.0 = 100% of 255 = 255
fx_set_parameter(_sunset_fx, "g_TintCol", [1,0.6,0.3,1])
fx_set_single_layer(_sunset_fx,true)

fx_set_parameter(_dimmed_room_fx, "g_TintCol", [0.84,0.8,0.71,1])
fx_set_single_layer(_dimmed_room_fx,true)
//night
fx_set_parameter(_night_fx, "g_TintCol", [0.4,0.3,1,1])
fx_set_single_layer(_night_fx,true)
//late night
fx_set_parameter(_late_night_fx, "g_TintCol", [0.2,0.24,0.5,1])
fx_set_single_layer(_late_night_fx,true)

//set the current effect/filter
_current_fx = _late_night_fx

