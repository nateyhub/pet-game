/**
 * @function resolution_scale
 * @description This script adjusts the resolution scale of the game. It sets the camera view size based on the provided scale to ensure the pixel density is consistent across different resolutions.
 * It also resizes the application surface to match the window dimensions.
 * @param {Real} scale - The scale factor for the resolution.
 * @returns {void}
 */

function resolution_scale(scale) {
	// Ensure the scale is a valid number
	if (scale <= 0) {
		show_error("Scale must be greater than 0", true);
		return;
	}
	
	// Set the view port size based on the window size and scale
	var w = window_get_width();
	var h = window_get_height();

	// Get the camera for the first view (main view)
	var cam = view_get_camera(0);

	// Set the view port size for the first view
	view_set_wport(0, w);
	view_set_hport(0, h);

	// Set the camera view size based on the scale
	// This ensures that the camera view is adjusted according to the scale factor
	camera_set_view_size(cam, view_wport[0]/scale, view_hport[0]/scale);
	
	// calculate and update the camera width and height based on the scale
	camWidth = view_wport[0]/scale
	camHeight = view_hport[0]/scale
	
	//camera_set_view_target(view_camera[0], obj_dog)
	//camera_set_view_border(view_camera[0], w/2,h/2)

	// Resize the application surface to match the window dimensions
	surface_resize(application_surface, w, h);
}

