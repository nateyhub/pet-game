//listens for a new message from the F1 debug function (see Key Press - F1 event)
var i_d = ds_map_find_value(async_load, "id")
//if the user has inputted a string
if (i_d == self.needNameStr) {
	if (ds_map_find_value(async_load, "status")) {
		//get the result
		if (ds_map_find_value(async_load, "result") != "") {
			show_debug_message(ds_map_find_value(async_load,"result"))
			//result will be something like "hunger 20" so split into "hunger" and "20"
			var a = string_split(ds_map_find_value(async_load,"result"), " ")
			//trim whitespace
			var key = string_trim_end(a[0])
			var value = real(string_trim_start(a[1]))
			//set the specified need to the new value
			global.pet_needs[$ key].value = value
		}
	}
}
