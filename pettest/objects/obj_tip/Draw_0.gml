if(_alpha > 0.01) {
	image_alpha = _alpha
	draw_self()
	y -= 0.5
	_alpha -= 0.01
} else {
	instance_destroy(self)
}
