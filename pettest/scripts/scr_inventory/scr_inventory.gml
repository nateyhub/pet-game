#macro CAPACITY 3

function InventoryItem(_name, _need_effect, _obj_index, _spr_index, _room_layer) constructor {
	name = _name
	need_effect = _need_effect
	obj_index = _obj_index
	spr_index = _spr_index
	room_layer = _room_layer
	
	static toString = function() {
		var _message = string("Item name: {0} | Need effect: {1} | Obj: {2} | Spr: {3} | Layer: {4}",
			name, need_effect, obj_index, spr_index, room_layer)
		return _message
	}
}

function TieredItem(_name, _need_effect, _obj_index, _spr_index, _room_layer, _tier) : InventoryItem(_name, _need_effect, _obj_index, _spr_index, _room_layer) constructor {
	name = _name
	need_effect = _need_effect
	obj_index = _obj_index
	spr_index = _spr_index
	room_layer = _room_layer
	item_tier = _tier
	
	static toString = function() {
		var _message = string("Item name: {0} | Need effect: {1} | Obj: {2} | Spr: {3} | Layer: {4} | Tier: {5}",
			name, need_effect, obj_index, spr_index, room_layer, item_tier)
		return _message
	}
}

function Inventory() constructor {
	inventory = [noone, noone, noone]
	
	static toString = function() {
		//_currentNoOfItems = numberOfItems()
		_message = string("-------------------------------\nInventory\n-------------------------------\nNumber of items: {0}\n", numberOfItems())
		for(var i = 0; i < CAPACITY; i++)
		{
			//show_debug_message(string("Inventory item {0}: {1}", i+1, inventory[i]))
			//string_concat(_message, string("Inventory item {0}: {1}", i+1, inventory[i]))
			_message = string_concat(_message, string("Inventory item {0}: {1}\n", i+1, inventory[i]))
		}
		return string_concat(_message,"-------------------------------")
	}
	
	static numberOfItems = function() {
		var num = 0
		for(var i = 0; i < CAPACITY; i++) {
			if inventory[i] != noone num++
		}
		return num
		//return array_length(inventory)
		//return variable_struct_names_count(inventory)
	}
	
	static isFull = function() {
		return numberOfItems() == CAPACITY
		//return variable_struct_names_count(inventory) == CAPACITY
	}

	static isEmpty = function() {
		return numberOfItems() == 0
		//return variable_struct_names_count(inventory) == 0
	}
	
	static putItemInSlot = function(slotNumber, itemToInsert) {
		if slotNumber < 0 or slotNumber >= CAPACITY return false
		if inventory[slotNumber] != noone return false
		inventory[slotNumber] = itemToInsert
		return true
	}
	
	static slotContainsItem = function(slotNumber) {
		//show_debug_message(string("{0} > {1} ? {2}", slotNumber, numberOfItems(), slotNumber >= numberOfItems()))
		if slotNumber >= CAPACITY return false
		return inventory[slotNumber] != noone
	}
	
	static getItemInSlot = function(slotNumber) {
		return inventory[slotNumber]
	}
	
	static removeItemInSlot = function(slotNumber) {
		inventory[slotNumber] = noone
		show_debug_message("Slot number 1 is now:" + string(inventory[slotNumber]))
	}
	

}