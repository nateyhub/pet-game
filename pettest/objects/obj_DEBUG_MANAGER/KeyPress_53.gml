switch obj_camera.follow {
	case obj_dog:
		obj_camera.follow = obj_dog_bowl
		break
	default:
		obj_camera.follow = obj_dog
		break
}