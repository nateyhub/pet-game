/// @description
pal_swap_set(spr_dog_pal, current_pal, false);
//stretch the surface to the width and height of the display/window
draw_surface_stretched(application_surface, 0, 0, window_get_width(), window_get_height());
pal_swap_reset();