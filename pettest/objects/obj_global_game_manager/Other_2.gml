
#macro DRAIN_HEALTH_ALARM 0
#macro INCREASE_POINTS_ALARM 1
#macro INCREASE_TIME_ALARM 2

//pet needs struct (globally accessible)
global.pet_needs = {
	health:		{ value: 90, x: 178, y: 46 },
	hunger:		{ value: 93, x: 178, y: 106 },
	energy:		{ value: 24, x: 312, y: 46 },
	hygiene:	{ value: 91, x: 312, y: 106 },
	bladder:	{ value: 91, x: 446, y: 46 },
	fun:		{ value: 88, x: 446, y: 106 },
}

global.needs_critical = false
global.needs_can_be_drained = true

//1 real second = 4 game minutes 
//30 real seconds = 1 hr
//1 real minute = 2 hrs
//12 real minutes = 24 game hrs (one day)
//12 * 60s = 720 real seconds for one day

global.default_font = fnt_gui
global.minutes_in_a_day = 1440
global.current_minutes = 720 //midday
global.day_current_hour = floor(global.current_minutes / 60)
global.current_game_day = 1
global.current_time_string = string("{0}:{1}{2} {3}", 
	global.day_current_hour mod 12 == 0 ? "12" : string(global.day_current_hour mod 12), 
	global.current_minutes mod 60 < 10 ? "0" : "",
	global.current_minutes mod 60,
	global.current_minutes < 720 ? "AM" : "PM"
)

//show_debug_message("HEALTH" + string(global.pet_needs.health.value))

global.needs_keys = variable_struct_get_names(global.pet_needs)


global.current_pal = dogColours.DEFAULT;

//total points
global.points = 0

global.ultimateNeedsCount = 0

//global.tipsContainer = new TipsContainer() 
//show_debug_message(global.tipsContainer.toString())
global.new_tc = new NewTipsContainer() 
global.new_tc.drawTips()

//DEBUG: Testing Inventory
global.inventory = new Inventory()
global.selectedItem = noone

_item = new TieredItem("Dog food", 5, obj_dog_food, spr_dogfood_tiers, "Instances", tier.CHEAP) 
_item2 = new TieredItem("Dog food", 5, obj_dog_food, spr_dogfood_tiers, "Instances", tier.GOOD)
_item3 = new TieredItem("Dog food", 5, obj_dog_food, spr_dogfood_tiers, "Instances", tier.ULTIMATE) 
global.inventory.putItemInSlot(0, _item)
global.inventory.putItemInSlot(1, _item2)
global.inventory.putItemInSlot(2, _item3)


//_retrieved_item = global.inventory.getItem("Dog food")
_retrieved_item = global.inventory.getItemInSlot(0)
show_debug_message(string("ITEM 1: {0}", _retrieved_item))
_retrieved_item2 = global.inventory.getItemInSlot(1)

if is_instanceof(_retrieved_item, TieredItem) {
	show_debug_message("Item is a Tiered item")
} else {
	show_debug_message("Item is not a Tiered item")
}

//_dogfood = instance_create_layer(mouse_x, mouse_y, _retrieved_item.room_layer, _retrieved_item.obj_index)
//_dogfood._isBeingDragged = true
global.holdingAnItem = false

show_debug_message(global.inventory)




//DEBUG:
	//for (var i = 0; i < array_length(global.needs_keys); i++) {
	//	var key = global.needs_keys[i]
	//	show_debug_message(key + ": " + string(global.pet_needs[$ key].value))
	//}

//alarm[0] = game_get_speed(gamespeed_fps) * 1