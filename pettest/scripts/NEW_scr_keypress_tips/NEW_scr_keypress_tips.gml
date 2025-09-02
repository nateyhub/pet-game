/// @function TipsContainer constructor
/// @description Creates a TipContainer that holds and displays tips (e.g. "Press Space to Sleep")
enum tip_indices {
	TAKE_BATH = 0,
	SLEEP = 1,
	NAP = 2,
	EAT_FOOD = 3,
	PICK_UP = 4,
	MOP_FLOOR = 5,
	PUT_DOWN_MOP = 6,
	BARK = 7,
	GO_OUTSIDE = 8,
	WAKE_UP = 9,
	EMPTY_BLADDER = 10,
	TALK_TO_MARY = 11
}

function NewTipsContainer() constructor {
	keys = {
		B: {key_str: "b", key_str_length: 1,  margin_left: 2},
		E: {key_str: "e", key_str_length: 1,  margin_left: 2},
		C: {key_str: "c", key_str_length: 1,  margin_left: 2},
		X: {key_str: "x", key_str_length: 1,  margin_left: 2},
		Space: {key_str: "space", key_str_length: 5,  margin_left: 2} 
	}
	
	all_tips = []
	numberOfTips = 0
	visible_tips = 0
	
	function generateTip(_key, _text, _visible) {
		var _tips_layer = "tips"
		var _return_obj = instance_create_layer(-2000,0,_tips_layer, obj_press_key_tip)
		_return_obj.current_key = _key
		_return_obj.text = _text
		_return_obj.should_be_visible = _visible
		array_push(all_tips, _return_obj)
		numberOfTips++
	}
		
	generateTip(keys.Space, "Take a bath", false)
	generateTip(keys.Space, "Sleep", false)
	generateTip(keys.Space, "Nap", false)
	generateTip(keys.Space, "Eat", false)
	generateTip(keys.Space, "Pick up", false)
	generateTip(keys.E, "Hold: Mop floor", false)
	generateTip(keys.Space, "Put down mop", false)
	generateTip(keys.B, "Bark", false)
	generateTip(keys.Space, "Go outside", false)
	generateTip(keys.X, "Wake up", false)
	generateTip(keys.C, "Empty bladder", false)
	generateTip(keys.Space, "Talk to Mary", false)
	
	
	static hideTip = function(_tip_index) {
		if(all_tips[_tip_index].should_be_visible) {
			show_debug_message("Hiding {0}: {1}", _tip_index, all_tips[_tip_index].should_be_visible) 
			all_tips[_tip_index].should_be_visible = false
			//instance_deactivate_object(all_tips[_tip_index])
			drawTips()
		}		
	}
	
	static hideAllTips = function() {
		if visible_tips == 0 return;
		for(var i=0; i < numberOfTips; i++) {
			hideTip(i)
		}
		drawTips()
	}

	
	static tipIsShowing = function(_tip_index) {
		return all_tips[_tip_index].visible
	}

	
	static showTip = function(_tip_index) {
		//instance_activate_object(all_tips[_tip_index])
		if(!all_tips[_tip_index].should_be_visible)
		{
			all_tips[_tip_index].should_be_visible = true
			drawTips()
		}
	}

	
	/// @function drawTips
	/// @description Draws each tip (keybind sprite followed by the tip text) in a row layout (stacked tips)
	static drawTips = function() {
		visible_tips = 0
		for (var i = 0; i < numberOfTips; ++i) {
			if (all_tips[i].should_be_visible) {
				visible_tips++
				//offset the tip on the y-axis, ensuring none overlap
				all_tips[i].y_offset = (visible_tips-1)*16
				all_tips[i].visible = true
			} else {
				all_tips[i].visible = false
				all_tips[i].should_be_visible = false
			}
		}
	}
}