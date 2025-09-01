if !_isBeingDragged
{
	if(!place_meeting(x,y,obj_dog_food)){
		pickUpItem()
	}
} else {
	putDownItem()
	show_debug_message(string("Bowl put down at {0},{1}", x,y))
}