if (!_isBeingDragged)
{
	_isBeingDragged = true
} else {
	if(place_empty(x,y)) _isBeingDragged = false
	else playErrorSound()
}