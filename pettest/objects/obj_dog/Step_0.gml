// assign keycodes to variables
var _right = keyboard_check(vk_right) || keyboard_check(ord("D"))
var _left = keyboard_check(vk_left) || keyboard_check(ord("A"))
var _up = keyboard_check(vk_up) || keyboard_check(ord("W"))
var _down = keyboard_check(vk_down) || keyboard_check(ord("S"))

// calculate x and y movement
var _xinput = _right - _left
var _yinput = _down - _up

//ENABLE THIS TO SEE DIRECTION:
//show_debug_message("y: " + string(_yinput) + " x: " + string(_xinput))

//if there is any x or y movement detected

_nearby_mop = collision_circle(x,y,collision_radius, obj_mop,false,false)
_nearby_bath = collision_circle(x,y,collision_radius,obj_bath,false,false)
_nearby_dog_bowl = collision_circle(x,y,collision_radius,obj_dog_bowl,false,false)
_nearby_bed = collision_circle(x,y,collision_radius,obj_dog_bed,false,false)
_nearby_door = collision_circle(x,y,collision_radius,obj_door,false,false)
if _nearby_mop and !isUsingMop global.tipsContainer.createTip("Space", "Pick up")
else global.tipsContainer.removeTip("Pick up")


if !isBathing and _nearby_bath global.tipsContainer.createTip("Space", "Take a bath")
else global.tipsContainer.removeTip("Take a bath")

if !isEating and _nearby_dog_bowl global.tipsContainer.createTip("Space", "Eat")
else global.tipsContainer.removeTip("Eat")

if !isSleeping and _nearby_bed global.tipsContainer.createTip("Space", "Sleep")
else global.tipsContainer.removeTip("Sleep")

if !isSleeping and _nearby_door global.tipsContainer.createTip("Space", "Go outside")
else global.tipsContainer.removeTip("Go outside")


if(!isEating and !isSleeping and !isEmptyingBladder and !isBathing)
{
	if(_xinput != 0 or _yinput != 0) {
		//the player is moving
		isMoving = true
		if(isBarking) sprite_index = spr_dog_walk_barking
		else sprite_index = spr_dog_walk
		_movement_counter++
		//show_debug_message("Movement counter:" + string(_movement_counter))
		switch(_xinput) {
			case FACING_LEFT:
				//player is facing left
				shadow_x1_offset = 0
				shadow_x2_offset = 0
				image_xscale = 1
				isMoving = true
				break
			case FACING_RIGHT:
				//player is facing right
				image_xscale = -1
				shadow_x1_offset = -2
				shadow_x2_offset = -2
				isMoving = true
				break
		}
		if(_movement_counter > 200) {
			show_debug_message("Dog has walked continuously for too long (" + string(_movement_counter) + " steps): now draining energy")
			//drain energy
			drainNeed("energy", 1)
			//reset counter
			_movement_counter = 0
		}
		if(isUsingMop) {
			//if dog is facing left
			if image_xscale = 1 obj_mop.x = self.x - 16
			else obj_mop.x = self.x + 16
			obj_mop.y = self.y - 2
		}
	} else {
		isMoving = false
		_movement_counter = 0
		if !isBarking sprite_index = spr_dog_idle
		else sprite_index = spr_dog_bark_idle
	}


	//show_debug_message(_xinput == 1 and _yinput == 1)
	// normalise the input vector if not zero
	var _length = sqrt(sqr(_xinput) + sqr(_yinput))
	if(_length != 0) {
		_xinput /= _length
		_yinput /= _length
	}


	// handle collisions against any objects that have obj_solid_parent as a parent
	var collision = move_and_collide(_xinput * my_speed, _yinput * my_speed, obj_solid_parent)
	
	// if the pet's bladder needs emptying
	if(global.pet_needs.bladder.value == 0 and !isEmptyingBladder) {
		// prioritise bathing and sleeping actions over emptying bladder
		if(isBathing or isSleeping or isEating) _wait_to_empty_bladder = true
		else {
			emptyBladder()
		}

	}
	
	if(global.pet_needs.energy.value == 0 and !isSleeping) {
		if(isBathing or isEating) _wait_to_sleep = true
		else {
			passOut()
		}
	}

}