
#macro DRAIN_HEALTH_ALARM 0
#macro INCREASE_POINTS_ALARM 1
#macro INCREASE_TIME_ALARM 2



//ParticleSystem1
//global._ps = part_system_create();
//part_system_draw_order(global._ps, true);

////Emitter_1
//_ptype1 = part_type_create();
//part_type_size(_ptype1, 1, 1, 0, 0);
//part_type_scale(_ptype1, 0.5, 0.5);
//part_type_speed(_ptype1, 1, 1, 0, 0);
//part_type_direction(_ptype1, 90, 90, 0, 0);
//part_type_gravity(_ptype1, 0, 270);
//part_type_orientation(_ptype1, 0, 0, 0, 0, false);
//part_type_colour3(_ptype1, $FFFFFF, $FFFFFF, $FFFFFF);
//part_type_alpha3(_ptype1, 0, 1, 0);
//part_type_blend(_ptype1, false);
//part_type_life(_ptype1, 80, 80);

//global._pemit1 = part_emitter_create(global._ps);
//part_emitter_region(global._ps, global._pemit1, 13.961335, 18.038666, -1.9005585, 1.9005585, ps_shape_rectangle, ps_distr_linear);
//part_emitter_stream(global._ps, global._pemit1, _ptype1, 1);
//part_emitter_interval(global._ps, global._pemit1, 0.75, 0.75, time_source_units_seconds);
//part_emitter_enable(global._ps,global._pemit1,false)

//setAlarmInSeconds(3,5)

enum needChangeDirection {
	NOT_CHANGING,
	INCREASING_LOW,
	INCREASING,
	DECREASING_LOW,
	DECREASING
}

//pet needs struct (globally accessible)
global.pet_needs = {
	health:		{ value: 90, x: 178, y: 46, change_direction: needChangeDirection.NOT_CHANGING },
	hunger:		{ value: 93, x: 178, y: 106, change_direction: needChangeDirection.NOT_CHANGING },
	energy:		{ value: 24, x: 312, y: 46, change_direction: needChangeDirection.NOT_CHANGING },
	hygiene:	{ value: 91, x: 312, y: 106, change_direction: needChangeDirection.NOT_CHANGING },
	bladder:	{ value: 91, x: 446, y: 46, change_direction: needChangeDirection.NOT_CHANGING },
	mood:		{ value: 88, x: 446, y: 106, change_direction: needChangeDirection.NOT_CHANGING },
}

global.needs_critical = false
global.needs_can_be_drained = true
global.needs_are_changing = false

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

_item = new TieredItem("Dog food", 5, obj_dog_food, spr_dogfood_tiers, obj_dog.layer, tier.CHEAP) 
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