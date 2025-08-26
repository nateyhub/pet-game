#macro UNSELECTED 0
#macro SELECTED 1

enum bar_outline {
	NORMAL = 0,
	INCREASING = 1,
	DECREASING = 2
}

_x = 24
_y = 284

_slide_y_offset = 200

window_set_cursor(cr_none)
cursor_sprite = spr_cursor

//need bar height in px
_need_bar_height_px = 20
_need_bar_shading_px = _need_bar_height_px / 2

//colours
_colours = {
	text: make_color_rgb(70,70,119),
	background: {
		main_colour: make_color_rgb(238,230,234) //grey
	},
	very_low: {
		main_colour: make_color_rgb(226,114,133), //red
		shade_colour: make_color_rgb(246,162,168) //light red
	},
	low: {
		main_colour: make_color_rgb(232,138,54), //yellow
		shade_colour: make_color_rgb(252,165,112) //light yellow
	},
	medium: {
		main_colour: make_color_rgb(138, 161, 246), //blue
		shade_colour: make_color_rgb(184,212,253) //lightblue
	},
	high: {
		main_colour: make_color_rgb(89,207,147), //green
		shade_colour: make_color_rgb(181, 231, 203) //lightgreen
	},
	ultimate: {
		main_colour: make_color_rgb(156,139,219), //purple
		shade_colour: make_color_rgb(206,170,237)
	}
}

_current_main_colour = _colours.ultimate.main_colour
_current_shade_colour = _colours.ultimate.shade_colour