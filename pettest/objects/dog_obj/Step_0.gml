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



if(!isEating and !isSleeping and !isEmptyingBladder and !isBathing)
{
	if(_xinput != 0 or _yinput != 0) {
		//the player is moving
		isMoving = true
		sprite_index = dog_walk_spr
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
			if image_xscale = 1 mop_obj.x = self.x - 16
			else mop_obj.x = self.x + 16
			mop_obj.y = self.y - 2
		}
	} else {
		isMoving = false
		_movement_counter = 0
		sprite_index = dog_idle_spr
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