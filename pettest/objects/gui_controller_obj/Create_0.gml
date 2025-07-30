//need bar height in px
_need_bar_height_px = 20
_need_bar_shading_px = _need_bar_height_px / 2

//colours
_colours = {
	text: make_color_rgb(70,70,119),
	empty: {
		main_colour: make_color_rgb(238,230,234) //grey
	},
	low: {
		main_colour: make_color_rgb(226,114,133), //red
		shade_colour: make_color_rgb(246,162,168) //light red
	},
	medium: {
		main_colour: make_color_rgb(138, 161, 246), //blue
		shade_colour: make_color_rgb(184,212,253) //lightblue
	},
	high: {
		main_colour: make_color_rgb(89,207,147), //green
		shade_colour: make_color_rgb(181, 231, 203) //lightgreen
	}
}