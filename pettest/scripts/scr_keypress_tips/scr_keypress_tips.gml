/// @function TipsContainer constructor
/// @description Creates a TipContainer that holds and displays tips (e.g. "Press Space to Sleep")
function TipsContainer() constructor {
	numberOfTips = 0
	tips_list = []
	
	keys = {
		B: {spr_index: spr_press_b, margin_left: 2},
		E: {spr_index: spr_press_e, margin_left: 2},
		Space: {spr_index: spr_press_space, margin_left: 2} 
	}
	
	/// @function createTip
	/// @description Creates a Tip that is put into the TipsContainer and displayed
	/// @param {string} key_string A capitalised string representing the keyboard key (e.g. "A")
	/// @param {string} tip_text A string containing the tip for the user to read (e.g. "Use mop")
	static createTip = function(_key_string, _tip_text) {
		//check if the list already contains this tip
		if(!containsTip(_tip_text)) {	
			//create an object instance for the tip in the "tips" room layer
			var _key_instance = instance_create_layer(0,0,"tips", obj_press_key_tip)
			_key_instance.current_key = keys[$ _key_string]
			_key_instance.text = _tip_text
			//if there is at least one other tip in the array, set this new tip's image_index to match (animate at the same position)
			if (numberOfTips > 0) _key_instance.image_index = tips_list[0].image_index else _key_instance.image_index = -1
			//finally, show the tip
			_key_instance.visible = true
			
			//insert the instance into the tips array and update array length
			array_push(tips_list, _key_instance)
			numberOfTips++
		}
	}
	
	static toString = function() {
		var _toString = string("-------------------------------\nTips\n-------------------------------\n")
		for (var i = 0; i < numberOfTips; i++) {
			_toString = string_concat(_toString, string("{0}. {1}\n", i, tips_list[i].text))
		}
		_toString = string_concat(_toString, "-------------------------------\n")
		return _toString
	}
	
	/// @function containsTip
	/// @description Returns true if the text content of the arg tip_text is also present in the list
	/// @param {string} tip_text The text content of the tip to find in the list e.g. "Use mop"
	static containsTip = function(tip_text) {
		if numberOfTips == 0 return false
		for(var i = 0; i < numberOfTips; i++) {
			if tips_list[i].text == tip_text return true
		}
		return false
	}

	
	/// @function drawTips
	/// @description Draws each tip (keybind sprite followed by the tip text) in a row layout (stacked tips)
	static drawTips = function() {
		if numberOfTips == 0 return
		for (var i = 0; i < numberOfTips; ++i) {
			//offset the tip on the y-axis, ensuring none overlap
			tips_list[i].y_offset = 16 * i 
		    tips_list[i].is_visible = true
		}
	}
	
	static clearAllTips = function() {
		if numberOfTips == 0 return
		for(var i = 0; i < numberOfTips; i++) {
			if(tips_list[i]) instance_destroy(tips_list[i])
		}
		array_delete(tips_list,0,array_length(tips_list))
		numberOfTips = 0
	}
	
	static removeTip = function(_key_text) {
		if numberOfTips == 0 return
		for (var i = 0; i < numberOfTips; ++i) {
		    if (tips_list[i].text == _key_text) {
				show_debug_message("Found tip! Removing now...")
				instance_destroy(tips_list[i])
				array_delete(tips_list, i, 1)
				numberOfTips--
			}
		}
	}
}