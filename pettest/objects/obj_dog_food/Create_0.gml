//_tier = _tier ?? tier.GOOD

sprite_index = spr_dogfood_tiers

image_speed = 0

show_debug_message(string("{0} | {1} | {2} | {3} | {4} | {5}",
	name, need_effect, obj_index, spr_index, room_layer, item_tier))

item_details = new TieredItem(name, need_effect, obj_index, spr_index, room_layer, item_tier) 