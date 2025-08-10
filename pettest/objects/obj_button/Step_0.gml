if(device_mouse_x_to_gui(MOUSE) >= x1 and device_mouse_x_to_gui(MOUSE) <= x2 
and device_mouse_y_to_gui(MOUSE) >= y1 and device_mouse_y_to_gui(MOUSE) <= y2) {
	if(device_mouse_check_button_pressed(MOUSE, mb_left)) show_message("Hello World")		
}