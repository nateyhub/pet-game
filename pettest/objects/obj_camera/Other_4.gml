#macro SMALL_CAMERA_WIDTH 960
#macro SMALL_CAMERA_HEIGHT 540

#macro LARGE_CAMERA_WIDTH 640
#macro LARGE_CAMERA_HEIGHT 360

// initial width and height of the camera
camWidth = LARGE_CAMERA_WIDTH
camHeight = LARGE_CAMERA_HEIGHT

//show_message(room ==  rm_preset_paths_test)

//default if needed:
//	follow = noone
//set follow to this if we don't want the camera to follow the dog anymore
//(there may be some use cases in the future)

// if the dog_obj is being used (eg in buildings)
if (room == rm_home) {
	follow = obj_dog
	global.zoom_level = 3
}
// otherwise, if we are in the city
else if (room == rm_preset_paths_test) {
	follow = obj_dog
	camWidth = SMALL_CAMERA_WIDTH
	camHeight = SMALL_CAMERA_HEIGHT
	global.zoom_level = 2
}

show_debug_message(string("FOLLOWING {0}", follow))

// can change this to change the starting position of the camera
x = room_width / 2
y = room_height / 3

// initial goto position of the camera
xTo = x
yTo = y
