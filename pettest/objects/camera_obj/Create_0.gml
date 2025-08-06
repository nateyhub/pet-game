#macro SMALL_CAMERA_WIDTH 960
#macro SMALL_CAMERA_HEIGHT 540

#macro LARGE_CAMERA_WIDTH 640
#macro LARGE_CAMERA_HEIGHT 360

// initial width and height of the camera
camWidth = SMALL_CAMERA_WIDTH
camHeight = SMALL_CAMERA_HEIGHT

//default if needed:
//	follow = noone
//set follow to this if we don't want the camera to follow the dog anymore
//(there may be some use cases in the future)

// if the dog_obj is being used (eg in buildings)
if (instance_exists(dog_obj)) {
	follow = dog_obj
	camWidth = LARGE_CAMERA_WIDTH
	camHeight = LARGE_CAMERA_HEIGHT
}
// otherwise, if we are in the city
else if (instance_exists(dog_city_obj)) {
	follow = dog_city_obj
	camWidth = SMALL_CAMERA_WIDTH
	camHeight = SMALL_CAMERA_HEIGHT
}

// can change this to change the starting position of the camera
x = room_width / 2
y = room_height / 3

// initial goto position of the camera
xTo = x
yTo = y
