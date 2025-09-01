// if there is an object to follow, set the camera's target position to that object's x and y
if (follow != noone) {
	xTo = follow.x
	yTo = follow.y
}

//show_debug_message(string("VIEWPORT DIMENSIONS: {0}x{1}", view_get_wport(0), view_get_hport(0)))
//show_debug_message(string("WINDOW DIMENSIONS: {0}x{1}", window_get_width(), window_get_height()))

if(view_wport[0] != surface_get_width(application_surface) || view_hport[0] != surface_get_height(application_surface)) surface_resize(application_surface, view_wport[0], view_hport[0])

resolution_scale(global.zoom_level)
// incremently move towards the follow object
// 25 is a magic number - this adds a smoothing effect to the camera's start and end movements
//	the camera is moving a 25th to the position, and this change decreases as it approaches to the target
//	which gives a smooth end effect.
//	change it to another value if wanted. TODO: assign to a macro/constant
//	RULE: larger this value is, the smoother the effect
x += (xTo - x)/20
y += (yTo - y)/20

// set the camera position such that the target is in the middle centre (eg camWidth * 0.5)
// view_camera[0] is the Viewport 0 camera in the room settings
camera_set_view_pos(view_camera[0], x - (camWidth * 0.5), y - (camHeight * 0.5))

