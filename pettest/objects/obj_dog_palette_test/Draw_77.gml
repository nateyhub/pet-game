/// @description
pal_swap_set(spr_dog_pal, global.current_pal, false);
draw_surface_stretched(application_surface, 0, 0, room_width, room_height);
pal_swap_reset();