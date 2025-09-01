/**
 * @function resolution_scale
 * @description This script adjusts the resolution scale of the game. It sets the camera view size based on the provided scale to ensure the pixel density is consistent across different resolutions.
 * It also resizes the application surface to match the window dimensions.
 * @param {Real} scale - The scale factor for the resolution.
 */
function resolution_scale(scale) {
	// Ensure the scale is a valid number
	if (scale <= 0) {
		show_error("Scale must be greater than 0", true);
		return;
	}
	
	// Set the view port size based on the window size and scale
	//show_debug_message("{0}x{1}", window_get_width(), window_get_height())
	
	var w, h
	if window_get_width() > 0 and window_get_width() > MINIMUM_WINDOW_WIDTH w = window_get_width()
	else w = MINIMUM_WINDOW_WIDTH
	if window_get_height() > 0 and window_get_height() > MINIMUM_WINDOW_HEIGHT h = window_get_height()
	else h = MINIMUM_WINDOW_HEIGHT

	// Get the camera for the first view (main view)
	var cam = view_get_camera(0);
	if (!cam) show_error("Camera does not exist", true)

	// Set the view port size for the first view
	view_set_wport(0, w);
	view_set_hport(0, h);

	// Set the camera view size based on the scale
	// This ensures that the camera view is adjusted according to the scale factor
	//show_debug_message(string("View wport {0} hport {1}", view_wport, view_hport))
	camera_set_view_size(cam, view_wport[0]/scale, view_hport[0]/scale);
	
	// calculate and update the camera width and height based on the scale
	camWidth = view_wport[0]/scale
	camHeight = view_hport[0]/scale
	
	//camera_set_view_target(view_camera[0], obj_dog)
	//camera_set_view_border(view_camera[0], w/2,h/2)

	// Resize the application surface to match the window dimensions
	if application_surface surface_resize(application_surface, w, h);
}

