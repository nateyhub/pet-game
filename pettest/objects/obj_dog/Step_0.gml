// assign keycodes to variables
var _right = keyboard_check(vk_right) || keyboard_check(ord("D"))
var _left = keyboard_check(vk_left) || keyboard_check(ord("A"))
var _up = keyboard_check(vk_up) || keyboard_check(ord("W"))
var _down = keyboard_check(vk_down) || keyboard_check(ord("S"))

// calculate x and y movement
_xinput = _right - _left
_yinput = _down - _up

//ENABLE THIS TO SEE DIRECTION:
//show_debug_message("y: " + string(_yinput) + " x: " + string(_xinput))

//if there is any x or y movement detected
_nearby_interactable = collision_rectangle(x-collision_radius,y-collision_radius,x+collision_radius,y+collision_radius,obj_interactable_parent,false,false)
if _nearby_interactable {
	switch _nearby_interactable {
		// If the nearby interactable object is a bath
		case obj_bath.id:
			if !isBathing and !isUsingMop {
				global.new_tc.showTip(tip_indices.TAKE_BATH)
				if(keyboard_check_pressed(vk_space)) useBath()		
			}
			else {
				global.new_tc.hideTip(tip_indices.TAKE_BATH)
			}
			break
		// If the object is a mop
		case obj_mop.id:
			if !isUsingMop 
			{ 
				global.new_tc.showTip(tip_indices.PICK_UP)
			}
			break
		case obj_dog_bowl.id:
			if !isEating and !isUsingMop {
				//global.tipsContainer.createTip("Space", "Eat")
				global.new_tc.showTip(tip_indices.EAT_FOOD)
				if (keyboard_check_pressed(vk_space)) eatFromBowl()
			}
			else {
				//global.tipsContainer.removeTip("Eat")
				global.new_tc.hideTip(tip_indices.EAT_FOOD)
			}
			break
		case obj_dog_bed.id:
			if !isSleeping and !isUsingMop 
			{ 
				//global.tipsContainer.createTip("Space", "Sleep")
				global.new_tc.showTip(tip_indices.SLEEP)
				if(keyboard_check_pressed(vk_space)) useBed()
			}
			else 
			{ 
				//global.tipsContainer.removeTip("Sleep")
				global.new_tc.hideTip(tip_indices.SLEEP)
			}
			break
		case obj_door.id:
			if !isSleeping and !isUsingMop {
				//global.tipsContainer.createTip("Space", "Go outside")
				global.new_tc.showTip(tip_indices.GO_OUTSIDE)
				if(keyboard_check_pressed(vk_space)) goOutside()
			}
			else 
			{ 
				//global.tipsContainer.removeTip("Go outside")
				global.new_tc.hideTip(tip_indices.GO_OUTSIDE)
			}
			break
	}
} else {
	//global.tipsContainer.clearAllTips()
	global.new_tc.hideAllTips()
}

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
			if (image_xscale = 1) {
				obj_mop.x = self.x - 16
				if(!place_free(obj_mop.x-8,obj_mop.y)) obj_mop.x = self.x-8
			}
			else {
				obj_mop.x = self.x + 15
				if(!place_free(obj_mop.x+7,obj_mop.y)) obj_mop.x = self.x+7
			}
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


	// handle collisions against any objects that have a solid parent
	var collision = move_and_collide(_xinput * my_speed, _yinput * my_speed, [obj_solid_parent, obj_solid_interactable])
	
	// if the pet's bladder needs emptying
	if(global.pet_needs.bladder.value == 0 and !isEmptyingBladder) or (keyboard_check(ord("C")) and global.pet_needs.bladder.value <= 80) {
		// prioritise bathing and sleeping actions over emptying bladder
		if(isBathing or isSleeping or isEating) _wait_to_empty_bladder = true
		else {
			emptyBladder()
		}

	}
	
	if(global.pet_needs.energy.value == 0 and !isSleeping and !isPassedOut) {
		if(isBathing or isEating or isEmptyingBladder) _wait_to_sleep = true
		else {
			passOut()
		}
	}

}