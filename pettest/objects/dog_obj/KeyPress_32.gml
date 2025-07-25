if(collision_circle(x,y,64,bath_obj,false,false)) {
	show_debug_message("Bath is here")
} else {
	show_debug_message("Bath is not here")
}
if(collision_circle(x,y,64,dog_bed_obj,false,false)) {
	show_debug_message("Bed is here")
	x = dog_bed_obj.x
	y = dog_bed_obj.y
	
}