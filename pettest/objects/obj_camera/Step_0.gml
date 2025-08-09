// if there is an object to follow, set the camera's target position to that object's x and y
if (follow != noone) {
	xTo = follow.x
	yTo = follow.y
}

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