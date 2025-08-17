if(keyboard_check_pressed(vk_add)) global.zoom_level = min(global.zoom_level + 1, 10)
if(keyboard_check_pressed(vk_subtract)) global.zoom_level = max(global.zoom_level - 1, 1)