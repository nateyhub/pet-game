#macro CAPACITY 3

function InventoryItem(_name, _need_effect, _obj_index, _room_layer) constructor {
	name = _name
	need_effect = _need_effect
	obj_index = _obj_index
	room_layer = _room_layer
}

function TieredItem(_name, _need_effect, _obj_index, _room_layer, _obj_tier) : InventoryItem(_name, _need_effect, _obj_index, _room_layer) constructor {
	name = _name
	need_effect = _need_effect
	obj_index = _obj_index
	room_layer = _room_layer
	obj_tier = _obj_tier
}

function Inventory() constructor {
	inventory = []
	//inventory = {
	//	item1: noone,
	//	item2: noone,
	//	item3: noone,
		
	//	toString : function() {
	//		return string("\nInventory contains {0}, {1}, {2}", item1, item2, item3)
	//	}
	//}
	
	static toString = function() {
		_currentNoOfItems = numberOfItems()
		_message = string("-------------------------------\nInventory\n-------------------------------\nNumber of items: {0}\n", _currentNoOfItems)
		for(var i = 0; i < _currentNoOfItems; i++)
		{
			//show_debug_message(string("Inventory item {0}: {1}", i+1, inventory[i]))
			//string_concat(_message, string("Inventory item {0}: {1}", i+1, inventory[i]))
			_message = string_concat(_message, string("Inventory item {0}: {1}\n", i+1, inventory[i]))
		}
		return string_concat(_message,"-------------------------------")
	}
	
	static addItem = function(item) {
		if !isFull() {
			array_push(inventory, item)
			return true
		}
		return false
	}
	
	static getItem = function(itemName) {
		if !isEmpty() {
			for(var i = 0; i < numberOfItems(); i++) {
				if(inventory[i].name == itemName) return inventory[i]
			}
		}
		return noone
	}
	
	static removeItem = function(itemToRemove) {
		if !isEmpty() and array_contains(inventory, itemToRemove) {
			array_delete(inventory, itemToRemove, 1)
		}
	}
	
	static numberOfItems = function() {
		return array_length(inventory)
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
	

}